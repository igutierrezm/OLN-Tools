capture program drop gen_ene_razon_inactividad
program define gen_ene_razon_inactividad, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Mutación
  local output "_razon_inactividad"
  # delimit ;
    recode e9
      (03         =   1 "Cuidado de hijos o terceros")
      (11         =   2 "Quehaceres del hogar")
      (04         =   3 "Estudiante")
      (08 10      =   4 "Enfermedad o discapacidad")
      (15/17      =   5 "Percepción negativa del mercado laboral")
      (21         =   6 "No tiene interés")
      (05/07      =   7 "Tiene otra fuente de ingresos")
      (01/02      =   8 "Iniciadores")
      (nonmissing =   9 "Otra razón")
      (missing    = 1e5 "ns/nr"),
      generate(`output');
  # delimit cr
end
