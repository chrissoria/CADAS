clear all 
set more off
capture log close

capture include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/global/home/users/chrissoria/Desktop/Stata_CADAS/Data"
local country = 0

if `country' == 0 {
    cd "`path'/PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_in"
}
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\Data"
local country  = 1

if `country' == 0 {
    cd "`path'/PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_in"
}
}
* Drop duplicate observations (based on globalrecordid3 in duplicates)
clear all 
set more off
capture log close

insheet using InformationDoorParticipants.csv , names

export delimited InformationDoorParticipants , replace
sort fkey
quietly by fkey:  gen dup = cond(_N==1,0,_n)
keep fkey
rename fkey globalrecordid
save dropsheet1.dta , replace
clear

insheet using InformationDoor.csv , names
merge 1:m globalrecordid using dropsheet1.dta
keep if _merge ~= 2
preserve
keep if _merge == 3
keep fkey
rename fkey globalrecordid
save dropsheet2.dta , replace
restore
drop if _merge == 3
drop _merge
export delimited InformationDoor , replace
clear

insheet using Door.csv , names
merge 1:m globalrecordid using dropsheet2.dta
drop if _merge == 3
drop _merge
export delimited Door , replace

erase dropsheet1.dta
erase dropsheet2.dta
clear

* Combine all 3 door surveys (Door, InformationDoor, InformationDoorParticipants) so we can create duplicates excel
insheet using InformationDoorParticipants.csv , names
gsort fkey -d_7_1
by fkey: gen d_particid = _n
rename globalrecordid globalrecordid3
rename fkey globalrecordid1
save InformationDoorParticipants.dta, replace
clear

insheet using InformationDoor.csv, names
rename globalrecordid globalrecordid1
rename fkey globalrecordid
save InformationDoor.dta, replace
clear

insheet using Door.csv, names
save Door.dta, replace

capture drop pid hhid

merge 1:m globalrecordid using "InformationDoor.dta"
drop _merge
save door_merged1.dta,replace
merge m:m globalrecordid1 using "InformationDoorParticipants.dta"
drop _merge
save totaldoormerge.dta, replace

replace d_country = 1
gen d_country_str = string(d_country, "%12.0f")

gen d_clustid_str = string(d_clustid, "%12.0f")
replace d_clustid_str = cond(strlen(d_clustid_str) == 1, "0" + d_clustid_str, d_clustid_str)

gen d_houseid_str = string(d_houseid, "%03.0f")
replace d_houseid_str = cond(strlen(d_houseid_str) == 1, "00" + d_houseid_str, d_houseid_str)
replace d_houseid_str = cond(strlen(d_houseid_str) == 2, "0" + d_houseid_str, d_houseid_str)

gen d_particid_str = string(d_particid, "%12.0f")

gen pid = d_country_str + d_clustid_str + d_houseid_str + d_particid_str
replace pid = "." if strpos(pid, ".") > 0

gen hhid = d_country_str + d_clustid_str + d_houseid_str
replace hhid = "." if strpos(hhid, ".") > 0


duplicates report pid
sort pid
gen is_duplicate = pid[_n] == pid[_n-1]
list if is_duplicate
 * Mark all duplicate observations with 1 and non-duplicates with 0
duplicates tag pid, gen(duplicate_tag)

* Keep all observations with duplicate pid
keep if duplicate_tag == 1

drop duplicate_tag

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

order pid globalrecordid3

* Export data to Excel
capture export excel using "`path'/PR_out/duplicates/door_duplicates.xlsx", replace firstrow(variables)

erase Door.dta
erase InformationDoor.dta
erase door_merged1.dta
erase InformationDoorParticipants.dta
erase totaldoormerge.dta

exit
