// Все переменные месячной выписки (LD-2.16 v7, вариантные ключи см.
// LD-3.3). normalize() принимает сырой JSON запроса doc generator-а и
// возвращает плоский словарь: отсутствующие ключи — none, числа — в
// испанском формате. В body обращение: #vars.CLIENT_NUMBER, ...
//
// Значения в соседнем params.json взяты из колонки "Example" таблицы
// LD-3.3 на Confluence (borrowerId=12541, creditId=41254, TAE=19,99%,
// суммы -500/200/23/30/432 € и т.д.) — фикстура ложится в шаблон 1-в-1
// с документированным примером, чтобы preview.pdf было верифицируемо
// против LD.
//
// Оригинал запроса — сериализация SummaryStatementTemplate из
// core-domain/document-generator-api:
// {
//   "borrowerId": 12541,             // после снятия @JsonIgnore
//   "creditId": 41254,               // добавляется CRDES-45111
//   "creditLimit": 1500.00,          // добавляется CRDES-45111
//   "statementSummary": {
//     "periodStartDate": "1 de julio de 2026",
//     "periodEndDate":   "31 de julio de 2026",
//     "initialDate":     "01 marzo 2026",
//     "issueDate":       "05 agosto 2026",
//     "borrowerFullName": "...",
//     "paymentMode": "Pago total",
//     "paymentAmount": 500.0,
//     "repaymentDate": "04 de agosto de 2026",
//     "initialBalance": 100.0,
//     "totalDebits": "-500.00",
//     "totalCredits": "200.00",
//     "taeInterest": 19.99,
//     "interest": "-23.00",
//     "penalty": "30.00",
//     "finalBalance": "432.00"
//   },
//   "cStatement": {
//     "transactions": [
//       {"date":"10-jul","description":"Compra X",
//        "income":null,"outcome":200.0,"type":"REGULAR"},
//       ...
//     ],
//     "totalDebits": "500.00",
//     "totalCredits": "200.00",
//     "isHeldSepa": false
//   }
// }

// число → строка в испанском формате: 21.93 → "21,93"; 1500.0 → "1500"
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

// сумма в EUR: "500,00 €". Принимает как число, так и строку из бэка
// (backend уже приводит к BigDecimal.toString() — тогда просто заменим
// точку на запятую и приклеим " €").
#let fmt-eur(v) = {
    if v == none {
        none
    } else if type(v) == str {
        v.replace(".", ",") + " €"
    } else if type(v) == int {
        str(v) + " €"
    } else if type(v) == float {
        // округляем до 2 знаков через str + regex было бы дороже — тут
        // достаточно заменить "." на "," (Jackson шлёт 500.0 / 500.25)
        let s = str(v).replace(".", ",")
        s + " €"
    } else {
        str(v) + " €"
    }
}

// TAE отображается как "19,99 %"
#let fmt-pct(v) = if v == none { none } else { fmt-num(v) + " %" }

// Месяц/год из строки "1 de julio de 2026" (backend уже отформатировал
// LocalDate по паттерну "d 'de' MMMM 'de' yyyy"). Возвращаем два поля
// отдельно, чтобы шаблон мог отобразить в разных местах: "Periodo:
// julio 2026" и т.п.
#let split-period(dateStr) = {
    if dateStr == none {
        (month: none, year: none)
    } else {
        // формат: "<D> de <mes> de <YYYY>"
        let parts = dateStr.split(" de ")
        if parts.len() >= 3 {
            (month: parts.at(1), year: parts.at(2))
        } else {
            (month: none, year: none)
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
    let cs = get(vars, "cStatement", default: (:))
    let period = split-period(get(ss, "periodStartDate"))

    // available limit считается на стороне шаблона: credit.limit -
    // finalBalance. finalBalance приходит строкой ("432.00"), парсим
    // через float; при ошибке — none, тогда просто не выводим строку.
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
        CLIENT_NUMBER: fmt-num(get(vars, "borrowerId")),
        CREDIT_NUMBER: fmt-num(get(vars, "creditId")),
        CREDIT_LIMIT:  fmt-eur(creditLimit),
        AVAILABLE_LIMIT: fmt-eur(availableLimit),

        MONTH: period.month,
        YEAR:  period.year,
        PERIOD_START: get(ss, "periodStartDate"),
        PERIOD_END:   get(ss, "periodEndDate"),

        BORROWER_FULL_NAME: get(ss, "borrowerFullName"),
        PAYMENT_AMOUNT:     fmt-eur(get(ss, "paymentAmount")),
        REPAYMENT_DATE:     get(ss, "repaymentDate"),

        INITIAL_BALANCE: fmt-eur(get(ss, "initialBalance")),
        TOTAL_DEBITS:    fmt-eur(get(ss, "totalDebits")),
        TOTAL_CREDITS:   fmt-eur(get(ss, "totalCredits")),
        TAE_INTEREST:    fmt-pct(get(ss, "taeInterest")),
        INTEREST:        fmt-eur(get(ss, "interest")),
        PENALTY:         fmt-eur(get(ss, "penalty")),
        FINAL_BALANCE:   fmt-eur(finalBalanceStr),

        TRANSACTIONS:      get(cs, "transactions", default: ()),
        CA_TOTAL_DEBITS:   fmt-eur(get(cs, "totalDebits")),
        CA_TOTAL_CREDITS:  fmt-eur(get(cs, "totalCredits")),
        IS_HELD_SEPA:      get(cs, "isHeldSepa", default: false),
    )
}
