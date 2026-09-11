#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary,
)
#import "../common/table_styles.typ": numbered-section-title

#let modalidad-pago(vars) = [
    #numbered-section-title("2", "Modalidad de pago y situación actual")
    #v(0.3em)

    #block(
        width: 100%,
        inset: (x: 10pt, y: 8pt),
        stroke: (bottom: 0.5pt + color-border),
    )[
        #text(fill: color-body, size: 11.5pt)[
            Modalidad de pago: pago aplazado en modalidad REVOLVING
        ]
    ]

    #v(0.4em)

    #let big-card(label, value) = table.cell(
        fill: color-cell-bg,
        inset: (x: 14pt, y: 12pt),
        stroke: 0.5pt + color-border,
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[
            #upper(label)
        ]

        #v(0.5em)
        #text(fill: color-body, weight: "bold", size: 22pt)[#value]
    ]

    #let big-card-with-subtitle(label, value, subtitle) = table.cell(
        fill: color-cell-bg,
        inset: (x: 14pt, y: 12pt),
        stroke: 0.5pt + color-border,
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[
            #upper(label)
        ]

        #v(0.5em)
        #text(fill: color-body, weight: "bold", size: 22pt)[#value]

        #v(0.4em)
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[
            #upper(subtitle)
        ]
    ]

    #let date-card(label, value) = table.cell(
        fill: color-cell-bg,
        inset: (x: 14pt, y: 12pt),
        stroke: 0.5pt + color-border,
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[
            #upper(label)
        ]

        #v(0.5em)
        #text(fill: color-body, weight: "bold", size: 16pt)[#value]
    ]

    #table(
        columns: (1fr, 1fr),
        stroke: none,
        inset: 0pt,
        column-gutter: 0.4em,
        row-gutter: 0.4em,
        // Row A
        big-card("CANTIDAD A PAGAR", vars.PAYMENT_AMOUNT),
        date-card("PRÓXIMO PAGO", vars.REPAYMENT_DATE),
        // Row B
        big-card-with-subtitle(
            "LÍMITE DE CRÉDITO CONCEDIDO",
            vars.CREDIT_LIMIT,
            "IMPORTE MÁXIMO DISPONIBLE SEGÚN CONTRATO",
        ),
        big-card("CRÉDITO DISPONIBLE", vars.AVAILABLE_LIMIT),
    )
]
