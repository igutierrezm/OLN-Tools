capture program drop gen_casen_media_completa
program define gen_casen_media_completa
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_media_completa"
  capture confirm variable _educ
  if (_rc != 0) {
    select_casen, varlist("`var'") año(`año')
    gen_casen_educ, año(`año')
  }
  recode _educ (0/2 = 0) (3/12 = 1), generate(`var')
  * Etiquetado (valores)
  label define `var' 0 "no" 1 "sí" 1e5 "ns/nr"
  label values `var' `var'
  * Etiquetado (variables)
  label variable `var' "¿Completó la enseñanza media?"
end
