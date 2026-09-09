#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg, color-grey-title,
    color-grey-bg, color-cell-bg, color-border, color-body, color-secondary,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 1 — RESUMEN HISTÓRICO ACUMULADO.
// TZ_ExtractoHistoricoMovimientosPLAZO §5:
//   Header row: fill #F1F5F9, Inter 8pt/700/#6B7280 uppercase, tracking 20 (=1pt).
//   Body concepts:      Inter 11.5pt/700/#0F0F0F (left).
//   Body amounts:       Inter 11.5pt/700 (right).
//   Body descriptions:  Inter 11pt/400/#3A4150 (left).
//   Payments amount (row "Pagos"): Inter 11.5pt/700/#5B3FA8 (purple).
//   Current balance row: fill #EFE9FB (light purple, NOT the darker #CFBDFA).
//     Concept + amount bold; amount 13pt/#0F0F0F. Description 11pt/regular.
//   Borders: horizontal #E6EAF0 (size 4 twips ≈ 0.2pt).
//   Column split: 3213/2443/4544 twips ≈ 32%/24%/44%.
//   Знаки (+)/(−)/(=) — типографический минус U+2212.
#let resumen-acumulado(vars) = [
    #numbered-section-title("1", "RESUMEN HISTÓRICO ACUMULADO")
    #v(0.4em)

    #table(
        columns: (32%, 24%, 44%),
        stroke: none,
        inset: (x: 10pt, y: 8pt),
        // Header row — fill #F1F5F9, 8pt caps grey, tracking 1pt.
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

        // Row 1 — Saldo dispuesto inicial (apertura)
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[Saldo dispuesto inicial (apertura)]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.INITIAL_BALANCE]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Saldo dispuesto en la apertura del contrato.]
        ],

        // Row 2 — Disposiciones acumuladas
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Disposiciones acumuladas]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.TOTAL_DEBITS]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todas las disposiciones (compras y efectivo) desde la apertura.]
        ],

        // Row 3 — Intereses devengados acumulados (TAE%)
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Intereses devengados acumulados (#vars.TAE_INTEREST)]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.INTEREST]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de los intereses devengados durante toda la vida del crédito.]
        ],

        // Row 4 — Comisiones acumuladas
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(+) Comisiones acumuladas]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(weight: "bold", size: 11.5pt)[#vars.PENALTY]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todas las comisiones aplicadas desde la apertura.]
        ],

        // Row 5 — Pagos acumulados (TZ §5: amount purple #5B3FA8)
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[(−) Pagos acumulados]
        ],
        table.cell(align: right, stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-title, weight: "bold", size: 11.5pt)[#vars.TOTAL_CREDITS]
        ],
        table.cell(stroke: (bottom: 0.5pt + color-border))[
            #text(fill: color-secondary, size: 11pt)[Suma de todos los abonos realizados por el/la titular.]
        ],

        // Row 6 — Saldo dispuesto actual (итог, светло-фиолетовая плашка #EFE9FB per TZ §5)
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
