clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
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

insheet using "`path'/CUBA_in/Roster_Parent.csv", comma names clear

* PARENT LEVEL FIXES HERE
*marked as 233 in mainhousehold
replace r_houseid1 = 233 if globalrecordid == "f3e942a9-f9fc-45f4-ae27-4c4aa4907c8d"
*marked clust 8 in mainhousehold
replace r_clustid1 = 8 if globalrecordid == "91bf58ba-ad3b-405b-be03-8b61fd2089d6"
*doesn't have partic or non-partic data
drop if globalrecordid == "8f037e3a-c90c-4ae6-8491-9776bde8e7fa"
*different age, and has non-res child
replace r_country1 = "5" if globalrecordid == "95133608-e995-4c6c-b75f-98d7c8d22525"
*diff date, no partic or non-partic data
drop if globalrecordid== "2e7bc0c3-16aa-411c-9034-9a74265bef98"
*duplicate data
drop if globalrecordid == "ed269316-84d4-4373-803d-64c2690fa9ac"
*no partic,non-partic data
drop if globalrecordid == "cb0fe662-4ade-48be-9840-9aa9be4cd8fc"
*newer version of roster has extra participant
drop if globalrecordid == "23f7271f-a85e-4350-a50c-4460838cc104"
*dropping dup
drop if globalrecordid == "aa46b276-0c55-45c3-8a02-c6ff76b4ef5e"
drop if globalrecordid == "4543bd6e-4d63-49a3-85c0-d3f96ce66bb4"
drop if globalrecordid == "e71c7cc4-f4e2-40e9-a506-7baa392e61e0"
drop if globalrecordid == "bd337f55-ba5a-4952-a271-6fb9fa18a3c9"
drop if globalrecordid == "a9633bdf-56a5-45e7-8185-745de5172292"
*keeping version that is 12 minutes newer
drop if globalrecordid == "5cc7c244-72be-40b4-bf0c-a55e085b6172"
*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
drop if globalrecordid == "f5038972-2353-453a-a9bf-640f22021f81"
*2 rosters, 1 doesn't match any other data from this house
replace r_country1 = "5" if globalrecordid == "efbd3b57-40fa-4ab9-aa6b-c137f67f7e27"
*duplicate, but this one has 31 AND 34 entered for house. same age/sex as both 8-31 and 8-34
replace r_country1 = "5" if globalrecordid == "dce2c26c-b607-4e0b-bcb5-4f14e1d5926b"
*dupe, keeping more recent one (dropped one also has less people, but different data for the 1 person included)
drop if globalrecordid == "0bf7c520-d97a-4697-85f0-2e91a39cc71b"
*dropping later dupe since it's less people (same data for the 1 person included in both)
drop if globalrecordid == "09ea9d3f-f71b-4c1e-8bc5-c02834c2269e"
 
 clear all
 
insheet using "`path'/CUBA_in/MainHousehold.csv", comma names clear

