*===============================================================================
* Test 1
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                    // Inicialización de la tabla
.my_table.cmds       = "{total _counter}"    // listado de comandos (sin opciones)
.my_table.cmds_lb    = "{n.}"                // etiquetas de comandos (suelen ser más informativas)
.my_table.years      = "2015"                // listado de años considerados
.my_table.months     = "2 5 8 11"            // listado de meses considerados
.my_table.subpops    = "{if _ocupado == 1}"  // listado de subpoblaciones
.my_table.subpops_lb = "{Ocupados}"          // etiquetas de sub-poblaciones (suelen ser más informativas)
.my_table.src        = "ene"                 // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from       = "`datos'"             // directorio raíz de todas las bbdd
.my_table.varlist0   = "_ocupado"            // listado de las variables consideradas para esta tabla

* Estimación de la tabla como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 2
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new
.my_table.cmds       = "{total _counter}"
.my_table.cmds_lb    = "{n.}"
.my_table.years      = "2015"
.my_table.months     = "2 5 8 11"
.my_table.subpops    = "{if _ocupado == 1} {if _desocupado == 1}"
.my_table.subpops_lb = "{Ocupados} {Desocupados}"
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_ocupado"

* Estimación de la tabla como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 3
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new
.my_table.cmds       = "{total _counter}"
.my_table.cmds_lb    = "{n.}"
.my_table.years      = "2015"
.my_table.months     = "2 5 8 11"
.my_table.subpops    = "{if _ocupado == 1}"
.my_table.subpops_lb = "{Ocupados}"
.my_table.by         = "_rama1_v1"
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 4
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new
.my_table.cmds       = "{proportion _rama1_v1}"
.my_table.cmds_lb    = "{n.}"
.my_table.years      = "2015"
.my_table.months     = "2 5 8 11"
.my_table.subpops    = "{if _ocupado == 1}"
.my_table.subpops_lb = "{Ocupados}"
.my_table.by         = "_rama1_v1"
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 5
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new
.my_table.cmds       = "{proportion _rama1_v1}"
.my_table.cmds_lb    = "{n.}"
.my_table.years      = "2015"
.my_table.months     = "2 5 8 11"
.my_table.subpops    = "{if _ocupado == 1}"
.my_table.subpops_lb = "{Ocupados}"
.my_table.by         = "_rama1_v1"
.my_table.along      = "_cise_v1"
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_cise_v1 _ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 6
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new
.my_table.cmds       = "{proportion _rama1_v1}"
.my_table.cmds_lb    = "{n.}"
.my_table.years      = "2015"
.my_table.months     = "2 5 8 11"
.my_table.subpops    = "{if _ocupado == 1}"
.my_table.subpops_lb = "{Ocupados}"
.my_table.by         = "_rama1_v1"
.my_table.along      = "_cise_v1"
.my_table.aggregate  = "{_rama1_v1}"  // listados de agregaciones
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_cise_v1 _ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 7
*===============================================================================

* Housekeeping
set more off
clear all
cls

* Objetos temporales
tempfile df
save `df', emptyok

* Declaración de una nueva tabla
.my_table = .ol_table.new
.my_table.cmds       = "{proportion _tramo_edad_v1}"
.my_table.cmds_lb    = "{% de ocupados}"
.my_table.years      = "2010 2015"
.my_table.months     = "2"
.my_table.subpops    = "{if _ocupado == 1} {if _desocupado == 1}"
.my_table.subpops_lb = "{Ocupados} {Desocupados}"
.my_table.by         = "_tramo_edad_v1"
.my_table.src        = "ene"
.my_table.from       = "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"
.my_table.varlist0   = "_ocupado _tramo_edad_v1"

* Estimación - Panel N°1:
.my_table.create
