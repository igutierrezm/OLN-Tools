capture program drop gen_casen_ecivil
program define gen_casen_ecivil
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  generate _ecivil = ecivil
  if (`año' == 2015) replace _ecivil = ecivil - 1 if inrange(ecivil, 3, 8)
  recode _ecivil (9 = 1e5)

  * Etiquetado:
  # delimit ;
  label define _ecivil
    1   "casado(a)"
    2   "conviviente o pareja"
    3   "anulado(a)"
    4   "separado(a)"
    5   "divorciado(a)"
    6   "viudo(a)"
    7   "soltero(a)"
    1e5 "sin dato";
  # delimit cr
  label values   _ecivil _ecivil
  label variable _ecivil "Estado civil"
end
