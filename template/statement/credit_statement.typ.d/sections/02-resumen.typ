#import "../common/default_styles.typ": sectionTitle
#import "../common/table_styles.typ": summary-row, summary-total-row

// Сводный блок (LD-3.3): Saldo inicial, Total débitos, Total créditos,
// TAE, Intereses del periodo, Penalty (только если != 0), Saldo final.
#let resumen(vars) = [
    #sectionTitle[Resumen del periodo]
    #v(0.3em)

    #table(
        columns: (65%, 35%),
        stroke: none,
        ..summary-row("Crédito dispuesto del mes anterior", vars.INITIAL_BALANCE),
        ..summary-row("Disposiciones del mes", vars.TOTAL_DEBITS),
        ..summary-row("Pagos del mes", vars.TOTAL_CREDITS),
        ..summary-row("TAE", vars.TAE_INTEREST),
        ..summary-row("Intereses devengados del periodo", vars.INTEREST),
        // Penalty показываем только если значение != "0,00 €" и не none.
        // vars.PENALTY уже отформатирован ("30,00 €" или none).
        ..(if vars.PENALTY != none and vars.PENALTY != "0 €" and vars.PENALTY != "0,00 €" {
            summary-row("Comisión por reclamación de posiciones deudoras", vars.PENALTY)
        } else { () }),
        ..summary-total-row("Crédito dispuesto a final del mes", vars.FINAL_BALANCE),
    )
]
