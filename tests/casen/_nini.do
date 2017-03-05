*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_nini"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected_2000 = (0, 0, 1, J(1, 07, 0))'
matrix expected_2003 = (0, 0, 1, J(1, 07, 0))'
matrix expected_2006 = (0, 0, 1, J(1, 11, 0))'
matrix expected_2009 = (0, 0, 1, J(1, 11, 0), .a)'
matrix expected_2011 = (0, 0, 1, J(1, 11, 0))'
matrix expected_2013 = (0, 0, 1, J(1, 11, 0))'
matrix expected_2015 = (0, 0, 1, J(1, 11, 0))'

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

  * Submuestra
  keep _estudiante _ocupado _joven `var1'
  contract *

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
