capture program drop gen_ene_dur_emp
program define gen_ene_dur_emp, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_dur_emp"
  generate `var' = (ano_encuesta - b17_ano) + (mes_encuesta - b17_mes) / 12
  replace  `var' = (ano_encuesta - b17_ano)           if (b17_mes ==  999)
  replace  `var' = `var' + (mes_encuesta - 12) / 12   if (b17_mes ==  999)
  replace  `var' = max(`var', 0)
  replace  `var' = .                                  if (b17_ano == 9999)

  * Etiquetado
  label variable `var' "Duración empleo (en años)"
end
