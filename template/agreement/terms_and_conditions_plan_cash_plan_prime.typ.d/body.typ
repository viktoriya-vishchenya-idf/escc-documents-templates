// Сборка документа: каждый раздел — отдельный файл в sections/,
// имя файла начинается с номера пункта Condiciones Generales.
#import "sections/00-datos-del-contrato.typ": datos-del-contrato
#import "sections/00a-condiciones-generales.typ": condiciones-generales-intro
#import "sections/01-quienes-somos.typ": clause-01-quienes-somos
#import "sections/02-quien-titular-linea.typ": clause-02-quien-titular-linea
#import "sections/03-calendario-contratacion-servicio.typ": clause-03-calendario-contratacion-servicio
#import "sections/04-descripcion-caracteristicas-principales.typ": clause-04-descripcion-caracteristicas-principales
#import "sections/05-disponibilidad-linea-credito.typ": clause-05-disponibilidad-linea-credito
#import "sections/06-tipo-interes-nominal.typ": clause-06-tipo-interes-nominal
#import "sections/07-tasa-anual-equivalente.typ": clause-07-tasa-anual-equivalente
#import "sections/08-amortizacion-linea-credito.typ": clause-08-amortizacion-linea-credito
#import "sections/09-derechos-prestatario-derecho.typ": clause-09-derechos-prestatario-derecho
#import "sections/10-procedimiento-impago.typ": clause-10-procedimiento-impago
#import "sections/11-reclamaciones-quejas.typ": clause-11-reclamaciones-quejas
#import "sections/12-terminos-definiciones.typ": clause-12-terminos-definiciones
#import "sections/13-objeto-informacion-pre.typ": clause-13-objeto-informacion-pre
#import "sections/14-aplicacion-oposicion-condiciones.typ": clause-14-aplicacion-oposicion-condiciones
#import "sections/15-contratacion-distancia.typ": clause-15-contratacion-distancia
#import "sections/16-solicitud-linea-credito.typ": clause-16-solicitud-linea-credito
#import "sections/17-validacion-concesion-linea.typ": clause-17-validacion-concesion-linea
#import "sections/18-modificacion-limite-credito.typ": clause-18-modificacion-limite-credito
#import "sections/19-reembolso-anticipada.typ": clause-19-reembolso-anticipada
#import "sections/20-bloqueo-resolucion-contrato.typ": clause-20-bloqueo-resolucion-contrato
#import "sections/21-proteccion-datos-caracter.typ": clause-21-proteccion-datos-caracter
#import "sections/22-cumplimiento-normativo.typ": clause-22-cumplimiento-normativo
#import "sections/23-deber-actualizacion-informacion.typ": clause-23-deber-actualizacion-informacion
#import "sections/24-derecho-cesion.typ": clause-24-derecho-cesion
#import "sections/25-duracion-terminacion-contrato.typ": clause-25-duracion-terminacion-contrato
#import "sections/26-modificacion-condiciones-linea.typ": clause-26-modificacion-condiciones-linea
#import "sections/27-servicio-atencion-cliente.typ": clause-27-servicio-atencion-cliente
#import "sections/28-resolucion-extrajudicial.typ": clause-28-resolucion-extrajudicial
#import "sections/29-derechos-propiedad-intelectual.typ": clause-29-derechos-propiedad-intelectual
#import "sections/30-disposiciones-finales.typ": clause-30-disposiciones-finales
#import "sections/31-regimen-linguistico.typ": clause-31-regimen-linguistico
#import "sections/32-ley-aplicable-jurisdiccion.typ": clause-32-ley-aplicable-jurisdiccion

#let doc_render(vars) = [
#datos-del-contrato(vars)
#pagebreak()
#condiciones-generales-intro(vars)
#clause-01-quienes-somos(vars)
#clause-02-quien-titular-linea(vars)
#clause-03-calendario-contratacion-servicio(vars)
#clause-04-descripcion-caracteristicas-principales(vars)
#clause-05-disponibilidad-linea-credito(vars)
#clause-06-tipo-interes-nominal(vars)
#clause-07-tasa-anual-equivalente(vars)
#clause-08-amortizacion-linea-credito(vars)
#clause-09-derechos-prestatario-derecho(vars)
#clause-10-procedimiento-impago(vars)
#clause-11-reclamaciones-quejas(vars)
#clause-12-terminos-definiciones(vars)
#clause-13-objeto-informacion-pre(vars)
#clause-14-aplicacion-oposicion-condiciones(vars)
#clause-15-contratacion-distancia(vars)
#clause-16-solicitud-linea-credito(vars)
#clause-17-validacion-concesion-linea(vars)
#clause-18-modificacion-limite-credito(vars)
#clause-19-reembolso-anticipada(vars)
#clause-20-bloqueo-resolucion-contrato(vars)
#clause-21-proteccion-datos-caracter(vars)
#clause-22-cumplimiento-normativo(vars)
#clause-23-deber-actualizacion-informacion(vars)
#clause-24-derecho-cesion(vars)
#clause-25-duracion-terminacion-contrato(vars)
#clause-26-modificacion-condiciones-linea(vars)
#clause-27-servicio-atencion-cliente(vars)
#clause-28-resolucion-extrajudicial(vars)
#clause-29-derechos-propiedad-intelectual(vars)
#clause-30-disposiciones-finales(vars)
#clause-31-regimen-linguistico(vars)
#clause-32-ley-aplicable-jurisdiccion(vars)
]
