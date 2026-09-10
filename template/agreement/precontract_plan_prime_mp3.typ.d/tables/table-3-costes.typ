#import "../common/table_styles.typ": nested-table
#import "../common/default_styles.typ": table-header-fill, marked, dashList, dashList09spacing, bulletList

#let faseNumericList(body) = {
  let c = counter("fase-numeric-list")
  c.update(0)
  show enum.item: it => block(spacing: 1.4em)[#c.step()#context c.display(n => [FASE #{n}:]) #it.body]
  body
}

// Эксперимент ABT-1.48: комиссия за неуплату разбита на ступени по дням
// просрочки вместо единого платежа за должника.
#let SPLIT_DELINQUENCY_FEE = "SPLIT_DELINQUENCY_FEE_42660_B"

// Список расходов в пункте «Costes relacionados»: под экспериментом —
// четыре ступени (0 EUR / 15 EUR / 15 EUR), иначе прежние два пункта.
#let costes-relacionados(vars) = if SPLIT_DELINQUENCY_FEE in vars.EXPERIMENTS [
  #dashList09spacing[
  - Comisión por cancelación anticipada #marked[(*0 EUR*)]
  - Comisión por reclamación de cuota impagada: #marked[*0 EUR*] los días
    1 al 4 de la cuota impagada
  - Gastos de primeras gestiones de recobro: #marked[*15 EUR*] los días
    del 5 al 15.
  - Gestiones extras de recobro si persiste la deuda de la cuota impagada:
    #marked[*15 EUR*] los días del 16 al 30.
  ];
] else [
  #dashList09spacing[
  - Comisión por cancelación anticipada #marked[(*0 EUR*)]
  - Comisión por reclamación de posiciones deudoras
    #linebreak()#marked[*(30 € por saldo deudor)*]
  ];
]

