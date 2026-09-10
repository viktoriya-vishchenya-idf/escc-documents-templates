#import "../common/default_styles.typ": bullet-list, dash-list, marked, section-bold-h1, paren-list
#import "../common/table_styles.typ": boxed-doc-table

// Пункт 8.6: если счёт выставляется 1-го числа, крайний срок — тот же
// месяц, иначе следующий (в .docx это Velocity-#if внутри MERGEFIELD).
#let settlement-dates(vars) = {
    [del día #vars.REPAYMENT_DAY al día #vars.DUE_DAY ]
    if vars.REPAYMENT_DAY == "1" { [de cada mes] } else { [del mes siguiente] }
}

#let clause-08-amortizacion-linea-credito(vars) = [
    #section-bold-h1[8\. Amortización de la línea de Crédito]

    8.1. La línea de Crédito tendrá una #underline[duración indefinida.]

    #linebreak()
    #marked[8.2. #underline[#strong[Modalidad de pago:]]]

    #marked[8.2.1. #underline[La modalidad de pago prevista de la línea de
    crédito defecto es] #underline[#strong[revolving]] #underline[mediante cuota
    de] #underline[#strong[Pago Mínimo.]]]

    #underline[#marked[8.2.2. Asimismo, el Prestatario podrá realizar #strong[en
    cualquier momento el pago anticipado parcial o total.]]]

    #linebreak()
    #underline[8.3. El Prestatario no tiene la facultad de modificar la
    modalidad de pago #emph[#strong[revolving]] establecida.]

    #linebreak()
    8.4. #underline[Todos los meses durante los cuales el Prestatario tenga
    cantidades dispuestas bajo la Línea de Crédito y no amortizadas tendrá́ que
    abonar el pago mensual mínimo.]

    #linebreak()
    #marked[8.5. El Prestatario tiene la facultad de establecer el importe del
    #underline[#strong[Pago Mínimo]], siempre #strong[que cubra el importe mayor
    de las siguientes cifras:]]

    #bullet-list[
      - #marked[5 Euros o 1,85% del importe principal dispuesto, restando los
        intereses devengados y las penalizaciones por impago; más]
      - #marked[los intereses correspondientes al periodo de liquidación; más]
      - #marked[los intereses correspondientes e impagados del periodo de
        liquidación anterior (si estuviese impagado); más]
      - #marked[la comisión por impago del periodo de liquidación anterior (si
        este estuviera impagado).]
    ]

    #linebreak()
    #underline[#marked[La elección de cuotas de importe reducido podría dar
    lugar a una amortización del crédito más prolongada en el tiempo, con el
    consiguiente efecto de devengarse un mayor importe de intereses]]

    #linebreak()
    8.6. La #strong[amortización] de la línea de Crédito, esto es, el número y
    periodicidad de los pagos, deberán ser satisfechos en la fecha de
    liquidación de cada periodo, que se establece, de forma predeterminada,
    #underline[#settlement-dates(vars)#[.]]

    #linebreak()
    8.7. #underline[#strong[Pago de las cuotas:]]

    8.7.1. El #underline[#strong[pago de las cuotas]] de la línea de Crédito se
    realizará #strong[mensualmente] mediante alguna de las siguientes opciones
    por orden de prelación:

    #paren-list[
      + #underline[cargo en la cuenta de pago] que tiene el Prestatario en la
        Aplicación móvil; en el caso que no pueda ser satisfecho,
      + cargo en cualesquiera de las #underline[tarjetas que el Prestatario
        proporcione en la solicitud de la línea de Crédito], a través de la
        Entidad colaboradora y de la entidad de pago PAYNOPAIN FINANCIAL
        SERVICES, S.L. y que se anuncia en el momento previo a su uso de forma
        clara, y, si no fuese posible por ninguno de los dos medios anteriores,
      + #underline[cargo en la Cuenta Corriente de Domiciliación del
        Prestatario] indicada durante el proceso de solicitud; y
      + #underline[transferencia bancaria a la cuenta del Prestamista, indicada
        en el área personal de la App Plazo.]
    ]

    #marked[El Prestatario autoriza al Prestamista a hacer los cargos
    recurrentes que sean necesarios tanto en la cuenta que tenga en la App
    Plazo, en las tarjetas de pago indicadas o bien en la Cuenta Corriente de
    Domiciliación hasta que el importe correspondiente a las comisiones, cuotas
    mensuales o cuotas mensuales vencidas sea liquidado.]

    #linebreak()
    En caso de duda sobre la forma de realizar el pago, el Prestatario puede
    ponerse en contacto con el departamento de atención al cliente, a través de
    la dirección clientes\@plazo.es

    #linebreak()
    8.7.2. #strong[Proveedor de servicios de pago:]

    El servicio de pago a través de tarjeta bancaria se procesa a través de la
    entidad de pago:

    #dash-list[
      - PAYNOPAIN FINANCIAL SERVICES, S.L. (“PaynoPain”), Entidad de pago
        supervisada e inscrita en el registro especial del Banco de España con
        código 6899. Domiciliada en Paseo Castellana 77 28046 Madrid, NIF
        B88513593. En caso de incidencias relacionadas con este proveedor deberá
        ponerse en contacto con él a través de la dirección
        #link("mailto:sac@paynopain.com")[sac\@paynopain.com]
      - UNNAX REGULATORY SERVICES EDE, S.L., (“Unnax”) es una entidad de dinero
        electrónico autorizada para prestar distintos servicios de pago y de
        dinero electrónico. Unnax se encuentra debidamente supervisada por el
        Banco de España e inscrita en el Registro Especial de Entidades con el
        número 6719. En caso de incidencias relacionadas con este proveedor
        deberá ponerse en contacto con él a través de la dirección
        atencionalcliente\@unnax.com”
    ]

    El Prestamista no almacen los datos de tarjetas bancarias sin previa
    autorización y consentimiento del Prestatario. El Prestamista, cuenta con
    los proveedores de servicios de pago anteriormente indicados, que cumplen la
    normativa de Seguridad de Datos en la Industria de Tarjetas de Pago PCI DSS
    cumpliendo con toda la normativa vigente de seguridad.

    #linebreak()
    8.8. El pago se considerará realizado una vez figure como recibido en la
    cuenta bancaria del Prestamista.

    #linebreak()
    #marked[8.9. Con la aceptación del presente contrato, las Partes acuerdan
    que las cantidades abonadas por el Prestatario al Prestamista se utilicen
    para satisfacer sus obligaciones de pago siguiendo, por orden cronológico,
    este #strong[orden:]]

    #paren-list[
      + #marked[Comisión por impago,]
      + #marked[intereses devengados y]
      + #marked[reembolso del principal del Crédito.]
    ]

    #linebreak()
    #underline[En consecuencia, en aquellos meses en los que haya cantidades
    debidas que se correspondan total o parcialmente con Intereses y/u otros
    gastos y dichas cuantías cubriesen por sí mismas la totalidad del pago del
    correspondiente mes, dicho pago no incluiría el reembolso de principal del
    Crédito en el referido mes.]

    #linebreak()
    #boxed-doc-table(
      columns: (100.00%),
      // row 0
      table.cell()[
        A modo meramente #underline[ejemplificativo,] si el pago mensual asciende a
        100€ y el Prestatario debiese abonar ese mes un total de 30€ en concepto de
        comisión por impago y 70€ en concepto de Intereses, lo cual alcanzaría una
        cantidad de 100€ (es decir, la cuota mensual), no corresponderá incluir en
        dicho pago mensual cantidad alguna correspondiente al reembolso del
        principal del Crédito.
      ],
    )

    #linebreak()
    #underline[La Línea de Crédito, #strong[no prevé la capitalización de
    cantidades vencidas, exigibles y no satisfechas]. Es decir, el principal no
    pagadero durante uno o varios meses se podrá acumular y distribuir
    proporcionalmente en los meses sucesivos y, en consecuencia, el importe del
    principal no abonado acumulará el Interés correspondiente durante el período
    en que no haya sido pagado.]

    #linebreak()
    8.10. #strong[Advertencia:] #strong[En caso de impago de cualquier cuota
    mensual impagada, el Prestamista repercutirá el coste de reclamación de
    cuota impagada], de acuerdo con lo establecido en la #strong[Cláusula 10]
    siguiente de estas Condiciones Generales, salvo en el caso de que tal falta
    de pago se debiera a errores administrativos o de gestión no imputables al
    Prestatario.

    #linebreak()
    8.11. La #strong[cantidad total] que debe #strong[pagar] el Prestatario al
    Prestamista estará siempre disponible en el #underline[#strong[Área
    Personal]] #underline[del Prestatario de la Aplicación móvil de la entidad
    colaboradora] (Plazo), incluyendo todas las comisiones, cargos y gastos, así
    como todos los impuestos pagados a través del proveedor.

    #linebreak()
    8.12. El Prestamista no se hace responsable de los posibles costes
    adicionales que en forma de impuestos o gastos deban abonarse. En todo caso,
    el Prestamista no facturará al Prestatario ningún coste adicional
    relacionado con la tramitación de la Solicitud del Préstamo.

    #linebreak()
    8.13. #strong[Información periódica:]

    8.13.1. Con la firma de las presentes condiciones de contratación,
    #underline[el Prestatario consiente disponer de todos los extractos
    mensuales y trimestrales en la Aplicación móvil de Plazo]. El Prestamista
    informa que este consentimiento del Prestatario podrá ser retirado por el
    Prestatario en cualquier momento y por cualquier motivo sin ningún
    inconveniente o perjuicio, mediante el envío de un correo electrónico o
    llamando al Servicio de Atención al Cliente del Prestamista.

    8.13.2. No obstante, en caso de que no se haya indicado ninguna dirección de
    correo electrónico, el estado de cuenta podrá enviarse a la dirección de
    correo postal indicada por el Prestatario.

    8.13.3. La no recepción del estado de cuenta no eximirá de la obligación de
    reembolsar las disposiciones de fondos a tiempo.

    8.13.4. El pago se considerará realizado en la fecha en que el importe sea
    abonado en la cuenta del Prestamista.

    #linebreak()
]
