#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg,
    color-grey-title, color-grey-bg, body-header-size,
)
#import "../common/table_styles.typ": kv-row

// Шапка выписки: заголовок "Liquidación Mensual — <месяц> <год>",
// фиолетовая плашка + два kv-блока (клиент и кредит).
#let cabecera(vars) = [
    #block(
        fill: color-title-bg,
        inset: (x: 12pt, y: 10pt),
        radius: 4pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold", size: body-header-size)[
            Liquidación Mensual — #vars.MONTH #vars.YEAR
        ]
    ]

    #v(0.4em)

    #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        // Datos del cliente
        table(
            columns: (40%, 60%),
            stroke: none,
            table.header(table.cell(colspan: 2, fill: color-section-bg)[
                #text(weight: "bold")[Datos del cliente]
            ]),
            ..kv-row("Titular",         vars.BORROWER_FULL_NAME),
            ..kv-row("Nº de cliente",   vars.CLIENT_NUMBER),
            ..kv-row("Fecha emisión",   vars.ISSUE_DATE),
        ),
        // Datos del crédito
        table(
            columns: (48%, 52%),
            stroke: none,
            table.header(table.cell(colspan: 2, fill: color-section-bg)[
                #text(weight: "bold")[Datos del crédito]
            ]),
            ..kv-row("Nº de crédito",    vars.CREDIT_NUMBER),
            ..kv-row("Límite del crédito", vars.CREDIT_LIMIT),
            ..kv-row("Límite disponible",  vars.AVAILABLE_LIMIT),
        ),
    )
]
