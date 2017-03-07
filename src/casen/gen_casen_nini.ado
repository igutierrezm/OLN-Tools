* ¿Es un nini?
capture program drop gen_casen_nini
program define gen_casen_nini
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local e "_estudiante"
  local i "_inactivo"
  local j "_joven"
  select_casen, varlist("_nini") año(`año')
  ol_generate, varlist("`e' `i' `j'") db("casen") año(`año')
  generate _nini =       (`e' == 00) & (`i' == 01) & (`j' == 01)
  replace  _nini = 1e5 if (`e' == 1e5) & (`i' == 1e5) & (`j' == 1e5)
  * Etiquetado
  label variable _nini "¿Es un nini?"
end
