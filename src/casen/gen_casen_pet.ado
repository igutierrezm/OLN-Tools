capture program drop gen_casen_pet
program define gen_casen_pet
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_pet") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1/3  =  1 "Sí")
    (else = .a "ns/nr"),
  	generate(_pet);
  # delimit cr
  * Etiquetado:
  label variable _pet "¿Pertenece a la PET?"
end
