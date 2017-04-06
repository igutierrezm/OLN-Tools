*===============================================================================
* Test data - CASEN
*===============================================================================

* Housekeeping
set scrollbufsize 2000000
set more off
drop _all
cls

* Variables a testear
# delimit ;
local varlist `"
	"_rama1_v1"
	"_region_re_v1"
	"_region_re_v2"
	"_region_tr_v1"
	"_region_tr_v2"
	"_tamano_empresa"
"';
# delimit cr

* Generación de las BBDD
foreach var1 in `varlist' {
	forvalues año = 2012(1)2015 {
		* Inputs de `var1'
		capture : select_sii, varlist("`var1'") año("`año'")
		if (_rc != 0) | ("`r(selection)'" == " ") continue
		local var0 "`r(selection)'"

		* Mensaje de verificación
		local length = 20 - ustrlen("`var1'")
		noisily : display as text "`var1' " _skip(`length') "inputs `año' : `var0'"

		* BBDD
		local file "$datos/SII/AC_`año'.dta"
		else use `var0' using "`file'", clear
		contract `var0'
		drop _freq

		* Guardado
		quietly: save "$pkg/data/tests/sii/`año'/`var1'", replace
	}
}
beep
