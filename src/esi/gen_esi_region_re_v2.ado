* Región de residencia (sí distingue a Ñuble de Biobío)
capture program drop gen_esi_region_re_v2
program define gen_esi_region_re_v2, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
	* Mutacion
  local var "_region_re_v2"
  # delimit ;
    recode REGION
      (15   = 01 "Región de Arica y Parinacota")
      (01   = 02 "Región de Tarapacá")
      (02   = 03 "Región de Antofagasta")
      (03   = 04 "Región de Atacama")
      (04   = 05 "Región de Coquimbo")
      (05   = 06 "Región de Valparaíso")
      (13   = 07 "Región Metropolitana de Santiago")
      (06   = 08 "Región del Libertador General Bernardo O'Higgins")
      (07   = 09 "Región del Maule")
      (-1   = 10 "Región de Ñuble")
      (08   = 11 "Región del Biobío")
      (09   = 12 "Región de La Araucanía")
      (14   = 13 "Región de Los Ríos")
      (10   = 14 "Región de Los Lagos")
      (11   = 15 "Región de Aysén del General Carlos Ibáñez del Campo")
      (12   = 16 "Región de Magallanes y de la Antártica Chilena")
      (else = .a "ns/nr"),
      generate(`var');
  # delimit cr
  replace `var' = 10 if inrange(R_P_C, 8401, 8421)
  replace `var' = .a if (REGION == 8) & (R_P_C == .)
* Etiquetado
  label variable `var' "Región de residencia"
end