// Расходы при просрочке: под экспериментом комиссия делится на две фазы
// (15 € + 15 €) со внутренним списком сумм, иначе — прежние 30 € за
// должника и пять фаз взыскания.
#let costes-pagos-atrasados(vars) = (
  if SPLIT_DELINQUENCY_FEE in vars.EXPERIMENTS [
    #marked[Comisión por gestiones efectivas de recobro: *15€ Fase 1
    más 15€ adicionales Fase 2.*]

    #linebreak()
    #marked[El Prestatario incurrirá en mora a partir del día siguiente de la
    fecha estipulada para cualquiera de los pagos previstos en el
    Contrato, *facultando al Prestamista a repercutir y reclamar, además
    del importe impagado, una comisión de recuperación de gastos por
    gestiones efectivas de recobro de*

    #bulletList[
    - 15 € por las gestiones efectuadas del día 5 al 15 (Fase 1),

    - y de persistir la cuota impagada, 15€ adicionales por las gestiones
      de equipos externos especializados en recobro de deudas, de los
      días 16 al 30 desde el impago de la cuota (Fase 2).
    ]

    La finalidad es resarcir al Prestamista de los costes incurridos en el
    trámite de la gestión del pago de la deuda en las siguientes fases:

    #faseNumericList[
    + Serán realizadas por los equipos internos de Cobros, entre los días
      5 y 15 desde el impago de la cuota, y consistirán a modo de ejemplo
      en llamadas telefónicas individualizadas, comunicaciones
      electrónicas y SMS individualizados, requerimientos de pago escritos
      remitidos por correo postal del cliente e individualizados,
      mensajería instantánea.

    + En caso de persistir la irregularidad, y ser necesaria la
      intensificación de gestiones de recobro, entre los días 16 y 30
      desde el impago de la cuota, requiriendo los servicios de equipos
      externos especializados en gestiones avanzadas de Recobro tales
      como, a modo de ejemplo, envíos de burofax, o requerimientos de pago
      fehacientes, requerimientos formales de pago necesario para inicio
      de acciones judiciales o comunicación de datos a ficheros de
      solvencia como Asnef (art. 20 de la Ley 3/2018 de 5 de diciembre de
      Protección de Datos personales), acciones encaminadas a la
      reestructuración de deudas, asesoramiento al deudor.
    ];]

    #linebreak()
    *Este gasto se generará, liquidará y deberá ser pagado, según las
    fases del recobro descritas y por cada cuota vencida y reclamada, no
    pudiendo reiterarse para un mismo saldo impagado*.
  ] else [
    #marked[Comisión por gestiones efectivas de recobro: *30 €*]

    #linebreak()
    #marked[El Prestatario incurrirá en mora a partir del día siguiente de la
    fecha estipulada para cualquiera de los pagos previstos en el
    Contrato, *facultando al Prestamista a repercutir y reclamar,
    además del importe impagado, una comisión por gestiones efectivas de
    recobro de 30 € por cuota impagada #underline[(a pagar una sola vez
    por posición deudora o mismo saldo deudor),] previa notificación y*
    que deberá ser satisfecha tras la finalización de la fecha de
    liquidación, esto es, el día #vars.DD, *relativa a los costes
    incurridos por el Prestamista en el trámite de recaudación del
    impago* y sus distintas fases:

    #faseNumericList[
    + gastos de comunicación y gestión del cobro de posiciones
      deudoras, por los cuales se informa al Prestatario de la existencia
      de una posición irregular para que pueda proceder a su
      regularización, para ello el Prestamista notificará la irregularidad
      mediante comunicación individualizada remitida por SMS, sistemas de
      mensajería instantánea, Email, llamada telefónica, correo postal.

    + En caso de persistir la irregularidad, continuación de la
      comunicación y gestión del cobro de la posición deudora para que
      pueda proceder a su regularización, así como de la posibilidad de
      reestructuración, gestión de llamadas por terceros proveedores de
      recobro.

    + Continuación de los procesos de recobro indicados en las
      fases 1 y 2, así como, comunicación vía correo electrónico, SMS y
      comunicación postal de la inclusión de sus datos en ficheros de
      solvencia patrimonial y de crédito (ASNEF-EQUIFAX), de acuerdo con
      lo establecido en el artículo 20 sobre sistemas de información
      crediticia de la Ley Orgánica 3/2018, de 5 de diciembre, de
      Protección de Datos Personales y garantía de los derechos digitales.

    + Continuación de los procesos de recobro indicados en las
      fases 1, 2 y 3, así como, del procedimiento de reclamación
      extrajudicial y judicial interna.

    + Continuación de los procesos de recobro indicados en las
      fases 1 a 4, así como, del procedimiento de reclamación
      extrajudicial y judicial por terceros proveedores.
    ];]

    Los gastos y gestiones asociados al proceso de gestiones efectivas
    de recobro y sus Fases pueden consistir en:

    #dashList[
    - Gastos fijos de estructura y de plataformas internas (personal,
      calidad, infraestructura, licencias, desarrollo, mantenimiento…).

    - Gastos derivados de plataformas específicas vinculadas a la acción
      extrajudicial de recobro deuda:

      #block[
      #set enum(numbering: "a.", start: 1)
      + Contactos telefónicos e intentos de contacto.

      + SMS con recordatorios la devolución del recibo, información de
        contacto con el Prestamista y medios para saldar deuda.

      + Comunicación informativa de su situación de impago.

      + Comunicación avisando de que el Prestamista no ha conseguido
        contactar con el Prestatario en situación impagado y facilitando
        datos de contacto.

      + Comunicación recordatoria de que se encuentra en situación de
        impago e informando de los medios que tiene para zanjar su
        deuda.

      + Comunicación certificada de inclusión en los sistemas de
        información crediticia de ASNEF-Equifax.

      + Comunicación de la cancelación definitiva de la Línea de Crédito
        por acumular tres cuotas impagadas.

      + Comunicación informativa recordando que si regulariza la deuda
        evitaría una acción judicial.
      ]
    ]

    #linebreak()
    *Este gasto se generará, liquidará y deberá ser pagado una
    sola vez por cada cuota vencida y reclamada, no pudiendo reiterarse
    para un mismo saldo impagado*.
  ]
)

