capture program drop gen_esi_mantuvo_empleo
program define gen_esi_mantuvo_empleo, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  local var "_mantuvo_empleo"
  /* * Definición antigua
  generate `var' = (D1_opcion == 1) | (D5_opcion == 1)
  replace  `var' = 1e5 if (D1_opcion == .) & (D5_opcion == .) */
  generate `var' = (OCUP_REF == 1)
  replace  `var' = 1e5 if (OCUP_REF == .)

  * Etiquetado
  label define   `var' 0 "no" 1 "sí" 1e5 "ns/nr"
  label values   `var' `var'
  label variable `var' "¿Mantuvo su trabajo del mes anterior?"
end
* ¿Hay un error en la etiqueta de D1_opcion/D5_opcion en 2010? Revisar.
* Noten que no es fácil distinguir entre "0" y "ns/nr".
* Podría cargar B2, B3, B5 para hacerlo, pero no vale la pena, pues lo
* único importante es distinguir a los 1's.
