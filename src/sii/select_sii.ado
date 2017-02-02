*! 1.0.3 Iván Gutiérrez 07dec2016
capture program drop select_sii
program define select_sii, rclass
  version 14.1
  syntax, varlist(string) año(string) [mes(string)]

  * Resultados
  return local selection = "*"
end
