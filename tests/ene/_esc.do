*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "nivel curso"
local var1 "_esc"

* Base de prueba
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
drop _freq

* Ordenación
order nivel curso `var1'
gsort nivel curso `var1'

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
# delimit ;
matrix expected = (
	00, 00, 00, 00, 00, 01, 02, 03, 04, 05, 06, 07, 08, .a, 08, 09, 10, 11, 12,
	.a, 08, 09, 10, 11, 12, 12, 12, .a, 07, 08, 09, 10, 11, 12, 12, .a, 12, 13,
	14, 15, 16, .a, 12, 13, 14, 15, 16, 16, .a, 12, 13, 14, 15, 16, 17, 17, 17,
	17, .a, 17, 17, 17, .a, 17, 18, 19, .a, 17, 18, 19, 20, 21, 22, .a, 07, 08,
	09, 10, 11, 12, 12, .a, .a
)';
# delimit cr
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
