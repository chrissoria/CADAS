clear all 
set more off
capture log close

 cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
 
 use rosters_merged
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
   *dropped below because junk
  drop if inlist(globalrecordid, "6960e6a6-29c2-4567-8826-48f40918d8e0","dd6d514a-0dc6-4ba6-ac6b-6d6ba99b9585","6960e6a6-29c2-4567-8826-48f40918d8e0","44842eb7-f3f0-4a28-bd83-e4d895bf44fe","0d9ad36e-e19e-4a95-8a75-fae393587e17")
  *is dropped below has person id 201004, for which there appears to be two entries for (both have the same age, gender, etc) I'm dropping the one that looks more correct
  drop if inlist(globalrecordid, "34bab32c-fbce-492b-b488-e9bbeed4f14f")
  *is dropped because duplicate, contradicting gender, and missing info has personid 20103501
  drop if inlist(globalrecordid, "1444788e-6d3b-439d-b241-468191f55b5a")
  *is dropped below because suplicate and another case has all of the exact same information
  drop if inlist(globalrecordid, "1e5c9452-4c2a-4a43-831d-dbb2616b8d1e")
  *two weird things about the case below
  *First, both cases have the same male gender
  *Second, both have the same person number, but one is "esposo/a" and the other is si mismo
  *for now, I will recode the case the came after as person 2, ask TANIA
  
  replace pr_person_number = 2 if globalrecordid == "1303aefe-487f-4e40-a58b-c4e1ffc323c2"
  
*deduced this based on the registro and age
replace pr_person_number = 1 if globalrecordid == "a78b55a0-0890-49e0-8723-a3794b07f456"

drop if inlist(globalrecordid, "fda49a83-fa8c-4160-bd85-2240c3388bd3", "8a2f117f-5e28-4fd9-86e3-caa506d31eb9")
  
  /*weird thing about the cases below: they don't have a uniqueid but have data for everything else, which doesn't make sense. Look more closely, but for now, delete. 
  globalrecordid
23e02912-ef40-487e-ad88-f69ce3416247
4660c5ec-e9f8-481a-bbee-8b6fac1dd691
*/

drop if inlist(globalrecordid, "23e02912-ef40-487e-ad88-f69ce3416247", "4660c5ec-e9f8-481a-bbee-8b6fac1dd691")

*The cases below are all empty

drop if inlist(globalrecordid, "c60a8e21-00db-43cc-9d7d-be6402c911c2", "9a9224a0-608d-4d11-a64a-406e5346d1c4", "16f8603e-14af-46e8-9fd0-97fa9346c914", "a4429ae1-422d-42a3-81d2-698ecf133920")
drop if inlist(globalrecordid, "5822714e-e9f4-4ed0-aea9-cf12ea2028fb", "a6e06d9d-d1a6-4fe7-97ce-2219264bdcd9", "e30e095d-5ee8-4990-9202-c2636cde7d7d", "988608d6-0e14-425d-a364-c77e97787690")
drop if inlist(globalrecordid, "ea4d729c-822d-4d25-bbe6-7354d656f6f8", "dd489df6-26c6-4b0e-b376-105e2d64c06b", "64a2fa97-87ee-4345-8107-1e778515cef7", "7bf4a896-f7a4-4c27-8b42-317bc1fbb6a6")
drop if inlist(globalrecordid, "6f457671-88d8-4f7f-9131-d6583219830a", "6cb79064-b40d-4b0c-b05a-275b4cbcd99a", "c025c31e-5b89-49ec-9602-b90cfb4745af", "2602e5bc-e5c6-444f-bcf8-d70cc1b56fc2")
drop if inlist(globalrecordid, "96afbbcb-ffe0-4e84-bcf2-29563054cf0d", "4660c5ec-e9f8-481a-bbee-8b6fac1dd691", "2b7ae8d2-93ca-4d35-bac3-9f488b402fb5", "0d7887b5-10d9-48fb-9427-15224504323a")
drop if inlist(globalrecordid, "0db2f741-8680-4774-8516-42bae7764cc1", "7b9478b6-a938-4c22-84b4-f8ef0d139108", "235cc596-a563-4012-8d73-36537722e0a6", "cc6068c7-bbb7-4127-a384-60a609b4edfa")
drop if inlist(globalrecordid, "ace432e5-cfb7-4d94-bbf7-5cd3cd8bdef1", "7eb18a35-341a-4503-a92a-40d26c8ae542", "d224d57b-89d3-492d-aa20-7c82ea4ed9c0", "9fa9e7df-d127-4c1d-969f-6712cc607c49")
drop if inlist(globalrecordid, "a137357c-af75-4610-9fb9-993abe0f0b12", "2cff098f-1ab8-4376-b563-1bae3471dd6d", "a545cdc6-96a4-4da3-a105-f10dd586d623", "7c40c318-d80a-40cb-bc83-5ddb9e8deacc")
drop if inlist(globalrecordid, "9b7da80c-6f80-4f02-bbf6-1896ffe5647a", "3bc177c7-f239-4615-a7d7-540775250616", "e9d26d57-68f6-4ffa-b8c2-c58dae58a336")

