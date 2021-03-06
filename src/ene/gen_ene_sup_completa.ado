* ¿Completó la educación superior (técnica o universitaria)?
capture program drop gen_ene_sup_completa
program define gen_ene_sup_completa
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_sup_completa"
  capture confirm variable _educ_v2
  if (_rc != 0) {
    ol_select, varlist("_educ_v2") db("ene") año("`año'") mes("`mes'")
    gen_ene_educ_v2, año("`año'") mes("`mes'")
  }
  # delimit ;
    recode _educ_v2
      (1/3 =   0 "No")
      (4/6 =   1 "Sí")
      (else = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  * Etiquetado
  label variable `var' "¿Completó la educación superior?"
end
