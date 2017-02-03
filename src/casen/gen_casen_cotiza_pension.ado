capture program drop gen_casen_cotiza_pension
program define gen_casen_cotiza_pension, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_cotiza_pension") año(`año')
  local afiliado  : word 1 of `r(selection)'
  local cotizante : word 2 of `r(selection)'
  # delimit ;
  recode `cotizante'
    (1e6  = 1e6 "Nacional")
    (7    =   0 "No")
    (1/6  =   1 "Sí")
  	(else = 1e5 "ns/nr"),
    generate(_cotiza_pension);
  # delimit cr
  replace _cotiza_pension =   0 if (`afiliado' == 2)
  replace _cotiza_pension = 1e5 if (`afiliado' == 9)
  * Etiquetado
  label variable _cotiza_pension "¿Cotiza en el sistema de pensiones?"
end
