// Сборка месячной выписки (LD-2.16 v7). Порядок разделов:
//   0. Cabecera (шапка + идентификация клиента)
//   1. Resumen del mes
//   2. Modalidad de pago y situación actual
//   3. Detalle de cuenta
//   4. Definiciones (статичные пояснения)
//   +. Hold SEPA — опционально, если borrower on hold.
// Имена файлов остались с историческими префиксами; фактический порядок
// определяется этим блоком.
#import "sections/00-cabecera.typ": cabecera
#import "sections/01-periodo.typ": modalidad-pago
#import "sections/02-resumen.typ": resumen
#import "sections/03-detalle-cuenta.typ": detalle-cuenta
#import "sections/04-hold-sepa.typ": hold-sepa
#import "sections/05-definiciones.typ": definiciones

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
    #hold-sepa(vars)
]
