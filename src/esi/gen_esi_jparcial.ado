capture program drop gen_esi_jparcial
program define gen_esi_jparcial, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  # delimit ;
  recode C1
    (1e6  = 1e6 "nacional")
    (1    = 0   "no")
    (2    = 1   "sí")
    (else = 1e5 "ns/nr"),
    generate(_jparcial);
  # delimit cr
  * Etiquetado
  label variable _jparcial "¿Tiene jornada parcial?"
end
