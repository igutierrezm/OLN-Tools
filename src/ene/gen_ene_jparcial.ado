capture program drop gen_ene_jparcial
program define gen_ene_jparcial, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  # delimit ;
    recode c1
      (1    =   0 "Jornada Completa")
      (2    =   1 "Jornada Parcial")
      (else = 1e5 "ns/nr"),
      generate(_jparcial);
  # delimit cr
  * Etiquetado
  label variable _jparcial "Tipo de Jornada"
end
