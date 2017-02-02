* ¿Es mujer?
capture program drop gen_esi_mujer
program define gen_esi_mujer, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  # delimit ;
  recode SEXO
  	(1    =   0 "No")
  	(2    =   1 "Sí")
    (1e6  = 1e6 "Nacional")
  	(else = 1e5 "ns/nr"),
  	generate(_mujer);
  # delimit cr
  * Etiquetado
  label variable _mujer "¿Es mujer?"
end
