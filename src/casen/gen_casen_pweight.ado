capture program drop gen_casen_pweight
program define gen_casen_pweight, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  select_casen, varlist("_pweight") año(`año')
  generate double _pweight = `r(selection)'
  * Etiquetado
  label variable _pweight "Factor de expansión regional"
end
