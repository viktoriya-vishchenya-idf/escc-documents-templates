#import "common/table_styles.typ": paymen-plan-table

#let paymentPlansExample1(vars) = [
*#underline[EJEMPLO 1: DOCE CUOTAS FIJAS MENSUALES];*

#linebreak()
Teniendo en cuenta las siguientes circunstancias:

#linebreak()
- límite de crédito concedido de 1500.00 EUR;

- cómputo de tiempo sobre la base de un año de 365 días;

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en *12
  cuotas fijas mensuales*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 11 cuotas mensuales de 140,44 EUR
  y una última cuota de 139,55 EUR, siendo el importe total adeudado que
  pagarías al final del año de 1684,41 EUR (de los cuales, los intereses
  serán 184,41 EUR);

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
- límite de crédito concedido de 1500.00 EUR;

- cómputo de tiempo sobre la base de un año de 365 días;

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en *6 cuotas
  fijas mensuales y una amortización total posteriormente*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 6 cuotas mensuales de 140,44 EUR y
  una última cuota de 789,68 EUR, siendo el importe total adeudado que
  pagarías al final del año de 1632,33 EUR (de los cuales, los intereses
  serán 132,33 EUR y la comisión de cancelación anticipada de 0 EUR;

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
- límite de crédito concedido de 1500.00 EUR;

- cómputo de tiempo sobre la base de un año de 365 días

- disposición total del límite de crédito concedido desde el primer día
  de vigencia del contrato;

- amortización total del límite de crédito concedido en base *al
  pago mínimo*;

- vigencia del crédito durante el periodo de tiempo acordado y
  cumplimiento de las respectivas obligaciones de las partes en las
  condiciones y plazos acordados en el contrato;

- mantenimiento del tipo de interés nominal y de los demás gastos al
  nivel inicial. En este caso pagarías: 146 cuotas mensuales variables,
  siendo el importe total adeudado que pagarías al final del préstamo de
  2858,63 EUR (de los cuales, los intereses serán 1358,63 EUR). Podrás
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
// стиль последней таблицы — см. last-table.typ; columns из стиля
#paymen-plan-table(
    table.header(table.cell()[*Interés*], table.cell()[*#vars.TIN%*], table.cell()[], [], [], [],),
    table.hline(),
    table.cell()[*TAE*], table.cell()[*#vars.TAE%*], table.cell()[], [], [#text(size: 10pt)[*~TAE=(1+i/n)^n-1*];], [],
    table.cell()[*Mes*], table.cell()[*Días*], table.cell()[*Cuota*], table.cell()[*Principal*], table.cell()[*Interés*], table.cell()[*Capital
    pendiente*],
    table.cell()[0], table.cell()[], table.cell()[], table.cell()[], table.cell()[], table.cell()[1
    500,00 €],
    table.cell()[1], table.cell()[31], table.cell()[55,87
    €], table.cell()[27,75
    €], table.cell()[28,12 €], table.cell()[1
    472,25 €],
    table.cell()[2], table.cell()[28], table.cell()[52,16
    €], table.cell()[27,24
    €], table.cell()[24,93 €], table.cell()[1
    445,01 €],
    table.cell()[3], table.cell()[31], table.cell()[53,82
    €], table.cell()[26,73
    €], table.cell()[27,09 €], table.cell()[1
    418,28 €],
    table.cell()[4], table.cell()[30], table.cell()[51,97
    €], table.cell()[26,24
    €], table.cell()[25,73 €], table.cell()[1
    392,04 €],
    table.cell()[5], table.cell()[31], table.cell()[51,85
    €], table.cell()[25,75
    €], table.cell()[26,09 €], table.cell()[1
    366,29 €],
    table.cell()[6], table.cell()[30], table.cell()[50,06
    €], table.cell()[25,28
    €], table.cell()[24,78 €], table.cell()[1
    341,01 €],
    table.cell()[7], table.cell()[31], table.cell()[49,95
    €], table.cell()[24,81
    €], table.cell()[25,14 €], table.cell()[1
    316,20 €],
    table.cell()[8], table.cell()[31], table.cell()[49,02
    €], table.cell()[24,35
    €], table.cell()[24,67 €], table.cell()[1
    291,85 €],
    table.cell()[9], table.cell()[30], table.cell()[47,33
    €], table.cell()[23,90
    €], table.cell()[23,43 €], table.cell()[1
    267,96 €],
    table.cell()[10], table.cell()[31], table.cell()[47,22
    €], table.cell()[23,46
    €], table.cell()[23,77 €], table.cell()[1
    244,50 €],
    table.cell()[11], table.cell()[30], table.cell()[45,60
    €], table.cell()[23,02
    €], table.cell()[22,57 €], table.cell()[1
    221,48 €],
    table.cell()[12], table.cell()[31], table.cell()[45,49
    €], table.cell()[22,60
    €], table.cell()[22,90 €], table.cell()[1
    198,88 €],
    table.cell()[13], table.cell()[31], table.cell()[44,65
    €], table.cell()[22,18
    €], table.cell()[22,47 €], table.cell()[1
    176,70 €],
    table.cell()[14], table.cell()[28], table.cell()[41,69
    €], table.cell()[21,77
    €], table.cell()[19,92 €], table.cell()[1
    154,93 €],
    table.cell()[15], table.cell()[31], table.cell()[43,01
    €], table.cell()[21,37
    €], table.cell()[21,65 €], table.cell()[1
    133,56 €],
    table.cell()[16], table.cell()[30], table.cell()[41,53
    €], table.cell()[20,97
    €], table.cell()[20,56 €], table.cell()[1
    112,59 €],
    table.cell()[17], table.cell()[31], table.cell()[41,44
    €], table.cell()[20,58
    €], table.cell()[20,85 €], table.cell()[1
    092,01 €],
    table.cell()[18], table.cell()[30], table.cell()[40,01
    €], table.cell()[20,20
    €], table.cell()[19,81 €], table.cell()[1
    071,81 €],
    table.cell()[19], table.cell()[31], table.cell()[39,92
    €], table.cell()[19,83
    €], table.cell()[20,09 €], table.cell()[1
    051,98 €],
    table.cell()[20], table.cell()[31], table.cell()[39,18
    €], table.cell()[19,46
    €], table.cell()[19,72 €], table.cell()[1
    032,52 €],
    table.cell()[21], table.cell()[30], table.cell()[37,83
    €], table.cell()[19,10
    €], table.cell()[18,73 €], table.cell()[1
    013,42 €],
    table.cell()[22], table.cell()[31], table.cell()[37,74
    €], table.cell()[18,75
    €], table.cell()[19,00
    €], table.cell()[994,67 €],
    table.cell()[23], table.cell()[30], table.cell()[36,44
    €], table.cell()[18,40
    €], table.cell()[18,04
    €], table.cell()[976,27 €],
    table.cell()[24], table.cell()[31], table.cell()[36,36
    €], table.cell()[18,06
    €], table.cell()[18,30
    €], table.cell()[958,21 €],
    table.cell()[25], table.cell()[31], table.cell()[35,69
    €], table.cell()[17,73
    €], table.cell()[17,96
    €], table.cell()[940,48 €],
    table.cell()[26], table.cell()[28], table.cell()[33,32
    €], table.cell()[17,40
    €], table.cell()[15,92
    €], table.cell()[923,08 €],
    table.cell()[27], table.cell()[31], table.cell()[34,38
    €], table.cell()[17,08
    €], table.cell()[17,30
    €], table.cell()[906,00 €],
    table.cell()[28], table.cell()[30], table.cell()[33,20
    €], table.cell()[16,76
    €], table.cell()[16,43
    €], table.cell()[889,24 €],
    table.cell()[29], table.cell()[31], table.cell()[33,12
    €], table.cell()[16,45
    €], table.cell()[16,67
    €], table.cell()[872,79 €],
    table.cell()[30], table.cell()[30], table.cell()[31,98
    €], table.cell()[16,15
    €], table.cell()[15,83
    €], table.cell()[856,64 €],
    table.cell()[31], table.cell()[31], table.cell()[31,91
    €], table.cell()[15,85
    €], table.cell()[16,06
    €], table.cell()[840,80 €],
    table.cell()[32], table.cell()[31], table.cell()[31,31
    €], table.cell()[15,55
    €], table.cell()[15,76
    €], table.cell()[825,24 €],
    table.cell()[33], table.cell()[30], table.cell()[30,24
    €], table.cell()[15,27
    €], table.cell()[14,97
    €], table.cell()[809,97 €],
    table.cell()[34], table.cell()[31], table.cell()[30,17
    €], table.cell()[14,98
    €], table.cell()[15,18
    €], table.cell()[794,99 €],
    table.cell()[35], table.cell()[30], table.cell()[29,13
    €], table.cell()[14,71
    €], table.cell()[14,42
    €], table.cell()[780,28 €],
    table.cell()[36], table.cell()[31], table.cell()[29,06
    €], table.cell()[14,44
    €], table.cell()[14,63
    €], table.cell()[765,85 €],
    table.cell()[37], table.cell()[31], table.cell()[28,52
    €], table.cell()[14,17
    €], table.cell()[14,36
    €], table.cell()[751,68 €],
    table.cell()[38], table.cell()[28], table.cell()[26,63
    €], table.cell()[13,91
    €], table.cell()[12,73
    €], table.cell()[737,77 €],
    table.cell()[39], table.cell()[31], table.cell()[27,48
    €], table.cell()[13,65
    €], table.cell()[13,83
    €], table.cell()[724,12 €],
    table.cell()[40], table.cell()[30], table.cell()[26,53
    €], table.cell()[13,40
    €], table.cell()[13,14
    €], table.cell()[710,73 €],
    table.cell()[41], table.cell()[31], table.cell()[26,47
    €], table.cell()[13,15
    €], table.cell()[13,32
    €], table.cell()[697,58 €],
    table.cell()[42], table.cell()[30], table.cell()[25,56
    €], table.cell()[12,91
    €], table.cell()[12,65
    €], table.cell()[684,67 €],
    table.cell()[43], table.cell()[31], table.cell()[25,50
    €], table.cell()[12,67
    €], table.cell()[12,83
    €], table.cell()[672,01 €],
    table.cell()[44], table.cell()[31], table.cell()[25,03
    €], table.cell()[12,43
    €], table.cell()[12,60
    €], table.cell()[659,58 €],
    table.cell()[45], table.cell()[30], table.cell()[24,17
    €], table.cell()[12,20
    €], table.cell()[11,96
    €], table.cell()[647,37 €],
    table.cell()[46], table.cell()[31], table.cell()[24,11
    €], table.cell()[11,98
    €], table.cell()[12,13
    €], table.cell()[635,40 €],
    table.cell()[47], table.cell()[30], table.cell()[23,28
    €], table.cell()[11,75
    €], table.cell()[11,53
    €], table.cell()[623,64 €],
    table.cell()[48], table.cell()[31], table.cell()[23,23
    €], table.cell()[11,54
    €], table.cell()[11,69
    €], table.cell()[612,10 €],
    table.cell()[49], table.cell()[31], table.cell()[22,80
    €], table.cell()[11,32
    €], table.cell()[11,47
    €], table.cell()[600,78 €],
    table.cell()[50], table.cell()[28], table.cell()[21,29
    €], table.cell()[11,11
    €], table.cell()[10,17
    €], table.cell()[589,67 €],
    table.cell()[51], table.cell()[31], table.cell()[21,96
    €], table.cell()[10,91
    €], table.cell()[11,05
    €], table.cell()[578,76 €],
    table.cell()[52], table.cell()[30], table.cell()[21,21
    €], table.cell()[10,71
    €], table.cell()[10,50
    €], table.cell()[568,05 €],
    table.cell()[53], table.cell()[31], table.cell()[21,16
    €], table.cell()[10,51
    €], table.cell()[10,65
    €], table.cell()[557,54 €],
    table.cell()[54], table.cell()[30], table.cell()[20,43
    €], table.cell()[10,31
    €], table.cell()[10,11
    €], table.cell()[547,23 €],
    table.cell()[55], table.cell()[31], table.cell()[20,38
    €], table.cell()[10,12
    €], table.cell()[10,26
    €], table.cell()[537,10 €],
    table.cell()[56], table.cell()[31], table.cell()[20,00
    €], table.cell()[9,94 €], table.cell()[10,07
    €], table.cell()[527,17 €],
    table.cell()[57], table.cell()[30], table.cell()[19,32
    €], table.cell()[9,75 €], table.cell()[9,56
    €], table.cell()[517,41 €],
    table.cell()[58], table.cell()[31], table.cell()[19,27
    €], table.cell()[9,57 €], table.cell()[9,70
    €], table.cell()[507,84 €],
    table.cell()[59], table.cell()[30], table.cell()[18,61
    €], table.cell()[9,40 €], table.cell()[9,21
    €], table.cell()[498,45 €],
    table.cell()[60], table.cell()[31], table.cell()[18,56
    €], table.cell()[9,22 €], table.cell()[9,34
    €], table.cell()[489,23 €],
    table.cell()[61], table.cell()[31], table.cell()[18,22
    €], table.cell()[9,05 €], table.cell()[9,17
    €], table.cell()[480,18 €],
    table.cell()[62], table.cell()[28], table.cell()[17,01
    €], table.cell()[8,88 €], table.cell()[8,13
    €], table.cell()[471,29 €],
    table.cell()[63], table.cell()[31], table.cell()[17,55
    €], table.cell()[8,72 €], table.cell()[8,83
    €], table.cell()[462,57 €],
    table.cell()[64], table.cell()[30], table.cell()[16,95
    €], table.cell()[8,56 €], table.cell()[8,39
    €], table.cell()[454,02 €],
    table.cell()[65], table.cell()[31], table.cell()[16,91
    €], table.cell()[8,40 €], table.cell()[8,51
    €], table.cell()[445,62 €],
    table.cell()[66], table.cell()[30], table.cell()[16,33
    €], table.cell()[8,24 €], table.cell()[8,08
    €], table.cell()[437,37 €],
    table.cell()[67], table.cell()[31], table.cell()[16,29
    €], table.cell()[8,09 €], table.cell()[8,20
    €], table.cell()[429,28 €],
    table.cell()[68], table.cell()[31], table.cell()[15,99
    €], table.cell()[7,94 €], table.cell()[8,05
    €], table.cell()[421,34 €],
    table.cell()[69], table.cell()[30], table.cell()[15,44
    €], table.cell()[7,79 €], table.cell()[7,64
    €], table.cell()[413,54 €],
    table.cell()[70], table.cell()[31], table.cell()[15,40
    €], table.cell()[7,65 €], table.cell()[7,75
    €], table.cell()[405,89 €],
    table.cell()[71], table.cell()[30], table.cell()[14,87
    €], table.cell()[7,51 €], table.cell()[7,36
    €], table.cell()[398,38 €],
    table.cell()[72], table.cell()[31], table.cell()[14,84
    €], table.cell()[7,37 €], table.cell()[7,47
    €], table.cell()[391,01 €],
    table.cell()[73], table.cell()[31], table.cell()[14,56
    €], table.cell()[7,23 €], table.cell()[7,33
    €], table.cell()[383,78 €],
    table.cell()[74], table.cell()[28], table.cell()[13,60
    €], table.cell()[7,10 €], table.cell()[6,50
    €], table.cell()[376,68 €],
    table.cell()[75], table.cell()[31], table.cell()[14,03
    €], table.cell()[6,97 €], table.cell()[7,06
    €], table.cell()[369,71 €],
    table.cell()[76], table.cell()[30], table.cell()[13,55
    €], table.cell()[6,84 €], table.cell()[6,71
    €], table.cell()[362,87 €],
    table.cell()[77], table.cell()[31], table.cell()[13,51
    €], table.cell()[6,71 €], table.cell()[6,80
    €], table.cell()[356,16 €],
    table.cell()[78], table.cell()[30], table.cell()[13,05
    €], table.cell()[6,59 €], table.cell()[6,46
    €], table.cell()[349,57 €],
    table.cell()[79], table.cell()[31], table.cell()[13,02
    €], table.cell()[6,47 €], table.cell()[6,55
    €], table.cell()[343,10 €],
    table.cell()[80], table.cell()[31], table.cell()[12,78
    €], table.cell()[6,35 €], table.cell()[6,43
    €], table.cell()[336,76 €],
    table.cell()[81], table.cell()[30], table.cell()[12,34
    €], table.cell()[6,23 €], table.cell()[6,11
    €], table.cell()[330,53 €],
    table.cell()[82], table.cell()[31], table.cell()[12,31
    €], table.cell()[6,11 €], table.cell()[6,20
    €], table.cell()[324,41 €],
    table.cell()[83], table.cell()[30], table.cell()[11,89
    €], table.cell()[6,00 €], table.cell()[5,88
    €], table.cell()[318,41 €],
    table.cell()[84], table.cell()[31], table.cell()[11,86
    €], table.cell()[5,89 €], table.cell()[5,97
    €], table.cell()[312,52 €],
    table.cell()[85], table.cell()[31], table.cell()[11,64
    €], table.cell()[5,78 €], table.cell()[5,86
    €], table.cell()[306,74 €],
    table.cell()[86], table.cell()[28], table.cell()[10,87
    €], table.cell()[5,67 €], table.cell()[5,19
    €], table.cell()[301,06 €],
    table.cell()[87], table.cell()[31], table.cell()[11,21
    €], table.cell()[5,57 €], table.cell()[5,64
    €], table.cell()[295,49 €],
    table.cell()[88], table.cell()[30], table.cell()[10,83
    €], table.cell()[5,47 €], table.cell()[5,36
    €], table.cell()[290,03 €],
    table.cell()[89], table.cell()[31], table.cell()[10,80
    €], table.cell()[5,37 €], table.cell()[5,44
    €], table.cell()[284,66 €],
    table.cell()[90], table.cell()[30], table.cell()[10,43
    €], table.cell()[5,27 €], table.cell()[5,16
    €], table.cell()[279,39 €],
    table.cell()[91], table.cell()[31], table.cell()[10,41
    €], table.cell()[5,17 €], table.cell()[5,24
    €], table.cell()[274,23 €],
    table.cell()[92], table.cell()[31], table.cell()[10,21
    €], table.cell()[5,07 €], table.cell()[5,14
    €], table.cell()[269,15 €],
    table.cell()[93], table.cell()[30], table.cell()[9,88
    €], table.cell()[5,00 €], table.cell()[4,88
    €], table.cell()[264,15 €],
    table.cell()[94], table.cell()[31], table.cell()[9,95
    €], table.cell()[5,00 €], table.cell()[4,95
    €], table.cell()[259,15 €],
    table.cell()[95], table.cell()[30], table.cell()[9,70
    €], table.cell()[5,00 €], table.cell()[4,70
    €], table.cell()[254,15 €],
    table.cell()[96], table.cell()[31], table.cell()[9,76
    €], table.cell()[5,00 €], table.cell()[4,76
    €], table.cell()[249,15 €],
    table.cell()[97], table.cell()[31], table.cell()[9,67
    €], table.cell()[5,00 €], table.cell()[4,67
    €], table.cell()[244,15 €],
    table.cell()[98], table.cell()[28], table.cell()[9,13
    €], table.cell()[5,00 €], table.cell()[4,13
    €], table.cell()[239,15 €],
    table.cell()[99], table.cell()[31], table.cell()[9,48
    €], table.cell()[5,00 €], table.cell()[4,48
    €], table.cell()[234,15 €],
    table.cell()[100], table.cell()[30], table.cell()[9,25
    €], table.cell()[5,00 €], table.cell()[4,25
    €], table.cell()[229,15 €],
    table.cell()[101], table.cell()[31], table.cell()[9,30
    €], table.cell()[5,00 €], table.cell()[4,30
    €], table.cell()[224,15 €],
    table.cell()[102], table.cell()[30], table.cell()[9,07
    €], table.cell()[5,00 €], table.cell()[4,07
    €], table.cell()[219,15 €],
    table.cell()[103], table.cell()[31], table.cell()[9,11
    €], table.cell()[5,00 €], table.cell()[4,11
    €], table.cell()[214,15 €],
    table.cell()[104], table.cell()[31], table.cell()[9,01
    €], table.cell()[5,00 €], table.cell()[4,01
    €], table.cell()[209,15 €],
    table.cell()[105], table.cell()[30], table.cell()[8,79
    €], table.cell()[5,00 €], table.cell()[3,79
    €], table.cell()[204,15 €],
    table.cell()[106], table.cell()[31], table.cell()[8,83
    €], table.cell()[5,00 €], table.cell()[3,83
    €], table.cell()[199,15 €],
    table.cell()[107], table.cell()[30], table.cell()[8,61
    €], table.cell()[5,00 €], table.cell()[3,61
    €], table.cell()[194,15 €],
    table.cell()[108], table.cell()[31], table.cell()[8,64
    €], table.cell()[5,00 €], table.cell()[3,64
    €], table.cell()[189,15 €],
    table.cell()[109], table.cell()[31], table.cell()[8,55
    €], table.cell()[5,00 €], table.cell()[3,55
    €], table.cell()[184,15 €],
    table.cell()[110], table.cell()[28], table.cell()[8,12
    €], table.cell()[5,00 €], table.cell()[3,12
    €], table.cell()[179,15 €],
    table.cell()[111], table.cell()[31], table.cell()[8,36
    €], table.cell()[5,00 €], table.cell()[3,36
    €], table.cell()[174,15 €],
    table.cell()[112], table.cell()[30], table.cell()[8,16
    €], table.cell()[5,00 €], table.cell()[3,16
    €], table.cell()[169,15 €],
    table.cell()[113], table.cell()[31], table.cell()[8,17
    €], table.cell()[5,00 €], table.cell()[3,17
    €], table.cell()[164,15 €],
    table.cell()[114], table.cell()[30], table.cell()[7,98
    €], table.cell()[5,00 €], table.cell()[2,98
    €], table.cell()[159,15 €],
    table.cell()[115], table.cell()[31], table.cell()[7,98
    €], table.cell()[5,00 €], table.cell()[2,98
    €], table.cell()[154,15 €],
    table.cell()[116], table.cell()[31], table.cell()[7,89
    €], table.cell()[5,00 €], table.cell()[2,89
    €], table.cell()[149,15 €],
    table.cell()[117], table.cell()[30], table.cell()[7,71
    €], table.cell()[5,00 €], table.cell()[2,71
    €], table.cell()[144,15 €],
    table.cell()[118], table.cell()[31], table.cell()[7,70
    €], table.cell()[5,00 €], table.cell()[2,70
    €], table.cell()[139,15 €],
    table.cell()[119], table.cell()[30], table.cell()[7,52
    €], table.cell()[5,00 €], table.cell()[2,52
    €], table.cell()[134,15 €],
    table.cell()[120], table.cell()[31], table.cell()[7,51
    €], table.cell()[5,00 €], table.cell()[2,51
    €], table.cell()[129,15 €],
    table.cell()[121], table.cell()[31], table.cell()[7,42
    €], table.cell()[5,00 €], table.cell()[2,42
    €], table.cell()[124,15 €],
    table.cell()[122], table.cell()[28], table.cell()[7,10
    €], table.cell()[5,00 €], table.cell()[2,10
    €], table.cell()[119,15 €],
    table.cell()[123], table.cell()[31], table.cell()[7,23
    €], table.cell()[5,00 €], table.cell()[2,23
    €], table.cell()[114,15 €],
    table.cell()[124], table.cell()[30], table.cell()[7,07
    €], table.cell()[5,00 €], table.cell()[2,07
    €], table.cell()[109,15 €],
    table.cell()[125], table.cell()[31], table.cell()[7,05
    €], table.cell()[5,00 €], table.cell()[2,05
    €], table.cell()[104,15 €],
    table.cell()[126], table.cell()[30], table.cell()[6,89
    €], table.cell()[5,00 €], table.cell()[1,89
    €], table.cell()[99,15 €],
    table.cell()[127], table.cell()[31], table.cell()[6,86
    €], table.cell()[5,00 €], table.cell()[1,86
    €], table.cell()[94,15 €],
    table.cell()[128], table.cell()[31], table.cell()[6,76
    €], table.cell()[5,00 €], table.cell()[1,76
    €], table.cell()[89,15 €],
    table.cell()[129], table.cell()[30], table.cell()[6,62
    €], table.cell()[5,00 €], table.cell()[1,62
    €], table.cell()[84,15 €],
    table.cell()[130], table.cell()[31], table.cell()[6,58
    €], table.cell()[5,00 €], table.cell()[1,58
    €], table.cell()[79,15 €],
    table.cell()[131], table.cell()[30], table.cell()[6,44
    €], table.cell()[5,00 €], table.cell()[1,44
    €], table.cell()[74,15 €],
    table.cell()[132], table.cell()[31], table.cell()[6,39
    €], table.cell()[5,00 €], table.cell()[1,39
    €], table.cell()[69,15 €],
    table.cell()[133], table.cell()[31], table.cell()[6,30
    €], table.cell()[5,00 €], table.cell()[1,30
    €], table.cell()[64,15 €],
    table.cell()[134], table.cell()[28], table.cell()[6,09
    €], table.cell()[5,00 €], table.cell()[1,09
    €], table.cell()[59,15 €],
    table.cell()[135], table.cell()[31], table.cell()[6,11
    €], table.cell()[5,00 €], table.cell()[1,11
    €], table.cell()[54,15 €],
    table.cell()[136], table.cell()[30], table.cell()[5,98
    €], table.cell()[5,00 €], table.cell()[0,98
    €], table.cell()[49,15 €],
    table.cell()[137], table.cell()[31], table.cell()[5,92
    €], table.cell()[5,00 €], table.cell()[0,92
    €], table.cell()[44,15 €],
    table.cell()[138], table.cell()[30], table.cell()[5,80
    €], table.cell()[5,00 €], table.cell()[0,80
    €], table.cell()[39,15 €],
    table.cell()[139], table.cell()[31], table.cell()[5,73
    €], table.cell()[5,00 €], table.cell()[0,73
    €], table.cell()[34,15 €],
    table.cell()[140], table.cell()[31], table.cell()[5,64
    €], table.cell()[5,00 €], table.cell()[0,64
    €], table.cell()[29,15 €],
    table.cell()[141], table.cell()[30], table.cell()[5,53
    €], table.cell()[5,00 €], table.cell()[0,53
    €], table.cell()[24,15 €],
    table.cell()[142], table.cell()[31], table.cell()[5,45
    €], table.cell()[5,00 €], table.cell()[0,45
    €], table.cell()[19,15 €],
    table.cell()[143], table.cell()[30], table.cell()[5,35
    €], table.cell()[5,00 €], table.cell()[0,35
    €], table.cell()[14,15 €],
    table.cell()[144], table.cell()[31], table.cell()[5,27
    €], table.cell()[5,00 €], table.cell()[0,27
    €], table.cell()[9,15 €],
    table.cell()[145], table.cell()[31], table.cell()[5,17
    €], table.cell()[5,00 €], table.cell()[0,17
    €], table.cell()[4,15 €],
    table.cell()[146], table.cell()[28], table.cell()[4,22
    €], table.cell()[4,15 €], table.cell()[0,07
    €], table.cell()[0,00 €],
  )
]