*the case below is a duplicate and is less complete than the other

drop if inlist(globalrecordid, "586ea9af-1d39-40f6-9904-c1fce6295584")
drop pid hhid
gen r_country_str = string(r_country, "%12.0f")

gen r_clustid_str = string(r_clustid, "%12.0f")
replace r_clustid_str = cond(strlen(r_clustid_str) == 1, "0" + r_clustid_str, r_clustid_str)

gen r_houseid_str = string(r_houseid, "%03.0f")
replace r_houseid_str = cond(strlen(r_houseid_str) == 1, "00" + r_houseid_str, r_houseid_str)
replace r_houseid_str = cond(strlen(r_houseid_str) == 2, "0" + r_houseid_str, r_houseid_str)

gen r_particid_str = string(pr_person_number, "%12.0f")
replace r_particid_str = cond(strlen(r_particid_str) == 1, "0" + r_particid_str, r_particid_str)

gen pid = r_country_str + r_clustid_str + r_houseid_str + r_particid_str
gen hhid = r_country_str + r_clustid_str + r_houseid_str
drop r_country_str r_clustid_str r_houseid_str r_particid_str

  
 duplicates report pid
 *this older version of stata doesn't have an easy way to identify duplicate personid, so I'll do it manually
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
 save rosters_participants.dta,replace
 
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
capture export excel using "duplicates/roster_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
use Socio

*interviewer says they mixed these two up
replace s_particid = 2 if globalrecordid == "d8ec834a-acd7-4463-919e-83c386418658"
replace s_particid = 1 if globalrecordid == "8eab231b-cbce-4620-ba1a-1de3955de995"

drop pid
drop hhid
 duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
 *deleting these "junk" files from cuba
drop if inlist(globalrecordid, "f2bfcfe6-4438-4158-b4b8-29ddca8ad2fb", "a48e9e97-6bee-48d7-a040-c106fb781225", "b1337629-fae7-4957-b30c-f45d4d72b267", "c7f1bca0-9624-418d-a35a-20c50602fbb6", "4cc82be3-48e9-4c22-87ac-382ddb7c4f24", "bd2ddd15-66ad-49ff-b1fa-c585c9927176", "9e39dc33-c4bc-4b8a-a1bb-11e5b54668d9")
drop if inlist(globalrecordid, "e6a08058-b663-467b-a8fe-808fa9092300", "b8a6b8c6-255d-4ae9-a0f7-08d60f68a9b6", "78ef6060-de63-4c55-b46a-58bdbdbd96a5", "95233fc6-a441-4368-ad47-c8e70c7dadaf", "51897609-91c6-43eb-8fe6-76919121b287", "6cb0313e-103d-460d-8cca-5f7796845b85", "c5caa2b1-c7e6-40d9-bb55-7a6b18164f76")
drop if inlist(globalrecordid, "0de6bf32-7dbd-4a95-9ab0-989213e5a210")
drop if inlist(globalrecordid, "db69639c-0932-4dfd-b3ce-2a58a32b1483", "6b3b5ba7-558d-4d89-b135-ab0189f8f8d5")

*these also look like junk based on how empty they are

drop if inlist(globalrecordid, "5ccf6d7c-2308-49a2-9a81-f9523a64df34", "1c5a2a7c-e19c-4ea9-8d18-6b2707e9c93c", "ea2318d6-5cab-4942-8cbb-7eea4aba8180")


