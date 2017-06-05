capture program drop select_ene
program define select_ene, rclass
  version 14.1
  syntax, varlist(string) año(string) mes(string)

  * Variables relevantes, según año y variable
  local cae  "cae_general"
  local cat  "categoria_ocupacion"
  local b18r "b18_region"
  local b18c "b18_codigo"
  local selection ""
  foreach var in `varlist' {
    local symbol = substr("`var'", 1, 1)
    if ("`symbol'" != "_") {
      local temp "`var'"
    }
    else {
      if ("`var'" == "_activ")             local temp "`cae'"
      if ("`var'" == "_asalariado")        local temp "`cat'"
      if ("`var'" == "_b7_dm")             local temp "b7_*"
      if ("`var'" == "_b7")                local temp "b7_*"
      if ("`var'" == "_cesante")           local temp "`cae'"
      if ("`var'" == "_cise_v1")           local temp "`cat'"
      if ("`var'" == "_cise_v2")           local temp "`cat' b8"
      if ("`var'" == "_cise_v3")           local temp "`cat' b8 b9"
      if ("`var'" == "_conmutante_v1")     local temp "region `b18r'"
      if ("`var'" == "_conmutante_v2")     local temp "region `b18r' r_p_c `b18c'"
      if ("`var'" == "_counter")           local temp ""
      if ("`var'" == "_desocupado")        local temp "`cae'"
      if ("`var'" == "_dur_emp")           local temp "b17_mes b17_ano"
      if ("`var'" == "_dur_emp_tr")        local temp "b17_mes b17_ano"
      if ("`var'" == "_edad")              local temp "edad"
      if ("`var'" == "_educ")              local temp "nivel termino_nivel"
      if ("`var'" == "_educ_v2")           local temp "nivel termino_nivel"
      if ("`var'" == "_empleo_precario")   local temp "b8 b9 b10"
      if ("`var'" == "_esc")               local temp "nivel curso"
      if ("`var'" == "_estrato")           local temp "estrato"
      if ("`var'" == "_exceso_hr_int")     local temp "habituales"
      if ("`var'" == "_exceso_hr_chl")     local temp "habituales"
      if ("`var'" == "_extranjero")        local temp "nacionalidad"
      if ("`var'" == "_hr_hab")            local temp "habituales"
      if ("`var'" == "_inactivo")          local temp "`cae'"
      if ("`var'" == "_joven")             local temp "edad"
      if ("`var'" == "_jparcial")          local temp "c1"
      if ("`var'" == "_jparcial_inv")      local temp "c1 c10 c11"
      if ("`var'" == "_mujer")             local temp "sexo"
      if ("`var'" == "_mujer_dm")          local temp "sexo"
      if ("`var'" == "_ocupado")           local temp "`cae'"
      if ("`var'" == "_oficio1")           local temp "b1"
      if ("`var'" == "_pea")               local temp "`cae'"
      if ("`var'" == "_pet")               local temp "`cae'"
      if ("`var'" == "_psu")               local temp "id_directorio"
      if ("`var'" == "_pweight")           local temp "fact"
      if ("`var'" == "_rama1_v1")          local temp "b14 e18 `cae'"
      if ("`var'" == "_rama1_v2")          local temp "b14 e18 `cae'"
      if ("`var'" == "_razon_inactividad") local temp "e9"
      if ("`var'" == "_region_re_v1")      local temp "region"
      if ("`var'" == "_region_re_v2")      local temp "region r_p_c"
      if ("`var'" == "_region_tr_v1")      local temp "b18_region"
      if ("`var'" == "_region_tr_v2")      local temp "b18_region b18_codigo"
      if ("`var'" == "_sup_completa")      local temp "nivel termino_nivel"
      if ("`var'" == "_sup_completa_dm")   local temp "nivel termino_nivel"
      if ("`var'" == "_tamano_empresa")    local temp "b15_1 b15_2 `cat'"
      if ("`var'" == "_tipo_contrato")     local temp "b8 b9"
      if ("`var'" == "_tramo_edad_v1")     local temp "edad"
      if ("`var'" == "_tramo_edad_v2")     local temp "edad"
      if ("`var'" == "_tramo_edad_v3")     local temp "edad"
      if ("`var'" == "_zona")              local temp "tipo"
    }
    * Anexión
    local selection "`selection' `temp'"
  }

  * Resultados
  return local selection = "`selection'"
end
