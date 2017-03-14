* ¿Tiene alguna discapacidad?
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
	foreach x in `selection' {
    * ¿Dudas sobre regex? Visite http://bit.ly/2mp7cG3
    if regexm("`x'", "s34_1j")    continue
    if regexm("`x'", "s3[2 4].*") replace `var' = 1 if inrange(`x', 2, 5)
    if regexm("`x'", "s36.")      replace `var' = 1 if inrange(`x', 1, 2)
    if regexm("`x'", "s37.")      replace `var' = 1 if inrange(`x', 1, 1)
    if regexm("`x'", "s38.")      replace `var' = 1 if inrange(`x', 1, 3)
		replace `var' = 1e5 if inlist(`x', 9, .) & (`var' != 1)
	}

	* Etiquetas
	label define `var'       ///
    1 "Con discapaciadad"  ///
    0 "Sin discapacidad"   ///
    1e5 "ns/nr"
	label values `var' `var'
  label variable `var' "¿Tiene alguna discapacidad?"

  *Notas
  note `var' :                                                            ///
    "¿Tiene dificultades debido al estado de salud en la realización " +  ///
    "de actividades básicas o instrumentales de la vida diaria?"
end
