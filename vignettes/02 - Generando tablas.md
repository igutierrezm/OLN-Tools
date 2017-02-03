Generando Estadísticas
======================

``OLN-Tools`` contiene un sistema OO para generar estadísticas. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a este sistema.

### Ejemplo 1

Suponga que desea estimar el número de ocupados para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                   // Inicialización de la tabla
.my_table.cmds     = "(total _counter)"     // listado de comandos (las opciones se capturan en otros campos)
.my_table.masks    = "(n. de ocupados)"     // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                 // listado de años considerados
.my_table.months   = "2 5 8 11"             // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"   // sub-población
.my_table.src      = "ene"                  // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"              // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado"             // listado de las variables consideradas para esta tabla

* Estimación de la tabla como una BBDD en Stata)
.my_table.create
```

Algunos puntos a destacar:
* Cada comando dentro del campo ``.cmds`` y ``.masks`` debe ir entre paréntesis. 
* Las variables ``_counter``, ``_psu``, ``_estrato`` y ``_pweight`` se añaden automáticamente a ``.varlist0``.
* Cada tabla admite una sola sub-población, aunque ya veremos que esa no es una restricción en la práctica.

### Ejemplo 2

Suponga que desea estimar el número de ocupados, para cada rama de actividad económica, para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                   // Inicialización de la tabla
.my_table.cmds     = "(total _counter)"     // listado de comandos (las opciones se capturan en otros campos)
.my_table.masks    = "(n. de ocupados)"     // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                 // listado de años considerados
.my_table.months   = "2 5 8 11"             // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"   // sub-población
.my_table.along    = "_rama1_v1"            // listado de las variables que generan los dominios de estimación
.my_table.src      = "ene"                  // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"              // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"   // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

### Ejemplo 3

Suponga que desea estimar la distribución de ocupados por categoría ocupacional, para rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                      // Inicialización de la tabla
.my_table.cmds     = "(proportion _cise_v1)"   // listado de comandos (las opciones se capturan en otros campos)
.my_table.masks    = "(n. de ocupados)"        // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                    // listado de años considerados
.my_table.months   = "2 5 8 11"                // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"      // sub-población
.my_table.by       = "_cise_v1"                // junto a .along, determina los dominios de estimación
.my_table.along    = "_rama1_v1"               // junto a .by, determina los dominios de estimación
.my_table.src      = "ene"                     // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                 // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"      // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

Algunos puntos a destacar:
* Tanto ``.by`` como ``.along`` contienen variables que determinan dominios de estimación. La diferencia radica en que, en caso de calcular proporciones, estas se calcularán de manera proporcional a cada combinación de variables en ``.along``.

* Las variables ``_counter``, ``_psu``, ``_estrato`` y ``_pweight`` se añaden automáticamente a ``.varlist0``.
* Cada tabla admite una sola sub-población, aunque ya veremos que esa no es una restricción en la práctica.


### Ejemplo100

Suponga que desea estimar la distribución de ocupados por rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                       // Inicialización de la tabla
.my_table.cmds     = "(proportion _rama1_v1)"   // listado de comandos (las opciones se capturan en otros campos)
.my_table.masks    = "(n. de ocupados)"         // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                     // listado de años considerados
.my_table.months   = "2 5 8 11"                 // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"       // sub-población
.my_table.by       = "_rama1_v1"                // listado de las variables que generan los dominios de estimación
.my_table.src      = "ene"                      // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                  // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"       // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

### Ejemplo 4

Suponga que desea estimar la distribución de ocupados por rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                       // Inicialización de la tabla
.my_table.cmds     = "(proportion _rama1_v1)"   // listado de comandos (las opciones se capturan en otros campos)
.my_table.masks    = "(n. de ocupados)"         // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                     // listado de años considerados
.my_table.months   = "2 5 8 11"                 // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"       // sub-población
.my_table.by       = "_rama1_v1"                // listado de las variables que generan los dominios de estimación
.my_table.src      = "ene"                      // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                  // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"       // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```
