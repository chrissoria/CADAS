********************************************************************************
********************************************************************************
**                                                                            **
**                    PUBLIC AVAILABLE DATASET - VERSION 1                    **
**                                                                            **
**                         CADAS_PR / CADAS_DR / CADAS_CU                     **
**                                                                            **
********************************************************************************
********************************************************************************

clear
set more off
capture log close

* Uses global $country set in CADAS_master.do
* 0 = PR, 1 = DR, 2 = CU

* Toggle: use_almost_complete = 1 rescues PIDs with >= 3 of 5 surveys (default)
*         use_almost_complete = 0 requires all 5 surveys for rescue
local use_almost_complete = 1

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}

if $country == 0 {
    cd "`path'/PR_out"
    local temp_dir "../PR_in"
    local country_name "PR"
}
else if $country == 1 {
    cd "`path'/DR_out"
    local temp_dir "../DR_in"
    local country_name "DR"
}
else if $country == 2 {
    cd "`path'/CUBA_out"
    local temp_dir "../CUBA_in"
    local country_name "CU"
}

* Set translation folder path based on language
if `"$language"' == "E" {
    if $country == 0 {
        local trans_folder "translation_PR/"
    }
    else if $country == 1 {
        local trans_folder "translation_DR/"
    }
    else if $country == 2 {
        local trans_folder "translation_CUBA/"
    }
}
else {
    local trans_folder ""
}

log using logs/CADAS_public, text replace

****************************************
* SECTION 1A: BUILD SURVEY COMPLETENESS FLAGS
* Identifies PIDs with all SPCZI surveys present (Socio, Phys, Cog, Cog_Scoring, Infor)
* Used to rescue complete cases not linked via Resumen
****************************************

foreach comp in Socio Phys Cog Cog_Scoring Infor {
	capture {
		use "`trans_folder'`comp'.dta", clear
		capture tostring pid, replace
		keep pid
		duplicates drop pid, force
		gen byte has_`comp' = 1
		save "`temp_dir'/temp_has_`comp'.dta", replace
	}
}

use all_unique_pids.dta, clear
capture tostring pid, replace
duplicates drop pid, force

foreach comp in Socio Phys Cog Cog_Scoring Infor {
	capture {
		merge 1:1 pid using "`temp_dir'/temp_has_`comp'.dta", nogen keep(1 3)
	}
	capture confirm variable has_`comp'
	if _rc != 0 {
		gen byte has_`comp' = 0
	}
	replace has_`comp' = 0 if missing(has_`comp')
}

* Complete case: all SPCZI surveys present (Socio, Phys, Cog, Cog_Scoring, Infor)
gen byte complete_case = (has_Socio==1 & has_Phys==1 & has_Cog==1 & has_Cog_Scoring==1 & has_Infor==1)

* Almost complete case: at least 4 of 5 SPCZI surveys present
gen byte survey_count = has_Socio + has_Phys + has_Cog + has_Cog_Scoring + has_Infor
gen byte almost_complete_case = (survey_count >= 4)

count if complete_case == 1
display "PIDs with all SPCZI surveys present: " r(N)
count if almost_complete_case == 1
display "PIDs with >= 3 SPCZI surveys present: " r(N)

* Select which flag to use for rescuing non-Resumen cases
if `use_almost_complete' == 1 {
    gen byte rescue_flag = almost_complete_case
    display "Using almost_complete_case (>= 3 surveys) for rescue"
}
else {
    gen byte rescue_flag = complete_case
    display "Using complete_case (all 5 surveys) for rescue"
}

keep pid rescue_flag
save "`temp_dir'/temp_completeness.dta", replace


****************************************
* SECTION 1: INITIALIZE MASTER DATASET
****************************************
* Start with all_unique_pids as the base
* This will be merged with all other datasets
****************************************

use all_unique_pids.dta, clear
capture tostring pid, replace
capture tostring hhid, replace
duplicates drop pid, force

* Drop any rows with malformed PIDs (must be exactly 8 numeric digits)
drop if !regexm(pid, "^[0-9]{8}$")

save `trans_folder'CADAS_`country_name', replace

****************************************
* SECTION 1B: RESUMEN MERGE
****************************************

