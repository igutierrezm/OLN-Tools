*===============================================================================
* Test 1
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                   // Inicialización de la tabla
.my_table.cmds     = "(total _counter)"     // listado de comandos (sin opciones)
.my_table.masks    = "(n. de ocupados)"     // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                 // listado de años considerados
.my_table.months   = "2 5 8 11"             // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"   // sub-población
.my_table.src      = "ene"                  // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"              // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado"             // listado de las variables consideradas para esta tabla

* Estimación de la tabla como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 2
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                   // Inicialización de la tabla
.my_table.cmds     = "(total _counter)"     // listado de comandos (sin opciones)
.my_table.masks    = "(n. de ocupados)"     // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                 // listado de años considerados
.my_table.months   = "2 5 8 11"             // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"   // sub-población
.my_table.along    = "_rama1_v1"            // en conjunto con .by, determina los dominios de estimación
.my_table.src      = "ene"                  // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"              // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"   // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 3
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                       // Inicialización de la tabla
.my_table.cmds     = "(proportion _rama1_v1)"   // listado de comandos (sin opciones)
.my_table.masks    = "(n. de ocupados)"         // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                     // listado de años considerados
.my_table.months   = "2 5 8 11"                 // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"       // sub-población
.my_table.along    = "_rama1_v1"                // en conjunto con .by, determina los dominios de estimación
.my_table.src      = "ene"                      // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                  // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"       // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 4
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                           // Inicialización de la tabla
.my_table.cmds     = "(proportion _cise_v1)"        // listado de comandos (sin opciones)
.my_table.masks    = "(n. de ocupados)"             // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                         // listado de años considerados
.my_table.months   = "2 5 8 11"                     // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"           // sub-población
.my_table.by       = "_cise_v1"                     // junto a .along, determina los dominios de estimación
.my_table.along    = "_rama1_v1"                    // junto a .by, determina los dominios de estimación
.my_table.src      = "ene"                          // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                      // directorio raíz de todas las bbdd
.my_table.varlist0 = "_cise_v1 _ocupado _rama1_v1"  // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create

*===============================================================================
* Test 5
*===============================================================================

* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                            // Inicialización de la tabla
.my_table.cmds      = "(proportion _cise_v1)"        // listado de comandos (sin opciones)
.my_table.masks     = "(n. de ocupados)"             // listado de máscaras (describen los comandos)
.my_table.years     = "2015"                         // listado de años considerados
.my_table.months    = "2 5 8 11"                     // listado de meses considerados
.my_table.subpop    = "if (_ocupado == 1)"           // sub-población
.my_table.by        = "_cise_v1"                     // junto a .along, determina los dominios de estimación
.my_table.along     = "_rama1_v1"                    // junto a .by, determina los dominios de estimación
.my_table.aggregate = "(_rama1_v1)"                  // listados de agregaciones
.my_table.src       = "ene"                          // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from      = "`datos'"                      // directorio raíz de todas las bbdd
.my_table.varlist0  = "_cise_v1 _ocupado _rama1_v1"  // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
