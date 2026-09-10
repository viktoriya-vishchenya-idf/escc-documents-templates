// Таблицы этого документа — раскладочные: в .docx у них либо совсем нет
// линий, либо только внешние. Все варианты рамок собраны здесь, чтобы в
// sections/*.typ не было инлайновых stroke-замыканий: в разметке остаётся
// только имя нужного варианта.
//
// В отличие от преконтракта таблицы НЕ выходят за поля текста и шапка не
// повторяется при разрыве на следующей странице — как в исходном .docx.
//
// header-rows — номера строк с серой шапкой. Если параметр задан, отступ
// сверху получают все строки таблицы: сама шапка — header-pad (0,9em от
// верхней границы), остальные строки — header-gap (высота пустой строки,
// чтобы они отбивались друг от друга).
// В .docx шапка не всегда нулевая строка, поэтому её номер задаётся в
// месте вызова, а не вычисляется здесь. Без параметра (header-rows: none)
// отступов нет вовсе — так вёрстка чисто раскладочных таблиц (списки
// a)/b)/c), рамки с примерами) остаётся прежней.
#import "default_styles.typ": cell-pad-y, header-gap, header-pad

#let table-rule = 0.5pt + black

// pad-y — отступ текста от верхней и нижней границы ячейки. Задаётся там,
// где раньше внутри ячеек стояли #linebreak() ради воздуха: воздух даёт
// сама таблица, а разметка остаётся чистой. Серая шапка сохраняет свой
// header-pad, чтобы полоса не разъезжалась.
#let doc-table(header-rows: none, pad-y: none, ..args) = figure(
    {
        set table.header(repeat: false)
        table(
            inset: (x, y) => if header-rows != none and y in header-rows {
                (top: header-pad, bottom: 5pt, left: 5pt, right: 5pt)
            } else if pad-y != none {
                (top: pad-y, bottom: pad-y, left: 5pt, right: 5pt)
            } else if header-rows == none {
                5pt
            } else {
                (top: header-gap, bottom: 5pt, left: 5pt, right: 5pt)
            },
            ..args,
        )
    },
    kind: table,
    supplement: none,
)

// Полная сетка. Для одноклеточных таблиц («Ejemplo representativo…»,
// «Le informamos…») это просто рамка вокруг текста.
#let boxed-doc-table(header-rows: none, ..args) = doc-table(
    header-rows: header-rows,
    stroke: table-rule,
    ..args,
)

// Одноклеточная рамка — тот же результат, что и boxed-doc-table, но имя
// говорит о назначении в месте вызова.
#let single-row-doc-table(header-rows: none, ..args) = boxed-doc-table(
    header-rows: header-rows,
    ..args,
)

// Только верхняя линия таблицы.
#let top-ruled-doc-table(header-rows: none, ..args) = doc-table(
    header-rows: header-rows,
    stroke: (x, y) => (top: if y == 0 { table-rule } else { none }),
    ..args,
)

// Горизонтальные линии между всеми строками плюс закрывающая снизу,
// вертикальных нет. rows — общее число строк таблицы. Текст отбит от
// линий сверху и снизу на cell-pad-y (см. pad-y в doc-table).
#let ruled-doc-table(rows: 0, header-rows: none, pad-y: cell-pad-y, ..args) = doc-table(
    header-rows: header-rows,
    pad-y: pad-y,
    stroke: (x, y) => (
        top: table-rule,
        bottom: if y == rows - 1 { table-rule } else { none },
    ),
    ..args,
)

// Линия только под последней строкой. rows — общее число строк.
#let bottom-ruled-doc-table(rows: 0, header-rows: none, ..args) = doc-table(
    header-rows: header-rows,
    stroke: (x, y) => (
        bottom: if y == rows - 1 { table-rule } else { none },
    ),
    ..args,
)

// Верхняя линия таблицы плюс разделители под каждой ячейкой ВТОРОЙ
// колонки: так пункты 1º…4º отделены друг от друга, а последняя линия
// закрывает таблицу. Вертикальных линий нет. Текст ячеек отбит
// сверху и снизу на cell-pad-y (см. pad-y в doc-table).
#let second-col-ruled-doc-table(
    header-rows: none,
    pad-y: cell-pad-y,
    ..args,
) = doc-table(
    header-rows: header-rows,
    pad-y: pad-y,
    stroke: (x, y) => (
        top: if y == 0 { table-rule } else { none },
        bottom: if x == 1 { table-rule } else { none },
    ),
    ..args,
)
