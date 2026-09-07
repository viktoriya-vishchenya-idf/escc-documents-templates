#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg,
    color-grey-title, color-grey-bg, body-header-size,
)

// Шапка накопительной выписки LD-2.39 v4:
//   1. Фиолетовая плашка "Historial de movimientos" + подстрока
//      "Historial de movimientos desde <нач> (apertura del contrato) hasta
//      <кон> (fecha de emisión del extracto)".
//   2. Таблица идентификации клиента с баннером
//      "Crédito al consumo en modalidad REVOLVING" (TITULAR / Nº CLIENTE
//      / CONTRATO Nº).
// Блок реквизитов компании (companyInfo) удалён — LD-3.11 CRDES-45111
// исключил его из шаблона.
#let cabecera(vars) = [
    #block(
        fill: color-title-bg,
        inset: (x: 12pt, y: 10pt),
        radius: 4pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold", size: body-header-size)[
            Historial de movimientos
        ]

        #v(0.2em)
        #text(fill: color-title, size: 10pt)[
            Historial de movimientos desde #vars.INITIAL_DATE (apertura del contrato) hasta #vars.ISSUE_DATE (fecha de emisión del extracto)
        ]
    ]

    #v(0.4em)

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        table.header(table.cell(colspan: 3, fill: color-section-bg)[
            #text(weight: "bold")[Crédito al consumo en modalidad REVOLVING]
        ]),
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[TITULAR]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[Nº CLIENTE]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[CONTRATO Nº]
        ],
        [#text(weight: "bold")[#vars.BORROWER_FULL_NAME]],
        [#text(weight: "bold")[#vars.CLIENT_NUMBER]],
        [#text(weight: "bold")[#vars.CREDIT_NUMBER]],
    )
]