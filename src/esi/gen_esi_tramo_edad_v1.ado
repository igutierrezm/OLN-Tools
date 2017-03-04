capture program drop gen_esi_tramo_edad_v1
program define gen_esi_tramo_edad_v1, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	select_esi, varlist("_tramo_edad_v1") año(`año')
	# delimit ;
	recode EDAD
		(00/14  =  0 "14 o menos")
		(15/19  =  1 "Entre 15 y 19")
		(20/24  =  2 "Entre 20 y 24")
		(25/34  =  3 "Entre 25 y 34")
		(35/44  =  4 "Entre 35 y 44")
		(45/54  =  5 "Entre 45 y 54")
		(55/64  =  6 "Entre 55 y 64")
		(65/max =  7 "65 o más")
		(else   = .a "ns/nr"),
		generate(_tramo_edad_v1);
	# delimit cr
	* Etiquetado
	label variable _tramo_edad_v1 "tramo de edad (mayores de 15 años)"
end
