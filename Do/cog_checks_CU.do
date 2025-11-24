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

input cs_country cs_32 cs_clustid cs_houseid cs_particid cs_40 cs_41
	2 0 1 253 1 5 1 1
	2 1 1 253 2 14 0
	2 1 1 255 3 14 1
	2 .i 1 258 1 12 1 // did attempt cs_32 but cannot find the image, case will drop
	2 1 1 260 1 21 1
	2 0 1 262 1 14  0
	2 1 1 265 1 20 2
	2 0 1 266 1 .i .i // missing the animals attempt, no image
	2 1 1 267 1 19 2
	2 1 1 267 2 24 0
	2 1 1 272 1 11 0
	2 1 1 275 1 19 1
	2 0 4 149 1 10 0
	2 0 4 151 1 7 3
	2 .v 4 152 1 3 2 // refused to do the pentagon
	2 1 4 152 2 24 0
	// 2 0 8 2 2 3 1 looks like already in the data (not sure why not matching)
	// 2 1 8 163 1 .i .i missing the animals attempt, no image
	// 2 1 8 164 1 19 0
	2 0 8 194 1 9 0
end
save "../CUBA_in/ty_cog_scores.dta", replace
clear all

insheet using "`path'/CUBA_in/Cog_Scoring.csv", comma names clear

drop v1

append using "../CUBA_in/ty_cog_scores.dta", force
*this was scored wrong
replace cs_40 = 3 if globalrecordid == "d6bca3fd-2918-4298-90a1-63e31a5e68c9"
replace cs_41 = 1 if globalrecordid == "d6bca3fd-2918-4298-90a1-63e31a5e68c9"

*instructions from Tania cluster 13
drop if inlist(globalrecordid,"fec63a23-6edd-480b-97dd-00f266da0787", "6e8acd06-10e8-47bc-8873-7353012c3346")

*based on pictures, this look like participant 1 (who is missing a cog scoring)
replace cs_particid = 1 if globalrecordid == "d2f53c9d-7c1a-4ff2-becb-e5f3ac021db7"
replace cs_79_4 = 3 if globalrecordid == "d2f53c9d-7c1a-4ff2-becb-e5f3ac021db7"

*these are duplicates that look exactly the same, dropping one of two
drop if inlist(globalrecordid, "c13b4e29-d536-4094-86e0-a065a77067fa")

*in cog scoring is missing but tania found the image
replace cs_40 = 18 if globalrecordid == "705ce437-84b2-43f5-9013-636e58980eb8"

*in cog scoring, missing the score for animal naming, but I found the image
replace cs_40 = 17 if globalrecordid == "79c92574-2b2c-4654-b390-feda9f7ab5ea"
replace cs_41 = 0 if globalrecordid == "79c92574-2b2c-4654-b390-feda9f7ab5ea"

*interviewer says these are junk
drop if inlist(globalrecordid, "88e80078-4ca7-44ee-855e-387ca80b8299", "35220af8-d6a0-43b6-b0bc-4f2032d7ef89","e22ed371-c9cb-4dba-ae3c-45ec10091292")

replace cs_particid = 2 if globalrecordid == "3aecfb24-3b7e-4489-8559-5b2a517353df"
replace cs_particid = 2 if globalrecordid == "134f5748-c117-4406-992a-bfadc311b323"

*my own deduction based on casos incompletos
replace cs_particid = 1 if globalrecordid == "054eb406-1320-4a42-a651-35660e25e889"

