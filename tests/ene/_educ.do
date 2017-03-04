*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "nivel termino_nivel"
local var1 "_educ"

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
matrix block1 = (1, 1, 1, 1, 1, 1, 1, 2, 1, 3, 2, 3, 2, 003, 002, 4)
matrix block2 = (3, 4, 3, 5, 3, 6, 5, 6, 5, 6, 5, 3, 2, .a, .a)
matrix expected = (block1, block2)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
