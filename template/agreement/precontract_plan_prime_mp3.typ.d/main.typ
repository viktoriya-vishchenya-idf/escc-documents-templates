// Точка входа. Компилировать с корнем на уровне общих стилей; шрифты
// Helvetica*.ttf лежат рядом, typst сам их не находит — нужен --font-path,
// иначе будет «unknown font family: helvetica» и подстановка чужого шрифта:
//   typst compile --root .. --font-path . main.typ out.pdf
//   typst watch   --root .. --font-path . main.typ out.pdf
// Либо один раз задать путь в окружении: export TYPST_FONT_PATHS=$PWD
// Параметры — одним из двух способов:
//   прод (Java):  --input vars='{"tin": "24,90", ...}'  (JSON-строка)
//   локально:     --input params=params.json            (путь к файлу)
// Без --input берётся params.json рядом с main.typ.
#import "common/default_styles.typ": document
#import "common/params.typ": load-params
#import "vars.typ": normalize
#import "body.typ": doc_render

#let vars = normalize(load-params(
    fallback: () => json(sys.inputs.at("params", default: "params.json")),
))

#show: document.with(doc-code: "PL_INE_11082026")
#doc_render(vars)
