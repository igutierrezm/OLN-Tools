capture program drop gen_casen_edad
program define gen_casen_edad, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_edad") año(`año')
  generate _edad = `r(selection)'
  * Etiquetado
  label variable _edad "Edad"
end
