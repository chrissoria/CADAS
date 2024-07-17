clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
local country = 2

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
local country  = 2

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

insheet using "`path'/CUBA_in/Cog_Scoring.csv", comma names clear

*interviewer says these are junk
drop if inlist(globalrecordid, "88e80078-4ca7-44ee-855e-387ca80b8299", "35220af8-d6a0-43b6-b0bc-4f2032d7ef89","e22ed371-c9cb-4dba-ae3c-45ec10091292")

replace cs_particid = 2 if globalrecordid == "3aecfb24-3b7e-4489-8559-5b2a517353df"
replace cs_particid = 2 if globalrecordid == "134f5748-c117-4406-992a-bfadc311b323"

*my own deduction based on casos incompletos
replace cs_particid = 1 if globalrecordid == "054eb406-1320-4a42-a651-35660e25e889"

export delimited using "`path'/CUBA_in/Cog_Scoring_cleaned.csv", replace nolabel

gen cs_country_num = 2
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
 
 *globalrecordid 88e80078-4ca7-44ee-855e-387ca80b8299 and 0d543ac7-900d-4057-a324-72467116cfca have same pid 20100901
 
 *both could be valid, there must be two people in same household, but not sure which goes where 
 
 *ideally we would have these linked, maybe not too late?

 *globalrecordid acda0aac-79fa-48dd-8932-f434536d9a8c and 35220af8-d6a0-43b6-b0bc-4f2032d7ef89 have same pid 20101401
 
 *acda0aac-79fa-48dd-8932-f434536d9a8c is less complete but both have some answers 
 
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
export excel using "duplicates/cog_scoring_duplicates.xlsx", replace firstrow(variables)
 
 clear all

insheet using "`path'/CUBA_in/Cog_Child.csv", comma names clear
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
 *this is all junk that was entered before the study began
 drop if inlist(globalrecordid, "91c4212a-a2bc-4e2c-8f43-70d1a2002986")
 drop if inlist(globalrecordid, "eb91435b-3146-43fd-94d6-261a7e7526d2", "8bc87a48-a4a4-4972-b1c8-e2f990c602d9", "a3aaf799-a716-4f62-87fc-0e60b8ee398b", "7fe87507-a24f-4f5e-979b-51ad294b7122", "1040e8ce-1260-43fa-9010-e2e553b549a9")

* removing this delete, completes a case
* drop if inlist(globalrecordid, "f7735bee-5206-4789-9771-0a68b9e1f7b5")
*instruction from interviewer 6
drop if inlist(globalrecordid, "36955fd0-cc0e-4b3c-9299-ff484808f728")

*the case below says houseid is 456, fkey = feeb956a-217b-4bcc-b27d-e20c4dd0ed48, I will assume junk
drop if inlist(fkey, "feeb956a-217b-4bcc-b27d-e20c4dd0ed48")

*the two cases below have no parent files, are duplicates, and we already have two pid 20100101 in Cog
drop if inlist(fkey, "0fcf7696-252b-4e0d-82ff-cb628198ac15","69583114-a60a-4575-943a-2215144dd18f")

*the case below is junk I entered
drop if inlist(fkey, "4938554b-7b33-4784-b0ef-efd01ede07a3")

*instructions from clust 5
*un-deleting due to missing for a respondent. Possible we deleted the wrong row in a previous instruction.
* drop if inlist(globalrecordid, "df7ef8be-b7a6-4533-928f-2dabfc1d0ca0")

replace c_particid = 2 if globalrecordid == "70422852-4a32-4664-96fd-42433ee1b545"
replace c_particid = 1 if globalrecordid == "f8ad75de-aa8f-4978-9be4-c03aa3886d08"
replace c_particid = 1 if globalrecordid == "f8ad75de-aa8f-4978-9be4-c03aa3886d08"

*only one participant in this household
replace c_particid = 1 if globalrecordid == "b5003563-a03c-4807-95be-ae81e6d83a47"
replace c_particid = 1 if globalrecordid == "38b754d6-2c05-4835-ad44-1e0dc9c0d672"
replace c_particid = 1 if globalrecordid == "fe315c82-9040-4119-a97d-7718b29c359d"

*instructions from Tania
replace c_particid = 2 if globalrecordid == "ce0daed9-57ff-41e7-ab00-6b1da78b46f9"

*for some reason the clustid is missing
replace c_clustid = 8 if inlist(globalrecordid, "c51d46c7-7540-4cbd-a0ef-95f152837acc", "8aace6a2-e557-4fce-a163-f4295623c179")

drop if inlist(globalrecordid, "884ecfa6-42dd-4ac6-8c07-22ea2579a892")

drop if inlist(globalrecordid, "fb325eeb-ecc9-400f-89d6-133760a6765d","36955fd0-cc0e-4b3c-9299-ff484808f728","df7ef8be-b7a6-4533-928f-2dabfc1d0ca0","33c3962b-3635-41af-a2c3-754909b06ebb","36955fd0-cc0e-4b3c-9299-ff484808f728")

*deleting this duplicate based on emptiness
drop if inlist(globalrecordid, "70422852-4a32-4664-96fd-42433ee1b545")

*instructions from Tania in incomplete cases discussion
replace c_houseid = 134 if globalrecordid == "c8b61ac9-3d15-4f29-82ad-24513f09f4fe"
replace c_particid = 2 if globalrecordid == "c8b61ac9-3d15-4f29-82ad-24513f09f4fe"

*my own deductions based on casos incompletos
replace c_particid = 1 if globalrecordid == "3a34a230-24d7-457f-be83-14eac034b4e5"

*tania says these are junk/test cases
drop if inlist(globalrecordid, "266de225-2bd2-4cca-8dfd-64be1ed2dc64","b40c810b-f459-4dba-bdc0-90798ac15510","862eb7f7-5b52-4aa9-a08a-33eb1d2af34f")


export delimited using "`path'/CUBA_in/Cog_Child_cleaned.csv", replace nolabel

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

log using "`path'/CUBA_out/logs/CogOnlyMissing", text replace

log close
 
 duplicates report pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 sort pid
 list if is_duplicate
 drop is_duplicate
 
 *The parent is exporting person id, etc, but not the child. It makes no sense that this would be the case.

 *Confirm that this is the case in epi info sync file. 

 *There's 101 cases so it's possible these are just junk. I'll need to confirm. 

 *I'll need to merge the child to the parent to extract pid and try to process all the data again

 *skip for now
 


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
export excel using "duplicates/cognitive_duplicates.xlsx", replace firstrow(variables)
