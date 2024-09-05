clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

local country = 1

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}

cd "`path'/DR_out"

use door_merged_all

drop pid hhid

*from Ty's matching
*house id's
replace d_houseid = 29 if globalrecordid == "7ba30527-90f6-4b2d-84c2-8370678cfcaf"
replace d_houseid = 30 if globalrecordid == "976ddad4-e64b-4bce-9afd-3f876674bc4b"
replace d_houseid = 22 if globalrecordid == "11fcbbcb-d9cc-4d87-8efd-d4e747d0c71b"
replace d_houseid = 23 if globalrecordid == "c14d0d80-a3eb-4f58-ac0b-63dab2e283be"
replace d_houseid = 31 if globalrecordid == "ba3c9fdb-df4e-4e2c-94f7-2b68aa47d5f1"
replace d_houseid = 141 if globalrecordid == "a8288802-aa69-4a80-b80c-dc09f1d6de46"
replace d_houseid = 118 if globalrecordid == "99e949d1-0946-41b9-a4f3-56d7dcc939b6"
replace d_houseid = 103 if globalrecordid == "779aa580-e08a-4f18-8002-58200629019c"
replace d_houseid = 127 if globalrecordid == "e8566165-2d34-4762-9359-35211820e612"
replace d_houseid = 132 if globalrecordid == "4f1437ef-a1e5-43de-afc7-8bc02dec3817"
replace d_houseid = 163 if globalrecordid == "3fdd5060-16eb-47a2-b687-1efa4aee054a"
replace d_houseid = 135 if globalrecordid == "ca84ae0a-6823-4900-8409-992d2370a513"
replace d_houseid = 131 if globalrecordid == "b6b9a5f0-0064-440a-9c54-bf8cd48646fc"
replace d_houseid = 121 if globalrecordid == "047215fc-81d0-4775-bdc7-2191b20bb259"
replace d_houseid = 129 if globalrecordid == "1be18fdd-12be-42fb-9a77-34f1dd7d3104"
replace d_houseid = 200 if globalrecordid == "f846f28b-5190-4ec3-ba4c-f96dd5c7523b"
replace d_houseid = 25 if globalrecordid == "ce6d5e75-40a3-40a4-b531-40ef07c51570"
replace d_houseid = 213 if globalrecordid == "12c7c7e1-2d1c-4170-a092-d5ee66dfebb9"
replace d_houseid = 245 if globalrecordid == "30a0fb9a-b112-467f-b506-58a44220d83c"
replace d_houseid = 179 if globalrecordid == "985877a9-6be5-4abf-8871-efcd40f8cc94"
replace d_houseid = 246 if globalrecordid == "45f558f6-a99b-46ba-9f8f-133370e70b72"
replace d_houseid = 9 if globalrecordid == "de8f66bb-58b6-492a-b722-edf0d9461856"
replace d_houseid = 9 if globalrecordid == "1996256c-a593-49c5-bd86-1fd9c3393b8b"
replace d_houseid = 2 if globalrecordid == "73d19262-6925-4180-b3ab-8f70369dba12"
replace d_houseid = 6 if globalrecordid == "438250fc-fa58-4713-9f30-032db1c1db24"
replace d_houseid = 1 if globalrecordid == "bded085d-77a3-4303-83da-f1f56ce53a08"
replace d_houseid = 16 if globalrecordid == "0a766d6c-c44d-44d3-8243-47cf3be2af1d"
replace d_houseid = 4 if globalrecordid == "3fd77f6d-571d-4d9f-be28-def88627ee9f"
replace d_houseid = 4 if globalrecordid == "5df281df-8fdf-48a6-a7f9-09f9993baf59"
replace d_houseid = 3 if globalrecordid == "024ab575-6fd4-4fd3-8a5f-93c114336c2d"
replace d_houseid = 10 if globalrecordid == "0e569068-bd75-48d8-ae0a-70ec663e4d4b"
replace d_houseid = 5 if globalrecordid == "66d748a7-d301-42c8-b1f1-152c2af3402e"
replace d_houseid = 8 if globalrecordid == "87e269cf-5a35-42f0-a2b0-8b6dfbdbd62b"
replace d_houseid = 2 if globalrecordid == "68730268-c1f4-42b7-9c74-1d062af234db"
replace d_houseid = 26 if globalrecordid == "ae7fa9b9-91ee-44aa-b277-14cde17936c9"
replace d_houseid = 21 if globalrecordid == "a26dda0f-b037-4eb1-aadd-b9be85c7caeb"
replace d_houseid = 28 if globalrecordid == "c74bad97-a489-4260-8119-500be54522c0"
replace d_houseid = 101 if globalrecordid == "de766266-9c7a-429a-ae64-5d011d0b6fdc"
replace d_houseid = 110 if globalrecordid == "767eb81d-2ef3-4b9a-9657-4766c3f459e1"
replace d_houseid = 111 if globalrecordid == "9ddf26c7-7352-4e78-aa33-6bcb9f0b4e3d"
replace d_houseid = 158 if globalrecordid == "0a777d1f-31cf-4012-bda1-f404145becfa"
replace d_houseid = 117 if globalrecordid == "c7436fe6-dac0-473f-8eaf-75dc54eb6f93"
replace d_houseid = 109 if globalrecordid == "b3256b0f-5c2b-424f-a549-37e5b6418a50"
replace d_houseid = 161 if globalrecordid == "112a8f7a-4732-4816-b85d-84f985cd3b17"
replace d_houseid = 143 if globalrecordid == "78f568e5-01c3-45b8-9ad3-3ba46a98ca3a"
replace d_houseid = 217 if globalrecordid == "ff6600a4-00dc-4a4b-acce-1256a4489450"
replace d_houseid = 220 if globalrecordid == "c3637e01-9e52-43e2-bf9c-51a79593e9c1"
replace d_houseid = 196 if globalrecordid == "74d7901f-f8ad-4202-b51a-cabd22e16a98"
replace d_houseid = 206 if globalrecordid == "2d42b9e0-0718-45e0-ad5e-8d8231707021"
replace d_houseid = 195 if globalrecordid == "e0611a2b-4b45-41f2-bbb3-fb25db3e8824"
replace d_houseid = 208 if globalrecordid == "f318b51b-2498-4b2b-a97d-e574df65a7e1"
replace d_houseid = 205 if globalrecordid == "bcd51641-7734-4888-aff4-bdcfe0a90b12"
replace d_houseid = 211 if globalrecordid == "1eb0764d-bea7-4956-bb88-96ed21a27872"

