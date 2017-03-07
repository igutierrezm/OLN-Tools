* Rama de actividad económica ocupados/cesantes (agregación para regiones)
capture program drop gen_ene_rama1_v2
program define gen_ene_rama1_v2, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Unión de las ramas de ocupados y cesantes
  tempvar rama1
  generate `rama1' = 1e5
  replace  `rama1' = b14 if inrange(cae_general, 1, 3)
  replace  `rama1' = e18 if inrange(cae_general, 4, 9)
  * Recodificación
  local str "Intermediación Financiera, Actividades Inmobiliarias"
  local str "`str', Empresariales y de Alquiler"
  # delimit ;
    recode `rama1'
      (01    = 01 "Agropecuario-Silvícola")
      (02    = 02 "Pesca")
      (03    = 03 "Minería")
      (04    = 04 "Industria Manufacturera")
      (05    = 05 "Electricidad, Gas y Agua")
      (06    = 06 "Construcción")
      (07/08 = 07 "Comercio, Hoteles y Restaurantes")
      (09    = 08 "Transporte y Comunicaciones")
      (10 11 = 09 "`str'")
      (13/16 = 10 "Servicios Personales")
      (12 17 = 11 "Administración Pública")
      (else  = 1e5 "ns/nr"),
      generate(_rama1_v2);
  # delimit cr
  * Etiquetado
  label variable _rama1_v2 "Rama de actividad económica"
end
