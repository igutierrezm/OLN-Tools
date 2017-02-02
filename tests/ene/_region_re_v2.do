*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "region r_p_c"
local var1 "_region_re_v2"

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
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
matrix expected = (2, 5, 5, 8, 8, 12, 12, 14, 14, 14, 15, 7, 7, 7, 7)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")

*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var0 "region r_p_c"
local var1 "_region_re_v2"

* BBDD
clear
input region r_p_c
			1      1101
			1      .
			8      8420
			8 		 8103
			8      .
			.      .
end
gen_ene`var1', año("2016") mes("01")
gen nolabel = `var1'

* Visualización
noisily : display _newline "{title:Test N°2}"
noisily : list, abbreviate(100)

* Constrastes
matrix expected = (2, 2, 10, 11, 1e5, 1e5)'
expect_equal, expected("expected") observed("`var1'") id("Test N°2")
