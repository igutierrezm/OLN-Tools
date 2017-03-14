*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_discapacitado"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected_2013 = (J(1, 15, 1), 0, 1e5)'
matrix expected_2015 = (J(1, 5, 0), J(1, 11, 1), 1e5)'

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* Muestra
	capture : use "$pkg/data/tests/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")
	generate nolabel = `var1'
	sort `var0'

	* Submuestra (no puedo ponerme en todos los casos)
	keep if (_n <= 15) | inlist(_n, 4515, `c(N)')

	* Visualización
	format * %5.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : list, abbr(5)
	noisily : label list

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("expected_`año'") id(`id') observed("`var1'")
}
