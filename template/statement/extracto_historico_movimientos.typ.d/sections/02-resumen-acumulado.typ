#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg, color-grey-title,
    color-grey-bg, color-cell-bg, color-border, color-body, color-secondary,
)
#import "../common/table_styles.typ": numbered-section-title

#let resumen-acumulado(vars) = [
    #numbered-section-title("1", "RESUMEN HISTÓRICO ACUMULADO")
    #v(0.4em)

    #table(
        columns: (32%, 24%, 44%),
        stroke: none,
        inset: (x: 10pt, y: 8pt),
        table.header(
            table.cell(
                fill: color-grey-bg,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[CONCEPTO]
            ],
            table.cell(
                fill: color-grey-bg,
                align: right,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[IMPORTE]
            ],
            table.cell(
                fill: color-grey-bg,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[CÓMO SE OBTIENE]
            ],
        ),

        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[Saldo dispuesto inicial (apertura)]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.INITIAL_BALANCE]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Saldo dispuesto en la apertura del contrato.]
        ],

        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Disposiciones acumuladas]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.TOTAL_DEBITS]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todas las disposiciones (compras y efectivo) desde la apertura.]
        ],

        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Intereses devengados acumulados (#vars.TAE_INTEREST)]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.INTEREST]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de los intereses devengados durante toda la vida del crédito.]
        ],

        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Comisiones acumuladas]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.PENALTY]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todas las comisiones aplicadas desde la apertura.]
        ],

        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(−) Pagos acumulados]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-title, weight: "bold", size: 11.5pt)[#vars.TOTAL_CREDITS]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todos los abonos realizados por el/la titular.]
        ],

        table.cell(fill: color-section-bg)[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(=) Saldo dispuesto actual]
        ],
        table.cell(fill: color-section-bg, align: right)[
            #text(fill: color-body, weight: "bold", size: 13pt)[#vars.FINAL_BALANCE]
        ],
        table.cell(fill: color-section-bg)[
            #text(fill: color-secondary, size: 11pt)[Deuda viva a la fecha de emisión de este extracto.]
        ],
    )
]
