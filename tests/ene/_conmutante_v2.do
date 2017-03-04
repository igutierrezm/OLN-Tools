*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "region b18_region r_p_c b18_codigo"
local var1 "_conmutante_v2"

* BBDD
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
gen nolabel = `var1'
drop _freq

* Submuestra (aleatoria)
set seed 10
sample 15, count
sort `var0' `var1'

* Visualización
format * %40.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
matrix expected = (1, 0, 0, 0, 0, 0, .a, 1, J(1, 7, 0))'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")

*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var0 "region b18_region r_p_c b18_codigo"
local var1 "_conmutante_v2"

* BBDD
clear
input region r_p_c b18_region b18_codigo
			1      .     1          .
			1      .     2          .
			1      .     .          .
			.      .     2          .
			8 		 8103  8          8111
			8 		 8103  8          8401
			8      8421  8          8421
			8      .     8          8421
			8      .     .          .
			.      .     8          .
end
gen_ene`var1', año("2016") mes("01")
gen nolabel = `var1'

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°2}"
noisily : list, abbr(50)

* Constrastes
matrix expected = (0, 1, .a, .a, 0, 1, 0, .a, .a, .a)'
expect_equal, expected("expected") observed("`var1'") id("Test N°2")
