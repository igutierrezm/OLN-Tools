capture program drop gen_casen_asiste_escuela
program define gen_casen_asiste_escuela
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_asiste_escuela") año(`año')
  # delimit ;
  recode `r(selection)'
    (1e6  = 1e6 "Nacional")
    (1    =   1 "Sí")
    (2    =   0 "No")
  	(else = 1e5 "ns/nr"),
  	generate(_asiste_escuela);
  # delimit cr
  * Etiquetado
  label variable _asiste_escuela "¿Asiste a la escuela?"
end

* TODO
* 1. Cubrir más años.
