capture program drop gen_ene_exceso_hr_int
program define gen_ene_exceso_hr_int, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_exceso_hr_int"
  recode habituales (0/48 = 0) (49/998 = 1) (else = 1e5), generate(`var')
  * Etiquetado (valores)
  label define `var' 0 "no" 1 "sí" 1e5 "ns/nr" 1e6 "nacional"
  label values `var' `var'
  * Etiquetado (variables)
  local lvar "¿Trabaja habitualmente más de 48hrs por semana?"
  label variable `var' "`lvar'"
end
