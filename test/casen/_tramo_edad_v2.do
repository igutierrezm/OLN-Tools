*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_tramo_edad_v2"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected = (1, 1, 2, 2, 2, 3, 3, 3, 4, 4)'

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* BBDD
	capture : use "$pkg/data/test data/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")
	generate nolabel = `var1'

	* Sub-muestra (solo tomo un puñado de casos interesantes)
	keep if inlist(edad, 4, 5, 6, 12, 13, 14, 16, 17, 18, 19)

	* Visualización
	format * %100.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("expected") id(`id') observed("`var1'")
}
