#import "../common/default_styles.typ": box-fill, marked, paren-list, section-bold-h1, dash-list
#import "../common/table_styles.typ": boxed-doc-table, doc-table

#let clause-07-tasa-anual-equivalente(vars) = [
    #section-bold-h1[7\. Tasa Anual Equivalente]

    Se entiende por Tasa Anual Equivalente (TAE) #underline[el coste total de la
    Línea de Crédito, expresado en un porcentaje anual sobre la cuantía de la
    financiación concedida.]

    #linebreak()
    El cálculo de la Tasa Anual Equivalente (T.A.E.) correspondiente al Contrato
    comprende el Tipo de Interés Nominal, así como las comisiones y gastos
    aplicables y está realizado de acuerdo con la fórmula contenida en el Anexo
    I de la Ley 16/2011, de 24 de junio, de Contratos de Crédito al Consumo y
    teniendo en cuenta:

    #paren-list[
    + Todos los gastos, comisiones e intereses conocidos por el Prestamista que
      debe pagar el Prestatario en el momento de formalización del Contrato de
      línea de Crédito según la modalidad de pago que haya elegido.

    + Que el Contrato de línea de Crédito se mantiene vigente durante el plazo
      pactado.

    + Que se cumplen las obligaciones de pago, no incluyéndose penalizaciones e
      indemnizaciones.
    ]

    #linebreak()
    La ecuación de base, que define la tasa anual equivalente (TAE), es la
    siguiente:

    #align(center)[#strong[#marked[TAE=(1+i/n)^n-1]]]

    Donde:

    #dash-list[
    - i es el Tipo de Interés Nominal aplicado (TIN)

    - n es la frecuencia de los pagos
    ]

    #strong[Advertencia: #underline[Una TAE elevada implica un mayor coste final
    para el Prestatario, donde el interés puede inflar significativamente la
    cuantía a devolver.]]

    #boxed-doc-table(
      columns: (100.00%),
      // row 0
      table.cell(fill: box-fill)[
        #strong[Ejemplo representativo 1:]

        Supuesto de Límite de Crédito de #underline[1500 EUR] dispuesto en su
        totalidad en una única disposición (sin más disposiciones) el mismo día que
        contrata la Línea de Crédito (por ejemplo, 01/01/2025 ), al tipo de interés
        nominal fijo anual #underline[(TIN)] del #vars.TIN% y tasa anual equivalente
        #underline[(TAE)] de #vars.TAE%; con una cuota mensual de #underline[pago
        mínimo] (comprensiva de interés y principal) a pagar el día 01 de cada mes.
        #strong[El total a devolver hasta amortizar el crédito en 48 meses sería de
        2271,59€,] mediante 47 cuotas de 47,31 más una última cuota de 48,02 euros,
        que es el importe que resulta de la diferencia entre el importe total a
        pagar y la suma de los reembolsos mensuales anteriores.
      ],
    )

    #linebreak()
    #linebreak()
]
