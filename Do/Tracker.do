
clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
}

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

* Set translation folder path based on language
if `"$language"' == "E" {
    if `country' == 0 {
        local trans_folder "translation_PR/"
    }
    else if `country' == 1 {
        local trans_folder "translation_DR/"
    }
    else if `country' == 2 {
        local trans_folder "translation_CUBA/"
    }
}
else {
    local trans_folder ""
}

*below we use the output from Resumen.do instead of re-importing the Excel file

/*The goal of this do file is to:
A. Track which individuals took one survey but not the others
B. Count Unique Households
C. Check to see gender in Socio matches gender in Roster
*/

* Use resumen.dta produced by Resumen.do
use resumen.dta, clear

duplicates drop pid, force

save resumen_tracker.dta, replace
clear

*here i want to pull out a "master unique" set of pid's, pulling a unique list from all data rather than just one source
clear
set obs 0
gen pid = ""
save "all_unique_pids.dta", replace

local datasets "resumen_tracker rosters_participants Socio Phys Cog Cog_Scoring Infor"
local trans_datasets "Socio Phys Cog Cog_Scoring Infor"

foreach dataset in `datasets' {
    * Check if this dataset needs translation folder
    local use_trans = 0
    foreach td in `trans_datasets' {
        if "`dataset'" == "`td'" {
            local use_trans = 1
        }
    }

    if `use_trans' == 1 {
        use "`trans_folder'`dataset'.dta", clear
    }
    else {
        use "`dataset'.dta", clear
    }

    keep pid
    duplicates drop

    append using "all_unique_pids.dta"
    save "all_unique_pids.dta", replace
}

use "all_unique_pids.dta", clear
duplicates drop
gen hhid=substr(pid,1,6)
save "all_unique_pids.dta", replace

log using logs/tracker, text replace


*********
* RESUMEN ENTREVISTAS
********

use resumen_tracker.dta, clear

