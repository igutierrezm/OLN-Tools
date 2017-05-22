capture program drop gen_casen_trab_sub
program define gen_casen_trab_sub
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Selección
  select_casen, varlist("_trab_sub") año(`año')
  * Mutación
  tempvar oficio4
  destring `r(selection)', generate(`oficio4') force
  capture : generate `oficio4' = `r(selection)'
  # delimit ;
  recode `oficio4'
  	(6210       =   1 "Sí")
    (nonmissing =   0 "No")
  	(missing    = 1e5 "ns/nr"),
  	generate(_trab_sub);
  # delimit cr
  * Etiquetado:
  label variable _trab_sub "¿Es un trabajador de subsistencia?"
end
