*! 1.0.3 Iván Gutiérrez 07dec2016
* Extensión del comando reshape wide. Ahora j() puede ser un varlist
version 14.1
capture program drop reshape2
program define reshape2, rclass
syntax varlist(max = 1), i(string) j(string)

* Selección
keep `varlist' `i' `j'

* Inversión de j()
local k ""
local Nj : word count of `j' - 1
forvalues m = `Nj'(-1)1 {
  local str : word `m' of `j'
  local k = "`k' `str'"
}
local j "`k'"

* Ordenación
local i0 "`i' `j'"
foreach var in `j' {
  rename `varlist'* `varlist'*_
  local i0 = subinstr("`i0'", "`var'", "", 1)
  reshape wide `varlist'_*, i(`i0') j(`var')
}
order `i' `varlist'*

end
