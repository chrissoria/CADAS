clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/Sangre.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Sangre.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Sangre.csv", comma names clear
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

if `country' == 0 {
    insheet using "../PR_in/Sangre.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Sangre.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Sangre.csv", comma names clear
}
}

*for DR
gen sa_country = `country'

gen sa_country_str = string(sa_country, "%12.0f")

if `country' == 1 {
	replace sa_clustid = "40" if globalrecordid == "cb4e27bb-9fe6-4712-b56a-7c771f483c5a"
	replace sa_houseid = "" if globalrecordid == "9e152c73-d5ae-4995-a329-74eda8bb0d3c"
}

capture destring sa_clustid, replace
gen sa_clustid_str = string(sa_clustid, "%12.0f")
replace sa_clustid_str = cond(strlen(sa_clustid_str) == 1, "0" + sa_clustid_str, sa_clustid_str)

*writing this in case someone puts in a letter for houseid
if `country' == 1 {
	confirm string variable sa_houseid
}

	if regexm("`:type sa_houseid'", "str") {
		display "sa_houseid is a string variable."
		replace sa_houseid = regexr(sa_houseid, "[^0-9]", "")
		destring sa_houseid, replace
	else {
		display "sa_houseid is not a string variable."
	}

	}
gen sa_houseid_str = string(sa_houseid, "%03.0f")
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 1, "00" + sa_houseid_str, sa_houseid_str)
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 2, "0" + sa_houseid_str, sa_houseid_str)

gen sa_particid_str = string(sa_particid, "%12.0f")
replace sa_particid_str = cond(strlen(sa_particid_str) == 1, "0" + sa_particid_str, sa_particid_str)

gen pid = sa_country_str + sa_clustid_str + sa_houseid_str + sa_particid_str
gen hhid = sa_country_str + sa_clustid_str + sa_houseid_str
drop sa_country_str sa_clustid_str sa_houseid_str sa_particid_str

unab vlist : _all
sort `vlist'
quietly by `vlist':  gen dup = cond(_N==1,0,_n)
tab dup
drop if dup>1
rename dup epi7dup

drop if globalrecordid == "12c89460-75eb-4aee-8a36-31a88c395b70"

gen in_epi7 = 1

if `country' == 0 {
    save "../PR_out/Sangre.dta", replace
}
else if `country' == 1 {
    save "../DR_out/Sangre.dta", replace
}
******************************************************************************************************************

save sangre_full, replace
******************************************************************************************************************
if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}

if `country' == 0 {
    insheet using "../PR_in/All_PDF_Blood_Results_PR.csv", clear
}
else if `country' == 1 {
    insheet using "../DR_in/All_PDF_Blood_Results_DR.csv", clear
}

*for DR
if regexm("`:type sa_houseid'", "str") {
    display "sa_houseid is a string variable."
    * Your code to manipulate sa_houseid as needed
    replace sa_houseid = regexr(sa_houseid, "[^0-9]", "")
    
    destring sa_houseid, replace
else {
    display "sa_houseid is not a string variable."
}

}

gen sa_country = `country'

gen sa_country_str = string(sa_country, "%12.0f")

gen sa_clustid_str = string(sa_clusterid, "%12.0f")
replace sa_clustid_str = cond(strlen(sa_clustid_str) == 1, "0" + sa_clustid_str, sa_clustid_str)

if regexm("`:type sa_houseid'", "str") {
    display "sa_houseid is a string variable."
    replace sa_houseid = regexr(sa_houseid, "[^0-9]", "")
    destring sa_houseid, replace
else {
    display "sa_houseid is not a string variable."
}

}

gen sa_houseid_str = string(sa_houseid, "%03.0f")
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 1, "00" + sa_houseid_str, sa_houseid_str)
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 2, "0" + sa_houseid_str, sa_houseid_str)

gen sa_particid_str = string(sa_personid, "%12.0f")
replace sa_particid_str = cond(strlen(sa_particid_str) == 1, "0" + sa_particid_str, sa_particid_str)

