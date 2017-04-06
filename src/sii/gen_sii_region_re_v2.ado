capture program drop gen_sii_region_re_v2
program define gen_sii_region_re_v2
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	tempvar region
	encode region, generate(`region')
  local var "_region_re_v2"
	# delimit ;
		recode `region'
			(01   =  02 "Región de Tarapacá")
			(02   =  06 "Región de Valparaíso")
			(03   =  14 "Región de Los Lagos")
			(04   =  03 "Región de Antofagasta")
			(05   =  05 "Región de Coquimbo")
			(06   =  12 "Región de La Araucanía")
			(07   =  08 "Región de O'Higgins")
			(08   =  15 "Región de Aysén")
			(09   =  01 "Región de Arica y Parinacota")
			(10   =  04 "Región de Atacama")
			(11   =  09 "Región del Maule")
			(12   =  16 "Región de Magallanes")
			(13   =  13 "Región de Los Ríos")
			(15   =  11 "Región del Biobío")
			(16   =  07 "Región Metropolitana de Santiago")
			(-1   =  10 "Región de Ñuble")
			(else = 1e5 "ns/nr"),
			generate(`var');
	# delimit cr
	replace `var' = 10 if (provincia == "Ñuble")
	* Etiquetas
	label variable `var' "Región"
	note `var' : "Sí distingue entre Ñuble y BíoBío"
end
