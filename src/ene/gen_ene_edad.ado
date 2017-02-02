capture program drop gen_ene_edad
program define gen_ene_edad, rclass
  version 14.1
  syntax, año(string) mes(string)
  * Mutación
  generate _edad = edad
  * Etiquetado
  label variable edad "Edad"
end
