OLN-Tools
=========

Herramientas para la automatización de las tablas elaboradas por el OLN.

Introducción
------------

``OLN-Tools`` es un paquete para crear las tablas más comunmente utilizadas
por el Observatorio Laboral Nacional. Consta de:

- Una biblioteca de programas para generar la mayoría de las variables
  utilizadas por el OLN.
- Un sistema OO para especificar, estimar y exportar (a MS Excel) la mayoría
  de las tablas utilizadas por el OLN.

Instalación
-----------

1. Clone el repo de OLN-Tools.
2. En Stata, declare las siguientes macros **globales**:
  * ``$pkg``, el directorio en el cual guardó el repo clonado.
  * ``$datos``, el directorio raíz de las BBDD.
3. En Stata, tipee lo siguiente:
```stata
  foreach folder in "" "_casen" "_ene" "_esi" "_pib" "_sii" {
  	net install ol_tools`folder', all force from("$pkg/src")
  }
```

Aprendiendo a usar OLN-Tools
----------------------------

Para aprender a usar el paquete, lea las notas contenidas en ``$pkg/vignettes``. Se recomienda leerlas en el orden.

Importante
----------

``OLN-Tools`` asume que las BBDD dentro de ``$datos`` se organizan como sigue:
```
$datos/
  CASEN/CASEN <año>.dta        // CASEN genérica
  ENE/ENE <año> <mes>.dta      // ENE genérica
  ESI/ESI <año> Personas.dta   // ESI genérica (Base Personas)
  PIB/
    PIB NSCO.dta     // PIB Nacional Sectorial Corriente  Original
    PIB NSEO.dta     // PIB Nacional Sectorial Encadenado Original
    PIB NSED.dta     // PIB Nacional Sectorial Encadenado Desestacionalizado
    PIB RSCO.dta     // PIB Regional Sectorial Corriente  Original
    PIB RSEO.dta     // PIB Regional Sectorial Encadenado Original
  SII/
    SII - Base empresas 2014.dta
    SII - Estadísticas según sector.dta
    SII - Estadísticas según subsector.dta
```
en donde:
- ``<año>`` representa a un año en formato ``%4d`` (por ejemplo, ``2015``).
- ``<mes>`` representa a un mes en formato ``%2d`` (por ejemplo, ``01``).

Licencia
--------

El proyecto está licenciado bajo una licencia BSD.
