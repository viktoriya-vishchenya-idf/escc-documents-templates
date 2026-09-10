#import "../common/default_styles.typ": deg-item, deg-reset, section-bold-h1
#import "../common/default_styles.typ": section-bold, section, table-header-fill
#import "../common/table_styles.typ": bottom-ruled-doc-table, boxed-doc-table, ruled-doc-table, second-col-ruled-doc-table, top-ruled-doc-table
#import "../partner-data.typ": partner-identity
#import "../vars.typ": SPLIT_DELINQUENCY_FEE

// Значение в графе «Gasto por reclamación de cuota impagada».
#let gasto-reclamacion(vars) = (
    if SPLIT_DELINQUENCY_FEE in vars.EXPERIMENTS [
        #strong[0€ gestiones recobro de los días 1 al 4 del impago.]

        #strong[15€ gestiones recobro de los días del 5 al 15.]

        #strong[15€ gestiones extras de recobro si persiste la deuda de la
        cuota impagada: los días del 16 al 30.]
    ] else [
        #strong[30€ máximo. Una sola vez por cada cuota impagada reclamada]
    ]
)

#let datos-del-contrato(vars) = [
    #section-bold-h1[CONDICIONES DEL CONTRATO DE LÍNEA DE CRÉDITO PLAZO CREDIT]

    #linebreak()
    Tu contrato de crédito Plazo Credit te permitirá disfrutar de una
    #strong[línea de crédito revolving] (la “Línea de Crédito”) de la que podrás
    ir disponiendo según tus necesidades bajo las siguientes condiciones
    económicas y generales. Estas condiciones describen cómo funciona la Línea
    de Crédito y otros aspectos importantes que debes saber. Por favor, guarda
    este documento y recuerda que tienes siempre una copia disponible en
    #link("https://credito.plazo.es/condiciones-generales-de-contratacion/")[https://credito.plazo.es/condiciones-generales-de-contratacion/]

    Te informamos de que el producto que vas a contratar es un producto
    financiero que conlleva unos costes que encontrarás explicados en las
    presentes Condiciones de Contratación.

    #linebreak()
    #section-bold-h1[Identidad y detalles de contacto del #underline[Prestatario]]

    Nombre y apellidos: #strong[#vars.BORROWER_FIRST_NAME
    #vars.BORROWER_FIRST_LAST_NAME #vars.BORROWER_SECOND_LAST_NAME]

    Número Documento Nacional de Identidad: #strong[#vars.BORROWER_DNI]

    Dirección: #strong[#vars.ADDRESS_CITY, #vars.ADDRESS_STREET,
    #vars.ADDRESS_HOUSE_NUMBER, #vars.ADDRESS_APARTMENT, #vars.ADDRESS_ZIP_CODE]

    Email: #strong[#vars.BORROWER_EMAIL]

    Teléfono: #strong[#vars.BORROWER_PHONE]

    #linebreak()
    #section-bold-h1[Identidad y detalles de contacto del #underline[Prestamista]]

    #strong[IDFinance Plazo S.L.U.,] sociedad de nacionalidad española con
    domicilio social en Barcelona, calle Tuset 5, 3º y Número de Identificación
    Fiscal (N.I.F.) B02996668 constituida en escritura pública de fecha 30 de
    diciembre de 2020 otorgada ante notario de Barcelona Gonzalo Veciana
    García-Boente con el número 1929 de su protocolo, inscrita en el Registro
    Mercantil de Barcelona, al tomo IRUS: 1000380036447, folio 0, Hoja B-558505

    #pagebreak()
    #underline[Detalles de contacto:]

    Prestamista: IDFinance Plazo, S.L.U.

    Dirección: Calle Tuset 5, 3º

    Teléfono: 93.522.26.26 / 900 533 861

    Correo electrónico: clientes\@plazo.es

    Website: #link("http://www.credito.plazo.es")[www.credito.plazo.es]

    #linebreak()
    #partner-identity(vars.PARTNER_DATA)

    #linebreak()
    #section-bold-h1[Calendario de contratación del servicio]

    El servicio fue contratado por el Prestatario el día
    #strong[#vars.AGREEMENT_DATE]

    #linebreak()
    #section-bold[#underline[Condiciones económicas] del contrato de Línea de Crédito
    PLAZO CREDIT y modalidad de pago #underline[revolving]]

    Estos son el tipo de interés y las comisiones y gastos aplicables al
    contrato de Línea de Crédito:

    #linebreak()
    #bottom-ruled-doc-table(
      rows: 3,
      columns: (50.00%, 50.00%),
      header-rows: (0,),
      // row 0
      table.cell(fill: table-header-fill)[#strong[TIPO DE INTERÉS]],
      table.cell(fill: table-header-fill)[#linebreak()],
      // row 1
      table.cell()[
        #section-bold[Tipo de Interés Nominal Anual (T.I.N.)]

        El #underline[tipo] de interés o tipo deudor expresado como porcentaje
        #underline[fijo] aplicado con carácter #underline[anual] al importe del
        crédito utilizado.
      ],
      table.cell(align: center)[#strong[#vars.TIN%]],
      // row 2
      table.cell()[
        #section-bold[Tasa Anual Equivalente (T.A.E.)]

        El #underline[coste total del crédito] para el consumidor expresado como
        #underline[porcentaje anual fijo] del importe total del crédito concedido,
        calculada con arreglo a la fórmula matemática contenida en el Anexo I de la
        Ley 16/2011, de 24 de junio, de contratos de Crédito al Consumo.
      ],
      table.cell(align: center)[#strong[#vars.TAE%]],
    )

    #emph[#strong[Ejemplo representativo:] Supuesto de Límite de Crédito de
    #underline[1.500 EUR] dispuesto en su totalidad en una única disposición
    (sin más disposiciones) el mismo día que contrata la Línea de Crédito (por
    ejemplo, 01/01/2025 ), al tipo de interés nominal fijo anual
    #underline[(TIN)] del #vars.TIN% y tasa anual equivalente #underline[(TAE)]
    de #vars.TAE%; con una cuota mensual de #underline[pago mínimo] (comprensiva
    de interés y principal) a pagar el día 01 de cada mes. #strong[El total a
    devolver hasta amortizar el crédito en 48 meses sería de 2269,44€,] mediante
    47 cuotas de 47,32 más una última cuota de 45,58 euros, que es el importe
    que resulta de la diferencia entre el importe total a pagar y la suma de los
    reembolsos mensuales anteriores.]

    #boxed-doc-table(
      columns: (50.00%, 50.00%),
      header-rows: (0,),
      // row 0
      table.cell(fill: table-header-fill)[#strong[COMISIONES Y GASTOS]],
      table.cell(fill: table-header-fill)[#linebreak()],
      // row 1
      table.cell()[
        #strong[Gasto por reclamación de cuota impagada]

        Por las gestiones que realicemos para la recuperación efectiva de la deuda
        impagada.
      ],
      table.cell()[
        #gasto-reclamacion(vars)
      ],
    )

    #emph[Aplicable una sola vez, por cada cuota impagada reclamada (saldos
    distintos). #underline[No se aplicará de forma repetida sobre un mismo
    saldo.]]

    #ruled-doc-table(
      rows: 4,
      columns: (50.00%, 50.00%),
      header-rows: (1,),
      // row 0
      table.cell()[#strong[Comisión por cancelación anticipada]],
      table.cell()[#strong[0€]],
      // row 1
      table.cell(fill: table-header-fill)[
        #strong[IMPORTE CRÉDITO (LIMITE DE CREDITO)]
      ],
      table.cell(fill: table-header-fill)[#linebreak()],
      // row 2
      table.cell()[
        #strong[Importe Actual]
      ],
      table.cell()[#strong[#vars.CREDIT_AMOUNT €]],
      // row 3
      table.cell()[
        #strong[Importe Máximo]
      ],
      table.cell()[
        #strong[En ningún caso] el límite de crédito asignado al Cliente
        #strong[será superior a] #underline[#strong[5.000 Euros.]]
      ],
    )

    #emph[El Importe concedido inicialmente –“Importe Actual” bajo la línea de
    crédito podrá ser incrementado (hasta el “Importe Máximo de Crédito”) o
    reducido (hasta el “Importe Mínimo de Crédito”) por el Prestamista durante
    la duración de la línea de crédito, de acuerdo con lo establecido en la
    cláusula 18.2 (Modificación de la línea de Crédito) de las Condiciones
    Generales de Contratación y las definiciones indicadas en la cláusula 12
    (Términos y Definiciones) de las mismas]

    #deg-reset()
    #second-col-ruled-doc-table(
      columns: (50.00%, 50.00%),
      header-rows: (0,),
      // row 0
      table.cell(fill: table-header-fill)[#strong[MODALIDAD DE PAGO REVOLVING]],
      table.cell(fill: table-header-fill)[#linebreak()],
      // row 1 — пункты 1º…4º идут по одному в ячейке, нумерацию ведёт
      // счётчик deg-item (см. deg-reset выше вызова таблицы)
      table.cell()[
        #section-bold[#underline[Pago Mínimo mensual]]

        Calculado mensualmente como la #underline[#strong[suma]] de las siguientes
        #underline[#strong[cifras:]]
      ],
      table.cell()[
        #deg-item[
          El #strong[importe mayor] de las siguientes cifras:
          #linebreak()
          #strong[5 Euros] o #strong[1,85%] #strong[del importe principal]
          dispuesto, restando los intereses devengados y las penalizaciones
          por impago; #underline[#strong[más]]
        ]
      ],
      // row 2
      table.cell()[#linebreak()],
      table.cell()[
        #deg-item[
          #strong[los intereses correspondientes al periodo de liquidación]\;
          #underline[#strong[más]]
        ]
      ],
      // row 3
      table.cell()[#linebreak()],
      table.cell()[
        #deg-item[
          los #strong[intereses correspondientes] e impagados #strong[del
          periodo de liquidación anterior] (si estuviese impagado);
          #underline[#strong[más]]
        ]
      ],
      // row 4
      table.cell()[#linebreak()],
      table.cell()[
        #deg-item[
          #strong[la] #underline[#strong[comisión por impago]] #strong[del
          periodo de liquidación anterior] (si este estuviera impagado)
        ]
      ],
    )

    #section[#emph[#underline[Ejemplo representativo de pago mínimo cuota mensual]]]

    #emph[Supuesto de Límite de Crédito de #underline[1.500 EUR] dispuesto en su
    totalidad en una única disposición el mismo día que contrata la Línea de
    Crédito (por ejemplo, “01/01/2025” y sin más disposiciones posteriores), al
    tipo de interés nominal fijo anual #underline[(TIN)] del #vars.TIN% y tasa
    anual equivalente #underline[(TAE)] de #vars.TAE%; #strong[la cuota mensual
    de] #underline[#strong[pago mínimo seria 47,32]] #strong[(comprensiva de
    interés y principal) a pagar el día 01 de cada mes.]]

    #section[]#emph[#strong[El total a devolver hasta amortizar el crédito con el pago
    mínimo en 48 meses sería de 2269,44€,] mediante 47 cuotas de 47,32 más una
    última cuota de 45,58 euros, que es el importe que resulta de la diferencia
    entre el importe total a pagar y la suma de los reembolsos mensuales
    anteriores. Ejemplo indicado sin incurrir en impago.]

    #top-ruled-doc-table(
      columns: (50.00%, 50.00%),
      header-rows: (0,),
      // row 0
      table.cell()[#underline[#strong[Pago anticipado en cualquier momento]]],
      table.cell()[Pago Total o Parcial en cualquier momento],
    )

    #linebreak()
    #section[#emph[#underline[Ejemplo representativo de pago anticipado en cualquier
    momento:]]]

    #emph[Supuesto de Límite de Crédito de #underline[1.500 EUR] dispuesto en su
    totalidad en una única disposición el mismo día que contrata la Línea de
    Crédito (por ejemplo, “01/04/2025” y sin más disposiciones posteriores), al
    tipo de interés nominal fijo anual #underline[(TIN)] del #vars.TIN% y tasa
    anual equivalente #underline[(TAE)] de #vars.TAE%. #strong[El total a
    devolver con pago anticipado], por ejemplo, al final del primer mes
    “01/05/2025” (30 días), seria de 1527,59€.]

    #second-col-ruled-doc-table(
      columns: (50.00%, 50.00%),
      // row 0
      table.cell()[
        // В .docx флажок стоит в том же абзаце, что «Advertencias:»,
        // размер 0,7 × 0,7 см; box — чтобы картинка осталась в строке.
        #box(baseline: 25%, image("../common/flag_img.png", width: 0.7cm))
        #underline[#strong[Advertencias]:]
      ],
      table.cell()[

        #underline[#strong[Un pago mínimo muy bajo alarga significativamente el
        plazo de amortización y supone la generación de una mayor cantidad de
        intereses al amortizarse poco capital en cada cuota.]]

      ],
      // row 1
      table.cell()[#linebreak()],
      table.cell()[
        #underline[#strong[La Línea de Crédito no permite la modificación de la
        modalidad de pago revolving.]]

      ],
      // row 2
      table.cell()[#linebreak()],
      table.cell()[
        #strong[Los #underline[intereses] correspondientes al #underline[periodo] de
        liquidación #underline[anterior], devengados y no pagados, se
        #underline[suman] al pago mínimo del mes de liquidación, pero #underline[NO
        se suman al capital principal y NO generan nuevos intereses en la siguiente
        liquidación.]]

      ],
    )
]
