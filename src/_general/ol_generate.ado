* Programa general para la generación de variables del OLN
capture program drop ol_generate
program define ol_generate
  version 14.1
  syntax, varlist(string) db(string) [año(string) mes(string) from(string)]
  * Despacho
  foreach var in `varlist' {
    gen_`db'`var', from(`from') año(`año') mes(`mes')
  }
end
