#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary, body-header-size,
)

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

    #let stroke-top    = (top: 0.5pt + color-border, bottom: none)
    #let stroke-bottom = (top: none, bottom: 0.5pt + color-border)

    #table(
        columns: (1fr, 1fr, 1fr),
        stroke: none,
        inset: 0pt,
        card-cell("TITULAR",     vars.BORROWER_FULL_NAME, stroke: stroke-top),
        card-cell("Nº CLIENTE",  vars.CLIENT_NUMBER,      stroke: stroke-top),
        card-cell("CONTRATO Nº", vars.CREDIT_NUMBER,      stroke: stroke-top),
        card-cell("TIN:", vars.TIN_INTEREST, stroke: stroke-bottom),
        card-cell("TAE:", vars.TAE_INTEREST, stroke: stroke-bottom),
        empty-cell(stroke: stroke-bottom),
    )
]
