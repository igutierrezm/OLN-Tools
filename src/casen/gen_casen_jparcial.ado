capture program drop gen_casen_jparcial
program define gen_casen_jparcial
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local output "_jparcial"
  select_casen, varlist("`output'") año(`año')
  if (`año' == 2015) {
    recode `r(selection)'                  ///
      (2     =   1 "Con jornada parcial")  ///
      (1 3 4 =   0 "Sin jornada parcial")  ///
      (else  = 1e5 "ns/nr"),               ///
    	generate(`output')
  }
  * Etiquetado
  label variable `output' "¿Tiene jornada parcial?"
end
