capture program drop gen_ene_jparcial_inv
program define gen_ene_jparcial_inv, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_jparcial_inv"
  * Mutación
  generate `var' = .a
  replace  `var' = 0 if (c1  == 1)
  replace  `var' = 0 if (c10 == 2)
  replace  `var' = 0 if inrange(c11, 2, 4)
  replace  `var' = 1 if (c1 == 2) & (c10 == 1) & (c11 == 1)
  * Etiquetado
  label define `var' 0 "No" 1 "Sí" .a "ns/nr", modify
  label values `var' `var'
  label variable `var' `"¿Tiene jornada parcial involuntaria?"'
end