gen pid = sa_country_str + sa_clustid_str + sa_houseid_str + sa_particid_str
gen hhid = sa_country_str + sa_clustid_str + sa_houseid_str
drop sa_country_str sa_clustid_str sa_houseid_str sa_particid_str

save sangre_pdf, replace

unab vlist : _all
sort `vlist'
quietly by `vlist':  gen dup = cond(_N==1,0,_n)
tab dup
drop if dup>1

rename dup pdfdup

gen in_pdf = 1

save sangre_pdf, replace

******************************************************************************************************************

merge m:m pid using sangre_full
drop _merge
save sangre_full,replace
******************************************************************************************************************
clear all

if `country' == 0 {
    import delimited "../PR_in/All_Excel_Blood_Results_PR.csv"
}
else if `country' == 1 {
    import delimited "../DR_in/All_Excel_Blood_Results_DR.csv"
}

*replace b_particid = "9" if b_particid == "R"

*for DR
gen b_country = `country'

gen b_country_str = string(b_country, "%12.0f")

gen b_clustid_str = string(cluster, "%12.0f")
replace b_clustid_str = cond(strlen(b_clustid_str) == 1, "0" + b_clustid_str, b_clustid_str)

if `country' == 1 {
	gen b_houseid_str = string(houseid, "%03.0f")
}
if `country' == 0 {
	gen b_houseid_str = string(casa, "%03.0f")
}
replace b_houseid_str = cond(strlen(b_houseid_str) == 1, "00" + b_houseid_str, b_houseid_str)
replace b_houseid_str = cond(strlen(b_houseid_str) == 2, "0" + b_houseid_str, b_houseid_str)

if `country' == 1 {
	gen b_particid_str = participante
}
if `country' == 0 {
	gen b_particid_str = string(participante)
}
replace b_particid_str = cond(strlen(b_particid_str) == 1, "0" + b_particid_str, b_particid_str)

gen pid = b_country_str + b_clustid_str + b_houseid_str + b_particid_str
gen hhid = b_country_str + b_clustid_str + b_houseid_str
drop b_country_str b_clustid_str b_houseid_str b_particid_str

unab vlist : _all
sort `vlist'
quietly by `vlist':  gen dup = cond(_N==1,0,_n)
tab dup
drop if dup>1

rename dup exceldup

gen in_excel = 1

if `country' == 0 {
    save "../PR_out/Sangre_Excel.dta", replace
}
else if `country' == 1 {
    save "../DR_out/Sangre_Excel.dta", replace
}

******************************************************************************************************************

merge m:m pid using sangre_full
drop _merge
save sangre_full,replace
******************************************************************************************************************

gen epi7_in = "7" if in_epi7 == 1
gen pdf_in = "F" if in_pdf == 1
gen excel_in = "X" if in_excel == 1
replace epi7_in = " " if in_epi7 ~= 1
replace pdf_in = " " if in_pdf ~= 1
replace excel_in = " " if in_excel ~= 1

gen XF7 = excel_in + pdf_in + epi7_in
drop epi7_in pdf_in excel_in

sort pid
quietly by pid:  gen dup = cond(_N==1,0,_n)
tabulate dup

save sangre_full, replace

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

export excel using "excel/sangre.xlsx", replace firstrow(variables)

clear all

use using Sangre_Excel
*drop birthdays and merge with cog for MMSE
capture drop fechadenacimiento
capture drop fechadenac
capture drop v35

merge m:m pid using cog_merged, nogen keep(match master) keepusing(c_MMSEscore)
replace c_MMSEscore = round(c_MMSEscore)

sort pid
gen date_to_WashU = .
label variable date_to_WashU "date to WashU"
order date_to_WashU pid
drop hhid exceldup in_excel b_country
capture drop nolab

save Sangre_MMSE.dta, replace

local current_date : display %tdCCYY-NN-DD daily("`c(current_date)'", "DMY")
export excel using "excel/sangre DR `current_date'.xlsx", firstrow(varlabels) replace

exit, clear
