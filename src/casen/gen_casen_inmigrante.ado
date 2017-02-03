* ¿Es un inmigrante?
capture program drop gen_casen_inmigrante
program define gen_casen_inmigrante, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_inmigrante") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1/2  =   0 "No")
  	(3    =   1 "Sí")
    (1e6  = 1e6 "Nacional")
  	(else = 1e5 "ns/nr"),
  	generate(_inmigrante);
  # delimit cr
  * Etiquetado
  label variable _inmigrante "¿Es un inmigrante?"
end
