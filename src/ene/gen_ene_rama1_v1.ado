* Rama de actividad ocupados/cesantes (agregación estándar)
capture program drop gen_ene_rama1_v1
program define gen_ene_rama1_v1, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Unión de las ramas de ocupados y cesantes
  tempvar rama1
  generate `rama1' = .
  replace  `rama1' = b14 if inrange(cae_general, 1, 3)
  replace  `rama1' = e18 if inrange(cae_general, 4, 9)
  * Recodificación
  # delimit ;
    recode `rama1'
      (1e6   = 1e6 "Nacional")
      (01    =  01 "Agropecuario-Silvícola")
      (02    =  02 "Pesca")
      (03    =  03 "Minería")
      (04    =  04 "Industria Manufacturera")
      (05    =  05 "Electricidad, Gas y Agua")
      (06    =  06 "Construcción")
      (07    =  07 "Comercio")
      (08    =  08 "Hoteles y Restaurantes")
      (09    =  09 "Transporte y Comunicaciones")
      (10    =  10 "Intermediación Financiera")
      (11    =  11 "Actividades Inmobiliarias, Empresariales y de Alquiler")
      (13/16 =  12 "Servicios Personales")
      (12 17 =  13 "Administración Pública")
      (else  = 1e5 "ns/nr"),
      generate(_rama1_v1);
    # delimit cr
    * Etiquetado
    label variable _rama1_v1 "Rama de actividad económica"
end
 
