*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "fact"
local var1 "_pweight"

* BBDD
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
generate diff = abs(`var0' - `var1')

* Etiquetas
label variable diff "= |fact - _pweight|"

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact

* Contrastes
noisily : summarize diff
if (`r(max)' != 0) {
	display as error "    Test N°1 - Error: `var0' != `var1'"
}
