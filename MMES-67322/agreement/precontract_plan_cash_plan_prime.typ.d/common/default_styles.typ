#let page-margin-x = 3cm
#let footer-size = 8pt
#let body-font = "Helvetica"
#let body-size = 13pt
#let body-header-size = 15pt
#let table-header-size = 15pt
#let accent-blue = rgb("#0070C0")
#let table-header-fill = rgb("#D0CECE")
#let table-alt-fill = rgb("#F2F2F2")
#let highlight-fill = rgb("#D0CECE")

#let marked(fill: highlight-fill, body) = highlight(
    fill: fill,
    top-edge: "ascender",
    bottom-edge: "descender",
    body,
)

#let boxed(fill: highlight-fill, body) = block(
    fill: fill,
    inset: 6pt,
    radius: 2pt,
    width: 100%,
    body,
)

#let dashList09spacing(body) = {
  set list(marker: [\-], spacing: 0.9em)
  body
}

#let dashList(body) = {
  set list(marker: [\-])
  body
}

// Пункты "1º, 2º, ...": перенос строки идёт ровно под номером (номер —
// часть абзаца, а не отдельная колонка enum), интервал между пунктами
// 1.9em. Пункты пишутся через "+", строки-продолжения — с отступом
// глубже маркера, иначе Typst разорвёт список и нумерация собьётся на 1.


#let document(doc-code: "", doc) = {
    set page(
        paper: "a4",
        margin: (
            top: 3cm,
            bottom: 2cm,
            left: page-margin-x,
            right: page-margin-x,
        ),
        header: pad(top: 0.4cm, image("logo_plazo.png", width: 3.4cm)),
        footer: [
            #set text(size: footer-size)
            #doc-code
            #h(1fr)
            #context counter(page).display("1")
        ],
    )
    // hyphenate: false — слова не дробятся переносом по слогам,
    // не влезающее слово целиком уходит на новую строку.
    set text(font: body-font, size: body-size, lang: "es", hyphenate: false)
    // justify: false — текст не растягивается до правого края (рваный
    // правый край); leading — межстрочный интервал внутри абзаца,
    // spacing — отступ между абзацами.
    // leading 0.98em ≈ полуторный интервал (1.5 × одинарного 0.65em)
    set par(justify: false, leading: 0.98em, spacing: .9em)

    // Маркированные списки: строки внутри пункта — как основной текст,
    // между пунктами зазор чуть больше обычного.
    set list(spacing: 1.3em, indent: 0.3em)

    // Таблицы: тонкие чёрные рамки
    // серая заливка строк-заголовков.
    set table(
        stroke: 0.5pt + black,
        inset: 5pt,
        align: left,
        fill: (x, y) => if y == 0 { table-header-fill }
    )
    show table.cell.where(y: 0): set text(
        weight: "bold",
        size: table-header-size,
    )

    // figure обёртка таблиц — без подписей и отступов
    show figure: set block(breakable: true, above: 1em, below: 1em)
    // все таблицы отступают на 0.9cm от краёв СТРАНИЦЫ (не текстовой
    // области): отрицательный pad расширяет их за поля текста
    // на (page-margin-x − 0.9cm) с каждой стороны
    show figure.where(kind: table): it => pad(x: -(page-margin-x - 1.4cm), it)

    show link: set text(fill: accent-blue)

    doc
}
