capture program drop gen_ene_pet
program define gen_ene_pet, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  recode cae_general (1/9 = 1) (0 = 0) (else = 1e5), generate(_pet)
  * Etiquetado
  # delimit ;
    label define _pet
      000 "No"
      001 "Sí"
      1e5 "ns/nr"
      1e6 "Nacional";
  # delimit cr
  label values _pet _pet
  label variable _pet "¿Pertenece a la pet?"
end
