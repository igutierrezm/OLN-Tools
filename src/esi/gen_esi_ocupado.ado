* ¿Está ocupado?
capture program drop gen_esi_ocupado
program define gen_esi_ocupado, rclass
  version 14.1
  syntax, año(string)
  * Mutación
  local var "_ocupado"
  # delimit ;
    recode CSE_ESPECIFICO
      (1/7    =   1 "Sí")
      (0 8/28 =   0 "No")
      (1e6    = 1e6 "Nacional")
      (else   = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  * Etiquetado
  label variable `var' "¿Está ocupado?"
end
