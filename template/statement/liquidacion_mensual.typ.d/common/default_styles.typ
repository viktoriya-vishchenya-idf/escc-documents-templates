// Палитра и типографика LD-2.16 v7 / TZ_LiquidacionMensualPlazo.docx —
// извлечено из исходного DOCX (LiquidacionMensualPlazo.docx) и TZ §16:
//   BLACK_PRIMARY  #0F0F0F  headings / values
//   BLACK          #000000  footer
//   TEXT_SECONDARY #3A4150  descriptions / period subtitle
//   LABEL_GRAY     #6B7280  labels / table headers
//   BRAND_PURPLE   #5B3FA8  purple text (numbers, credit bar text, negative payments)
//   PURPLE_FILL    #CFBDFA  section numbers / credit bar background
//   LIGHT_PURPLE   #EFE9FB  final balance / warning block fill
//   TABLE_HEADER   #F1F5F9  summary/movements header + total row fill
//   CARD_BG        #FBFCFE  client / status cards fill
//   BORDER         #E6EAF0  horizontal borders

#let page-margin-x = 1.5cm
// TZ §15: Footer — Inter ≈11pt / 400 / #000000 centered.
#let footer-size = 11pt
// Шрифт: реальный `LiquidacionMensualPlazo.docx` рендерит 100% run-ов
// в Cambria (word/document.xml, 133 из 133 w:rFonts w:ascii="Cambria"),
// хотя TZ §0/§1 указывает Inter. Следуем DOCX как источнику истины
// (см. memory feedback-docx-over-tz). Cambria доступна системно на
// Windows и в бандле Office/LibreOffice; Helvetica — локальный фолбэк
// из этой .typ.d/ папки.
#let body-font = ("Cambria", "Helvetica")
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
// TZ §2 Credit bar — Inter 13pt/700/#5B3FA8 fill #CFBDFA.
// Используется как REVOLVING-баннер под подзаголовком периода.
// Компаундный номерной заголовок разделов — см. numbered-section-title
// в table_styles.typ.
#let sectionTitle(body) = block(
    fill: color-title-bg,
    inset: (x: 10pt, y: 8pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-title, weight: "bold", size: 13pt, body),
)

// Метка колонки/строки таблицы в сером стиле.
// TZ §1/§3: labels — Inter 8pt/700/#6B7280 uppercase, tracking 24 twips
// (OOXML twips → typst pt: 24/20 = 1.2pt).
#let greyLabel(body) = text(
    fill: color-grey-title,
    weight: "bold",
    size: 8pt,
    tracking: 1.2pt,
    upper(body),
)

// Обёртка страницы: поля 1.5см со всех сторон (TZ §0).
// Логотип "plazo" рендерится ИНЛАЙН в теле первой страницы (внутри
// cabecera), а не через page.header — чтобы страницы 2/... не повторяли
// его. Футер — корпоративная строка контактов, центрированная, на всех
// страницах (TZ §15).
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
    // Отдельные секции переопределяют stroke: none и рисуют только
    // горизонтальные линии, где TZ этого требует (§10/§19).
    set table(
        stroke: 0.5pt + color-border,
        inset: 6pt,
        align: horizon + left,
    )

    show link: set text(fill: color-title)

    doc
}
