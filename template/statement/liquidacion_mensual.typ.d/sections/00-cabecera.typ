#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary, body-header-size,
)

// Шапка месячной выписки — TZ_LiquidacionMensualPlazo §2/§3
// + сверка по эталонному LiquidacionMensualPlazo.docx:
//   0. Логотип "plazo" — 53.4×23.1 mm PNG, инлайн (не в page.header),
//      чтобы отображаться только на первой странице.
//   1. Main title "Liquidación Mensual: <mes> <año>" — Inter 20pt/700/#0F0F0F.
//   2. Period subtitle "Período de liquidación <нач> - <кон>" —
//      Inter 12pt/400/#3A4150.
//   3. Credit bar "Crédito al consumo en modalidad REVOLVING" —
//      Inter 13pt/700/#5B3FA8 on fill #CFBDFA (через sectionTitle helper).
//   4. Client card table — 3 колонки × 1 строка, в каждой ячейке метка
//      сверху + значение снизу. Колонки: TITULAR / Nº CLIENTE / CONTRATO Nº.
//      Метки — Inter 8pt/700/#6B7280 uppercase tracking 1.2pt, значения —
//      Inter 13pt/700/#6B7280. Ячейки #FBFCFE с верхней+нижней границами
//      #E6EAF0 (TZ §3, TZ §19 "omit vertical borders"). Строка TIN:/TAE:
//      отсутствует в реальном шаблоне (сверено с
//      LiquidacionMensualPlazo.docx 2026-09-10; фигурирует только в
//      TZ §3, но не в исходном DOCX и не выводится в PDF).
#let cabecera(vars) = [
    #image("../common/logo_plazo.png", width: 5.34cm)
    #v(0.6cm)

    #text(fill: color-body, weight: "bold", size: body-header-size)[
        Liquidación Mensual: #vars.MONTH #vars.YEAR
    ]

    #v(0.3em)
    #text(fill: color-secondary, size: 12pt)[
        Período de liquidación #vars.PERIOD_START - #vars.PERIOD_END
    ]

    #v(0.8em)

    #sectionTitle[Crédito al consumo en modalidad REVOLVING]

    #v(0.4em)

    // helper: ячейка "метка (8pt caps grey tracking 1.2pt) + значение
    // (13pt bold grey #6B7280)" со стрелой границы, задаваемой снаружи.
    // Все лейблы проходят через upper() — двоеточия и цифры сохраняются
    // (upper("TIN:")="TIN:", upper("TAE:")="TAE:") — гарантирует единый
    // стиль TIN и TAE.
    #let card-cell(label, value, stroke: none) = table.cell(
        fill: color-cell-bg,
        inset: (x: 10pt, y: 8pt),
        stroke: stroke,
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[
            #upper(label)
        ]

        #v(0.4em)
        #text(fill: color-grey-title, weight: "bold", size: 13pt)[#value]
    ]

    // Рамка карточки: тонкая линия #E6EAF0 сверху и снизу; вертикали не
    // рисуются между колонками.
    #let stroke-both = (
        top: 0.5pt + color-border,
        bottom: 0.5pt + color-border,
    )

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        inset: 0pt,
        card-cell("TITULAR",     vars.BORROWER_FULL_NAME, stroke: stroke-both),
        card-cell("Nº CLIENTE",  vars.CLIENT_NUMBER,      stroke: stroke-both),
        card-cell("CONTRATO Nº", vars.CREDIT_NUMBER,      stroke: stroke-both),
    )
]
