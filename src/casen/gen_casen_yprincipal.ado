capture program drop gen_casen_yprincipal
program define gen_casen_yprincipal, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  local var "_yprincipal"
  select_casen, varlist("`var'") año(`año')
  generate `var' = `r(selection)' / 1000
  * Etiquetado
  label variable `var' "Ingreso ocupación principal (M$)"
end
