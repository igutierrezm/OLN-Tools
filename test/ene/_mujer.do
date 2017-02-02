*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "sexo"
local var1 "_mujer"

* BBDD
use `var0' using "$pkg/data/test data/ene/2016/01/`var1'.dta", clear
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
matrix expected = (0, 1)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
