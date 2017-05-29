capture program drop gen_ene_zona
program define gen_ene_zona, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_zona"
  # delimit ;
  recode tipo
  	(1/2  = 0   "Urbano")
  	(3    = 1   "Rural")
  	(else = 1e5 "ns/nr"),
  	generate(`var');
  # delimit cr
  label variable `var' "Zona"
end
