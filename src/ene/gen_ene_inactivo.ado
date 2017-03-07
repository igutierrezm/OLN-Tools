capture program drop gen_ene_inactivo
program define gen_ene_inactivo, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local cae "cae_general"
  recode `cae' (0/5 = 0) (6/9 = 1) (else = 1e5), generate(_inactivo)
  * Etiquetado (valores)
  label define _inactivo 0 "No" 1 "Sí" 1e5 "ns/nr"
  label values _inactivo _inactivo
  * Etiquetado (variables)
  label variable _inactivo "¿Está inactivo?"
end
