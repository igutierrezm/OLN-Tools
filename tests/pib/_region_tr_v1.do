use "C:\Users\observatorio02\Documents\datos\pib", clear
gen_pib_region_tr_v1
keep region _region_tr_v1
duplicates drop region _region_tr_v1, force

