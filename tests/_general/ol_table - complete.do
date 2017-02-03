*===============================================================================
* Test 1
*===============================================================================

* Declaración de la tabla
.my_table = .ol_table.new
.my_table.varlist0 = "_ocupado"             

* Comando a testear
.my_table.complete

* Constraste
local expected "_ocupado _counter _psu _estrato _pweight"
local constrast = ("`.my_table.varlist1'" == "`expected'")
if (`constrast' != 1) display as error "Error en test N°1"

/*
* Actualización
.my_table.cmds     = "(total _counter)"     
.my_table.years    = "2015"                 
.my_table.months   = "2 5 8 11"             
.my_table.subpop   = "if (_ocupado == 1)"   
.my_table.src      = "ene"                  
.my_table.from     = "`datos'"              
.my_table.varlist0 = "_ocupado"             

* Constraste
.my_table.complete
*/
