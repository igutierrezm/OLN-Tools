capture program drop gen_sii_estrato
program define gen_sii_estrato
	version 14.1
	syntax, año(string)
	* Mutación
  generate _estrato = 1
	* Etiquetado
	label variable _estrato "Estrato"
end
