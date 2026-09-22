#let fmt-num(v) = {
    if v == none {
        none
    } else if type(v) == int {
        str(v)
    } else if type(v) == float {
        if calc.fract(v) == 0 {
            str(int(v))
        } else {
            str(v).replace(".", ",")
        }
    } else {
        str(v)
    }
}

#let fmt-amount-2dp(value) = {
    if value == none {
        none
    } else {
        let raw = if type(value) == str { value.trim() } else { str(value) }
        let text = raw.replace("\u{2212}", "-").replace(",", ".")
        if text.match(regex("^-?\d+(\.\d+)?$")) == none {
            text
        } else {
            let signed = str(calc.round(decimal(text), digits: 2))
            let rounded = signed.replace("\u{2212}", "-")
            let negative = rounded.starts-with("-")
            let digits = if negative { rounded.slice(1) } else { rounded }
            let parts = digits.split(".")
            let cents = if parts.len() > 1 { parts.at(1) } else { "" }
            let padding = "00".slice(0, calc.max(0, 2 - cents.len()))
            let amount = parts.at(0) + "." + cents + padding
            if negative { "-" + amount } else { amount }
        }
    }
}

#let fmt-eur(v) = {
    let amount = fmt-amount-2dp(v)
    if amount == none {
        none
    } else {
        amount.replace(".", ",") + " €"
    }
}

#let fmt-eur-abs(v) = {
    if v == none {
        none
    } else if type(v) == str {
        fmt-eur(v.trim().trim("-", at: start))
    } else if type(v) == int or type(v) == float {
        fmt-eur(calc.abs(v))
    } else {
        fmt-eur(v)
    }
}

#let fmt-eur-neg(v) = {
    let magnitude = fmt-eur-abs(v)
    if magnitude == none {
        none
    } else {
        let n = if type(v) == str { float(v.replace(",", ".")) } else { float(v) }
        if n == 0 { magnitude } else { "-" + magnitude }
    }
}

#let fmt-pct(v) = if v == none { none } else { fmt-num(v) + " %" }

#let MONTHS_ES = (
    "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre",
)
#let MONTHS_ES_SHORT = (
    "ene", "feb", "mar", "abr", "may", "jun",
    "jul", "ago", "sept", "oct", "nov", "dic",
)

#let parse-date(value) = {
    let empty = (day: none, month: none, year: none)
    if value == none or str(value).match(regex("^\d{4}-\d{2}-\d{2}$")) == none {
        empty
    } else {
        let parts = str(value).split("-")
        let month = int(parts.at(1))
        if month < 1 or month > 12 {
            empty
        } else {
            (day: int(parts.at(2)), month: month, year: int(parts.at(0)))
        }
    }
}

#let fmt-date(value, pad: false) = {
    let date = parse-date(value)
    if date.day == none {
        none
    } else {
        let day = if pad and date.day < 10 { "0" + str(date.day) } else { str(date.day) }
        day + " de " + MONTHS_ES.at(date.month - 1) + " de " + str(date.year)
    }
}

#let fmt-trx-date(value) = {
    let date = parse-date(value)
    if date.day == none {
        none
    } else {
        str(date.day) + " " + MONTHS_ES_SHORT.at(date.month - 1)
    }
}

#let normalize(vars) = {
    let get = (dict, key, default: none) => {
        if type(dict) == dictionary and key in dict and dict.at(key) != none {
            dict.at(key)
        } else {
            default
        }
    }

    let ss = get(vars, "statementSummary", default: (:))
    let cs = get(vars, "cStatement",       default: (:))

    let creditLimit = get(vars, "creditLimit")
    let finalBalanceStr = get(ss, "finalBalance")
    let availableLimit = {
        if creditLimit == none or finalBalanceStr == none {
            none
        } else {
            let fb = decimal(str(finalBalanceStr).replace(",", "."))
            let lim = decimal(str(creditLimit).replace(",", "."))
            lim - fb
        }
    }

    (
        CLIENT_NUMBER:  fmt-num(get(vars, "borrowerId")),
        CREDIT_NUMBER:  fmt-num(get(vars, "creditId")),
        CREDIT_LIMIT:   fmt-eur(creditLimit),
        AVAILABLE_LIMIT: fmt-eur(availableLimit),

        INITIAL_DATE: fmt-date(get(ss, "initialDate"), pad: true),
        ISSUE_DATE:   fmt-date(get(ss, "issueDate"), pad: true),

        BORROWER_FULL_NAME: get(ss, "borrowerFullName"),
        REPAYMENT_DATE:     get(ss, "repaymentDate"),
        PAYMENT_AMOUNT:     fmt-eur(get(ss, "paymentAmount")),

        INITIAL_BALANCE: fmt-eur(get(ss, "initialBalance")),
        TOTAL_DEBITS:   fmt-eur-abs(get(ss, "totalDebits")),
        TOTAL_CREDITS:  fmt-eur-neg(get(ss, "totalCredits")),
        TAE_INTEREST:   fmt-pct(get(ss, "taeInterest")),
        INTEREST:       fmt-eur-abs(get(ss, "interest")),
        PENALTY:        fmt-eur-abs(get(ss, "penalty")),
        FINAL_BALANCE:  fmt-eur(finalBalanceStr),

        TRANSACTIONS: get(cs, "transactions", default: ())
            .map(t => t + (date: fmt-trx-date(t.at("date", default: none)))),
        CA_TOTAL_DEBITS:   fmt-eur(get(cs, "totalDebits")),
        CA_TOTAL_CREDITS:  fmt-eur(get(cs, "totalCredits")),
    )
}
