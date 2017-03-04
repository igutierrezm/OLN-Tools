capture program drop gen_ene_pea
program define gen_ene_pea, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  recode cae_general (1/5 = 1) (0 6/9 = 0) (else = .a), generate(_pea)
  * Etiquetado
  label define _pea 0 "No" 1 "Sí" .a "ns/nr"
  label values _pea _pea
  label variable _pea "¿Pertenece a la pea?"
end
