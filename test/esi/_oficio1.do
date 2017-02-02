*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_oficio1"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/test data/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	format * %50.0g
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	matrix expected = (1, 2, 3, 4, 5, 6, 7, 8, 9, 1e5, 1e5)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
