* ¿Es joven (29 años o menos)?
capture program drop gen_ene_joven
program define gen_ene_joven
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  # delimit ;
  recode edad
  	(00/29  =  1 "Jóvenes")
  	(30/max =  0 "Adultos")
    (else   = .a "ns/nr"),
  	generate(_joven);
  # delimit cr
  * Etiquetado
  label variable _joven "¿Es joven (29 años o menos)?"
end
