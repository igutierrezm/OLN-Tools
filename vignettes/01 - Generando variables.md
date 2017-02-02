1. Generando variables
----------------------

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables. Su sintaxis genérica es: 
```stata
  gen_<bbdd><output>, año(<año>) [mes(<mes>)]
```

en donde

* ``<output>`` es la variable que deseamos generar.
* ``<bbdd>`` es un identificador de la BBDD en la cual se inserta la variable.  Las opciones son ``casen``, ``ene``, ``esi``, ``pib``, ``sii``.
* ``<año>`` es el año para el cual deseamos generar la variable.
* ``<mes>`` es el mes para el cual deseamos generar la variable (solo requerido si ``<bbdd> = ene``).

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

