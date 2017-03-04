* Años de escolaridad
capture program drop gen_esi_esc
program define gen_esi_esc, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Mutación
	# delimit ;
		recode NIVEL
			(00/03 = 00)
			(04/05 = 08)
			(06 14 = 06)
			(07/09 = 12)
			(10/12 = 17)
			(else  = .a),
			generate(_esc);
	# delimit cr
	replace _esc = _esc + min(0, CURSO) if (NIVEL <= 2)
	replace _esc = _esc + min(8, CURSO) if (NIVEL == 3)
	replace _esc = _esc + min(4, CURSO) if inlist(NIVEL, 04, 05)
	replace _esc = _esc + min(6, CURSO) if inlist(NIVEL, 06, 14)
	replace _esc = _esc + min(4, CURSO) if inlist(NIVEL, 07, 08)
	replace _esc = _esc + min(5, CURSO) if (NIVEL == 09)
	replace _esc = _esc + min(0, CURSO) if (NIVEL == 10)
	replace _esc = _esc + min(2, CURSO) if (NIVEL == 11)
	replace _esc = _esc + min(5, CURSO) if (NIVEL == 12)
	replace _esc = .a                   if (NIVEL >= 03) & (CURSO == 9)
	* Etiquetado
	label variable _esc "Años de escolaridad"
end
