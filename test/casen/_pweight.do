*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_pweight"
local años "1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015"

* Contrastes, según año
foreach año in `años' {
	* Variables relevantes
	capture : select_casen, varlist("`var1'") año("`año'")
	local var0 "`r(selection)'"
	if (_rc != 0) continue

	* BBDD
	capture : use "$pkg/data/test data/casen/`año'/`var1'.dta", clear
	gen_casen`var1', año("`año'")
	gen diff = abs(`var1' - `var0')

	* Visualización
	noisily : display _newline "{title:Test N°1 `año'}"
	noisily : codebook, compact

	* Contrastes
	quietly : summarize diff
	if (`r(max)' != 0) {
		display as error "    Test N°1 - Error: `var0' != `var1'"
	}
}
