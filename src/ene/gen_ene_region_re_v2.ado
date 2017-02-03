* Región de residencia (sí distingue a Ñuble de Biobío)
capture program drop gen_ene_region_re_v2
program define gen_ene_region_re_v2, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
	* Mutacion
  local var "_region_re_v2"
  # delimit ;
    recode region
      (1e6  = 1e6 "Nacional")
      (15   =  01 "Región de Arica y Parinacota")
      (01   =  02 "Región de Tarapacá")
      (02   =  03 "Región de Antofagasta")
      (03   =  04 "Región de Atacama")
      (04   =  05 "Región de Coquimbo")
      (05   =  06 "Región de Valparaíso")
      (13   =  07 "Región Metropolitana de Santiago")
      (06   =  08 "Región del Libertador General Bernardo O'Higgins")
      (07   =  09 "Región del Maule")
      (-1   =  10 "Región de Ñuble")
      (08   =  11 "Región del Biobío")
      (09   =  12 "Región de La Araucanía")
      (14   =  13 "Región de Los Ríos")
      (10   =  14 "Región de Los Lagos")
      (11   =  15 "Región de Aysén del General Carlos Ibáñez del Campo")
      (12   =  16 "Región de Magallanes y de la Antártica Chilena")
      (else = 1e5 "ns/nr"),
      generate(`var');
  # delimit cr
  replace `var' =  10 if inrange(r_p_c, 8401, 8421)
  replace `var' = 1e5 if (region == 8) & (r_p_c == .)
	* Etiquetado
  label variable `var' "Región de residencia"
end
