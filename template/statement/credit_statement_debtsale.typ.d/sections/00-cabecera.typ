#import "../common/default_styles.typ": (
    color-title, color-title-bg, color-section-bg,
    color-grey-title, color-grey-bg, body-header-size,
)

// Шапка накопительной выписки: заголовок + блок сведений об эмитенте
// (COMPANY_INFO). Строки эмитента отрисовываются только если непустые
// (LD-3.11: с CRDES-45111 companyInfo может быть скрыто целиком).
#let cabecera(vars) = [
    #block(
        fill: color-title-bg,
        inset: (x: 12pt, y: 10pt),
        radius: 4pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold", size: body-header-size)[
            Extracto Histórico de Movimientos
        ]

        #v(0.2em)
        #text(fill: color-title, size: 10pt)[
            Fecha de emisión: #vars.ISSUE_DATE
        ]
    ]

    // Блок с реквизитами компании — только если хоть одно поле не none.
    #if vars.COMPANY_NAME != none or vars.COMPANY_CIF != none [
        #v(0.4em)
        #block(
            fill: color-grey-bg,
            inset: (x: 10pt, y: 8pt),
            radius: 3pt,
            width: 100%,
        )[
            #if vars.COMPANY_NAME != none [
                #text(fill: color-grey-title, weight: "bold", size: 10pt)[
                    #vars.COMPANY_NAME
                ]#linebreak()
            ]
            #if vars.COMPANY_ADDRESS != none [
                #text(fill: color-grey-title, size: 10pt)[
                    #vars.COMPANY_ADDRESS
                ]#linebreak()
            ]
            #if vars.COMPANY_CIF != none [
                #text(fill: color-grey-title, size: 10pt)[
                    CIF: #vars.COMPANY_CIF
                ]
            ]
        ]
    ]
]
