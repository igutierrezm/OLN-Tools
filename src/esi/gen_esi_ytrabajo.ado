*! 1.0.3 Iván Gutiérrez 07dec2016
version 14.1
capture program drop gen_esi_ytrabajo
program define gen_esi_ytrabajo, rclass
syntax, año(string)
  * Mutación
  generate _ytrabajo = ING_T_T / 1000
  * Etiquetado
  label variable _ytrabajo "Ingreso de la ocupación principal (M$)"
end
