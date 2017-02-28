*===============================================================================
* Test data - ESI
*===============================================================================

* Housekeeping
set scrollbufsize 2000000
set more off
drop _all
cls

* Variables a testear
# delimit ;
local varlist `"
	"_asalariado"
	"_cise_v1"
	"_cise_v3"
	"_counter"
	"_edad"
	"_educ"
	"_esc"
	"_estrato"
	"_hr_hab"
	"_joven"
	"_jparcial"
	"_jparcial_inv"
	"_mantuvo_empleo"
	"_mujer"
	"_ocupado"
	"_oficio1"
	"_psu"
	"_pweight"
	"_rama1_v1"
	"_region_re_v1"
	"_region_re_v2"
	"_tamaño_empresa"
	"_tipo_contrato"
	"_tramo_edad_v1"
	"_tramo_edad_v2"
	"_yprincipal"
	"_ytrabajo"
"';
# delimit cr

* Generación de las BBDD
foreach var1 in `varlist' {
	forvalues año = 2010(1)2015 {
		* Inputs de `var1'
		capture : select_esi, varlist("`var1'") año("`año'")
		if (_rc != 0) | ("`r(selection)'" == " ") continue
		local var0 "`r(selection)'"

		* Mensaje de verificación
		local length = 20 - ustrlen("`var1'")
		noisily : display as text "`var1' " _skip(`length') "inputs `año' : `var0'"

		* BBDD (Nota: _tamaño_empresa necesita cuidados especiales)
		local test = ("`var1'" == "_tamaño_empresa")
		local file "$datos/ESI/ESI `año' Personas.dta"
		if (`test' == 1) {
			use "`file'", clear
			keep B15_1 B15_2 CISE
		}
		else use `var0' using "`file'", clear
		contract `var0'
		drop _freq

		* Guardado
		save "$pkg/data/tests/esi/`año'/`var1'", replace
	}
}
beep
