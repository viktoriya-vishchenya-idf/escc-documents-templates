#import "../common/default_styles.typ": color-section-bg, color-title

// LD-3.3, <hold_flag>: показываем только если borrower в ON_HOLD
// (isHeldSepa == true).
#let hold-sepa(vars) = if vars.IS_HELD_SEPA [
    #v(0.6em)
    #block(
        fill: color-section-bg,
        inset: (x: 10pt, y: 8pt),
        radius: 3pt,
        width: 100%,
    )[
        #text(fill: color-title, weight: "bold")[Aviso — Adeudo Directo SEPA en curso]

        #v(0.3em)
        Le informamos de que se ha iniciado un adeudo directo SEPA en
        relación con la deuda pendiente. La deuda seguirá siendo exigible
        y pagadera hasta que ID Finance haya recibido y liquidado
        efectivamente los fondos.
    ]
]
