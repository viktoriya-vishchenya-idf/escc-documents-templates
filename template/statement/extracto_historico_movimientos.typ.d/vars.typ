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

#let fmt-eur(v) = {
    if v == none {
        none
    } else if type(v) == str {
        v.replace(".", ",") + " €"
    } else if type(v) == int {
        str(v) + " €"
    } else if type(v) == float {
        str(v).replace(".", ",") + " €"
    } else {
        str(v) + " €"
    }
}

#let fmt-pct(v) = if v == none { none } else { fmt-num(v) + " %" }

#let MONTHS_ES = (
    "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre",
)

#let fmt-date(value, pad: false) = {
    if value == none or str(value).match(regex("^\d{4}-\d{2}-\d{2}$")) == none {
        none
    } else {
        let parts = str(value).split("-")
        let month = int(parts.at(1))
        if month < 1 or month > 12 {
            none
        } else {
            let dayNumber = int(parts.at(2))
            let day = if pad and dayNumber < 10 { "0" + str(dayNumber) } else { str(dayNumber) }
            day + " de " + MONTHS_ES.at(month - 1) + " de " + parts.at(0)
        }
    }
}


#let TRX_MONTHS_ES = (
    "enero.": "ene", "feb.": "feb", "marzo": "mar", "abr.": "abr",
    "mayo": "may", "jun.": "jun", "jul.": "jul", "agosto": "ago",
    "sept.": "sept", "oct.": "oct", "nov.": "nov", "dic.": "dic",
)

#let fmt-trx-date(value) = {
    if value == none {
        none
    } else {
        let parts = str(value).split("-")
        if parts.len() >= 2 {
            parts.at(0) + " " + TRX_MONTHS_ES.at(parts.at(1), default: parts.at(1))
        } else {
            str(value)
        }
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
            let fb = float(str(finalBalanceStr).replace(",", "."))
            let lim = if type(creditLimit) == str {
                float(creditLimit.replace(",", "."))
            } else {
                float(creditLimit)
            }
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
        TOTAL_DEBITS:   fmt-eur(get(ss, "totalDebits")),
        TOTAL_CREDITS:  fmt-eur(get(ss, "totalCredits")),
        TAE_INTEREST:   fmt-pct(get(ss, "taeInterest")),
        INTEREST:       fmt-eur(get(ss, "interest")),
        PENALTY:        fmt-eur(get(ss, "penalty")),
        FINAL_BALANCE:  fmt-eur(finalBalanceStr),

        TRANSACTIONS: get(cs, "transactions", default: ())
            .map(t => t + (date: fmt-trx-date(t.at("date", default: none)))),
        CA_TOTAL_DEBITS:   fmt-eur(get(cs, "totalDebits")),
        CA_TOTAL_CREDITS:  fmt-eur(get(cs, "totalCredits")),
    )
}
