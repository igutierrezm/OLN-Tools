/* capture program drop ol_export
program define ol_export
  syntax

  *===============================================================================
  * Prólogo:
  *===============================================================================

  * Especificación de la consulta (contenidos):
  local stat    = `"`r(stat)'"'
  local filters = `"`r(filters)'"'

  * Especificación de la consulta (formato):
  local rowvar  = `"`r(rowvar)'"'
  local colvars = `"`r(colvars)'"'
  local formats = `"`r(formats)'"'

  * Especificación de la consulta (I-O):
  local source  = `"`r(source)'"'
  local destiny = `"`r(destiny)'"'
  local sheet   = `"`r(sheet)'"'

  * Filtración de la tabla:
  use "`source'", clear
  foreach filter in `filters' {
    `filter'
  }

  * Macros auxiliares:
  local Ncolvars = `: word count of `colvars'' - 1
  foreach var in `colvars' {
    quietly : inspect `var'
    local K`var' = r(N_unique)
  }

  * Identificación Hoja de destino:
  putexcel set "`destiny'", sheet("`sheet'") replace

  *===============================================================================
  * Exportación (contenidos)
  *===============================================================================

  * Encabezados (columnas):
  preserve
  bysort `colvars' : keep if (_n == 1)
  decode2 `colvars' mask, replace
  noisily : list
  local K = _N
  local k = 2
  foreach var in `colvars' mask {
    forvalues i = 1(1)`K' {
      local j = `i' + 1
      local Y : word `j' of `c(ALPHA)'
      putexcel `Y'`k' = `var'[`i']
    }
    local ++k
  }

  * Encabezados (filas):
  restore, preserve
  local --k
  keep `rowvar'
  bysort `rowvar' : keep if (_n == 1)
  export excel using "`destiny'",  ///
  sheet("`sheet'") cell("A`k'") sheetmodify firstrow(varlabels)
  local ++k

  * Cuerpo:
  restore, preserve
  keep `colvars' `rowvar' `stat'
  reshape wide `stat', i(`colvars') j(`rowvar')
  xpose, clear
  drop in 1/`Ncolvars'
  export excel using "`destiny'", sheet("`sheet'") cell("B`k'") sheetmodify

  *===============================================================================
  * Exportación (formato)
  *===============================================================================
  * Macros auxiliares:
  quietly : describe
  local N  = r(N)
  local K  = r(k) + 1
  local Z  : word `K' of `c(ALPHA)'
  local N0 = 2
  local N1 = `k' - 1
  local N2 = `k' - 0
  local N3 = `N1' + `N' - 1
  local N4 = `N2' + `N' - 1

  * Bordes:
  putexcel (A`N0':`Z'`N0'), border("top",    "medium", "black")
  putexcel (A`N2':`Z'`N2'), border("top",      "thin", "black")
  putexcel (A`N3':`Z'`N3'), border("bottom",   "thin", "black")
  putexcel (A`N4':`Z'`N4'), border("bottom", "medium", "black")

  * Unidades de medida:
  forvalues i = 2(1)`K' {
  	local X      : word `i' of `c(ALPHA)'
  	local format : word `i' of `formats'
    if ("`format'" == "d0") local format = "number_sep"
    if ("`format'" == "d1") local format = "0.0"
    if ("`format'" == "d2") local format = "number_sep_d2"
  	putexcel (`X'`N2':`X'`N4'), nformat("`format'")
  }

  * Alineación:
  putexcel (B`N0':`Z'`N1'), hcenter
  putexcel (B`N2':`Z'`N4'), right

  * Fuente:
  putexcel (A`N0':`Z'`N4'), font("Times New Roman", 11)

  * Combinación de celdas:
  local i  = 2
  local Ni = 1
  local Di = `K' - 1
  foreach var in `colvars' {
    local Di = `Di' / `K`var''
    local Ni = `Ni' * `K`var''
    forvalues j = 1(1)`Ni' {
      local j0 = 2 + `Di' * (`j' - 1)
      local j1 = 1 + `Di' * (`j' - 0)
      local A : word `j0' of `c(ALPHA)'
      local B : word `j1' of `c(ALPHA)'
      putexcel (`A'`i':`B'`i'), merge hcenter
    }
    local ++i
  }
end */
