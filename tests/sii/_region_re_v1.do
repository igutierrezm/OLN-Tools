*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_re_v1"

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
	matrix blk_1 = (02, 06, 13, 03, 05, 011, 08, 14)
	matrix blk_2 = (01, 04, 09, 15, 12, 1e5, 10, 07)
	matrix expected = (blk_1, blk_2)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
