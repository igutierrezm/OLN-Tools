* Horas hab. trabajadas por semana (ocup. principal)
capture program drop gen_casen_hr_hab
program define gen_casen_hr_hab, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  select_casen, varlist("_hr_hab") año(`año')
  recode `r(selection)' (999 = .), generate(_hr_hab)
  * Etiquetado
  label variable _hr_hab "Horas hab. trabajadas por semana (ocup. principal)"
end
