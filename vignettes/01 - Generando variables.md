1. Generando variables
======================

``OLN-Tools`` contiene una extensa biblioteca de variables. Esta se compone de
5 carpetas. El nombre (genérico) de cada carpeta es ``src/ol_tools_<bbdd>``, en
donde ``<bbdd>`` revela la BB.DD. sobre la que trabajan las variables ahí
contenidas.

Note que todos los programas ``src/ol_tools_<bbdd>`` poseen la misma sintaxis:

```
  gen_<bbdd><variable>, año(<año>) [mes(<mes>)]
```

en donde

* ``<variable>`` es la variable que deseamos generar.
* ``<año>`` es el año para el cual deseamos generar la variable.
* ``<mes>`` es el mes para el cual deseamos generar la variable.
