capture program drop gen_casen_estrato
program define gen_casen_estrato
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_estrato") año(`año')
  local var "`r(selection)'"
  destring `var', replace
  generate long _estrato = `var'
  * Etiquetado
  label variable _estrato "Estrato"
end
