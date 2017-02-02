* Genera pesos de replicación (vía bootstrap)
capture program drop bsrweights
program define bsrweights
  version 14.1
  syntax, nreps(string) seed(string) src(string) año(string) mes(string)
  * Objetos temporales
  tempvar i nh rh mjh

  * Identificación de la base relevante
  local mes = string(`mes', "%02.0f")
  if ("`src'" == "casen") local df "$datos/CASEN/CASEN `año'"
  if ("`src'" == "ene")   local df "$datos/ENE/ENE `año' `mes'"
  if ("`src'" == "esi")   local df "$datos/ESI/ESI `año' Personas"

  * Selección
  local varlist "_estrato _psu _pweight"
  select_`src', varlist("`varlist'") año(`año') mes(`mes')
  use `r(selection)' using "`df'", clear

  * Mutación
  generate _bsrw_id = _n
  foreach var in `varlist' {
    capture confirm variable `var'
    if (_rc == 0) continue
    if ("`src'" == "ene") gen_`src'`var', año(`año') mes(`mes')
    if ("`src'" != "ene") gen_`src'`var', año(`año')
  }

  * Colapso de estrato (solo para ENE y ESI)
  if inlist("`src'", "ene", "esi") {
    recode _estrato (5189 = 5159) (13422 = 13379)
  }

  * Deducción del n. de clusters dentro de cada pseudo-estrato
  bysort _estrato _psu : generate `i' = (_n == 1)
  bysort _estrato      : egen    `nh' = total(`i')
  bysort _estrato      : gen     `rh' = `nh' - 1

  * Cálculo de los pesos de replicación
  set seed `seed'
  generate `mjh' = .
  forvalues r = 1(1)`nreps' {
    bsample `rh', strata(_estrato) cluster(_psu) weight(`mjh')
    generate _pweight_`r' = _pweight * `nh' * `mjh' / `rh'
    label var _pweight_`r' "factor de expansión replicado (vía boostrap)"
  }

  * Limpieza
  keep _bsrw_id _pweight_*
  sort _bsrw_id

  * Etiquetado
  label variable _bsrw_id "ID (exactamente el n. de fila en la BBDD original)"
  forvalues r = 1(1)`nreps' {
    label variable _pweight_`r' "factor de expansión replicado (vía boostrap)"
  }
end
