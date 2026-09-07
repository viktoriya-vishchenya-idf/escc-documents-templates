#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg,
    color-grey-title, color-grey-bg,
)

// Section 1 — RESUMEN DEL MES (LD-2.16 v7).
// Три колонки: CONCEPTO / IMPORTE / CÓMO SE OBTIENE.
// «Cómo se obtiene» — статичный испанский текст описания концепта, часть
// дизайна документа (не приходит с бэкенда).
// Строка «Saldo dispuesto final» — итоговая, выделена фиолетовой плашкой.
#let resumen(vars) = [
    #sectionTitle[1  RESUMEN DEL MES]
    #v(0.3em)

    #table(
        columns: (32%, 20%, 48%),
        stroke: none,
        table.header(
            table.cell(fill: color-grey-bg)[
                #text(fill: color-grey-title, weight: "bold", size: 10pt)[CONCEPTO]
            ],
            table.cell(fill: color-grey-bg, align: right)[
                #text(fill: color-grey-title, weight: "bold", size: 10pt)[IMPORTE]
            ],
            table.cell(fill: color-grey-bg)[
                #text(fill: color-grey-title, weight: "bold", size: 10pt)[CÓMO SE OBTIENE]
            ],
        ),

        [#text(weight: "bold")[Saldo dispuesto inicial]],
        table.cell(align: right)[#text(weight: "bold")[#vars.INITIAL_BALANCE]],
        [Deuda final de la liquidación mensual anterior.],

        [#text(weight: "bold")[(+) Disposiciones del periodo]],
        table.cell(align: right)[#text(weight: "bold")[#vars.TOTAL_DEBITS]],
        [Suma de compras y retiradas de efectivo de este mes.],

        [#text(weight: "bold")[(+) Intereses devengados (#vars.TAE_INTEREST)]],
        table.cell(align: right)[#text(weight: "bold")[#vars.INTEREST]],
        [Interés del mes sobre el saldo dispuesto.],

        [#text(weight: "bold")[(+) Comisiones del periodo]],
        table.cell(align: right)[#text(weight: "bold")[#vars.PENALTY]],
        [Suma de comisiones de este mes.],

        [#text(weight: "bold")[(-) Pagos realizados]],
        table.cell(align: right)[#text(weight: "bold")[#vars.TOTAL_CREDITS]],
        [Cuota mensual abonada por el/la titular.],

        // Итог — фиолетовая плашка через все три колонки
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, weight: "bold", size: 12pt)[(=) Saldo dispuesto final]
        ],
        table.cell(fill: color-title-bg, align: right)[
            #text(fill: color-title, weight: "bold", size: 12pt)[#vars.FINAL_BALANCE]
        ],
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, size: 10pt)[Es la deuda actual y el saldo inicial de la siguiente liquidación mensual.]
        ],
    )
]
