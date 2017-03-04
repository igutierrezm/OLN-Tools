capture program drop gen_ene_cesante
program define gen_ene_cesante, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  recode cae_general (4 = 1) (0/3 5/9 = 0) (else = .a), generate(_cesante)
  * Etiquetado (valores)
  label define _cesante 0 "No" 1 "Sí" .a "ns/nr"
  label values _cesante _cesante
* Etiquetado (variables)
  label variable _cesante "¿Está cesante?"
end
