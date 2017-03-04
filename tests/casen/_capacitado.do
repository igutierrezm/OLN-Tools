*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_capacitado"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected_2013 = (1, 1, 001, 000, .a, .a, .a)'
matrix expected_2015 = (1, 0, .a, .a, .a)'

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
