capture program drop gen_casen_activ
program define gen_casen_activ
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_activ") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1    =   1 "Ocupados")
    (2    =   2 "Desecupados")
  	(3    =   3 "Inactivos")
  	(else = 1e5 "ns/nr"),
  	generate(_activ);
  # delimit cr
  * Etiquetado:
  label variable _activ "Condición de actividad"
end
