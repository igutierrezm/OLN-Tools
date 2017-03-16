* Tamaño de empresa (según n. de trabajadores)
capture program drop gen_ene_tamano_empresa
program define gen_ene_tamano_empresa
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Objetos temporales
  tempvar b15_1 b15_2
  * Mutación
  local var "_tamano_empresa"
  local cat "categoria_ocupacion"
	generate `b15_1' = b15_1
	generate `b15_2' = b15_2
  destring `b15_1' `b15_2', replace
  # delimit ;
    recode `b15_1'
      (0    =  0 "Unipersonal")
    	(1/2  =  1 "Micro")
    	(3    =  2 "Pequeña")
    	(4    =  3 "Mediana")
    	(5    =  4 "Grande")
    	(else = 1e5 "ns/nr"),
    	generate(`var');
  # delimit cr
  * Casos especiales
  replace `var' = 0 if (`b15_1' == 1) & (`b15_2' == 01) & (`cat' == 2)
  replace `var' = 2 if (`b15_1' == 2) & (`b15_2' == 10)
  * Etiquetado
  label variable `var' "Tamaño de empresa"
  notes `var' : "Tamaño de empresa (según n. de trabajadores)"
end
* Último acuerdo: Frente a la duda unipersonal/micro/pequeño, quedará micro.
