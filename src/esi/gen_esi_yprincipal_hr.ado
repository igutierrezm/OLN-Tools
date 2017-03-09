capture program drop gen_esi_yprincipal_hr
program define gen_esi_yprincipal_hr
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_yprincipal_hr"
  capture : gen_esi_yprincipal, año(`año')
  capture : gen_esi_hr_hab,     año(`año')
  generate `var' = _yprincipal / _hr_hab / 4
  * Etiquetado
  label variable `var' "Ingreso/hr [oc. principal, hrs. hab] ($/hr)"
end
