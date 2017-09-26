capture program drop gen_pib_rama1_v2
program define gen_pib_rama1_v2, rclass
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
		"comercio|restaurante|hotel"
		"transporte|comunicaci(o|ó)n|informaci(o|ó)n"
		"financiero|vivienda|inmobiliario|empresarial|alquiler"
		"personal"
		"administraci(o|ó)n|p(u|ú)blica";
	# delimit cr	
	
	// Genera la variable de interés
	local newvar "_rama1_v2"
	generate `newvar' = 1e5
	forvalues i = 1(1)11 {
		local key : word `i' of `keys'
		replace `newvar' = `i' if regexm(sector, `"`key'"') 
	}

	// Agrega etiquetas de valores
	local str9A "Intermediación Financiera"
	local str9B "Actividades Inmobiliarias, Empresariales y de Alquiler"
	# delimit ;
	label define `newvar'
		01  "Agropecuario-Silvícola"
		02  "Pesca"
		03  "Minería"
		04  "Industria Manufacturera"
		05  "Electricidad, Gas y Agua"
		06  "Construcción"
		07  "Comercio, Hoteles y Restaurantes"
		08  "Transporte y Comunicaciones"
		09  "`str9A', `str9B'"
		10  "Servicios Personales"
		11  "Administración Pública"
		1e5 "ns/nr",
		modify;
	# delimit cr
	label values `newvar' `newvar'
	
	// Agrega etiquetas de variables
	label variable `newvar' "Rama de actividad económica"
end
