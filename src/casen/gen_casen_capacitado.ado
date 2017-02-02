capture program drop gen_casen_capacitado
program define gen_casen_capacitado, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  local var "_capacitado"
  select_casen, varlist("_capacitado") año(`año')
  if (`año' == 2015) {
    # delimit ;
      recode `r(selection)'
        (1e6  = 1e6 "Nacional")
        (1    =   1 "Sí")
        (2    =   0 "No")
      	(else = 1e5 "ns/nr"),
      	generate(`var');
    # delimit cr
  }
  if (`año' == 2013) {
    # delimit ;
      recode `r(selection)'
        (1e6  = 1e6 "Nacional")
        (1/3  =   1 "Sí")
        (4    =   0 "No")
      	(else = 1e5 "ns/nr"),
      	generate(`var');
    # delimit cr
  }
  * Etiquetado
  label variable `var' "¿Fue capacitado últimamente?"
end
