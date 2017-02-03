* CISE (agregación estándar)
capture program drop gen_esi_cise_v1
program define gen_esi_cise_v1, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  # delimit ;
  recode CISE
    (0    =   0 "No corresponde")
    (1    =   1 "Empleadores")
    (2    =   2 "Cuenta propia")
    (3/6  =   3 "Asalariados")
    (7    =   4 "Familiares no Remunerados")
    (1e6  = 1e6 "Nacional")
    (else = 1e5 "ns/nr"),
    generate(_cise_v1);
  # delimit cr
  * Etiquetado
  label variable _cise_v1 "Categoría ocupacional"
end
