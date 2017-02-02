* Verifica la igualdad entre dos variables
capture program drop expect_equal
program define expect_equal, rclass
	version 14.1
	syntax, expected(string) observed(string) id(string)
  forvalues i = 1(1)`c(N)' {
		if (`observed'[`i'] != `expected'[`i', 1]) {
			display as error "    `id' - error en la línea `i'"
		}
	}
end
