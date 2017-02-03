capture program drop gen_esi_mantuvo_empleo
program define gen_esi_mantuvo_empleo, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  local var "_mantuvo_empleo"
  if inrange(`año', 2011, 2015) {
    generate `var' = (D1_opcion == 1) | (D5_opcion == 1)
    replace  `var' = 1e5 if (D1_opcion == .) & (D5_opcion == .)
  }
  if inrange(`año', 2010, 2010) {
    generate `var' = (MESES_EMPLEO > 0) if (MESES_EMPLEO != .)
    replace  `var' = 1e5 if (MESES_EMPLEO == .)
  }
  * Etiquetado
  label define   `var' 0 "no" 1 "sí" 1e5 "ns/nr" 1e6 "nacional"
  label values   `var' `var'
  label variable `var' "¿Mantuvo su trabajo del mes anterior?"
end
