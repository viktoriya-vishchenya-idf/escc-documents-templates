// Оформление документа «Condiciones del contrato de línea de crédito».
// Отличия от преконтракта (precontract_*.typ.d/common/default_styles.typ):
// поля 2,54 см со всех сторон, свой логотип (plazo credit) и подвал из
// двух строк — код документа с номером страницы и юридическая строка.
#let page-margin = 3cm
#let page-margin-left-right = 2.45cm
#let footer-size = 10pt
#let footer-legal-fill = rgb("#808080")
#let body-font = "Helvetica"
#let body-size = 13pt
#let section-size = 15pt
#let accent-blue = rgb("#0070C0")
#let table-header-fill = rgb("#C0C0C0")
#let box-fill = rgb("#E7E6E6")
// Высота пустой строки (#linebreak()) при 13pt и leading 0.98em —
// замерено по PDF: 22,1 pt = 1,7em. Отбивка строк таблицы друг от друга.
#let header-gap = 1.7em
// Отступ самой серой шапки от верхней границы таблицы.
#let header-pad = 0.9em
// Отступ текста ячейки от верхней и нижней границы — там, где
// раньше внутри ячеек стояли #linebreak() ради воздуха.
#let cell-pad-y = 1.4em
#let highlight-fill = rgb("#C0C0C0")

#let marked(fill: highlight-fill, body) = highlight(
    fill: fill,
    top-edge: "ascender",
    bottom-edge: "descender",
    body,
)

// Заголовок раздела: 15pt, полужирный. Вес задаётся здесь, поэтому в
// body.typ текст заголовка идёт без *…*.
#let section-bold-h1(body) = {
    block(above: 0.9em, below: 1.4em)[
        #set text(size: section-size, weight: "bold")
        #body
    ]
}

#let section-bold(body) = {
    block(above: 0.9em, below: 1.4em)[
        #set text(weight: "bold")
        #body
    ]
}

#let section(body) = {
    block(above: 0.9em, below: 1.4em)[
        #body
    ]
}

#let section-center(body) = align(center, section-bold-h1(body))

// Списки Word: «•» и «-» как маркеры, отступ как в исходнике.
#let bullet-list(body) = {
    set list(marker: [•], indent: 0.6em)
    body
}

#let dash-list(body) = {
    set list(marker: [\-], indent: 0.6em)
    body
}

// Список фаз взыскания: маркер «FASE n:» и текст пункта попадают в ОДНУ
// серую подсветку, поэтому marked навешивается на маркер вместе с телом.
// Своё show-правило нужно ещё и затем, чтобы внешний clause-list не
// перехватил эти пункты и не пронумеровал их как 10.x.
#let fase-list(body) = {
    let c = counter("fase-list")
    c.update(0)
    show enum.item: it => {
        c.step()
        // inset слева — та же отбивка 0,6em, что у dash-list/bullet-list,
        // чтобы список не прилипал к полю страницы
        block(spacing: 1.4em, inset: (left: 1.4em))[
            #marked[#context c.display(n => [FASE #{str(n)}:]) #it.body]
        ]
    }
    body
}

// Список вида «1.-», «2.-», … (порядок зачёта платежей). Как и в fase-list,
// маркер и текст пункта попадают в ОДНУ серую подсветку, а собственное
// show-правило не даёт внешнему clause-list перехватить эти пункты.
#let num-dash-list(body) = {
    let c = counter("num-dash-list")
    c.update(0)
    show enum.item: it => {
        c.step()
        block(spacing: 1.4em, inset: (left: 1.4em))[
            #marked[#context c.display(n => [#{str(n)}.-]) #it.body]
        ]
    }
    body
}

// Вложенный список «a.», «b.», … Маркер вынесен в колонку grid, поэтому
// перенос строки идёт под текстом. Своё show-правило — по той же причине,
// что и у fase-list: иначе пункты перехватит внешний clause-list.
#let alpha-list(body) = {
    let c = counter("alpha-list")
    c.update(0)
    show enum.item: it => {
        c.step()
        block(spacing: 1.4em, grid(
            columns: (1.5em, 1fr),
            [#context c.display(n => numbering("a.", n))],
            it.body,
        ))
    }
    body
}

// Нумерованный список «1)», «2)», … Раньше такие списки были раскладочными
// таблицами (7,81% / 92,19%), но отступы колонок там были слишком широкие:
// список отбивается от левого поля на indent, а зазор между номером и
// текстом задаёт body-indent. Перенос строки — под текстом.
#let paren-list(body) = {
    set enum(numbering: "1)", indent: 1.5em, body-indent: 0.5em)
    body
}

// Списки с маркером в скобках: «a)», «b)» … и «i)», «ii)» …
//
// Каждый вариант ставит СВОЁ show-правило на enum.item, и это обязательно:
// такие списки лежат внутри clause-list, а его show-правило иначе перехватит
// их пункты и пронумерует как N.M. Правило, объявленное внутри, перебивает
// внешнее — проверено на пробнике.
//
// Маркер вынесен в колонку grid, поэтому перенос строки идёт под текстом.
// slot задаётся отдельно: «vii)» шире «a)» (11,56 pt по замеру PDF).
#let marker-paren-list(name, pattern, start: 1, slot: 18pt, bold: false,
                       body) = {
    let c = counter(name)
    c.update(start - 1)
    show enum.item: it => {
        c.step()
        let marker = context c.display(n => numbering(pattern, n))
        block(spacing: 1.4em, inset: (left: 0.5em), grid(
            columns: (slot, 1fr),
            if bold { strong(marker) } else { marker },
            it.body,
        ))
    }
    body
}

