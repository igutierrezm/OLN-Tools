// Región (no distingue a Ñuble de Biobío)
capture program drop gen_pib_region_tr_v1
program define gen_pib_region_tr_v1
  version 14.1
  local newvar "_region_tr_v1"

	// Identifica las "palabras clave" de cada region
	local keys "xv i ii iii iv v rms vi vii viii ix xiv x xi xii"

	// Genera el ID regional
	generate `newvar' = 1e5
	forvalues i = 1(1)15 {
		local key : word `i' of `keys'
		replace `newvar' = `i' if regexm(region, `"^(`key' )+"') 
	}

	// Etiqueta los valores
	# delimit ;
	label define `newvar'
		01 "Región de Arica y Parinacota"
		02 "Región de Tarapacá"
		03 "Región de Antofagasta"
		04 "Región de Atacama"
		05 "Región de Coquimbo"
		06 "Región de Valparaíso"
		07 "Región Metropolitana de Santiago"
		08 "Región del Libertador Bdo. O'Higgins"
		09 "Región del Maule"
		10 "Región del BioBío"
		11 "Región de La Araucanía"
		12 "Región de Los Ríos"
		13 "Región de Los Lagos"
		14 "Región de Aysén del Gral. Carlos Ibañez del Campo"
		15 "Región de Magallanes y de la Antártica Chilena"
		1e5 "ns/nr";
	# delimit cr
	label values `newvar' `newvar'
	
	// Añade una etiqueta a la variable
	label variable _region_tr_v1 "región"
	
  // Añade notas
  note `var' : "No distingue a Ñuble de Biobío"
end
