capture program drop gen_ene_pweight
program define gen_ene_pweight, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  generate double _pweight = fact
  * Etiquetado
  label variable _pweight "Factor de expansión"
end
