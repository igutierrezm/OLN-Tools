* Condición de actividad
capture program drop gen_ene_extranjero
program define gen_ene_extranjero
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  # delimit ;
    recode nacionalidad
      (0          =   0 "Chilenos")
      (nonmissing =   1 "Extranjeros")
      (missing    = 1e5 "ns/nr"),
      generate(_extranjero);
  # delimit cr
  * Etiquetado
  label variable _extranjero "¿es un extranjero?"
end
* Última revisión - 26-01-2017
