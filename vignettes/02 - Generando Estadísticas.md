Generando Estadísticas
======================

``OLN-Tools`` contiene un sistema OO para generar estadísticas que consideren el diseño complejo de las distintas encuestas. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a este sistema.

### Ejemplo 1

Suponga que desea estimar el número de ocupados para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                    // Inicialización de la tabla
.my_table.cmds       = "{total _counter}"    // listado de comandos (sin opciones)
.my_table.cmds_lb    = "{n.}"                // etiquetas de comandos (suelen ser más informativas)
.my_table.years      = "2015"                // listado de años considerados
.my_table.months     = "2 5 8 11"            // listado de meses considerados
.my_table.subpops    = "{if _ocupado == 1}"  // listado de subpoblaciones
.my_table.subpops_lb = "{ocupados}"          // etiquetas de sub-poblaciones (suelen ser más informativas)
.my_table.src        = "ene"                 // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from       = "`datos'"             // directorio raíz de todas las bbdd
.my_table.varlist0   = "_ocupado"            // listado de las variables consideradas para esta tabla

* Estimación de la tabla como una BBDD en Stata)
.my_table.create
```

Algunos puntos a destacar:
* Los campos ``.cmds``, ``.cmds_lb``, ``.sobpops`` y ``.subpops_lb`` pueden tener múltiples listados, siempre y cuando se les delimite con una llave (``{`` y ``}``)
* Las variables ``_counter``, ``_psu``, ``_estrato`` y ``_pweight`` se añaden automáticamente a ``.varlist0``.
* Cada tabla admite una sola sub-población, aunque ya veremos que esa no es una restricción en la práctica.

### Ejemplo 2

Suponga que desea estimar el número de ocupados, por rama de actividad económica, para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
```

### Ejemplo 3

Suponga que desea estimar la distribución de ocupados, por rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de una nueva tabla (my_table)
.my_table = .ol_table.new                       // Inicialización de la tabla
.my_table.cmds     = "(proportion _rama1_v1)"   // listado de comandos (sin opciones)
.my_table.masks    = "(n. de ocupados)"         // listado de máscaras (describen los comandos)
.my_table.years    = "2015"                     // listado de años considerados
.my_table.months   = "2 5 8 11"                 // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"       // sub-población
.my_table.by       = "_rama1_v1"                // en conjunto con .by, determina los dominios de estimación
.my_table.src      = "ene"                      // fuente (opciones: casen, ene, esi, pib, sii)
.my_table.from     = "`datos'"                  // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado _rama1_v1"       // listado de las variables consideradas para esta tabla

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

### Ejemplo 4

Suponga que desea estimar la distribución de ocupados por categoría ocupacional, para rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
```

Algunos puntos a destacar:
* Los campos ``.by`` y ``.along`` determinan *en conjunto* los dominios de estimación.
* La diferencia radica en que, en caso de calcular proporciones, dichas proporciones se calcularán de manera proporcional a cada combinación de variables en ``.along``.

### Ejemplo 5

Suponga que desea estimar la distribución de ocupados por categoría ocupacional, para rama de actividad económica, para cada trimestre del 2016, usando la ENE. Suponga, sin embargo, que ahora se le pide añadir los resultados para el país en su conjunto. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
```

Algunos puntos a destacar:
* El campo ``.aggregate`` puede ser incluir varios listados, pero cada listado debe ir entre paréntesis (de lo contrario, no habría cómo distinguir un listado de otro).
