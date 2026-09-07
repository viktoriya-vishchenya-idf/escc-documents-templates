#import "../common/default_styles.typ": (
    sectionTitle, color-title, color-body,
)

// Section 4 — DEFINICIONES DE LOS CONCEPTOS DEL RESUMEN DEL MES (LD-2.16 v7).
// Статичный испанский текст: пояснения к каждому концепту из RESUMEN DEL MES
// плюс образовательный абзац «Por qué la deuda revolving puede no bajar».
// Данных с бэкенда здесь нет — это часть дизайна документа.
#let definiciones() = [
    #sectionTitle[4  DEFINICIONES DE LOS CONCEPTOS DEL RESUMEN DEL MES]
    #v(0.4em)

    #let concept(title, body) = [
        #text(weight: "bold", fill: color-title)[#title]
        #v(0.1em)
        #text(fill: color-body)[#body]
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
    #concept(
        "Por qué la deuda revolving puede no bajar",
        [El orden de aplicación de la cuota explica el principal riesgo de este producto. Como cada pago cubre primero intereses y comisiones, y solo después amortiza capital, una cuota baja frente a un saldo elevado reduce poco la deuda.],
    )
]
