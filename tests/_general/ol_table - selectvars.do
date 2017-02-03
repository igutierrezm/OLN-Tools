*===============================================================================
* Test 1
*===============================================================================

* Macros auxiliares
local datos "C:/Users/Pedro/Documents/Oficina OLN/Datos/Stata"

* Declaración de la tabla
.my_table = .ol_table.new
.my_table.src      = "ene"   
.my_table.from     = "`datos'"          
.my_table.varlist1 = "_ocupado"             

* Comando a testear
.my_table.selectvars, año("2015") mes("01")

* Constraste
capture : confirm variable cae_general, exact
if (_rc != 0) display as error "Error en test N°1"
