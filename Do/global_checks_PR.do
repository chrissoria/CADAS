clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"\
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

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

* Set translation folder path based on language
if `"$language"' == "E" {
    if `country' == 0 {
        local trans_folder "translation_PR/"
    }
    else if `country' == 1 {
        local trans_folder "translation_DR/"
    }
    else if `country' == 2 {
        local trans_folder "translation_CUBA/"
    }
}
else {
    local trans_folder ""
}

local drop_not_resumen = "no"
display "`drop_not_resumen'"

* Use resumen.dta and resumen_pid.dta created by Resumen.do
* (removed redundant Excel import that was overwriting the processed resumen files)

use door_merged_all
drop pid hhid
*make fixes here
gen d_country_str = string(d_country, "%12.0f")

gen d_clustid_str = string(d_clustid, "%12.0f")
replace d_clustid_str = cond(strlen(d_clustid_str) == 1, "0" + d_clustid_str, d_clustid_str)

gen d_houseid_str = string(d_houseid, "%03.0f")
replace d_houseid_str = cond(strlen(d_houseid_str) == 1, "00" + d_houseid_str, d_houseid_str)
replace d_houseid_str = cond(strlen(d_houseid_str) == 2, "0" + d_houseid_str, d_houseid_str)

gen d_particid_str = string(d_particid, "%12.0f")

gen pid = d_particid_str + d_country_str + d_clustid_str + d_houseid_str
replace pid = "." if strpos(pid, ".") > 0

gen hhid = d_country_str + d_clustid_str + d_houseid_str
replace hhid = "." if strpos(hhid, ".") > 0

drop d_particid_str d_country_str d_clustid_str d_houseid_str
capture drop globalrecordid1

sort d_clustid d_7_1

export excel using "excel/puerta.xlsx", replace firstrow(variables)

save door_merged_all.dta, replace
use rosters_participants
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force

drop pid hhid
gen r_country_str = string(r_country, "%12.0f")

gen r_clustid_str = string(r_clustid, "%12.0f")
replace r_clustid_str = cond(strlen(r_clustid_str) == 1, "0" + r_clustid_str, r_clustid_str)

gen r_houseid_str = string(r_houseid, "%03.0f")
replace r_houseid_str = cond(strlen(r_houseid_str) == 1, "00" + r_houseid_str, r_houseid_str)
replace r_houseid_str = cond(strlen(r_houseid_str) == 2, "0" + r_houseid_str, r_houseid_str)

gen r_particid_str = string(pr_person_number, "%12.0f")
replace r_particid_str = cond(strlen(r_particid_str) == 1, "0" + r_particid_str, r_particid_str)

gen pid = r_country_str + r_clustid_str + r_houseid_str + r_particid_str
gen hhid = r_country_str + r_clustid_str + r_houseid_str
drop r_country_str r_clustid_str r_houseid_str r_particid_str

  
 duplicates report pid
 *this older version of stata doesn't have an easy way to identify duplicate personid, so I'll do it manually
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
 save rosters_participants.dta,replace
 
gen is_duplicate = pid[_n] == pid[_n-1]

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

* Export data to Excel
capture export excel using "duplicates/roster_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
use `trans_folder'Socio
* because the id's were entered in incorrectly in the resumen, we'll have to match that incorrect ID in the data
replace s_particid = 2 if globalrecordid == "f1f59f5f-83b5-49a0-bca7-e7eccd818b25"
replace s_particid = 1 if globalrecordid == "f084cb1f-b4eb-4115-8a79-e11ee6038429"


drop pid
drop hhid
 duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
gen s_country_str = string(s_country, "%12.0f")

gen s_clustid_str = string(s_clustid, "%12.0f")
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)

gen s_houseid_str = string(s_houseid, "%03.0f")
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)

gen s_particid_str = string(s_particid, "%12.0f")
replace s_particid_str = cond(strlen(s_particid_str) == 1, "0" + s_particid_str, s_particid_str)

gen pid = s_country_str + s_clustid_str + s_houseid_str + s_particid_str
gen hhid = s_country_str + s_clustid_str + s_houseid_str
drop s_country_str s_clustid_str s_houseid_str s_particid_str

merge m:m pid using resumen_pid

capture gen socio_in_resumen = "Not in Resumen" if _merge == 1
replace socio_in_resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid socio_in_resumen

if "`drop_not_resumen'" == "yes" {
    drop if socio_in_resumen == "Not in Resumen"
}

