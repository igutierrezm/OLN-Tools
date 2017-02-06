capture program drop gen_sii_estrato
program define gen_sii_estrato
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
  generate _estrato = 1
	* Etiquetado
	label variable _estrato "Estrato"
end
