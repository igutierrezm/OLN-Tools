capture program drop gen_casen_exceso_hr_int
program define gen_casen_exceso_hr_int, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_exceso_hr_int"
  capture confirm variable _hr_hab
  if (_rc != 0) {
    gen_casen_hr_hab, año(`año') mes("`mes'") from("`from'")
  }
  recode _hr_hab (0/48 = 0) (49/998 = 1) (else = 1e5), generate("`var'")
  * Etiquetado (valores)
  label define `var' 0 "No" 1 "Sí" 1e5 "ns/nr"
  label values `var' `var'
  * Etiquetado (variables)
  local lvar "¿Trabaja habitualmente más de 48hrs por semana?"
  label variable `var' "`lvar'"
end