// «a)», «b)» … start — с какого номера продолжать: в .docx после «y)» идёт
// сразу «aa)» (буква «z» пропущена), а numbering("a)") выдаёт «aa)» на 27-м
// номере, поэтому хвост списка в разделе 12 — отдельный вызов с start: 27.
// slot по умолчанию 18pt хватает на «a)»…«z)»; для более широких маркеров
// («aa)» — 16,4 pt) его надо расширить в месте вызова, иначе текст прилипнет
// к маркеру.
#let alpha-paren-list(start: 1, slot: 18pt, body) = marker-paren-list(
    "alpha-paren-list", "a)", start: start, slot: slot, body)

// То же, но маркер полужирный — под пункты, текст которых целиком в #strong.
#let alpha-paren-bold-list(start: 1, slot: 18pt, body) = marker-paren-list(
    "alpha-paren-bold-list", "a)", start: start, slot: slot, bold: true, body)

// «i)», «ii)», … Слот шире: «vii)» не влезает в ширину «a)».
#let roman-paren-list(start: 1, slot: 24pt, body) = marker-paren-list(
    "roman-paren-list", "i)", start: start, slot: slot, body)

// «i.», «ii.», … — вариант с точкой вместо скобки. Слот ещё шире: «viii.»
// длиннее «vii)».
#let roman-dot-list(start: 1, slot: 30pt, body) = marker-paren-list(
    "roman-dot-list", "i.", start: start, slot: slot, body)

// Список подпунктов вида «4.1.», «4.2.», … Номер раздела приходит
// параметром, потому что каждый раздел лежит в своём файле и сквозного
// счётчика между файлами нет: #clause-list(4)[ + … + … ].
// Номер — часть абзаца, а НЕ отдельная колонка enum, поэтому перенос
// строки идёт ровно под номером (как faseNumericList в преконтракте).
// Отступ между пунктами равен межабзацной отбивке.
#let clause-counter = counter("clause-list")

// start — с какого подпункта продолжать, если список разорван таблицей
// или безномерным абзацем: #clause-list(9, start: 5)[ … ].
#let clause-list(section, start: 1, body) = {
    clause-counter.update(start - 1)
    show enum.item: it => block(spacing: 1.4em)[
        #clause-counter.step()
        #context clause-counter.display(n => [#{str(section)}.#{str(n)}.])
        #it.body
    ]
    body
}

// Список с маркером-градусом (1º, 2º, 3º…). Пункты этого списка лежат в
// РАЗНЫХ ячейках таблицы, поэтому обычным list/enum его не собрать:
// нумерация ведётся счётчиком, который продолжается из ячейки в ячейку.
// Применение: #deg-reset() перед таблицей, затем #deg-item[…] в каждой
// ячейке. Маркер вынесен в отдельную колонку grid, поэтому перенос строки
// идёт под текстом, а не под номером.
#let deg-counter = counter("deg-list")

#let deg-reset() = deg-counter.update(0)

#let deg-item(body) = {
    deg-counter.step()
    grid(
        columns: (1.5em, 1fr),
        // строка собирается в коде, иначе между номером и «º» встанет пробел
        [#context deg-counter.display(n => [#{str(n) + "º"}])],
        body,
    )
}

#let document(doc-code: "", legal: "", doc) = {
    set page(
        paper: "a4",
        margin: (
            top: page-margin,
            bottom: page-margin,
            left: page-margin-left-right,
            right: page-margin-left-right,
        ),
        header: pad(top: 0.4cm, image("logo_plazo_credit.png", width: 3.4cm)),
        footer: [
            #set text(size: footer-size)
            // Номер страницы центрируется по ширине страницы, а не по
            // остатку строки, поэтому код документа выводится вне потока
            // через place — иначе его ширина сдвигала бы номер вправо.
            #place(left)[#doc-code]
            #align(center)[#context counter(page).display("1")]

            #set text(size: footer-size, weight: "bold",
                      fill: footer-legal-fill)
            #legal
        ],
    )
    // hyphenate: false — слова не дробятся переносом по слогам;
    // justify: false — рваный правый край, как в исходном .docx.
    set text(font: body-font, size: body-size, lang: "es", hyphenate: false)
    // Кавычки в .docx уже проставлены вручную («…» и “…”), поэтому
    // автозамена прямых кавычек выключена — иначе "…" станет «…».
    set smartquote(enabled: false)
    // spacing — отбивка между абзацами; leading — внутри абзаца.
    set par(justify: false, leading: 0.98em, spacing: 1.4em)

    set list(spacing: 1.3em, indent: 0.3em)
    set enum(spacing: 1.3em, indent: 0.3em)

    // Рамки таблиц задаёт каждая таблица сама (см. doc-table): в исходном
    // документе часть таблиц вовсе без линий, часть — только с внешними.
    set table(inset: 5pt, align: left, stroke: none)

    show figure: set block(breakable: true, above: 1em, below: 1em)

    show link: set text(fill: accent-blue)

    doc
}
