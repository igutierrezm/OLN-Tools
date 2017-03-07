capture program drop gen_esi_jparcial_inv
program define gen_esi_jparcial_inv, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate _jparcial_inv = 1e5
  replace  _jparcial_inv = 1 if (C1 == 2) & (C10 == 1) & (C11 == 1)
  replace  _jparcial_inv = 0 if inrange(C1,  1, 1)
  replace  _jparcial_inv = 0 if inrange(C10, 2, 2)
  replace  _jparcial_inv = 0 if inrange(C11, 2, 4)
  * Etiquetado
  label define _jparcial_inv 1 "Sí" 0 "No" 1e5 "ns/nr"
  label values _jparcial_inv _jparcial_inv
  * Etiquetado
  label variable _jparcial_inv "¿Tiene jornada parcial involuntaria?"
end
