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

*moving to orphanage
replace c_country = 5 if inlist(globalrecordid,"fddfa661-15e9-4713-8757-6b99eb8587d7","550890f9-98f2-4590-b334-ec94738214f3")

*complete interview (cm=14, audio present) but Resumen never submitted — no socio linkage possible
*cluster 80, house 063, part 02; single-participant household; documented in cog_data_gaps.rtf
replace c_country = 5 if globalrecordid == "185b850d-3d8c-43dd-9fa2-15c846e951ba"

*instructions from Guillermina
drop if inlist(globalrecordid, "25cdfeb4-89a5-4440-9e85-17033755a325")

*this case appears to be a less complete duplicate
drop if inlist(globalrecordid, "64e14797-d05d-489f-a564-966f84963e43")

*cog filed under cluster 176 house 179 (9-digit PID 117617901) but same interviewer (2),
*device (02_do), and date (2024-03-04) as socio/phys for cluster 2, house 176, part 01 (10217601)
*interviewer entered house number in cluster field; original c_clustid=176 line was a no-op
replace c_clustid = 2 if globalrecordid == "25290482-82e8-4ca9-83ef-f451d9d1c4b0"
replace c_houseid = 176 if globalrecordid == "25290482-82e8-4ca9-83ef-f451d9d1c4b0"

*instructions from Guillermina
*this got deleted, need to recover
*replace c_particid

*these look like junk
drop if inlist(globalrecordid, "37134dc6-03b8-4b78-afad-234dc6bc522a", "3fe9ab18-9ced-4313-a365-ca12ab9d08a4", "a211402c-0be5-4e33-8944-d1b1b2fd56ae","0f793ca8-fc3d-4f19-be72-bd460bbd850a")

*completely empty shell at cluster 4 — real interview is at cluster 51 (15100402, GRID 18fa02cb); c_conglid2=51 confirms; c_countmissing=170
drop if globalrecordid == "3ba8ce1a-0e76-4444-bb2d-120c2530b7ee"

*near-empty ghost at cluster 65 (c_conglid2=6) — correct cog already matched to 10601101; c_countmissing=157
drop if globalrecordid == "087907f2-71b4-476a-9496-794c283679a0"

*--- Cog-only orphans: Not in Resumen, no matching socio anywhere in cluster, no fix possible ---

*partial interview (cm=111, refused at c_43); cluster 62, house 002, part 01
drop if globalrecordid == "bb00d5b5-0276-4c52-8f82-597a5a790c87"

*batch drop: empty/near-empty shells (cm=130-170), all Not in Resumen, no socio match
*10300301(133) 10602102(159) 12205302(136) 12703101(130) 12806902(144) 12906901(170)
drop if inlist(globalrecordid, "d453c038-27ff-4b73-901b-dfa9bda6a892", "699ad8ab-d5bb-46e4-bb72-c0fa2e7dc8db", "c0d2bdb7-a27d-4f63-8980-e482564d66d2", "708c4a13-589e-4aec-88be-92e53868ec3c", "05284101-9a36-421d-94b9-251729753ac8", "451f0d7f-1212-4fb7-8abf-9a8e6be01f7a")
*13000702(159) 13402201(135) 13700401(170) 14106601(164) 14600101(169) 16302802(149)
drop if inlist(globalrecordid, "196e209c-d3bc-4e0f-b76d-9b1b09252cb7", "a589a28f-c28f-435f-b0a5-e970ec925c41", "7dfa89c6-3820-484d-8c84-027caed1817a", "f9570166-6e65-480d-9180-df666722d2bd", "045232a8-ffb6-4ecc-9542-f83e1abac8c4", "c95b3d28-1d7c-45c6-9f21-273b342621e1")
*16700101(170) 17101301(135) 17101901(137) 17500101(136)
drop if inlist(globalrecordid, "179c5d53-a092-47c4-8a9e-d7bc52084a1d", "54ec2565-bbf2-42b0-b157-6031ff7f2c88", "4f6b1000-4d2c-4850-83f1-35a957cb9f7c", "69e54963-e309-44ae-8fc0-5666a6b4c1c8")

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

*cog filed under house 056 but physical image says cluster 37 house 3 — tablet entry error
*same interviewer (5), device (05_do), and date (2024-12-05) as all other surveys for 13700301
replace c_houseid = 3 if globalrecordid == "736f5585-a698-456b-bba4-01c697653b95"

*cog filed under house 005 but same interviewer (1), device (01_do), and date (2024-05-03)
*as all other surveys for cluster 26, house 069, participant 01 — likely PID entry error on cog tablet
replace c_houseid = 69 if globalrecordid == "10614afd-b11b-4d22-a6b9-54c460a5857f"

