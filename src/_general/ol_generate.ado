* Programa general para la generación de variables del OLN
capture program drop ol_generate
program define ol_generate
  version 14.1
  syntax, variable(string) from(string) db(string) [año(string) mes(string)]
  * Despacho
  gen_`db'`variable', from(`from') año(`año') mes(`mes')
end