*clustid

replace d_clustid = 6 if globalrecordid == "de8f66bb-58b6-492a-b722-edf0d9461856"
replace d_clustid = 6 if globalrecordid == "1996256c-a593-49c5-bd86-1fd9c3393b8b"
replace d_clustid = 6 if globalrecordid == "73d19262-6925-4180-b3ab-8f70369dba12"
replace d_clustid = 6 if globalrecordid == "438250fc-fa58-4713-9f30-032db1c1db24"
replace d_clustid = 6 if globalrecordid == "bded085d-77a3-4303-83da-f1f56ce53a08"
replace d_clustid = 6 if globalrecordid == "0a766d6c-c44d-44d3-8243-47cf3be2af1d"
replace d_clustid = 6 if globalrecordid == "3fd77f6d-571d-4d9f-be28-def88627ee9f"
replace d_clustid = 6 if globalrecordid == "5df281df-8fdf-48a6-a7f9-09f9993baf59"
replace d_clustid = 6 if globalrecordid == "024ab575-6fd4-4fd3-8a5f-93c114336c2d"
replace d_clustid = 6 if globalrecordid == "0e569068-bd75-48d8-ae0a-70ec663e4d4b"
replace d_clustid = 6 if globalrecordid == "66d748a7-d301-42c8-b1f1-152c2af3402e"
replace d_clustid = 6 if globalrecordid == "87e269cf-5a35-42f0-a2b0-8b6dfbdbd62b"
replace d_clustid = 6 if globalrecordid == "68730268-c1f4-42b7-9c74-1d062af234db"
replace d_clustid = 8 if globalrecordid == "ae7fa9b9-91ee-44aa-b277-14cde17936c9"
replace d_clustid = 2 if globalrecordid == "a26dda0f-b037-4eb1-aadd-b9be85c7caeb"
replace d_clustid = 8 if globalrecordid == "c74bad97-a489-4260-8119-500be54522c0"
replace d_clustid = 9 if globalrecordid == "de766266-9c7a-429a-ae64-5d011d0b6fdc"
replace d_clustid = 9 if globalrecordid == "767eb81d-2ef3-4b9a-9657-4766c3f459e1"
replace d_clustid = 9 if globalrecordid == "9ddf26c7-7352-4e78-aa33-6bcb9f0b4e3d"
replace d_clustid = 9 if globalrecordid == "0a777d1f-31cf-4012-bda1-f404145becfa"
replace d_clustid = 9 if globalrecordid == "c7436fe6-dac0-473f-8eaf-75dc54eb6f93"
replace d_clustid = 9 if globalrecordid == "b3256b0f-5c2b-424f-a549-37e5b6418a50"
replace d_clustid = 9 if globalrecordid == "112a8f7a-4732-4816-b85d-84f985cd3b17"
replace d_clustid = 9 if globalrecordid == "78f568e5-01c3-45b8-9ad3-3ba46a98ca3a"
replace d_clustid = 2 if globalrecordid == "ff6600a4-00dc-4a4b-acce-1256a4489450"
replace d_clustid = 2 if globalrecordid == "c3637e01-9e52-43e2-bf9c-51a79593e9c1"
replace d_clustid = 2 if globalrecordid == "74d7901f-f8ad-4202-b51a-cabd22e16a98"
replace d_clustid = 2 if globalrecordid == "2d42b9e0-0718-45e0-ad5e-8d8231707021"
replace d_clustid = 2 if globalrecordid == "e0611a2b-4b45-41f2-bbb3-fb25db3e8824"
replace d_clustid = 2 if globalrecordid == "f318b51b-2498-4b2b-a97d-e574df65a7e1"
replace d_clustid = 2 if globalrecordid == "bcd51641-7734-4888-aff4-bdcfe0a90b12"
replace d_clustid = 2 if globalrecordid == "1eb0764d-bea7-4956-bb88-96ed21a27872"
replace d_clustid = 8 if globalrecordid == "7ba30527-90f6-4b2d-84c2-8370678cfcaf"
replace d_clustid = 8 if globalrecordid == "976ddad4-e64b-4bce-9afd-3f876674bc4b"
replace d_clustid = 8 if globalrecordid == "11fcbbcb-d9cc-4d87-8efd-d4e747d0c71b"
replace d_clustid = 8 if globalrecordid == "c14d0d80-a3eb-4f58-ac0b-63dab2e283be"
replace d_clustid = 8 if globalrecordid == "ba3c9fdb-df4e-4e2c-94f7-2b68aa47d5f1"
replace d_clustid = 9 if globalrecordid == "a8288802-aa69-4a80-b80c-dc09f1d6de46"
replace d_clustid = 9 if globalrecordid == "99e949d1-0946-41b9-a4f3-56d7dcc939b6"
replace d_clustid = 9 if globalrecordid == "779aa580-e08a-4f18-8002-58200629019c"
replace d_clustid = 9 if globalrecordid == "e8566165-2d34-4762-9359-35211820e612"
replace d_clustid = 8 if globalrecordid == "4f1437ef-a1e5-43de-afc7-8bc02dec3817"
replace d_clustid = 9 if globalrecordid == "3fdd5060-16eb-47a2-b687-1efa4aee054a"
replace d_clustid = 9 if globalrecordid == "ca84ae0a-6823-4900-8409-992d2370a513"
replace d_clustid = 9 if globalrecordid == "b6b9a5f0-0064-440a-9c54-bf8cd48646fc"
replace d_clustid = 9 if globalrecordid == "047215fc-81d0-4775-bdc7-2191b20bb259"
replace d_clustid = 9 if globalrecordid == "1be18fdd-12be-42fb-9a77-34f1dd7d3104"
replace d_clustid = 2 if globalrecordid == "f846f28b-5190-4ec3-ba4c-f96dd5c7523b"
replace d_clustid = 2 if globalrecordid == "ce6d5e75-40a3-40a4-b531-40ef07c51570"
replace d_clustid = 2 if globalrecordid == "12c7c7e1-2d1c-4170-a092-d5ee66dfebb9"
replace d_clustid = 2 if globalrecordid == "30a0fb9a-b112-467f-b506-58a44220d83c"
replace d_clustid = 2 if globalrecordid == "985877a9-6be5-4abf-8871-efcd40f8cc94"
replace d_clustid = 2 if globalrecordid == "45f558f6-a99b-46ba-9f8f-133370e70b72"

