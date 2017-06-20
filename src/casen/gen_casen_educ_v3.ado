capture program drop gen_casen_educ_v3
program define gen_casen_educ_v3
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_educ_v3") año(`año')
	if inrange(`año', 2013, 2015) {
		# delimit ;
		recode `r(selection)'
			(0/4     =   1 "Media incompleta o menos")
			(5/7 9   =   2 "Media completa o superior incompleta")
			(8 10/12 =   3 "Superior completa o más")
			(else    = 1e5 "ns/nr"),
			generate(_educ_v3);
		# delimit cr
	}
	* Etiquetado
	label variable _educ_v3 "Nivel educacional"
end
