* Gran grupo de ocupación (CIUO-88)
capture program drop gen_esi_oficio1
program define gen_esi_oficio1, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	local var "_oficio1"
	recode B1 (10 = 1e5) (missing = 1e5), generate(`var')
	* Etiquetado
	# delimit ;
		label define `var'
		  0  "Fuerzas armadas"
		  1  "Miembros del poder ejecutivo y de los cuerpos legislativos y personal directivo"
		  2  "Profesionales, científicos e intelectuales"
		  3  "Técnicos profesionales de nivel medio"
		  4  "Empleados de oficina"
		  5  "Trabajadores de los servicios y vendedores de comercios y mercados"
		  6  "Agricultores y trabajadores calificados agropecuarios y pesqueros"
		  7  "Oficiales, operarios y artesanos de artes mecánicas y de otros oficios"
		  8  "Operadores de instalaciones y máquinas y montadores"
		  9  "Trabajadores no calificados"
			1e5 "ns/nr";
	# delimit cr
	label values `var' `var'
	label variable `var' "Gran grupo de ocupación"
end
