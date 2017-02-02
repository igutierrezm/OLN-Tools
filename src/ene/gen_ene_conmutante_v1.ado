* ¿Es un conmutante? (no distingue a Ñuble del Biobío)
capture program drop gen_ene_conmutante_v1
program define gen_ene_conmutante_v1, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Abreviaciones
  local var "_conmutante_v1"
  * Mutación
  gen_ene_region_tr_v1, año(`año') mes(`mes')
  gen_ene_region_re_v1, año(`año') mes(`mes')
  generate `var' = (_region_re_v1 != _region_tr_v1)
  replace  `var' = 1e5 if (_region_re_v1 == 1e5)
  replace  `var' = 1e5 if (_region_tr_v1 == 1e5)
  * Etiquetado
  # delimit ;
    label define `var'
      0 "No conmutantes"
      1 "Conmutantes"
      1e5 "ns/nr"
      1e6 "nacional";
  # delimit cr
  label values `var' `var'
  label variable `var' "¿Es un conmutante?"
end
