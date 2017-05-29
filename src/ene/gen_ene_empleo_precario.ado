capture program drop gen_ene_empleo_precario
program define gen_ene_empleo_precario, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_empleo_precario"
  * RMutación
  generate `var' = 1e5
  replace  `var' = 1 if (b8 == 2)
  replace  `var' = 1 if (b9 == 1) & inlist(b10, 1, 2, 3, 5)
  replace  `var' = 0 if (b9 == 2) | (b10 == 10)
  * Etiquetado
  label define `var' 0 "no" 1 "sí" 1e5 "ns/nr"
  label variable `var' "¿Tiene empleo precario?"
end
