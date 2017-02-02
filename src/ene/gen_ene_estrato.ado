capture program drop gen_ene_estrato
program define gen_ene_estrato, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  generate long _estrato = estrato
  * Etiquetado
  label variable _estrato "Estrato"
end
