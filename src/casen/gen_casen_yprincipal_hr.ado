capture program drop gen_casen_yprincipal_hr
program define gen_casen_yprincipal_hr, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_yprincipal_hr"
  capture : gen_casen_yprincipal, año(`año')
  capture : gen_casen_hr_hab,     año(`año')
  generate `var' = _yprincipal / _hr_hab / 4
  * Etiquetado
  label variable `var' "Ingreso/hr [oc. principal, hrs. hab] (M$/hr)"
end
