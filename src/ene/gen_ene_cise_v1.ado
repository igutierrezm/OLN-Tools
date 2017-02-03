* CISE (agregación estándar)
capture program drop gen_ene_cise_v1
program define gen_ene_cise_v1, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_cise_v1"
  * RMutación
  # delimit ;
    recode categoria_ocupacion
      (0    =   0 "No corresponde")
      (1    =   1 "Empleadores")
      (2    =   2 "Cuenta Propia")
      (3/6  =   3 "Asalariados")
      (7    =   4 "Familiares no Remunerados")
      (1e6  = 1e6 "Nacional")
      (else = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  * Etiquetado
  label variable `var' "Categoría ocupacional"
end
