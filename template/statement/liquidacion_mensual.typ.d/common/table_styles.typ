#import "default_styles.typ": (
    color-title,
    color-title-bg,
    color-section-bg,
    color-grey-title,
    color-grey-bg,
    color-cell-bg,
    color-border,
    color-body,
    body-size,
)

#let numbered-section-title(num, title) = block(
    width: 100%,
    table(
        columns: (5%, 95%),
        stroke: none,
        inset: 0pt,
        table.cell(fill: color-title-bg, inset: 8pt, align: center + horizon)[
            #text(fill: color-title, weight: "bold", size: 13pt)[#num]
        ],
        table.cell(inset: (x: 10pt, y: 8pt), align: horizon + left)[
            #text(fill: color-body, weight: "bold", size: 13pt, tracking: 1pt)[
                #upper(title)
            ]
        ],
    ),
)

#let kv-row(label, value) = (
    table.cell(fill: color-grey-bg)[
        #text(fill: color-grey-title, weight: "bold", size: 10pt, label)
    ],
    table.cell()[
        #text(weight: "bold", size: 11pt, value)
    ],
)

#let summary-row(label, value) = (
    table.cell(fill: color-section-bg)[
        #text(weight: "bold", size: 11pt, label)
    ],
    table.cell(align: right)[
        #text(weight: "bold", size: 11pt, value)
    ],
)

#let summary-total-row(label, value) = (
    table.cell(fill: color-title-bg)[
        #text(fill: color-title, weight: "bold", size: 12pt, label)
    ],
    table.cell(fill: color-title-bg, align: right)[
        #text(fill: color-title, weight: "bold", size: 12pt, value)
    ],
)
