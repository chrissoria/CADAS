use Cog_Scoring
drop pid hhid
*instructions from Guillermina's team
drop if inlist(globalrecordid, "11a51b81-754d-4874-b6e4-bf86e7c9bb96","11fb6ef8-6b77-4ce4-96f0-cb04e835be17","16aed8dc-50c5-4116-a24c-b5a7ac5949d5","0e2a0ff5-87bd-49da-a5f0-73dab4fe04f6","9908f401-afc7-4854-914e-c3f30119feb8","afa8c2bc-e17f-4504-b7e0-d7bb284d117f")
*guillermina indicated we drop these
drop if inlist(globalrecordid, "afa8c2bc-e17f-4504-b7e0-d7bb284d117f")

replace cs_particid = 2 if globalrecordid == "5a093074-f404-477c-9e58-4b234e314130"
replace cs_particid = 2 if globalrecordid == "da0f48bc-c91d-4f5f-8b24-9eaf61967157"

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
 
