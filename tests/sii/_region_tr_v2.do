*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_tr_v2"

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

  * Submuestra (solo tomaré dos provincias por región)
  bysort region : generate id = _n
  bysort region : keep if inlist(id, 1, _N)
  bysort region : drop if (id != 1) & (region != "VIII REGION DEL BIO BIO")
  drop id

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
  matrix blk_1 = (02, 06, 14, 03, 05, 012, 08, 15)
	matrix blk_2 = (01, 04, 09, 16, 13, 1e5, 11, 10, 07)
	matrix expected = (blk_1, blk_2)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
