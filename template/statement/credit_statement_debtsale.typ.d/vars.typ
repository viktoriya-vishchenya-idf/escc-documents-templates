// Все переменные накопительной выписки (LD-2.39 v4, LD-3.11).
// normalize() принимает сырой JSON DebtSaleSummaryStatementTemplate,
// возвращает плоский словарь; отсутствующие ключи — none, числа — в
// испанском формате. В body: #vars.CLIENT_NUMBER, #vars.FINAL_BALANCE...
//
// Значения в соседнем params.json взяты из колонки "Example" таблицы
// LD-3.11 на Confluence (borrowerId=220114, creditId=12541, periodo del
// extracto 01 abril 2021 — 05 abril 2024, суммы -500/200/23/30/432 €
// и т.д.) — фикстура ложится в шаблон 1-в-1 с документированным
// примером, чтобы preview.pdf было верифицируемо против LD.
//
// Оригинал запроса — DebtSaleSummaryStatementTemplate:
// {
//   "borrowerId": 220114,
//   "creditId": 12541,               // добавляется CRDES-45111
//   "creditLimit": 1500.00,          // добавляется CRDES-45111
//   "statementSummary": { ... same как в LD-3.3 },
//   "cStatement": {
//     "transactions": [ { "date":"10-jul.-2026", ... } ],
//     "totalDebits": "500.00",
//     "totalCredits": "200.00",
//     "isHeldSepa": false
//   },
//   "companyInfo": {
//     "name": "IDFINANCE PLAZO, S.L.U.",
//     "address": "C/ Tuset 5, 3 pl Barcelona",
//     "cif": "B-02.996.668"
//   }
// }

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

        // Диапазон "Periodo del extracto" — с даты открытия кредита
        // (initialDate) до даты выпуска документа (issueDate).
        INITIAL_DATE: get(ss, "initialDate"),
        ISSUE_DATE:   get(ss, "issueDate"),

        BORROWER_FULL_NAME: get(ss, "borrowerFullName"),
        REPAYMENT_DATE:     get(ss, "repaymentDate"),
        PAYMENT_AMOUNT:     fmt-eur(get(ss, "paymentAmount")),

        // Аккумулированные суммы (LD-3.11):
        //  totalDebits   → Disposiciones acumuladas
        //  totalCredits  → Pagos acumulados
        //  taeInterest   → Intereses devengados acumulados (%)
        //  interest      → интерес € (внутренняя строка резюме)
        //  penalty       → Comisiones acumuladas (если != 0)
        //  finalBalance  → Saldo dispuesto actual
        TOTAL_DEBITS:   fmt-eur(get(ss, "totalDebits")),
        TOTAL_CREDITS:  fmt-eur(get(ss, "totalCredits")),
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
