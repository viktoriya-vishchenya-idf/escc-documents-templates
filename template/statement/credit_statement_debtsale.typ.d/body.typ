// Сборка накопительной выписки (LD-2.39 v4). Каждый раздел — отдельный
// файл в sections/, имя начинается с порядкового номера блока.
#import "sections/00-cabecera.typ": cabecera
#import "sections/01-datos-titular.typ": datos-titular
#import "sections/02-resumen-acumulado.typ": resumen-acumulado
#import "sections/03-detalle-aplazo.typ": detalle-aplazo

#let doc_render(vars) = [
    #cabecera(vars)
    #v(0.6em)
    #datos-titular(vars)
    #v(0.6em)
    #resumen-acumulado(vars)
    #v(0.6em)
    #detalle-aplazo(vars)
]
