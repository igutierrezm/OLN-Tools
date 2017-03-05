* Realiza todos los programas contenidos en OLN-Tools/src

* Housekeeping
set scrollbufsize 2000000
set more off
discard
clear
cls

* Macros globales
global datos  "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
global GitHub "C:/Users/Pedro/Documents/GitHub"
global pkg    "$GitHub/OLN-Tools"

* Paquetes externos
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$pkg/src")
}

* Test Suite
foreach source in "casen" "ene" "esi" {
	local files : dir "$pkg/tests/`source'/" files "*.do"
	noisily : display as text "{title:`source'}" _newline
	foreach file of local files {
		noisily : display as text "testing gen_`source'`file' ..."
		run "$pkg/tests/`source'/`file'"
	}
}
beep
