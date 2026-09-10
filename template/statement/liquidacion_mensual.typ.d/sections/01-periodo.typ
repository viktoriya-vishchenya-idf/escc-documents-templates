#import "../common/default_styles.typ": (
    color-title, color-grey-title, color-cell-bg, color-border, color-body,
    color-secondary,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 2 — MODALIDAD DE PAGO Y SITUACIÓN ACTUAL (LD-2.16 v7, TZ §7/§8).
// Первая строка (colspan=2) — "Modalidad de pago: pago aplazado en modalidad
// REVOLVING" на нижней границе #E6EAF0.
// Дальше — карточная 3×2 (5100/5100 twips ≈ 50%/50%):
//   Row A: CANTIDAD A PAGAR (left card) | PRÓXIMO PAGO (right card)
//   Row B: LÍMITE DE CRÉDITO CONCEDIDO (left card, с подписью IMPORTE MÁXIMO
//          DISPONIBLE SEGÚN CONTRATO под значением) | CRÉDITO DISPONIBLE (right card)
// Метки — Inter 8pt/700/#6B7280 uppercase tracking 1.2pt, значения — Inter
// ≈22pt/700/#0F0F0F. Дополнительная маленькая подпись под LÍMITE — Inter 8pt/
// 700/#6B7280 tracking 1pt (TZ §8 "IMPORTE MÁXIMO... no card / no bold value").
#let modalidad-pago(vars) = [
    #numbered-section-title("2", "Modalidad de pago y situación actual")
    #v(0.3em)

    // Строка "Modalidad de pago" — colspan=2, нижняя граница.
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

    // Карточка с крупным значением: метка сверху + значение снизу.
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

    // Вариант карточки с крупным значением + мелкая пояснительная подпись
    // под ним (для LÍMITE DE CRÉDITO CONCEDIDO / IMPORTE MÁXIMO...).
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

    // Вариант карточки с датой (PRÓXIMO PAGO): значение чуть меньше (16pt),
    // потому что строка длиннее.
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
