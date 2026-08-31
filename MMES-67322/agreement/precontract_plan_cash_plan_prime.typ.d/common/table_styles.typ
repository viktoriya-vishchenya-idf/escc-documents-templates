
#import "default_styles.typ": body-size, table-header-fill, table-alt-fill

// Таблица ВНУТРИ ячейки другой таблицы. Обычные таблицы расширяются
// за поля страницы (см. show-правило для figure ниже) — вложенной это
// ломает вёрстку, поэтому у неё свой kind, на который правило не
// действует: она занимает ровно ширину своей колонки.
#let nested-table(..args) = figure(
    {
        // шапка не повторяется на следующей странице при разрыве таблицы
        set table.header(repeat: false)
        table(fill: (x, y) => if calc.rem(y,2) == 0 { table-header-fill } else { table-alt-fill }, ..args)
    },
    kind: "nested-table",
    supplement: none,
)

#let payment-plan-columns = (12.15%, 15.26%, 15.25%, 15.26%, 19.84%, 22.24%)

// columns можно не передавать (возьмутся payment-plan-columns выше)
// или переопределить в месте вызова: #paymen-plan-table(columns: (...), ...)
#let paymen-plan-table(columns: payment-plan-columns, ..args) = figure(
    {
        set table.header(repeat: false)
        set table(stroke: none, fill: none)
        // явные table.hline() в разметке тоже не рисуем
        set table.hline(stroke: none)
        show table.cell.where(y: 0): set text(
            size: body-size,
            weight: "regular",
        )
        table(columns: columns, ..args)
    },
    kind: table,
    supplement: none,
)
