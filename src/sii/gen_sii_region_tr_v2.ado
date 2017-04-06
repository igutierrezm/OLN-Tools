capture program drop gen_sii_region_tr_v2
program define gen_sii_region_tr_v2
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	local var "_region_tr_v2"
	capture : gen_sii_region_re_v2, año("`año'")
	generate _region_tr_v2 = _region_re_v2

	* Etiquetas
	label copy _region_re_v2 `var'
	label values `var' `var'
	label variable `var' "Región"
	note `var' : "Sí distingue entre Ñuble y BíoBío"
end
