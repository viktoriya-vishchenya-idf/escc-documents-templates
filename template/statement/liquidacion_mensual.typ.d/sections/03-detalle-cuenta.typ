#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-bg, color-border,
)

// Классификация типов транзакций LD-3.3:
//   DEBIT  (outcome) → "OPERACIONES"
//   CREDIT (income)  → "ABONOS"
// Тип операции печатается как есть из description; type остаётся
// техническим (REGULAR / COMMISSION / INTEREST / INCOME / PENALTY /
// IDF_COMMISSION) и в PDF не показывается — в шаблоне PROD варианта
// маппинг человекочитаемых названий делается на бэкенде через
// description.

// Форматирование суммы: если outcome != null — печатаем как "-XX,XX €"
// (уже в отрицательной форме на бэке); если income — "XX,XX €".
#let fmt-amount(v) = {
    if v == none { "" }
    else if type(v) == float or type(v) == int {
        let s = str(v).replace(".", ",")
        s + " €"
    } else {
        str(v).replace(".", ",") + " €"
    }
}

#let detalle-cuenta(vars) = [
    #sectionTitle[Detalle de cuenta]
    #v(0.3em)

    #table(
        columns: (14%, 56%, 15%, 15%),
        align: (left, left, right, right),
        stroke: 0.5pt + color-border,
        // шапка
        table.header(
            table.cell(fill: color-title-bg)[
                #text(fill: color-title, weight: "bold", size: 10pt)[Fecha]
            ],
            table.cell(fill: color-title-bg)[
                #text(fill: color-title, weight: "bold", size: 10pt)[Concepto]
            ],
            table.cell(fill: color-title-bg)[
                #text(fill: color-title, weight: "bold", size: 10pt)[Operaciones]
            ],
            table.cell(fill: color-title-bg)[
                #text(fill: color-title, weight: "bold", size: 10pt)[Abonos]
            ],
        ),
        // тело
        ..vars.TRANSACTIONS.map(t => (
            [#t.date],
            [#t.description],
            [#fmt-amount(t.at("outcome", default: none))],
            [#fmt-amount(t.at("income",  default: none))],
        )).flatten(),
        // итоги
        table.cell(fill: color-section-bg, colspan: 2)[
            #text(weight: "bold")[Total]
        ],
        table.cell(fill: color-section-bg, align: right)[
            #text(weight: "bold")[#vars.CA_TOTAL_DEBITS]
        ],
        table.cell(fill: color-section-bg, align: right)[
            #text(weight: "bold")[#vars.CA_TOTAL_CREDITS]
        ],
    )
]
