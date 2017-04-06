* ¿Completó la educación superior (técnica o universitaria)?
capture program drop gen_casen_sup_completa
program define gen_casen_sup_completa
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_sup_completa"
  capture confirm variable _educ
  if (_rc != 0) {
    ol_select, varlist("_educ") db("casen") año("`año'")
    gen_casen_educ, año("`año'")
  }
  # delimit ;
    recode _educ
      (1/3 =    0 "Sin educación superior completa")
      (4/6 =    1 "Con educación superior completa")
      (else = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  * Etiquetado
  label variable `var' "¿Completó la educación superior?"
end