*is dropped because duplicate personid and less complete
drop if inlist(globalrecordid, "9d73f0c1-9b16-4731-afc1-8f059b174d6f")
 
 *global recordid ad5fe156-95ff-4e45-8265-ea1b17e44683 and 4a73d862-e57f-40f6-93c1-5a739294a998 both have personid 20105002
 *both are very similar, maybe the same person done on 2 separate occasions 
 *need to reach out to Tania to see which is the correct case
 *for now, I will just drop the first case
 drop if inlist(globalrecordid, "ad5fe156-95ff-4e45-8265-ea1b17e44683")
 
*interviewer says she entered in the wrong cluster
replace s_clustid = 6 if globalrecordid == "bcaefbc5-5e39-48a4-8676-184a32a33f34"

*interviewer says she entered in the wrong particid
replace s_particid = 2 if globalrecordid == "83b47556-1fac-4dc9-a91c-e3c3c8a6d2ea"
 
gen s_country_str = string(s_country, "%12.0f")

gen s_clustid_str = string(s_clustid, "%12.0f")
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)

gen s_houseid_str = string(s_houseid, "%03.0f")
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)

gen s_particid_str = string(s_particid, "%12.0f")
replace s_particid_str = cond(strlen(s_particid_str) == 1, "0" + s_particid_str, s_particid_str)

gen pid = s_country_str + s_clustid_str + s_houseid_str + s_particid_str
gen hhid = s_country_str + s_clustid_str + s_houseid_str
drop s_country_str s_clustid_str s_houseid_str s_particid_str

log using "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out/logs/SocioOnlyMissing", text replace


local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

log close
 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
 save Socio.dta, replace
  
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
export excel using "duplicates/socio_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
 use Phys
 drop pid
 drop hhid
 
 duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
 *all of these are mostly empty
