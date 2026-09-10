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
// TZ §11: Footer — Inter ≈11pt / 400 / #000000 centered.
#let footer-size = 11pt
// Шрифт: Helvetica (бандл — Helvetica*.ttf в этой .typ.d/ папке).
// Исходный `ExtractoHistoricoMovimientosPLAZO.docx` рендерится в
// Segoe UI, но Segoe UI — проприетарный шрифт Microsoft, недоступен
// в Linux-контейнере doc-generator. Не тянем Segoe UI, чтобы не
// получать warning `unknown font family: segoe ui` при рендере на
// сервере. Визуально PDF остаётся sans-serif (близко к Segoe UI по
// пропорциям) — trade-off согласован (CRDES-45111, 2026-09-10).
#let body-font = ("Helvetica")
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
// Тех.спец §1 / §2: Credit bar — Inter 13pt/700/#5B3FA8 fill #CFBDFA.
// Используется как первичный REVOLVING-баннер под заголовком.
// Компаундный номерной заголовок — см. numbered-section-title в table_styles.typ.
#let sectionTitle(body) = block(
    fill: color-title-bg,
    inset: (x: 10pt, y: 8pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-title, weight: "bold", size: 13pt, body),
)

// Метка колонки/строки таблицы в сером стиле.
// Тех.спец §1 / §3: card labels — Inter 8pt/700/#6B7280 uppercase, tracking 24
// (OOXML twips → typst pt: 24/20 = 1.2pt). Table headers используют tracking 20
// (=1pt) — устанавливается инлайн в конкретной секции.
#let greyLabel(body) = text(
    fill: color-grey-title,
    weight: "bold",
    size: 8pt,
    tracking: 1.2pt,
    upper(body),
)

// Обёртка страницы: поля 1.5см со всех сторон (TZ §0).
// Логотип "plazo" рендерится ИНЛАЙН в теле первой страницы (внутри
// cabecera), а не через page.header — чтобы страницы 2/3 не повторяли
// его (per user 2026-09-09: "Logo PLAZO should be only on first page").
// Футер — корпоративная строка контактов, центрированная, на всех
// страницах (TZ §11).
#let document(doc-code: "", doc) = {
    set page(
        paper: "a4",
        margin: 1.5cm,
        footer: align(center)[
            #set text(size: footer-size, fill: rgb("#000000"))
            IDFinance Plazo, S.L.U. · C/ Tuset 5, 3º, 08006 Barcelona · clientes\@plazo.es · 93 522 26 26 / 900 533 861
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