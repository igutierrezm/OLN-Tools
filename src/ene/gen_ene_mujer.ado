* ¿Es mujer?
capture program drop gen_ene_mujer
program define gen_ene_mujer, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  # delimit ;
  recode sexo
  	(1    =   0 "Hombres")
  	(2    =   1 "Mujeres")
  	(else = 1e5 "ns/nr"),
  	generate(_mujer);
  # delimit cr
  label variable _mujer "Sexo"
end