drop if globalrecordid == "17d3fd4c-5731-4bcb-94ca-d8bba03a56ff"
drop if globalrecordid == "002919dc-b2d7-497c-993c-a73c0a0705f9"
drop if globalrecordid == "1d905c21-3154-4812-99ee-9921abe3bd77"
drop if globalrecordid == "9fad7efc-1cf4-4e33-89c4-63625d2da4d9"
drop if globalrecordid == "c3854704-44fc-49e6-8e3a-e73c23900529"
drop if globalrecordid == "8005c92d-acbd-47b5-947d-fce02c48f1de"
drop if globalrecordid == "96a27236-0d00-40e1-ac08-9bee063c30bb"
drop if globalrecordid == "1bc35769-79a8-40b4-8389-51f78fab9423"
drop if globalrecordid == "e0fb036e-4cee-4630-94e5-fcb20b6aee10"
drop if globalrecordid == "518121c6-c61b-4d8f-8ddd-97b85cb65744"
drop if globalrecordid == "5cad5da0-8296-4d06-9f1e-9f1befc559dc"
drop if globalrecordid == "fe45b7fb-e06d-4d61-aa90-efeb61ea7432"
drop if globalrecordid == "6ab79689-a63b-440b-b035-0712917b3145"
drop if globalrecordid == "3cadce4d-e9e8-45f3-8619-f717281fb306"
drop if globalrecordid == "fadb34b6-cbcc-455a-b4b2-7b522d846185"
drop if globalrecordid == "6bae9bdb-3384-484b-879f-7606a6dc6557"
drop if globalrecordid == "8351cdbf-d829-435f-b627-6e75727f3291"
drop if globalrecordid == "6268d744-7bc8-44bb-903a-cbba33f2da27"
drop if globalrecordid == "76e508dc-e2f0-4f0a-b2bb-2278759e0f6c"
drop if globalrecordid == "79598f0d-10c7-4e4f-be32-5c0129ddfc00"
drop if globalrecordid == "69956660-15ed-4314-b11b-19929a74b254"
drop if globalrecordid == "7f310053-0677-450f-9212-188f8aaf5ca8"
drop if globalrecordid == "e7944b00-759b-4000-bbd2-a90bc8ecf568"
drop if globalrecordid == "8ef61994-fb5d-4bf9-be9d-17c947f7a0b2"
drop if globalrecordid == "d56e1305-5326-4314-9bcd-ae9608695deb"
drop if globalrecordid == "3424a133-e296-42af-8191-1743534d2413"
drop if globalrecordid == "9ef23cbb-9b81-44d0-8ecc-63ec5de8ba96"
drop if globalrecordid == "fd25d99a-9ca1-48a8-80b4-c9e392a48ddc"
drop if globalrecordid == "40775f7c-74a3-4308-8687-49ceab454daa"
drop if globalrecordid == "794793d4-b793-4882-9325-9ec559abc656"
drop if globalrecordid == "3e1e003b-4fb3-4bfd-a4fa-d5463f5bcad5"
drop if globalrecordid == "2140bae1-2655-4c9c-8589-3036dc5e1fe7"
drop if globalrecordid == "8ef44fed-e5fa-4baf-93d5-f4a470d9b1ea"
drop if globalrecordid == "6c3d323a-d3b5-4e4a-8d93-d95964d90575"
drop if globalrecordid == "ecff1cb4-97a7-4a10-891d-681a26331b55"
drop if globalrecordid == "6a75934a-8a16-4f13-b8cb-bff97eec511f"
drop if globalrecordid == "e5cc3be0-d7cb-4e02-a98d-d834c113c8b3"
drop if globalrecordid == "6c5e33dc-dcba-44f7-bff4-47d0121dd827"
drop if globalrecordid == "ba057a45-72de-4c65-a218-255ee068a4fc"
drop if globalrecordid == "c85fcec0-afa1-456f-b3b7-df4662699167"
drop if globalrecordid == "952afdc4-cdb1-466f-9555-df1fa7a9cc42"
drop if globalrecordid == "0c6e6803-26a8-4535-beef-e6b98a97bc41"
drop if globalrecordid == "d40dc937-98d1-4a6b-a58d-c8a75a9ef871"
drop if globalrecordid == "8fca4756-0d5d-45f2-aa05-bdd3a3b0ce6f"
drop if globalrecordid == "cbd6b5ac-562f-4be3-9819-7ea6bb79eb97"
drop if globalrecordid == "9cbdc8b8-26b7-46bd-99d1-105e31c2dac9"
drop if globalrecordid == "9551d337-6cee-400a-98cf-81a23eb6763c"
drop if globalrecordid == "b176ea67-46d9-4b02-b1f3-7b2de70d5321"
drop if globalrecordid == "0b8bbc44-6486-41cb-9f57-4fba5a765373"
drop if globalrecordid == "fe92f591-b3c9-4e4f-a446-f36e3534720e"
drop if globalrecordid == "30a5cabe-6d44-4827-bed7-5850ea509e67"
drop if globalrecordid == "874efd76-7175-436a-87b6-7e49f6a90d21"
drop if globalrecordid == "aebbf27b-bb03-4d92-806b-d580d86b279c"
drop if globalrecordid == "12a21320-2c03-467c-9f36-68286f9b2a6c"
drop if globalrecordid == "17ff5b28-7686-4dd4-92a8-65e7fb65ddfd"
drop if globalrecordid == "30a87fd3-56c0-43fb-b0e4-0a87de3ad989"
drop if globalrecordid == "fe9b94f7-f840-47a1-9a07-3d4d6afa0f44"
drop if globalrecordid == "e45d76f5-fff5-491a-b110-731c62fba380"
drop if globalrecordid == "bccf8a8b-cec9-4939-9c90-0ba62c233564"
drop if globalrecordid == "d981d354-d14b-4b69-8e0a-731a0bc5eb93"
drop if globalrecordid == "8369dc50-686c-48bb-85a8-c15060e9dfd3"
drop if globalrecordid == "f44a420f-acdf-4a4f-9662-51c378da630b"
drop if globalrecordid == "06e4de7c-b45d-4131-87eb-a150674e2311"
drop if globalrecordid == "e812bc8b-7aa4-4b10-a19f-3e1470bf06b4"
drop if globalrecordid == "b1813576-a39a-48b0-bdcd-8bed013dae9e"
drop if globalrecordid == "d6b61e57-ab3f-4282-a893-fc7d0eeddd2d"

 
 *dropping these junk files that were entered before the study started
drop if inlist(globalrecordid, "38ddf6b0-7465-425a-9534-1f042dbbe352", "985efbd2-5bd0-42c9-b9db-ca9205a8369d","70fa9041-5a26-4751-bf75-f9326e11a783", "99db8029-9609-4fb6-baac-852b38db7e36")
drop if inlist(globalrecordid, "48135c80-626c-4114-b103-a8a32e5a86a2")
 
 *globalrecordid 7e0f47e0-9fcd-4e98-969e-8fa3eb3c386b and 899f1599-5cfb-4b1d-b61f-c9467ba12e1b have same personid 20106401
 *both are complete cases but different, both from houseid 64 person number 1
 *Tania's sheet says there should be person 2 in this house, i will code the person who did the survey last as person 2

 replace p_particid = 2 if globalrecordid == "899f1599-5cfb-4b1d-b61f-c9467ba12e1b"
 
 gen p_country_str = string(p_country, "%12.0f")

