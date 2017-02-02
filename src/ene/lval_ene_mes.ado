capture program drop lval_ene_mes
program define lval_ene_mes
	version 14.1
	syntax
  * Etiquetado
	# delimit ;
    label define mes
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
  label values mes mes
	label variable mes "Trimestre"
end
