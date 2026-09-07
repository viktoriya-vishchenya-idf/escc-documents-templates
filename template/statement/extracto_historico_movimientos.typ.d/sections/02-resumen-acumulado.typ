#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-grey-title, color-cell-bg,
    color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 1 — RESUMEN HISTÓRICO ACUMULADO (LD-2.39 v4, DOCX-выверено).
// 6 строк (включая "Saldo dispuesto inicial (apertura)" из DOCX).
// Три колонки: CONCEPTO / IMPORTE / CÓMO SE OBTIENE.
// Тексты "Cómo se obtiene" — verbatim из DOCX; знаки (+)/(−)/(=)
// используют типографический минус U+2212, как в исходнике.
// Итоговая строка "(=) Saldo dispuesto actual" — фиолетовая плашка.
#let resumen-acumulado(vars) = [
    #numbered-section-title("1", "RESUMEN HISTÓRICO ACUMULADO")
    #v(0.4em)

    #table(
        columns: (32%, 20%, 48%),
        stroke: none,
        inset: (x: 10pt, y: 8pt),
        // Заголовок таблицы
        table.header(
            table.cell(
                fill: color-cell-bg,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[CONCEPTO]
            ],
            table.cell(
                fill: color-cell-bg,
                align: right,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[IMPORTE]
            ],
            table.cell(
                fill: color-cell-bg,
                stroke: (top: 0.5pt + color-border, bottom: 0.5pt + color-border),
            )[
                #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1.2pt)[CÓMO SE OBTIENE]
            ],
        ),

        // Row 1 — Saldo dispuesto inicial (apertura)
        [#text(weight: "bold", size: 11.5pt)[Saldo dispuesto inicial (apertura)]],
        table.cell(align: right)[#text(weight: "bold", size: 11.5pt)[#vars.INITIAL_BALANCE]],
        [#text(size: 10.5pt)[Saldo dispuesto en la apertura del contrato.]],

        // Row 2 — Disposiciones acumuladas
        [#text(weight: "bold", size: 11.5pt)[(+) Disposiciones acumuladas]],
        table.cell(align: right)[#text(weight: "bold", size: 11.5pt)[#vars.TOTAL_DEBITS]],
        [#text(size: 10.5pt)[Suma de todas las disposiciones (compras y efectivo) desde la apertura.]],

        // Row 3 — Intereses devengados acumulados (TAE%)
        [#text(weight: "bold", size: 11.5pt)[(+) Intereses devengados acumulados (#vars.TAE_INTEREST)]],
        table.cell(align: right)[#text(weight: "bold", size: 11.5pt)[#vars.INTEREST]],
        [#text(size: 10.5pt)[Suma de los intereses devengados durante toda la vida del crédito.]],

        // Row 4 — Comisiones acumuladas
        [#text(weight: "bold", size: 11.5pt)[(+) Comisiones acumuladas]],
        table.cell(align: right)[#text(weight: "bold", size: 11.5pt)[#vars.PENALTY]],
        [#text(size: 10.5pt)[Suma de todas las comisiones aplicadas desde la apertura.]],

        // Row 5 — Pagos acumulados (типографический минус в подписи)
        [#text(weight: "bold", size: 11.5pt)[(−) Pagos acumulados]],
        table.cell(align: right)[#text(weight: "bold", size: 11.5pt)[#vars.TOTAL_CREDITS]],
        [#text(size: 10.5pt)[Suma de todos los abonos realizados por el/la titular.]],

        // Row 6 — Saldo dispuesto actual (итог, фиолетовая плашка)
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, weight: "bold", size: 12pt)[(=) Saldo dispuesto actual]
        ],
        table.cell(fill: color-title-bg, align: right)[
            #text(fill: color-title, weight: "bold", size: 12pt)[#vars.FINAL_BALANCE]
        ],
        table.cell(fill: color-title-bg)[
            #text(fill: color-title, size: 10.5pt)[Deuda viva a la fecha de emisión de este extracto.]
        ],
    )
]