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
			(16    =  14 "PIB a costo de factores")
			(17    =  15 "Impuesto al valor agregado")
			(18    =  16 "Derechos de importación")
			(19    =  17 "Producto Interno Bruto")
			(else  = 1e5 "ns/nr"),
			generate(_rama1_v1);
	# delimit cr
	* Etiquetado
	local lvar "Rama de actividad económica"
	label variable _rama1_v1 "`lvar'"
	note _rama1_v1 : "agregación estándar"
	note _rama1_v1 : "El sector 11 contiene tanto a actividades de vivienda como a servicios empresariales"
end
