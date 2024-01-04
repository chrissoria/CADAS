clear all 
set more off
capture log close

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
 
 use rosters_participants
 
  duplicates report globalrecordid
 duplicates drop globalrecordid, force
 
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
export excel using "duplicates/roster_duplicates.xlsx", replace firstrow(variables)
 
 clear all
 
 use Socio
drop pid
drop hhid

replace s_houseid = 83 if globalrecordid == "846f1818-2920-421c-bdde-0a3ac6cb72f2"
 
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

log using "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out/logs/SocioOnlyMissing", text replace


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
 
gen pid_match = 0 
replace pid_match = 1 if pid != pid2
list if pid_match
drop pid_match
 
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
drop p_country_str p_clustid_str p_houseid_str p_particid_str

log using "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out/logs/PhysOnlyMissing", text replace


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

*both of these apppear to be a junk case from sept 1 and 8/25, most values are missing
drop if inlist(globalrecordid, "9350d6a0-a2b7-4c7b-a433-db9b38a4439a","9063c91e-8f34-4497-909d-2814de817c4a")
 
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

log using "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out/logs/InforOnlyMissing", text replace


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
 


drop hhid hhid2
*instructions from guillermina
drop if inlist(globalrecordid, "d3d9c1f9-3ff2-434f-b223-6e4131ddc739","10c63e51-b6b6-444a-9def-621e9920021f","ead54b80-b458-4c82-9b7c-06a64719c74c","e65dc446-42bc-4cd0-b7f8-469569ef66f7")
drop if inlist(globalrecordid, "74574e98-9e46-43cc-991e-716167bd205a","2b1a138b-160d-4ee9-b32b-e849bbd08a22","f2f52561-05a4-4423-9224-e656d7641cea","73290b90-92c0-45a6-8fe5-7337835d7d5b","cf48f800-6bb3-4114-af5f-72f7b7626e4d")
 
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

 log using "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out/logs/HouseholdOnlyMissing", text replace


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

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
insheet using "../CUBA_in/Socio_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Socio, force

save Socio_Child_Parent_Merged.dta, replace

keep if _merge != 3
list

clear all


cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
insheet using "../CUBA_in/Cog_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Cog

save Cog_Child_Parent_Merged.dta, replace

keep if _merge != 3
list

clear all

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
insheet using "../CUBA_in/Phys_Parent.csv"

rename globalrecordid fkey

duplicates report
duplicates drop fkey, force

merge m:m fkey using Phys, force

keep if _merge != 3
list

clear all

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
insheet using "../CUBA_in/Infor_Parent.csv"

rename globalrecordid fkey

merge 1:1 fkey using Infor

keep if _merge != 3
list

clear all

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
insheet using "../CUBA_in/Household_Parent.csv"

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

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
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
