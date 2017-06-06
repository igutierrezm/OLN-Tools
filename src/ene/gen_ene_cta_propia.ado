capture program drop gen_ene_cta_propia
program define gen_ene_cta_propia, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_cta_propia"

  * Mutación
  # delimit ;
    recode categoria_ocupacion
      (2          =   0 "Cuenta Propia")
      (nonmissing =   1 "Otros ocupados")
      (missing    = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr

  * Etiquetado
  label variable `var' "¿Es un trabajador por cuenta propia?"
end
