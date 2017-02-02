capture program drop gen_esi_yprincipal
program define gen_esi_yprincipal
  version 14.1
  syntax, año(string)
  * Mutación
  generate _yprincipal = ING_T_P / 1000
  * Etiquetado
  label variable _yprincipal "Ingreso de la ocupación principal (M$)"
end
