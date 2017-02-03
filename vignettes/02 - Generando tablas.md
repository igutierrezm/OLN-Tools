2. Generando tablas
===================

``OLN-Tools`` contiene un sistema OO para generar tablas. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a este sistema.

### Ejemplo 1

Suponga que desea estimar el número de ocupados para para el trimestre 2015 02 usando la ENE. El siguiente código muestra cómo *especificar* la tabla que deseamos:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Creación de una nueva tabla (.mytable)
.my_table = .ol_table.new

* Actualización de .my_table
.my_table.cmds     = "(total _counter)"     // listado de comandos (las opciones se capturan en otros campos)
.my_table.years    = "2015"                 // listado de años considerados
.my_table.months   = "2 5 8 11"             // listado de meses considerados
.my_table.subpop   = "if (_ocupado == 1)"   // sub-población
.my_table.src      = "ene"                  // fuente
.my_table.from     = "`datos'"              // directorio raíz de todas las bbdd
.my_table.varlist0 = "_ocupado"             // listado de las variables consideradas para esta tabla
```
Algunos puntos a destacar:
* Cada comando dentro del campo ``.cmds`` debe ir entre paréntesis. 
* Cada tabla admite una sola sub-población, aunque ya veremos que esa no es una restricción en la práctica.
* Las variables ``_counter``, ``_psu``, ``_estrato`` y ``_pweight`` se añaden automáticamente a ``.varlist0``.


Como se puede apreciar, ambas funciones tienen una sintaxis muy similar. El parámetro ``varlist()`` indica la variable que nos interesa generar, mientras que el resto identifica a la BBDD de referencia. Adicionalmente, ``ol_generate`` necesita conocer el directorio raíz de las BBDD, pues algunas variables requieren más de una BBDD para ser construidas.

Para ver el listado completo de las variables cubiertas para la encuesta CASEN, tipee en Stata
```stata
  ol_dictionary, db("casen")  // otras opciones son "ene", "esi", "pib" y "sii"
```

### Ejemplo 2

Suponga que desea estimar el porcentaje de ocupados conmutantes (distinguiendo a Ñuble de Bío-Bío) para cada trimestre del 2015 usando la ENE. Naturalmente, esto requerirá que el analista genere al menos dos variables:

* ``_ocupado``, igual 1 si está ocupado, 0 si no, y (digamos) ``1e5`` si ns/nr.
* ``_conmutante_v2``, igual 1 si es conmutante, 0 si no, y (digamos) ``1e5`` si ns/nr.

El siguiente ejemplo ilustra cómo generar ambas variables, para cada trimestre, usando ``OLN-Tools``

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Loop sobre los trimestres:
local varlist "_ocupado _conmutante_v2"
foreach mes in "02" "05" "08" "11" {
  * Inputs relevantes (strings)
  ol_select, varlist("`varlist'") db("ene") año("2015") mes("`mes'")
  local selection "`r(selection)'"

  * Inputs relevantes (variables)
  use `selection' using "`datos'/ENE/ENE 2015 `mes'.dta", clear

  * Creación de la variable _ocupado
  ol_generate, varlist("`varlist'") db("ene") año("2015") mes("`mes'") from("`datos'") 
}
```
