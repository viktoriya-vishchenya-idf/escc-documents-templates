#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-cell-bg, color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 3 — DETALLE HISTÓRICO DE MOVIMIENTOS (LD-2.39 v4, DOCX-выверено).
// Заголовки колонок: 8pt bold caps grey (tracking 1pt).
// Ячейки на #FBFCFE с границами top+bottom #E6EAF0.
// Итоговая строка "Total" — светло-серый фон, жирный текст.

// LD-3.11: DEBIT → OPERACIONES, CREDIT → ABONOS. Формат суммы "XX,XX €".
#let fmt-amount(v) = {
    if v == none { "" }
    else if type(v) == float or type(v) == int {
        str(v).replace(".", ",") + " €"
    } else {
        str(v).replace(".", ",") + " €"
    }
}

#let detalle-aplazo(vars) = [
    #numbered-section-title("3", "DETALLE HISTÓRICO DE MOVIMIENTOS")
    #v(0.4em)

    #let hdr-cell(body) = table.cell(
        fill: color-cell-bg,
        inset: (x: 10pt, y: 8pt),
        stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[#upper(body)]
    ]

    #let body-cell(body, align-right: false) = table.cell(
        inset: (x: 10pt, y: 6pt),
        stroke: (bottom: 0.5pt + color-border),
        align: if align-right { right + horizon } else { left + horizon },
    )[#body]

    #table(
        columns: (14%, 56%, 15%, 15%),
        stroke: none,
        inset: 0pt,
        table.header(
            hdr-cell("Fecha"),
            hdr-cell("Concepto"),
            table.cell(
                fill: color-cell-bg,
                inset: (x: 10pt, y: 8pt),
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
                align: right + horizon,
            )[#text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[OPERACIONES]],
            table.cell(
                fill: color-cell-bg,
                inset: (x: 10pt, y: 8pt),
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
                align: right + horizon,
            )[#text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[ABONOS]],
        ),
        ..vars.TRANSACTIONS.map(t => (
            body-cell([#t.date]),
            body-cell([#t.description]),
            body-cell([#fmt-amount(t.at("outcome", default: none))], align-right: true),
            body-cell([#fmt-amount(t.at("income",  default: none))], align-right: true),
        )).flatten(),
        // Итоговая строка Total
        table.cell(
            fill: color-cell-bg,
            colspan: 2,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
        )[#text(weight: "bold", size: 11pt)[Total]],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            align: right + horizon,
        )[#text(weight: "bold", size: 11pt)[#vars.CA_TOTAL_DEBITS]],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            align: right + horizon,
        )[#text(weight: "bold", size: 11pt)[#vars.CA_TOTAL_CREDITS]],
    )
]