* Keep only the variables we need (capture in case some don't exist)
capture confirm variable age
if _rc != 0 {
    gen age = .
}
capture confirm variable sex
if _rc != 0 {
    gen sex = .
}
capture confirm variable House_ID
if _rc != 0 {
    gen House_ID = ""
}
capture confirm variable Cluster
if _rc != 0 {
    gen Cluster = ""
}

keep pid age sex House_ID Cluster
gen pidr=real(pid)

* sex is already numeric (0/1) from Resumen.do
* age may need to be destring if it came in as string (force to handle non-numeric values)
capture confirm numeric variable age
if _rc != 0 {
    destring age, replace force
}

egen duplic=count(pid), by(pid)
egen sd_sex=sd(sex), by(pid)
egen sd_age=sd(age), by(pid)
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid sex age duplic if duplic>1 /* print duplicate obs */
gen pid_en_resumen=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
sum
save tracker, replace

use all_unique_pids.dta, clear
merge 1:m pid using tracker.dta
drop _merge
save tracker.dta, replace

********** 
* ROSTER_PARTICIPANTS
**********
use rosters_participants, clear
keep pid pr_3 pr_4 hhid r_deviceid r_date
rename r_deviceid numero_tableta
gen pidr=real(pid)
drop if pidr==. /* check if any obs are missing pid */
egen duplic=count(pid), by(pid) /* check for duplicate PID: should all be =1 if no duplicates */
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
egen sd_sex=sd(pr_3), by(pid)
egen sd_age=sd(pr_4), by(pid)
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid pr_3 pr_4 duplic if duplic>1 /* print duplicate obs */
gen pid_en_listas=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
sum
*save rosters_check.dta, replace /* I think you could drop these lines, and save just tracker per next line */
*replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
*replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m pid using tracker
tab pr_3 sex, miss
list pid pr_3 sex if (pr_3 ~= sex +1) & _merge==3 /* list if sex differs between Roster and Resumen */
corr pr_4 age
list pid pr_4 age if abs(pr_4 - age) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Resumen */
drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* SOCIO
**********
use `trans_folder'Socio, clear
*s_2_3 will be slightly different if age on official documents differs from roster age

capture confirm variable s_sex
if _rc == 0 {
    rename s_sex s_0
}

capture confirm variable s_pct_missing
if _rc != 0 gen s_pct_missing = .
keep pid s_0 s_2_3 s_interid s_deviceid1 s_date s_pct_missing
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid s_0 s_2_3 duplic if duplic>1 
gen pid_en_socio=1 
drop pidr duplic
sum
*save socio_check.dta, replace
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker

tab pr_3 s_0, miss
list pid pr_3 s_0 if (pr_3 ~= s_0 +1) & _merge==3 /* list if sex differs between Roster and Socio */

preserve
keep if (pr_3 ~= s_0 +1) & _merge==3
save tracker_gender_mismatch, replace
restore

corr pr_4 s_2_3
list pid pr_4 s_2_3 if abs(pr_4 - s_2_3) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Socio */

drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* PHYS
**********
use `trans_folder'Phys, clear
capture confirm variable p_pct_missing
if _rc != 0 gen p_pct_missing = .
keep pid p_interid p_deviceid1 p_date p_pct_missing
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_phys=1 
drop pidr duplic
sum
*save phys_check.dta, replace
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* COG
**********
use `trans_folder'Cog, clear
capture confirm variable c_pct_missing
if _rc != 0 gen c_pct_missing = .
keep pid c_interid c_deviceid1 all_image_files_found all_audio_files_found c_date c_pct_missing
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_cog=1 
drop pidr duplic
sum
*save cog_check.dta, replace
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* COG SCORING
**********
use `trans_folder'Cog_Scoring, clear
keep pid cs_interid cs_date
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_cog_scor=1 
drop pidr duplic
sum
*save cog_scoring_check.dta, replace
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* INFORMANT
**********
use `trans_folder'Infor, clear
capture confirm variable i_pct_missing
if _rc != 0 gen i_pct_missing = .
keep pid i_interid i_deviceid1 i_date i_pct_missing
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_infor=1 
drop pidr duplic
sum
*save infor_check.dta, replace
replace pid = string(`country') + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* HOUSEHOLD
**********

use `trans_folder'Household, clear
keep hhid h_interid h_deviceid1 h_date
gen hhidr=real(hhid)
*drop if hhidr==.
egen duplic=count(hhid), by(hhid)
tab duplic
sort hhid
list hhid duplic if duplic>1 
gen existe_familiar=1 
*drop hhidr duplic
sum
*save hh_check.dta, replace
replace hhid = string(`country') + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m hhid using tracker
drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* BLOOD
**********

if `country' ~= 2 {
    use "sangre_full.dta", clear
    
keep pid XF7
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_sangre=1 
drop pidr duplic
sum
*save sangre_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum
}

* SUMMARY VARIABLE FOR WHICH SURVEYS EACH LINE HAS
* First ensure all indicator variables exist (in case a dataset was missing)
foreach var in pid_en_resumen pid_en_listas pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor existe_familiar {
    capture confirm variable `var'
    if _rc != 0 {
        gen `var' = .
    }
}

gen G_in ="G" if pid_en_resumen==1
gen R_in="R" if pid_en_listas==1
gen S_in="S" if pid_en_socio==1
gen P_in="P" if pid_en_phys==1
gen C_in="C" if pid_en_cog==1
gen Z_in="Z" if pid_en_cog_scor==1
gen I_in="I" if pid_en_infor==1
gen H_in="H" if existe_familiar==1
replace G_in=" " if pid_en_resumen~=1
replace R_in=" " if pid_en_listas~=1
replace S_in=" " if pid_en_socio~=1
replace P_in=" " if pid_en_phys~=1
replace C_in=" " if pid_en_cog~=1
replace Z_in=" " if pid_en_cog_scor~=1
replace I_in=" " if pid_en_infor~=1
replace H_in=" " if existe_familiar~=1

if `country' == 0 {
gen B_in=XF7 if pid_en_sangre==1
replace B_in="  " if pid_en_sangre~=1

gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in + B_in
tab RSPCZIHXF7
}

else if `country' == 1 {
gen B_in=XF7 if pid_en_sangre==1
replace B_in="  " if pid_en_sangre~=1

gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in + B_in
tab RSPCZIHXF7
}
else if `country' == 2 {
gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in
tab RSPCZIHXF7
}

