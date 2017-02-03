* Diccionario de variables
capture program drop ol_dictionary
program define ol_dictionary
  version 14.1
  syntax, varlist(string) db(string)
  * Título de la tabla
  display ""
  display as text %20s "variable " "{c |}"  " descripción"
	display as text "{hline 20}{c +}{hline}"

  * Cuerpo de la tabla
  local N = `: word count of `varlist'' - 1
  * Descripciones 
	if ("`db'" == "casen") {
		foreach var in `varlist' {
			* Identificación de la descripción
			if ("`var'" == "_alfabetizado")   local str "¿está alfabetizado?"
			if ("`var'" == "_asalariado")     local str "¿es un asalariado?"
			if ("`var'" == "_asiste_escuela") local str "¿asiste a la escuela?"
			if ("`var'" == "_boleta")         local str "¿da boleta?"
			if ("`var'" == "_capacitado")     local str "¿está siendo capacitado?"
			if ("`var'" == "_cise_v1")        local str "categoría ocupacional"
			if ("`var'" == "_cotiza_pension") local str "¿cotiza en el sistema de pensiones?"
			if ("`var'" == "_cotiza_salud")   local str "¿cotiza en el sistema de salud?"
			if ("`var'" == "_counter")        local str "=1"
			if ("`var'" == "_edad")           local str "edad"
			if ("`var'" == "_educ")           local str "nivel educacional"
			if ("`var'" == "_esc")            local str "años de escolaridad"
			if ("`var'" == "_estrato")        local str "estrato"
			if ("`var'" == "_hr_hab")         local str "hrs. hab. trabajadas por semana"
			if ("`var'" == "_indigena")       local str "¿desciende de algún pueblo indígena?"
			if ("`var'" == "_inmigrante")     local str "¿es un inmigrante?"
			if ("`var'" == "_joven")          local str "¿es joven?"
			if ("`var'" == "_media_completa") local str "¿completó la enseñanza media?"
			if ("`var'" == "_mujer")          local str "¿es mujer?"
			if ("`var'" == "_ocupado")        local str "¿está ocupado?"
			if ("`var'" == "_oficio1")        local str "ocupación (1 dígito CIUO 88)"
			if ("`var'" == "_oficio4")        local str "ocupación (4 dígitos CIUO 88)"
			if ("`var'" == "_psu")            local str "psu"
			if ("`var'" == "_pweight")        local str "factor de enpansión"
			if ("`var'" == "_rama1_v1")       local str "rama de actividad (1 dígitos CIIU rev-3)"
			if ("`var'" == "_region_re_v1")   local str "región de residencia (no distingue a Ñuble de Bío-Bío)"
			if ("`var'" == "_tramo_edad_v1")  local str "tramo de edad (con énfasis en la PET)"
			if ("`var'" == "_tramo_edad_v2")  local str "tramo de edad (con énfasis en los menores de edad)"
			if ("`var'" == "_yprincipal_hr")  local str "ingreso por hr. hab. trabajada en la ocupación principal (M$/hr)"
			if ("`var'" == "_yprincipal")     local str "ingreso de la ocupación principal (M$)"
			if ("`var'" == "_ytrabajo")       local str "ingreso del trabajo (M$)"
      if ("`db'" == "ene") {
    		foreach var in `varlist' {
    			* Identificación de la descripción
          if ("`var'" == "_activ")          local str "situación de actividad (ocupado, desocupado, inactivo)"
          if ("`var'" == "_asalariado")     local str "¿es un trabajador asalariado?"
          if ("`var'" == "_b7")             local str "indicadores de seguridad social"
          if ("`var'" == "_cesante")        local str "¿se encuentra cesante?"
          if ("`var'" == "_cise_v1")        local str "categoría ocupacional (agregación estándar)"
          if ("`var'" == "_cise_v2")        local str "categoría ocupacional (distingue entre asalariados con y sin contrato)"
          if ("`var'" == "_cise_v3")        local str "categoría ocupacional (distirngue el tipo de contrato de los asalariados)"
          if ("`var'" == "_conmutante_v1")  local str "¿es un conmutante (no distingue entre Ñuble y Bío-Bío)?"
          if ("`var'" == "_conmutante_v2")  local str "¿es un conmutante (sí distingue entre Ñuble y Bío-Bío)?"
          if ("`var'" == "_counter")        local str "=1"
          if ("`var'" == "_desocupado")     local str "¿se encuentra desocupado?"
          if ("`var'" == "_edad")           local str "edad"
          if ("`var'" == "_educ")           local str "nivel educacional"
          if ("`var'" == "_esc")            local str "años de escolaridad"
          if ("`var'" == "_estrato")        local str "estrato"
          if ("`var'" == "_exceso_hr_chl")  local str "¿trabaja hab. más de 45 hrs. a la semana?"
          if ("`var'" == "_exceso_hr_int")  local str "¿trabaja hab. más de 48 hrs. a la semana?"
          if ("`var'" == "_hr_hab")         local str "hrs. hab. trabajadas por semana"
          if ("`var'" == "_jparcial_inv")   local str "¿es un trabajador con jornada parcial involuntaria?"
          if ("`var'" == "_jparcial")       local str "¿es un trabajador con jornada parcial?"
          if ("`var'" == "_mujer")          local str "¿es mujer?"
          if ("`var'" == "_ocupado")        local str "¿se encuentra ocupado?"
          if ("`var'" == "_oficio1")        local str "ocupación (1 dígito CIUO-88)"
          if ("`var'" == "_pea")            local str "¿pertenece a la pea?"
          if ("`var'" == "_pet")            local str "¿pertenece a la pet?"
          if ("`var'" == "_psu")            local str "psu"
          if ("`var'" == "_pweight")        local str "factor de expansión"
          if ("`var'" == "_rama1_v1")       local str "rama de actividad del último trabajo (agregación estándar)"
          if ("`var'" == "_rama1_v2")       local str "rama de actividad del último trabajo (homologación con series del PIB regional sectorial)"
          if ("`var'" == "_region_re_v1")   local str "región de residencia (no distingue a Ñuble de Bío-Bío)"
          if ("`var'" == "_region_re_v2")   local str "región de residencia (sí distingue a Ñuble de Bío-Bío)"
          if ("`var'" == "_region_tr_v1")   local str "región de trabajo (no distingue a Ñuble de Bío-Bío)"
          if ("`var'" == "_region_tr_v2")   local str "región de trabajo (sí distingue a Ñuble de Bío-Bío)"
          if ("`var'" == "_tamaño_empresa") local str "tamaño de empresa (según n. de trabajadores)"
          if ("`var'" == "_tipo_contrato")  local str "tipo de contrato"
          if ("`var'" == "_tramo_edad_v1")  local str "tramo de edad (con énfasis en la pet)"
          if ("`var'" == "_tramo_edad_v2")  local str "tramo de edad (con énfasis en los menores de edad)"
    		}
    	}
      * Impresión de la descripción
			display as text %20s "`var' " "{c |}" " `str'"
		}
  }
end

ol_dictionary, varlist("_yprincipal _ytrabajo") db("casen")
