*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_yprincipal_hr"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected_2013 = (6.25, ., 5, ., ., ., .)'
matrix expected_2015 = (6.25, ., 5, ., ., .)'

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* BBDD
	capture : use "$pkg/data/tests/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")

	* Sub-muestra (solo tomo un puñado de casos interesantes)
	local hr_hab : word 1 of `var0'
	local yopr   : word 2 of `var0'
	keep if inlist(`hr_hab', ., 40, 50, 999)
	keep if inlist(`yopr', ., 1e6)

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