gen d_country_str = string(d_country, "%12.0f")

gen d_clustid_str = string(d_clustid, "%12.0f")
replace d_clustid_str = cond(strlen(d_clustid_str) == 1, "0" + d_clustid_str, d_clustid_str)

gen d_houseid_str = string(d_houseid, "%03.0f")
replace d_houseid_str = cond(strlen(d_houseid_str) == 1, "00" + d_houseid_str, d_houseid_str)
replace d_houseid_str = cond(strlen(d_houseid_str) == 2, "0" + d_houseid_str, d_houseid_str)

gen d_particid_str = string(d_particid, "%12.0f")

gen pid = d_particid_str + d_country_str + d_clustid_str + d_houseid_str
replace pid = "." if strpos(pid, ".") > 0

gen hhid = d_country_str + d_clustid_str + d_houseid_str
replace hhid = "." if strpos(hhid, ".") > 0

drop d_particid_str d_country_str d_clustid_str d_houseid_str
capture drop globalrecordid1

save door_merged_all.dta, replace

keep if hhid == "."

export excel using "duplicates/door_no_houseid.xlsx", replace firstrow(variables)

clear all

import excel using "../DR_in/Resumen de entrevistas.xlsx", firstrow

capture destring(Cluster) , replace
capture destring(HouseID) , replace
capture destring(Participante) , replace
gen clustid_str = string(Cluster, "%12.0f")
gen houseid_str = string(HouseID, "%03.0f")
gen particid_str = string(Participante, "%12.0f")

