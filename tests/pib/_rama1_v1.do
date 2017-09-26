use "C:\Users\observatorio02\Documents\datos\pib", clear
gen_pib_rama1_v1
keep sector _rama1_v1
duplicates drop sector _rama1_v1, force