if $country != 2 {
    merge m:m pid using "`temp_dir'/temp_Resumen.dta"
    keep if _merge == 3 | _merge == 1
    drop _merge
    capture drop age sex

    * Merge completeness flags — rescues SPCZI-complete cases with broken Resumen linkage
    merge m:1 pid using "`temp_dir'/temp_completeness.dta", nogen keep(1 3)
    replace rescue_flag = 0 if missing(rescue_flag)

    count if pid_en_resumen != 1 & rescue_flag == 1
    if r(N) > 0 {
        display "Rescued " r(N) " SPCZI-complete case(s) not linked via Resumen:"
        list pid if pid_en_resumen != 1 & rescue_flag == 1
    }

    * Keep cases in Resumen OR with all SPCZI survey components
    keep if pid_en_resumen == 1 | rescue_flag == 1
}
else {
    * Cuba: skip Resumen filtering — use rescue_flag (>= 3 surveys) instead
    capture drop age sex
    gen byte pid_en_resumen = 0

    * Merge completeness flags to filter on survey presence
    merge m:1 pid using "`temp_dir'/temp_completeness.dta", nogen keep(1 3)
    replace rescue_flag = 0 if missing(rescue_flag)

    count if rescue_flag == 1
    display "Cuba: Resumen skipped — keeping " r(N) " PIDs with >= 3 surveys"
    keep if rescue_flag == 1
}

save `trans_folder'CADAS_`country_name', replace


****************************************
* SECTION 2: SOCIO MERGE
****************************************

use "`trans_folder'Socio.dta", clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*

*keep pid S_in
*gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_socio=1
*drop pidr duplic
sum
*save socio_check.dta, replace
save "`temp_dir'/temp_Socio.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge 1:m pid using "`temp_dir'/temp_Socio.dta"

drop _merge
keep if pid_en_resumen == 1 | rescue_flag == 1

* Create depression score from s.10.1
gen s_depression_score = 0
replace s_depression_score = (s_depression_score + 1) if s_10_1a == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1b == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1c == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1d == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1e == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1f == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1g == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1h == 1
label variable s_depression_score "Depression score (GDS-8)"

* Create depression binary (1 if score >= 4)
gen s_depression_binary = (s_depression_score >= 4) if !missing(s_depression_score)
label variable s_depression_binary "Depression (GDS >= 4)"

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace


****************************************
* SECTION 3: PHYSICAL EXAM MERGE
****************************************

use "`trans_folder'Phys.dta", clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*

*keep pid P_in
*gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_phys=1
*drop pidr duplic
sum
*save phys_check.dta, replace
save "`temp_dir'/temp_Phys.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_Phys.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace

****************************************
* SECTION 4: 1066 COGNITIVE MERGE
****************************************
use 1066.dta, clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*

gen pidr = real(pid)
drop if pidr == .
keep pid cogscore relscore recall dem1066_score dem1066
egen duplic = count(pid), by(pid)
tab duplic
sort pid

gen pid_en_1066 = 1
* save 1066_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
save "`temp_dir'/temp_1066.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_1066.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace


****************************************
* SECTION 5: COGNITIVE ASSESSMENT MERGE
****************************************

use "`trans_folder'Cog.dta", clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*

*keep pid C_in
*gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_cog=1
*drop pidr duplic
sum
*save cog_check.dta, replace
save "`temp_dir'/temp_Cog.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_Cog.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace


****************************************
* SECTION 6: COGNITIVE SCORING MERGE
****************************************

use "`trans_folder'Cog_Scoring.dta", clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*

*keep pid Z_in
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_cog_scor=1
drop pidr duplic
sum
*save cog_scoring_check.dta, replace
save "`temp_dir'/temp_Cog_Scoring.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_Cog_Scoring.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace

****************************************
* SECTION 7: INFORMANT INTERVIEW MERGE
****************************************

use "`trans_folder'Infor.dta", clear

* TY: DROP VARIABLES HERE
capture drop *time*
capture drop *Time*
capture drop *date*
capture drop *Date*
capture drop i_countmissing
capture drop i_last
capture drop i_ADL_summ i_IADL_summ i_memory_summ i_NPI_summ i_JORM_IQCODE_summ

*keep pid I_in
*gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_infor=1
*drop pidr duplic
sum
*save infor_check.dta, replace
save "`temp_dir'/temp_Infor.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_Infor.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep cases in Resumen OR with all SPCZI survey components
keep if pid_en_resumen == 1 | rescue_flag == 1

