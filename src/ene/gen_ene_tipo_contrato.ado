capture program drop gen_ene_tipo_contrato
program define gen_ene_tipo_contrato, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local var "_tipo_contrato"
  generate `var' = .a
  replace  `var' =  1 if (b8 == 2)
  replace  `var' =  2 if (b8 == 1) & (b9 == 1)
  replace  `var' =  3 if (b8 == 1) & (b9 == 2)
  * Etiquetado
  # delimit ;
    label define `var'
      1  "Sin contrato"
      2  "Contrato definido"
      3  "Contrato indefinido"
      .a "ns/nr";
  # delimit cr
  label values `var' `var'
  label variable `var' "Tipo de contrato"
end
