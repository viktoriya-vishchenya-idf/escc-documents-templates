#import "default_styles.typ": (
    color-title,
    color-title-bg,
    color-section-bg,
    color-grey-title,
    color-grey-bg,
    color-border,
    color-body,
    body-size,
)

// Строка "метка (серым) — значение (жирным чёрным)" на светло-сером фоне.
// Используется в блоках "Datos del cliente / Datos del crédito".
#let kv-row(label, value) = (
    table.cell(fill: color-grey-bg)[
        #text(fill: color-grey-title, weight: "bold", size: 10pt, label)
    ],
    table.cell()[
        #text(weight: "bold", size: 11pt, value)
    ],
)

// Строка сводного блока (Resumen): метка на #EBE4FC, значение справа.
#let summary-row(label, value) = (
    table.cell(fill: color-section-bg)[
        #text(weight: "bold", size: 11pt, label)
    ],
    table.cell(align: right)[
        #text(weight: "bold", size: 11pt, value)
    ],
)

// Итоговая строка сводного блока (финальный баланс): фиолетовая плашка
// с фиолетовым текстом — самая заметная строка отчёта.
#let summary-total-row(label, value) = (
    table.cell(fill: color-title-bg)[
        #text(fill: color-title, weight: "bold", size: 12pt, label)
    ],
    table.cell(fill: color-title-bg, align: right)[
        #text(fill: color-title, weight: "bold", size: 12pt, value)
    ],
)

// Заголовок таблицы транзакций
#let trx-header(..cells) = table.header(..cells.pos().map(c => table.cell(
    fill: color-title-bg,
)[
    #text(fill: color-title, weight: "bold", size: 10pt, c)
]))