*rescoring pents with invalid scores (2, 4, 8, etc)
*replace cs_32 = 1 if inlist(globalrecordid, "29d3e105-db32-4bfc-ab5a-a958c14b7f16", "18539b19-8a12-4d88-a92f-fd0cf48b65a3", "6bce595d-3a37-43d6-8606-bcfbff78de3e", "0a96b367-1cd0-477e-bcc3-bb4e3a4a6ec1")
*replace cs_32 = 1 if inlist(globalrecordid, "5cc7748c-a1bf-4ad4-a908-2346eb310116", "7f45e073-c308-4914-8bdb-b4441f568819", "68b04bf5-98a6-4cfb-90b6-73199943ae5a", "1abd9a8b-eb1e-43dc-9b90-0db57870ddc3")
*replace cs_32 = 1 if inlist(globalrecordid, "4990632a-7ec7-4409-b3ba-85f25f1bd12d", "41191aa4-b609-4ac2-accc-a578cf495f92", "6f660b4a-f531-4f4d-909c-4d00caeae9b7", "7c09271a-720c-4edf-a0c1-6896b7a2e34f")
*replace cs_32 = 1 if inlist(globalrecordid, "3a34a230-24d7-457f-be83-14eac034b4e5", "1dd5a423-69b7-40b8-be73-81827a439989", "91c83b5a-b181-4610-968c-acccb2a24048", "adf06e49-aee1-4b27-b860-d5e79b156eee")
*replace cs_32 = 1 if inlist(globalrecordid, "39fbf080-746a-44f5-86e6-ab1833e2558b", "c4fbdd12-752f-455f-b04c-9fbf93728ed7", "88f2fb01-0039-4c50-810a-b1103f1c5e1f", "8bb96e92-7800-49cd-97de-33402f034845")
*replace cs_32 = 1 if inlist(globalrecordid, "8caa1203-2469-4781-b80e-3f45682f574d", "8b0ce098-1fa0-43e5-9bce-297adc5eeffe")
*replace cs_32 = 0 if inlist(globalrecordid, "ac0f9968-0d07-41fe-9c19-8e3a70254fc7", "f33b143a-64b8-4606-8dbc-a18d8531c2fe", "1e3c3668-1159-4c5d-b776-573afd9ef24d", "bf92c3f8-0e55-4122-b81e-08294bf3c5da")
*replace cs_32 = 0 if inlist(globalrecordid, "3bfc9722-ac05-4d16-81f9-f9c1fe77c2b8", "0bf49a11-4615-4c22-9337-afd4809412bd", "aca76a52-b20f-40c7-b19d-208b9a4168e1")


replace cs_32 = 1 if inlist(globalrecordid, "999590c4-d64d-48bc-9dbf-88f17acbc18f")
replace cs_32 = 1 if inlist(globalrecordid, "1d30bc70-aa2d-4168-a07b-8713448ef862")
replace cs_32 = 1 if inlist(globalrecordid, "1b2ca006-4e02-4e43-b93a-e6b995693736", "bbab728b-13b2-4f05-bdca-726ebd388e97", "d97434b5-143d-472b-a74b-fc48f9155855", "7038d822-9679-4110-bdce-f42e47f74347")
replace cs_32 = 1 if inlist(globalrecordid, "054eb406-1320-4a42-a651-35660e25e889", "2fcc2a65-5965-429b-ad5b-a16b623ca42b", "abdbca5a-0c7f-4714-b839-378fde78b550", "2a20d4bd-f982-4b05-85bf-813475f63a89")
replace cs_32 = 1 if inlist(globalrecordid, "aafd40ee-f9b7-4573-b878-21f6051f9371", "7ec224c8-3fdc-4e2d-9e5d-cb1c46f7ee26", "08817231-c124-4420-91cb-497de353987b", "aecef8b1-1217-4c85-856f-07d4a76ccdb0")
replace cs_32 = 1 if inlist(globalrecordid, "edd6b259-b938-43ff-be17-f9febe39698e", "74c25bd1-e522-41cb-a673-1387df929eed")
replace cs_32 = 0 if inlist(globalrecordid, "d9cd5d8e-f451-4f36-9e45-9244b9ce2a32", "c8f5dab9-239d-4540-bd1e-5f5c3c6c1da3")
replace cs_32 = 0 if inlist(globalrecordid, "7c79a23b-8646-49e9-972b-a02cce80b7b7", "4260585b-6879-4317-b52d-f29906ab85fd", "57ba1a1e-b0bb-46e1-8f86-bd1eebec577b")

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

*merging to the CDR
merge m:m pid using Cuba_CDR.dta
drop _merge


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

*looks mostly empty duplicate
drop if inlist(globalrecordid, "4e5ac89a-7f0f-4c9d-a894-f6e66d3760e3", "7ae4ea79-4fb4-4317-bcf4-5b4565222af8", "46387367-f498-4ccf-a0af-f6965e2abe89", "57962cb3-bb83-4d0c-8674-f09980801cb7", "04c2eaa3-632e-4eb8-8638-57db9aca9b2c") 
drop if inlist(globalrecordid, "1b17b726-7f4c-411a-ad5e-ea707596a595", "7bddb5a3-ca74-4231-9cfa-f93738dd9021", "59ef3aee-808b-4c09-b074-36863b04021a", "175dee2a-e36a-4065-bd28-69159254208c", "fc5ca038-4c92-4d9c-be15-7321038accfb")
drop if inlist(globalrecordid, "b8cbb26f-ab1a-4fef-a211-f9d166388bd9", "ea02fa8e-f1cb-47ae-8ea6-1f93532ad8f0", "8924ae7a-5458-4634-88dc-af2bb86dcb0a", "2573aa5b-2946-41ac-a62d-8637d3b14f43", "fffd9afa-fa0c-4713-b27b-9dfd7ab9248a")
drop if inlist(globalrecordid, "59a92af6-5d3d-4d53-bd7c-6992196ccd75", "11331f02-dd4f-48cb-b8b4-cddd29a4a911")
*looks like a practice "junk" case
drop if globalrecordid == "d8482cd2-d812-4c8c-904b-bfea2f017441"
 
