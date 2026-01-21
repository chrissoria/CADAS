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
* SECTION 1: INITIALIZE MASTER DATASET
****************************************
* Start with all_unique_pids as the base
* This will be merged with all other datasets
****************************************

use all_unique_pids.dta, clear
capture tostring pid, replace
capture tostring hhid, replace
duplicates drop pid, force

capture drop Cluster
capture drop cluster
capture drop casa
capture drop participante

gen cluster = substr(pid, 2, 2)
gen casa = substr(pid, 4, 3)
gen participante = substr(pid, 8, 1)

save `trans_folder'CADAS_`country_name', replace

****************************************
* SECTION 1B: RESUMEN MERGE
****************************************

merge m:m pid using "`temp_dir'/temp_Resumen.dta"
keep if _merge == 3 | _merge == 1
drop _merge

* Fill cluster again for any records from Resumen that have empty cluster
replace cluster = substr(pid, 2, 2) if missing(cluster) | cluster == ""

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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

* Keep only matched records
keep if _merge == 3
tab _merge
display "Total rows: "
count
drop _merge

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

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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

* Keep only cases in Resumen
keep if pid_en_resumen == 1

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
gen pid_en_1066 = 1
* save 1066_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
save "`temp_dir'/temp_Infor.dta", replace
use `trans_folder'CADAS_`country_name', clear
merge m:m pid using "`temp_dir'/temp_Infor.dta"
tab _merge
display "Total rows: "
count
drop _merge

* Keep only cases in Resumen
keep if pid_en_resumen == 1

save `trans_folder'CADAS_`country_name', replace

****************************************
* FINALIZE PUBLIC DATASET
****************************************

* Deduplicate by pid
bysort pid: keep if _n == 1

drop Cluster House_ID pid_en_resumen-s_clustid s_deviceid1 s_deviceid2-p_particid2 p_deviceid2-all_image_files_found c_deviceid2-cs_particid2
drop v1-i_deviceid1 i_deviceid2-pid_en_infor *pic* *file* *score*

save `trans_folder'CADAS_`country_name', replace

display "Public dataset created: CADAS_`country_name'.dta"

****************************************
* COPY PUBLIC DATASET TO GOOGLE DRIVE
****************************************

if `"`user'"' == "Chris" {

    * DR
    if $country == 1 {
        if `"$language"' == "E" {
            local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/TRANSLATED/DTA"
        }
        else {
            local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/dta"
        }

        copy "`path'/DR_out/`trans_folder'CADAS_DR.dta" "`gdrive_out'/CADAS_DR.dta", replace

        display "Public dataset copied to Google Drive: `gdrive_out'"
    }

    * Cuba
    if $country == 2 {
        if `"$language"' == "E" {
            local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/TRANSLATED/DTA"
        }
        else {
            local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/dta"
        }

        copy "`path'/CUBA_out/`trans_folder'CADAS_CU.dta" "`gdrive_out'/CADAS_CU.dta", replace

        display "Public dataset copied to Google Drive: `gdrive_out'"
    }
}

log close
