capture program drop gen_casen_region_re_v1
program define gen_casen_region_re_v1
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_region_re_v1"
  select_casen, varlist("`var'") año(`año')
  local region : word 1 of `r(selection)'
  local comuna : word 2 of `r(selection)'
  # delimit ;
    recode `region'
    	(15   = 01 "Región de Arica y Parinacota")
    	(01   = 02 "Región de Tarapacá")
    	(02   = 03 "Región de Antofagasta")
    	(03   = 04 "Región de Atacama")
    	(04   = 05 "Región de Coquimbo")
    	(05   = 06 "Región de Valparaíso")
    	(13   = 07 "Región Metropolitana de Santiago")
    	(06   = 08 "Región del Libertador General Bernardo O'Higgins")
    	(07   = 09 "Región del Maule")
    	(08   = 10 "Región del Biobío")
    	(09   = 11 "Región de La Araucanía")
    	(14   = 12 "Región de Los Ríos")
    	(10   = 13 "Región de Los Lagos")
    	(11   = 14 "Región de Aysén del General Carlos Ibáñez del Campo")
    	(12   = 15 "Región de Magallanes y de la Antártica Chilena")
      (else = 1e5 "ns/nr"),
    	generate(`var');
  # delimit cr
  if inrange(`año', 1990, 2006) {
  	replace `var' = 01 if inrange(`comuna',  1101,  1202)  // Arica
  	replace `var' = 12 if inrange(`comuna', 10101, 10112)  // Los Ríos
  }
  * Etiquetado
  local lvar "Región de residencia (no distingue a Ñuble del Biobío)"
  label variable `var' "`lvar'"
end
