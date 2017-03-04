*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "b15_1 b15_2 categoria_ocupacion"
local var1 "_tamaño_empresa"

* BBDD
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
matrix n = (01, 2, 1, 2, 3, 4, .a)
matrix i = (45, 5, 5, 5, 4, 4, 003)
matrix expected = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected = (expected \ J(i[1, `k'], 1, n[1, `k']))
}
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
