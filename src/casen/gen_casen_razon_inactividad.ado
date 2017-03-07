capture program drop gen_casen_razon_inactividad
program define gen_casen_razon_inactividad
  version 14.1
  syntax, año(string) [mes(string) from(string)]
  * Mutación
  local var "_razon_inactividad"
	if inrange(`año', 2011, 2015) {
		# delimit ;
			recode o7r1
				(3/5    =  1 "Cuidado de hijos o terceros")
				(10     =  2 "Quehaceres del hogar")
				(11     =  3 "Estudiante")
				(6      =  4 "Enfermedad o discapacidad")
				(7/9 14 =  5 "Percepción negativa del mercado laboral")
				(16     =  6 "No tiene interés")
				(12/13  =  7 "Tiene otra fuente de ingresos")
				(1/2    =  8 "Iniciadores")
				(15 17  =  9 "Otra razón")
        (else   = 1e5 "ns/nr"),
				generate(`var');
		# delimit cr
	}
	if (`año' == 2009) {
		# delimit ;
			recode o6
				(3/5            =  1 "Cuidado de hijos o terceros")
				(7              =  2 "Quehaceres del hogar")
				(17             =  3 "Estudiante")
				(16             =  4 "Enfermedad o discapacidad")
				(10 12/13 15    =  5 "Percepción negativa del mercado laboral")
				(20             =  6 "No tiene interés")
				(18/19          =  7 "Tiene otra fuente de ingresos")
				(1/2            =  8 "Iniciadores")
				(6 8 9 11 14 21 =  9 "Otra razón")
        (else           = 1e5 "ns/nr"),
				generate(`var');
		# delimit cr
	}
	if (`año' == 2006) {
		# delimit ;
			recode o6
				(3/4            =  1 "Cuidado de hijos o terceros")
				(6              =  2 "Quehaceres del hogar")
				(16             =  3 "Estudiante")
				(15             =  4 "Enfermedad o discapacidad")
				(9 11 12 14     =  5 "Percepción negativa del mercado laboral")
				(19             =  6 "No tiene interés")
				(17/18          =  7 "Tiene otra fuente de ingresos")
				(1/2            =  8 "Iniciadores")
				(5 7 8 10 13 20 =  9 "Otra razón")
        (else           = 1e5 "ns/nr"),
				generate(`var');
		# delimit cr
	}

	* Etiquetado
  label variable `var' "Razón de inactividad"
end
