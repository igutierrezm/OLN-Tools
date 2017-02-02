capture program drop gen_casen_boleta
program define gen_casen_boleta, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  select_casen, varlist("_boleta") año(`año')
  # delimit ;
  recode `r(selection)'
    (1e6  = 1e6 "Nacional")
    (1/2  =   1 "Sí")
    (3    =   0 "No")
  	(else = 1e5 "ns/nr"),
  	generate(_boleta);
  # delimit cr
  * Etiquetado
  label variable _boleta "¿Entrega boleta?"
end
