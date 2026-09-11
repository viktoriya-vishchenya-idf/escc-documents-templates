#import "common/default_styles.typ": document
#import "common/params.typ": load-params
#import "vars.typ": normalize
#import "body.typ": doc_render

#let vars = normalize(load-params(
    fallback: () => json(sys.inputs.at("params", default: "params.json")),
))

#show: document.with(doc-code: "PL_EXT_MOV_11082026")
#doc_render(vars)
