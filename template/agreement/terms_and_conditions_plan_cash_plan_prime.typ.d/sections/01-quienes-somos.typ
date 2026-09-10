#import "../common/default_styles.typ": clause-list, section-bold-h1
#import "../partner-data.typ": partner-clause

#let clause-01-quienes-somos(vars) = [

    #linebreak()
    #section-bold-h1[1\. ¿Quiénes somos?]

    #clause-list(1)[
    + La sociedad #strong[IDFinance Plazo S.L.U.], sociedad de nacionalidad
      española con domicilio social en Barcelona, calle Tuset 5, 3º y Número de
      Identificación Fiscal (N.I.F.) B02996668 constituida en escritura pública
      de fecha 30 de diciembre de 2020 otorgada ante notario de Barcelona
      Gonzalo Veciana García-Boente con el número 1929 de su protocolo,
      inscrita en el Registro Mercantil de Barcelona, al tomo / IRUS:
      1000380036447, folio 0, Hoja B 558505
    ]

    IDFinance Plazo, S.L.U., es la entidad prestamista que gestiona y concede la
    línea de crédito.

    // Пункт 1.2 — блок партнёра, он условный (#if($partnerData) в .docx) и
    // живёт в partner-data.typ вместе со своим номером, поэтому в clause-list
    // его не включить: при отсутствии партнёра пустой пункт всё равно получил
    // бы номер.
    #partner-clause(vars.PARTNER_DATA)

    #linebreak()
]
