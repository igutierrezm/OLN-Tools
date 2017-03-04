* Condición de actividad
capture program drop gen_ene_activ
program define gen_ene_activ
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  # delimit ;
    recode cae_general
      (0    =  0 "Menores de 15 años")
      (1/3  =  1 "Ocupados")
      (4/5  =  2 "Desocupados")
      (6/9  =  3 "Inactivos")
      (else = .a "ns/nr"),
      generate(_activ);
  # delimit cr
  * Etiquetado
  label variable _activ "Condición de actividad"
end
* Última revisión - 26-01-2017
