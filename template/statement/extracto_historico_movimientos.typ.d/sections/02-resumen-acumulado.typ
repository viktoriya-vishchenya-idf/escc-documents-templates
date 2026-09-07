#import "../common/default_styles.typ": sectionTitle
#import "../common/table_styles.typ": summary-row, summary-total-row

// Аккумулированный сводный блок (LD-3.11). Диапазон — с даты
// открытия кредита (initialDate) до даты выпуска документа (issueDate).
#let resumen-acumulado(vars) = [
    #sectionTitle[Resumen acumulado]
    #v(0.3em)

    #table(
        columns: (65%, 35%),
        stroke: none,
        ..summary-row("Disposiciones acumuladas",           vars.TOTAL_DEBITS),
        ..summary-row("Pagos acumulados",                   vars.TOTAL_CREDITS),
        ..summary-row("Intereses devengados acumulados (TAE)", vars.TAE_INTEREST),
        ..summary-row("Intereses acumulados",               vars.INTEREST),
        ..(if vars.PENALTY != none and vars.PENALTY != "0 €" and vars.PENALTY != "0,00 €" {
            summary-row("Comisiones acumuladas", vars.PENALTY)
        } else { () }),
        ..summary-total-row("Saldo dispuesto actual", vars.FINAL_BALANCE),
    )
]