* HOUSE LEVEL FIXES HERE
*marked clust 8 in mainhousehold
replace r_clustid = 8 if globalrecordid == "bd031d3e-4d47-461e-9ef0-6ebb97453c76"
*doesn't have partic or non-partic data
drop if globalrecordid == "daf68a3b-f4d9-4374-aeab-a15d46d1dd24"
*different age, and has non-res child
replace r_country = 5 if globalrecordid == "27c6cb72-40d6-470d-97cd-02f104b92784"
*diff date, no partic or non-partic data
drop if globalrecordid== "95623a9d-5f3d-46fa-a901-a0ce97c2b934"
*duplicate data
drop if globalrecordid == "79b081b9-842e-48c6-89d2-52db69659d9e"
*no partic, non-partic data
drop if globalrecordid == "6103c225-4f0b-4dce-a60d-e2696420efb8"
*newer version of roster has extra participant
drop if globalrecordid == "4b91fd2e-a1c3-4965-920b-22c0d64bc59d"
*dropping dup
drop if globalrecordid == "9858ad82-d907-4253-b944-e26f3ec715c4"
drop if globalrecordid == "31f20aed-f7ac-4cb8-9b28-500f49208cd3"
drop if globalrecordid == "c72b77e9-e593-4b79-99f3-617ea578dc49"
drop if globalrecordid == "4b6e5b77-ad4b-45cd-8973-089c1142305d"
drop if globalrecordid == "00b5c1bd-614b-40cd-96a1-a584bfe419d2"
*keeping version that is 12 minutes newer
drop if globalrecordid == "1a98b0f0-ac80-4e83-9436-188093431211"
*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
drop if globalrecordid == "ecb5f88a-768c-4b96-802d-86bb02a5128c"
*2 rosters, 1 doesn't match any other data from this house
replace r_country = 5 if globalrecordid == "aab39e92-9344-4cd2-a38e-133f4edb610a"
*duplicate, but this one has 31 AND 34 entered for house. same age/sex as both 8-31 and 8-34
replace r_country = 5 if globalrecordid == "3e576e83-427c-41d9-a24b-576881980a45"
*dupe, keeping more recent one (dropped one also has less people, but different data for the 1 person included)
drop if globalrecordid == "516bcb42-daef-4d7f-8526-f91a67592dbc"
*dropping later dupe since it's less people (same data for the 1 person included in both)
drop if globalrecordid == "9a636d58-b7f3-4251-871d-9122a73ac7f5"

 
clear all

insheet using "`path'/CUBA_in/Participants.csv", comma names clear
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 

   *dropped below because junk
  drop if inlist(fkey, "6960e6a6-29c2-4567-8826-48f40918d8e0","dd6d514a-0dc6-4ba6-ac6b-6d6ba99b9585","6960e6a6-29c2-4567-8826-48f40918d8e0","44842eb7-f3f0-4a28-bd83-e4d895bf44fe","0d9ad36e-e19e-4a95-8a75-fae393587e17")
  *is dropped below has person id 201004, for which there appears to be two entries for (both have the same age, gender, etc) I'm dropping the one that looks more correct
  drop if inlist(fkey, "34bab32c-fbce-492b-b488-e9bbeed4f14f")
  *is dropped because duplicate, contradicting gender, and missing info has personid 20103501
  drop if inlist(fkey, "1444788e-6d3b-439d-b241-468191f55b5a")
  *is dropped below because suplicate and another case has all of the exact same information
  drop if inlist(fkey, "1e5c9452-4c2a-4a43-831d-dbb2616b8d1e")
  *two weird things about the case below
  *First, both cases have the same male gender
  *Second, both have the same person number, but one is "esposo/a" and the other is si mismo
  *for now, I will recode the case the came after as person 2, ask TANIA
  
*instructions from Tania team clust 5
drop if inlist(fkey, "f12600fb-7c44-4462-878d-dae43926c422")
  
  replace pr_person_number = 2 if fkey == "1303aefe-487f-4e40-a58b-c4e1ffc323c2"
  
*deduced this based on the registro and age
replace pr_person_number = 1 if fkey == "a78b55a0-0890-49e0-8723-a3794b07f456"

drop if inlist(fkey, "fda49a83-fa8c-4160-bd85-2240c3388bd3", "8a2f117f-5e28-4fd9-86e3-caa506d31eb9")

*two roster surveys conducted for married people in same house
replace fkey = "d7ce6e78-7023-406d-b89b-2cd291b2e779" if globalrecordid == "1c632fa4-dbad-4ab2-b0a8-2f042d95e58f"
  
  /*weird thing about the cases below: they don't have a uniqueid but have data for everything else, which doesn't make sense. Look more closely, but for now, delete. 
  fkey
23e02912-ef40-487e-ad88-f69ce3416247
4660c5ec-e9f8-481a-bbee-8b6fac1dd691
*/

drop if inlist(fkey, "23e02912-ef40-487e-ad88-f69ce3416247", "4660c5ec-e9f8-481a-bbee-8b6fac1dd691")

*The cases below are all empty

