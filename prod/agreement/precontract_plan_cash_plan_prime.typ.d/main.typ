// Точка входа. Компилировать с корнем на уровне общих стилей:
//   typst compile --root .. main.typ out.pdf
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

#show: document.with(doc-code: "PL_INE_30072026")
#doc_render(vars)
