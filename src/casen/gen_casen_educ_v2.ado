capture program drop gen_casen_educ_v2
program define gen_casen_educ_v2
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_educ_v2") año(`año')
	if inrange(`año', 2013, 2015) {
		# delimit ;
		recode `r(selection)'
			(0/1   =  1 "Básica incompleta o menos")
			(2/4   =  2 "Básica")
			(5/7 9 =  3 "Media")
			(8     =  4 "Técnica")
			(10/12 =  5 "Profesional o más")
			(else  = 1e5 "ns/nr"),
			generate(_educ_v2);
		# delimit cr
	}
	* Etiquetado
	label variable _educ_v2 "Nivel de educación"
end
