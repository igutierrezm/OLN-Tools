/***

#### Title
**gen_ene_cise_v1** - Categoría ocupacional (agregación estándar)

#### Syntax
gen_ene_cise_v1, año(string) mes(string) [options]

\| Left-aligned \| Center-aligned \| Right-aligned \| _newline
\| :---         \|     :---:      \|          ---: \| _newline
\| git status   \| git status     \| git status    \| _newline
\| git diff     \| git diff       \| git diff      \| _newline


***/
capture program drop gen_ene_cise_v1
program define gen_ene_cise_v1, rclass
  version 14.1
  syntax, año(string) mes(string) [from(string)]
  * Abreviaciones
  local var "_cise_v1"
  * RMutación
  # delimit ;
    recode categoria_ocupacion
      (1    =  1 "Empleadores")
      (2    =  2 "Cuenta Propia")
      (3/6  =  3 "Asalariados")
      (7    =  4 "Familiares no Remunerados")
      (else = .a "ns/nr"),
      generate(`var');
  # delimit cr
  * Etiquetado
  label variable `var' "Categoría ocupacional"
end
