capture program drop gen_ene_dur_emp_tr
program define gen_ene_dur_emp_tr, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_dur_emp_tr"

  * Programas auxiliares
  capture confirm variable _dur_emp
  if (_rc == 111) gen_ene_dur_emp, año(`año') mes(`mes')

  * Mutación
  egen `var' = cut(_dur_emp), at(0, 1, 5, 10, 100)
  replace `var' = 1e5 if (_dur_emp == .)

  * Etiquetado
  # delimit ;
  label define `var'
    0   "[0, 1)"
    1   "[1, 5)"
    5   "[5, 10)"
    10  "[10, ∞)"
    1e5 "ns/nr";
  # delimit cr
  label variable `var' "Tramo de duración del empleo (en años)"
  label values `var' `var'
end
