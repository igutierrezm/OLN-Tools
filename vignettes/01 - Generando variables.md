1. Generando variables
======================

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables, así como una serie de funciones que facilitan su uso. Esta viñeta muestra, a través de una serie de ejemplos, como sacarle el máximo provecho a estas funciones.

### Ejemplo 1.1. 

Suponga que desea estimar el número de ocupados para el año 2015 usando la encuesta CASEN. Naturalmente, esto requerirá que el analista genere al menos una variable:

* ``_ocupado``, igual 1 si está ocupado, 0 si no está ocupado y (digamos) ``1e5`` si ns/nr.

``OLN-Tools`` facilita esta tarea con dos funciones: ``ol_select`` y ``ol_generate``. 

* ``ol_select`` se concentra en identificar los inputs necesarios para generar una variable.
* ``ol_generate`` se concentra en la creación de la variable como tal.

El siguiente ejemplo ilustra el uso de ambas funciones en Stata:

```stata
* Directorio raíz de las BBDD (recuerde las convenciones declaradas en README.md)
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Inputs relevantes (strings)
ol_select, varlist("_ocupado") db("casen") año("2015")
local selection "`r(selection)'"

* Inputs relevantes (variables)
use `selection' using "`datos'/CASEN/CASEN 2015.dta", clear

* Output
ol_generate, varlist("_ocupado") db("casen") año("2015") mes("") from("`datos'") 
```

Como se puede apreciar, ambas funciones tienen una sintaxis muy similar. El parámetro ``varlist()`` indica la variable que nos interesa generar, mientras que el resto identifica a la BBDD de referencia. Adicionalmente, ``ol_generate`` necesita conocer el directorio raíz de las BBDD, pues algunas variables requieren más de una BBDD para ser construidas.

| Command | Description |
| ---: | :--- |
| ``varlist(string)`` | el nombre de la variable que deseamos generar |
| ``db(string)`` | el nombre de la BBDD de referencia (las opciones son: ``"casen"``, ``"ene"``, ``"esi"``, ``"pib"``, ``"sii"``) |

* ``varlist(string)``, el nombre de la variable que deseamos generar.
* ``db(string)``, el nombre de la BBDD de referencia (las opciones son: ``"casen"``, ``"ene"``, ``"esi"``, ``"pib"``, ``"sii"``).



La única diferencia es que ``ol_generate`` requiere que el analista le indique el directorio raíz


vea la documentación para una explicación detallada 

* Fijando en 

Para visualizar las variables que ``OLN-Tools`` ofrece para la BBDD ``<db>``, tipee en Stata
```stata
  dictionary_<bbdd>, varlist(<output>) año(<año>) mes(<mes>)
  gen_<bbdd><output>, año(<año>) mes(<mes>)
```

Sea ``<db>`` una de las BBDD estudiadas por el OLN (``casen``, ``ene``, ``esi``, ``pib``, ``sii``). Entonces, puede visualizar todas las variables cubiertas por 

* ``<output>``, el nombre de la variable que deseamos generar.
* ``<bbdd>``, el identificador de la BBDD de referencia (``casen``, ``ene``, ``esi``, ``pib``, ``sii``).
* ``<año>``, el año asociado a ``<bbdd>``.
* ``<mes>``, el mes asociado a ``<bbdd>``.

``OLN-Tools`` ofrece tres programas:
```stata
  select_<bbdd>, varlist(<output>) año(<año>) mes(<mes>)
  gen_<bbdd><output>, año(<año>) mes(<mes>)
```


en donde

Note que las variables necesarias para generar ``<output>`` ya deben estar cargadas para que estos programas funcionen.

Para ver un resumen de las variables asociadas la ``<bbdd>``, tipee en Stata
```stata
  dictionary_<bbdd>
```



### Importante

Si desea replicar los ejemplos de esta viñeta en Stata, debe fijar las siguientes macros globales con antelación:

- ``$data``, el directorio raíz de las BBDD.

### Ejemplo 1.1

El siguiente código genera la variable *años de escolaridad* (``_esc``) usando la ENE 2016 01:
```stata
  gen_casen_esc, año(2016) mes(01)
```

### Ejemplo 1.2

El siguiente código genera la variable *nivel de educación* (``_educ``) usando la ESI 2015: 
```stata
  gen_esi_educ, año(2015)
```

