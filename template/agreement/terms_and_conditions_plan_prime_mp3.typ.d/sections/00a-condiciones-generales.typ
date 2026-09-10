#import "../common/default_styles.typ": box-fill, section, section-center
#import "../common/table_styles.typ": boxed-doc-table

#let condiciones-generales-intro(vars) = [
    #section-center[CONDICIONES GENERALES DE CONTRATACIÓN DE LA LÍNEA DE
    CRÉDITO]

    #boxed-doc-table(
      columns: (100.00%),
      // row 0
      table.cell(fill: box-fill)[
        Le informamos de que el producto que va a contratar es un producto
        financiero que conlleva unos costes que encontrará explicados en las
        presentes Condiciones Generales de Contratación.

        La información resaltada en #strong[negrita] o #underline[subrayada] tiene
        especial relevancia para el Prestatario.
      ],
    )

    #linebreak()
    Las condiciones económicas de la línea de Crédito concedida son las
    siguientes, sin perjuicio de que las mismas puedan modificarse durante la
    relación contractual conforme a lo establecido en la cláusula 18.2
    (Modificación de la línea de Crédito) de las Condiciones Generales de la
    Contratación. Sobre las eventuales modificaciones se informará y se
    solicitará consentimiento cuando proceda, con antelación suficiente a través
    de la Aplicación móvil de IDFinance Plazo S.L.U.
]
