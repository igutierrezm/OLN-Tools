capture program drop gen_casen_psu
program define gen_casen_psu
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_psu") año(`año')
  generate long _psu = `r(selection)'
  * Etiquetado
  label variable _psu "Unidad primaria de muestreo"
end
