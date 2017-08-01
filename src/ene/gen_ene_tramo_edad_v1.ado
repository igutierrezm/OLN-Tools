* Tramo de edad (tramos centrados en la pet)
capture program drop gen_ene_tramo_edad_v1
program define gen_ene_tramo_edad_v1, rclass
	version 14.1
	syntax, año(string) mes(string) [from(string)]
	* Mutación
	# delimit ;
		recode edad
			(00/14  =  0 "14 o menos")
			(15/29  =  1 "Entre 15 y 29")
			(30/44  =  2 "Entre 30 y 44")
			(45/59  =  4 "Entre 45 y 59")
			(60/64  =  5 "Entre 60 y 64")
			(65/max =  6 "65 o más")
			(else   = 1e5 "ns/nr"),
			generate(_tramo_edad_v1);
	# delimit cr
	* Etiquetado
	label variable _tramo_edad_v1 "Tramo de edad"
end
