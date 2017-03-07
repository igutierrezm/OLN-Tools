* Años de escolaridad
capture program drop gen_ene_esc
program define gen_ene_esc, rclass
	version 14.1
	syntax, año(string) mes(string) [from(string)]
	* Mutación
	# delimit ;
		recode nivel
			(00/03 = 00)
			(04/05 = 08)
			(06 14 = 06)
			(07/09 = 12)
			(10/12 = 17)
			(else  = .a),
			generate(_esc);
	# delimit cr
	replace _esc = _esc + min(0, curso) if (nivel <= 2)
	replace _esc = _esc + min(8, curso) if (nivel == 3)
	replace _esc = _esc + min(4, curso) if inlist(nivel, 04, 05)
	replace _esc = _esc + min(6, curso) if inlist(nivel, 06, 14)
	replace _esc = _esc + min(4, curso) if inlist(nivel, 07, 08)
	replace _esc = _esc + min(5, curso) if (nivel == 09)
	replace _esc = _esc + min(0, curso) if (nivel == 10)
	replace _esc = _esc + min(2, curso) if (nivel == 11)
	replace _esc = _esc + min(5, curso) if (nivel == 12)
	replace _esc = .a                   if (nivel >= 03) & (curso == 9)
	* Etiquetado
	label variable _esc "Años de escolaridad"
end
