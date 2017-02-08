capture program drop gen_pib_año
program define gen_pib_año
	version 14.1
	syntax
	* Mutación
  generate _año = year(fecha)
  * Etiquetado
	label variable _año "Año"
end
