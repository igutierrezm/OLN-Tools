*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "edad"
local var1 "_edad"

* BBDD
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
gen diff = abs(`var0' - `var1')

* Etiquetas
label variable diff "= |`var0' - `var1'|"

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : label list

* Contrastes
noisily : summarize diff
if (`r(max)' != 0) {
	display as error "    Test N°1 - Error: `var0' != `var1'"
}
