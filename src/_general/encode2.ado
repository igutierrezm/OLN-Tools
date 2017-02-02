* Extensión del comando encode: añade la opción replace
capture program drop encode2
program define encode2, rclass
  version 14.1
  syntax varlist [, replace generate(string) label(string)]
  * Codificación, según valor de `replace'
  tempvar temp
  if ("`replace'" == "") encode `varlist', generate(`generate') label(`label')
  else {
    foreach var in `varlist' {
      tostring `var', replace
      encode `var', generate(`temp') label(`var')
      drop `var'
      rename `temp' `var'
    }
  }
end