sum pid*

drop R_in S_in P_in C_in Z_in I_in H_in G_in
capture drop B_in

rename s_0 sexo_en_socio
rename s_2_3 edad_en_socio
rename age edad_en_resumen

drop Cluster House_ID

gen Cluster = substr(pid, 2, 2)
gen House_ID = substr(pid, 4, 3)

order pid hhid House_ID Cluster
sort pid

* Number of participants per household + sex mismatch (both from de-duplicated pids)
preserve
duplicates drop pid, force
egen n_en_hogar = count(pid), by(hhid)
keep if sex != sexo_en_socio & !missing(sex) & !missing(sexo_en_socio)
keep pid hhid House_ID Cluster n_en_hogar sex sexo_en_socio
export excel using "`trans_folder'duplicates/tracker_sex_mismatch.xlsx", replace firstrow(variables)
restore

*********
**CDR***
********

if `country' == 2 {
	merge m:m pid using Cuba_CDR.dta
	drop _merge
	
	preserve
	keep pid cuban_CDR cuba_CDR_binary CDR_sex CDR_age sexo_en_socio edad_en_socio
	keep if cuban_CDR != .
	export excel using "duplicates/tracker_CDR.xlsx", replace firstrow(variables)
	restore
}

gen tracker_complete = "WIP"
replace tracker_complete = "Completed" if strpos(RSPCZ, "RSPCZIH") > 0

save `trans_folder'tracker_full, replace

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

export excel using "`trans_folder'duplicates/tracker_full.xlsx", replace firstrow(variables)

drop s_interid p_interid i_interid h_interid cs_interid c_interid
drop s_deviceid1 p_deviceid1 i_deviceid1 c_deviceid1 all_image_files_found all_audio_files_found

save `trans_folder'tracker_slim, replace

export excel using "`trans_folder'duplicates/tracker_slim.xlsx", replace firstrow(variables)

use door_merged_all

keep hhid pid d_0 d_1 d_particid

merge m:m hhid using `trans_folder'tracker_slim

capture drop XF7 RSPCZIHXF7

generate hhid_en_puerta = cond(_merge == 1, "Sola en Puerta", cond(_merge == 2, "Solo en Tracker", cond(_merge == 3, "Match", "")))
replace hhid_en_puerta = "Sin hhid" if missing(hhid)
drop _merge

keep d_1 d_particid pid hhid hhid_en_puerta

save `trans_folder'tracker_door, replace
export excel using "`trans_folder'duplicates/tracker_door.xlsx", replace firstrow(variables)


clear

use `trans_folder'tracker_full

*in this first version, we will focus only on the individual surveys (cog, cog_score, socio, infor, phys)

gen real_pid = real(pid)
sort real_pid
drop real_pid

drop if RSPCZIHXF7 == "GRSPCZIH"
drop if RSPCZIHXF7 == " RSPCZIH"
drop if RSPCZIHXF7 == "       H"
drop if RSPCZIHXF7 == " R      "
drop if RSPCZIHXF7 == " R     H"
drop if RSPCZIHXF7 == "  SPCZI "
drop if RSPCZIHXF7 == "G SPCZIH"
drop if RSPCZIHXF7 == "GRSPCZI "

*creating this to identify which cases are only in the resumen
gen solo_en_resumen = ""
replace solo_en_resumen = "solo en el resumen" if RSPCZIHXF7 == "G       "

drop edad_en_socio
drop sexo_en_socio
drop edad_en_resumen
drop existe_familiar pid_en_resumen pid_en_listas

foreach var in pid_en_infor pid_en_cog pid_en_cog_scor pid_en_phys pid_en_socio {
    tostring `var', replace
}
capture tostring pid_en_sangre, replace

