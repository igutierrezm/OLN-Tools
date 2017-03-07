* CISE (distinguiendo el tipo de contrato de los asalariados)
capture program drop gen_casen_cise_v3
program define gen_casen_cise_v3
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Macros auxiliares
  local var "_cise_v3"
  local tc  "_tipo_contrato"
  select_casen, varlist("_cise_v3") año(`año')

  * Mutación
  capture : gen_casen_tipo_contrato, año(`año')
  capture : gen_casen_cise_v1, año(`año')
  generate `var' = _cise_v1
  replace  `var' =  3 if (`var' == 3) & (`tc' ==  1)
  replace  `var' =  4 if (`var' == 3) & (`tc' ==  2)
  replace  `var' =  5 if (`var' == 3) & (`tc' ==  3)
  replace  `var' = 1e5 if (`var' == 3) & (`tc' == 1e5)

  * Etiquetado
  label copy _cise_v1 `var'
  label define `var'                         ///
    3 "Asalariado sin contrato"              ///
    4 "Asalariado con contrato definido"     ///
    5 "Asalariado con contrato indefinido",  ///
    modify
  label values `var' `var'
  label variable _cise_v3 "Categoría ocupacional"
end