save `trans_folder'CADAS_`country_name', replace

****************************************
* SECTION 8: HOUSEHOLD MERGE (DR only)
****************************************

if $country == 1 {
    use "`trans_folder'Household.dta", clear

    * TY: DROP VARIABLES HERE
    capture drop *time*
    capture drop *Time*
    capture drop *date*
    capture drop *Date*

    * Drop admin/internal variables before merge
    capture drop globalrecordid
    capture drop household_in_resumen
    capture drop h_interid h_deviceid1 h_deviceid2
    capture drop h_country h_clustid h_houseid
    capture drop h_conglid2 h_houseid2 hhid2

    * Household is unique on hhid — confirm before merge
    duplicates report hhid
    save "`temp_dir'/temp_Household.dta", replace

    use `trans_folder'CADAS_`country_name', clear
    merge m:1 hhid using "`temp_dir'/temp_Household.dta"
    tab _merge
    display "Household merge — Total rows: "
    count
    drop _merge

    * Keep cases in Resumen OR with rescue flag
    keep if pid_en_resumen == 1 | rescue_flag == 1

    save `trans_folder'CADAS_`country_name', replace
}

****************************************
* FINALIZE PUBLIC DATASET
****************************************

* Deduplicate by pid
bysort pid: keep if _n == 1

* Drop PIDs with no survey data at all (in Resumen but never actually surveyed)
gen byte _has_any_data = 0
foreach var in pid_en_socio pid_en_phys pid_en_cog pid_en_cog_scor pid_en_infor {
    capture confirm variable `var'
    if _rc == 0 {
        replace _has_any_data = 1 if `var' == 1
    }
}
count if _has_any_data == 0
display "Dropping " r(N) " PIDs with no survey data"
drop if _has_any_data == 0
drop _has_any_data

* Drop country-5 orphans (PIDs starting with 5)
capture tostring pid, replace
count if substr(pid, 1, 1) == "5"
display "Dropping " r(N) " country-5 orphan PIDs"
drop if substr(pid, 1, 1) == "5"

capture drop Cluster House_ID
capture drop pid_en_resumen rescue_flag
capture drop s_deviceid1 s_deviceid2 p_deviceid2 c_deviceid2
capture drop v1
capture drop *pic* *file*
* Country-specific variable range drops
if $country == 1 {
    capture drop pid_en_resumen-s_clustid
    capture drop s_deviceid2-p_particid2
    capture drop p_deviceid2-all_image_files_found
    capture drop c_deviceid2-cs_particid2
    capture drop v1-i_deviceid1
    capture drop i_deviceid2-pid_en_infor
    capture drop *score*
}

save `trans_folder'CADAS_`country_name', replace

display "Public dataset created: CADAS_`country_name'.dta"

****************************************
* COPY PUBLIC DATASET TO GOOGLE DRIVE
****************************************

if `"`user'"' == "Chris" {

    * PR
    if $country == 0 {
        if `"$language"' == "E" {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Puerto_Rico/Latest_Data/TRANSLATED/DTA"
        }
        else {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Puerto_Rico/Latest_Data/DTA"
        }

        copy "`path'/PR_out/`trans_folder'CADAS_PR.dta" "`gdrive_out'/CADAS_PR.dta", replace

        display "Public dataset copied to Google Drive: `gdrive_out'"
    }

    * DR
    if $country == 1 {
        if `"$language"' == "E" {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Rep Dom/Latest_Data/TRANSLATED/DTA"
        }
        else {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Rep Dom/Latest_Data/DTA"
        }

        copy "`path'/DR_out/`trans_folder'CADAS_DR.dta" "`gdrive_out'/CADAS_DR.dta", replace

        display "Public dataset copied to Google Drive: `gdrive_out'"
    }

    * Cuba
    if $country == 2 {
        if `"$language"' == "E" {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Cuba/Latest_Data/TRANSLATED/DTA"
        }
        else {
            local gdrive_out = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/Data/CADAS data upload/Cuba/Latest_Data/DTA"
        }

        copy "`path'/CUBA_out/`trans_folder'CADAS_CU.dta" "`gdrive_out'/CADAS_CU.dta", replace

        display "Public dataset copied to Google Drive: `gdrive_out'"
    }
}

log close
