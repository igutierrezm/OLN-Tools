* Horas hab. trabajadas por semana (ocup. principal)
capture program drop gen_ene_hr_hab
program define gen_ene_hr_hab, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  recode habituales (999 = .), generate(_hr_hab)
  * Etiquetado
  label variable _hr_hab "Horas hab. trabajadas por semana (ocup. principal)"
end
