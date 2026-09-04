// Сборка месячной выписки (LD-2.16 v7). Каждый раздел — отдельный
// файл в sections/, имя начинается с порядкового номера блока.
#import "sections/00-cabecera.typ": cabecera
#import "sections/01-periodo.typ": periodo
#import "sections/02-resumen.typ": resumen
#import "sections/03-detalle-cuenta.typ": detalle-cuenta
#import "sections/04-hold-sepa.typ": hold-sepa

#let doc_render(vars) = [
    #cabecera(vars)
    #v(0.6em)
    #periodo(vars)
    #v(0.6em)
    #resumen(vars)
    #v(0.6em)
    #detalle-cuenta(vars)
    #hold-sepa(vars)
]
