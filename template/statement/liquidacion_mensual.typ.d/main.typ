// Точка входа: месячная выписка (LD-2.16 v7).
// Компиляция:
//   typst compile --font-path . main.typ preview.pdf
//   typst watch   --font-path . main.typ preview.pdf
// Параметры — цепочка приоритетов:
//   1. прод (Java):     --input vars='{"borrowerId": 12541, ...}'  (JSON-строка)
//   2. локально, кейс:  --input params=params-hold-sepa.json       (путь к файлу)
//   3. локально, дефолт: без флагов — берётся params.json рядом с main.typ.

#import "common/default_styles.typ": document
#import "common/params.typ": load-params
#import "vars.typ": normalize
#import "body.typ": doc_render

#let vars = normalize(load-params(
    fallback: () => json(sys.inputs.at("params", default: "params.json")),
))

#show: document.with(doc-code: "PL_LIQ_MEN_11082026")
#doc_render(vars)
