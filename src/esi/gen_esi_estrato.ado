capture program drop gen_esi_estrato
program define gen_esi_estrato, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate long _estrato = ESTRATO
  * Etiquetado
  label variable _estrato "Estrato"
end
