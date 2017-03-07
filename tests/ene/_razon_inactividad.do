*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "e9"
local var1 "_razon_inactividad"

* Base de prueba
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
gen nolabel = `var1'
drop _freq

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
matrix expected =  ///
  (8, 8, 1, 3, 7, 7, 7, 4, 9, 4, 2, 9, 9, 9, 5, 5, 5, 9, 9, 9, 6, 1e5)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