foreach var in pid_en_infor pid_en_cog pid_en_cog_scor pid_en_phys pid_en_socio {
    replace `var' = " " if `var' == "1"
    replace `var' = "no presente" if `var' == "."
}

drop Cluster

rename pid_en_infor informante
rename pid_en_cog_scor scoring
rename pid_en_cog cognitiva
rename pid_en_phys examen_fisico
rename pid_en_socio sociodemografica

gen cluster = substr(pid, 2, 2)
gen casa = substr(pid, 4, 3)
gen participante = substr(pid, 8, 1)

drop sex
drop House_ID
drop numero_tableta
order cluster casa participante 

replace cluster = substr(hhid, 2, 2) if cluster == ""
replace casa = substr(hhid, 4, 3) if casa == ""

capture drop RSPCZIHXF7

gen is_duplicate = pid[_n] == pid[_n-1]
drop if is_duplicate == 1
drop is_duplicate

drop pid
drop hhid

gen all_missing = 1 if (informante == "no presente") & (scoring == "no presente") & (cognitiva == "no presente") & (examen_fisico == "no presente") & (sociodemografica == "no presente")
gen none_missing = 1 if (informante == " ") & (scoring == " ") & (cognitiva == " ") & (examen_fisico == " ") & (sociodemografica == " ")

drop if all_missing == 1
drop if none_missing == 1

drop none_missing all_missing
drop h_interid i_interid cs_interid h_deviceid1 s_interid all_audio all_image_files_found p_interid c_interid h_date r_date
capture drop XF7

rename c_deviceid1 tableta_cognitiva
rename i_deviceid1 tableta_informante
rename s_deviceid1 tableta_sociodemografico
rename p_deviceid1 tableta_examen_fisico

order tableta_informante tableta_cognitiva tableta_examen_fisico tableta_sociodemografico cluster casa participante i_date cs_date c_date p_date s_date	informante scoring cognitiva examen_fisico sociodemografica solo_en_resumen

capture replace pid_en_sangre = " " if pid_en_sangre == "1"

capture drop pid_en_sangre

export excel using "`trans_folder'duplicates/casos_incompletos.xlsx", replace firstrow(variables)

clear
use `trans_folder'tracker_slim
keep if RSPCZIHXF7 == "G       "

keep pid Cluster House_ID

capture export excel using "`trans_folder'duplicates/in_resumen_not_in_data.xlsx", replace firstrow(variables)


log close


****************************************
* COG MATCHING: find no-cog cases and cog-only cases
* Goal: surface households where a cog-only pid could fill the gap
*        for a pid that has everything else but no cog
****************************************

use `trans_folder'tracker_full, clear

* --- Dataset 1: Has everything except cog ---
* "Everything" = at least socio + phys + infor present, cog absent
preserve
keep if pid_en_socio == 1 & pid_en_phys == 1 & pid_en_infor == 1 ///
      & (pid_en_cog == . | pid_en_cog != 1)
keep pid hhid RSPCZIHXF7 pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor existe_familiar edad_en_resumen sexo_en_socio
save `trans_folder'tmp_no_cog.dta, replace
restore

* --- Dataset 2: Has cog but missing socio + phys + infor ---
preserve
keep if pid_en_cog == 1 ///
      & (pid_en_socio == . | pid_en_socio != 1) ///
      & (pid_en_phys  == . | pid_en_phys  != 1) ///
      & (pid_en_infor == . | pid_en_infor != 1)
keep pid hhid RSPCZIHXF7 pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor
rename pid        pid_cog_only
rename RSPCZIHXF7 RSPCZIHXF7_cog_only
save `trans_folder'tmp_cog_only.dta, replace
restore

* --- Join by hhid to find households with both ---
use `trans_folder'tmp_no_cog.dta, clear
rename pid        pid_no_cog
rename RSPCZIHXF7 RSPCZIHXF7_no_cog

