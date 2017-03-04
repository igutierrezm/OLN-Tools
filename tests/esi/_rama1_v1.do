*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_rama1_v1"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	keep if inrange(CSE_ESPECIFICO, 1, 7)
	gen_esi`var1', año("`año'")
	contract B14 `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list B14 `var1'

	* Contrastes
	local id "Test N°1 - `año'"
	matrix exp = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, J(1, 4, 12), 13)'
	expect_equal, expected("exp") observed("`var1'") id("`id'")
}

*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var1 "_rama1_v1"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	keep if inrange(CSE_ESPECIFICO, 8, 28) | (CSE_ESPECIFICO == 0)
	gen_esi`var1', año("`año'")
	contract E18 `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	noisily : display _newline "{title:Test N°2 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list E18 `var1'

	* Contrastes
	local id "Test N°1 - `año'"
	matrix exp = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, J(1, 4, 12), 13, .a)'
	expect_equal, expected("exp") observed("`var1'") id("`id'")
}
