capture program drop gen_esi_pweight
program define gen_esi_pweight, rclass
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  generate double _pweight = FACT_PER
  * Etiquetado
  label variable _pweight "Factor de expansión"
end
