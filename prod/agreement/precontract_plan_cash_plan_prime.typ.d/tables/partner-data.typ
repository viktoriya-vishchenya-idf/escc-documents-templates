// Условные блоки про Интермедиарио де Кредито. Оба рендерятся только
// когда партнёр задан; при partner == none не выводят ничего.
// Использование в body.typ:
//   #partner-data(vars.PARTNER_DATA)           — блок 1.b (раздел 1)
//   #partner-data-distance(vars.PARTNER_DATA)  — блок a.2 (раздел 5)

// 1.b — «Identidad y detalles de contacto del Intermediario de Crédito»
#let partner-data(partner) = if partner != none [
    #figure(
        align(center)[#table(
            columns: (35.14%, 64.86%),
            table.header(table.cell(colspan: 2)[*#underline[1.b.-
                Identidad y detalles de contacto del Intermediario
                de Crédito];*],),
            table.hline(),
            table.cell()[*#underline[Intermediario de
            Crédito];*], [#partner.name],
            table.cell()[*#underline[Dirección];*], [#partner.address],
            table.cell()[*#underline[NIF
            (VAT)];*], [#partner.vatNumber],
        )]
        , kind: table
    )
]

// a.2 — «Información relativa al Intermediario de Crédito»
// (раздел 5, комерциализация на расстоянии)
#let partner-data-distance(partner) = if partner != none [
    #figure(
        align(center)[#table(
            columns: (31.51%, 68.49%),
            table.header(table.cell(colspan: 2)[*a.2.- Información
                relativa al Intermediario de Crédito*],),
            table.hline(),
            [Intermediario de Crédito], [#partner.name],
            [Dirección], [#partner.address],
            [NIF (VAT)], [#partner.vatNumber],
        )],
        kind: table
    )
]
