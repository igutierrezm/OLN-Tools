capture program drop gen_casen_inactivo
program define gen_casen_inactivo
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_inactivo") año(`año')
  # delimit ;
  recode `r(selection)'
  	(3    =   1 "Sí")
  	(1/2  =   0 "No")
    (1e6  = 1e6 "Nacional")
  	(else = 1e5 "ns/nr"),
  	generate(_inactivo);
  # delimit cr
  * Etiquetado:
  label variable _inactivo "¿Está inactivo?"
end
