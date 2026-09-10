#import "../common/default_styles.typ": clause-list, section-bold-h1
#import "../common/table_styles.typ": boxed-doc-table

#let clause-04-descripcion-caracteristicas-principales(vars) = [
    #section-bold-h1[4\. Descripción de las características principales del producto
    ofrecido]

    #clause-list(4)[
    + El producto financiero ofrecido por el Prestamista a través del
      presente #strong[Contrato es una] #underline[#strong[línea de crédito]]
      #strong[con modalidad de pago tipo]
      #emph[#underline[#strong[revolving]]]#underline[#strong[.]]
    ]

    El #strong[crédito revolving] es un crédito al consumo #underline[con
    interés], de duración #underline[indefinida] concedido a personas físicas,
    en el que el crédito dispuesto no se satisface en su totalidad al final del
    período de liquidación pactado.

    El Prestatario puede disponer hasta el límite del crédito concedido sin
    tener que pagar la totalidad de lo dispuesto en un plazo determinado, sino
    que #underline[reembolsa el crédito dispuesto de forma aplazada] sin una
    duración determinada, mediante el #underline[pago de cuotas periódicas] cuyo
    importe puede consistir en #underline[una cantidad fija] #underline[o] en un
    #underline[porcentaje de la cantidad dispuesta.]

    El #underline[crédito disponible se repone,] fundamentalmente con la parte
    de las cuotas destinada a la amortización del capital y que el prestatario
    paga periódicamente. Por tanto, el crédito se renueva de manera automática
    en el vencimiento de cada cuota (mensual) por lo que es #strong[un]
    #underline[#strong[crédito rotativo o revolvente]]#underline[.]

    La principal característica de los créditos revolventes es el
    establecimiento de un Límite de Línea de Crédito cuyo disponible coincide
    inicialmente con dicho límite (“Importe Actual”), que disminuye según se
    realizan cargos (compras, disposiciones por transferencia, liquidaciones de
    intereses y gastos u otros) y se repone con abonos (pago de los recibos
    periódicos, devoluciones de compras, etc.). Por tanto, las cuantías de las
    cuotas que el Prestatario abona de forma periódica vuelven a formar parte
    del crédito disponible del mismo.

    #boxed-doc-table(
      columns: (100.00%),
      // row 0
      table.cell()[
        #underline[#strong[Ejemplo representativo 1 del funcionamiento de un crédito
        revolving:]] para una línea de crédito con un límite de Crédito disponible
        de 1.500€, en el que, en una primera disposición se utilizan 500€ de esos
        1.500€ disponibles.

        El #underline[primer mes] (30 días) se amortiza mediante un Pago Mínimo
        cuota mensual (al final de la fecha de liquidación) de 18,32€ \[compuesto
        por 9,25€ (1,85% de 500€ que es el principal dispuesto) + 9,07€ de intereses
        devengados\].

        Al mes siguiente, el Prestatario tendrá un saldo disponible de 1.009.25€ y
        un saldo pendiente de pago de 490,75€.

        En el #underline[segundo mes] el Prestatario realiza una nueva disposición
        de otros 500€, por lo que habrá dispuesto de 990,75€ a amortizar con el Pago
        Mínimo mensual (al final de la fecha de liquidación) de 36,29€ \[compuesto
        por 18,33€ (1,85% de 990,75€ que es el principal dispuesto) + 17,96€ de
        intereses devengados\].

        Así, el capital amortizado el segundo mes es 18,33€ y el saldo pendiente de
        amortizar es 972,42~€, siendo el capital disponible al mes siguiente de la
        línea de crédito es 527,58€.
      ],
    )

    #linebreak()
    #boxed-doc-table(
      columns: (100.00%),
      // row 0
      table.cell()[
        #underline[#strong[Ejemplo representativo 2 del funcionamiento de un crédito
        revolving:]] para una línea de crédito con un límite de Crédito disponible
        (saldo disponible) de 1.500€, en el que, en una primera disposición se
        utilizan 500€ de esos 1.500€ disponibles.

        El #underline[primer mes] (30 días) se amortiza mediante un Pago Mínimo
        cuota mensual (al final de la fecha de liquidación) de 18,32€ \[compuesto
        por 9,25€ (1,85% de 500€ que es el principal dispuesto) + 9,07€ de intereses
        devengados\].

        Al mes siguiente, el Prestatario tendrá un saldo disponible de 1.009.25€ y
        un saldo pendiente de pago (saldo utilizado) de 490,75€.

        En el #underline[segundo mes] (30 días) el Prestatario realiza una nueva
        disposición de otros 500€, por lo que habrá dispuesto de 990,75€ a amortizar
        con el Pago Mínimo mensual (al final de la fecha de liquidación) de 36,29€
        \[compuesto por 18,32€ (1,85% de 990,75€ que es el principal dispuesto) +
        17,96€ de intereses devengados\].

        #underline[Sin embargo, no procede al pago del Pago Mínimo], por lo que se
        inicia el proceso de reclamación por saldos impagados, repercutiendo el
        coste de dicha gestión al Prestatario, por valor de 30€.

        Así, el #underline[segundo mes no se amortiza capital] por lo que el saldo
        pendiente asciende a 1.038,72~€ (compuesto por 990,75 € de Capital
        acumulado; 17,96 € de Intereses devengados y 30€ de gastos por reclamación
        de impagados.

        Posteriormente, se realiza el pago (atrasado) del Pago mínimo de 66,29€
        (compuesto por la cuota mínima (amortiza capital) + 30€ por gastos de
        reclamación de impagados que no se incluyen en el capital), por lo que el
        saldo pendiente pasa a ser de 972,43€ y procede a hacer una nueva
        disposición de 500€.

        El Pago Mínimo ese mes será de 53,94~€ (compuesto por la amortización del
        capital dispuesto 1.472,43×1,85%=27,24€ + los intereses devengados
        1.472,43×0,01808=26,70€) siendo el capital pendiente de pago de 1.445,19~€
      ],
    )

    #linebreak()
]
