capture program drop gen_esi_tamaño_empresa
program define gen_esi_tamaño_empresa, rclass
  version 14.1
  syntax, año(string)
  * Objetos temporales
  tempvar B15_1 B15_2
  * Mutación
  generate `B15_1' = B15_1
  generate `B15_2' = B15_2
  destring `B15_1' `B15_2', replace
  local var "_tamaño_empresa"
  local cat "CISE"
  # delimit ;
  recode `B15_1'
    (1e6  = 1e6 "Nacional")
    (0    =   0 "Unipersonal")
  	(1/2  =   1 "Micro")
  	(3    =   2 "Pequeña")
  	(4    =   3 "Mediana")
  	(5    =   4 "Grande")
  	(else = 1e5 "ns/nr"),
  	generate(`var');
  # delimit cr
  replace `var' = 1e5 if (`var' == 1) & (`B15_2' == 999)
  replace `var' = 1e5 if (`var' == 1) & (`B15_2' ==   .)
  replace `var' =   2 if (`var' == 1) & (`B15_2' ==  10)
  replace `var' =   0 if (`cat' == 2) & (`B15_2' ==   1)
  replace `var' = 1e5 if (`cat' == .) & (`B15_2' ==   1)
  * Etiquetado
  label variable `var' "tamaño de empresa (según n. de trabajadores)"
end
