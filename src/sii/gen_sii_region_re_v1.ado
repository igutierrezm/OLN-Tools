capture program drop gen_sii_region_re_v1
program define gen_sii_region_re_v1
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	tempvar region
	encode region, generate(`region')
  local var "_region_re_v1"
	# delimit ;
		recode `region'
			(01   =  02 "Región de Tarapacá")
			(02   =  06 "Región de Valparaíso")
			(03   =  13 "Región de Los Lagos")
			(04   =  03 "Región de Antofagasta")
			(05   =  05 "Región de Coquimbo")
			(06   =  11 "Región de La Araucanía")
			(07   =  08 "Región de O'Higgins")
			(08   =  14 "Región de Aysén")
			(09   =  01 "Región de Arica y Parinacota")
			(10   =  04 "Región de Atacama")
			(11   =  09 "Región del Maule")
			(12   =  15 "Región de Magallanes")
			(13   =  12 "Región de Los Ríos")
			(15   =  10 "Región del Biobío")
			(16   =  07 "Región Metropolitana de Santiago")
			(else = 1e5 "ns/nr"),
			generate(`var');
	# delimit cr
	* Etiquetas
	label variable `var' "Región"
	note `var' : "No distingue entre Ñuble y BíoBío"
end
