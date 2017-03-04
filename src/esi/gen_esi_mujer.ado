* ¿Es mujer?
capture program drop gen_esi_mujer
program define gen_esi_mujer, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  # delimit ;
  recode SEXO
  	(1    =  0 "Hombres")
  	(2    =  1 "Mujeres")
  	(else = .a "ns/nr"),
  	generate(_mujer);
  # delimit cr
  * Etiquetado
  label variable _mujer "Sexo"
end
