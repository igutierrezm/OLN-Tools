capture program drop gen_ene_psu
program define gen_ene_psu, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  generate long _psu = id_directorio
  * Etiquetado
  label variable _psu "Unidad primaria de muestreo"
end
