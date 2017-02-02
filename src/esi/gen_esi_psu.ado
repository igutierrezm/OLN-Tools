capture program drop gen_esi_psu
program define gen_esi_psu, rclass
  version 14.1
  syntax, año(string)
  * Objetos temporales
  tempfile df_esi
  save `df_esi', replace
  * Identificación de la ENE asociada a la ESI utilizada
  local df_ene "$datos/ENE/ENE `año' 11"
  * Identificación del psu asociado a cada vivienda
  use id* using "`df_ene'", clear
  rename id_identificacion ID_IDENTIFICACION
  duplicates drop ID_IDENTIFICACION, force
  * Anexión del psu al a la base original
  merge 1:m ID_IDENTIFICACION using `df_esi', nogenerate
  rename id_directorio _psu
  drop ID_IDENTIFICACION
  * Etiquetado
  label variable _psu "Unidad primaria de muestreo"
end
