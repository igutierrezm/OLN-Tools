*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var0 "cae_general b14 e18"
local var1 "_rama1_v1"

* Base de prueba
use `var0' using "$pkg/data/tests/ene/2016/01/`var1'.dta", clear
gen_ene`var1', año("2016") mes("01")
contract `var0' `var1'
gen nolabel = `var1'
drop _freq

* Visualización
format * %30.0g
noisily : display _newline "{title:Test N°1}"
noisily : codebook, compact
noisily : list, abbr(100)
noisily : label list

* Contrastes
# delimit ;
	matrix expected = (
	1e5, 01, 02, 03, 04,  05,  06, 07, 08, 09, 10, 11,  13,  12, 12, 12, 12, 13,
	 01, 02, 03, 04, 05,  06,  07, 08, 09, 10, 11, 13,  12,  12, 12, 12, 01, 02,
	 03, 04, 05, 06, 07,  08,  09, 10, 11, 13, 12, 12,  12,  12, 13, 01, 02, 03,
	 04, 05, 06, 07, 08,  09,  10, 11, 13, 12, 12, 12,  12, 1e5, 01, 02, 03, 04,
	 05, 06, 07, 08, 09,  10,  11, 13, 12, 12, 12, 12, 1e5,  01, 04, 06, 07, 08,
	 09, 11, 12, 12, 12,  12, 1e5, 01, 02, 03, 04, 05,  06,  07, 08, 09, 10, 11,
	 13, 12, 12, 12, 12, 1e5,  01, 02, 03, 04, 05, 06,  07,  08, 09, 10, 11, 13,
	 12, 12, 12, 12, 13, 1e5
	)';
# delimit cr
expect_equal, expected("expected") observed("`var1'") id("Test N°1")
