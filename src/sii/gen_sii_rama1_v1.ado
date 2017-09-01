capture program drop gen_sii_rama1_v1
program define gen_sii_rama1_v1
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	tempvar sector
// 	capture : encode rubro, generate(`sector')
	# delimit ;
		recode rubro
			(01    = 01 "Agropecuario-Silvícola")
			(02    = 02 "Pesca")
			(03    = 03 "Minería")
			(04/05 = 04 "Industria Manufacturera")
			(06    = 05 "Electricidad, Gas y Agua")
			(07    = 06 "Construcción")
			(08    = 07 "Comercio")
			(09    = 08 "Hoteles y Restaurantes")
			(10    = 09 "Transporte y Comunicaciones")
			(11    = 10 "Intermediación Financiera")
			(12    = 11 "Actividades Inmobiliarias, Empresariales y de Alquiler")
			(14/17 = 12 "Servicios Personales")
			(13 18 = 13 "Administración Pública")
			(else  = 1e5 "ns/nr"),
			generate(_rama1_v1);
	# delimit cr
	* Etiquetas
	label variable _rama1_v1 "Rama de actividad económica"
	note _rama1_v1 : "agregación estándar"
end
