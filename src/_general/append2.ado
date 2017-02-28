* Extensión del comando append: ahora combinará las etiqutas de valores
capture program drop append2
program define append2
  version 14.1
  syntax using
  quietly : label dir
  local names = "`r(names)'"
  foreach var in `names' {
  	label copy `var' __`var'
    label drop `var'
  }
  append `using'
  foreach var in `names' {
    capture : labvalcombine `var' __`var', lblname(`var')
    if (_rc != 0) {
      label copy __`var' `var', replace
      capture : label values `var' `var'
    }
    label drop __`var'
  }
end
