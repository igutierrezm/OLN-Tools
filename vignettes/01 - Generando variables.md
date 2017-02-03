1. Generando variables
======================

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables, así como una serie de funciones que facilitan su uso. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a estas funciones.

### Ejemplo 1

Suponga que desea estimar el número de ocupados para el año 2015 usando la encuesta CASEN. Naturalmente, esto requerirá que el analista genere al menos una variable:

* ``_ocupado``, igual 1 si está ocupado, 0 si no está ocupado y (digamos) ``1e5`` si ns/nr.

``OLN-Tools`` facilita esta sub-tarea con dos funciones: ``ol_select`` y ``ol_generate``. 

* ``ol_select`` se concentra en identificar los inputs necesarios para generar una variable.
* ``ol_generate`` se concentra en la creación de la variable como tal.

El siguiente código ilustra cómo generar la variable ``ocupado`` usando estas dos funciones:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Inputs relevantes (strings)
ol_select, varlist("_ocupado") db("casen") año("2015") mes("")
local selection "`r(selection)'"

* Inputs relevantes (variables)
use `selection' using "`datos'/CASEN/CASEN 2015.dta", clear

* Creación de la variable _ocupado
ol_generate, varlist("_ocupado") db("casen") año("2015") mes("") from("`datos'") 
```

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
forvalues mes in "02" "05" "08" "11" {
  * Inputs relevantes (strings)
  ol_select, varlist("_ocupado _conmutante_v2") db("ene") año("2015") mes("`mes'")
  local selection "`r(selection)'"

  * Inputs relevantes (variables)
  use `selection' using "`datos'/ENE/2015/ENE 2015 `mes'.dta", clear

  * Creación de la variable _ocupado
  ol_generate, varlist("_ocupado _conmutante_v2") db("ene") año("2015") mes("`mes'") from("`datos'") 
}
```


