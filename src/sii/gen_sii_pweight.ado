capture program drop gen_sii_pweight
program define gen_sii_pweight
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
  generate _pweight = 1
	* Etiquetado
	label variable _pweight "Factor de expansion"
end
