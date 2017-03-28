* Región de residencia (no distingue a Ñuble de Biobío)
capture program drop gen_esi_region_tr_v1
program define gen_esi_region_tr_v1, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutacións
	tempvar B18_region
	local var "_region_tr_v1"
  destring B18_CODIGO, replace force
  generate `B18_region' = floor(B18_CODIGO / 1000)
	# delimit ;
		recode `B18_region'
			(15   =  01 "Región de Arica y Parinacota")
			(01   =  02 "Región de Tarapacá")
			(02   =  03 "Región de Antofagasta")
			(03   =  04 "Región de Atacama")
			(04   =  05 "Región de Coquimbo")
			(05   =  06 "Región de Valparaíso")
			(13   =  07 "Región Metropolitana de Santiago")
			(06   =  08 "Región del Libertador General Bernardo O'Higgins")
			(07   =  09 "Región del Maule")
			(08   =  10 "Región del Biobío")
			(09   =  11 "Región de La Araucanía")
			(14   =  12 "Región de Los Ríos")
			(10   =  13 "Región de Los Lagos")
			(11   =  14 "Región de Aysén del General Carlos Ibáñez del Campo")
			(12   =  15 "Región de Magallanes y de la Antártica Chilena")
			(else = 1e5 "ns/nr"),
			generate(`var');
	# delimit cr
	* Etiquetado
	label variable `var' "Región de trabajo"
	note `var' : "No distingue Ñuble de BíoBío"
end
