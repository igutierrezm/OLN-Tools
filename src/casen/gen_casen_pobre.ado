capture program drop gen_casen_pobre
program define gen_casen_pobre
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación:
  local output "_pobre"
  select_casen, varlist("`output'") año(`año')
  # delimit ;
  recode `r(selection)'
    (1 2     =   1 "Pobre")
    (0 3     =   0 "No pobre")
  	(missing = 1e5 "ns/nr"),
  	generate(`output');
  # delimit cr
  * Etiquetado:
  label variable `output' "¿Es pobre?"
end
