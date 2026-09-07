#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-title-bg,
    color-grey-title, color-grey-bg,
)

// Section 1 — RESUMEN HISTÓRICO ACUMULADO (LD-2.39 v4).
// Три колонки: CONCEPTO / IMPORTE / CÓMO SE OBTIENE.
// Аккумулятивная выписка: 5 строк (нет «Saldo dispuesto inicial» —
// диапазон с apertura del contrato). TAE-% встроен в подпись
// «Intereses devengados acumulados», отдельной строки TAE нет.
// «Cómo se obtiene» — статичный испанский текст (часть дизайна).
#let resumen-acumulado(vars) = [
    #sectionTitle[1  RESUMEN HISTÓRICO ACUMULADO]
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

        [#text(weight: "bold")[(+) Disposiciones acumuladas]],
        table.cell(align: right)[#text(weight: "bold")[#vars.TOTAL_DEBITS]],
        [Suma de todas las disposiciones (compras y efectivo) desde la apertura.],

        [#text(weight: "bold")[(+) Intereses devengados acumulados (#vars.TAE_INTEREST)]],
        table.cell(align: right)[#text(weight: "bold")[#vars.INTEREST]],
        [Suma de los intereses devengados durante toda la vida del crédito.],

        [#text(weight: "bold")[(+) Comisiones acumuladas]],
        table.cell(align: right)[#text(weight: "bold")[#vars.PENALTY]],
        [Suma de todas las comisiones aplicadas desde la apertura.],

        [#text(weight: "bold")[(-) Pagos acumulados]],
        table.cell(align: right)[#text(weight: "bold")[#vars.TOTAL_CREDITS]],
        [Suma de todos los abonos realizados por el/la titular.],

        // Итог — фиолетовая плашка через все три колонки
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, weight: "bold", size: 12pt)[(=) Saldo dispuesto actual]
        ],
        table.cell(fill: color-title-bg, align: right)[
            #text(fill: color-title, weight: "bold", size: 12pt)[#vars.FINAL_BALANCE]
        ],
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, size: 10pt)[Deuda viva a la fecha de emisión de este extracto.]
        ],
    )
]