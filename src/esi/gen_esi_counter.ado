capture program drop gen_esi_counter
program define gen_esi_counter, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate _counter = 1
  * Etiquetado
  label variable _counter "Contador"
end
