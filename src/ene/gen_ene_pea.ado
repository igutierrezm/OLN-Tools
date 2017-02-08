capture program drop gen_ene_pea
program define gen_ene_pea, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  recode cae_general (1/5 = 1) (0 6/9 = 0) (else = 1e5), generate(_pea)
  * Etiquetado
  # delimit ;
    label define _pea
      000 "No"
      001 "Sí"
      1e5 "ns/nr"
      1e6 "Nacional";
  # delimit cr
  label values _pea _pea
  label variable _pea "¿Pertenece a la pea?"
end