log using "/Users/chrissoria/documents/CADAS/Data/PR_out/logs/SocioOnlyMissing", text replace


local missvarlist

foreach v of varlist * {
    display "Processing variable: `v'"
    capture confirm string variable `v'
    if _rc == 0 {
        quietly count if `v' == ""
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
    else {
        quietly count if missing(`v')
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
}

display "Variables with more than 5 missing values:"
display "`missvarlist'"

foreach v of local missvarlist {
	codebook `v'
}

log close
 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
export excel using "`trans_folder'excel/socio.xlsx", replace firstrow(variables)
 save `trans_folder'Socio.dta, replace
  
gen is_duplicate = pid[_n] == pid[_n-1]

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
* Export data to Excel
export excel using "duplicates/socio_duplicates.xlsx", replace firstrow(variables)
 
 clear all

use `trans_folder'Cog

merge m:m pid using resumen_pid

capture gen cog_in_resumen = "Not in Resumen" if _merge == 1
replace cog_in_resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid cog_in_resumen

if "`drop_not_resumen'" == "yes" {
    drop if cog_in_resumen == "Not in Resumen"
}

export excel using "`trans_folder'excel/cognitive.xlsx", replace firstrow(variables)

save `trans_folder'cog.dta, replace

clear all

 use `trans_folder'Phys
 drop pid
 drop hhid
 
 duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
* because the id's were entered in incorrectly in the resumen, we'll have to match that incorrect ID in the data
replace p_particid = 2 if globalrecordid == "5cec9bb3-f0af-44b2-8a0a-a2415bace46d"
replace p_particid = 1 if globalrecordid == "b2dfeca1-c7d0-4c38-a45c-747a4cbc807b"
 
 gen p_country_str = string(p_country, "%12.0f")

gen p_clustid_str = string(p_clustid, "%12.0f")
replace p_clustid_str = cond(strlen(p_clustid_str) == 1, "0" + p_clustid_str, p_clustid_str)

gen p_houseid_str = string(p_houseid, "%03.0f")
replace p_houseid_str = cond(strlen(p_houseid_str) == 1, "00" + p_houseid_str, p_houseid_str)
replace p_houseid_str = cond(strlen(p_houseid_str) == 2, "0" + p_houseid_str, p_houseid_str)

gen p_particid_str = string(p_particid, "%12.0f")
replace p_particid_str = cond(strlen(p_particid_str) == 1, "0" + p_particid_str, p_particid_str)

gen pid = p_country_str + p_clustid_str + p_houseid_str + p_particid_str
gen hhid = p_country_str + p_clustid_str + p_houseid_str
drop p_country_str p_clustid_str p_houseid_str p_particid_str

drop if pid == "00000000"

merge m:m pid using resumen_pid

capture gen phys_in_resumen = "Not in Resumen" if _merge == 1
replace phys_in_resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid phys_in_resumen

if "`drop_not_resumen'" == "yes" {
    drop if phys_in_resumen == "Not in Resumen"
}


log using "/Users/chrissoria/documents/CADAS/Data/PR_out/logs/PhysOnlyMissing", text replace


local missvarlist

foreach v of varlist * {
    display "Processing variable: `v'"
    capture confirm string variable `v'
    if _rc == 0 {
        quietly count if `v' == ""
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
    else {
        quietly count if missing(`v')
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
}

display "Variables with more than 5 missing values:"
display "`missvarlist'"

foreach v of local missvarlist {
	codebook `v'
}

log close
export excel using "`trans_folder'excel/examen_fisico.xlsx", replace firstrow(variables)
save `trans_folder'Phys.dta, replace

 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
 gen is_duplicate = pid[_n] == pid[_n-1]

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

* Export data to Excel
export excel using "duplicates/phys_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
use `trans_folder'Infor

* because the id's were entered in incorrectly in the resumen, we'll have to match that incorrect ID in the data
replace i_particid = 2 if globalrecordid == "a027b10b-5295-4c1e-b4e0-1148c2715c04"
replace i_particid = 1 if globalrecordid == "88d87a97-cc13-4ab4-a236-21d5280a7dc2"
 
 drop pid hhid
 
 gen i_country_str = string(i_country, "%12.0f")

gen i_clustid_str = string(i_clustid, "%12.0f")
replace i_clustid_str = cond(strlen(i_clustid_str) == 1, "0" + i_clustid_str, i_clustid_str)

gen i_houseid_str = string(i_houseid, "%03.0f")
replace i_houseid_str = cond(strlen(i_houseid_str) == 1, "00" + i_houseid_str, i_houseid_str)
replace i_houseid_str = cond(strlen(i_houseid_str) == 2, "0" + i_houseid_str, i_houseid_str)

gen i_particid_str = string(i_particid, "%12.0f")
replace i_particid_str = cond(strlen(i_particid_str) == 1, "0" + i_particid_str, i_particid_str)

gen pid = i_country_str + i_clustid_str + i_houseid_str + i_particid_str
gen hhid = i_country_str + i_clustid_str + i_houseid_str

drop i_country_str i_clustid_str i_houseid_str i_particid_str

drop if pid == "00000001"

merge m:m pid using resumen_pid

capture gen infor_in_resumen = "Not in Resumen" if _merge == 1
replace infor_in_resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid infor_in_resumen

if "`drop_not_resumen'" == "yes" {
    drop if infor_in_resumen == "Not in Resumen"
}

log using "/Users/chrissoria/documents/CADAS/Data/PR_out/logs/InforOnlyMissing", text replace

local missvarlist

foreach v of varlist * {
    display "Processing variable: `v'"
    capture confirm string variable `v'
    if _rc == 0 {
        quietly count if `v' == ""
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
    else {
        quietly count if missing(`v')
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
}

display "Variables with more than 5 missing values:"
display "`missvarlist'"

foreach v of local missvarlist {
	codebook `v'
}

log close
 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate

export excel using "`trans_folder'excel/informante.xlsx", replace firstrow(variables)
save `trans_folder'Infor.dta, replace
 
 gen is_duplicate = pid[_n] == pid[_n-1]

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

export excel using "duplicates/informant_duplicates.xlsx", replace firstrow(variables)

clear all

use `trans_folder'Household

drop if inlist(globalrecordid, "517e61c3-f612-41b8-8038-656a367b177d", "fea7bf68-4b53-41dc-8a3a-170dc287be69", "f810981c-8684-4325-9678-c0e6bf660389")
 
 log using "/Users/chrissoria/documents/CADAS/Data/PR_out/logs/HouseholdOnlyMissing", text replace

 

local missvarlist

foreach v of varlist * {
    display "Processing variable: `v'"
    capture confirm string variable `v'
    if _rc == 0 {
        quietly count if `v' == ""
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
    else {
        quietly count if missing(`v')
        if r(N) > 5 {
            local missvarlist `missvarlist' `v'
        }
    }
}

display "Variables with more than 5 missing values:"
display "`missvarlist'"


foreach v of local missvarlist {
    codebook `v'
}

log close
 
 duplicates report hhid
 sort hhid
 gen is_duplicate = hhid[_n] == hhid[_n-1]
 list if is_duplicate

drop is_duplicate

merge m:m hhid using resumen_hhid

capture gen household_in_resumen = string(_merge)
capture replace household_in_resumen = string(_merge)
replace household_in_resumen = "Not in Resumen" if _merge == 1
replace household_in_resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

export excel using "`trans_folder'excel/familiar.xlsx", replace firstrow(variables)
save `trans_folder'Household.dta, replace

gen is_duplicate = hhid[_n] == hhid[_n-1]

* Mark all duplicate observations with 1 and non-duplicates with 0
duplicates tag hhid, gen(duplicate_tag)

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

* Export data to Excel
capture export excel using "duplicates/Household_duplicates.xlsx", replace firstrow(variables)

clear all

 *Next, I will merge each child with the parent and see if things are matching
 *Parents match to child with the fkey to globalrecordid, so I will need to rename the fkey to globalrecordid in the child


*next, I want to find out if we have the right amount of cog scoring and cog surveys

cd "/Users/chrissoria/documents/CADAS/Data/PR_out"
use `trans_folder'Cog_Scoring

*for no, I will do m:m because I have't been able to pin down which unique cases are the true/correct ones
merge m:m pid using `trans_folder'Cog, force

keep if _merge != 3

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

export excel using "duplicates/no_coincidencias_cog.xlsx", replace firstrow(variables)

list

****************************************
* SUMMARY STATISTICS LOG
****************************************

log using "/Users/chrissoria/documents/CADAS/Data/PR_out/logs/global_checks_summary", text replace

display ""
display "========================================================"
display "       GLOBAL CHECKS SUMMARY - PUERTO RICO"
display "========================================================"
display ""

* Count unique PIDs in each domain
clear all

* COG
use `trans_folder'Cog, clear
duplicates drop pid, force
count
local cog_n = r(N)

* SOCIO
use `trans_folder'Socio, clear
duplicates drop pid, force
count
local socio_n = r(N)

* PHYS
use `trans_folder'Phys, clear
duplicates drop pid, force
count
local phys_n = r(N)

* INFOR
use `trans_folder'Infor, clear
duplicates drop pid, force
count
local infor_n = r(N)

* HOUSEHOLD (by hhid, then map to pid)
use `trans_folder'Household, clear
duplicates drop hhid, force
count
local household_n = r(N)

* RESUMEN (tracker)
use resumen_pid, clear
duplicates drop pid, force
count
local resumen_n = r(N)

display ""
display "--------------------------------------------------------"
display "       NON-DUPLICATE PID COUNTS BY DOMAIN"
display "--------------------------------------------------------"
display ""
display "  Cognitive (Cog):      `cog_n'"
display "  Sociodemographic:     `socio_n'"
display "  Physical Exam:        `phys_n'"
display "  Informant:            `infor_n'"
display "  Household (hhid):     `household_n'"
display ""
display "  Resumen (Tracker):    `resumen_n'"
display ""

* Build complete cases dataset - PIDs that exist in all 5 domains
* Start with resumen as base
use resumen_pid, clear
duplicates drop pid, force
keep pid
gen in_resumen = 1

* Create hhid from pid (first 6 characters: country + cluster + house)
gen hhid = substr(pid, 1, 6)

* Merge with Cog (create tempfile with unique PIDs first)
preserve
use `trans_folder'Cog, clear
keep pid
duplicates drop pid, force
tempfile cog_unique
save `cog_unique'
restore
merge 1:1 pid using `cog_unique', keep(master match)
gen in_cog = (_merge == 3)
drop _merge

* Merge with Socio (create tempfile with unique PIDs first)
preserve
use `trans_folder'Socio, clear
keep pid
duplicates drop pid, force
tempfile socio_unique
save `socio_unique'
restore
merge 1:1 pid using `socio_unique', keep(master match)
gen in_socio = (_merge == 3)
drop _merge

* Merge with Phys (create tempfile with unique PIDs first)
preserve
use `trans_folder'Phys, clear
keep pid
duplicates drop pid, force
tempfile phys_unique
save `phys_unique'
restore
merge 1:1 pid using `phys_unique', keep(master match)
gen in_phys = (_merge == 3)
drop _merge

* Merge with Infor (create tempfile with unique PIDs first)
preserve
use `trans_folder'Infor, clear
keep pid
duplicates drop pid, force
tempfile infor_unique
save `infor_unique'
restore
merge 1:1 pid using `infor_unique', keep(master match)
gen in_infor = (_merge == 3)
drop _merge

* Merge with Household (by hhid)
merge m:1 hhid using `trans_folder'Household, keepusing(hhid) keep(master match)
gen in_household = (_merge == 3)
drop _merge

* Calculate complete cases (present in all 5 domains)
gen complete = (in_cog == 1 & in_socio == 1 & in_phys == 1 & in_infor == 1 & in_household == 1)

* Count complete cases
count if complete == 1
local complete_n = r(N)

* Calculate percentage
local complete_pct = (`complete_n' / `resumen_n') * 100

display "--------------------------------------------------------"
display "       COMPLETE CASES ANALYSIS"
display "--------------------------------------------------------"
display ""
display "  Complete cases (in all 5 domains):  `complete_n'"
display "  Total cases in Resumen:             `resumen_n'"
display "  Completion rate:                    " %5.1f `complete_pct' "%"
display ""

* Additional breakdown - cases missing each component
count if in_cog == 0
local miss_cog = r(N)
count if in_socio == 0
local miss_socio = r(N)
count if in_phys == 0
local miss_phys = r(N)
count if in_infor == 0
local miss_infor = r(N)
count if in_household == 0
local miss_household = r(N)

display "--------------------------------------------------------"
display "       MISSING COMPONENTS (of Resumen cases)"
display "--------------------------------------------------------"
display ""
display "  Missing Cognitive:        `miss_cog'"
display "  Missing Sociodemographic: `miss_socio'"
display "  Missing Physical Exam:    `miss_phys'"
display "  Missing Informant:        `miss_infor'"
display "  Missing Household:        `miss_household'"
display ""
display "========================================================"
display ""

log close

display "Summary log saved to: /Users/chrissoria/documents/CADAS/Data/PR_out/logs/global_checks_summary.log"
