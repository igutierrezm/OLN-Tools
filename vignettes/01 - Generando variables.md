1. Generando variables
----------------------

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables. Su sintaxis genérica es: 
```stata
  gen_`bbdd'`var1', año(`año') [mes(`mes')]
```

en donde

* `` `var1'`` es la variable que deseamos generar.
* `` `bbdd'`` es un identificador de la BBDD en la cual se inserta la variable.  Las opciones son ``casen``, ``ene``, ``esi``, ``pib``, ``sii``.
* `` `año'`` es el año para el cual deseamos generar la variable.
* `` `mes'`` es el mes para el cual deseamos generar la variable (solo requerido si ``<bbdd> = ene``).

Note que las variables necesarias para generar `` `var1'`` ya deben estar cargadas para que estos programas funcionen.

### Importante

Si desea replicar los ejemplos de esta viñeta en Stata, debe fijar las siguientes macros globales:

- ``$data``, el directorio raíz de las BBDD (vea el README para más información).

### Ejemplo 1.1

Suponga que deseamos generar la variable *años de escolaridad* (``_esc``) usando la ENE 2016 01. Asumiendo que el directorio raíz de las BBDD fue guardado en $data, podemos generar ``_esc`` con el siguiente código:
```stata
gen_casen_esc, año(2016) mes(01)
```
