#import "../common/default_styles.typ": alpha-list, clause-list, dash-list
#import "../common/default_styles.typ": fase-list, marked, num-dash-list
#import "../common/default_styles.typ": bullet-list, section-bold-h1
#import "../vars.typ": SPLIT_DELINQUENCY_FEE

// Тело пункта 10.4: под экспериментом комиссия за неуплату разбита на
// ступени по дням просрочки (0 € / 15 € / 15 €) и описаны две фазы
// взыскания, иначе — прежние 30 € за должника и пять фаз.
#let comision-recobro(vars) = (
  if SPLIT_DELINQUENCY_FEE in vars.EXPERIMENTS [
      #marked[El Prestatario incurrirá en mora a partir del día siguiente de
      la fecha estipulada para cualquiera de los pagos previstos en el
      Contrato#strong[, facultando al Prestamista a repercutir y reclamar,
      además del importe impagado, una comisión por gestiones efectivas de
      recobro de:]]

      #bullet-list[
      - #marked[0€ por las gestiones de recobro de la cuota impagada
        realizadas entre los días 1 y 4 del impago]
      - #marked[15€ por cuota impagada por las gestiones de recobro de la
        cuota impagada realizadas por los equipos internos de Cobros entre los
        días 5 y 15 del impago (fase 1)]
      - #marked[15€ adicionales por cuota impagada por las gestiones de
        recobro de la deuda realizadas por equipos externos especializados en
        Recobro entre los días 16 y 30 del impago (fase 2)]
      ]

      #marked[Se realizará por el Prestamista previa notificación y deberán
      ser satisfechos tras la finalización de la fecha de liquidación, esto
      es, el día 8. Estas cantidades tienen por objeto resarcir de los costes
      incurridos por el Prestamista en el trámite de recaudación del impago.]

      Las fases y gestiones en cada fase, a modo de ejemplo pueden consistir:

      #fase-list[
      + Serán realizadas por los equipos internos de Cobros, entre los días 5
        y 15 desde el impago de la cuota, y consistirán a modo de ejemplo en
        llamadas telefónicas individualizadas, comunicaciones electrónicas y
        SMS individualizados, requerimientos de pago escritos remitidos por
        correo postal del cliente e individualizados, mensajería instantánea
        etc.

      + En caso de persistir la irregularidad, y ser necesaria la
        intensificación de gestiones de recobro, entre los días 16 y 30 desde
        el impago de la cuota, requiriendo los servicios de equipos externos
        especializados en gestiones avanzadas de Recobro tales como, a modo de
        ejemplo, envíos de burofax, o requerimientos de pago fehacientes,
        requerimientos formales de pago necesario para inicio de acciones
        judiciales o comunicación de datos a ficheros de solvencia como Asnef
        (art. 20 de la Ley 3/2018 de 5 de diciembre de Protección de Datos
        personales), acciones encaminadas a la reestructuración de deudas,
        asesoramiento al deudor.
      ]

      Este gasto se generará, liquidará y deberá ser pagado, según las fases
      del recobro descritas y por cada cuota vencida y reclamada, no pudiendo
      reiterarse para un mismo saldo impagado.
  ] else [
      #marked[El Prestatario incurrirá en mora a partir del día siguiente de la
      fecha estipulada para cualquiera de los pagos previstos en el
      Contrato#strong[, facultando al Prestamista a repercutir y reclamar,
      además del importe impagado, una comisión por gestiones efectivas de
      recobro de 30€ por cuota impagada] #underline[#strong[(a pagar una sola
      vez por posición deudora o mismo saldo deudor)]]#strong[, previa
      notificación y] que deberá ser satisfecha tras la finalización de la fecha
      de liquidación, esto es, el día #vars.DD#strong[, relativa a los costes
      incurridos por el Prestamista en el trámite de recaudación del impago] y
      sus distintas fases:]

      #fase-list[
      + gastos de comunicación y gestión del cobro de posiciones
        deudoras, por los cuales se informa al Prestatario de la existencia de una
        posición irregular para que pueda proceder a su regularización, para ello
        el Prestamista notificará la irregularidad mediante comunicación
        individualizada remitida por SMS, sistemas de mensajería instantánea,
        Email, llamada telefónica, correo postal.

      + En caso de persistir la irregularidad, continuación de la
        comunicación y gestión del cobro de la posición deudora para que pueda
        proceder a su regularización, así como de la posibilidad de
        reestructuración, gestión de llamadas por terceros proveedores de
        recobro.

      + Continuación de los procesos de recobro indicados en las
        fases 1 y 2, así como, comunicación vía correo electrónico, SMS y
        comunicación postal de la inclusión de sus datos en ficheros de solvencia
        patrimonial y de crédito (ASNEF-EQUIFAX), de acuerdo con lo establecido en
        el artículo 20 sobre sistemas de información crediticia de la Ley Orgánica
        3/2018, de 5 de diciembre, de Protección de Datos Personales y garantía de
        los derechos digitales.

      + Continuación de los procesos de recobro indicados en las
        fases 1, 2 y 3, así como, del procedimiento de reclamación extrajudicial y
        judicial interna.

      + Continuación de los procesos de recobro indicados en las
        fases 1 a 4, así como, del procedimiento de reclamación extrajudicial y
        judicial por terceros proveedores.

      ]

      Los gastos y gestiones asociados al proceso de gestiones efectivas de
      recobro y sus Fases pueden consistir en:

      #dash-list[
        - Gastos fijos de estructura y de plataformas internas (personal,
          calidad, infraestructura, licencias, desarrollo, mantenimiento…).
        - Gastos derivados de plataformas específicas vinculadas a la acción
          extrajudicial de recobro deuda:

          #alpha-list[
          + Contactos telefónicos e intentos de contacto.
          + SMS con recordatorios la devolución del recibo, información de
            contacto con el Prestamista y medios para saldar deuda.
          + Comunicación informativa de su situación de impago.
          + Comunicación avisando de que el Prestamista no ha conseguido
            contactar con el Prestatario en situación impagado y facilitando
            datos de contacto.
          + Comunicación recordatoria de que se encuentra en situación de impago
            e informando de los medios que tiene para zanjar su deuda.
          + Comunicación certificada de inclusión en los sistemas de información
            crediticia de ASNEF-Equifax.
          + Comunicación de la cancelación definitiva de la Línea de Crédito por
            acumular tres cuotas impagadas.
          + Comunicación informativa recordando que si regulariza la deuda
            evitaría una acción judicial.
          ]
      ]

      Este gasto se generará, liquidará y deberá ser pagado una sola vez por cada
      cuota vencida y reclamada, no pudiendo reiterarse para un mismo saldo
      impagado.
  ]
)

