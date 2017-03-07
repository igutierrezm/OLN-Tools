* Tramo de edad (con énfasis en los jóvenes)
capture program drop gen_casen_tramo_edad_v3
program define gen_casen_tramo_edad_v3
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_tramo_edad_v3") año(`año')
	# delimit ;
	recode `r(selection)'
		(00/14  =  0 "14 o menos")
		(15/19  =  1 "Entre 15 y 19")
		(20/24  =  2 "Entre 20 y 24")
		(25/29  =  3 "Entre 25 y 29")
		(30/max =  4 "30 o más")
		(else   = 1e5 "ns/nr"),
		generate(_tramo_edad_v3);
	# delimit cr
	* Etiquetado
	label variable _tramo_edad_v3 "Tramo de edad"
end
