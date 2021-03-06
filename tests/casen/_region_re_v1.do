*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_re_v1"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix blk_1 = (03, 03, 04, 04, 05, 05, 06, 06, 08, 08, 09, 09, 10, 10, 11, 11)
matrix blk_2 = (14, 14, 15, 15, 07, 07)
matrix blk_3 = (02, 03, 04, 05, 06, 08, 09, 10, 11, 13, 14, 15, 07, 12, 01)
forvalues año = 1990(1)2015 {
  if inrange(`año', 1990, 2003) ////
    matrix A = (01, 02, blk_1, 12, 13, blk_2)'
  if inrange(`año', 2006, 2006)  ///
    matrix A = (02, 01, blk_1, 13, 12, blk_2)'
  if inrange(`año', 2009, 2009)  ///
    matrix A = (blk_3, 1e5)'
  if inrange(`año', 2011, 2015)  ///
    matrix A = (blk_3)'
  matrix expected_`año' = A
}

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* BBDD
	capture : use "$pkg/data/tests/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")
	generate nolabel = `var1'

	* Submuestra (solo tomaré dos casos por región)
	local region : word 1 of `var0'
	local comuna : word 2 of `var0'
	bysort `region' : generate id = _n
	bysort `region' : keep if inlist(id, 1, _N)
	drop id

	* Visualización
	format * %100.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("expected_`año'") id(`id') observed("`var1'")
}
