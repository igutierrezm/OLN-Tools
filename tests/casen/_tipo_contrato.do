*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_tipo_contrato"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix n2003 = (4, 1, 12, 07)
matrix n2006 = (4, 1, 12, 13)
matrix n2009 = (5, 0, 12, 07)
matrix n2011 = (1, 0, 04, 07)
matrix n2013 = (1, 1, 05, 07)
matrix n2015 = (1, 1, 05, 07)
matrix i     = (2, 1e5, 1, 1e5)

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
	matrix n = n`año'
	matrix expected = J(1, 1, 3)
	forvalues k = 1(1)4 {
		if (n[1, `k'] != 0) {
			matrix expected = (expected \ J(n[1, `k'], 1, i[1, `k']))
		}
	}
	local id "Test N°1 `año'"
	expect_equal, expected("expected") id(`id') observed("`var1'")
}
