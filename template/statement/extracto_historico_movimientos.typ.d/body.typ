#import "sections/00-cabecera.typ": cabecera
#import "sections/01-datos-titular.typ": modalidad-pago
#import "sections/02-resumen-acumulado.typ": resumen-acumulado
#import "sections/03-detalle-aplazo.typ": detalle-aplazo
#import "sections/05-definiciones.typ": definiciones

#let doc_render(vars) = [
    #cabecera(vars)
    #v(0.6em)
    #resumen-acumulado(vars)
    #v(0.6em)
    #modalidad-pago(vars)
    #v(0.6em)
    #detalle-aplazo(vars)
    #v(0.6em)
    #definiciones()
]