capture program drop gen_esi_edad
program define gen_esi_edad
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate _edad = EDAD
  * Etiquetado
  label variable _edad "Edad"
end