gen country_str = "1"

replace clustid_str = cond(strlen(clustid_str) == 1, "0" + clustid_str, clustid_str)

replace houseid_str = cond(strlen(houseid_str) == 1, "00" + houseid_str, houseid_str)
replace houseid_str = cond(strlen(houseid_str) == 2, "0" + houseid_str, houseid_str)

replace particid_str = cond(strlen(particid_str) == 1, "0" + particid_str, particid_str)

gen pid = country_str + clustid_str + houseid_str + particid_str
drop country_str clustid_str houseid_str particid_str

order pid

save resumen.dta,replace

keep pid 

save resumen_pid.dta,replace 

clear all
 
 use rosters_merged

 
drop pid hhid

*instructions from Guille and her team
*drop if inlist(globalrecordid, "2866ca24-3b54-4e60-b7d4-5d3e940cc2ce", "0e970762-11bd-4c26-8234-8730d55c4a81", "dee51673-76f6-4ef8-a316-7cb20fabd747", "bb478c19-8ebb-4171-9549-731acdca5fae")
*drop if inlist(globalrecordid, "2fba1415-085f-4054-9aba-df4e59f598ff")


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
 
 save rosters_merged.dta,replace
 
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

drop if pr_person_number == .
order pid

* Export data to Excel
export excel using "duplicates/roster_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
use Socio
drop pid
drop hhid

replace s_houseid = 83 if globalrecordid == "846f1818-2920-421c-bdde-0a3ac6cb72f2"

replace s_houseid = 176 if globalrecordid == "3a7c732c-4edb-4e8d-aa62-e12d03c86b2a"

drop if inlist(globalrecordid, "56fbe48f-d423-417a-87ba-98ba80db0c34")
 
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

sort s_parent_clustid s_parent_houseid
order pid_parent pid pid_nonmatch globalrecordid

drop s_clustid_str s_houseid_str s_particid_str s_country_str

