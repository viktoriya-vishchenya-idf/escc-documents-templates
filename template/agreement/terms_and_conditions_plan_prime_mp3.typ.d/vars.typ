// Все переменные ЭТОГО документа в одном месте.
// normalize() принимает сырой словарь запроса doc generator-а и
// возвращает нормализованный: отсутствующие ключи — none (или default),
// числа — в испанском формате. В body обращение: #vars.TIN, #vars.TAE...
//
// Оригинал запроса (лишние ключи ownerId/templateName/... игнорируются):
// {
//     "creditAmount": 1000.00,
//     "agreementDate": "01/01/2026",
//     "borrower": {
//         "names": {
//             "firstName": "Juan",
//             "firstLastName": "García",
//             "secondLastName": "López"
//         },
//         "dni": "12345678Z",
//         "email": "juan@example.com",
//         "phone": "600000000",
//         "address": {
//             "city": "Barcelona",
//             "street": "Calle Tuset",
//             "houseNumber": "5",
//             "apartment": "3",
//             "zipCode": "08006"
//         }
//     },
//     "productSettings": {
//         "tinPercent": 21.93,
//         "taePercent": 24.45,
//         "repaymentDateDay": 23,
//         "dueDateDay": 3,
//         "delinquencyDateDay": 4
//     },
//     "experiments": ["SPLIT_DELINQUENCY_FEE_42660_B"]
// }

// Эксперимент ABT-1.48: комиссия за неуплату разбита на ступени по дням
// просрочки вместо единого платежа 30 € за должника. Проверяется как
// «SPLIT_DELINQUENCY_FEE in vars.EXPERIMENTS» в секциях 00 и 10.
#let SPLIT_DELINQUENCY_FEE = "SPLIT_DELINQUENCY_FEE_42660_B"

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
        if type(dict) == dictionary and key in dict {
            dict.at(key)
        } else {
            default
        }
    }

    let ps = get(vars, "productSettings", default: (:))
    let borrower = get(vars, "borrower", default: (:))
    let names = get(borrower, "names", default: (:))
    let address = get(borrower, "address", default: (:))

    (
        CREDIT_AMOUNT: fmt-num(get(vars, "creditAmount")),
        AGREEMENT_DATE: get(vars, "agreementDate"),
        TIN: fmt-num(get(ps, "tinPercent")),
        TAE: fmt-num(get(ps, "taePercent")),
        // день выставления счёта и крайний срок оплаты (пункт 8.6)
        REPAYMENT_DAY: fmt-num(get(ps, "repaymentDateDay")),
        DUE_DAY: fmt-num(get(ps, "dueDateDay")),
        // DD — день ликвидации в тексте про recobro
        DD: fmt-num(get(ps, "delinquencyDateDay")),
        BORROWER_FIRST_NAME: get(names, "firstName"),
        BORROWER_FIRST_LAST_NAME: get(names, "firstLastName"),
        BORROWER_SECOND_LAST_NAME: get(names, "secondLastName"),
        BORROWER_DNI: get(borrower, "dni"),
        BORROWER_EMAIL: get(borrower, "email"),
        BORROWER_PHONE: get(borrower, "phone"),
        ADDRESS_CITY: get(address, "city"),
        ADDRESS_STREET: get(address, "street"),
        ADDRESS_HOUSE_NUMBER: fmt-num(get(address, "houseNumber")),
        ADDRESS_APARTMENT: fmt-num(get(address, "apartment")),
        ADDRESS_ZIP_CODE: get(address, "zipCode"),
        PARTNER_DATA: get(vars, "partnerData"),
        // Список активных ABT-экспериментов заёмщика. Ключа может не
        // быть вовсе, поэтому default — пустой массив: тогда любая
        // проверка «X in vars.EXPERIMENTS» просто ложна.
        EXPERIMENTS: get(vars, "experiments", default: ()),
    )
}
