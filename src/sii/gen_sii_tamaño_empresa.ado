capture program drop gen_sii_tamaño_empresa
program define gen_sii_tamaño_empresa
	version 14.1
	syntax, año(string)
	* Mutación
  local var "_tamaño_empresa"
	# delimit ;
		recode tramo_ntrab
			(00   =  00 "Unipersonal")
      (01   =  01 "Micro")
			(02   =  02 "Pequeña")
			(03   =  03 "Mediana")
			(04   =  04 "Grande")
			(1e6  = 1e6 "Nacional")
			(else = 1e5 "ns/nr"),
			generate(`var');
	# delimit cr
	* Etiquetado
	label variable `var' "Tamaño de empresa (según n. de trabajadores)"
end
