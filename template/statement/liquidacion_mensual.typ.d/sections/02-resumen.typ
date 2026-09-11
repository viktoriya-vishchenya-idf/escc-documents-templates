#import "../common/default_styles.typ": (
    color-title, color-section-bg,
    color-grey-title, color-grey-bg, color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

#let resumen(vars) = [
    #numbered-section-title("1", "Resumen del mes")
    #v(0.3em)

    #let head-cell(label, align-right: false) = table.cell(
        fill: color-grey-bg,
        inset: (x: 10pt, y: 8pt),
        align: if align-right { right + horizon } else { left + horizon },
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[
            #upper(label)
        ]
    ]

    #let row-concept(body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 11.5pt)[#body]
    ]
    #let row-amount(body, fill: color-body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: right + horizon,
    )[
        #text(fill: fill, weight: "bold", size: 11.5pt)[#body]
    ]
    #let row-desc(body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: rgb("#3A4150"), size: 11pt)[#body]
    ]

    #let total-concept(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 13pt)[#body]
    ]
    #let total-amount(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: right + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 13pt)[#body]
    ]
    #let total-desc(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: rgb("#3A4150"), size: 11pt)[#body]
    ]

    #table(
        columns: (32%, 24%, 44%),
        stroke: (x, y) => (
            top:    if y == 0 { none } else { 0.5pt + color-border },
            bottom: none,
            left: none, right: none,
        ),
        inset: 0pt,
        table.header(
            head-cell("CONCEPTO"),
            head-cell("IMPORTE", align-right: true),
            head-cell("CÓMO SE OBTIENE"),
        ),

        row-concept[Saldo dispuesto inicial],
        row-amount(vars.INITIAL_BALANCE),
        row-desc[Deuda final de la liquidación mensual anterior.],

        row-concept[(+) Disposiciones del periodo],
        row-amount(vars.TOTAL_DEBITS),
        row-desc[Suma de compras y retiradas de efectivo de este mes.],

        table.cell(
            inset: (x: 10pt, y: 8pt),
            align: left + horizon,
        )[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[
                (+) Intereses devengados
                #linebreak()
                (#vars.TAE_INTEREST)
            ]
        ],
        row-amount(vars.INTEREST),
        row-desc[Interés del mes sobre el saldo dispuesto.],

        row-concept[(+) Comisiones del periodo],
        row-amount(vars.PENALTY),
        row-desc[Suma de comisiones de este mes.],

        row-concept[(−) Pagos realizados],
        row-amount(vars.TOTAL_CREDITS, fill: color-title),
        row-desc[Cuota mensual abonada por el/la titular.],

        total-concept[(=) Saldo dispuesto final],
        total-amount(vars.FINAL_BALANCE),
        total-desc[Es la deuda actual y el saldo inicial de la siguiente liquidación mensual.],
    )
]
