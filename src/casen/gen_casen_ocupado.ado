capture program drop gen_casen_ocupado
program define gen_casen_ocupado
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_ocupado") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1    =   1 "Sí")
  	(2/3  =   0 "No")
    (1e6  = 1e6 "Nacional")
  	(else = 1e5 "ns/nr"),
  	generate(_ocupado);
  # delimit cr
  * Etiquetado:
  label variable _ocupado "¿Está ocupado?"
end