merge m:m pid using resumen_pid

capture gen resumen = string(_merge)
capture replace resumen = string(_merge)
replace resumen = "Not in Resumen" if _merge == 1
replace resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid resumen

export excel using "excel/socio.xlsx", replace firstrow(variables)

log using logs/SocioOnlyMissing, text replace


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
 
 /*
gen pid_match = 0 
replace pid_match = 1 if pid != pid_parent
list if pid_match
drop pid_match
*/
 
 
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
capture export excel using "duplicates/socio_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
 use Phys
 drop pid
 drop hhid
 
 duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
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

sort p_parent_clustid p_parent_houseid
order pid_parent pid pid_nonmatch globalrecordid

drop p_country_str p_clustid_str p_houseid_str p_particid_str

merge m:m pid using resumen_pid

capture gen resumen = string(_merge)
capture replace resumen = string(_merge)
replace resumen = "Not in Resumen" if _merge == 1
replace resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid resumen

export excel using "excel/examen_fisico.xlsx", replace firstrow(variables)

log using logs/PhysOnlyMissing, text replace


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
 
 save Phys.dta, replace
 
 clear all
 
 use Infor
 
*based on the age of the informant (66), I have deduced that this is survey belongs to participant 1 (who is 92)
replace i_particid = 1 if globalrecordid == "c7ddca33-5131-453b-b3a7-46bb89b22e4f"
*and visa-verse
replace i_particid = 2 if globalrecordid == "ab8cb82c-dfbf-4249-9225-5af21101db78"

*instructions from guillermina
replace i_particid = 1 if globalrecordid == "515d1632-ce79-493d-9fbf-9897ffbffc5c"

replace i_clustid = 176 if globalrecordid == "a4184246-538b-41fc-a23b-80a6992f616b"

replace i_houseid2 = 66 if globalrecordid == "746a368c-a2cd-491f-9040-6654b2c87640"
replace i_houseid = 66 if globalrecordid == "746a368c-a2cd-491f-9040-6654b2c87640"


replace i_houseid2 = 77 if globalrecordid == "449e7a26-a22d-4feb-b7ed-35b1f36ce77a"
replace i_houseid = 77 if globalrecordid == "449e7a26-a22d-4feb-b7ed-35b1f36ce77a"

*both of these apppear to be a junk case from sept 1 and 8/25, most values are missing
drop if inlist(globalrecordid, "9350d6a0-a2b7-4c7b-a433-db9b38a4439a","9063c91e-8f34-4497-909d-2814de817c4a", "2bbb0db0-005d-49f9-8465-c97b2bd22d88")

*instructions from Guille and her team
drop if inlist(globalrecordid, "515d1632-ce79-493d-9fbf-9897ffbffc5c")
 
 *instructions from guillermina
drop if inlist(globalrecordid, "7bd0cbfa-4400-42a6-bc25-096aface341b","f40f5149-111e-4181-bdfc-aaa7bfd9ceb1","219fcb2c-658d-45cd-96bd-162d93b777ce")
 drop pid hhid
 
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

sort i_parent_clustid i_parent_houseid
order pid_parent pid pid_nonmatch globalrecordid

merge m:m pid using resumen_pid

capture gen resumen = string(_merge)
capture replace resumen = string(_merge)

replace resumen = "Not in Resumen" if _merge == 1
replace resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid resumen

export excel using "excel/informante.xlsx", replace firstrow(variables)

log using logs/InforOnlyMissing, text replace


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
 
use Cog

merge m:m pid using resumen_pid

capture gen resumen = string(_merge)
capture replace resumen = string(_merge)
replace resumen = "Not in Resumen" if _merge == 1
replace resumen = "Found in Resumen" if _merge == 3
drop if _merge == 2
drop _merge

order pid_parent pid resumen

save Cog.dta, replace

clear all

 
 use Household
 
