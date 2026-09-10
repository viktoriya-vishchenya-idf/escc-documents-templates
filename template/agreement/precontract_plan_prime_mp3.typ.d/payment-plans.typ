#import "common/table_styles.typ": paymen-plan-table

#let paymentPlansExample1(vars) = [
*#underline[EJEMPLO 1: DOCE CUOTAS FIJAS MENSUALES];*

#linebreak()
Teniendo en cuenta las siguientes circunstancias:

#linebreak()
- límite de crédito concedido de 1500 EUR;

- cómputo de tiempo sobre la base de un año de 365 días;

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en *12
  cuotas fijas mensuales*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 11 cuotas mensuales de 140,38 EUR
  y una última cuota de 140,35 EUR, siendo el importe total adeudado que
  pagarías al final del año de 1684,53 EUR (de los cuales, los intereses
  serán 184,53 EUR);

- la Tasa Anual Equivalente (TAE) hace referencia al coste total del
  crédito asumiendo que todos los pagos son atendidos en su fecha
  correspondiente. Para este ejemplo, el *TAE sería de #vars.TAE~%*;

- La TAE se calcula aplicando la siguiente fórmula:

#linebreak()
*TAE=(1+i/n)^n-1*

#linebreak()
donde “*i*” es el interés nominal de la operación, en este caso
«TIN»~% anual

y “*n*” es el número de pagos teóricos en un año, en este caso
12.
#pagebreak()
#paymen-plan-table(
    table.header(table.cell()[*Interés*], table.cell()[*#vars.TIN%*], [], [], [], [],),
    table.hline(),
    table.cell()[*TAE*], table.cell()[*#vars.TAE%*], [], [], table.cell()[#text(size: 10pt)[*~TAE=(1+i/n)^n-1*];], [],
    table.cell()[*Mes*], table.cell()[*Días*], table.cell()[*Cuota*], table.cell()[*Principal*], table.cell()[*Interés*], table.cell()[*Capital
    pendiente*],
    table.cell()[0], table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[1
    500,00 €],
    table.cell()[1], table.cell()[31], table.cell()[140,44
    €], table.cell()[112,33
    €], table.cell()[28,12 €], table.cell()[1
    387,67 €],
    table.cell()[2], table.cell()[28], table.cell()[140,44
    €], table.cell()[116,95
    €], table.cell()[23,49 €], table.cell()[1
    270,73 €],
    table.cell()[3], table.cell()[31], table.cell()[140,44
    €], table.cell()[116,62
    €], table.cell()[23,82 €], table.cell()[1
    154,10 €],
    table.cell()[4], table.cell()[30], table.cell()[140,44
    €], table.cell()[119,51
    €], table.cell()[20,94 €], table.cell()[1
    034,60 €],
    table.cell()[5], table.cell()[31], table.cell()[140,44
    €], table.cell()[121,05
    €], table.cell()[19,39
    €], table.cell()[913,55 €],
    table.cell()[6], table.cell()[30], table.cell()[140,44
    €], table.cell()[123,87
    €], table.cell()[16,57
    €], table.cell()[789,68 €],
    table.cell()[7], table.cell()[31], table.cell()[140,44
    €], table.cell()[125,64
    €], table.cell()[14,80
    €], table.cell()[664,04 €],
    table.cell()[8], table.cell()[31], table.cell()[140,44
    €], table.cell()[128,00
    €], table.cell()[12,45
    €], table.cell()[536,04 €],
    table.cell()[9], table.cell()[30], table.cell()[140,44
    €], table.cell()[130,72
    €], table.cell()[9,72
    €], table.cell()[405,32 €],
    table.cell()[10], table.cell()[31], table.cell()[140,44
    €], table.cell()[132,84
    €], table.cell()[7,60
    €], table.cell()[272,48 €],
    table.cell()[11], table.cell()[30], table.cell()[140,44
    €], table.cell()[135,50
    €], table.cell()[4,94
    €], table.cell()[136,98 €],
    table.cell()[12], table.cell()[31], table.cell()[139,55
    €], table.cell()[136,98
    €], table.cell()[2,57 €], table.cell()[0,00
    €],
  )

*#underline[ \
];*
]

