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

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

Algunos puntos a destacar:
* Las variables ``_counter``, ``_psu``, ``_estrato`` y ``_pweight`` se añaden automáticamente a ``.varlist0``.
* Los símbolos ``{`` y ``}`` juegan un rol especial dentro de este sistema OO: permiten separar múltiples instrucciones dentro de un solo campo. Actualmente, admiten llaves  los campos ``.cmds``, ``.cmds_lb``, ``.sobpops`` y ``.subpops_lb``.

El siguiente ejempleo ilustrará el poder de las llaves.

### Ejemplo 2

Suponga que desea estimar el número de ocupados y desocupados para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

El siguiente ejemplo ilustra cómo lidiar con múltiples dominios de estimación.

### Ejemplo 3

Suponga que desea estimar el número de ocupados, por rama de actividad económica, para cada trimestre del año 2015, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
.my_table.by         = "_rama1_v1"  // junto a .along (ver ejemplo 5), determina los dominios de estimación  
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

El siguiente ejemplo ilustra cómo lidear con estadísticos distintos del total.

### Ejemplo 4

Suponga que desea estimar la distribución de ocupados, por rama de actividad económica, para cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
```

Algunos puntos a destacar:
* A diferencia del comando oficial, el sistema OO convierte de inmediato las proporciones en porcentajes.

El siguiente ejemplo ilustra cómo lidea con el caso (tan molesto como habitual) en el cual necesitas estimar la distribución de una variable X, condicional a cada valor de otra variable Y.

### Ejemplo 5

Suponga que desea estimar la distribución de ocupados por rama de actividad, para cada categoría ocupacional y cada trimestre del 2016, usando la ENE. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
.my_table.along      = "_cise_v1"  // junto a .by, determina los dominios de estimación
.my_table.src        = "ene"
.my_table.from       = "`datos'"
.my_table.varlist0   = "_cise_v1 _ocupado _rama1_v1"

* Estimación de la tabla (como una BBDD en Stata)
.my_table.create
```

Algunos puntos a destacar:
* Los campos ``.by`` y ``.along`` determinan *en conjunto* los dominios de estimación.
* La diferencia radica en que, en caso de calcular proporciones, dichas proporciones se calcularán de manera proporcional a cada combinación de variables en ``.along``.

El siguiente ejemplo ilustra cómo lidiar con múltiples niveles de agregación.

### Ejemplo 6

Suponga que desea estimar la distribución de ocupados por rama de actividad económica, para cada categoría ocupacional y cada trimestre del 2016, usando la ENE. Suponga, sin embargo, que ahora se le pide añadir los resultados para el país en su conjunto. El siguiente código muestra cómo realizar esta tarea usando el sistema OO de ``OLN-Tools``:

```stata
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
```

Algunos puntos a destacar:
* El campo ``.aggregate`` puede ser incluir varios listados, pero cada listado debe ir entre paréntesis (de lo contrario, no habría cómo distinguir un listado de otro).
