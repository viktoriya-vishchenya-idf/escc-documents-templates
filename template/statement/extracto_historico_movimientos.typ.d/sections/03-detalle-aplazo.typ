#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-grey-bg, color-cell-bg,
    color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

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
