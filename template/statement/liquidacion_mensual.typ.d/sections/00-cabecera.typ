#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg,
    color-grey-title, color-grey-bg, body-header-size,
)

// Шапка выписки LD-2.16 v7:
//   1. Фиолетовая плашка "Liquidación Mensual: <мес> <год>" + подстрока
//      "Período de liquidación <нач> - <кон>" (в LD-таблице обе строки
//      объединены в одну «шапку»).
//   2. Таблица идентификации клиента с заголовком-баннером
//      "Crédito al consumo en modalidad REVOLVING" и колонками
//      TITULAR / Nº CLIENTE / CONTRATO Nº.
#let cabecera(vars) = [
    #block(
        fill: color-title-bg,
        inset: (x: 12pt, y: 10pt),
        radius: 4pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold", size: body-header-size)[
            Liquidación Mensual: #vars.MONTH #vars.YEAR
        ]

        #v(0.2em)
        #text(fill: color-title, size: 10pt)[
            Período de liquidación #vars.PERIOD_START - #vars.PERIOD_END
        ]
    ]

    #v(0.4em)

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        // Баннер-заголовок: тип продукта
        table.header(table.cell(colspan: 3, fill: color-section-bg)[
            #text(weight: "bold")[Crédito al consumo en modalidad REVOLVING]
        ]),
        // Строка меток колонок
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[TITULAR]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[Nº CLIENTE]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[CONTRATO Nº]
        ],
        // Строка данных
        [#text(weight: "bold")[#vars.BORROWER_FULL_NAME]],
        [#text(weight: "bold")[#vars.CLIENT_NUMBER]],
        [#text(weight: "bold")[#vars.CREDIT_NUMBER]],
    )
]
