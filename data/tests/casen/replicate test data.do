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
	"_alfabetizado"
	"_asalariado"
	"_asiste_escuela"
	"_boleta"
	"_capacitado"
	"_cise_v1"
	"_cise_v3"
	"_contrato"
	"_cotiza_pension"
	"_cotiza_salud"
	"_counter"
	"_desocupado"
	"_discapacitado"
	"_edad"
	"_educ"
	"_esc"
	"_estrato"
	"_estudiante"
	"_extranjero"
	"_hr_hab"
	"_inactivo"
	"_indigena"
	"_inmigrante"
	"_joven"
	"_media_completa"
	"_mujer"
	"_nini"
	"_ocupado"
	"_oficio1"
	"_oficio4"
	"_pea"
	"_pet"
	"_psu"
	"_pweight"
	"_rama1_v1"
	"_razon_inactividad"
	"_region_re_v1"
	"_tipo_contrato"
	"_tramo_edad_v1"
	"_tramo_edad_v2"
	"_tramo_edad_v3"
	"_yprincipal_hr"
	"_yprincipal"
	"_ytrabajo"
"';
# delimit cr

* Generación de las BBDD
foreach var1 in _discapacitado {
	foreach año in 1990 1992 1994 1996 1998 2000 2003 2006 2009 2011 2013 2015 {
		* Inputs de `var1'
		capture : select_casen, varlist("`var1'") año("`año'")
		if (_rc != 0) | ("`r(selection)'" == " ") continue
		local var0 "`r(selection)'"

		* Mensaje de verificación
		local length = 20 - ustrlen("`var1'")
		noisily : display as text "`var1' " _skip(`length') "inputs `año' : `var0'"

		* BBDD
		local file "$datos/CASEN/CASEN `año'.dta"
		else use `var0' using "`file'", clear
		contract `var0'
		drop _freq

		* Guardado
		quietly: save "$pkg/data/tests/casen/`año'/`var1'", replace
	}
}
beep
