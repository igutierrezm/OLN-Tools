capture program drop gen_casen_desocupado
program define gen_casen_desocupado, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_desocupado") año(`año')
  # delimit ;
  recode `r(selection)'
  	(2    =   1 "Sí")
  	(1/3  =   0 "No")
    (1e6  = 1e6 "Nacional")
  	(else = 1e5 "ns/nr"),
  	generate(_desocupado);
  # delimit cr
  * Etiquetado:
  label variable _desocupado "¿Está desocupado?"
end
