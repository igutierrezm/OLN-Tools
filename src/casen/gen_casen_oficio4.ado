capture program drop gen_casen_oficio4
program define gen_casen_oficio4, rclass
	version 14.1
	syntax, año(string) [mes(string) from(string)]
	* Objetos temporales
	tempvar temp
	* Mutación
	select_casen, varlist("_oficio4") año(`año')
	generate `temp' = `r(selection)'
	destring `temp', replace
	recode `temp' (9500 9999 = 1e5) (missing = 1e5), generate(_oficio4)
	* Etiquetado (valores)
	lval_casen_oficio4
	label values _oficio4 _oficio4
	label define _oficio4 1e5 "ns/nr" 1e6 "Nacional", add
	* Etiquetado (variables)
	label variable _oficio4 "Grupo primario de ocupación (CIUO 88 - 4 dígitos)"
end
