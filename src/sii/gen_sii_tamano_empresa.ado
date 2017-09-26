capture program drop gen_sii_tamano_empresa
program define gen_sii_tamano_empresa
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	local var0 "tramotrabajadores"
	local var1 "_tamano_empresa"
	tempvar var tramo
	// 	encode `var0', generate(`tramo')
	if (`año' != 2015) {
		recode `var0'  ///
			(00   =   0 "Unipersonal")  ///
      (03   =   1 "Micro")        ///
			(04   =   2 "Pequeña")      ///
			(02   =   3 "Mediana")      ///
			(01   =   4 "Grande")       ///
			(else = 1e5 "ns/nr"),       ///
			generate(`var1')
	}
	if (`año' == 2015) {
		recode `var0'  ///
			(00   =   0 "Unipersonal")  ///
      (01   =   1 "Micro")        ///
			(02   =   2 "Pequeña")      ///
			(03   =   3 "Mediana")      ///
			(04   =   4 "Grande")       ///
			(else = 1e5 "ns/nr"),       ///
			generate(`var1')
	}
	
	* Etiquetado
	label variable `var1' "Tamaño de empresa"
  notes `var1' : "Tamaño de empresa (según n. de trabajadores)"
end