drop hhid hhid2
*instructions from guillermina
drop if inlist(globalrecordid, "d3d9c1f9-3ff2-434f-b223-6e4131ddc739","10c63e51-b6b6-444a-9def-621e9920021f","ead54b80-b458-4c82-9b7c-06a64719c74c","e65dc446-42bc-4cd0-b7f8-469569ef66f7")
drop if inlist(globalrecordid, "74574e98-9e46-43cc-991e-716167bd205a","2b1a138b-160d-4ee9-b32b-e849bbd08a22","f2f52561-05a4-4423-9224-e656d7641cea","73290b90-92c0-45a6-8fe5-7337835d7d5b","cf48f800-6bb3-4114-af5f-72f7b7626e4d")

replace h_clustid = 176 if globalrecordid == "26a57540-2990-4236-bc26-5896acc7ead8"
drop if inlist(globalrecordid, "31614f8a-69c9-4012-96ee-bc4154ca6491", "19b6756d-1236-4abc-b36c-142b71548a50", "3fd9b0fb-8fd1-4c8a-90e1-30b6511b51e5", "3cfbdb1c-1f42-414b-9227-83a1345ac34f")

gen h_country_str = string(h_country, "%12.0f")

gen h_clustid_str = string(h_clustid, "%12.0f")
replace h_clustid_str = cond(strlen(h_clustid_str) == 1, "0" + h_clustid_str, h_clustid_str)

gen h_houseid_str = string(h_houseid, "%03.0f")
replace h_houseid_str = cond(strlen(h_houseid_str) == 1, "00" + h_houseid_str, h_houseid_str)
replace h_houseid_str = cond(strlen(h_houseid_str) == 2, "0" + h_houseid_str, h_houseid_str)

gen hhid = h_country_str + h_clustid_str + h_houseid_str
drop h_clustid_str h_houseid_str

*second entry

gen h_clustid2_str = string(h_conglid2, "%12.0f")
replace h_clustid2_str = cond(strlen(h_clustid2_str) == 1, "0" + h_clustid2_str, h_clustid2_str)

gen h_houseid2_str = string(h_houseid2, "%03.0f")
replace h_houseid2_str = cond(strlen(h_houseid2_str) == 1, "00" + h_houseid2_str, h_houseid2_str)
replace h_houseid2_str = cond(strlen(h_houseid2_str) == 2, "0" + h_houseid2_str, h_houseid2_str)


gen hhid2 = h_country_str + h_clustid2_str + h_houseid2_str 
drop h_country_str h_clustid2_str h_houseid2_str 

 duplicates report hhid
 sort hhid
 gen is_duplicate = hhid[_n] == hhid[_n-1]
 list if is_duplicate
 
drop is_duplicate

save Household.dta, replace
export excel using "excel/familiar.xlsx", replace firstrow(variables)

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
capture export excel using "duplicates/Household_duplicates.xlsx", replace firstrow(variables)

 log using logs/HouseholdOnlyMissing, text replace


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

clear all

 *Next, I will merge each child with the parent and see if things are matching
 *Parents match to child with the fkey to globalrecordid, so I will need to rename the fkey to globalrecordid in the child

cd "`path'/DR_out"
insheet using "../DR_in/Socio_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Socio, force

save Socio_Child_Parent_Merged.dta, replace

keep if _merge != 3
list

clear all


cd "`path'/DR_out"
insheet using "../DR_in/Cog_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Cog

save Cog_Child_Parent_Merged.dta, replace

keep if _merge != 3
list

clear all

cd "`path'/DR_out"
insheet using "../DR_in/Phys_Parent.csv"

rename globalrecordid fkey

duplicates report
duplicates drop fkey, force

merge m:m fkey using Phys, force

keep if _merge != 3
list

clear all

cd "`path'/DR_out"
insheet using "../DR_in/Infor_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Infor

keep if _merge != 3
list

clear all

cd "`path'/DR_out"
insheet using "../DR_in/Household_Parent.csv"

rename globalrecordid fkey

clear all
use Household
gen is_duplicate = fkey[_n] == fkey[_n-1]
list if is_duplicate

merge 1:1 fkey using Household

keep if _merge != 3
list

clear all

*next, I want to find out if we have the right amount of cog scoring and cog surveys

cd "`path'/DR_out"
use Cog_Scoring

*for now, I will do m:m because I have't been able to pin down which unique cases are the true/correct ones
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
