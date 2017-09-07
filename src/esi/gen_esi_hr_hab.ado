capture program drop gen_esi_hr_hab
program define gen_esi_hr_hab, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_esi, varlist("_hr_hab") año(`año')
  display as error "selection = |`r(selection)'|"
  generate _hr_hab = `r(selection)'
  replace  _hr_hab = .a if (`r(selection)' == 999)
  * Etiquetado
  label variable _hr_hab "Horas habitualmente trabajadas a la semana"
end
