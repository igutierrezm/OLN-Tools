* ¿Desciende de algún pueblo indígena?
capture program drop gen_casen_indigena
program define gen_casen_indigena, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  select_casen, varlist("_indigena") año(`año')
  # delimit ;
    recode `r(selection)'
    	(1/9  =   1 "Sí")
    	(10   =   0 "No")
      (1e6  = 1e6 "Nacional")
    	(else = 1e5 "ns/nr"),
    	generate(_indigena);
  # delimit cr
  * Etiquetado
  label variable _indigena "¿Desciende de algún pueblo indígena?"
end
