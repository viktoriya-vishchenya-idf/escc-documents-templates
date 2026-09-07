#import "../common/default_styles.typ": (
    sectionTitle, color-section-bg, color-grey-bg,
)
#import "../common/table_styles.typ": kv-row

// Блок сведений о клиенте и кредите + Periodo del extracto.
#let datos-titular(vars) = [
    #sectionTitle[Datos del titular]
    #v(0.3em)

    #grid(
        columns: (1fr, 1fr),
        column-gutter: 12pt,
        table(
            columns: (42%, 58%),
            stroke: none,
            table.header(table.cell(colspan: 2, fill: color-section-bg)[
                #text(weight: "bold")[Cliente]
            ]),
            ..kv-row("Titular",       vars.BORROWER_FULL_NAME),
            ..kv-row("Nº de cliente", vars.CLIENT_NUMBER),
        ),
        table(
            columns: (46%, 54%),
            stroke: none,
            table.header(table.cell(colspan: 2, fill: color-section-bg)[
                #text(weight: "bold")[Crédito]
            ]),
            ..kv-row("Nº de crédito",       vars.CREDIT_NUMBER),
            ..kv-row("Límite del crédito",  vars.CREDIT_LIMIT),
            ..kv-row("Límite disponible",   vars.AVAILABLE_LIMIT),
        ),
    )

    #v(0.6em)
    #sectionTitle[Periodo y próximo pago]
    #v(0.3em)
    #table(
        columns: (30%, 70%),
        stroke: none,
        ..kv-row("Periodo del extracto",
            [Del #vars.INITIAL_DATE al #vars.ISSUE_DATE]),
        ..kv-row("Próximo pago",   vars.REPAYMENT_DATE),
        ..kv-row("Importe próximo pago", vars.PAYMENT_AMOUNT),
    )
]
