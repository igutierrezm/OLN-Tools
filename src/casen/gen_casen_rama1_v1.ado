* Rama de actividad económica (agregación estándar)
capture program drop gen_casen_rama1_v1
program define gen_casen_rama1_v1, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_rama1_v1") año(`año')
	if inrange(`año', 2011, 2015) {
		# delimit ;
		recode `r(selection)'
		  (1e6   = 1e6 "Nacional")
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
			(13/16 =  12 "Servicios Personales")
			(12 17 =  13 "Administración Pública")
			(else  = 1e5 "ns/nr"),
			generate(_rama1_v1);
		# delimit cr
	}
	* Etiquetado
	label variable _rama1_v1 "Rama de actividad económica"
end

* TODO
* 1. Cubrir más años.

























/* NO USAR DE MOMENTO:
* Recodificación 2000:
if (`año' == 2000) {
	# delimit ;
	recode o9
		(-1 = 99)
		(1110 / 1220 = 01)
		(1301 / 1302 = 02)
		(2100 / 2909 = 03)
		(3111 / 3909 = 04)
		(4101 / 4200 = 05)
		(5000 / 5000 = 06)
		(6100 / 6200 = 07)
		(6310 / 6320 = 08)
		(7111 / 7200 = 09)
		(8101 / 8200 = 10)
		(8310 / 8330 = 11)
		(9200 / 9599 = 12)
		(9100   9600 = 13)
		(else = 14),
		generate(_rama1);
	# delimit cr
}

* Recodificación 2003:
if (`año' == 2003) {
	# delimit ;
	recode o8
		(-1 = 99)
		(1110 / 1220 = 01)
		(1301 / 1302 = 02)
		(2100 / 2909 = 03)
		(3111 / 3909 = 04)
		(4101 / 4200 = 05)
		(5000 / 5220 = 06)
		(6100 / 6200 = 07)
		(6310 / 6320 = 08)
		(7111 / 7200 = 09)
		(8101 / 8200 = 10)
		(8310 / 8330 = 11)
		(9200 / 9599 = 12)
		(9100   9600 = 13)
		(else = 14),
		generate(_rama1);
	# delimit cr
}

* Recodificación 2006:
if (`año' == 2006) {
	# delimit ;
	recode c_o12
		(-1 = 99)
		(1110 / 1220 = 01)
		(1301 / 1302 = 02)
		(2100 / 2909 = 03)
		(3111 / 3909 = 04)
		(4101 / 4200 = 05)
		(5000 / 5000 = 06)
		(6100 / 6200 = 07)
		(6310 / 6320 = 08)
		(7111 / 7200 = 09)
		(8101 / 8200 = 10)
		(8310 / 8330 = 11)
		(9200 / 9599 = 12)
		(9100   9600 = 13)
		(else = 14),
		generate(_rama1);
	# delimit cr
}

* Recodificación 2009:
if (`año' == 2009) {
	# delimit ;
	recode c_o13
		(-1 = 99)
		(1110 / 1220 = 01)
		(1301 / 1302 = 02)
		(2000 / 2909 = 03)
		(3000 / 3909 = 04)
		(4000 / 4200 = 05)
		(5000 / 5000 = 06)
		(6100 / 6200 = 07)
		(6310 / 6320 = 08)
		(7000 / 7200 = 09)
		(8101 / 8200 = 10)
		(8310 / 8330 = 11)
		(9200 / 9599 = 12)
		(9100   9600 = 13)
		(else = 14),
		generate(_rama1);
	# delimit cr
}

* Etiquetado (valores):
# delimit ;
label define _rama1
	01 "Agropecuario-Silvícola"
	02 "Pesca"
	03 "Minería"
	04 "Industria Manufacturera"
	05 "Electricidad, Gas y Agua"
	06 "Construcción"
	07 "Comercio"
	08 "Hoteles y Restaurantes"
	09 "Transporte y Comunicaciones"
	10 "Intermediación Financiera"
	11 "Actividades Inmobiliarias, Empresariales y de Alquiler"
	12 "Servicios Personales"
	13 "Administración Pública"
	14 "No bien especificado"
	99 "Nacional";
# delimit cr
label values _rama1 _rama1


*/
