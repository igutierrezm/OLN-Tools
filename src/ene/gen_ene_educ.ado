* Nivel educacional
capture program drop gen_ene_educ
program define gen_ene_educ, rclass
	version 14.1
	syntax, año(string) mes(string) [from(string)]
	* Objetos temporales
	tempvar educ
	* Abreviaciones
	local n "nivel"
	local t "termino_nivel"
	* Mutación
	generate `educ' = `n' * (3 - 2 * `t') if inrange(`t', 1, 2) & (`n' != 999)
	# delimit ;
		recode `educ'
			(1e6     = 1e6 "Nacional")
			(-03/-01 =   1 "Básica incompleta o menos")
			(+00/+02 =   1 "Básica incompleta o menos")
			(+03/+03 =   2 "Básica")
			(-06/-04 =   2 "Básica")
			(-14/-14 =   2 "Básica")
			(+04/+06 =   3 "Media")
			(-09/-07 =   3 "Media")
			(+14/+14 =   3 "Media")
			(+07/+08 =   4 "Técnica")
			(+09/+09 =   5 "Profesional")
			(-12/-10 =   5 "Profesional")
			(+10/+12 =   6 "Postgrado")
			(else    = 1e5 "ns/nr"),
			generate(_educ);
	# delimit cr
	* Casos especiales
	replace _educ = 1 if (`n' == 0) & (`t' == 0)
	* Etiquetado
	label variable _educ "Nivel educacional"
end
