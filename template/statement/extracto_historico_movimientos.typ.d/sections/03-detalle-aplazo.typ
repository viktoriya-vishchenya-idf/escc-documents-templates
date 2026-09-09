#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-grey-bg, color-cell-bg,
    color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 3 — DETALLE HISTÓRICO DE MOVIMIENTOS.
// TZ_ExtractoHistoricoMovimientosPLAZO §7:
//   Header row: fill #F1F5F9, Inter 8pt/700/#6B7280 uppercase, tracking 20 (=1pt).
//   Body rows: no fill (Inter 11pt default), horizontal borders #E6EAF0.
//   Total row: Inter 11.5pt/700 with fill #F1F5F9; first two columns merged.
//   Column split: 2400/4400/1699/1701 twips ≈ 23.53%/43.14%/16.66%/16.67%.
//
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

    #let hdr-cell(body, align-right: false) = table.cell(
        fill: color-grey-bg,
        inset: (x: 10pt, y: 8pt),
        stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
        align: if align-right { right + horizon } else { left + horizon },
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[#upper(body)]
    ]

    #let body-cell(body, align-right: false) = table.cell(
        inset: (x: 10pt, y: 6pt),
        stroke: (bottom: 0.5pt + color-border),
        align: if align-right { right + horizon } else { left + horizon },
    )[#body]

    #table(
        columns: (23.53%, 43.14%, 16.66%, 16.67%),
        stroke: none,
        inset: 0pt,
        table.header(
            hdr-cell("Fecha"),
            hdr-cell("Concepto"),
            hdr-cell("Operaciones", align-right: true),
            hdr-cell("Abonos",      align-right: true),
        ),
        ..vars.TRANSACTIONS.map(t => (
            body-cell([#t.date]),
            body-cell([#t.description]),
            body-cell([#fmt-amount(t.at("outcome", default: none))], align-right: true),
            body-cell([#fmt-amount(t.at("income",  default: none))], align-right: true),
        )).flatten(),
        // Total row — fill #F1F5F9, Inter 11.5pt/700, first two cols merged.
        table.cell(
            fill: color-grey-bg,
            colspan: 2,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
        )[#text(weight: "bold", size: 11.5pt)[Total]],
        table.cell(
            fill: color-grey-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            align: right + horizon,
        )[#text(weight: "bold", size: 11.5pt)[#vars.CA_TOTAL_DEBITS]],
        table.cell(
            fill: color-grey-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            align: right + horizon,
        )[#text(weight: "bold", size: 11.5pt)[#vars.CA_TOTAL_CREDITS]],
    )
]
