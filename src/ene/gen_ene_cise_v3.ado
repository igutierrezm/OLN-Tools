* CISE (distinguiendo el tipo de contrato de los asalariados)
capture program drop gen_ene_cise_v3
program define gen_ene_cise_v3, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local tc  "_tipo_contrato"
  local var "_cise_v3"
  * Re-codificación
  # delimit ;
    recode categoria_ocupacion
      (1    =  1 "Empleadores")
      (2    =  2 "Cuenta Propia")
      (3/6  =  3 "Asalariados")
      (7    =  6 "Familiares no Remunerados")
      (else = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  gen_ene`tc', año(`año') mes(`mes')
  replace `var' =  3 if (`var' == 3) & (`tc' ==  1)
  replace `var' =  4 if (`var' == 3) & (`tc' ==  2)
  replace `var' =  5 if (`var' == 3) & (`tc' ==  3)
  replace `var' = 1e5 if (`var' == 3) & (`tc' == 1e5)
  * Etiquetado
  label define `var'                         ///
    3 "Asalariado sin contrato"              ///
    4 "Asalariado con contrato definido"     ///
    5 "Asalariado con contrato indefinido",  ///
    modify
  label variable `var' "Categoría ocupacional"
end
