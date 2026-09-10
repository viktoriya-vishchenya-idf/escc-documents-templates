// Сборка месячной выписки (LD-2.16 v7, TZ_LiquidacionMensualPlazo).
// Порядок разделов (TZ §18 "Body Order"):
//   0. Cabecera (логотип + Liquidación Mensual + период + REVOLVING banner + client card)
//   1. Resumen del mes
//   2. Modalidad de pago y situación actual
//   3. Detalle de movimientos del periodo
//   4. Definiciones
//   +. Final warning "Por qué la deuda revolving puede no bajar" (TZ §14)
//   +. Hold SEPA — опционально, если borrower on hold (не в TZ, обязательный
//      функционал LD-3.3).
// Имена файлов остались с историческими префиксами; фактический порядок
// определяется этим блоком.
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
