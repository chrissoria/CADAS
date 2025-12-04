capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

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

*10/17/25 cleaning
*these look empty
drop if inlist(globalrecordid, "6c6ecc7e-6d38-4fc9-b4a6-16e69d099777", "d08f1bf6-c6de-42ed-948e-06c4aec0f841", "ae3a979b-cb38-4301-816d-f933a4a726a1", "30f2a7fe-8d64-45d5-b702-04d33bf8227c")
drop if inlist(globalrecordid, "63cf9a3a-21e2-4865-8c6c-413d45d25827", "317d2237-9673-4e28-8cfe-5a102700b61a", "9d75b2f3-0bca-42c4-bddc-dd928f9f9d3c", "b9cc0e0c-320c-4fac-8ea5-013d5e3c8110")
*this stops after c_35
drop if inlist(globalrecordid, "290e3a62-503b-4903-8ccc-c17fcc6edc35")
*this stops after c_20
drop if inlist(globalrecordid, "101fea40-c67a-4f44-bff2-d835a8cef607")
*dropping because duplicate and all images have the same ID written, kept the one on same day as all other surveys
drop if inlist(globalrecordid, "f118b128-a64c-489b-92ff-f4984435fc30")
*1-1-1 is suspicious as practice, almost all blank in both duplicates, but a complete Socio has all data on Sep 2, 2023
drop if inlist(globalrecordid, "6c6ecc7e-6d38-4fc9-b4a6-16e69d099777", "c4d6e1ad-e144-49ef-89f1-b7d814d22134")
*duplicate is not fully complete, different date and missing all images/audio
drop if inlist(globalrecordid, "4304f88a-91de-47e9-9823-f4845130a017")
*looks like there's two cases here done in the same house (maybe two parts of the same unit?). For now, we're changing the woman to B
*replace pid = "11206701B" if globalrecordid == "1938d71f-226e-4591-a936-1e0717ed930d" //* moved this line to Cog_Read.do since there is no PID here
*pent has dif pid
replace c_particid = 2 if globalrecordid == "5562458f-2fde-4290-8f2d-d6d74835f2c8"
*parent pid is diff, and 47-25-1 is missing a cog
replace c_clustid = 47 if globalrecordid == "f14da436-08b5-42c3-b6f3-c955b97d23de"

*instructions 11/29/25
replace c_houseid = 75 if globalrecordid == "1938d71f-226e-4591-a936-1e0717ed930d"
replace c_houseid = 55 if globalrecordid == "3bfe708f-8b63-4fdf-a5d9-304a830a0994" // don't see this hhid as having participants anywhere
drop if globalrecordid == "8e6fd050-fdd1-4de7-a6e4-537f79928c5b"
replace c_houseid = 49 if globalrecordid == "b354dae0-1df6-4a57-9202-fbbb73c1e558" // looks like this is a different day than the other surveys in 81-49 so may not belong, also may need to change particid to 2

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

log using "logs/CogOnlyMissing", text replace


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

* 11/29/25
drop if inlist(globalrecordid, "f948cbb9-77aa-4959-ba07-0206064e67cd","7bddb4f8-a753-4eb2-a0ab-82ca89870d37","8754b71c-d56b-451c-be26-7784dcc58905","30c3d079-730d-4ade-8f32-1082ce81aa88","9446a754-8046-456f-abfa-dfc42be7087b","894e7b57-b1fd-44fa-bb21-017ce9b4b5be")
drop if inlist(globalrecordid, "234bb985-ed27-4f7e-810b-aa38eefbe233","2dac7cc4-5a83-4d1a-a56e-b6c9dfa02940")
replace cs_houseid = 55 if globalrecordid == "685d1da3-46ab-4ca8-9408-23bc7b74ec52"
replace cs_particid = 2 if globalrecordid == "b3884eb4-02f2-49d8-8683-d304f783830f"

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
 