#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-grey-title, color-cell-bg,
    color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

#let modalidad-pago(vars) = [
    #numbered-section-title("2", "MODALIDAD DE PAGO Y SITUACIÓN ACTUAL")
    #v(0.4em)

    #block(
        fill: color-title-bg,
        inset: (x: 10pt, y: 8pt),
        radius: 3pt,
        width: 100%,
    )[
        #text(fill: color-title, size: 11.5pt)[
            #text(weight: "bold")[Modalidad de pago:] pago aplazado en modalidad REVOLVING
        ]
    ]
    #v(0.4em)

    #let cell(label, value, value-size: 22pt, caption: none) = table.cell(
        fill: color-cell-bg,
        inset: (x: 12pt, y: 12pt),
        stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
    )[
        #block(breakable: false)[
            #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[#upper(label)]

            #v(0.5em)
            #text(fill: color-body, weight: "bold", size: value-size)[#value]
            #if caption != none [
                #v(0.3em)
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[#upper(caption)]
            ]
        ]
    ]

    #table(
        columns: (1fr, 1fr),
        stroke: none,
        inset: 0pt,
        cell("Cantidad a pagar", vars.PAYMENT_AMOUNT),
        cell("Próximo pago",     vars.REPAYMENT_DATE, value-size: 16pt),
        cell("Límite de crédito concedido", vars.CREDIT_LIMIT, caption: "Importe máximo disponible según contrato"),
        cell("Crédito disponible", vars.AVAILABLE_LIMIT),
    )
]
