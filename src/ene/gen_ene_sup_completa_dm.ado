* ¿Completó la educación superior (técnica o universitaria)?
capture program drop gen_ene_sup_completa_dm
program define gen_ene_sup_completa_dm
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_sup_completa_dm"
  capture confirm variable _educ
  if (_rc != 0) {
    ol_select, varlist("_educ") db("ene") año("`año'") mes("`mes'")
    gen_ene_educ, año("`año'") mes("`mes'")
  }
  generate `var' = inrange(_educ, 4, 6)

  * Etiquetado
  label variable `var' "=1 si completó la educación superior"
end
