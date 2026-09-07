// Сборка накопительной выписки (LD-2.39 v4). Порядок разделов:
//   0. Cabecera (шапка "Historial de movimientos" + REVOLVING-таблица)
//   1. Resumen histórico acumulado
//   2. Modalidad de pago y situación actual
//   3. Detalle histórico de movimientos
//   +. Definiciones (статичные пояснения)
// Имена файлов сохранены с историческими префиксами (01-datos-titular →
// modalidad-pago, 03-detalle-aplazo → detalle-histórico); фактический
// порядок и функции определяются этим блоком.
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