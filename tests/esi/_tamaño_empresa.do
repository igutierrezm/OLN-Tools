*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "B15_1 B15_2 CISE"
local var1 "_tamaño_empresa"

* Resultados esperados (2010)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (22, 5, 27, 5, 5, 5, 003)
matrix expected2010 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2010 = (expected2010 \ J(i[1, `k'], 1, n[1, `k']))
}

* Resultados esperados (2011)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (22, 5, 28, 5, 5, 4, 003)
matrix expected2011 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2011 = (expected2011 \ J(i[1, `k'], 1, n[1, `k']))
}

* Resultados esperados (2012)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (23, 5, 28, 5, 4, 4, 003)
matrix expected2012 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2012 = (expected2012 \ J(i[1, `k'], 1, n[1, `k']))
}

* Resultados esperados (2013)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (22, 5, 29, 5, 5, 5, 003)
matrix expected2013 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2013 = (expected2013 \ J(i[1, `k'], 1, n[1, `k']))
}

* Resultados esperados (2014)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (22, 5, 28, 5, 4, 4, 003)
matrix expected2014 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2014 = (expected2014 \ J(i[1, `k'], 1, n[1, `k']))
}

* Resultados esperados (2015)
matrix n = (01, 2, 01, 2, 3, 4, .a)
matrix i = (21, 5, 29, 5, 5, 5, 003)
matrix expected2015 = (1, 0)'
forvalues k = 1(1)7 {
	matrix expected2015 = (expected2015 \ J(i[1, `k'], 1, n[1, `k']))
}

forvalues año = 2010(1)2015 {
	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)
	noisily : label list

	* Contrastes
	local id "Test N°1 - `año'"
	expect_equal, expected("expected`año'") observed("`var1'") id("`id'")
}