joinby hhid using `trans_folder'tmp_cog_only.dta, unmatched(master)

* _merge == 1: no-cog case with no matching cog-only case in household
* _merge == 3: potential match found
gen potential_match = (_merge == 3)
drop _merge

order hhid pid_no_cog pid_cog_only potential_match RSPCZIHXF7_no_cog RSPCZIHXF7_cog_only

sort hhid pid_no_cog

save `trans_folder'tmp_cog_match_candidates.dta, replace
export excel using "`trans_folder'duplicates/cog_match_candidates.xlsx", replace firstrow(variables)

display "No-cog cases total: " _N
count if potential_match == 1
display "No-cog cases with a cog-only pid in same household: " r(N)

clear


****************************************
* SOCIO MATCHING: find no-socio cases and socio-only cases
* Goal: surface households where a socio-only pid could fill the gap
*        for a pid that has everything else but no socio
****************************************

use `trans_folder'tracker_full, clear

* --- Dataset 1: Has everything except socio ---
* "Everything" = at least phys + cog + infor present, socio absent
preserve
keep if pid_en_phys == 1 & pid_en_cog == 1 & pid_en_infor == 1 ///
      & (pid_en_socio == . | pid_en_socio != 1)
keep pid hhid RSPCZIHXF7 pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor existe_familiar edad_en_resumen sexo_en_socio
save `trans_folder'tmp_no_socio.dta, replace
restore

* --- Dataset 2: Has socio but missing phys + cog + infor ---
preserve
keep if pid_en_socio == 1 ///
      & (pid_en_phys  == . | pid_en_phys  != 1) ///
      & (pid_en_cog   == . | pid_en_cog   != 1) ///
      & (pid_en_infor == . | pid_en_infor != 1)
keep pid hhid RSPCZIHXF7 pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor
rename pid        pid_socio_only
rename RSPCZIHXF7 RSPCZIHXF7_socio_only
save `trans_folder'tmp_socio_only.dta, replace
restore

* --- Join by hhid to find households with both ---
use `trans_folder'tmp_no_socio.dta, clear
rename pid        pid_no_socio
rename RSPCZIHXF7 RSPCZIHXF7_no_socio

joinby hhid using `trans_folder'tmp_socio_only.dta, unmatched(master)

* _merge == 1: no-socio case with no matching socio-only case in household
* _merge == 3: potential match found
gen potential_match = (_merge == 3)
drop _merge

order hhid pid_no_socio pid_socio_only potential_match RSPCZIHXF7_no_socio RSPCZIHXF7_socio_only

sort hhid pid_no_socio

save `trans_folder'tmp_socio_match_candidates.dta, replace
if _N > 0 {
    export excel using "`trans_folder'duplicates/socio_match_candidates.xlsx", replace firstrow(variables)
}

display "No-socio cases total: " _N
if _N > 0 {
    count if potential_match == 1
    display "No-socio cases with a socio-only pid in same household: " r(N)
}

clear


****************************************
* CASES WITH SPCZI BUT NO COG SCORING
* Participants with Socio, Phys, Cog, Infor present but Cog_Scoring absent
****************************************

use `trans_folder'tracker_full, clear

keep if pid_en_socio == 1 & pid_en_phys == 1 & pid_en_cog == 1 & pid_en_infor == 1 ///
      & (pid_en_cog_scor == . | pid_en_cog_scor != 1)

gen cluster      = substr(pid, 2, 2)
gen casa         = substr(pid, 4, 3)
gen participante = substr(pid, 8, 1)

display "Cases with Socio+Phys+Cog+Infor but no Cog_Scoring: " _N

keep pid hhid cluster casa participante RSPCZIHXF7 ///
     s_date c_date p_date i_date ///
     s_interid c_interid p_interid i_interid ///
     s_deviceid1 c_deviceid1 p_deviceid1 i_deviceid1 ///
     edad_en_resumen sexo_en_socio

sort cluster casa participante

export excel using "`trans_folder'duplicates/missing_cog_scoring.xlsx", replace firstrow(variables)

clear


****************************************
* GPS TRACKER: DISTANCES FROM COG TO OTHER SURVEYS
* Reads Parent CSVs, builds PIDs, computes haversine distances (miles)
* Baseline: Cog GPS coordinates; socio/phys/infor measured relative to cog
****************************************

