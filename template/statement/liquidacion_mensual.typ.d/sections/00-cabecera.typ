#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg, color-section-bg,
    color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary, body-header-size,
)

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
