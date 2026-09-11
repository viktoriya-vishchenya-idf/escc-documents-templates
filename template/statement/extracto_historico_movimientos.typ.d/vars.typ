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
    let ci = get(vars, "companyInfo",      default: (:))

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

        INITIAL_DATE: get(ss, "initialDate"),
        ISSUE_DATE:   get(ss, "issueDate"),

        BORROWER_FULL_NAME: get(ss, "borrowerFullName"),
        REPAYMENT_DATE:     get(ss, "repaymentDate"),
        PAYMENT_AMOUNT:     fmt-eur(get(ss, "paymentAmount")),

        INITIAL_BALANCE: fmt-eur(get(ss, "initialBalance")),
        TOTAL_DEBITS:   fmt-eur(get(ss, "totalDebits")),
        TOTAL_CREDITS:  fmt-eur(get(ss, "totalCredits")),
        TIN_INTEREST:   fmt-pct(get(ss, "tinInterest")),
        TAE_INTEREST:   fmt-pct(get(ss, "taeInterest")),
        INTEREST:       fmt-eur(get(ss, "interest")),
        PENALTY:        fmt-eur(get(ss, "penalty")),
        FINAL_BALANCE:  fmt-eur(finalBalanceStr),

        TRANSACTIONS:      get(cs, "transactions", default: ()),
        CA_TOTAL_DEBITS:   fmt-eur(get(cs, "totalDebits")),
        CA_TOTAL_CREDITS:  fmt-eur(get(cs, "totalCredits")),

        COMPANY_NAME:    get(ci, "name"),
        COMPANY_ADDRESS: get(ci, "address"),
        COMPANY_CIF:     get(ci, "cif"),
    )
}
