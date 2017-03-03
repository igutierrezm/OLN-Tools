* ¿Es un trabajador asalariado?
capture program drop gen_casen_asalariado
program define gen_casen_asalariado
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_asalariado") año(`año')
  # delimit ;
  recode `r(selection)'
    (1/2 8/9 =   0 "No")
    (3/7     =   1 "Sí")
    (1e6     = 1e6 "Nacional")
    (else    = 1e5 "ns/nr"),
    generate(_asalariado);
  # delimit cr
  * Etiquetado
  label variable _asalariado "¿Es un trabajador asalariado?"
end
