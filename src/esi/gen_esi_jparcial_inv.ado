capture program drop gen_esi_jparcial_inv
program define gen_esi_jparcial_inv, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  generate _jparcial_inv = 1e5
  replace  _jparcial_inv = 1 if (C1 == 2) & (C10 == 1) & (C11 == 1)
  replace  _jparcial_inv = 0 if inrange(C1,  1, 1)
  replace  _jparcial_inv = 0 if inrange(C10, 2, 2)
  replace  _jparcial_inv = 0 if inrange(C11, 2, 4)
  * Etiquetado (valores)
  # delimit ;
  label define _jparcial_inv
    1   "sí"
    0   "no"
    1e5 "ns/nr"
    1e6 "nacional";
  # delimit cr
  label values _jparcial_inv _jparcial_inv
  * Etiquetado (variables)
  label variable _jparcial_inv "¿Tiene jornada parcial involuntaria?"
end
