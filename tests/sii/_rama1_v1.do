*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_rama1_v1"

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
  * format * %100.0g
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	matrix blk_1 = (01, 02, 03, 04, 04, 05, 06, 07, 008, 09)
	matrix blk_2 = (10, 11, 13, 12, 12, 12, 12, 13, 1e5)
	matrix expected = (blk_1, blk_2)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
