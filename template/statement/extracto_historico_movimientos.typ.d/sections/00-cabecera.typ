#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary, body-header-size,
)

// Шапка накопительной выписки — TZ_ExtractoHistoricoMovimientosPLAZO §2/§3
// + сверка по эталонному ExtractoHistoricoMovimientosPLAZO.docx:
//   0. Логотип "plazo" — 53.4×23.1 mm PNG, инлайн (не в page.header),
//      чтобы отображаться только на первой странице.
//   1. Main title "Historial de movimientos" — Inter 20pt/700/#0F0F0F, no fill.
//   2. Subtitle — Inter 12pt/400/#3A4150, no fill.
//   3. Credit bar "Crédito al consumo en modalidad REVOLVING" — Inter 13pt/700/#5B3FA8
//      on fill #CFBDFA (через sectionTitle helper).
//   4. Client card table — 3 колонки × 2 строки, в каждой ячейке метка
//      сверху + значение снизу (ref DOCX подтвердил layout "labels above
//      values within each cell").
//      Row 1: TITULAR / Nº CLIENTE / CONTRATO Nº — все с непустыми значениями.
//      Row 2: TIN: / TAE: / (пусто) — колонка 3 пустая; оба лейбла проходят
//      через upper() и рендерятся одинаковым стилем (Inter 8pt/700/#6B7280
//      caps, tracking 1.2pt).
//      Значения — Inter 13pt/700/#6B7280 (per TZ §3 "Values | under labels").
//      Ячейки #FBFCFE с верхней (row 1) / нижней (row 2) границами #E6EAF0;
//      средняя горизонталь между row 1 и row 2 не рисуется (per TZ §3
//      "no vertical borders", "top + bottom" на группу row 1+2 целиком).
#let cabecera(vars) = [
    #image("../common/logo_plazo.png", width: 5.34cm)
    #v(0.6cm)

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

    // helper: ячейка "метка (8pt caps grey tracking 1.2pt) + значение
    // (13pt bold grey #6B7280)" со стрелой границы, задаваемой снаружи.
    // Все лейблы проходят через upper() — двоеточия и цифры сохраняются
    // (upper("TIN:")="TIN:", upper("TAE:")="TAE:") — гарантирует единый
    // стиль TIN и TAE (per user 2026-09-09).
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

    #let empty-cell(stroke: none) = table.cell(
        fill: color-cell-bg,
        inset: (x: 10pt, y: 8pt),
        stroke: stroke,
    )[]

    // Границы: только top на row 1 и bottom на row 2 — TZ §3 "top + bottom"
    // применяется к всей рамке карточки, а не к каждой строке.
    #let stroke-top    = (top: 0.5pt + color-border, bottom: none)
    #let stroke-bottom = (top: none, bottom: 0.5pt + color-border)

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        inset: 0pt,
        // Row 1: TITULAR / Nº CLIENTE / CONTRATO Nº
        card-cell("TITULAR",     vars.BORROWER_FULL_NAME, stroke: stroke-top),
        card-cell("Nº CLIENTE",  vars.CLIENT_NUMBER,      stroke: stroke-top),
        card-cell("CONTRATO Nº", vars.CREDIT_NUMBER,      stroke: stroke-top),
        // Row 2: TIN: / TAE: / (empty). Оба лейбла проходят через
        // upper() в card-cell — рендерятся идентичным стилем.
        card-cell("TIN:", vars.TIN_INTEREST, stroke: stroke-bottom),
        card-cell("TAE:", vars.TAE_INTEREST, stroke: stroke-bottom),
        empty-cell(stroke: stroke-bottom),
    )
]
