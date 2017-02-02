* Indicadores de seguridad social
capture program drop gen_ene_b7
program define gen_ene_b7, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  forvalues v = 1(1)7 {
    recode b7_`v'              ///
      (1    =   1 "Sí")        ///
      (2    =   0 "No")        ///
      (1e6  = 1e6 "Nacional")  ///
      (else = 1e5 "ns/nr"),    ///
      generate(_b7_`v')
  }
  * Etiquetado
  label variable _b7_1 "¿Le otorgan vacaciones anuales?"
  label variable _b7_2 "¿Le otorgan días pagados por enfermedad?"
  label variable _b7_3 "¿Le otorgan cotización previsional o de pensión?"
  label variable _b7_4 "¿Le otorgan cotización por previsión de salud?"
  label variable _b7_5 "¿Le otorgan cotización por seguro de desempleo?"
  label variable _b7_6 "¿Le otorgan permiso por maternidad o paternidad?"
  label variable _b7_7 "¿Le otorgan servicio de guarderías infantiles?"
end
