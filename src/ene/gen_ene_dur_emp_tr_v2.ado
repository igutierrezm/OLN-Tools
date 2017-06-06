/* capture program drop gen_ene_dur_emp_tr_v2
program define gen_ene_dur_emp_tr_v2, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_dur_emp_tr_v2"

  * Mutación
  tempvar diff
  generate `diff' = ano_encuesta - b17_ano
  # delimit ;
  recode `diff'
    (0/1     = 1   "5 o menos")
    (6/11    = 2   "Entre 6 y 11")
    (12/59   = 3   "Entre 12 y 59")
    (60/119  = 4   "Entre 60 y 119")
    (120/max = 5   "120 o más")
    (else    = 1e5 "ns/nr"),
    generate(`var');
  # delimit cr

  * Etiquetado
  label variable `var' "Tramo de duración del empleo (en meses)"
end */
