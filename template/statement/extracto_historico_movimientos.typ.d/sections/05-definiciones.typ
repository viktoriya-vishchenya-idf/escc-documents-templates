#import "../common/default_styles.typ": (
    color-title, color-body, color-secondary, color-section-bg,
)
#import "../common/table_styles.typ": numbered-section-title

#let definiciones() = [
    #numbered-section-title("4", "DEFINICIONES DE LOS CONCEPTOS")
    #v(0.5em)

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
