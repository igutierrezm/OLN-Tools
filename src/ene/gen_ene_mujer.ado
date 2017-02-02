* ¿Es mujer?
capture program drop gen_ene_mujer
program define gen_ene_mujer, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  generate _mujer = sexo - 1
  * Etiquetado
  # delimit ;
    label define _mujer
      0 "Hombres"
      1 "Mujeres"
      1e5 "ns/nr"
      1e6 "nacional",
      modify;
  # delimit cr
  label values _mujer _mujer
  label variable _mujer "¿Es mujer?"
end