gen p_clustid_str = string(p_clustid, "%12.0f")
replace p_clustid_str = cond(strlen(p_clustid_str) == 1, "0" + p_clustid_str, p_clustid_str)

gen p_houseid_str = string(p_houseid, "%03.0f")
replace p_houseid_str = cond(strlen(p_houseid_str) == 1, "00" + p_houseid_str, p_houseid_str)
replace p_houseid_str = cond(strlen(p_houseid_str) == 2, "0" + p_houseid_str, p_houseid_str)

gen p_particid_str = string(p_particid, "%12.0f")
replace p_particid_str = cond(strlen(p_particid_str) == 1, "0" + p_particid_str, p_particid_str)

gen pid = p_country_str + p_clustid_str + p_houseid_str + p_particid_str
gen hhid = p_country_str + p_clustid_str + p_houseid_str
drop p_country_str p_clustid_str p_houseid_str p_particid_str

log using "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out/logs/PhysOnlyMissing", text replace


local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

log close
 save Phys.dta, replace

 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
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
export excel using "duplicates/phys_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
 use Infor
 
 drop pid hhid
 
*tania says the correct person id for the below case is 2
 *The personid duplicate below is 20104501, 306dd8e0-eed1-426d-9196-f180c7a8fd4a is person 2
 *question b3 provides age, which I used to match to person number
 *age 72 is person 1, age 66 is person 2
replace i_particid = 2 if globalrecordid == "306dd8e0-eed1-426d-9196-f180c7a8fd4a"

*tania says the correct person id for the below case is 1
 *person 1 is age 79, person 2 is age 77
 *personid duplicate 20105002, e69aad3b-5367-4f9c-90cb-8f1c9543eaee, is being recoded to person number 1
 
replace i_particid = 1 if globalrecordid == "e69aad3b-5367-4f9c-90cb-8f1c9543eaee"

*personid 20106402 is duplicated and not easy to decipher which is which (105e8dcc-7c09-464c-a092-42032ace1494)
*one of two persons appear to be a proxy age 74, as their ages do not match what was put in completo rechazado sheet
*I suspect that the age put down in informante is incorrect, as both the roster and cr sheet say person 2 is 81
*person 1 is female is cr and person 2 is male (according to roster and cr sheet), and so I will recode accordingly

 replace i_particid = 2 if globalrecordid == "105e8dcc-7c09-464c-a092-42032ace1494"
 
 *the case below looks like a "junk" file pid 20100201
 *nearly every column is empty but the first part of the file has some information
 *the other two people from this household are already in the data
 
 drop if inlist(globalrecordid, "a3b83872-c6bb-482e-a5f5-b0788f4438e0")
 
*interviewer says this is the correct id 
replace i_particid = 2 if globalrecordid == "f3fef9bd-fcc9-458e-ae76-bf40abc44850"
replace i_particid = 1 if globalrecordid == "7d2d1034-dc25-43ab-ae5d-eb35acca0fd9"
replace i_particid = 2 if globalrecordid == "94d971a8-8ee0-435c-861b-aa7067b64457"

*Tania says this should be participant 1

replace i_particid = 1 if globalrecordid == "87a78ce1-5c4c-46b6-ad31-4af765074cb6"

*Tania says this participant should be from houseid 52
replace i_particid = 1 if globalrecordid == "73516e7d-4288-499a-a89c-9ffde5d2df0a"

*instructions from Tania
replace i_particid = 2 if globalrecordid == "1df5da6e-02c9-424a-8e67-03573a33ff8d"

drop if inlist(globalrecordid, "f4ddf443-fc07-46e9-a42a-244c86e3c75f", "4a071c21-104b-482b-a2c0-7d329e926960")
 
 gen i_country_str = string(i_country, "%12.0f")

gen i_clustid_str = string(i_clustid, "%12.0f")
replace i_clustid_str = cond(strlen(i_clustid_str) == 1, "0" + i_clustid_str, i_clustid_str)

gen i_houseid_str = string(i_houseid, "%03.0f")
replace i_houseid_str = cond(strlen(i_houseid_str) == 1, "00" + i_houseid_str, i_houseid_str)
replace i_houseid_str = cond(strlen(i_houseid_str) == 2, "0" + i_houseid_str, i_houseid_str)

