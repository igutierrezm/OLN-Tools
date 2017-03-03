* ¿Tiene dificultades debido al estado de salud en la realización
* de actividades básicas o instrumentales de la vida diaria?
capture program drop gen_casen_discapacitado
program define gen_casen_discapacitado
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_discapacitado") año(`año')
  # delimit ;
    recode `r(selection)'
    	(1/9  =   1 "Sí")
    	(10   =   0 "No")
      (1e6  = 1e6 "Nacional")
    	(else = 1e5 "ns/nr"),
    	generate(_discapacitado);
  # delimit cr
  * Etiquetas
  label variable _discapacitado "¿Tiene alguna discapacidad?"
  note _discapacitado : ///
    "¿Tiene dificultades debido al estado de salud en la realización " + ///
    "de actividades básicas o instrumentales de la vida diaria?"
end
