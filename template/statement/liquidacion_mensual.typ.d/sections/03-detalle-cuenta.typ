#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-grey-bg, color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 3 — DETALLE DE MOVIMIENTOS DEL PERIODO (LD-2.16 v7, TZ §9/§10/§11).
// 4-х колоночная таблица: FECHA / CONCEPTO / OPERACIONES / ABONOS
// (TZ ширины: 2400 / 4400 / 1699 / 1701 twips ≈ 23.5% / 43.1% / 16.7% / 16.7%).
// Header — Inter 8pt/700/#6B7280 uppercase tracking 1pt, fill #F1F5F9.
// Body — inherit shape formatting: даты и concepto слева, суммы справа.
// Total (последняя строка) — Inter 11.5pt/700, fill #F1F5F9 (TZ §10 "Total row").
// Только горизонтальные линии #E6EAF0 (TZ §10, §19).

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
    #numbered-section-title("3", "Detalle de movimientos del periodo")
    #v(0.3em)

    #let head-cell(label, align-right: false) = table.cell(
        fill: color-grey-bg,
        inset: (x: 10pt, y: 8pt),
        align: if align-right { right + horizon } else { left + horizon },
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[
            #upper(label)
        ]
    ]

    #let body-cell(body, align-right: false) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: if align-right { right + horizon } else { left + horizon },
    )[#text(fill: color-body, size: 11pt)[#body]]

    // Строка Total: fill #F1F5F9, Inter 11.5/700.
    #let total-cell(body, align-right: false, colspan: 1) = table.cell(
        fill: color-grey-bg,
        inset: (x: 10pt, y: 8pt),
        align: if align-right { right + horizon } else { left + horizon },
        colspan: colspan,
    )[#text(fill: color-body, weight: "bold", size: 11.5pt)[#body]]

    #table(
        columns: (23.5%, 43.1%, 16.7%, 16.7%),
        // только горизонтальные линии
        stroke: (x, y) => (
            top:    if y == 0 { none } else { 0.5pt + color-border },
            bottom: none,
            left: none, right: none,
        ),
        inset: 0pt,
        table.header(
            head-cell("FECHA"),
            head-cell("CONCEPTO"),
            head-cell("OPERACIONES", align-right: true),
            head-cell("ABONOS", align-right: true),
        ),
        ..vars.TRANSACTIONS.map(t => (
            body-cell([#t.date]),
            body-cell([#t.description]),
            body-cell(fmt-amount(t.at("outcome", default: none)), align-right: true),
            body-cell(fmt-amount(t.at("income",  default: none)), align-right: true),
        )).flatten(),
        // Total row
        total-cell("Total", colspan: 2),
        total-cell(vars.CA_TOTAL_DEBITS, align-right: true),
        total-cell(vars.CA_TOTAL_CREDITS, align-right: true),
    )
]
