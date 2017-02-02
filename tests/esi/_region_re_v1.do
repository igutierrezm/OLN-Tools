*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_re_v1"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año' (muestra completa)}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	matrix expected = (2, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 7, 12, 1)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
