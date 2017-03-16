capture program drop gen_casen_oficio1
program define gen_casen_oficio1
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Objetos temporales
  tempvar temp
  * Mutación
  select_casen, varlist("_oficio1") año(`año')
  generate `temp' = `r(selection)'
  destring `temp', replace
  if (`año' == 2000) replace `temp' = `temp' - 1
  recode `temp' (10 9999 = 1e5) (missing = 1e5), generate(_oficio1)
  * Etiquetado
  # delimit ;
  label define _oficio1
    0  "Fuerzas armadas"
    1  "Miembros del poder ejecutivo y de los cuerpos legislativos y personal directivo"
    2  "Profesionales, científicos e intelectuales"
    3  "Técnicos profesionales de nivel medio"
    4  "Empleados de oficina"
    5  "Trabajadores de los servicios y vendedores de comercios y mercados"
    6  "Agricultores y trabajadores calificados agropecuarios y pesqueros"
    7  "Oficiales, operarios y artesanos de artes mecánicas y de otros oficios"
    8  "Operadores de instalaciones y máquinas y montadores"
    9  "Trabajadores no calificados"
    1e5 "ns/nr";
  # delimit cr
  label values _oficio1 _oficio1
  label variable _oficio1 "Gran grupo de ocupación"
  notes _oficio1 : "CIUO 88 - 1 dígito"
end
