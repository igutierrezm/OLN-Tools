capture program drop gen_pib_mes
program define gen_pib_mes
	version 14.1
	syntax
	* Mutación
  generate _mes = month(fecha)
  * Etiquetado
	# delimit ;
    label define _mes
      01 "dic-feb"
      02 "ene-mar"
      03 "feb-abr"
      04 "mar-may"
      05 "abr-jun"
      06 "may-jul"
      07 "jun-ago"
      08 "jul-sep"
      09 "ago-oct"
      10 "sep-nov"
      11 "oct-dic"
      12 "nov-ene",
      modify;
	# delimit cr
  label values _mes _mes
	label variable _mes "Trimestre"
end
