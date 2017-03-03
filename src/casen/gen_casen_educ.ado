capture program drop gen_casen_educ
program define gen_casen_educ
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_educ") año(`año')
	if inrange(`año', 2013, 2015) {
		# delimit ;
		recode `r(selection)'
		  (1e6   = 1e6 "Nacional")
			(0/1   =   1 "Básica incompleta o menos")
			(2/4   =   2 "Básica")
			(5/7 9 =   3 "Media")
			(8     =   4 "Técnica")
			(10/11 =   5 "Profesional")
			(12    =   6 "Postgrado")
			(else  = 1e5 "ns/nr"),
			generate(_educ);
		# delimit cr
	}
	* Etiquetado
	label variable _educ "Nivel de educación"
end
