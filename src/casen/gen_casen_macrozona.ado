capture program drop gen_casen_macrozona
program define gen_casen_macrozona
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  select_casen, varlist("_macrozona") año(`año')
  # delimit ;
  recode `r(selection)'
  	(1/4  15 = 1 "Norte")
    (5/7  13 = 2 "Centro")
    (8/12 14 = 3 "Sur")
    (else = 1e5 "ns/nr"),
  	generate(_macrozona);
  # delimit cr
  * Etiquetado:
  label variable _macrozona "Macrozona"
end
