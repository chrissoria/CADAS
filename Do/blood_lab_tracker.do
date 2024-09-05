clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}
}

if `country' == 0 {
    import delimited "../PR_in/All_Excel_Blood_Results.csv"
}
else if `country' == 1 {
    import delimited "../DR_in/All_Excel_Blood_Results.csv"
}

drop fechadenacimiento cantidaddetubosrojoscongelados

*replace b_particid = "9" if b_particid == "R"

*for DR
gen b_country = `country'

gen b_country_str = string(b_country, "%12.0f")

gen b_clustid_str = string(cluster, "%12.0f")
replace b_clustid_str = cond(strlen(b_clustid_str) == 1, "0" + b_clustid_str, b_clustid_str)

gen b_houseid_str = string(houseid, "%03.0f")
replace b_houseid_str = cond(strlen(b_houseid_str) == 1, "00" + b_houseid_str, b_houseid_str)
replace b_houseid_str = cond(strlen(b_houseid_str) == 2, "0" + b_houseid_str, b_houseid_str)

gen b_particid_str = participante
replace b_particid_str = cond(strlen(b_particid_str) == 1, "0" + b_particid_str, b_particid_str)

gen pid = b_country_str + b_clustid_str + b_houseid_str + b_particid_str
gen hhid = b_country_str + b_clustid_str + b_houseid_str
drop b_country_str b_clustid_str b_houseid_str b_particid_str

sort pid
quietly by pid:  gen dup = cond(_N==1,0,_n)
tab dup

if `country' == 1 {
	merge m:m pid using "Cog_merged.dta" , keepusing(c_date c_clustid c_houseid c_particid)
}

replace llegadoallabfecha = strtrim(llegadoallabfecha)

drop if llegadoallabfecha == ""

preserve

keep if _merge == 3

export excel using "excel/excel_and_cog.xlsx", replace firstrow(variables)

restore

keep if _merge == 2

capture export excel using "excel/excel_but_no_cog.xlsx", replace firstrow(variables)

clear all

if `country' == 0 {
    use using "../PR_out/sangre_pdf"
}
else if `country' == 1 {
    use using "../DR_out/sangre_pdf"
}

merge m:m pid using "sangre_excel"

drop fechadenacimiento cantidaddetubosrojoscongelados

replace llegadoallabfecha = strtrim(llegadoallabfecha)

drop if llegadoallabfecha == ""

preserve

keep if _merge == 1

capture export excel using "excel/pdf_but_no_excel.xlsx", replace firstrow(variables)

restore

keep if _merge == 2

export excel using "excel/excel_but_no_pdf.xlsx", replace firstrow(variables)

exit, clear
