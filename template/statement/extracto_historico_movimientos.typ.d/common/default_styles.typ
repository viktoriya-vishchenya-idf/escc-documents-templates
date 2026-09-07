// Палитра и типографика LD-2.39 v4 — извлечено из DOCX-исходника
// (ExtractoHistoricoMovimientosPLAZO.docx):
//   акцентный фиолетовый текст            #5B3FA8
//   акцентный фиолетовый фон              #CFBDFA
//   светло-фиолетовый фон                 #EFE9FB
//   грey метки колонок                    #6B7280
//   светло-серый фон ячеек                #F1F5F9
//   почти-белый фон карточек              #FBFCFE
//   рамки таблиц                          #E6EAF0
//   тело / основной текст                 #0F0F0F
//   вторичный тёмно-серый (подзаголовок)  #3A4150

#let page-margin-x = 1.5cm
#let footer-size = 8pt
// Word использует Segoe UI в inline runs, Inter в docDefaults. Ставим
// цепочку с системными фолбэками — на любой машине найдётся один из.
#let body-font = ("Segoe UI", "Inter", "Helvetica")
#let body-size = 11pt
#let body-header-size = 20pt

#let color-title = rgb("#5B3FA8")
#let color-title-bg = rgb("#CFBDFA")
#let color-section-bg = rgb("#EFE9FB")
#let color-grey-title = rgb("#6B7280")
#let color-grey-bg = rgb("#F1F5F9")
#let color-cell-bg = rgb("#FBFCFE")
#let color-border = rgb("#E6EAF0")
#let color-body = rgb("#0F0F0F")
#let color-secondary = rgb("#3A4150")

// Плашка-заголовок раздела (фиолетовая): текст #5B3FA8 на #CFBDFA.
// Используется как REVOLVING-баннер, а не как компаундный номерной
// заголовок — для последнего есть numbered-section-title в table_styles.typ.
#let sectionTitle(body) = block(
    fill: color-title-bg,
    inset: (x: 10pt, y: 8pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-title, weight: "bold", size: 13pt, body),
)

// Метка колонки/строки таблицы в сером стиле (LD-2.39 v4: 8pt caps
// tracking 1.2pt).
#let greyLabel(body) = text(
    fill: color-grey-title,
    weight: "bold",
    size: 8pt,
    tracking: 1.2pt,
    upper(body),
)

// Обёртка страницы: колонтитул с логотипом, футер — номер страницы
// + код документа (LD-2.39 v4). Отступы 1.5см со всех сторон — как в DOCX.
#let document(doc-code: "", doc) = {
    set page(
        paper: "a4",
        margin: 1.5cm,
        header: pad(top: 0.3cm, image("logo_plazo.png", width: 3.4cm)),
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

    // Общий стиль таблиц: тонкая рамка #E6EAF0, левое выравнивание.
    // Отдельные таблицы (шапка, resumen) переопределяют stroke: none
    // и рисуют только верх/низ вручную, если требуется по дизайну.
    set table(
        stroke: 0.5pt + color-border,
        inset: 6pt,
        align: horizon + left,
    )

    show link: set text(fill: color-title)

    doc
}