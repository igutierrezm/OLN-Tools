* CISE (distinguiendo el tipo de contrato)
version 14.1
capture program drop gen_esi_cise_v3
program define gen_esi_cise_v3, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  # delimit ;
    recode CISE
      (1    =   1 "Empleadores")
      (2    =   2 "Cuenta propia")
      (7    =   6 "Familiares no Remunerados")
      (3/6  =   3 "Asalariados")
      (else  = .a "ns/nr"),
      generate(_cise_v3);
  # delimit cr
  gen_esi_tipo_contrato, año(`año')
  replace _cise_v3 =  3 if (_cise_v3 == 3) & (_tipo_contrato ==  1)
  replace _cise_v3 =  4 if (_cise_v3 == 3) & (_tipo_contrato ==  2)
  replace _cise_v3 =  5 if (_cise_v3 == 3) & (_tipo_contrato ==  3)
  replace _cise_v3 = .a if (_cise_v3 == 3) & (_tipo_contrato == .a)
  # delimit ;
  label define _cise_v3
    3   "Asalariado sin contrato"
    4   "Asalariado con contrato definido"
    5   "Asalariado con contrato indefinido",
    modify;
  # delimit cr
  * Etiquetado
  label variable _cise_v3 "Categoría ocupacional"
end
