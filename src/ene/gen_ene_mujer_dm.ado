* ¿Es mujer?
capture program drop gen_ene_mujer_dm
program define gen_ene_mujer_dm, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  generate _mujer_dm = (sexo == 2)
  label variable _mujer_dm "=1 si es mujer"
end
