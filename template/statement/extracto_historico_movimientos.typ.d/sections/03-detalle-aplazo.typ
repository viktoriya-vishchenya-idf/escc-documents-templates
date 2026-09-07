#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-border,
)

// LD-3.11: DEBIT → OPERACIONES, CREDIT → ABONOS. Формат суммы:
// "XX,XX €" (Jackson шлёт числами или строками "-500.00").
#let fmt-amount(v) = {
    if v == none { "" }
    else if type(v) == float or type(v) == int {
        str(v).replace(".", ",") + " €"
    } else {
        str(v).replace(".", ",") + " €"
    }
}

#let detalle-aplazo(vars) = [
    #sectionTitle[DETALLE HISTÓRICO DE MOVIMIENTOS]
    #v(0.3em)

    #table(
        columns: (18%, 52%, 15%, 15%),
        align: (left, left, right, right),
        stroke: 0.5pt + color-border,
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
        ..vars.TRANSACTIONS.map(t => (
            [#t.date],
            [#t.description],
            [#fmt-amount(t.at("outcome", default: none))],
            [#fmt-amount(t.at("income",  default: none))],
        )).flatten(),
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
