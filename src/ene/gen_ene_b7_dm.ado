* Indicadores de seguridad social
capture program drop gen_ene_b7_dm
program define gen_ene_b7_dm, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  forvalues v = 1(1)7 {
    generate _b7_dm_`v' = (b7_`v' == 1)
  }
  * Etiquetado
  label variable _b7_dm_1 "¿Le otorgan vacaciones anuales?"
  label variable _b7_dm_2 "¿Le otorgan días pagados por enfermedad?"
  label variable _b7_dm_3 "¿Le otorgan cotización previsional o de pensión?"
  label variable _b7_dm_4 "¿Le otorgan cotización por previsión de salud?"
  label variable _b7_dm_5 "¿Le otorgan cotización por seguro de desempleo?"
  label variable _b7_dm_6 "¿Le otorgan permiso por maternidad o paternidad?"
  label variable _b7_dm_7 "¿Le otorgan servicio de guarderías infantiles?"
end
