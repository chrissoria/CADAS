capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

display "User: `user'"

clear all
capture log close

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
    insheet using "../PR_in/Cog_Child.csv", comma names clear
}
else if `country' == 1 {
    cd "`path'/DR_out"
    insheet using "../DR_in/Cog_Child.csv", comma names clear
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
    insheet using "../CUBA_in/Cog_Child.csv", comma names clear
}
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
	insheet using "../PR_in/Cog_Child.csv", comma names clear
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}
}

drop if c_deviceid1 == ""

drop if inlist(globalrecordid, "f7a8bf72-6c00-4da9-817e-1b718f38d0ef", "b86d5d07-5256-4692-bc5d-b584014079e0", "b77d619b-236e-4fb5-8bf5-ffcdcf5a0d7c","bb26033f-fca4-4dd1-9ef9-d71654b46024", "05957905-2edf-48d8-b976-9399e760c24a", "d33d2407-4433-4fb9-8039-4fd922e82185", "229742b0-f963-400b-96ab-c69aa9eedaa6")

* because the id's were entered in incorrectly in the resumen, we'll have to match that incorrect ID in the data
replace c_particid = 2 if globalrecordid == "35b3e974-fbf4-430d-a9ee-867ede9c93c9"
replace c_particid = 1 if globalrecordid == "b7dfe53f-bb6c-422e-a55a-732388e40c69"

if `country' == 0 {
    export delimited using "../PR_in/Cog_Child_cleaned.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Cog_Child_cleaned.csv", replace
}
else if `country' == 2 {
    export delimited using "../CU_in/Cog_Child_cleaned.csv", replace
}


drop if c_interid == 99

gen c_country_str = string(c_country, "%12.0f")

gen c_clustid_str = string(c_clustid, "%12.0f")
replace c_clustid_str = cond(strlen(c_clustid_str) == 1, "0" + c_clustid_str, c_clustid_str)

gen c_houseid_str = string(c_houseid, "%03.0f")
replace c_houseid_str = cond(strlen(c_houseid_str) == 1, "00" + c_houseid_str, c_houseid_str)
replace c_houseid_str = cond(strlen(c_houseid_str) == 2, "0" + c_houseid_str, c_houseid_str)

gen c_particid_str = string(c_particid, "%12.0f")
replace c_particid_str = cond(strlen(c_particid_str) == 1, "0" + c_particid_str, c_particid_str)

gen pid = c_country_str + c_clustid_str + c_houseid_str + c_particid_str
gen hhid = c_country_str + c_clustid_str + c_houseid_str
drop c_country_str c_clustid_str c_houseid_str c_particid_str

log using "`path'/PR_out/logs/CogOnlyMissing", text replace


local missvarlist
foreach v of varlist _all {
    capture confirm string variable `v'
    if _rc == 0 {
        quietly count if `v' == ""
    }
    else {
        quietly count if missing(`v')
    }
    if r(N) > 5 {
        local missvarlist `missvarlist' `v'
    }
}

di "Variables with more than 5 missing values: `missvarlist'"

foreach v of local missvarlist {
    codebook `v'
}

log close
 
 duplicates report pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 sort pid
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
capture export excel using "duplicates/cognitive_duplicates.xlsx", replace firstrow(variables)

clear all


if `country' == 0 {
    insheet using "../PR_in/Cog_Scoring.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Cog_Scoring.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Cog_Scoring.csv", comma names clear
}

if `country' == 0 {
    export delimited using "../PR_in/Cog_Scoring_cleaned.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Cog_Scoring_cleaned.csv", replace
}
else if `country' == 2 {
    export delimited using "../CU_in/Cog_Scoring_cleaned.csv", replace
}

gen cs_country_num = 0
gen cs_country_str = string(cs_country_num, "%12.0f")

gen cs_clustid_str = string(cs_clustid, "%12.0f")
replace cs_clustid_str = cond(strlen(cs_clustid_str) == 1, "0" + cs_clustid_str, cs_clustid_str)

gen cs_houseid_str = string(cs_houseid, "%03.0f")
replace cs_houseid_str = cond(strlen(cs_houseid_str) == 1, "00" + cs_houseid_str, cs_houseid_str)
replace cs_houseid_str = cond(strlen(cs_houseid_str) == 2, "0" + cs_houseid_str, cs_houseid_str)

gen cs_particid_str = string(cs_particid, "%12.0f")
replace cs_particid_str = cond(strlen(cs_particid_str) == 1, "0" + cs_particid_str, cs_particid_str)

gen pid = cs_country_str + cs_clustid_str + cs_houseid_str + cs_particid_str
gen hhid = cs_country_str + cs_clustid_str + cs_houseid_str
drop cs_country_str cs_clustid_str cs_houseid_str cs_particid_str

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

* Export data to Excel
capture export excel using "duplicates/cog_scoring_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
