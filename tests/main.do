* Realiza todos los programas contenidos en OLN-Tools/src

* Housekeeping
set scrollbufsize 2000000
set more off
discard
clear
cls

* Macros globales
global user   "observatorio02"
global datos  "C:/Users/$user/Documents/BBDD/Stata"
global GitHub "C:/Users/$user/Documents/GitHub"
global pkg    "$GitHub/OLN-Tools"

* Paquetes externos
foreach pkg in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
	net install ol_tools`pkg', all force from("$pkg/src")
}

* Test Suite
foreach source in "casen" "ene" "esi" {
	local files : dir "$pkg/tests/`source'/" files "_discapacitado.do"
	noisily : display as text _newline "{title:`source'}"
	foreach file of local files {
		noisily : display as text "testing gen_`source'`file' ..."
		run "$pkg/tests/`source'/`file'"
	}
}
beep
