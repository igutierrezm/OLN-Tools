* ¿Es mujer?
capture program drop gen_casen_mujer
program define gen_casen_mujer
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_mujer") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1    =  0 "Hombres")
  	(2    =  1 "Mujeres")
    (else = .a "ns/nr"),
  	generate(_mujer);
  # delimit cr
  * Etiquetado
  label variable _mujer "Sexo"
end
