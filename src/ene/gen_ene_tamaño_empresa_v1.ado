* Tamaño de empresa (según n. de trabajadores)
capture program drop gen_ene_tamaño_empresa_v1
program define gen_ene_tamaño_empresa_v1, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Objetos temporales
  tempvar b15_1 b15_2
  * Mutación
  generate `b15_1' = b15_1
  generate `b15_2' = b15_2
  destring `b15_1' `b15_2', replace
  local var "_tamaño_empresa_v2"
  local cat "categoria_ocupacion"
  # delimit ;
    recode `b15_1'
      (1e6  = 1e6 "Nacional")
      (0    =   0 "Unipersonal")
    	(1/2  =   1 "Micro")
    	(3    =   2 "Pequeña")
    	(4    =   3 "Mediana")
    	(5    =   4 "Grande")
    	(else = 1e5 "ns/nr"),
    	generate(`var');
  # delimit cr
  replace `var' = 1e5 if (`b15_1' == 1) & inlist(`b15_2', ., 999) & (`cat' == 2)
  replace `var' = 1e5 if (`b15_1' == 2) & inlist(`b15_2', ., 999)
  replace `var' =   2 if (`b15_1' == 2) & (`b15_2' ==  10)
  replace `var' =   0 if (`cat' == 2) & (`b15_2' ==   1)
  replace `var' = 1e5 if (`cat' == .) & (`b15_2' ==   1)
  * Etiquetado
  label variable `var' "Tamaño de empresa (según n. de trabajadores)"
end
