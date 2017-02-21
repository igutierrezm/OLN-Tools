capture program drop gen_esi_yprincipal
program define gen_esi_yprincipal
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate _yprincipal = ING_T_P
  * Etiquetado
  label variable _yprincipal "Ingreso de la ocupación principal ($)"
end