#let clause-10-procedimiento-impago(vars) = [
    #section-bold-h1[10\. Procedimiento en caso de impago]

    #clause-list(10)[
    + #marked[En aquellos casos en los que el Prestatario no abone el importe de
      alguna de las cuotas en el plazo estipulado, la deuda pasará a ser
      gestionada por el Departamento de Cobros del Prestamista.] El Prestamista
      lo comunicará al Prestatario llegado el momento a través de correo
      electrónico, SMS y/o correo postal, así como mediante la realización de
      llamadas a los teléfonos que el Prestatario hubiera puesto a disposición
      del Prestamista en el momento de la contratación de la línea de Crédito o
      posteriormente, siempre y cuando el Prestatario acreditase la titularidad
      del nuevo teléfono.

      #linebreak()

    + #strong[En caso de no producirse el pago en el término previsto para ello]
      y cumplirse los requisitos previstos, con la aceptación de estas
      Condiciones Generales de Contratación y de la Política de Privacidad del
      Prestamista, el Prestatario queda informado de que, con la finalidad de
      realizar el cobro efectivo, #strong[podrá recibir en el/los teléfono/s
      facilitado/s llamadas y comunicaciones] automatizadas con o sin
      intervención humana #strong[necesarias y pertinentes hasta que se realice
      el efectivo pago de la deuda] en base a la correcta ejecución del
      contrato.

      Además, se informa al Prestatario que#strong[, en caso de impago] en el
      término previsto para ello, y habiéndose cumplido los requisitos legales
      necesarios y comunicaciones pertinentes, #strong[sus Datos Personales
      podrán ser comunicados al Servicio de Crédito de Asnef-Equifax,] de
      acuerdo con lo establecido en el artículo 20 respecto de los sistemas de
      información crediticia de la Ley Orgánica 3/2018, de 5 de diciembre, de
      protección de datos personales y garantía de los derechos digitales.

      #linebreak()

    + En caso de que en el plazo de treinta (30) días, el Prestatario incumpla
      o, cumpla defectuosa o parcialmente, las obligaciones derivadas del
      Contrato de Línea de Crédito, autoriza expresamente al Prestamista, desde
      este momento, para que pueda #strong[ceder su derecho de reclamación de
      los pagos atrasados a un Tercero.]

      #linebreak()

    + #strong[Comisión por gestiones efectivas de recobro:]

      #comision-recobro(vars)

      #linebreak()

    + #marked[Con la firma de las presentes condiciones generales de
      contratación, el Prestatario acepta y declara, al tiempo de hacer el pago,
      imputar cualquier cantidad recibida por el Prestamista cuando el
      Prestatario se encuentre en situación de mora, ya sea de una o varias
      cuotas, ya sea una vez vencida la línea de Crédito, se imputará por orden
      cronológico de la siguiente manera:]

      #num-dash-list[
      + Comisión por impago.
      + Intereses ordinarios.
      + Capital.
      ]

      #linebreak()

    + Pasados 30 días de mora, el Prestamista se reserva el derecho de reportar
      el caso a la ASNEF-EQUIFAX y a otros registros de morosos de conformidad
      con lo dispuesto en el artículo 20 de la Ley Orgánica 3/2018, de 5 de
      diciembre, de Protección de Datos Personales y garantía de los derechos
      digitales.
    ]

    #linebreak()
]
