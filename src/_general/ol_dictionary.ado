capture program drop ol_dictionary
program define ol_dictionary
  version 14.1
  syntax, db(string)
  * Despacho
  ol_dictionary_`db'
end

* Diccionario de variables - casen
capture program drop ol_dictionary_casen
program define ol_dictionary_casen
  version 14.1
  syntax

  * Título de la tabla
  display ""
  display as text %20s "variable" " {c |}"  " descripción"
	display as text "{hline 21}{ c +}{hline}"

  * Cuerpo de la tabla
  display as text %20s   "_alfabetizado"     " {c |} "   "¿está alfabetizado?"
  display as text %20s   "_asalariado"       " {c |} "   "¿es un asalariado?"
  display as text %20s   "_asiste_escuela"   " {c |} "   "¿asiste a la escuela?"
  display as text %20s   "_boleta"           " {c |} "   "¿da boleta?"
  display as text %20s   "_capacitado"       " {c |} "   "¿está siendo capacitado?"
  display as text %20s   "_cise_v1"          " {c |} "   "categoría ocupacional"
  display as text %20s   "_cotiza_pension"   " {c |} "   "¿cotiza en el sistema de pensiones?"
  display as text %20s   "_cotiza_salud"     " {c |} "   "¿cotiza en el sistema de salud?"
  display as text %20s   "_counter"          " {c |} "   "=1"
  display as text %20s   "_edad"             " {c |} "   "edad"
  display as text %20s   "_educ"             " {c |} "   "nivel educacional"
  display as text %20s   "_esc"              " {c |} "   "años de escolaridad"
  display as text %20s   "_estrato"          " {c |} "   "estrato"
  display as text %20s   "_hr_hab"           " {c |} "   "hrs. hab. trabajadas por semana"
  display as text %20s   "_indigena"         " {c |} "   "¿desciende de algún pueblo indígena?"
  display as text %20s   "_inmigrante"       " {c |} "   "¿es un inmigrante?"
  display as text %20s   "_joven"            " {c |} "   "¿tiene 29 años o menos?"
  display as text %20s   "_media_completa"   " {c |} "   "¿completó la enseñanza media?"
  display as text %20s   "_mujer"            " {c |} "   "¿es mujer?"
  display as text %20s   "_ocupado"          " {c |} "   "¿está ocupado?"
  display as text %20s   "_oficio1"          " {c |} "   "ocupación (1 dígito CIUO 88)"
  display as text %20s   "_oficio4"          " {c |} "   "ocupación (4 dígitos CIUO 88)"
  display as text %20s   "_psu"              " {c |} "   "psu"
  display as text %20s   "_pweight"          " {c |} "   "factor de enpansión"
  display as text %20s   "_rama1_v1"         " {c |} "   "rama de actividad (1 dígitos CIIU rev-3)"
  display as text %20s   "_region_re_v1"     " {c |} "   "región de residencia (no distingue a Ñuble de Bío-Bío)"
  display as text %20s   "_tramo_edad_v1"    " {c |} "   "tramo de edad (con énfasis en la PET)"
  display as text %20s   "_tramo_edad_v2"    " {c |} "   "tramo de edad (con énfasis en los menores de edad)"
  display as text %20s   "_yprincipal_hr"    " {c |} "   "ingreso por hr. hab. trabajada en la ocupación principal (M$/hr)"
  display as text %20s   "_yprincipal"       " {c |} "   "ingreso de la ocupación principal (M$)"
  display as text %20s   "_ytrabajo"         " {c |} "   "ingreso del trabajo (M$)"
end

* Diccionario de variables - casen
capture program drop ol_dictionary_ene
program define ol_dictionary_ene
  version 14.1
  syntax

  * Título de la tabla
  display ""
  display as text %20s "variable" " {c |}"  " descripción"
	display as text "{hline 21}{ c +}{hline}"

  * Cuerpo de la tabla
  display as text %20s   "_activ"            " {c |} "    "situación de actividad (ocupado, desocupado, inactivo)"
  display as text %20s   "_asalariado"       " {c |} "    "¿es un trabajador asalariado?"
  display as text %20s   "_b7"               " {c |} "    "indicadores de seguridad social"
  display as text %20s   "_cesante"          " {c |} "    "¿se encuentra cesante?"
  display as text %20s   "_cise_v1"          " {c |} "    "categoría ocupacional (agregación estándar)"
  display as text %20s   "_cise_v2"          " {c |} "    "categoría ocupacional (distingue entre asalariados con y sin contrato)"
  display as text %20s   "_cise_v3"          " {c |} "    "categoría ocupacional (distirngue el tipo de contrato de los asalariados)"
  display as text %20s   "_conmutante_v1"    " {c |} "    "¿es un conmutante (no distingue entre Ñuble y Bío-Bío)?"
  display as text %20s   "_conmutante_v2"    " {c |} "    "¿es un conmutante (sí distingue entre Ñuble y Bío-Bío)?"
  display as text %20s   "_counter"          " {c |} "    "=1"
  display as text %20s   "_desocupado"       " {c |} "    "¿se encuentra desocupado?"
  display as text %20s   "_edad"             " {c |} "    "edad"
  display as text %20s   "_educ"             " {c |} "    "nivel educacional"
  display as text %20s   "_esc"              " {c |} "    "años de escolaridad"
  display as text %20s   "_estrato"          " {c |} "    "estrato"
  display as text %20s   "_exceso_hr_chl"    " {c |} "    "¿trabaja hab. más de 45 hrs. a la semana?"
  display as text %20s   "_exceso_hr_int"    " {c |} "    "¿trabaja hab. más de 48 hrs. a la semana?"
  display as text %20s   "_hr_hab"           " {c |} "    "hrs. hab. trabajadas a la semana"
  display as text %20s   "_jparcial_inv"     " {c |} "    "¿es un trabajador con jornada parcial involuntaria?"
  display as text %20s   "_jparcial"         " {c |} "    "¿es un trabajador con jornada parcial?"
  display as text %20s   "_mujer"            " {c |} "    "¿es mujer?"
  display as text %20s   "_ocupado"          " {c |} "    "¿se encuentra ocupado?"
  display as text %20s   "_oficio1"          " {c |} "    "ocupación (1 dígito CIUO-88)"
  display as text %20s   "_pea"              " {c |} "    "¿pertenece a la pea?"
  display as text %20s   "_pet"              " {c |} "    "¿pertenece a la pet?"
  display as text %20s   "_psu"              " {c |} "    "psu"
  display as text %20s   "_pweight"          " {c |} "    "factor de expansión"
  display as text %20s   "_rama1_v1"         " {c |} "    "rama de actividad del último trabajo (agregación estándar)"
  display as text %20s   "_rama1_v2"         " {c |} "    "rama de actividad del último trabajo (homologación con series del PIB regional sectorial)"
  display as text %20s   "_region_re_v1"     " {c |} "    "región de residencia (no distingue a Ñuble de Bío-Bío)"
  display as text %20s   "_region_re_v2"     " {c |} "    "región de residencia (sí distingue a Ñuble de Bío-Bío)"
  display as text %20s   "_region_tr_v1"     " {c |} "    "región de trabajo (no distingue a Ñuble de Bío-Bío)"
  display as text %20s   "_region_tr_v2"     " {c |} "    "región de trabajo (sí distingue a Ñuble de Bío-Bío)"
  display as text %20s   "_tamaño_empresa"   " {c |} "    "tamaño de empresa (según n. de trabajadores)"
  display as text %20s   "_tipo_contrato"    " {c |} "    "tipo de contrato"
  display as text %20s   "_tramo_edad_v1"    " {c |} "    "tramo de edad (con énfasis en la pet)"
  display as text %20s   "_tramo_edad_v2"    " {c |} "    "tramo de edad (con énfasis en los menores de edad)"
end

* Diccionario de variables - esi
capture program drop ol_dictionary_esi
program define ol_dictionary_esi
  version 14.1
  syntax

  * Título de la tabla
  display ""
  display as text %20s "variable" " {c |}"  " descripción"
	display as text "{hline 21}{ c +}{hline}"

  * Cuerpo de la tabla
  display as text %20s   "_asalariado"       " {c |} "   "¿es un asalariado?"
  display as text %20s   "_cise_v1"          " {c |} "   "categoría ocupacional"
  display as text %20s   "_cise_v3"          " {c |} "   "categoría ocupacional (distingue el tipo de contrato de los asalariados)"
  display as text %20s   "_counter"          " {c |} "   "=1"
  display as text %20s   "_educ"             " {c |} "   "nivel educacional"
  display as text %20s   "_estrato"          " {c |} "   "estrato"
  display as text %20s   "_hr_hab"           " {c |} "   "hrs. hab. trabajadas a la semana"
  display as text %20s   "_joven"            " {c |} "   "¿tiene 29 años o menos?"
  display as text %20s   "_jparcial_inv"     " {c |} "   "¿es un trabajador con jornada parcial involuntaria?"
  display as text %20s   "_jparcial"         " {c |} "   "¿es un trabajador con jornada parcial?"
  display as text %20s   "_mantuvo_empleo"   " {c |} "   "¿mantuvo el empleo del mes anterior?"
  display as text %20s   "_mujer"            " {c |} "   "¿es mujer?"
  display as text %20s   "_ocupado"          " {c |} "   "¿se encuentra ocupado?"
  display as text %20s   "_oficio1"          " {c |} "   "ocupación (CIUO 1-dígito)"
  display as text %20s   "_psu"              " {c |} "   "psu"
  display as text %20s   "_pweight"          " {c |} "   "factor de expansión"
  display as text %20s   "_rama1_v1"         " {c |} "   "rama de actividad (ciiu rev 3)"
  display as text %20s   "_region_re_v1"     " {c |} "   "región de residencia (no distingue Ñuble de Bío-Bío)"
  display as text %20s   "_region_re_v2"     " {c |} "   "región de residencia (sí distingue Ñuble de Bío-Bío)"
  display as text %20s   "_tamaño_empresa"   " {c |} "   "tamaño de empresa (según n. de trabajadores)"
  display as text %20s   "_tipo_contrato"    " {c |} "   "tipo de contrato"
  display as text %20s   "_tramo_edad_v1"    " {c |} "   "tramo de edad (con énfasis en la pet)"
  display as text %20s   "_tramo_edad_v2"    " {c |} "   "tramo de edad (con énfasis en los menores de edad)"
  display as text %20s   "_yprincipal"       " {c |} "   "ingreso de la ocupación principal (M$)"
  display as text %20s   "_ytrabajo"         " {c |} "   "ingreso del trabajo (M$)"
end

cls
noisily : ol_dictionary, db("casen")
noisily : ol_dictionary, db("ene")
noisily : ol_dictionary, db("esi")
