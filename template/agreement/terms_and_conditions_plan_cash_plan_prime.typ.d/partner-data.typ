// Блоки про Интермедиарио де Кредито. В .docx это Velocity-поля
// «#if($partnerData)…#end», поэтому здесь оба блока рендерятся только
// когда партнёр задан; при partner == none не выводят ничего.
// Использование в body.typ:
//   #partner-identity(vars.PARTNER_DATA)  — блок после «Prestamista»
//   #partner-clause(vars.PARTNER_DATA)    — пункт 1.2 раздела «¿Quiénes somos?»
#import "common/default_styles.typ": section-bold-h1

// Заголовок + реквизиты партнёра во вводной части документа.
#let partner-identity(partner) = if partner != none [
    #section-bold-h1[Identidad y detalles de contacto del
        #underline[Intermediario de Crédito]]

    La sociedad #partner.name (en adelante, el "Intermediario"), sociedad
    con domicilio social en #partner.address, Número de Identificación
    Fiscal (N.I.F.) #partner.vatNumber.
]

// Пункт 1.2 — кто такой Интермедиарио и что он не является Prestamista.
#let partner-clause(partner) = if partner != none [
    1.2. La sociedad #partner.name (en adelante, el "Intermediario"),
    sociedad con domicilio social en #partner.address, Número de
    Identificación Fiscal (N.I.F.) #partner.vatNumber.

    El Intermediario es un comparador de préstamos y créditos, proveedor de
    servicios de marketing, cuya función radica en presentar u ofrecer el
    contrato de línea de crédito de Plazo Credit a potenciales clientes.
    #underline[El Intermediario no actúa como Prestamista y se rige por sus
    propios términos y condiciones.]
]
