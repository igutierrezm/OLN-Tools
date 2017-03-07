capture program drop gen_casen_boleta
program define gen_casen_boleta
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_boleta") año(`año')
  # delimit ;
  recode `r(selection)'
    (1/2  =  1 "Sí")
    (3    =  0 "No")
    (else = 1e5 "ns/nr"),
  	generate(_boleta);
  # delimit cr
  * Etiquetado
  label variable _boleta "¿Entrega boleta?"
end
