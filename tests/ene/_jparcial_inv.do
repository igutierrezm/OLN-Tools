*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "c1 c10 c11"
local var1 "_jparcial_inv"

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
matrix expected = (0, 0, 0, 0, 0, 1, 0, 0, 0, 0, .a)'
expect_equal, expected("expected") observed("`var1'") id("Test N°1")

*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var0 "c1 c10 c11"
local var1 "_jparcial_inv"

* BBDD
drop _all
input `var0'
			.      .     .
			.      .     1
			.      .     2
			.      1     .
			.      1     1
			.      1     2
			.      2     .
			.      2     1
			.      2     2
			1      .     .
			1      .     1
			1      .     2
			1      1     .
			1      1     1
			1      1     2
			1      2     .
			1      2     1
			1      2     2
			2      .     .
			2      .     1
			2      .     2
			2      1     .
			2      1     1
			2      1     2
			2      2     .
			2      2     1
			2      2     2
end
gen_ene`var1', año("2016") mes("01")
gen nolabel = `var1'

* Visualización
format * %100.0g
label values c1 c1
label values c10 c10
label values c11 c11
noisily : display _newline "{title:Test N°2}"
noisily : list, abbr(50)

* Contrastes
# delimit ;
matrix expected = (
	.a, .a, 0, .a, .a, 0,   0, 0, 0, 0, 0, 0, 0, 0, 0,
	  0,   0, 0, .a, .a, 0, .a, 1, 0, 0, 0, 0
)';
expect_equal, expected("expected") observed("`var1'") id("Test N°2")
