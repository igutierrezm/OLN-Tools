capture program drop gen_ene_cesante
program define gen_ene_cesante, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  recode cae_general (4 = 1) (0/3 5/9 = 0) (else = 1e5), generate(_cesante)
  * Etiquetado (valores)
  label define _cesante 0 "no" 1 "sí" 1e5 "ns/nr" 1e6 "nacional"
  label values _cesante _cesante
* Etiquetado (variables)
  label variable _cesante "¿Está cesante?"
end
