capture program drop gen_pib_año
program define gen_pib_año
	version 14.1
	syntax
	* Mutación
  generate _año = year(fecha)
  * Etiquetado
	label variable _año "Año"
	* Etiquetado (valores)
	forvalues t = 1(1)`c(N)' {
		local _año = fecha[`t']
		label define _año `_año' "`_año'", modify
	}
	label values _año _año
end
