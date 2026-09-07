#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary, body-header-size,
)

// Шапка накопительной выписки LD-2.39 v4 (DOCX-выверено):
//   1. Основной заголовок "Historial de movimientos" — жирный 20pt,
//      #0F0F0F, без плашки-фона.
//   2. Подстрока — 12pt #3A4150, без плашки.
//   3. Баннер "Crédito al consumo en modalidad REVOLVING" — 13pt bold
//      #5B3FA8 на #CFBDFA (использует sectionTitle helper).
//   4. Таблица идентификации: TITULAR / Nº CLIENTE / CONTRATO Nº —
//      ячейки #FBFCFE с верхней/нижней границами #E6EAF0.
//      Метки колонок — 8pt bold caps #6B7280 с трекингом 1.2pt.
//      Значения — 13pt bold #0F0F0F.
#let cabecera(vars) = [
    #v(0.2em)
    #text(fill: color-body, weight: "bold", size: body-header-size)[
        Historial de movimientos
    ]

    #v(0.3em)
    #text(fill: color-secondary, size: 12pt)[
        Historial de movimientos desde #vars.INITIAL_DATE (apertura del contrato) hasta #vars.ISSUE_DATE (fecha de emisión del extracto)
    ]

    #v(0.8em)

    #sectionTitle[Crédito al consumo en modalidad REVOLVING]

    #v(0.4em)

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        inset: 0pt,
        // Row 1: column labels
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: none),
        )[
            #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[TITULAR]
        ],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: none),
        )[
            #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[Nº CLIENTE]
        ],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: 0.5pt + color-border, bottom: none),
        )[
            #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[CONTRATO Nº]
        ],
        // Row 2: values
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: none, bottom: 0.5pt + color-border),
        )[
            #text(fill: color-body, weight: "bold", size: 13pt)[#vars.BORROWER_FULL_NAME]
        ],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: none, bottom: 0.5pt + color-border),
        )[
            #text(fill: color-body, weight: "bold", size: 13pt)[#vars.CLIENT_NUMBER]
        ],
        table.cell(
            fill: color-cell-bg,
            inset: (x: 10pt, y: 8pt),
            stroke: (top: none, bottom: 0.5pt + color-border),
        )[
            #text(fill: color-body, weight: "bold", size: 13pt)[#vars.CREDIT_NUMBER]
        ],
    )
]