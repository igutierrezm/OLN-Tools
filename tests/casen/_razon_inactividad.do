*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_razon_inactividad"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix exp2006 = (8, 8, 1, 1, 9, 2, 9, 9, 5, 9, 5, 5, 9, 5, 4, 3, 7, 7, 6, 9, 1e5, 1e5)'
matrix exp2009 = (8, 8, 1, 1, 1, 9, 2, 9, 9, 5, 9, 5, 5, 9, 5, 4, 3, 7, 7, 6, 9, 1e5)'
matrix exp2011 = (8, 8, 1, 1, 1, 4, 5, 5, 5, 2, 3, 7, 7, 5, 9, 6, 9, 1e5, 1e5)'
matrix exp2013 = (8, 8, 1, 1, 1, 4, 5, 5, 5, 2, 3, 7, 7, 5, 9, 6, 9, 1e5, 1e5)'
matrix exp2015 = (8, 8, 1, 1, 1, 4, 5, 5, 5, 2, 3, 7, 7, 5, 9, 6, 9, 1e5, 1e5)'

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 : word 1 of `r(selection)'
	if (_rc != 0) continue

	* BBDD
	capture : use `var0' using "$pkg/data/tests/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")
	generate nolabel = `var1'

	* Visualización
	format * %50.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : list, abbr(50)
	noisily : label list

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("exp`año'") id(`id') observed("`var1'")
}
