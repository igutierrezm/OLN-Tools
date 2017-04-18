* Rama de actividad económica (agregación estándar)
capture program drop gen_casen_rama1_v3
program define gen_casen_rama1_v3
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_rama1_v3") año(`año')
	if inrange(`año', 2011, 2015) {
		# delimit ;
		recode `r(selection)'
			(01    =  01 "Agropecuario-Silvícola")
			(02    =  02 "Pesca")
			(03    =  03 "Minería")
			(04    =  04 "Industria Manufacturera")
			(05    =  05 "Electricidad, Gas y Agua")
			(06    =  06 "Construcción")
			(07    =  07 "Comercio")
			(08    =  08 "Hoteles y Restaurantes")
			(09    =  09 "Transporte y Comunicaciones")
			(10    =  10 "Intermediación Financiera")
			(11    =  11 "Actividades Inmobiliarias, Empresariales y de Alquiler")
      (13    =  12 "Enseñanza")
      (14    =  13 "Servicios sociales y de salud")
      (15    =  14 "Otras actividades de servicios comunitarios, sociales y personales")
      (16    =  15 "Hogares privados con servicio doméstico")
			(12 17 =  16 "Administración Pública")
			(else  = 1e5 "ns/nr"),
			generate(_rama1_v3);
		# delimit cr
	}
	* Etiquetado
	label variable _rama1_v3 "Rama de actividad económica"
end

* TODO
* 1. Cubrir más años.
