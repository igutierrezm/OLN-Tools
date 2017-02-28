*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_yprincipal"

* Contrastes, según año
forvalues año = 2010(1)2015 {
	* Variables relevantes
	capture : select_esi, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	local lvar : variable label `var0'
	gen_esi`var1', año(`año')

	* Visualización (etiquetas)
	format * %100.0g
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact
	noisily : label list

	* Submuestra
	drop _all
	matrix A = (1e5, 1e6, .)'
	matrix colnames A = "`var0'"
	svmat A, names(col)
	gen_esi`var1', año(`año')

	* Visualización (sub-muestra)
	noisily : list

	* Contrastes
	local id "Test N°1 `año'"
	matrix expected = (1e5, 1e6, .)'
	expect_equal, expected("expected") id(`id') observed("`var1'")
}
