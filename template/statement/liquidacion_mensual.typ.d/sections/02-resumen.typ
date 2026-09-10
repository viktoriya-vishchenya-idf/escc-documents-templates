#import "../common/default_styles.typ": (
    color-title, color-section-bg,
    color-grey-title, color-grey-bg, color-border, color-body,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 1 — RESUMEN DEL MES (LD-2.16 v7, TZ §4/§5/§6).
// Три колонки: CONCEPTO / IMPORTE / CÓMO SE OBTIENE
// (TZ ширины: 3213 / 2443 / 4544 twips ≈ 32% / 24% / 44%).
// Header — Inter 8pt/700/#6B7280 uppercase tracking 20 (=1pt), fill #F1F5F9,
// bottom border #E6EAF0 (0.25pt в OOXML → 0.5pt в Typst).
// Body rows: label 11.5pt/700/#0F0F0F left, amount 11.5pt/700/#0F0F0F right,
// description 11pt/400/#3A4150 left. Только горизонтальные линии.
// Row 3 (Intereses devengados) — процентная ставка "(XXX%)" на второй визуальной
// строке концепта (TZ §6, TZ §19 "Preserve the interest-rate line as a separate
// visual line").
// Row 5 (Pagos realizados) — сумма фиолетовая #5B3FA8 (TZ §6 "Purple amount",
// TZ §22 "Сохранить #5B3FA8 для отрицательной суммы Pagos realizados").
// Row 6 (Saldo dispuesto final) — вся строка на светло-фиолетовой заливке
// #EFE9FB, текст 13pt/700/#0F0F0F (TZ §5 "Final balance", §6 "Row fill #EFE9FB").
#let resumen(vars) = [
    #numbered-section-title("1", "Resumen del mes")
    #v(0.3em)

    // Хелпер шапки: серые метки, tracking 1pt, uppercase.
    #let head-cell(label, align-right: false) = table.cell(
        fill: color-grey-bg,
        inset: (x: 10pt, y: 8pt),
        align: if align-right { right + horizon } else { left + horizon },
    )[
        #text(fill: color-grey-title, weight: "bold", size: 8pt, tracking: 1pt)[
            #upper(label)
        ]
    ]

    // Обычная строка: label слева, amount справа, description слева
    // (описание — Inter 11pt/400/#3A4150).
    #let row-concept(body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 11.5pt)[#body]
    ]
    #let row-amount(body, fill: color-body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: right + horizon,
    )[
        #text(fill: fill, weight: "bold", size: 11.5pt)[#body]
    ]
    #let row-desc(body) = table.cell(
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: rgb("#3A4150"), size: 11pt)[#body]
    ]

    // Итоговая строка: заливка #EFE9FB на все три ячейки, крупнее.
    #let total-concept(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 13pt)[#body]
    ]
    #let total-amount(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: right + horizon,
    )[
        #text(fill: color-body, weight: "bold", size: 13pt)[#body]
    ]
    #let total-desc(body) = table.cell(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        align: left + horizon,
    )[
        #text(fill: rgb("#3A4150"), size: 11pt)[#body]
    ]

    #table(
        columns: (32%, 24%, 44%),
        // только горизонтальные линии, вертикали убраны (TZ §19)
        stroke: (x, y) => (
            top:    if y == 0 { none } else { 0.5pt + color-border },
            bottom: none,
            left: none, right: none,
        ),
        inset: 0pt,
        table.header(
            head-cell("CONCEPTO"),
            head-cell("IMPORTE", align-right: true),
            head-cell("CÓMO SE OBTIENE"),
        ),

        // Row 1
        row-concept[Saldo dispuesto inicial],
        row-amount(vars.INITIAL_BALANCE),
        row-desc[Deuda final de la liquidación mensual anterior.],

        // Row 2
        row-concept[(+) Disposiciones del periodo],
        row-amount(vars.TOTAL_DEBITS),
        row-desc[Suma de compras y retiradas de efectivo de este mes.],

        // Row 3 — процент на второй визуальной строке концепта
        table.cell(
            inset: (x: 10pt, y: 8pt),
            align: left + horizon,
        )[
            #text(fill: color-body, weight: "bold", size: 11.5pt)[
                (+) Intereses devengados
                #linebreak()
                (#vars.TAE_INTEREST)
            ]
        ],
        row-amount(vars.INTEREST),
        row-desc[Interés del mes sobre el saldo dispuesto.],

        // Row 4
        row-concept[(+) Comisiones del periodo],
        row-amount(vars.PENALTY),
        row-desc[Suma de comisiones de este mes.],

        // Row 5 — сумма фиолетовая
        row-concept[(−) Pagos realizados],
        row-amount(vars.TOTAL_CREDITS, fill: color-title),
        row-desc[Cuota mensual abonada por el/la titular.],

        // Row 6 — итог, светло-фиолетовая заливка
        total-concept[(=) Saldo dispuesto final],
        total-amount(vars.FINAL_BALANCE),
        total-desc[Es la deuda actual y el saldo inicial de la siguiente liquidación mensual.],
    )
]
