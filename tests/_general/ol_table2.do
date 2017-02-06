*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
local cmd1  "svy, subpop(if _ocupado == 1) : total _counter, over()"

* Tabla - Declaración
.tbl = .ol_table2.new
	* Indicadores
	.tbl.cmds         = "{`cmd1'}"
	.tbl.varlist      = "_ocupado"
	* Período cubierto
	.tbl.years        = "2015"
	.tbl.months       = "2"
	* BBDD
	.tbl.src          = "ene"
	.tbl.from         = "`datos'"
	* Etiquetas
	.tbl.label_bh     = "{n.}"
	.tbl.label_subpop = "{Ocupados}"

* Tabla - Estimación
.tbl.create
