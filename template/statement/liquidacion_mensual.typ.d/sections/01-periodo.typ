#import "../common/default_styles.typ": (
    sectionTitle, color-section-bg, color-grey-title, color-grey-bg,
)

// Section 2 — MODALIDAD DE PAGO Y SITUACIÓN ACTUAL (LD-2.16 v7).
// Двухколоночная таблица: заголовок «Modalidad de pago…», затем
// два ряда подписей+значений:
//   (CANTIDAD A PAGAR | PRÓXIMO PAGO)
//   (LÍMITE DE CRÉDITO CONCEDIDO | CRÉDITO DISPONIBLE)
// Под лимитом — курсивная подпись «IMPORTE MÁXIMO DISPONIBLE SEGÚN CONTRATO».
// Периодизация вынесена в шапку (`00-cabecera.typ`: «Período de
// liquidación …»), поэтому здесь её нет.
#let modalidad-pago(vars) = [
    #sectionTitle[2  MODALIDAD DE PAGO Y SITUACIÓN ACTUAL]
    #v(0.3em)

    #table(
        columns: (1fr, 1fr),
        stroke: none,
        table.header(table.cell(colspan: 2, fill: color-section-bg)[
            #text(weight: "bold")[Modalidad de pago: pago aplazado en modalidad REVOLVING]
        ]),
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[CANTIDAD A PAGAR]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[PRÓXIMO PAGO]
        ],
        [#text(weight: "bold")[#vars.PAYMENT_AMOUNT]],
        [#text(weight: "bold")[#vars.REPAYMENT_DATE]],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[LÍMITE DE CRÉDITO CONCEDIDO]
        ],
        table.cell(fill: color-grey-bg)[
            #text(fill: color-grey-title, weight: "bold", size: 10pt)[CRÉDITO DISPONIBLE]
        ],
        [
            #text(weight: "bold")[#vars.CREDIT_LIMIT]
            #linebreak()
            #text(fill: color-grey-title, size: 9pt)[IMPORTE MÁXIMO DISPONIBLE SEGÚN CONTRATO]
        ],
        [#text(weight: "bold")[#vars.AVAILABLE_LIMIT]],
    )
]
