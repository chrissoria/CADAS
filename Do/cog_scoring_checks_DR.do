use Cog_Scoring
drop pid hhid
*instructions from Guillermina's team
drop if inlist(globalrecordid, "11a51b81-754d-4874-b6e4-bf86e7c9bb96","11fb6ef8-6b77-4ce4-96f0-cb04e835be17","16aed8dc-50c5-4116-a24c-b5a7ac5949d5","0e2a0ff5-87bd-49da-a5f0-73dab4fe04f6","9908f401-afc7-4854-914e-c3f30119feb8","afa8c2bc-e17f-4504-b7e0-d7bb284d117f")
*guillermina indicated we drop these
drop if inlist(globalrecordid, "afa8c2bc-e17f-4504-b7e0-d7bb284d117f")

*scoring filed under house 056 — physical image confirms this belongs to cluster 37 house 003 (13700301)
replace cs_houseid = 3 if globalrecordid == "ce2fe51d-32b3-4c8d-819f-944362a289c8"

*duplicate scoring under house 005 — scores identical to correctly-filed 12606901 record; drop the wrong-PID copy
drop if globalrecordid == "f8895a62-ad60-4751-901a-e740e856e351"

*scoring filed under house 046 — matches cog fix above (same interviewer/device/date as house 000 participant 01)
replace cs_houseid = 0 if globalrecordid == "920d855a-4869-41fb-99d8-1a4fe992da91"

*scoring filed under house 085 — matches cog fix (same interviewer/device/date as house 083 participant 02)
replace cs_houseid = 83 if globalrecordid == "c2628f7d-a40b-4305-bf43-f434806d61e9"

*scoring filed under cluster 48 — matches cog fix (same interviewer/device/date as cluster 47, house 038, participant 01)
replace cs_clustid = 47 if globalrecordid == "77b23675-ad0c-41b8-81ec-c191547d117f"

*scoring filed under house 078 — matches cog fix (same interviewer/device/date as cluster 50, house 079, participant 01)
replace cs_houseid = 79 if globalrecordid == "01908d5b-227e-4595-b97a-aa88b38ca8ab"

*empty shell scoring under house 029 (cluster 64) — all main scores blank; the real scoring belongs to house 089
drop if globalrecordid == "4c64043b-b48d-4bc6-8159-e48aab8e635b"

*scoring filed under house 006 — matches cog fix; c_houseid2=11 confirms house 011
*same interviewer (5), device (05_do), date (2024-11-02); no socio for house 006 participant 01
replace cs_houseid = 11 if globalrecordid == "ec1f3e39-735c-4649-b2e0-c995e1c33e0d"

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
 
