#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-grey-title, color-cell-bg,
    color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 2 — MODALIDAD DE PAGO Y SITUACIÓN ACTUAL.
// Тех.спец §6 (TZ_ExtractoHistoricoMovimientosPLAZO):
//   Section header — numbered-section-title (Inter 13pt/700).
//   Row 1 (merged 2 cols) — Inter 11.5pt bold: "Modalidad de pago:" префикс
//     + regular remainder "pago aplazado en modalidad REVOLVING".
//   Payment cards (rows 2–3): fill #FBFCFE.
//     CANTIDAD A PAGAR, PRÓXIMO PAGO, LÍMITE DE CRÉDITO CONCEDIDO, CRÉDITO
//     DISPONIBLE, IMPORTE MÁXIMO DISPONIBLE (caption) — Inter 8pt/700/#6B7280
//     uppercase, tracking 24 twips (=1.2pt).
//     Payment value / Credit limit / Available credit — Inter 22pt/700/#0F0F0F.
//     Next payment (Próximo pago value) — Inter 16pt/700/#0F0F0F.
#let modalidad-pago(vars) = [
    #numbered-section-title("2", "MODALIDAD DE PAGO Y SITUACIÓN ACTUAL")
    #v(0.4em)

    // Row 1 banner — TZ §6: Inter 11.5pt, "Modalidad de pago:" bold + rest regular.
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

    // helper: ячейка "метка (8pt caps grey tracking 1.2pt) + значение (22pt bold)"
    // + опциональная подпись (8pt caps grey tracking 1.2pt).
    // block(breakable: false) — чтобы page break не разорвал значение и подпись.
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
