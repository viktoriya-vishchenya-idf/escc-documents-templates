#let load-params(fallback: none) = {
    if "vars" in sys.inputs {
        json(bytes(sys.inputs.vars))
    } else if fallback != none {
        fallback()
    } else {
        (:)
    }
}
