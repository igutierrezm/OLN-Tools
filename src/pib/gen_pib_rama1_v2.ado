capture program drop gen_pib_rama1_v2
program define gen_pib_rama1_v2, rclass
  version 14.1
  syntax
  * Abreviaciones
  local str "Intermediación Financiera, Actividades Inmobiliarias"
  local str "`str', Empresariales y de Alquiler"
  * Mutación
  # delimit ;
    recode sector
    	(01    = 01  "Agropecuario-Silvícola")
    	(02    = 02  "Pesca")
    	(03    = 03  "Minería")
    	(04    = 04  "Industria Manufacturera")
    	(05    = 05  "Electricidad, Gas y Agua")
    	(06    = 06  "Construcción")
    	(07    = 07  "Comercio, Hoteles y Restaurantes")
    	(08    = 08  "Transporte y Comunicaciones")
    	(09 10 = 09  "`str'")
    	(11    = 10  "Servicios Personales")
    	(12    = 11  "Administración Pública")
    	(13   = 1e6 "Nacional")
      (1e5   = 1e5 "ns/nr")
    	(else  = .),
    	generate(_rama1_v2);
  # delimit cr
  * Etiquetado
  local lvar "Rama de actividad económica (agregación para regiones)"
  label variable _rama1_v2 "`lvar'"
end
