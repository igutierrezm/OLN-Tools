*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local var1 "_region_re_v2"

* Resultados esperados, según año
matrix expected_2010 = (2, 5, 5, 8, 8, 12, 12, 12, 12, 14, 16, 7, 7, 7, 13)'
matrix expected_2011 = (2, 5, 5, 8, 8, 12, 12, 12, 12, 14, 07, 7, 7, 7, 01)'
matrix expected_2012 = (2, 5, 5, 8, 8, 12, 12, 14, 14, 14, 14, 7, 7, 7, 07)'
matrix expected_2013 = (2, 5, 5, 8, 8, 12, 12, 12, 14, 14, 14, 7, 7, 7, 07)'
matrix expected_2014 = (2, 5, 5, 8, 8, 12, 12, 14, 14, 14, 14, 7, 7, 7, 07)'
matrix expected_2015 = (2, 5, 5, 8, 8, 12, 12, 14, 14, 15, 15, 7, 7, 7, 07)'

* Loop principal
forvalues año = 2010(1)2015 {
	* Variables relevantes
	select_esi, varlist(`var1') año(`año')
	local var0 "`r(selection)'"

	* BBDD
	capture : use "$pkg/data/test data/esi/`año'/`var1'.dta", clear
	gen_esi`var1', año("`año'")
	contract `var0' `var1'
	gen nolabel = `var1'
	drop _freq

	* Submuestra (aleatoria)
	set seed 10
	sample 15, count
	sort `var0' `var1'

	* Visualización
	noisily : display _newline "{title:Test N°1 - `año'}"
	noisily : codebook, compact
	noisily : list, abbr(100)

	* Contrastes
	local id "Test N°1 - `año'"
	expect_equal, expected("expected_`año'") observed("`var1'") id("`id'")
}

*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var0 "REGION R_P_C"
local var1 "_region_re_v2"

* BBDD
drop _all
input `var0'
			1      1101
			1      .
			8      8420
			8 		 8103
			8      .
			.      .
end
gen_esi`var1', año("2015")
gen nolabel = `var1'

* Visualización
label values R_P_C R_P_C
label values REGION REGION
noisily : display _newline "{title:Test N°2}"
noisily : list, abbreviate(100)

* Constrastes
matrix expected = (2, 2, 10, 11, 1e5, 1e5)'
expect_equal, expected("expected") observed("`var1'") id("Test N°2")
