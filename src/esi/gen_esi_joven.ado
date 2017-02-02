capture program drop gen_esi_joven
program define gen_esi_joven, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  # delimit ;
  recode EDAD
    (1e6    = 1e6 "nacional")
  	(00/29  =   1 "sí")
  	(30/max =   0 "no")
  	(else   = 1e5 "ns/nr"),
  	generate(_joven);
  # delimit cr
  * Etiquetado
  label variable _joven "¿Tiene a lo más 29 años?"
end
