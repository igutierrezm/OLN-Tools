*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "region b18_region"
local var1 "_conmutante_v1"

* Base de prueba
use `var0' using "$pkg/data/test data/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
gen nolabel = `var1'
drop _freq

* Sub-muestra
set seed 10
sample 15, count
sort `var0' `var1'

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
matrix expected = (1e5, J(1, 9, 1), 0, J(1, 3, 1), 1e5)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
