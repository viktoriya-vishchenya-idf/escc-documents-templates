
#import "sections/00-cabecera.typ": cabecera
#import "sections/01-periodo.typ": modalidad-pago
#import "sections/02-resumen.typ": resumen
#import "sections/03-detalle-cuenta.typ": detalle-cuenta
#import "sections/04-hold-sepa.typ": hold-sepa
#import "sections/05-definiciones.typ": definiciones, advertencia-revolving

#let doc_render(vars) = [
    #cabecera(vars)
    #v(0.6em)
    #resumen(vars)
    #v(0.6em)
    #modalidad-pago(vars)
    #v(0.6em)
    #detalle-cuenta(vars)
    #v(0.6em)
    #definiciones()
    #v(0.6em)
    #advertencia-revolving()
    #hold-sepa(vars)
]