gen i_particid_str = string(i_particid, "%12.0f")
replace i_particid_str = cond(strlen(i_particid_str) == 1, "0" + i_particid_str, i_particid_str)

gen pid = i_country_str + i_clustid_str + i_houseid_str + i_particid_str
gen hhid = i_country_str + i_clustid_str + i_houseid_str

drop i_country_str i_clustid_str i_houseid_str i_particid_str

log using "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out/logs/InforOnlyMissing", text replace


local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

log close
 
 duplicates report pid
 sort pid
 gen is_duplicate = pid[_n] == pid[_n-1]
 list if is_duplicate
 drop is_duplicate
 
 save Infor.dta, replace
 
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

export excel using "duplicates/informant_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
use Household
 
*It looks like epi info is spitting out duplicate household cases
*I will drop the duplicate junk file for now, but will have to get to the bottom of what's going here later
*interestingly they have the same fkey but all have unique parents! weird
 
 drop if inlist(hhid, "20000.")
 drop if inlist(globalrecordid, "877e1f39-a477-4c9d-b11e-af9444311089", "154d9869-68a5-4450-9da6-9d2083777a20")
 
*Tania says this is junk
drop if inlist(globalrecordid, "2fc4ddfa-a29a-4ae8-8960-df1050a71729")
 
*interviewer says these are a duplicate
drop if inlist(globalrecordid, "e1446acf-d758-437a-8f33-ec2c69dcda99")
drop if inlist(globalrecordid, "4caebb32-0d40-4ed9-b08f-66eb4bdcebf6")
drop if inlist(globalrecordid, "1c52bce1-5967-4a86-a6a7-b1a1fa6c5a94", "de718065-00cf-461f-a918-80bd780309f4")
 
 *this looks like junk (mostly empty)
 
 drop if inlist(globalrecordid, "cb2296d9-7344-40ff-a971-d3d5fe0b089d")
 
 log using "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out/logs/HouseholdOnlyMissing", text replace


local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

log close
 
 duplicates report hhid
 sort hhid
 gen is_duplicate = hhid[_n] == hhid[_n-1]
 list if is_duplicate
 
 *7ac9fe02-99d7-412c-86f2-89d25b243930 was created by me, delete
 *globalrecordid: 8d81d273-cf4a-495f-820d-2398360babc8, b91b8627-bc88-476c-944a-4157eafead99, 8aea5f27-6c25-4e9a-8fcc-b135f9ca3157, 8c27f197-12d2-45d6-873e-42fa3df6adcc, 2448b616-5773-403a-a24b-2128524a783c
 *the above record ID have mostly missing data, including house number. For now, I will delete, but I will have to dig into this a bit more to make sure they aren't corrupted data
 *I believe these might be junk
 
 *hhid 201035 is duplicated and both look like they could be valid, but slightly different.
 *I'll have to reach out to Tania to find out which of the two is valid
 *same thing with 201043

drop is_duplicate

save Household.dta, replace

gen is_duplicate = hhid[_n] == hhid[_n-1]

* Mark all duplicate observations with 1 and non-duplicates with 0
duplicates tag hhid, gen(duplicate_tag)

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
export excel using "duplicates/Household_duplicates.xlsx", replace firstrow(variables)

clear all

 *Next, I will merge each child with the parent and see if things are matching
 *Parents match to child with the fkey to globalrecordid, so I will need to rename the fkey to globalrecordid in the child


*next, I want to find out if we have the right amount of cog scoring and cog surveys

cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
use Cog_Scoring

*for no, I will do m:m because I have't been able to pin down which unique cases are the true/correct ones
merge m:m pid using Cog, force

keep if _merge != 3

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

export excel using "duplicates/no_coincidencias_cog.xlsx", replace firstrow(variables)

list

*e07eb881-5c85-4d8b-a4e7-59ec774cbd70 and 348c3d1d-e5c5-495f-87dd-e31bc8115251 are two cognitive scoring files with no cogntive survey

/*globalrecordid
bd349b37-ff38-4271-b099-12b6845b964c no particid or houseid
c8799648-57ad-4864-8a0e-f2cce230e3d2 no particid or houseid
b81579ca-4945-46da-8d06-45273fcfbeb5 pid 20100201, probably junk
5133ce8a-22c6-4432-b2d0-3b9885b5a885 pid 20103901, probably junk
the above are all cognitve surveys with no cognitve scoring files.*/

