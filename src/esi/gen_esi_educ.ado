capture program drop gen_esi_educ
program define gen_esi_educ, rclass
	version 14.1
	syntax, año(string)
	* Mutación
	tempvar temp
	generate `temp' = NIVEL * (3 - 2 * TERMINO_NIVEL) if (NIVEL != 999)
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
		(+07/+08 =   4 "Técnica")
		(+14/+14 =   4 "Técnica")
		(+09/+09 =   5 "Universitaria")
		(-12/-10 =   5 "Universitaria")
		(+10/+12 =   6 "Postgrado")
		(else    = 1e5 "ns/nr"),
		generate(_educ);
	# delimit cr
	* Etiquetado
	label variable _educ "Nivel educacional"
end
