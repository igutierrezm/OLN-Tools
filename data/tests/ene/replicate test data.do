*===============================================================================
* Test data - ENE
*===============================================================================

* Housekeeping
set scrollbufsize 2000000
set more off
drop _all
cls

* Variables a testear
# delimit ;
local varlist `"
	"_activ"
	"_asalariado"
	"_b7"
	"_cesante"
	"_cise_v1"
	"_cise_v2"
	"_cise_v3"
	"_conmutante_v1"
	"_conmutante_v2"
	"_counter"
	"_desocupado"
	"_edad"
	"_educ"
	"_esc"
	"_estrato"
	"_exceso_hr_chl"
	"_exceso_hr_int"
	"_hr_hab"
	"_jparcial_inv"
	"_jparcial"
	"_mujer"
	"_ocupado"
	"_oficio1"
	"_pea"
	"_pet"
	"_psu"
	"_pweight"
	"_rama1_v1"
	"_rama1_v2"
	"_region_re_v1"
	"_region_re_v2"
	"_region_tr_v1"
	"_region_tr_v2"
	"_superior_completa"
	"_tamaño_empresa"
	"_tipo_contrato"
	"_tramo_edad_v1"
	"_tramo_edad_v2"
"';
# delimit cr

* Generación de las BBDD
foreach var1 in `varlist' {
	forvalues año = 2016(1)2016 {
		forvalues mes = 1(1)1 {
			* Inputs de `var1'
			local mes = string(`mes', "%02.0f")
			capture : select_ene, varlist("`var1'") año("`año'") mes("`mes'")
			if (_rc != 0) | ("`r(selection)'" == " ") continue
			local var0 "`r(selection)'"

			* Mensaje de verificación
			local length = 20 - ustrlen("`var1'")
			noisily : display as text "`var1' " _skip(`length') "inputs : `var0'"

			* BBDD
			local file "$datos/ENE/ENE `año' `mes'.dta"
			else use `var0' using "`file'", clear
			contract `var0'
			drop _freq

			* Guardado
			save "$pkg/data/tests/ene/`año'/`mes'/`var1'", replace
		}
	}
}
beep
