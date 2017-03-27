*! 1.0.3 Iván Gutiérrez 07dec2016
capture program drop select_esi
program define select_esi, rclass
  version 14.1
  syntax, varlist(string) año(string) [mes(string)]

  * Variables relevantes, según año y variable:
  local selection ""
  foreach var in `varlist' {
    local symbol = substr("`var'", 1, 1)
    if ("`symbol'" != "_") {
      local temp "`var'"
    }
    else {
      if ("`var'" == "_asalariado")         local temp "CISE"
      if ("`var'" == "_cise_v1")            local temp "CISE"
      if ("`var'" == "_cise_v2")            local temp "B8 CISE"
      if ("`var'" == "_cise_v3")            local temp "B8 B9 CISE"
      if ("`var'" == "_counter")            local temp ""
      if ("`var'" == "_edad")               local temp "EDAD"
      if ("`var'" == "_educ")               local temp "NIVEL TERMINO_NIVEL"
      if ("`var'" == "_esc")                local temp "NIVEL CURSO"
      if ("`var'" == "_estrato")            local temp "ESTRATO"
      if ("`var'" == "_hr_hab")  {
        if inrange(`año', 2013, 2015)       local temp "HABITUALES"
        if inrange(`año', 2010, 2012)       local temp "HOR_HAB"
      }
      if ("`var'" == "_joven")              local temp "EDAD"
      if ("`var'" == "_jparcial")           local temp "C1"
      if ("`var'" == "_jparcial_inv")       local temp "C1 C10 C11"
      if ("`var'" == "_mantuvo_empleo")     local temp "D1_opcion D5_opcion"
      if ("`var'" == "_mujer")              local temp "SEXO"
      if ("`var'" == "_ocupado")            local temp "CSE_ESPECIFICO"
      if ("`var'" == "_oficio1")            local temp "B1"
      if ("`var'" == "_psu")                local temp "ID_IDENTIFICACION"
      if ("`var'" == "_pweight")            local temp "FACT_PER"
      if ("`var'" == "_rama1_v1")           local temp "B14 E18 CSE_ESPECIFICO"
      if ("`var'" == "_region_re_v1")       local temp "REGION"
      if ("`var'" == "_region_re_v2")       local temp "REGION R_P_C"
      if ("`var'" == "_tamano_empresa") {
          local selection " *"
          continue, break
      }
      if ("`var'" == "_tipo_contrato")      local temp "B8 B9"
      if ("`var'" == "_tramo_edad_v1")      local temp "EDAD"
      if ("`var'" == "_tramo_edad_v2")      local temp "EDAD"
      if ("`var'" == "_superior_completa")  local temp "NIVEL TERMINO_NIVEL"
      if ("`var'" == "_yprincipal_hr")  {
        if inrange(`año', 2013, 2015)       local temp "ING_T_P HABITUALES"
        if inrange(`año', 2010, 2012)       local temp "ING_T_P HOR_HAB"
      }
      if ("`var'" == "_yprincipal")         local temp "ING_T_P"
      if ("`var'" == "_ytrabajo")           local temp "ING_T_T"
    }
    * Anexión:
    local selection "`selection' `temp'"
  }

  * Resultados
  return local selection = "`selection'"
end
