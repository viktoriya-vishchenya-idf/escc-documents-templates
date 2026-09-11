#let page-margin-x = 1.5cm
#let footer-size = 8pt
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

#let sectionTitle(body) = block(
    fill: color-title-bg,
    inset: (x: 10pt, y: 8pt),
    radius: 3pt,
    width: 100%,
    text(fill: color-title, weight: "bold", size: 13pt, body),
)

#let greyLabel(body) = text(
    fill: color-grey-title,
    weight: "bold",
    size: 8pt,
    tracking: 1.2pt,
    upper(body),
)

#let document(doc-code: "", doc) = {
    set page(
        paper: "a4",
        margin: 1.5cm,
        footer: align(center)[
            #set text(size: footer-size, fill: color-grey-title)
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

    set table(
        stroke: 0.5pt + color-border,
        inset: 6pt,
        align: horizon + left,
    )

    show link: set text(fill: color-title)

    doc
}
