capture program drop gen_pib_rama1_v1
program define gen_pib_rama1_v1, rclass
	version 14.1
	syntax
	* Mutación
	# delimit ;
		recode sector
			(01    =  01 "Agropecuario-Silvícola")
			(02    =  02 "Pesca")
			(03    =  03 "Minería")
			(04    =  04 "Industria Manufacturera")
			(05    =  05 "Electricidad, Gas y Agua")
			(06    =  06 "Construcción")
			(07    =  07 "Comercio")
			(08    =  08 "Hoteles y Restaurantes")
			(09/10 =  09 "Transporte y Comunicaciones")
			(11    =  10 "Intermediación Financiera")
			(12/13 =  11 "Actividades Inmobiliarias, Empresariales y de Alquiler")
			(14    =  12 "Servicios Personales")
			(15    =  13 "Administración Pública")
			(19    = 1e6 "Nacional")
			(1e5   = 1e5 "ns/nr")
			(else = .),
			generate(_rama1_v1);
	# delimit cr
	* Etiquetado
	local lvar "Rama de actividad económica (agregación estándar)"
	label variable _rama1_v1 "`lvar'"
end
