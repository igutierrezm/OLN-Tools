* Tramos de edad (centrados en los menores de edad)
capture program drop gen_casen_tramo_edad_v2
program define gen_casen_tramo_edad_v2, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_casen, varlist("_tramo_edad_v2") año(`año')
	# delimit ;
	recode `r(selection)'
	  (00/05  =   1 "5 o menos")
		(06/13  =   2 "Entre 6 y 13")
		(14/17  =   3 "Entre 14 y 17")
		(18/max =   4 "18 o más")
		(1e6    = 1e6 "Nacional")
		(else   = 1e5 "ns/nr"),
		generate(_tramo_edad_v2);
	# delimit cr
	* Etiquetado
	label variable _tramo_edad_v2 "Tramo de edad"
end
