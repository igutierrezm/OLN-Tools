*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_pweight"

forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/tests/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	gen diff = abs(`var0' - `var1')

	* Visualización
	format * %100.0g
	noisily : display _newline "{title:Test N°1}"
	noisily : codebook, compact

	* Contrastes
	noisily : summarize diff
	if (`r(max)' != 0) {
		display as error "    Test N°1 - Error: `var0' != `var1'"
	}
}