#let table-3-costes(vars) = [
#figure(
  align(center)[#table(
    columns: (32.44%, 67.56%),
    table.header(table.cell(colspan: 2)[*3. Costes
      del Crédito*],),
    table.hline(),
    [#marked[*El tipo deudor que se*

    *aplica al Contrato de Crédito #underline[(TIN)];*]

    ], table.cell()[*El* *tipo de interés fijo
    #marked[(TIN)] es del #marked[#vars.TIN~%] anual.*

    El tipo deudor se calcula a partir del número de días reales en un
    mes natural y un año de 365 días.

    #align(center)[#marked[*TIN = PercentPerDay\*365*];]

    El #marked[Prestamista calcula a diario los intereses sobre el principal
    dispuesto], excluyendo intereses devengados, cuotas previas impagadas
    (si las hubiera) y comisiones por reclamación efectiva de deuda (si
    las hubiera).

    ],
    table.cell(rowspan: 2)[#marked[*Tasa anual equivalente*

    *#underline[(TAE)];*]

    #linebreak()
    #emph[La TAE es el coste total]

    #emph[del crédito expresado]

    #emph[en forma de porcentaje]

    #emph[anual del importe total]

    #emph[del crédito. La TAE sirve para comparar diferentes ofertas.]

    ], table.cell()[#marked[*TAE = #vars.TAE %, fijo anual*]

    #linebreak()
    Para el cálculo de la TAE se aplicarán los parámetros de Importe,
    Duración, Plazos, Tipos deudores y comisiones especificados en este
    mismo documento.

    #align(center)[#marked[*TAE=(1+i/n)^n-1*];]

    Donde:
    #dashList[
    - i es el Tipo de Interés Nominal aplicado (TIN)
    - n es la frecuencia de los pagos
    ]
    *Advertencia:* *#underline[Una TAE elevada implica un
    mayor coste final para el Prestatario, donde el interés puede inflar
    significativamente la cuantía a devolver.];*

    ],
    [#nested-table(
        columns: (100%),
        table.header(table.cell()[*Ejemplo
          representativo 1: Cuota mensual pago mínimo*],),
        table.hline(),
        [Supuesto de Límite de Crédito de #underline[1500 EUR]
        dispuesto en su totalidad en una única disposición (sin más
        disposiciones) el mismo día que contrata la Línea de Crédito
        (por ejemplo, 01/01/2025), al tipo de interés nominal fijo anual
        #underline[(TIN)] del #vars.TIN% y tasa anual equivalente
        #underline[(TAE)] de #vars.TAE%; con una *cuota mensual de
        #underline[pago mínimo];* (comprensiva de interés y principal) a
        pagar el día 01 de cada mes. *El total a devolver hasta
        amortizar el crédito en 48 meses sería de 2271,59 € ,* mediante
        47 cuotas de 47,31 más una última cuota de 48,02 euros, que es
        el importe que resulta de la diferencia entre el importe total a
        pagar y la suma de los reembolsos mensuales anteriores],
        table.cell()[*Ejemplo representativo 2: Pago anticipado total*],
        table.cell()[#emph[Supuesto de Límite de Crédito de
        #underline[1500 EUR] dispuesto en su totalidad en una única
        disposición el mismo día que contrata la Línea de Crédito (por
        ejemplo, “01/04/2025” y sin más disposiciones posteriores), al
        tipo de interés nominal fijo anual #underline[(TIN)] del
        #vars.TIN% y tasa anual equivalente #underline[(TAE)] de #vars.TAE%.
        *El total a devolver con pago anticipado*, por ejemplo,
        al final del primer mes “01/05/2025” (30 días), seria de
        1527,59 .];],
      )

    ],
    [*¿Es obligatorio para*

    *obtener el crédito en*

    #marked[*sí, o en las condiciones*

    *ofrecidas,*
    #dashList[
    - *tomar una*

    *póliza de seguros que*

    *garantice el crédito, u*

    - *otro servicio*

    *accesorio?*]
    ]
    
    #linebreak()
    #emph[Si los costes de estos servicios no son conocidos por el
    prestamista, no se incluyen en la TAE]

    ], table.cell()[

    #linebreak()
    #linebreak()
    #linebreak()
    #linebreak()
    #marked[*No*]

    #linebreak()
    #linebreak()
    #linebreak()
    #marked[*No*]

    ],
    table.cell()[#marked[*Costes relacionados.*];], [
    #costes-relacionados(vars)
    ],
    [#marked[*Importe de los costes*

    *por utilizar un medio*

    *de pago específico*]

    #linebreak()
    #emph[(por ejemplo, una tarjeta de crédito).]

    ], [*No*],
    [#marked[*Condiciones en que*

    *pueden modificarse*

    *los gastos antes mencionados relacionados con el Contrato de
    Crédito.*]

    ], [#underline[El Prestamista podrá #marked[modificar] las Condiciones
    Generales];, comunicándolo de manera individualizada al Prestatario
    a través de la Aplicación móvil y/o correo electrónico con una
    #underline[antelación mínima de, #marked[al menos, un (1) mes];] respecto a la
    fecha en la que entrarán en vigor las modificaciones contractuales.
    #marked[#underline[No obstante];] lo anterior, en caso de que las
    #underline[modificaciones] propuestas por el Prestamista fuesen
    #marked[#underline[más favorables];] para el Prestatario podrán aplicarse
    #marked[#underline[inmediatamente];], al margen de la correspondiente
    notificación al respecto.

    #linebreak()
    #marked[Si con anterioridad] a la fecha propuesta de entrada en vigor de las
    modificaciones contractuales, #marked[el Prestamista no recibe comunicación]
    escrita o electrónica del Prestatario rechazando las nuevas
    modificaciones contractuales, #marked[se entenderá prestada la conformidad a
    dichas modificaciones.]

    #linebreak()
    En caso de disconformidad con las modificaciones propuestas por el
    Prestamista, el Prestatario tendrá la facultad de resolver el
    Contrato sin penalización alguna.

    ],
    [#marked[*Costes en caso de*

    *pagos atrasados.*]

    #linebreak()
    #marked[#emph[La no realización de un]]

    #marked[#emph[pago podrá acarrearle]]

    #marked[#emph[graves consecuencias y dificultar la obtención de un
    crédito.]]

    ], [#costes-pagos-atrasados(vars)
    ],
    [#marked[*Consecuencias de impago*]], [Pasados 30 días de mora, el
    Prestamista se reserva el derecho de #marked[reportar el caso a la
    ASNEF-EQUIFAX y a otros registros de morosos] de conformidad con lo
    dispuesto en el artículo 20 de la Ley Orgánica 3/2018, de 5 de
    diciembre, de Protección de Datos Personales y garantía de los
    derechos digitales.

    #linebreak()
    Asímismo, #marked[*el impago podría tener graves consecuencias
    adicionales~:*]

    #dashList[
    - la apertura de un #marked[procedimiento judicial por reclamación de deuda]

    - #marked[cesión del derecho de crédito a un tercero]

    - el aumento del importe a devolver en caso de aplicarse la comisión
      por reclamación de deuda y

    - la posibilidad de que te resulte más difícil y/o caro obtener un
      crédito en el futuro por inclusión en el sistema de información
      crediticia de ASNEF-Equifax.

    ]
    ]
  )]
  , kind: table
  )
]
