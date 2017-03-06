* ¿Tiene dificultades debido al estado de salud en la realización
* de actividades básicas o instrumentales de la vida diaria?
capture program drop gen_casen_discapacitado
program define gen_casen_discapacitado
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Inputs relevantes
  select_casen, varlist("_discapacitado") año(`año')
	unab selection : `r(selection)'
	* ¿Tiene alguna dificultad?
	local var "_discapacitado"
	generate `var' = 0
	foreach input in `selection' {
    if (`año' == 2015) & ("`input'" == "s34_1j") continue
    if (`año' == 2015) replace `var' = 1 if inrange(`input', 2, 5)
    if (`año' == 2013) replace `var' = 1 if inrange(`input', 1, 2)
		replace `var' = .a if inlist(`input', 9, .) & (`var' != 1)
	}
	* Etiquetado
	label define `var' 1 "Con discapaciadad" 0 "Sin discapacidad" .a "ns/nr"
	label values `var' `var'
  label variable `var' "¿Tiene alguna discapacidad?"
  note `var' : ///
    "¿Tiene dificultades debido al estado de salud en la realización " + ///
    "de actividades básicas o instrumentales de la vida diaria?"
end
