*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_tr_v2"

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

  * Submuestra (solo tomaré dos por región)
  generate B18_REGION = floor(B18_CODIGO / 1000)
  bysort B18_REGION : generate id = _n
	bysort B18_REGION : keep if inlist(id, 1, _N)
	drop B18_REGION id

	* Visualización
  noisily : display _newline "{title:Test N°1 - `año' (sub-muestra)}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
  matrix blk_1 = (03, 03, 04, 04, 05, 05, 06, 06, 08, 08, 09, 09, 11, 10)
  matrix blk_2 = (12, 12, 14, 14, 15, 15, 16, 16, 07, 07, 13, 13, 01, 01)
  matrix expected = (02, 02, blk_1, blk_2, 1e5)'
	expect_equal, expected("expected") observed("`var1'") id("`id'")
}
