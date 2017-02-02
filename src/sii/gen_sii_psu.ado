capture program drop gen_sii_psu
program define gen_sii_psu
	version 14.1
	syntax, año(string)
	* Mutación
  generate _psu = 1
	* Etiquetado
	label variable _psu "Unidad primaria de muestreo"
end
