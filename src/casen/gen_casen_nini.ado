* ¿Es un nini?
capture program drop gen_casen_nini
program define gen_casen_nini
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  select_casen, varlist("_nini") año(`año')
  ol_generate, varlist("_estudiante _joven _ocupado") db("casen") año(`año')
  generate _nini = (_joven == 1) & (_estudiante == 0) & (_ocupado == 0)
  replace  _nini = .a if (_joven == .a) & (_estudiante == .a) & (_ocupado == .a)
  * Etiquetado
  label variable _nini "¿Es un nini?"
end
