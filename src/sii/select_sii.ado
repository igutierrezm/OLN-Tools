*! 1.0.3 Iván Gutiérrez 07dec2016
capture program drop select_sii
program define select_sii, rclass
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
      if ("`var'" == "_rama1_v1")        local temp "rubro"
      if ("`var'" == "_region_re_v1")    local temp "region"
      if ("`var'" == "_region_re_v2")    local temp "region provincia"
      if ("`var'" == "_region_tr_v1")    local temp "region"
      if ("`var'" == "_region_tr_v2")    local temp "region provincia"
      if ("`var'" == "_tamano_empresa")  local temp "tramotrabajadores"
    }
    * Anexión:
    local selection "`selection' `temp'"
  }

  * Resultados
  return local selection = "`selection'"
end
