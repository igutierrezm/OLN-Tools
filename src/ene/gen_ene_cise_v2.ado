* CISE (distinguiendo asalariados con y sin contrato)
capture program drop gen_ene_cise_v2
program define gen_ene_cise_v2, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_cise_v2"
  * Mutación
  # delimit ;
    recode categoria_ocupacion
      (1    =  1 "Empleadores")
      (2    =  2 "Cuenta propia")
      (3/6  =  3 "Asalariados")
      (7    =  5 "Familiares no Remunerados")
      (else = .a "ns/nr"),
      generate(`var');
  # delimit cr
  replace `var' =  3 if (`var' == 3) & (b8 == 1)
  replace `var' =  4 if (`var' == 3) & (b8 == 2)
  replace `var' = .a if (`var' == 3) & (b8 == .)
  * Etiquetado
  label define `var'           ///
    3 "Asalariado con contrato"   ///
    4 "Asalariado sin contrato",  ///
    modify
  label variable `var' "Categoría ocupacional"
end
