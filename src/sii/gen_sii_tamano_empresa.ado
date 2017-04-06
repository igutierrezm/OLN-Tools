capture program drop gen_sii_tamano_empresa
program define gen_sii_tamano_empresa
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	local var0 "tramotrabajadores"
	local var1 "_tamano_empresa"
	tempvar var tramo
	encode `var0', generate(`tramo')
	# delimit ;
		recode `tramo'
			(00   =   0 "Unipersonal")
      (03   =   1 "Micro")
			(04   =   2 "Pequeña")
			(02   =   3 "Mediana")
			(01   =   4 "Grande")
			(else = 1e5 "ns/nr"),
			generate(`var1');
	# delimit cr
	* Etiquetado
	label variable `var1' "Tamaño de empresa"
  notes `var1' : "Tamaño de empresa (según n. de trabajadores)"
end
