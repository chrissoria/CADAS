clear all

set more off

capture log close



capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"

capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"



if `"`user'"' == "Chris" {

local path = "/Users/chrissoria/documents/CADAS/Data"

local country = 2



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

local country  = 2



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

* PARENT LEVEL FIXES
*marked as 233 in mainhousehold
replace r_houseid1 = 233 if globalrecordid == "f3e942a9-f9fc-45f4-ae27-4c4aa4907c8d"
*marked clust 8 in mainhousehold
replace r_clustid1 = 8 if globalrecordid == "91bf58ba-ad3b-405b-be03-8b61fd2089d6"
*different age, and has non-res child
replace r_country1 = "5" if globalrecordid == "95133608-e995-4c6c-b75f-98d7c8d22525"
*2 rosters, 1 doesn't match any other data from this house
replace r_country1 = "5" if globalrecordid == "efbd3b57-40fa-4ab9-aa6b-c137f67f7e27"
*duplicate, but this one has 31 AND 34 entered for house. same age/sex as both 8-31 and 8-34
replace r_country1 = "5" if globalrecordid == "dce2c26c-b607-4e0b-bcb5-4f14e1d5926b"

* Any globalrecordid codes that need to be dropped should be added to the line below
gen drop = "drop" if inlist(globalrecordid, "8f037e3a-c90c-4ae6-8491-9776bde8e7fa", "2e7bc0c3-16aa-411c-9034-9a74265bef98", "ed269316-84d4-4373-803d-64c2690fa9ac", "cb0fe662-4ade-48be-9840-9aa9be4cd8fc")
replace drop = "drop" if inlist(globalrecordid, "23f7271f-a85e-4350-a50c-4460838cc104", "aa46b276-0c55-45c3-8a02-c6ff76b4ef5e", "4543bd6e-4d63-49a3-85c0-d3f96ce66bb4", "e71c7cc4-f4e2-40e9-a506-7baa392e61e0")
replace drop = "drop" if inlist(globalrecordid, "bd337f55-ba5a-4952-a271-6fb9fa18a3c9", "a9633bdf-56a5-45e7-8185-745de5172292", "5cc7c244-72be-40b4-bf0c-a55e085b6172", "f5038972-2353-453a-a9bf-640f22021f81")
replace drop = "drop" if inlist(globalrecordid, "0bf7c520-d97a-4697-85f0-2e91a39cc71b", "09ea9d3f-f71b-4c1e-8bc5-c02834c2269e")

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

* HOUSE LEVEL FIXES
*marked clust 8 in mainhousehold
replace r_clustid = 8 if globalrecordid == "bd031d3e-4d47-461e-9ef0-6ebb97453c76"
*different age, and has non-res child
replace r_country = 5 if globalrecordid == "27c6cb72-40d6-470d-97cd-02f104b92784"
*2 rosters, 1 doesn't match any other data from this house
replace r_country = 5 if globalrecordid == "aab39e92-9344-4cd2-a38e-133f4edb610a"
*duplicate, but this one has 31 AND 34 entered for house. same age/sex as both 8-31 and 8-34
replace r_country = 5 if globalrecordid == "3e576e83-427c-41d9-a24b-576881980a45"

* Additional MainHousehold drops (not cascaded from parent)
gen drop = "drop" if inlist(globalrecordid, "daf68a3b-f4d9-4374-aeab-a15d46d1dd24", "95623a9d-5f3d-46fa-a901-a0ce97c2b934", "79b081b9-842e-48c6-89d2-52db69659d9e", "6103c225-4f0b-4dce-a60d-e2696420efb8")
replace drop = "drop" if inlist(globalrecordid, "4b91fd2e-a1c3-4965-920b-22c0d64bc59d", "9858ad82-d907-4253-b944-e26f3ec715c4", "31f20aed-f7ac-4cb8-9b28-500f49208cd3", "c72b77e9-e593-4b79-99f3-617ea578dc49")
replace drop = "drop" if inlist(globalrecordid, "4b6e5b77-ad4b-45cd-8973-089c1142305d", "00b5c1bd-614b-40cd-96a1-a584bfe419d2", "1a98b0f0-ac80-4e83-9436-188093431211", "ecb5f88a-768c-4b96-802d-86bb02a5128c")
replace drop = "drop" if inlist(globalrecordid, "516bcb42-daef-4d7f-8526-f91a67592dbc", "9a636d58-b7f3-4251-871d-9122a73ac7f5")

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

* PARTICIPANT LEVEL FIXES
*instructions from Tania team clust 5
replace pr_person_number = 2 if fkey == "1303aefe-487f-4e40-a58b-c4e1ffc323c2"
*deduced this based on the registro and age
replace pr_person_number = 1 if fkey == "a78b55a0-0890-49e0-8723-a3794b07f456"
*two roster surveys conducted for married people in same house
replace fkey = "d7ce6e78-7023-406d-b89b-2cd291b2e779" if globalrecordid == "1c632fa4-dbad-4ab2-b0a8-2f042d95e58f"
replace fkey = "a78b55a0-0890-49e0-8723-a3794b07f456" if globalrecordid == "a1cf66af-2749-4201-b4ef-1d1ad4105c39"
*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
replace fkey = "3b2db47e-f7b0-4443-af0c-4070adfa4e3f" if globalrecordid == "05f2e421-4bb8-4fdc-81fb-e5b7cfade3ab"

* Participant drops by fkey
gen drop = "drop" if inlist(fkey, "6960e6a6-29c2-4567-8826-48f40918d8e0", "dd6d514a-0dc6-4ba6-ac6b-6d6ba99b9585", "44842eb7-f3f0-4a28-bd83-e4d895bf44fe", "0d9ad36e-e19e-4a95-8a75-fae393587e17")
replace drop = "drop" if inlist(fkey, "34bab32c-fbce-492b-b488-e9bbeed4f14f", "1444788e-6d3b-439d-b241-468191f55b5a", "1e5c9452-4c2a-4a43-831d-dbb2616b8d1e", "f12600fb-7c44-4462-878d-dae43926c422")
replace drop = "drop" if inlist(fkey, "fda49a83-fa8c-4160-bd85-2240c3388bd3", "8a2f117f-5e28-4fd9-86e3-caa506d31eb9", "23e02912-ef40-487e-ad88-f69ce3416247", "4660c5ec-e9f8-481a-bbee-8b6fac1dd691")
replace drop = "drop" if inlist(fkey, "c60a8e21-00db-43cc-9d7d-be6402c911c2", "9a9224a0-608d-4d11-a64a-406e5346d1c4", "16f8603e-14af-46e8-9fd0-97fa9346c914", "a4429ae1-422d-42a3-81d2-698ecf133920")
replace drop = "drop" if inlist(fkey, "5822714e-e9f4-4ed0-aea9-cf12ea2028fb", "a6e06d9d-d1a6-4fe7-97ce-2219264bdcd9", "e30e095d-5ee8-4990-9202-c2636cde7d7d", "988608d6-0e14-425d-a364-c77e97787690")
replace drop = "drop" if inlist(fkey, "ea4d729c-822d-4d25-bbe6-7354d656f6f8", "dd489df6-26c6-4b0e-b376-105e2d64c06b", "64a2fa97-87ee-4345-8107-1e778515cef7", "7bf4a896-f7a4-4c27-8b42-317bc1fbb6a6")
replace drop = "drop" if inlist(fkey, "6f457671-88d8-4f7f-9131-d6583219830a", "6cb79064-b40d-4b0c-b05a-275b4cbcd99a", "c025c31e-5b89-49ec-9602-b90cfb4745af", "2602e5bc-e5c6-444f-bcf8-d70cc1b56fc2")
replace drop = "drop" if inlist(fkey, "96afbbcb-ffe0-4e84-bcf2-29563054cf0d", "2b7ae8d2-93ca-4d35-bac3-9f488b402fb5", "0d7887b5-10d9-48fb-9427-15224504323a")
replace drop = "drop" if inlist(fkey, "0db2f741-8680-4774-8516-42bae7764cc1", "7b9478b6-a938-4c22-84b4-f8ef0d139108", "235cc596-a563-4012-8d73-36537722e0a6", "cc6068c7-bbb7-4127-a384-60a609b4edfa")
replace drop = "drop" if inlist(fkey, "ace432e5-cfb7-4d94-bbf7-5cd3cd8bdef1", "7eb18a35-341a-4503-a92a-40d26c8ae542", "d224d57b-89d3-492d-aa20-7c82ea4ed9c0", "9fa9e7df-d127-4c1d-969f-6712cc607c49")
replace drop = "drop" if inlist(fkey, "a137357c-af75-4610-9fb9-993abe0f0b12", "2cff098f-1ab8-4376-b563-1bae3471dd6d", "a545cdc6-96a4-4da3-a105-f10dd586d623", "7c40c318-d80a-40cb-bc83-5ddb9e8deacc")
replace drop = "drop" if inlist(fkey, "9b7da80c-6f80-4f02-bbf6-1896ffe5647a", "3bc177c7-f239-4615-a7d7-540775250616", "e9d26d57-68f6-4ffa-b8c2-c58dae58a336", "c064ce4e-5e2b-4459-baa0-a1f1af2ddcb6")
replace drop = "drop" if inlist(fkey, "586ea9af-1d39-40f6-9904-c1fce6295584", "9858ad82-d907-4253-b944-e26f3ec715c4", "31f20aed-f7ac-4cb8-9b28-500f49208cd3", "c72b77e9-e593-4b79-99f3-617ea578dc49", "4b6e5b77-ad4b-45cd-8973-089c1142305d")

* Participant drops by globalrecordid
replace drop = "drop" if inlist(globalrecordid, "1f9a9667-d5a1-480a-9f00-66f7da3c5706", "f6791367-acac-4877-8211-405a803c03e8", "0d8c6b7e-facd-4123-99e9-10079fc195f4", "dfe8f5db-4d43-46e1-a41b-f0030cbdfb12")
replace drop = "drop" if inlist(globalrecordid, "10ef1bb2-7e0b-443d-badd-d93b8915476f", "9e1df93b-120f-4b8f-ad6f-a3829eb473d3", "592fb744-d9bd-4e20-93e2-a3e703cc5ab3", "4f7b9042-d73d-441d-b763-847555d6da2a")
replace drop = "drop" if inlist(globalrecordid, "7b97a58c-9821-4ac9-a225-fd7ec34c8c7c", "18a361b2-b3f2-42eb-a810-aa0df59fc87a", "81c0c48f-0e82-47b8-b01a-6d9d0739ff80", "b345bdb3-d884-43b0-aa92-ef5289d6a382")
replace drop = "drop" if inlist(globalrecordid, "971e7b6d-8ffa-4c50-a5e5-134d950e9a8a", "2feac03e-53e1-43e5-bf52-54ca6493c63f", "cebc45d7-8d91-48c4-975e-cd0428013abb")

merge m:1 fkey using dropsheet_main.dta

* Mark cascaded records for dropping
replace drop = "drop" if _merge == 3

keep if _merge ~= 2

drop if drop == "drop"

drop drop _merge

gen pr_country = 2

export delimited Participants , replace

clear



* ==============================================================================
* SECTION 4: Cascade to NonParticipants.csv
* ==============================================================================

insheet using NonParticipants.csv , names

duplicates drop globalrecordid, force

* NonParticipant drops
gen drop = "drop" if inlist(globalrecordid, "8105b673-c8ac-45f8-a616-861c5ff647e1", "832dd339-6df6-47c4-9028-e2b7f22a5d7e", "d9dda3b7-e359-4d70-a038-069107d914b7")

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

* NonResidentChildren FIXES
*dropping duplicate non-res child and replacing older data with newer
replace fkey = "4e917ac2-4890-4c4b-8c24-d3a021cb6747" if globalrecordid == "b7663e7d-b32c-412f-bb6d-84f5ec8f77b2"
*combining 2 rosters from 1 house
replace fkey = "bfa4ef3f-5284-4387-bdb0-65fdce3a9134" if globalrecordid == "ff4457c2-d527-4f81-8ed2-1f6b3c24d2bd"
*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
replace fkey = "3b2db47e-f7b0-4443-af0c-4070adfa4e3f" if globalrecordid == "cefe7ad2-cb61-48d0-9027-eafe448c497a"

* NonResidentChildren drops
gen drop = "drop" if inlist(globalrecordid, "fa20024b-a640-4d53-973c-d58dea4e3a9a", "3605add9-b8ad-499d-a43b-6a2a51189f61", "d344750c-c623-48ea-ad25-02f5d65587fb")
replace drop = "drop" if inlist(fkey, "ede19cd0-03c0-4b2c-86e8-8a10fdb54fdf", "9858ad82-d907-4253-b944-e26f3ec715c4", "31f20aed-f7ac-4cb8-9b28-500f49208cd3", "c72b77e9-e593-4b79-99f3-617ea578dc49", "4b6e5b77-ad4b-45cd-8973-089c1142305d")

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

replace r_country = 2

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

export excel using "`path'/CUBA_out/duplicates/roster_duplicates.xlsx", replace firstrow(variables)



* Clean up temporary files
erase MainHousehold_temp.dta

erase roster_merged_temp.dta

clear



exit