* -- 1. COG GPS --
if `country' == 0 {
    insheet using "../PR_in/Cog_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Cog_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Cog_Parent.csv", comma names clear
}

keep c_lat c_lon c_clustid1 c_houseid1 c_particid1

gen clustid_str  = string(c_clustid1)
replace clustid_str  = "0"  + clustid_str if strlen(clustid_str)  == 1
gen houseid_str  = string(c_houseid1)
replace houseid_str  = "00" + houseid_str  if strlen(houseid_str)  == 1
replace houseid_str  = "0"  + houseid_str  if strlen(houseid_str)  == 2
gen particid_str = string(c_particid1)
replace particid_str = "0"  + particid_str if strlen(particid_str) == 1

gen pid = "`country'" + clustid_str + houseid_str + particid_str
drop clustid_str houseid_str particid_str c_clustid1 c_houseid1 c_particid1
rename c_lat cog_lat
rename c_lon cog_lon
duplicates drop pid, force
save `trans_folder'tmp_gps_cog.dta, replace

* -- 2. SOCIO GPS --
if `country' == 0 {
    insheet using "../PR_in/Socio_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Socio_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Socio_Parent.csv", comma names clear
}

keep s_lat s_lon s_clustid1 s_houseid1 s_particid1

gen clustid_str  = string(s_clustid1)
replace clustid_str  = "0"  + clustid_str if strlen(clustid_str)  == 1
gen houseid_str  = string(s_houseid1)
replace houseid_str  = "00" + houseid_str  if strlen(houseid_str)  == 1
replace houseid_str  = "0"  + houseid_str  if strlen(houseid_str)  == 2
gen particid_str = string(s_particid1)
replace particid_str = "0"  + particid_str if strlen(particid_str) == 1

gen pid = "`country'" + clustid_str + houseid_str + particid_str
drop clustid_str houseid_str particid_str s_clustid1 s_houseid1 s_particid1
rename s_lat socio_lat
rename s_lon socio_lon
duplicates drop pid, force
save `trans_folder'tmp_gps_socio.dta, replace

* -- 3. PHYS GPS --
if `country' == 0 {
    insheet using "../PR_in/Phys_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Phys_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Phys_Parent.csv", comma names clear
}

keep p_lat p_lon p_clustid1 p_houseid1 p_particid1

gen clustid_str  = string(p_clustid1)
replace clustid_str  = "0"  + clustid_str if strlen(clustid_str)  == 1
gen houseid_str  = string(p_houseid1)
replace houseid_str  = "00" + houseid_str  if strlen(houseid_str)  == 1
replace houseid_str  = "0"  + houseid_str  if strlen(houseid_str)  == 2
gen particid_str = string(p_particid1)
replace particid_str = "0"  + particid_str if strlen(particid_str) == 1

gen pid = "`country'" + clustid_str + houseid_str + particid_str
drop clustid_str houseid_str particid_str p_clustid1 p_houseid1 p_particid1
rename p_lat phys_lat
rename p_lon phys_lon
duplicates drop pid, force
save `trans_folder'tmp_gps_phys.dta, replace

* -- 4. INFOR GPS --
if `country' == 0 {
    insheet using "../PR_in/Infor_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Infor_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Infor_Parent.csv", comma names clear
}

keep i_lat i_lon i_clustid1 i_houseid1 i_particid1

gen clustid_str  = string(i_clustid1)
replace clustid_str  = "0"  + clustid_str if strlen(clustid_str)  == 1
gen houseid_str  = string(i_houseid1)
replace houseid_str  = "00" + houseid_str  if strlen(houseid_str)  == 1
replace houseid_str  = "0"  + houseid_str  if strlen(houseid_str)  == 2
gen particid_str = string(i_particid1)
replace particid_str = "0"  + particid_str if strlen(particid_str) == 1

