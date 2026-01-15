clear all

set more off

capture log close



capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"

capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"



if `"`user'"' == "Chris" {

local path = "/Users/chrissoria/documents/CADAS/Data"

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

local country  = 0



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



* ==============================================================================
* SECTION 1: Clean Roster_Parent.csv (parent level)
* ==============================================================================

clear all

set more off

capture log close



insheet using Roster_Parent.csv , names

* Any globalrecordid codes that need to be dropped should be added to the line below
gen drop = "drop" if inlist(globalrecordid, "PLACEHOLDER_UUID_HERE")

preserve

drop if drop == "drop"

drop drop

export delimited Roster_Parent , replace

restore

* Keep dropped records to cascade deletions
keep if drop == "drop"

keep globalrecordid

* Rename to fkey so it matches MainHousehold.fkey for merge
rename globalrecordid fkey

save dropsheet_parent.dta , replace

clear



* ==============================================================================
* SECTION 2: Cascade to MainHousehold.csv
* ==============================================================================

insheet using MainHousehold.csv , names

* Any additional MainHousehold drops (not cascaded from parent) go here
gen drop = "drop" if inlist(globalrecordid, "PLACEHOLDER_UUID_HERE")

merge m:1 fkey using dropsheet_parent.dta

* Mark cascaded records for dropping
replace drop = "drop" if _merge == 3

keep if _merge ~= 2

preserve

keep if drop == "drop"

keep globalrecordid

* Rename to fkey so it matches child tables' fkey for merge
rename globalrecordid fkey

save dropsheet_main.dta , replace

restore

drop if drop == "drop"

drop drop _merge

export delimited MainHousehold , replace

clear



* ==============================================================================
* SECTION 3: Cascade to Participants.csv
* ==============================================================================

insheet using Participants.csv , names

duplicates drop globalrecordid, force

* Any Participant-level drops go here
gen drop = "drop" if inlist(globalrecordid, "PLACEHOLDER_UUID_HERE")

merge m:1 fkey using dropsheet_main.dta

* Mark cascaded records for dropping
replace drop = "drop" if _merge == 3

keep if _merge ~= 2

drop if drop == "drop"

drop drop _merge

export delimited Participants , replace

clear



* ==============================================================================
* SECTION 4: Cascade to NonParticipants.csv
* ==============================================================================

insheet using NonParticipants.csv , names

duplicates drop globalrecordid, force

* Any NonParticipant-level drops go here
gen drop = "drop" if inlist(globalrecordid, "PLACEHOLDER_UUID_HERE")

merge m:1 fkey using dropsheet_main.dta

* Mark cascaded records for dropping
replace drop = "drop" if _merge == 3

keep if _merge ~= 2

drop if drop == "drop"

drop drop _merge

export delimited NonParticipants , replace

clear



* ==============================================================================
* SECTION 5: Cascade to NonResidentChildren.csv
* ==============================================================================

insheet using NonResidentChildren.csv , names

duplicates drop globalrecordid, force

* Any NonResidentChildren-level drops go here
gen drop = "drop" if inlist(globalrecordid, "PLACEHOLDER_UUID_HERE")

merge m:1 fkey using dropsheet_main.dta

* Mark cascaded records for dropping
replace drop = "drop" if _merge == 3

keep if _merge ~= 2

drop if drop == "drop"

drop drop _merge

export delimited NonResidentChildren , replace

clear



* ==============================================================================
* SECTION 6: Clean up dropsheets
* ==============================================================================

erase dropsheet_parent.dta

erase dropsheet_main.dta

clear



* ==============================================================================
* SECTION 7: Generate duplicates report
* Combine all roster surveys to identify duplicate PIDs
* ==============================================================================

* Load MainHousehold (has household-level IDs)
insheet using MainHousehold.csv, names

rename globalrecordid globalrecordid_main

save MainHousehold_temp.dta, replace

clear



* Load Participants and merge with MainHousehold
insheet using Participants.csv, names

rename globalrecordid globalrecordid_partic

rename fkey globalrecordid_main

merge m:1 globalrecordid_main using MainHousehold_temp.dta

drop _merge

save roster_merged_temp.dta, replace

clear



* Build PID for participants
use roster_merged_temp.dta

replace r_country = 0

gen r_country_str = string(r_country, "%12.0f")



gen r_clustid_str = string(r_clustid, "%12.0f")

replace r_clustid_str = cond(strlen(r_clustid_str) == 1, "0" + r_clustid_str, r_clustid_str)



gen r_houseid_str = string(r_houseid, "%03.0f")

replace r_houseid_str = cond(strlen(r_houseid_str) == 1, "00" + r_houseid_str, r_houseid_str)

replace r_houseid_str = cond(strlen(r_houseid_str) == 2, "0" + r_houseid_str, r_houseid_str)



gen pr_person_number_str = string(pr_person_number, "%02.0f")

replace pr_person_number_str = cond(strlen(pr_person_number_str) == 1, "0" + pr_person_number_str, pr_person_number_str)



gen pid = r_country_str + r_clustid_str + r_houseid_str + pr_person_number_str

replace pid = "." if strpos(pid, ".") > 0



gen hhid = r_country_str + r_clustid_str + r_houseid_str

replace hhid = "." if strpos(hhid, ".") > 0



* Identify duplicates
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



order pid globalrecordid_partic globalrecordid_main



* Export data to Excel

export excel using "`path'/PR_out/duplicates/roster_duplicates.xlsx", replace firstrow(variables)



* Clean up temporary files
erase MainHousehold_temp.dta

erase roster_merged_temp.dta

clear



exit