drop if inlist(fkey, "c60a8e21-00db-43cc-9d7d-be6402c911c2", "9a9224a0-608d-4d11-a64a-406e5346d1c4", "16f8603e-14af-46e8-9fd0-97fa9346c914", "a4429ae1-422d-42a3-81d2-698ecf133920")
drop if inlist(fkey, "5822714e-e9f4-4ed0-aea9-cf12ea2028fb", "a6e06d9d-d1a6-4fe7-97ce-2219264bdcd9", "e30e095d-5ee8-4990-9202-c2636cde7d7d", "988608d6-0e14-425d-a364-c77e97787690")
drop if inlist(fkey, "ea4d729c-822d-4d25-bbe6-7354d656f6f8", "dd489df6-26c6-4b0e-b376-105e2d64c06b", "64a2fa97-87ee-4345-8107-1e778515cef7", "7bf4a896-f7a4-4c27-8b42-317bc1fbb6a6")
drop if inlist(fkey, "6f457671-88d8-4f7f-9131-d6583219830a", "6cb79064-b40d-4b0c-b05a-275b4cbcd99a", "c025c31e-5b89-49ec-9602-b90cfb4745af", "2602e5bc-e5c6-444f-bcf8-d70cc1b56fc2")
drop if inlist(fkey, "96afbbcb-ffe0-4e84-bcf2-29563054cf0d", "4660c5ec-e9f8-481a-bbee-8b6fac1dd691", "2b7ae8d2-93ca-4d35-bac3-9f488b402fb5", "0d7887b5-10d9-48fb-9427-15224504323a")
drop if inlist(fkey, "0db2f741-8680-4774-8516-42bae7764cc1", "7b9478b6-a938-4c22-84b4-f8ef0d139108", "235cc596-a563-4012-8d73-36537722e0a6", "cc6068c7-bbb7-4127-a384-60a609b4edfa")
drop if inlist(fkey, "ace432e5-cfb7-4d94-bbf7-5cd3cd8bdef1", "7eb18a35-341a-4503-a92a-40d26c8ae542", "d224d57b-89d3-492d-aa20-7c82ea4ed9c0", "9fa9e7df-d127-4c1d-969f-6712cc607c49")
drop if inlist(fkey, "a137357c-af75-4610-9fb9-993abe0f0b12", "2cff098f-1ab8-4376-b563-1bae3471dd6d", "a545cdc6-96a4-4da3-a105-f10dd586d623", "7c40c318-d80a-40cb-bc83-5ddb9e8deacc")
drop if inlist(fkey, "9b7da80c-6f80-4f02-bbf6-1896ffe5647a", "3bc177c7-f239-4615-a7d7-540775250616", "e9d26d57-68f6-4ffa-b8c2-c58dae58a336", "c064ce4e-5e2b-4459-baa0-a1f1af2ddcb6")
drop if inlist(globalrecordid == "1f9a9667-d5a1-480a-9f00-66f7da3c5706", "f6791367-acac-4877-8211-405a803c03e8", "0d8c6b7e-facd-4123-99e9-10079fc195f4", "dfe8f5db-4d43-46e1-a41b-f0030cbdfb12")
drop if inlist(globalrecordid == "10ef1bb2-7e0b-443d-badd-d93b8915476f", "9e1df93b-120f-4b8f-ad6f-a3829eb473d3", "592fb744-d9bd-4e20-93e2-a3e703cc5ab3", "4f7b9042-d73d-441d-b763-847555d6da2a")
drop if inlist(globalrecordid == "7b97a58c-9821-4ac9-a225-fd7ec34c8c7c", "18a361b2-b3f2-42eb-a810-aa0df59fc87a")

*this somehow has no mainhousehold survey? only 2 participants are 54yo and empty
drop if globalrecordid == "f6791367-acac-4877-8211-405a803c03e8"
drop if globalrecordid == "81c0c48f-0e82-47b8-b01a-6d9d0739ff80"

*no mainhousehold survey, 1 of 2 participants is 54yo
drop if globalrecordid == "b345bdb3-d884-43b0-aa92-ef5289d6a382"

*the case below is a duplicate and is less complete than the other

