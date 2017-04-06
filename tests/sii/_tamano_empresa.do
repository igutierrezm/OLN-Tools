*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_tamano_empresa"

forvalues año = 2012(1)2015 {
	* Variables relevantes
	select_sii, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/sii/`año'/`var1'.dta", clear
	gen_sii`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	matrix expected = (4, 3, 1, 2)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
