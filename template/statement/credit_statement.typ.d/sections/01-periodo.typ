#import "../common/default_styles.typ": sectionTitle, color-section-bg, color-body
#import "../common/table_styles.typ": kv-row

// Блок "Periodo del extracto y próximo pago"
#let periodo(vars) = [
    #sectionTitle[Periodo y próximo pago]
    #v(0.3em)

    #table(
        columns: (30%, 70%),
        stroke: none,
        ..kv-row("Periodo del extracto",
            [Del #vars.PERIOD_START al #vars.PERIOD_END]),
        ..kv-row("Modalidad de pago",  vars.PAYMENT_MODE),
        ..kv-row("Fecha del próximo pago", vars.REPAYMENT_DATE),
        ..kv-row("Importe del próximo pago", vars.PAYMENT_AMOUNT),
    )
]
