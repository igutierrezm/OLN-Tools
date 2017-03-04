* ¿Es un extranjero?
capture program drop gen_casen_extranjero
program define gen_casen_extranjero
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_extranjero") año(`año')
  # delimit ;
    recode `r(selection)'
    	(1/2  =  0 "Chilenos")
    	(3    =  1 "Extranjeros")
      (else = .a "ns/nr"),
    	generate(_extranjero);
  # delimit cr
  * Etiquetado
  label variable _extranjero "¿Es un extranjero?"
  note _extranjero : "Los chilenos con doble nacionalidad cuentan como chilenos"
end