#let paymentPlansExample2(vars) = [
*#underline[EJEMPLO 2: SEIS CUOTAS FIJAS MENSUALES Y UNA
AMORTIZACIÓN TOTAL POSTERIORMENTE];*

#linebreak()
Teniendo en cuenta las siguientes circunstancias:

#linebreak()
- límite de crédito concedido de 1500 EUR;

- cómputo de tiempo sobre la base de un año de 365 días;

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en *6 cuotas
  fijas mensuales y una amortización total posteriormente*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 6 cuotas mensuales de 140,18 EUR y
  una última cuota de 791,35 EUR, siendo el importe total adeudado que
  pagarías al final del año de 1632,43 EUR (de los cuales, los intereses
  serán 132,42 EUR y la comisión de cancelación anticipada de 0 EUR;

- la Tasa Anual Equivalente (TAE) hace referencia al coste total del
  crédito asumiendo que todos los pagos son atendidos. Para este ejemplo,
  el *TAE sería de #vars.TAE~%*;

- la TAE se calcula aplicando la siguiente fórmula:

#linebreak()
*TAE=(1+i/n)^n-1*

#linebreak()
Donde *“i”* es el interés nominal de la operación, en este caso
#vars.TIN~% anual y

“*n*” es el número de pagos teóricos en un año, en este caso, 6.
#pagebreak()
#paymen-plan-table(
    table.header([*Interés*], table.cell()[*#vars.TIN%*], [], [], [], [],),
    table.hline(),
    [*TAE*], table.cell()[*#vars.TAE%*], [], [], table.cell()[#text(size: 10pt)[*~TAE=(1+i/n)^n-1*];], [],
    table.cell()[*Mes*], table.cell()[*Días*], table.cell()[*Cuota*], table.cell()[*Principal*], table.cell()[*Interés*], table.cell()[*Capital*

    *pendiente*

    ],
    table.cell()[0], table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[1
    500,00 €],
    table.cell()[1], table.cell()[31], table.cell()[140,44
    €], table.cell()[112,33
    €], table.cell()[28,12 €], table.cell()[1
    387,67 €],
    table.cell()[2], table.cell()[28], table.cell()[140,44
    €], table.cell()[116,95
    €], table.cell()[23,49 €], table.cell()[1
    270,73 €],
    table.cell()[3], table.cell()[31], table.cell()[140,44
    €], table.cell()[116,62
    €], table.cell()[23,82 €], table.cell()[1
    154,10 €],
    table.cell()[4], table.cell()[30], table.cell()[140,44
    €], table.cell()[119,51
    €], table.cell()[20,94 €], table.cell()[1
    034,60 €],
    table.cell()[5], table.cell()[31], table.cell()[140,44
    €], table.cell()[121,05
    €], table.cell()[19,39
    €], table.cell()[913,55 €],
    table.cell()[6], table.cell()[30], table.cell()[140,44
    €], table.cell()[123,87
    €], table.cell()[16,57
    €], table.cell()[789,68 €],
    table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[],
    table.cell(colspan: 2)[Cuota Final], table.cell()[789,68
    €], table.cell()[], table.cell()[], table.cell()[789,68
    €],
    table.cell(colspan: 2)[Comisión
    anticipada], table.cell()[0,00
    €], table.cell()[], table.cell()[], table.cell()[],
  )
]

#let paymentPlansExample3(vars) = [
*#underline[EJEMPLO 3: PAGO MÍNIMO];*

#linebreak()
Teniendo en cuenta las siguientes circunstancias:

#linebreak()
- límite de crédito concedido de 1500 EUR;

- cómputo de tiempo sobre la base de un año de 365 días

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en base *al
  pago mínimo*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 62 cuotas mensuales variables,
  siendo el importe total adeudado que pagarías al final del préstamo de
  2241,98 EUR (de los cuales, los intereses serán 741,98 EUR). Podrás
  reducir esta cantidad si aumentas la cantidad a pagar cada mes;

- la Tasa Anual Equivalente (TAE) hace referencia al coste total del
  crédito asumiendo que todos los pagos son atendidos en su fecha
  correspondiente. Para este ejemplo, *el TAE sería de #vars.TAE~%;*

- la TAE se calcula aplicando la siguiente fórmula:

#linebreak()
*TAE=(1+i/n)^n-1*

#linebreak()
Donde *“i”* es el interés nominal de la operación, en este caso
«TIN»% anual y “*n*” es el número de pagos teóricos en un año,
en este caso, 12.

#pagebreak()
#paymen-plan-table(
    columns: (13.28%, 18.48%, 16.54%, 15.01%, 18.21%, 18.47%),
    table.header(table.cell()[*Interés*], table.cell()[*#vars.TIN%*], [], [], [], [],),
    table.hline(),
    table.cell()[*TAE*], table.cell()[*#vars.TAE%*], [], [],
    table.cell()[#text(size: 10pt)[*~TAE=(1+i/n)^n-1*];], [],
  )

#paymen-plan-table(
    columns: (14.86%, 14.86%, 17.62%, 17.55%, 15.80%, 19.31%),
    table.header(table.cell()[*Mes*], table.cell()[*Días*], table.cell()[*Cuota*], table.cell()[*Principal*], table.cell()[*Interés*], table.cell()[*Capital Pendiente*],),
    table.hline(),
    table.cell()[0], table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[1.500,00 €],
    table.cell()[1], table.cell()[31], table.cell()[73,12 €], table.cell()[45,00 €], table.cell()[28,12 €], table.cell()[1.455,00 €],
    table.cell()[2], table.cell()[28], table.cell()[68,29 €], table.cell()[43,65 €], table.cell()[24,64 €], table.cell()[1.411,35 €],
    table.cell()[3], table.cell()[31], table.cell()[68,80 €], table.cell()[42,34 €], table.cell()[26,46 €], table.cell()[1.369,01 €],
    table.cell()[4], table.cell()[30], table.cell()[65,91 €], table.cell()[41,07 €], table.cell()[24,84 €], table.cell()[1.327,94 €],
    table.cell()[5], table.cell()[31], table.cell()[64,73 €], table.cell()[39,84 €], table.cell()[24,89 €], table.cell()[1.288,10 €],
    table.cell()[6], table.cell()[30], table.cell()[62,01 €], table.cell()[38,64 €], table.cell()[23,37 €], table.cell()[1.249,46 €],
    table.cell()[7], table.cell()[31], table.cell()[60,90 €], table.cell()[37,48 €], table.cell()[23,42 €], table.cell()[1.211,98 €],
    table.cell()[8], table.cell()[31], table.cell()[59,08 €], table.cell()[36,36 €], table.cell()[22,72 €], table.cell()[1.175,62 €],
    table.cell()[9], table.cell()[30], table.cell()[56,60 €], table.cell()[35,27 €], table.cell()[21,33 €], table.cell()[1.140,35 €],
    table.cell()[10], table.cell()[31], table.cell()[55,59 €], table.cell()[34,21 €], table.cell()[21,38 €], table.cell()[1.106,14 €],
    table.cell()[11], table.cell()[30], table.cell()[53,24 €], table.cell()[33,18 €], table.cell()[20,06 €], table.cell()[1.072,96 €],
    table.cell()[12], table.cell()[31], table.cell()[52,33 €], table.cell()[32,19 €], table.cell()[20,14 €], table.cell()[1.040,77 €],
    table.cell()[13], table.cell()[31], table.cell()[50,75 €], table.cell()[31,22 €], table.cell()[19,53 €], table.cell()[1.009,55 €],
    table.cell()[14], table.cell()[28], table.cell()[47,41 €], table.cell()[30,29 €], table.cell()[17,12 €], table.cell()[979,26 €],
    table.cell()[15], table.cell()[31], table.cell()[47,76 €], table.cell()[29,38 €], table.cell()[18,38 €], table.cell()[949,88 €],
    table.cell()[16], table.cell()[30], table.cell()[45,71 €], table.cell()[28,50 €], table.cell()[17,21 €], table.cell()[921,38 €],
    table.cell()[17], table.cell()[31], table.cell()[44,93 €], table.cell()[27,64 €], table.cell()[17,29 €], table.cell()[893,74 €],
    table.cell()[18], table.cell()[30], table.cell()[43,02 €], table.cell()[26,81 €], table.cell()[16,21 €], table.cell()[866,93 €],
    table.cell()[19], table.cell()[31], table.cell()[42,29 €], table.cell()[26,01 €], table.cell()[16,28 €], table.cell()[840,92 €],
    table.cell()[20], table.cell()[31], table.cell()[41,02 €], table.cell()[25,23 €], table.cell()[15,79 €], table.cell()[815,69 €],
    table.cell()[21], table.cell()[30], table.cell()[39,25 €], table.cell()[24,47 €], table.cell()[14,78 €], table.cell()[791,22 €],
    table.cell()[22], table.cell()[31], table.cell()[38,59 €], table.cell()[23,74 €], table.cell()[14,85 €], table.cell()[767,48 €],
    table.cell()[23], table.cell()[30], table.cell()[36,94 €], table.cell()[23,02 €], table.cell()[13,92 €], table.cell()[744,46 €],
    table.cell()[24], table.cell()[31], table.cell()[36,30 €], table.cell()[22,33 €], table.cell()[13,97 €], table.cell()[722,13 €],
    table.cell()[25], table.cell()[31], table.cell()[35,22 €], table.cell()[21,66 €], table.cell()[13,56 €], table.cell()[700,47 €],
    table.cell()[26], table.cell()[28], table.cell()[32,89 €], table.cell()[21,01 €], table.cell()[11,88 €], table.cell()[679,46 €],
    table.cell()[27], table.cell()[31], table.cell()[33,13 €], table.cell()[20,38 €], table.cell()[12,75 €], table.cell()[659,08 €],
    table.cell()[28], table.cell()[30], table.cell()[31,73 €], table.cell()[19,77 €], table.cell()[11,96 €], table.cell()[639,31 €],
    table.cell()[29], table.cell()[31], table.cell()[31,19 €], table.cell()[19,18 €], table.cell()[12,01 €], table.cell()[620,13 €],
    table.cell()[30], table.cell()[30], table.cell()[29,85 €], table.cell()[18,60 €], table.cell()[11,25 €], table.cell()[601,53 €],
    table.cell()[31], table.cell()[31], table.cell()[29,36 €], table.cell()[18,05 €], table.cell()[11,31 €], table.cell()[583,48 €],
    table.cell()[32], table.cell()[31], table.cell()[28,47 €], table.cell()[17,50 €], table.cell()[10,97 €], table.cell()[565,98 €],
    table.cell()[33], table.cell()[30], table.cell()[27,25 €], table.cell()[16,98 €], table.cell()[10,27 €], table.cell()[549,00 €],
    table.cell()[34], table.cell()[31], table.cell()[26,78 €], table.cell()[16,47 €], table.cell()[10,31 €], table.cell()[532,53 €],
    table.cell()[35], table.cell()[30], table.cell()[25,64 €], table.cell()[15,98 €], table.cell()[9,66 €], table.cell()[516,55 €],
    table.cell()[36], table.cell()[31], table.cell()[25,20 €], table.cell()[15,50 €], table.cell()[9,70 €], table.cell()[501,05 €],
    table.cell()[37], table.cell()[31], table.cell()[25,00 €], table.cell()[15,58 €], table.cell()[9,42 €], table.cell()[485,47 €],
    table.cell()[38], table.cell()[28], table.cell()[25,00 €], table.cell()[16,77 €], table.cell()[8,23 €], table.cell()[468,70 €],
    table.cell()[39], table.cell()[31], table.cell()[25,00 €], table.cell()[16,20 €], table.cell()[8,80 €], table.cell()[452,50 €],
    table.cell()[40], table.cell()[30], table.cell()[25,00 €], table.cell()[16,79 €], table.cell()[8,21 €], table.cell()[435,71 €],
    table.cell()[41], table.cell()[31], table.cell()[25,00 €], table.cell()[16,81 €], table.cell()[8,19 €], table.cell()[418,90 €],
    table.cell()[42], table.cell()[30], table.cell()[25,00 €], table.cell()[17,39 €], table.cell()[7,61 €], table.cell()[401,51 €],
    table.cell()[43], table.cell()[31], table.cell()[25,00 €], table.cell()[17,46 €], table.cell()[7,54 €], table.cell()[384,05 €],
    table.cell()[44], table.cell()[31], table.cell()[25,00 €], table.cell()[17,79 €], table.cell()[7,21 €], table.cell()[366,26 €],
    table.cell()[45], table.cell()[30], table.cell()[25,00 €], table.cell()[18,36 €], table.cell()[6,64 €], table.cell()[347,90 €],
    table.cell()[46], table.cell()[31], table.cell()[25,00 €], table.cell()[18,46 €], table.cell()[6,54 €], table.cell()[329,44 €],
    table.cell()[47], table.cell()[30], table.cell()[25,00 €], table.cell()[19,02 €], table.cell()[5,98 €], table.cell()[310,42 €],
    table.cell()[48], table.cell()[31], table.cell()[25,00 €], table.cell()[19,17 €], table.cell()[5,83 €], table.cell()[291,25 €],
    table.cell()[49], table.cell()[31], table.cell()[25,00 €], table.cell()[19,53 €], table.cell()[5,47 €], table.cell()[271,72 €],
    table.cell()[50], table.cell()[28], table.cell()[25,00 €], table.cell()[20,40 €], table.cell()[4,60 €], table.cell()[251,32 €],
    table.cell()[51], table.cell()[31], table.cell()[25,00 €], table.cell()[20,28 €], table.cell()[4,72 €], table.cell()[231,04 €],
    table.cell()[52], table.cell()[30], table.cell()[25,00 €], table.cell()[20,81 €], table.cell()[4,19 €], table.cell()[210,23 €],
    table.cell()[53], table.cell()[31], table.cell()[25,00 €], table.cell()[21,05 €], table.cell()[3,95 €], table.cell()[189,18 €],
    table.cell()[54], table.cell()[30], table.cell()[25,00 €], table.cell()[21,57 €], table.cell()[3,43 €], table.cell()[167,61 €],
    table.cell()[55], table.cell()[31], table.cell()[25,00 €], table.cell()[21,85 €], table.cell()[3,15 €], table.cell()[145,76 €],
    table.cell()[56], table.cell()[31], table.cell()[25,00 €], table.cell()[22,26 €], table.cell()[2,74 €], table.cell()[123,50 €],
    table.cell()[57], table.cell()[30], table.cell()[25,00 €], table.cell()[22,76 €], table.cell()[2,24 €], table.cell()[100,74 €],
    table.cell()[58], table.cell()[31], table.cell()[25,00 €], table.cell()[23,11 €], table.cell()[1,89 €], table.cell()[77,63 €],
    table.cell()[59], table.cell()[30], table.cell()[25,00 €], table.cell()[23,59 €], table.cell()[1,41 €], table.cell()[54,04 €],
    table.cell()[60], table.cell()[31], table.cell()[25,00 €], table.cell()[23,99 €], table.cell()[1,01 €], table.cell()[30,05 €],
    table.cell()[61], table.cell()[31], table.cell()[25,00 €], table.cell()[24,44 €], table.cell()[0,56 €], table.cell()[5,61 €],
    table.cell()[62], table.cell()[28], table.cell()[5,70 €], table.cell()[5,61 €], table.cell()[0,09 €], table.cell()[0,00 €],
    table.cell()[*TOTAL*], table.cell()[], table.cell()[*2241,98 €*], table.cell()[*1500,00 €*], table.cell()[*741,98 €*], table.cell()[],
  )
]