*parent shows cluster 4, child shows 2. Cluster 4 participant missing their cog, must be changed to cluster 4
replace c_clustid = 4 if globalrecordid == "d2cd92e6-06df-4926-96bd-235c550ab868" 

*parent id not matching, parent has 1 but child has 2, images show from participant 2
replace c_particid = 2 if globalrecordid == "7c700970-5237-40db-8fae-4c8da58e109d"
 
*parent id is 2 but child is 1, 2 missing socio so must be for 2
replace c_particid = 2 if globalrecordid == "3f71e455-bf92-4b1c-91ec-cdd9cba1c3ce"
 
* participant two is missing their cognitive, based on image and date I believe this one here should be recoded to 2
replace c_particid = 2 if globalrecordid == "7c700970-5237-40db-8fae-4c8da58e109d"

* this should be house 138 based on date
replace c_houseid = 138 if globalrecordid == "90bf1b73-d9fd-40a2-b4da-13c02c0043a3"
 
*missing the cluster for some reasons
replace c_clustid = 1 if globalrecordid == "542cfd05-4263-46fa-9f9c-4104c3cfd60e"
replace c_clustid = 1 if globalrecordid == "62b3d9b9-51ab-4e84-aea4-b32a4f4cf78f"

*tania says this should be participant 2, error in the ID
replace c_particid = 2 if globalrecordid == "a87fc94f-b088-47e5-a350-cf8f7aac897d"
 
*this is a duplicate, but looks like the cluster was entered in incorrectly based on the pid_parent (changes were made to top level but not bottom level)
replace c_clustid = 8 if globalrecordid == "b237127e-99ec-4524-903c-54d4486c4df4"

* an error, corrected using pictures of drawings
replace c_clustid = 4 if globalrecordid == "3aa70caa-0948-426b-8e1f-fb99d3a9a04b"
 
*tania was able to determine that this question was answered
replace c_40 = 1 if globalrecordid == "31e5e190-ab73-4c83-bc2c-7e99988ca2bc"

*this case was done in february 2023 (I believe that was before official interviews started) and is a duplicate, deleting
drop if globalrecordid == "f8ad75de-aa8f-4978-9be4-c03aa3886d08"
 
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

*duplicate pid, participant 2 is missing cog, part 2 is a woman, audio confirms is a woman, therefore particpant should be number 2
replace c_particid = 2 if globalrecordid == "216dbb1c-6655-4d11-9b0f-c628ecfe7a25"

*for some reason, this is a duplicate of household 2 part 2, but incorreclty labeled as household 7
replace c_houseid = 2 if globalrecordid == "352a9834-e7b8-408c-a20b-8456f7b66f3a"
replace c_particid = 2 if globalrecordid == "352a9834-e7b8-408c-a20b-8456f7b66f3a"
*dropping the duplicate of above
drop if globalrecordid == "47653a6c-230f-4af4-b7b7-aac1b2dff7e1"

*this comes from house 28, based on scores, cog scoring shows they changed from 26 to 28, other duplicate looks more in line with cog scoring (bad scores)
replace c_houseid = 28 if globalrecordid == "75317d3a-d0a4-47d4-8fe8-f029d857366e"

*instructions from clust 5
*un-deleting due to missing for a respondent. Possible we deleted the wrong row in a previous instruction.
* drop if inlist(globalrecordid, "df7ef8be-b7a6-4533-928f-2dabfc1d0ca0")

replace c_particid = 2 if globalrecordid == "70422852-4a32-4664-96fd-42433ee1b545"
replace c_particid = 1 if globalrecordid == "f8ad75de-aa8f-4978-9be4-c03aa3886d08"
replace c_particid = 1 if globalrecordid == "f8ad75de-aa8f-4978-9be4-c03aa3886d08"

*there is a floating cog, most likely belongs to participant 1
replace c_particid = 1 if globalrecordid == "b2fb4bb1-e985-4316-a9c3-63756fdfc6b0"

