// Все переменные ЭТОГО документа в одном месте.
// normalize() принимает сырой словарь запроса doc generator-а и
// возвращает нормализованный: отсутствующие ключи — none (или default),
// числа — в испанском формате. В body обращение: #vars.TIN, #vars.TAE...
//
// Оригинал запроса (лишние ключи ownerId/templateName/... игнорируются):
// {
//     "creditAmount": 1000.00,
//     "productSettings": {
//         "tinPercent": 21.93,
//         "taePercent": 24.45,
//         "repaymentDateDay": 23,
//         "dueDateDay": 3,
//         "delinquencyDateDay": 4
//     },
//     "experiments": ["SPLIT_DELINQUENCY_FEE_42660_B"]
// }

// число → испанский формат: 21.93 → "21,93"; 1000.0 → "1000"
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

#let normalize(vars) = {
    let get = (dict, key, default: none) => {
        if (key in dict) { dict.at(key) } else { default }
    }

    let ps = get(vars, "productSettings", default: (:))

    (
        CREDIT_AMOUNT: fmt-num(get(vars, "creditAmount")),
        TIN: fmt-num(get(ps, "tinPercent")),
        TAE: fmt-num(get(ps, "taePercent")),
        // DD — день ликвидации в тексте про recobro (стр. «el día …»)
        DD: fmt-num(get(ps, "delinquencyDateDay")),
        PARTNER_DATA: get(vars, "partnerData"),
        // Список активных ABT-экспериментов заёмщика. Ключа может не
        // быть вовсе, поэтому default — пустой массив: тогда любая
        // проверка «X in vars.EXPERIMENTS» просто ложна.
        EXPERIMENTS: get(vars, "experiments", default: ()),
    )
}
