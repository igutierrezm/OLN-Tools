* Extensión del comando decode: añade la opción replace
capture program drop decode2
program define decode2, rclass
  version 14.1
  syntax varlist [, replace generate(string)]
  * Objetos temporales
  tempvar temp
  * Codificación, según valor de `replace'
  if ("`replace'" == "") decode `varlist', generate(`generate')
  else {
    foreach var in `varlist' {
      tostring `var', replace
      capture decode `var', generate(`temp')
      if (_rc == 0) {
        drop `var'
        rename `temp' `var'
      }
    }
  }
end
