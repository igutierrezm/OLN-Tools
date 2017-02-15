capture program drop gen_casen_tipo_contrato
program define gen_casen_tipo_contrato
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Identificación de los inputs
  select_casen, varlist("_tipo_contrato") año(`año')
	local selection "`r(selection)'"
  gettoken contrato plazo : selection

  * Mutación
  local var "_tipo_contrato"
  generate `var' = 1e5
  replace  `var' =  1 if inrange(`contrato', 2, 3)
  replace  `var' =  2 if inrange(`contrato', 1, 1) & inrange(`plazo', 2, 6)
  replace  `var' =  3 if inrange(`contrato', 1, 1) & inrange(`plazo', 1, 1)

  * Etiquetado
  # delimit ;
  label define `var'
    1   "Sin contrato"
    2   "Contrato definido"
    3   "Contrato indefinido"
    1e5 "ns/nr"
    1e6 "Nacional";
  # delimit cr
  label values `var' `var'
  label variable `var' "Tipo de contrato"
end
