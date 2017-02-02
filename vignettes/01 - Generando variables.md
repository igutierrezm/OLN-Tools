1. Generando variables
----------------------

``OLN-Tools`` contiene una extensa biblioteca de funciones para generar variables. Su sintaxis genérica es: 
```stata
  gen_`bbdd'`variable', año("`año'") [mes("`mes'")]
```

en donde

* ``<variable>`` es la variable que deseamos generar.
* ``<bbdd>`` es la BBDD en la cual se inserta la variable. Las opciones son ``casen``, ``ene``, ``esi``, ``pib``, ``sii``.
* ``<año>`` es el año para el cual deseamos generar la variable.
* ``<mes>`` es el mes para el cual deseamos generar la variable (solo requerido si ``<bbdd> = ene``.
