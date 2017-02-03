* Programa general para la generación de variables del OLN
capture program drop ol_select
program define ol_select,  rclass
  version 14.1
  syntax, variable(string) db(string) [año(string) mes(string)]
  * Despacho
  select_`db', varlist(string) [año(string) mes(string)]
  * Resultados
  return local selection = "`r(selection)'"
end