drop if inlist(fkey, "586ea9af-1d39-40f6-9904-c1fce6295584")

*duplicate, older than other one (and 1 fewer partic)
drop if globalrecordid == "971e7b6d-8ffa-4c50-a5e5-134d950e9a8a"

*duplicate, keeping newer version
drop if globalrecordid == "2feac03e-53e1-43e5-bf52-54ca6493c63f"
replace fkey = "a78b55a0-0890-49e0-8723-a3794b07f456" if globalrecordid == "a1cf66af-2749-4201-b4ef-1d1ad4105c39"

*dropping dup
drop if fkey == "9858ad82-d907-4253-b944-e26f3ec715c4"
drop if fkey == "31f20aed-f7ac-4cb8-9b28-500f49208cd3"
drop if fkey == "c72b77e9-e593-4b79-99f3-617ea578dc49"
drop if fkey == "4b6e5b77-ad4b-45cd-8973-089c1142305d"

*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
replace fkey = "3b2db47e-f7b0-4443-af0c-4070adfa4e3f" if globalrecordid == "05f2e421-4bb8-4fdc-81fb-e5b7cfade3ab"

*dupe observation
drop if globalrecordid == "cebc45d7-8d91-48c4-975e-cd0428013abb"


gen pr_country = 2

export delimited using "`path'/CUBA_in/Participants_cleaned.csv", replace nolabel

clear all

insheet using "`path'/CUBA_in/NonParticipants.csv", comma names clear
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
*two roster surveys conducted for married people in same house
drop if globalrecordid == "8105b673-c8ac-45f8-a616-861c5ff647e1"
drop if globalrecordid == "832dd339-6df6-47c4-9028-e2b7f22a5d7e"

*dupe observation
drop if globalrecordid == "d9dda3b7-e359-4d70-a038-069107d914b7"
 
export delimited using "`path'/CUBA_in/NonParticipants_cleaned.csv", replace nolabel

clear all

insheet using "`path'/CUBA_in/NonResidentChildren.csv", comma names clear
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
*two roster surveys conducted for married people in same house
drop if globalrecordid == "fa20024b-a640-4d53-973c-d58dea4e3a9a"

*keeping only newer versions for this roster
drop if fkey == "ede19cd0-03c0-4b2c-86e8-8a10fdb54fdf"

*dropping dup
drop if fkey == "9858ad82-d907-4253-b944-e26f3ec715c4"
drop if fkey == "31f20aed-f7ac-4cb8-9b28-500f49208cd3"
drop if fkey == "c72b77e9-e593-4b79-99f3-617ea578dc49"
*this is a dup except for non-res child. this version has a non-res child, but it's older so dropping for now. if real replace fkey == "f12600fb-7c44-4462-878d-dae43926c422"
drop if fkey == "4b6e5b77-ad4b-45cd-8973-089c1142305d"
*dropping duplicate non-res child and replacing older data with newer
drop if globalrecordid == "3605add9-b8ad-499d-a43b-6a2a51189f61"
replace fkey = "4e917ac2-4890-4c4b-8c24-d3a021cb6747" if globalrecordid == "b7663e7d-b32c-412f-bb6d-84f5ec8f77b2"
drop if globalrecordid == "d344750c-c623-48ea-ad25-02f5d65587fb"

*combining 2 rosters from 1 house
replace fkey = "bfa4ef3f-5284-4387-bdb0-65fdce3a9134" if globalrecordid == "ff4457c2-d527-4f81-8ed2-1f6b3c24d2bd"

*combining 2 rosters from 1 house, possibly 3 partic in house but only 2 in rosters
replace fkey = "3b2db47e-f7b0-4443-af0c-4070adfa4e3f" if globalrecordid == "cefe7ad2-cb61-48d0-9027-eafe448c497a"
 
export delimited using "`path'/CUBA_in/NonResidentChildren_cleaned.csv", replace nolabel


* Export data to Excel
export excel using "duplicates/non_resident_children_duplicates.xlsx", replace firstrow(variables)

clear
