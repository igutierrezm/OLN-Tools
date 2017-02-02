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

Note que todas las funciones antes mencionadas asumen que las variables necesarias para generar ``var1`` se encuentran cargadas en Stata.

### Ejemplo 1.1

El archivo 
El siguiente código genera la variable *años de escolaridad* (``_esc``) usando la ENE 2016 01.

```stata

```
