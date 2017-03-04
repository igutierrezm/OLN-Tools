*===============================================================================
* Test 2
*===============================================================================

* Macros auxiliares
local var0 "habituales"
local var1 "_hr_hab"

* BBDD
clear
input `var0'
			1
			10
			140
			999
			.
end
gen_ene`var1', año("2016") mes("01")

* Visualización
format * %100.0g
noisily : display _newline "{title:Test N°2}"
noisily : list, abbr(100)
noisily : label list

* Constrastes
matrix expected = (1, 10, 140, .a, .a)'
expect_equal, expected("expected") observed("`var1'") id("Test N°2")
