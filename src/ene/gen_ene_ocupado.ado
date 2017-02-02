* "¿Está ocupado?
capture program drop gen_ene_ocupado
program define gen_ene_ocupado, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  recode cae_general (1/3 = 1) (0 4/9 = 0) (else = 1e5), generate(_ocupado)
  * Etiquetado
  # delimit ;
    label define _ocupado
      0 "No"
      1 "Sí"
      1e5 "ns/nr"
      1e6 "Nacional";
  # delimit cr
  label values _ocupado _ocupado
  label variable _ocupado "¿Está ocupado?"
end
