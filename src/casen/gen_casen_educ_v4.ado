capture program drop gen_casen_educ_v4
program define gen_casen_educ_v4
	version 14.1
	syntax, año(string) [mes(string) from(string)]
  * Mutación
  tempvar educ
	select_casen, varlist("_educ_v4") año(`año')
  generate `educ' = `r(selection)' - (`año' == 2009)
	if inrange(`año', 2009, 2015) {
		# delimit ;
		recode `educ'
			(0/1     =   1 "Básica incompleta o menos")
			(2/4     =   2 "Básica")
			(5/7 9   =   3 "Media")
			(8 10/12 =   4 "Técnica o más")
			(else    = 1e5 "ns/nr"),
			generate(_educ_v4);
		# delimit cr
	}
	* Etiquetado
	label variable _educ_v4 "Nivel educacional"
end