*cog cluster/house digits transposed (entered as cluster 33 house 015, should be cluster 15 house 033)
*same interviewer (1), device (01_do), and date (2025-07-11) as all other surveys for 11503301
replace c_clustid = 15 if globalrecordid == "d055d2ff-4b8e-48b2-853e-59ad8815bf8b"
replace c_houseid = 33 if globalrecordid == "d055d2ff-4b8e-48b2-853e-59ad8815bf8b"

*cog filed under house 046 but same interviewer (2), device (02_do), and date (2025-04-26)
*as all other surveys for cluster 11, house 000, participant 01 — likely PID entry error on cog tablet
replace c_houseid = 0 if globalrecordid == "c4bf28b8-aaf6-4426-9804-06f214d2a60e"

*cog filed under house 085 but same interviewer (5), device (05_do), and date (2025-03-19)
*as all other surveys for cluster 41, house 083, participant 02 — last digit 5 vs 3
replace c_houseid = 83 if globalrecordid == "ae4b25be-077e-4f69-8f4a-220bfc342eeb"

*cog filed under cluster 48 but same interviewer (5), device (05_do), and date (2025-05-29)
*as all other surveys for cluster 47, house 038, participant 01 — cluster digit 8 vs 7
*MainHousehold.csv and socio child both confirm cluster 47
replace c_clustid = 47 if globalrecordid == "237f4543-0dc1-4fcb-bba2-1b2b90472238"

*cog filed under house 078 but same interviewer (5), device (05_do), and date (2023-10-06)
*as all other surveys for cluster 50, house 079, participant 01 — last digit 8 vs 9
replace c_houseid = 79 if globalrecordid == "cf77a5b4-1ad9-4427-9efb-cb820ffde3c8"


*cog filed under house 047 but same interviewer (2), device (02_do), and date (2024-01-18)
*as all other surveys for cluster 81, house 049, participant 02 — last digit 7 vs 9
*house 047 participant 2 has no socio; scoring already correctly filed under house 049
replace c_houseid = 49 if globalrecordid == "34228e00-a21f-4a1c-931c-0db54568dcfa"

*cog filed under house 006 but c_houseid2=11 internally flags house 011 as correct
*same interviewer (5), device (05_do), date (2024-11-02); cog at 10:48, socio at 11:24
*no socio exists for cluster 39, house 006, participant 01
replace c_houseid = 11 if globalrecordid == "6d210bfd-51e2-46bf-8015-80f6661989b2"

*instructions 11/29/25
replace c_houseid = 75 if globalrecordid == "1938d71f-226e-4591-a936-1e0717ed930d"
replace c_houseid = 55 if globalrecordid == "3bfe708f-8b63-4fdf-a5d9-304a830a0994" // don't see this hhid as having participants anywhere
drop if globalrecordid == "8e6fd050-fdd1-4de7-a6e4-537f79928c5b"
replace c_houseid = 49 if globalrecordid == "40dc56a1-4747-4d4d-b723-aee5a812884d" // looks like this is a different day than the other surveys in 81-49 so may not belong, also may need to change particid to 2

* 3/19/26 cleaning — orphan cog fixes
*cog filed under cluster 52 house 012 but same interviewer (5), device (05_do),
*and date (2025-02-08) as all other surveys for 15200001 — house digit entry error
replace c_houseid = 0 if globalrecordid == "800978a8-9731-49bd-9253-90e689d89c1f"

*--- Cog-only orphans: no matching case found, moved to country 5 ---
*cluster 70 house 037 part 01, device 01_do, 2023-10-25 — no cases missing cog in cluster 70
replace c_country = 5 if globalrecordid == "4280fb7c-9f4b-40ff-8aa9-6557b83180a0"
*cluster 30 house 035 part 02, device 01_do, 2024-06-18 — no cases missing cog in cluster 30
replace c_country = 5 if globalrecordid == "b132d999-57b6-48be-b83f-18a653ce77fe"
*cluster 40 house 008 part 01, device 04_do, 2024-11-08 — has phys+cog but no socio/infor anywhere
*phys also orphaned to country 5 in global_checks_DR.do
replace c_country = 5 if globalrecordid == "6e9ef757-b6f5-4b91-9100-82f6a19a7397"
*16700801: near-empty across all surveys (cog 71%) — junk
drop if globalrecordid == "7ca8ebc8-1859-4385-b1b7-8d177a521a3b"

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
 