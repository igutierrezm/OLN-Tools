* CISE (agregación estándar)
capture program drop gen_casen_cise_v1
program define gen_casen_cise_v1
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_cise_v1") año(`año')
  if inrange(`año', 2011, 2015) {
    # delimit ;
    recode `r(selection)'
      (0    =   0 "No Corresponde")
      (1    =   1 "Empleadores")
      (2    =   2 "Cuenta Propia")
      (3/8  =   3 "Asalariados")
      (9    =   6 "Familiares no Remunerados")
      (1e6  = 1e6 "Nacional")
      (else = 1e5 "ns/nr"),
      generate(_cise_v1);
    # delimit cr
  }
  if inrange(`año', 2000, 2009) {
    # delimit ;
    recode `r(selection)'
      (0     =   0 "No corresponde")
      (1     =   1 "Empleadores")
      (2     =   2 "Cuenta Propia")
      (3/7 9 =   3 "Asalariados")
      (8     =   6 "Familiares no Remunerados")
      (1e6   = 1e6 "Nacional")
      (else  = 1e5 "ns/nr"),
      generate(_cise_v1);
    # delimit cr
  }
  * Etiquetado
  label variable _cise_v1 "Categoría ocupacional"
end
