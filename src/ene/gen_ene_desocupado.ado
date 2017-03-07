capture program drop gen_ene_desocupado
program define gen_ene_desocupado, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local cae "cae_general"
  recode `cae' (4/5 = 1) (0/3 6/9 = 0) (else = 1e5), generate(_desocupado)
  * Etiquetado (valores)
  label define _desocupado 0 "No" 1 "Sí" 1e5 "ns/nr"
  label values _desocupado _desocupado
  * Etiquetado (variables)
  label variable _desocupado "¿Está desocupado?"
end
