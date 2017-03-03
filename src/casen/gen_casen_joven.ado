* ¿Es joven (29 años o menos)?
capture program drop gen_casen_joven
program define gen_casen_joven
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_joven") año(`año')
  # delimit ;
  recode `r(selection)'
  	(00/29  =   1 "Sí")
  	(30/max =   0 "No")
    (1e6    = 1e6 "Nacional")
  	(else   = 1e5 "ns/nr"),
  	generate(_joven);
  # delimit cr
  * Etiquetado
  label variable _joven "¿Es joven (29 años o menos)?"
end
