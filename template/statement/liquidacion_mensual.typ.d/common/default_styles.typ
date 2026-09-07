// Палитра CRDES-45111 (см. PDES-140):
//   акцентный фиолетовый заголовок      #5b3fa8   на #CFBDFA
//   чёрный подзаголовок                 #000000   на #EBE4FC
//   серый заголовок ячейки              #6b7280   на #f1f5f9
//   рамки/разделители таблиц            #d9d9d9
//   тело                                #000000

#let page-margin-x = 2.2cm
#let footer-size = 8pt
#let body-font = "Helvetica"
#let body-size = 11pt
#let body-header-size = 16pt

#let color-title = rgb("#5b3fa8")
#let color-title-bg = rgb("#CFBDFA")
#let color-section-bg = rgb("#EBE4FC")
#let color-grey-title = rgb("#6b7280")
#let color-grey-bg = rgb("#f1f5f9")
#let color-border = rgb("#d9d9d9")
#let color-body = rgb("#000000")

// Плашка-заголовок раздела (фиолетовая): текст #5b3fa8 на #CFBDFA
#let sectionTitle(body) = block(
    fill: color-title-bg,
    inset: (x: 10pt, y: 6pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-title, weight: "bold", size: 12pt, body),
)

// Подзаголовок (чёрный на светло-фиолетовом): заголовок под sectionTitle
#let subsectionTitle(body) = block(
    fill: color-section-bg,
    inset: (x: 10pt, y: 5pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-body, weight: "bold", size: 11pt, body),
)

// Метка колонки/строки таблицы в сером стиле
#let greyLabel(body) = text(
    fill: color-grey-title,
    weight: "bold",
    size: 10pt,
    body,
)

// Обёртка страницы: колонтитул с логотипом, футер — номер страницы
// + код документа (LD-2.16 v7).
#let document(doc-code: "", doc) = {
    set page(
        paper: "a4",
        margin: (
            top: 2.6cm,
            bottom: 2cm,
            left: page-margin-x,
            right: page-margin-x,
        ),
        header: pad(top: 0.4cm, image("logo_plazo.png", width: 3.4cm)),
        footer: [
            #set text(size: footer-size, fill: color-grey-title)
            #doc-code
            #h(1fr)
            #context counter(page).display("1")
        ],
    )
    set text(
        font: body-font,
        size: body-size,
        lang: "es",
        hyphenate: false,
        fill: color-body,
    )
    set par(justify: false, leading: 0.85em, spacing: .7em)

    // Общий стиль таблиц: тонкая серая рамка, левое выравнивание.
    // Заливку строки-заголовка задаём в каждой таблице явно (не всегда
    // подходит цвет по умолчанию — где-то фиолетовый, где-то серый).
    set table(
        stroke: 0.5pt + color-border,
        inset: 6pt,
        align: horizon + left,
    )

    show link: set text(fill: color-title)

    doc
}
