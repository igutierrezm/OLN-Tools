capture program drop gen_esi_tipo_contrato
program define gen_esi_tipo_contrato, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_tipo_contrato"
  generate `var' = 1e5
  replace  `var' =  1 if (B8 == 2)
  replace  `var' =  2 if (B8 == 1) & (B9 == 1)
  replace  `var' =  3 if (B8 == 1) & (B9 == 2)
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
