*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_ytrabajo"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix expected = (.a, 1e6, .)'

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* BBDD
	capture : use "$pkg/data/tests/casen/`año'/`var1'.dta", clear
	local lvar : variable label `var0'
	gen_casen`var1', año(`año')

	* Visualización (etiquetas)
	format * %100.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : label list

	* Submuestra
	drop _all
	matrix A = (.a, 1e6, .)'
	matrix colnames A = "`var0'"
	svmat A, names(col)
	gen_casen`var1', año(`año')

	* Visualización (sub-muestra)
	noisily : list

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("expected") id(`id') observed("`var1'")
}
