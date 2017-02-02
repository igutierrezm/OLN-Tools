*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_oficio4"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Resultados esperados, según año
matrix exp2011 = (2451, 4212, 4213, 5139, 7124, 7132, 8123, 8273, 8279, 9162)'
matrix exp2013 = (2446, 4142, 4143, 5121, 6210, 7112, 7432, 8240, 8263, 8333)'
matrix exp2015 = (2446, 4143, 4144, 5122, 7110, 7113, 7437, 8262, 8270, 9120)'

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

	* Visualización (muestra completa)
	if (`año' == 2013) format * %60.0g
	noisily : display _newline "{title:Test N°1 `año' (muestra)}"
	noisily : list, abbr(100)

	* Sub-muestra (aleatoria)
	set seed 10
	sample 10, count
	sort `var0' `var1'

	* Visualización (sub-muestra)
	noisily : display _newline "{title:Test N°1 `año' (sub-muestra}"
	noisily : codebook, compact
	noisily : list, abbr(100)

	* Contrastes
	local id "Test N°1 `año'"
	expect_equal, expected("exp`año'") id(`id') observed("`var1'")
}