gen pid = "`country'" + clustid_str + houseid_str + particid_str
drop clustid_str houseid_str particid_str i_clustid1 i_houseid1 i_particid1
rename i_lat infor_lat
rename i_lon infor_lon
duplicates drop pid, force
save `trans_folder'tmp_gps_infor.dta, replace

* -- Deduplicate tracker_slim for 1:1 merge --
use `trans_folder'tracker_slim, clear
duplicates drop pid, force
save `trans_folder'tmp_slim_dedup.dta, replace

* -- Merge all GPS into one dataset --
use `trans_folder'tmp_gps_cog.dta, clear
merge 1:1 pid using `trans_folder'tmp_gps_socio.dta, nogen
merge 1:1 pid using `trans_folder'tmp_gps_phys.dta,  nogen
merge 1:1 pid using `trans_folder'tmp_gps_infor.dta, nogen

* -- Haversine distances: cog → each other survey (miles) --
* d = 2R * arcsin(sqrt(sin²(Δlat/2) + cos(lat1)*cos(lat2)*sin²(Δlon/2))),  R = 3958.8 miles

gen dist_socio_miles = 2 * 3958.8 * asin(sqrt( ///
    sin((socio_lat - cog_lat) * _pi / 360)^2 + ///
    cos(cog_lat * _pi / 180) * cos(socio_lat * _pi / 180) * ///
    sin((socio_lon - cog_lon) * _pi / 360)^2 ///
)) if !missing(cog_lat, cog_lon, socio_lat, socio_lon)
label variable dist_socio_miles "Distance: Cog to Socio (miles)"

gen dist_phys_miles = 2 * 3958.8 * asin(sqrt( ///
    sin((phys_lat - cog_lat) * _pi / 360)^2 + ///
    cos(cog_lat * _pi / 180) * cos(phys_lat * _pi / 180) * ///
    sin((phys_lon - cog_lon) * _pi / 360)^2 ///
)) if !missing(cog_lat, cog_lon, phys_lat, phys_lon)
label variable dist_phys_miles "Distance: Cog to Phys (miles)"

gen dist_infor_miles = 2 * 3958.8 * asin(sqrt( ///
    sin((infor_lat - cog_lat) * _pi / 360)^2 + ///
    cos(cog_lat * _pi / 180) * cos(infor_lat * _pi / 180) * ///
    sin((infor_lon - cog_lon) * _pi / 360)^2 ///
)) if !missing(cog_lat, cog_lon, infor_lat, infor_lon)
label variable dist_infor_miles "Distance: Cog to Infor (miles)"

* -- Flag cases where any survey is more than 0.1 miles from cog --
gen flag_distance = (dist_socio_miles > 0.1 & !missing(dist_socio_miles)) | ///
                    (dist_phys_miles  > 0.1 & !missing(dist_phys_miles))  | ///
                    (dist_infor_miles > 0.1 & !missing(dist_infor_miles))
label variable flag_distance "Any survey >0.1 miles from Cog"

* -- Merge completeness status from tracker --
merge 1:1 pid using `trans_folder'tmp_slim_dedup.dta, keep(1 3) nogen

gen cluster      = substr(pid, 2, 2)
gen casa         = substr(pid, 4, 3)
gen participante = substr(pid, 8, 1)

order pid hhid cluster casa participante RSPCZIHXF7 ///
      flag_distance ///
      cog_lat cog_lon ///
      socio_lat socio_lon dist_socio_miles ///
      phys_lat phys_lon dist_phys_miles ///
      infor_lat infor_lon dist_infor_miles

sort cluster casa participante

save `trans_folder'tracker_gps, replace
export excel using "`trans_folder'duplicates/tracker_gps.xlsx", replace firstrow(variables)

count if flag_distance == 1
display "Cases flagged (any survey >0.1 miles from Cog): " r(N)

* Clean up temp files
capture erase `trans_folder'tmp_gps_cog.dta
capture erase `trans_folder'tmp_gps_socio.dta
capture erase `trans_folder'tmp_gps_phys.dta
capture erase `trans_folder'tmp_gps_infor.dta
capture erase `trans_folder'tmp_slim_dedup.dta

clear

exit, clear
