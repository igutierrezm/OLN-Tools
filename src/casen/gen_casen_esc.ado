capture program drop gen_casen_esc
program define gen_casen_esc, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  select_casen, varlist("_esc") año(`año')
  generate _esc = `r(selection)'
  * Etiquetado
  label variable _esc "Años de escolaridad"
end
