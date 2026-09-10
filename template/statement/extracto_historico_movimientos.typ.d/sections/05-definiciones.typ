#import "../common/default_styles.typ": (
    color-title, color-body, color-secondary, color-section-bg,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 4 — DEFINICIONES DE LOS CONCEPTOS + final warning block.
// TZ_ExtractoHistoricoMovimientosPLAZO §8 / §9 / §10:
//   Definitions: 8 items, ЯВНЫЙ font override "Segoe UI" (не Inter).
//     Title: Segoe UI 11.5pt/700/#0F0F0F (не фиолетовый — TZ §1).
//     Body:  Segoe UI 11pt/400/#3A4150.
//   Warning block ("Por qué la deuda revolving puede no bajar"):
//     Отдельный блок ПОСЛЕ definitions, fill #EFE9FB (color-section-bg).
//     Heading: Inter 11.5pt/700/#5B3FA8.
//     Body:    Inter 11pt/400/#5B3FA8.
//     Continuous visual block (heading + body в одном block).
#let definiciones() = [
    #numbered-section-title("4", "DEFINICIONES DE LOS CONCEPTOS")
    #v(0.5em)

    // Definitions block — использует общий шрифт документа (Helvetica),
    // не переопределяем на Segoe UI: Segoe UI недоступен в Linux
    // контейнере doc-generator и вызывает warning.
    #set text(font: ("Helvetica"))

    #let concept(title, body) = [
        #text(weight: "bold", fill: color-body, size: 11.5pt)[#title]
        #v(0.1em)
        #text(fill: color-secondary, size: 11pt)[#body]
        #v(0.6em)
    ]

    #concept(
        "Saldo dispuesto (inicial / final)",
        [Parte del límite de crédito consumida y aún no devuelta. El inicial abre el periodo; el final lo cierra y es la deuda viva.],
    )
    #concept(
        "Disposiciones del periodo",
        [Operaciones que aumentan la deuda: compras en comercios y retiradas de efectivo cargadas al crédito.],
    )
    #concept(
        "Intereses devengados",
        [Coste financiero generado por mantener saldo dispuesto durante el periodo. «Devengado» significa generado o acumulado en ese tramo.],
    )
    #concept(
        "Comisiones del periodo",
        [Cargos distintos del interés: Comisión por reclamación de cuotas impagadas u otras pactadas en el contrato.],
    )
    #concept(
        "Pagos realizados",
        [Abonos efectuados por el titular. Se aplican primero a comisiones, intereses y, después, a amortizar capital.],
    )
    #concept(
        "Modalidad revolving",
        [Pago aplazado en el que el capital amortizado vuelve a quedar disponible dentro del límite y los intereses se recalculan sobre el saldo pendiente en cada periodo.],
    )
    #concept(
        "Límite de crédito concedido",
        [Importe máximo del que el titular puede disponer en la línea revolving según el contrato. Es el techo del crédito: la suma del crédito dispuesto y del crédito disponible nunca lo supera.],
    )
    #concept(
        "Crédito disponible",
        [Parte del límite que aún no está dispuesta y que el titular puede seguir utilizando. Equivale al límite de crédito concedido menos el saldo dispuesto; en el revolving vuelve a aumentar a medida que se amortiza capital.],
    )

    // Warning block — separate from definitions per TZ §10.
    // Шрифт — дефолтный документа (Helvetica); фон #EFE9FB, весь
    // текст #5B3FA8.
    #v(0.4em)
    #set text(font: ("Helvetica"))
    #block(
        fill: color-section-bg,
        inset: (x: 12pt, y: 12pt),
        radius: 3pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold", size: 11.5pt)[Por qué la deuda revolving puede no bajar]

        #v(0.4em)
        #text(fill: color-title, size: 11pt)[
            El orden de aplicación de la cuota explica el principal riesgo de este producto. Como cada pago cubre primero intereses y comisiones, y solo después amortiza capital, una cuota baja frente a un saldo elevado reduce poco la deuda.
        ]
    ]
]