*only one participant in this household
replace c_particid = 1 if globalrecordid == "b5003563-a03c-4807-95be-ae81e6d83a47"
replace c_particid = 1 if globalrecordid == "38b754d6-2c05-4835-ad44-1e0dc9c0d672"
replace c_particid = 1 if globalrecordid == "fe315c82-9040-4119-a97d-7718b29c359d"

*tania says this is junk/test
drop if globalrecordid == "4a7ac819-550a-4a0b-9d50-87e4eb6690d3"

*replacing because ID change shows should've been cluster 7
replace c_clustid = 7 if globalrecordid == "a1cb955d-c2cf-478c-8e3b-7dba54d48e92"

*looks like a duplicate same person interview
drop if globalrecordid == "941ad4e4-25d4-4af2-a6f1-bcf762be84a9"

*ID's not matching in the parent and the child
replace c_houseid = 17 if globalrecordid == "d4bc78a3-47e5-4f7c-96d5-cf723a7a7c7a"

*parent ID shows partic 2, partic 2 missing cog, must be partic 2
replace c_particid = 2 if globalrecordid == "1bec0e08-a561-4677-b2a1-ffbf7a45343f"

*there's a duplicate with a lot missing, other case much more complete, dropping missing
drop if globalrecordid == "a98c7bc7-2656-495e-901f-41419275c0ed"

*moving to orphanage because can't figure out where belongs
replace c_country = 5 if globalrecordid == "3cb4adc2-57b6-4f28-b0f9-abfbe694b757"

*orphanage because two cases one sounds older than other, roster says this is a 60-year old (will drop later)
replace c_country = 5 if globalrecordid == "5c3522a1-2246-4c93-8238-877f9cef95e7"

*per tania's instructions
replace c_particid = 3 if globalrecordid == "224e0387-db42-4f0e-aaae-afab1a805223"

*instructions from Tania
replace c_particid = 2 if globalrecordid == "ce0daed9-57ff-41e7-ab00-6b1da78b46f9"

*for some reason the clustid is missing
replace c_clustid = 8 if inlist(globalrecordid, "c51d46c7-7540-4cbd-a0ef-95f152837acc", "8aace6a2-e557-4fce-a163-f4295623c179")

drop if inlist(globalrecordid, "884ecfa6-42dd-4ac6-8c07-22ea2579a892")

drop if inlist(globalrecordid, "fb325eeb-ecc9-400f-89d6-133760a6765d","36955fd0-cc0e-4b3c-9299-ff484808f728","33c3962b-3635-41af-a2c3-754909b06ebb","36955fd0-cc0e-4b3c-9299-ff484808f728")

*deleting this duplicate based on emptiness
drop if inlist(globalrecordid, "70422852-4a32-4664-96fd-42433ee1b545")

*instructions from Tania in incomplete cases discussion
replace c_houseid = 134 if globalrecordid == "c8b61ac9-3d15-4f29-82ad-24513f09f4fe"
replace c_particid = 2 if globalrecordid == "c8b61ac9-3d15-4f29-82ad-24513f09f4fe"

*my own deductions based on casos incompletos
replace c_particid = 1 if globalrecordid == "3a34a230-24d7-457f-be83-14eac034b4e5"

*tania says these are junk/test cases
drop if inlist(globalrecordid, "266de225-2bd2-4cca-8dfd-64be1ed2dc64","b40c810b-f459-4dba-bdc0-90798ac15510","862eb7f7-5b52-4aa9-a08a-33eb1d2af34f")

*together with Will, we found that this id was changed, for some reason, but can't confirm why
replace c_clustid = 2 if globalrecordid == "6e69b867-7f71-4182-a9b0-9a5f3b632d06"
replace c_houseid = 46 if globalrecordid == "6e69b867-7f71-4182-a9b0-9a5f3b632d06"
replace c_particid = 1 if globalrecordid == "6e69b867-7f71-4182-a9b0-9a5f3b632d06"

*9/19/25 sleuthing
*entry is mostly blank
drop if inlist(globalrecordid, "62b3d9b9-51ab-4e84-aea4-b32a4f4cf78f", "0b856593-42be-4fc1-8e98-f79684f6a0b4", "9cc0ed25-416f-4b8d-b84c-1d421b87e391")
replace c_houseid = 29 if globalrecordid == "ee2ca443-56ad-4395-a68f-ae52d6b76859"

replace c_country = 2

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

*merging to the CDR
merge m:m pid using Cuba_CDR.dta
drop _merge

*some cases are being duplicated or kept after merges from files that aren't from the tablet
drop if globalrecordid == ""

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

order pid

* Export data to Excel
export excel using "duplicates/cognitive_duplicates.xlsx", replace firstrow(variables)
