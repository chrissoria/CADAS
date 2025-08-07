include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

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
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}
}

*instructions from Guillermina
drop if inlist(globalrecordid, "25cdfeb4-89a5-4440-9e85-17033755a325")

*this case appears to be a less complete duplicate
drop if inlist(globalrecordid, "64e14797-d05d-489f-a564-966f84963e43")

replace c_clustid = 176 if globalrecordid == "25290482-82e8-4ca9-83ef-f451d9d1c4b0"

*instructions from Guillermina
*this got deleted, need to recover
*replace c_particid

*these look like junk
drop if inlist(globalrecordid, "37134dc6-03b8-4b78-afad-234dc6bc522a", "3fe9ab18-9ced-4313-a365-ca12ab9d08a4", "a211402c-0be5-4e33-8944-d1b1b2fd56ae","0f793ca8-fc3d-4f19-be72-bd460bbd850a")

foreach var in c_clustid c_particid c_houseid {
	replace `var' = int(`var')
}

if `country' == 0 {
    export delimited using "../PR_in/Cog_Child_cleaned.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Cog_Child_cleaned.csv", replace
}
else if `country' == 2 {
    export delimited using "../CU_in/Cog_Child_cleaned.csv", replace
}

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

log using "/Users/chrissoria/documents/CADAS/Data/DR_out/logs/CogOnlyMissing", text replace


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

*instructions from Guillermina's team
drop if inlist(globalrecordid, "11a51b81-754d-4874-b6e4-bf86e7c9bb96","11fb6ef8-6b77-4ce4-96f0-cb04e835be17","16aed8dc-50c5-4116-a24c-b5a7ac5949d5","0e2a0ff5-87bd-49da-a5f0-73dab4fe04f6","9908f401-afc7-4854-914e-c3f30119feb8","afa8c2bc-e17f-4504-b7e0-d7bb284d117f")
*guillermina indicated we drop these
drop if inlist(globalrecordid, "afa8c2bc-e17f-4504-b7e0-d7bb284d117f","5a093074-f404-477c-9e58-4b234e314130")

replace cs_particid = 2 if globalrecordid == "5a093074-f404-477c-9e58-4b234e314130"
replace cs_particid = 2 if globalrecordid == "da0f48bc-c91d-4f5f-8b24-9eaf61967157"
replace cs_clustid = 276 if globalrecordid == "c8446ae0-a3dd-475d-b708-d1d38245335a"

drop if inlist(globalrecordid, "5a093074-f404-477c-9e58-4b234e314130", "470b5479-7bce-4269-bb29-c42abb68d142", "b6805d75-d916-46f6-aa31-0ef5560c6c32", "e2df7272-2a0d-4918-8cb9-4e2a598f53e2")

foreach var in cs_clustid cs_particid cs_houseid {
	replace `var' = int(`var')
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
replace cs_country_num = 1 if cs_country == "1 - República Dominicana"
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
 
