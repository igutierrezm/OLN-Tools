* Nivel educacional
capture program drop gen_esi_educ
program define gen_esi_educ, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Objetos temporales
	tempvar temp
	* Abreviaciones
	local n "NIVEL"
	local t "TERMINO_NIVEL"
	* Mutación
	generate `temp' = `n' * (3 - 2 * `t') if inrange(`t', 1, 2) & (`n' != 999)
	# delimit ;
		recode `temp'
			(1e6     = 1e6 "Nacional")
			(-03/-03 =   1 "Básica incompleta o menos")
			(+00/+02 =   1 "Básica incompleta o menos")
			(+03/+03 =   2 "Básica")
			(-06/-04 =   2 "Básica")
			(-14/-14 =   2 "Básica")
			(+04/+06 =   3 "Media")
			(-09/-07 =   3 "Media")
			(+14/+14 =   3 "Media")
			(+07/+08 =   4 "Técnica")
			(+09/+09 =   5 "Universitaria")
			(-12/-10 =   5 "Universitaria")
			(+10/+12 =   6 "Postgrado")
			(else    = 1e5 "ns/nr"),
			generate(_educ);
	# delimit cr
	* Casos especiales
	replace _educ = 1 if (`n' == 0) & (`t' == 0)
	* Etiquetado
	label variable _educ "Nivel educacional"
end
