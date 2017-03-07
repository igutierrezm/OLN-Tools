capture program drop gen_sii_tamaño_empresa
program define gen_sii_tamaño_empresa
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
  local var "_tamaño_empresa"
	# delimit ;
		recode tramo_ntrab
			(00   =  0 "Unipersonal")
      (01   =  1 "Micro")
			(02   =  2 "Pequeña")
			(03   =  3 "Mediana")
			(04   =  4 "Grande")
			(else = 1e5 "ns/nr"),
			generate(`var');
	# delimit cr
	* Etiquetado
	label variable `var' "Tamaño de empresa (según n. de trabajadores)"
end
