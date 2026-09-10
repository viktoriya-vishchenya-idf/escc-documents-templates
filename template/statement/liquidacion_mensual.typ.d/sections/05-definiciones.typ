#import "../common/default_styles.typ": (
    color-title, color-section-bg, color-body, color-secondary,
)
#import "../common/table_styles.typ": numbered-section-title

// Section 4 — DEFINICIONES DE LOS CONCEPTOS DEL RESUMEN DEL MES
// (LD-2.16 v7, TZ §12/§13).
// Список 8 определений: title — Inter 11.5pt/700/#0F0F0F, body — Inter
// 11pt/400/#3A4150 (TZ §13 "Same" в колонке Typography: 11.5/700 title +
// 11/400 body). Разделитель между записями — 0.5em вертикально.
#let definiciones() = [
    #numbered-section-title("4", "Definiciones de los conceptos del resumen del mes")
    #v(0.4em)

    #let concept(title, body) = [
        #text(fill: color-body, weight: "bold", size: 11.5pt)[#title]
        #v(0.15em)
        #text(fill: color-secondary, size: 11pt)[#body]
        #v(0.5em)
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
]

// Final warning block (TZ §14). Отдельная секция ниже definiciones,
// не входит в нумерованные разделы. Плашка на светло-фиолетовой заливке
// #EFE9FB (TZ §16 "LIGHT_PURPLE ... Final balance / warning"), heading
// 11.5pt/700/#5B3FA8, body 11pt/400/#5B3FA8.
#let advertencia-revolving() = block(
    fill: color-section-bg,
    inset: (x: 12pt, y: 10pt),
    radius: 3pt,
    width: 100%,
    [
        #text(fill: color-title, weight: "bold", size: 11.5pt)[
            Por qué la deuda revolving puede no bajar
        ]

        #v(0.3em)
        #text(fill: color-title, size: 11pt)[
            El orden de aplicación de la cuota explica el principal riesgo de este producto.
            Como cada pago cubre primero intereses y comisiones, y solo después amortiza
            capital, una cuota baja frente a un saldo elevado reduce poco la deuda.
        ]
    ],
)
