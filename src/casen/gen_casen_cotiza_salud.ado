capture program drop gen_casen_cotiza_salud
program define gen_casen_cotiza_salud, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_cotiza_salud") año(`año')
  # delimit ;
  recode `r(selection)'
    (1e6   = 1e6 "Nacional")
    (1/7 9 =   1 "Sí")
    (8     =   0 "No")
    (else  = 1e5 "ns/nr"),
    generate(_cotiza_salud);
  # delimit cr
  * Etiquetado
  label variable _cotiza_salud "¿Pertenece a algún sistema de salud?"
end
