clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

local country = 1

*Change the filepath name here to the folder containing the data and output folders
*local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

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
    insheet using "../PR_in/SANGRE/Sangre EPI7 to CSV all.csv", clear
}
else if `country' == 1 {
    insheet using "../DR_in/SANGRE/Sangre EPI7 to CSV all.csv", clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/SANGRE/Sangre EPI7 to CSV all.csv", clear
}

*for DR
gen sa_country = `country'

gen sa_country_str = string(sa_country, "%12.0f")

gen sa_clustid_str = string(sa_clustid, "%12.0f")
replace sa_clustid_str = cond(strlen(sa_clustid_str) == 1, "0" + sa_clustid_str, sa_clustid_str)

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
    save "../PR_in/SANGRE/Sangre_EPI7.dta", replace
}
else if `country' == 1 {
    save "../DR_in/SANGRE/Sangre_EPI7.dta", replace
}
else if `country' == 2 {
    save "../CUBA_in/SANGRE/Sangre_EPI7.dta", replace
}
******************************************************************************************************************

save sangre_full, replace
******************************************************************************************************************
if `country' == 0 {
    insheet using "../PR_in/SANGRE/SANGRE PDF TO CSV.csv", clear
}
else if `country' == 1 {
    insheet using "../DR_in/SANGRE/SANGRE PDF TO CSV.csv", clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/SANGRE/SANGRE PDF TO CSV.csv", clear
}

*for DR
gen sa_country = `country'

gen sa_country_str = string(sa_country, "%12.0f")

gen sa_clustid_str = string(sa_clusterid, "%12.0f")
replace sa_clustid_str = cond(strlen(sa_clustid_str) == 1, "0" + sa_clustid_str, sa_clustid_str)

gen sa_houseid_str = string(sa_houseid, "%03.0f")
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 1, "00" + sa_houseid_str, sa_houseid_str)
replace sa_houseid_str = cond(strlen(sa_houseid_str) == 2, "0" + sa_houseid_str, sa_houseid_str)

gen sa_particid_str = string(sa_personid, "%12.0f")
replace sa_particid_str = cond(strlen(sa_particid_str) == 1, "0" + sa_particid_str, sa_particid_str)

gen pid = sa_country_str + sa_clustid_str + sa_houseid_str + sa_particid_str
gen hhid = sa_country_str + sa_clustid_str + sa_houseid_str
drop sa_country_str sa_clustid_str sa_houseid_str sa_particid_str

unab vlist : _all
sort `vlist'
quietly by `vlist':  gen dup = cond(_N==1,0,_n)
tab dup
drop if dup>1

rename dup pdfdup

gen in_pdf = 1

if `country' == 0 {
    save "../PR_in/SANGRE/Sangre_PDF.dta", replace
}
else if `country' == 1 {
    save "../DR_in/SANGRE/Sangre_PDF.dta", replace
}
else if `country' == 2 {
    save "../CUBA_in/SANGRE/Sangre_PDF.dta", replace
}
******************************************************************************************************************

merge m:m pid using sangre_full
drop _merge
save sangre_full,replace
******************************************************************************************************************
clear all

if `country' == 0 {
    import delimited "../PR_in/SANGRE/Sangre Excel 2,6,8,7,9,79.csv", varnames(7)
}
else if `country' == 1 {
    import delimited "../DR_in/SANGRE/Sangre Excel 2,6,8,7,9,79.csv", varnames(7)
}
else if `country' == 2 {
    import delimited "../CUBA_in/SANGRE/Sangre Excel 2,6,8,7,9,79.csv", varnames(7)
}

*replace b_particid = "9" if b_particid == "R"

*for DR
gen b_country = `country'

gen b_country_str = string(b_country, "%12.0f")

gen b_clustid_str = string(b_clustid, "%12.0f")
replace b_clustid_str = cond(strlen(b_clustid_str) == 1, "0" + b_clustid_str, b_clustid_str)

gen b_houseid_str = string(b_houseid, "%03.0f")
replace b_houseid_str = cond(strlen(b_houseid_str) == 1, "00" + b_houseid_str, b_houseid_str)
replace b_houseid_str = cond(strlen(b_houseid_str) == 2, "0" + b_houseid_str, b_houseid_str)

gen b_particid_str = b_particid
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
    save "../PR_in/SANGRE/Sangre_Excel.dta", replace
}
else if `country' == 1 {
    save "../DR_in/SANGRE/Sangre_Excel.dta", replace
}
else if `country' == 2 {
    save "../CUBA_in/SANGRE/Sangre_Excel.dta", replace
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

exit, clear