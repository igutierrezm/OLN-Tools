capture program drop gen_casen_zona
program define gen_casen_zona
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_zona") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1    =   0 "Urbano")
    (2    =   1 "Rural")
    (else = 1e5 "ns/nr"),
  	generate(_zona);
  # delimit cr
  * Etiquetado:
  label variable _zona "Área geográfica"
end
