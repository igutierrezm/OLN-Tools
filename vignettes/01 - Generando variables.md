1. Generando variables
----------------------

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables. En esta viñeta, se explicarán las funciones básicas para utilizarlas

## 1.1. Un ejemplo motivador

Suponga que desea estimar el número de ocupados para el trimestre 2016 01 usando la Encuesta Nacional de Empleo. Naturalmente, esto requerirá que el analista genere al menos una variable:

* ``_ocupado``, igual 1 si está ocupado, 0 si no está ocupado y (digamos) 1e5 si ns/nr.

``OLN-Tools`` facilita esta tarea con dos funciones: ``ol_select`` y ``ol_generate``. 

* ``ol_select`` se concentra en identificar los inputs necesarios para generar una variable. Por ejemplo, para genera ``_ocupado``, necesitamos la variable ``cae_general`` (obviamente, existen otras opciones).
* ``ol_generate`` se concentra en la creación de la variable como tal.

El siguiente ejemplo ilustra el uso de ambas funciones:

```stata
  * Loop principal
  forvalues año = 2011(2)2015 {
    *  
  }
```

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

