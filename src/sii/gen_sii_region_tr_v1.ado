capture program drop gen_sii_region_tr_v1
program define gen_sii_region_tr_v1
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	local var "_region_tr_v1"
	capture : gen_sii_region_re_v1, año("`año'")
	generate _region_tr_v1 = _region_re_v1

	* Etiquetas
	label copy _region_re_v1 `var'
	label values `var' `var'
	label variable `var' "Región"
	note `var' : "No distingue entre Ñuble y BíoBío"
end
