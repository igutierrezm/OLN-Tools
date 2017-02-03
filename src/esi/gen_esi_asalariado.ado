* ¿Es un trabajador asalariado?
capture program drop gen_esi_asalariado
program define gen_esi_asalariado, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  # delimit ;
    recode CISE
      (3/6   =   1 "Sí")
      (0/2 7 =   0 "No")
      (1e6   = 1e6 "Nacional")
      (else  = 1e5 "ns/nr"),
      generate(_asalariado);
  # delimit cr
  * Etiquetado
  label variable _asalariado "¿Es un trabajador asalariado?"
end
