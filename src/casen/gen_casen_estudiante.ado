* ¿Es estudiante?
capture program drop gen_casen_estudiante
program define gen_casen_estudiante
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_estudiante") año(`año')
  # delimit ;
  recode `r(selection)'
    (1    =  1 "Estudian")
  	(2    =  0 "No estudian")
    (else = 1e5 "ns/nr"),
  	generate(_estudiante);
  # delimit cr
  * Etiquetado
  label variable _estudiante "¿Es un estudiante?"
end
