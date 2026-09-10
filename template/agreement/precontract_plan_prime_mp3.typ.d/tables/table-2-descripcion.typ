#import "../common/default_styles.typ": marked, dashList09spacing
#import "../common/table_styles.typ": nested-table

#let listIndent = 1.9em

#let degNumericList(body) = {
  let c = counter("deg-numeric-list")
  c.update(0)
  show enum.item: it => block(spacing: listIndent)[#c.step()#context c.display(n => [#{n}º]) #it.body]
  block(inset: (left: 1.5em), body)
}

#let romanList(body) = {
  let c = counter("roman-list")
  c.update(0)
  show enum.item: it => block[#c.step()#context c.display(n => [#numbering("i", n).]) #it.body]
  body
}

#let table-2-descripcion(vars) = [
#figure(
  align(center)[#table(
    columns: (32.44%, 67.56%),
    table.header(table.cell(colspan: 2)[*2. Descripción de las
      características principales*

      *del producto de crédito*

      ],),
    table.hline(),
    [*Tipo de crédito*], [*Línea de crédito* al consumo
    que ofrece diferentes formas de pago (i. *pago* revolvente o
    #emph[*revolving;*] y ii. *pago anticipado* en
    cualquier momento#emph[)];],
    [#marked[*Importe total del crédito*]

    #linebreak()
    #emph[Es decir, el importe máximo o la suma de todas las cantidades
    puestas a disposición del consumidor en el marco de un Contrato de
    Crédito];.

    ], [A determinar por el cliente entre un:

    #dashList09spacing[
    - #marked[Mínimo #vars.CREDIT_AMOUNT Euros.]
    - Y un #marked[máximo]; que IDFinance Plazo ofrece al Cliente a través de banca electrónica (App o web), previo análisis creditico y de solvencia. En ningún caso el límite asignado al Cliente será superior a #marked[5000 Euros].
    ];

    #linebreak()
    El #marked[Límite de Línea de Crédito] será asignado según la solicitud
    realizada por el Cliente y la evaluación de crédito y solvencia que
    efectúe IDFinance Plazo dependiendo de las características particulares
    del consumidor solicitante, con un límite máximo inicial igual al
    señalado anteriormente.

    #linebreak()
    #emph[La principal característica de los créditos revolventes es el
    establecimiento de un Límite de Línea de Crédito cuyo disponible
    coincide inicialmente con dicho límite, que disminuye según se
    realizan cargos (compras, disposiciones de efectivo, disposiciones
    por transferencia, liquidaciones de intereses y gastos y otros) y se
    repone con abonos (pago de los recibos periódicos, devoluciones de
    compras, etc.). Por tanto, las cuantías de las cuotas que el Cliente
    abona de forma periódica vuelven a formar parte del crédito
    disponible.]

    ],
    [#marked[*Condiciones que rigen la disposición de fondos.*]

    #linebreak()
    #emph[Es decir, cuándo y cómo el consumidor obtendrá el dinero.]

    ], [Una vez que el contrato de línea de crédito se haya formalizado,
    el Prestamista concederá la línea de crédito al consumo mediante la
    puesta a disposición de la totalidad del Importe Actual en la Cuenta
    de Crédito del Prestatario abierta en la App Plazo o en la cuenta
    bancaria facilitada por este.

    #linebreak()
    El saldo disponible aumentará cada vez que el Prestatario realice
    los correspondientes abonos, por lo que volverán a formar parte de
    su línea de crédito.

    #linebreak()
    Si bien el Límite de Crédito inicial será el Importe inicial que
    figura en las Condiciones Generales, el Límite de Crédito podrá ser
    incrementado por el Prestamista o reducido durante la vida de la
    línea de crédito (conforme se expone en el párrafo siguiente
    #emph[“Modificación del Importe total del Crédito];”).

    #linebreak()
    #marked[El Prestatario hará uso del Límite de Crédito mediante
    solicitudes de disposición a través del Área de Usuario de la
    App Plazo, o mediante cualquier otro medio admitido
    por el Prestamista] y de conformidad con el procedimiento especificado por
    el Prestamista.

    ],
    table.cell(rowspan: 9)[*Condiciones que rigen la modificación
    del importe total del crédito*],[El Prestamista, de conformidad
    con el Prestatario, podrá modificar el Límite de Crédito de la línea
    de crédito, bien aumentándolo o bien disminuyéndolo bajo las
    siguientes condiciones:],
    [#block[
    #set enum(numbering: "a.", start: 1)
    + #marked[Previo análisis de la solvencia] por parte del Prestamista, de la
      variación de las circunstancias que motivaron la concesión del
      Crédito (como puede ser, de conformidad con la Política de Crédito
      interna, el aumento del poder adquisitivo del Prestatario, la
      variación al alza de su franja salarial o la reducción del nivel
      de riesgo), la actualización de la información financiera y
      evaluación de solvencia del Prestatario, #marked[el Prestamista podrá, en
      caso de resultado positivo y con el consentimiento del
      Prestatario, aumentar el Límite de Crédito de la línea de Crédito.]
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 2)
    + #marked[Previo análisis de la solvencia] por parte del Prestamista de la
      variación de las circunstancias que motivaron la concesión del
      Crédito (como puede ser, de conformidad con la Política de Crédito
      interna, la reducción significativa del poder adquisitivo del
      Prestatario, reducción significativa de su franja salarial o el
      aumento del nivel de riesgo), de la actualización de la
      información financiera y de la evaluación de solvencia del
      Prestatario, #marked[el Prestamista podrá y con el consentimiento del
      Prestatario, en caso de resultado negativo, reducir el Límite de
      Crédito de la línea de Crédito.]
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 3)
    + La #marked[decisión de aumentar o reducir] el Límite de Crédito concedido
      en cada momento será #marked[comunicada] al Prestatario a través de la
      Aplicación móvil, descargable en soporte duradero y #marked[con una
      antelación previa de al menos un (1) mes.] En dicha comunicación se
      informará de los términos exactos de la modificación y de los
      derechos de los que goza el Prestatario
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 4)
    + En el supuesto de que el #marked[Prestamista decidiera aumentar el Límite
      de Crédito del Prestatario, este aumento se aplicará de manera
      inmediata] (salvo oposición por el Prestatario y al margen de la
      pertinente comunicación de dicha circunstancia al Prestatario), en
      cuanto #marked[son condiciones más favorables para este último.] En base a
      lo anterior, en el plazo de un (1) mes a contar desde la
      comunicación, el Prestatario podrá (i) aceptar la modificación del
      Límite de Crédito, (ii) rechazar la modificación del Límite de
      Crédito y mantenerlo sin el aumento propuesto, o bien (iii)
      rechazar la modificación y dar por resuelto el Contrato sin coste
      adicional. Si transcurrido el plazo de un (1) mes desde la
      recepción de la comunicación efectuada por el Prestamista sobre la
      modificación del Límite de Crédito, el Prestamista no recibe
      comunicación escrita o electrónica del Prestatario rechazando el
      nuevo Límite de Crédito, o bien resolviendo el Contrato, se
      entenderá prestada la conformidad al aumento del Límite de
      Crédito.
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 5)
    + En el supuesto de que el #marked[Prestamista] comunicara al Prestatario,
      con una #marked[antelación mínima de un (1) mes] a la fecha de efectos, su
      intención de reducir el Límite de #marked[Crédito] por las razones
      indicadas en el punto b) anterior, el Prestatario podrá (i)
      aceptar la modificación del Límite de Crédito o bien (ii) rechazar
      la modificación y dar por resuelto el Contrato sin coste
      adicional. Si transcurrido el plazo de un (1) mes desde la
      recepción de la comunicación efectuada por el Prestamista sobre la
      modificación del Límite de Crédito, el Prestamista no recibe
      comunicación escrita o electrónica del Prestatario rechazando el
      nuevo Límite de Crédito, o bien resolviendo el Contrato, se
      entenderá prestada la conformidad a la reducción del Límite de
      Crédito.
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 6)
    + En el supuesto de #marked[modificación del límite de crédito, el
      Prestamista informará de forma individualizada,] a través del Área
      de Usuario de la Aplicación móvil de la, (i)
      el nuevo límite, (ii) la cuantía de la deuda acumulada hasta ese
      momento, (iii) la nueva cuota que deberá pagar (en su caso) y (iv)
      la información prevista en la cláusula 9.7 de las presentes
      condiciones contractuales.
    ]
    
    #linebreak()
    ],
    [#block[
    #set enum(numbering: "a.", start: 7)
    + En caso de que el Prestatario opte por resolver el contrato, se
      procederá a la devolución anticipada del Crédito conforme a la
      cláusula 19 siguiente, sin que el Prestamista tenga en este caso
      derecho a compensación alguna en concepto de amortización
      anticipada
    ]

    ],
    [#block[
    #set enum(numbering: "a.", start: 8)
    + El Prestamista podrá realizar a su discreción esta revisión de la
      concurrencia de los criterios indicados en las Cláusulas 18.2.a) y
      18.2.b) y, por tanto, la modificación de los Límites de Crédito
      con una frecuencia trimestral y no menor.
    ]

    ],
    table.cell()[#marked[*Duración del Contrato*

    *de Crédito.*]

    ], [El presente contrato es válido por tiempo #marked[*indefinido.*]

    #linebreak()
    El contrato continuará vigente hasta que no sea resuelto por el
    Cliente, lo que podrá realizarse en cualquier momento, sin necesidad
    de preaviso.

    #linebreak()
    Igualmente, el Prestamista, podrá dar por terminado el contrato, en
    cualquier momento y sin necesidad de alegar causa alguna, mediante
    preaviso por escrito al Cliente con, al menos, dos meses de
    antelación.

    ],
    [#marked[*Los plazos y, en su*

    *caso, el orden en que*

    *se realizarán los pagos.*]

    ], [El Cliente tiene *#underline[dos formas];* de pagar la
    línea de crédito (\"Formas de Pago\"):
    
    #linebreak()
    #romanList[
    + #marked[*Pago revolving*]~mediante #marked[*cuota de Pago Mínimo:*]

      *El importe del pago mínimo se calcula cada mes como la suma
      de las siguientes cifras:*

      #degNumericList[
      + el #underline[importe mayor de] las siguientes cifras: (i)
        *#underline[25€] ,* #underline[o] (ii)
        *#underline[3% del importe principal pendiente, incluyendo en
        ambos casos los intereses devengados correspondientes al período
        de liquidación];*; más

      + los *intereses correspondientes* e impagados *del
        periodo de liquidación anterior* (si estuviese impagado);
        *más*

      + la *penalización por impago* del periodo de liquidación
        anterior (si este estuviera impagado).
        #linebreak()

      ]

    #linebreak()
    + #marked[*Pago anticipado*] en cualquier momento~:

      Reembolsando en cualquier momento, a solicitud del Cliente, de la
      cuantía del Pago Mínimo junto el importe dispuesto que se quiera
      amortizar.
    ]

    *#underline[La modalidad de pago, por defecto, es Pago
    revolving mediante cuota de Pago Mínimo. La Línea de Crédito no
    permite la modificación de la modalidad de pago revolving.];*

    #linebreak()
    #marked[*Prelación de pagos:* las cantidades abonadas por el
    Prestatario al Prestamista utilizadas para satisfacer sus
    obligaciones de pago seguirán, por orden cronológico, el siguiente
    *orden:*]

    #block[
    #set enum(numbering: "1)", start: 1, indent: listIndent)
    + #marked[Comisión por impago],

    + #marked[intereses devengados y]

    + #marked[reembolso del principal del Crédito.]
    ]

    ],
    [#marked[*Importe total que*

    *deberás pagar.*]

    #linebreak()
    #emph[Es decir, el importe del capital prestado más los intereses y posibles gastos relacionados con su crédito.]

    ], [El importe total a pagar será el Principal del Crédito Dispuesto
    más los intereses que se pudieran generar y las comisiones en las
    que pudiera incurrir el Cliente.

    #nested-table(
        columns: (100%),
        table.header([*Ejemplos:*],),
        table.hline(),
//        table.cell(fill: table-header-fill.lign)
        [#emph[Supuesto de Límite de Crédito de #underline[1500 EUR]
        dispuesto en su totalidad en una única disposición (sin más
        disposiciones) el mismo día que contrata la Línea de Crédito
        (por ejemplo, 01/01/2025), al tipo de interés nominal fijo anual
        #underline[(TIN)] del #vars.TIN% y tasa anual equivalente
        #underline[(TAE)] de #vars.TAE%; con una cuota mensual de
        #underline[pago mínimo] (comprensiva de interés y principal) a
        pagar el día 01 de cada mes. *El total a devolver hasta
        amortizar el crédito en 48 meses sería de 2271,59€,* mediante 47
        cuotas de 47,31€, más una última cuota de
        48,02€, que es el importe que resulta de la diferencia
        entre el importe total a pagar y la suma de los reembolsos
        mensuales anteriores];],
      )

    ],
    [*Los reembolsos no*

    *suponen la inmediata*

    *amortización del capital*

    ], [#marked[El presente contrato no prevé una garantía de reembolso del
    importe total del crédito del que se haya dispuesto en virtud del
    contrato];],
    [#marked[*Tipo de divisa.*]], [La divisa de referencia para los pagos
    será en #marked[EUROS (€)];],
  )]
  , kind: table
  )
]
