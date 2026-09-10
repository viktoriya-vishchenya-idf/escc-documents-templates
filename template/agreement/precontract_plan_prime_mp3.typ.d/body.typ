#import "tables/partner-data.typ": partner-data, partner-data-distance
#import "tables/table-1a-prestamista.typ": table-1a-prestamista
#import "tables/table-2-descripcion.typ": table-2-descripcion
#import "tables/table-3-costes.typ": table-3-costes
#import "tables/table-4-otros-aspectos.typ": table-4-otros-aspectos
#import "tables/table-5-a1-prestamista.typ": table-5-a1-prestamista
#import "tables/table-5-b-contrato.typ": table-5-b-contrato
#import "tables/table-5-c-reclamacion.typ": table-5-c-reclamacion
#import "payment-plans.typ": paymentPlansExample1, paymentPlansExample2, paymentPlansExample3
#import "common/default_styles.typ": marked, body-header-size, body-size
#import "common/table_styles.typ": paymen-plan-table, nested-table

#let doc_render(vars) = [
#align(center)[
    #set text(size: body-header-size)
    *Información Normalizada Europea*

    *sobre crédito al consumo (INE)*
]

#linebreak()
IDFinance Plazo, S.L.U., comprometido con la debida rigurosidad y
cumplimiento de la normativa vigente europea, se esfuerza por
transmitirle la información adecuada y necesaria para que pueda tomar
una decisión correcta a la hora de valorar si la opción de financiación
ofrecida, de acuerdo con sus preferencias indicadas, le conviene y es de
posible cumplimiento dada su situación financiera.

#linebreak()
A continuación, le proporcionamos información detallada en un formato
estándar europeo para la información relativa a la Línea de Crédito.
Esto se conoce como información normalizada europea sobre el crédito al
consumo (INE).

#table-1a-prestamista(vars)

#partner-data(vars.PARTNER_DATA)

#table-2-descripcion(vars)

#table-3-costes(vars)

#table-4-otros-aspectos(vars)

#table-5-a1-prestamista(vars)

#partner-data-distance(vars.PARTNER_DATA)

#table-5-b-contrato(vars)

#pagebreak()
#table-5-c-reclamacion(vars)

#pagebreak()
#align(center)[*#underline[INFORMACIÓN SOBRE EL CREDITO #emph[REVOLVING];];*]

#linebreak()
Para que se entienda mejor el funcionamiento de la línea de crédito, le
informamos que:

#linebreak()
- La modalidad de pago establecida es tipo #emph[*revolving*.]

#linebreak()
- El contrato NO prevé la capitalización de cantidades vencidas,
  exigibles y no satisfechas#emph[.]

#linebreak()
- El Prestatario no tiene la facultad de modificar la modalidad de pago
  establecida salvo para realizar el pago anticipado Parcial o
  Total#emph[.]

#linebreak()
- En ningún caso el pago mensual mínimo será menor a la suma de los
  siguientes conceptos: (i) el importe mayor de las siguientes cifras:
  *#underline[25€];* *,* #underline[o] (ii) *#underline[3% del importe
  principal pendiente, incluyendo en ambos casos los intereses devengados
  correspondientes al período de liquidación];*; mas las comisiones de
  reclamación de cuota impagada; más (ii) los intereses correspondientes
  al periodo de liquidación; más (iii) el pago mínimo de la facturación
  anterior, si estuviese impagada; más (iv) la penalización por impago del
  periodo de liquidación#emph[.]

#linebreak()
- *Se advierte al Prestatario que la elección de cuotas de
  importe reducido podría dar lugar a una amortización del crédito más
  prolongada en el tiempo, con el consiguiente efecto de devengarse un
  mayor importe de intereses#emph[.];*

#linebreak()
- A continuación, se incluyen varios ejemplos representativos de crédito
  con varias alternativas de financiación determinadas en función de la
  cuota mínima que pueda establecerse para el reembolso del crédito con
  arreglo al contrato#emph[.]

#pagebreak()
#paymentPlansExample1(vars)
#pagebreak()
#paymentPlansExample2(vars)

#pagebreak()
#paymentPlansExample3(vars)

]
