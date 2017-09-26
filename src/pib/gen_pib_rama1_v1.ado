capture program drop gen_pib_rama1_v1
program define gen_pib_rama1_v1, rclass
	version 14.1
	// Identifica las "palabras clave" de cada sector
	# delimit ;
	local keys
		"pecuario|(silv.cola)"
		"pesca"
		"miner(i|í)a"
		"industria"
		"electricidad|gas|agua"
		"construcci(o|ó)n"
		"comercio"
		"restaurante|hotel"
		"transporte|comunicaci(o|ó)n|informaci(o|ó)n"
		"financiero"
		"vivienda|inmobiliario|empresarial|alquiler"
		"personal"
		"administraci(o|ó)n|p(u|ú)blica";
	# delimit cr	
	
	// Genera la variable de interés
	local newvar "_rama1_v1"
	generate `newvar' = 1e5
	forvalues i = 1(1)13 {
		local key : word `i' of `keys'
		replace `newvar' = `i' if regexm(sector, `"`key'"') 
	}
	
	// Corrige los casos patológicos (las regex de Stata no son tan buenas)
	replace `newvar' = 1e5 if regexm(sector, `"(comercio, )+"') 
	replace `newvar' = 1e5 if regexm(sector, `"(financieros y)+"') 

	// Agrega etiquetas de valores
	# delimit ;
	label define `newvar'
		01  "Agropecuario-Silvícola"
		02  "Pesca"
		03  "Minería"
		04  "Industria Manufacturera"
		05  "Electricidad, Gas y Agua"
		06  "Construcción"
		07  "Comercio"
		08  "Hoteles y Restaurantes"
		09  "Transporte y Comunicaciones"
		10  "Intermediación Financiera"
		11  "Actividades Inmobiliarias, Empresariales y de Alquiler"
		12  "Servicios Personales"
		13  "Administración Pública"
		1e5 "ns/nr",
		modify;
	# delimit cr
	label values `newvar' `newvar'
	
	// Agrega etiquetas de variables
	label variable `newvar' "Rama de actividad económica"
end
