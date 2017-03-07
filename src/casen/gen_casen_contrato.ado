capture program drop gen_casen_contrato
program define gen_casen_contrato
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_contrato") año(`año')
  # delimit ;
  recode `r(selection)'
    (1    =  1 "Sí")
    (2/3  =  0 "No")
    (else = 1e5 "ns/nr"),
    generate(_contrato);
  # delimit cr
  * Etiquetado
  label variable _contrato "¿Tiene contrato escrito?"
end
