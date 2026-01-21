
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
    local temp_dir "../PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_out"
    local temp_dir "../DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
    local temp_dir "../CUBA_in"
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

log using logs/Everything_Wide, text replace

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

save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 1B: RESUMEN MERGE
****************************************

merge m:m pid using "`temp_dir'/temp_Resumen.dta"
keep if _merge == 3 | _merge == 1
drop _merge

* Fill cluster again for any records from Resumen that have empty cluster
replace cluster = substr(pid, 2, 2) if missing(cluster) | cluster == ""

save `trans_folder'Everything_Wide, replace


/*
********** 
* LISTAS
**********

if `country' ~= 2 {
    use "participants.dta", clear
    
*keep pid R_in
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_listas=1 
drop pidr duplic
sum
*save listas_check.dta, replace
save "`temp_dir'/temp_participants.dta", replace
use `trans_folder'Everything_Wide, clear
merge 1:1 pid using "`temp_dir'/temp_participants.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

}

*/

****************************************
* SECTION 2: SOCIO MERGE
****************************************

use "`trans_folder'Socio.dta", clear

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
use `trans_folder'Everything_Wide, clear
merge 1:m pid using "`temp_dir'/temp_Socio.dta"

* Save unmatched records to CSV
preserve
keep if _merge == 1
export delimited using "missing_socio_records.csv", replace
restore

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

save `trans_folder'Everything_Wide, replace


****************************************
* SECTION 3: PHYSICAL EXAM MERGE
****************************************

use "`trans_folder'Phys.dta", clear

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
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_Phys.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 4: 1066 COGNITIVE MERGE
****************************************
use 1066.dta, clear
gen pidr = real(pid)
drop if pidr == .
keep pid cogscore relscore recall dem1066_score dem1066 dem1066_score_quint dem1066_quint immed learn1 learn2 learn3 paper animals nametot count animtot wordtot1 wordtot2 papertot storytot wordimm worddel story misstot
egen duplic = count(pid), by(pid)
tab duplic
sort pid

gen pid_en_1066 = 1
* save 1066_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
save "`temp_dir'/temp_1066.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_1066.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace


****************************************
* SECTION 5: COGNITIVE ASSESSMENT MERGE
****************************************

use "`trans_folder'Cog.dta", clear

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
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_Cog.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace


****************************************
* SECTION 6: COGNITIVE SCORING MERGE
****************************************

use "`trans_folder'Cog_Scoring.dta", clear

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
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_Cog_Scoring.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 7: INFORMANT INTERVIEW MERGE
****************************************

use "`trans_folder'Infor.dta", clear

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
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_Infor.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace


****************************************
* SECTION 8: CONSENSUS DIAGNOSIS MERGE
****************************************

use ConsensusVariables, clear
capture destring cs_32, replace force
drop dem1066 dem1066_score cogscore relscore recall
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
save "`temp_dir'/temp_Consensus.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_Consensus.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 9: CREATE S_C_I_P_SELECT SUBSET
****************************************

* For DR and PR: save all cases at this point (after socio, cog, infor, phys merges)
if `country' == 0 | `country' == 1 {
	use `trans_folder'Everything_Wide, clear
	bysort pid: keep if _n == 1

	* Merge consensus binary classifications
	preserve
	use "/Users/chrissoria/Documents/Research/consensus/data/out/consensus_binary_simple.dta", clear
	rename finalniaa_binary team_consensus
	rename finalniaa_int_binary international_consensus
	tempfile consensus_temp
	save `consensus_temp'
	restore

	merge 1:1 pid using `consensus_temp'
	tab _merge
	display "Consensus binary merge results:"
	count if _merge == 3
	drop if _merge == 2
	drop _merge

	* Create consensus_dementia: prioritize international, fall back to team
	gen consensus_dementia = international_consensus
	replace consensus_dementia = team_consensus if missing(consensus_dementia)
	label variable consensus_dementia "Consensus dementia (international priority, team fallback)"

	* Create binary indicator for having consensus
	gen in_consensus = !missing(consensus_dementia)
	label variable in_consensus "Has consensus dementia classification"

	save s_c_i_p_select, replace

	* Save back to Everything_Wide so it flows to final datasets
	save `trans_folder'Everything_Wide, replace
}

* For Cuba: merge CDR data and weights
if `country' == 2 {
	use `trans_folder'Everything_Wide, clear
	merge m:1 pid using Cuba_CDR.dta
	tab _merge
	display "Total rows: "
	count
	drop _merge
	save `trans_folder'Everything_Wide, replace

	* not sure why there's duplicates (20818201 is showing up more than once)
	bysort pid: keep if _n == 1

	* Merge weights for Cuba
	merge 1:1 pid using `trans_folder'weights.dta
	tab _merge
	display "Weights merge results:"
	count if _merge == 3
	drop _merge

	* Merge consensus binary classifications
	preserve
	use "/Users/chrissoria/Documents/Research/consensus/data/out/consensus_binary_simple.dta", clear
	rename finalniaa_binary team_consensus
	rename finalniaa_int_binary international_consensus
	tempfile consensus_temp
	save `consensus_temp'
	restore

	merge 1:1 pid using `consensus_temp'
	tab _merge
	display "Consensus binary merge results:"
	count if _merge == 3
	drop if _merge == 2
	drop _merge

	* Create consensus_dementia: prioritize international, fall back to team
	gen consensus_dementia = international_consensus
	replace consensus_dementia = team_consensus if missing(consensus_dementia)
	label variable consensus_dementia "Consensus dementia (international priority, team fallback)"

	* Create binary indicator for having consensus
	gen in_consensus = !missing(consensus_dementia)
	label variable in_consensus "Has consensus dementia classification"

	save s_c_i_p_select, replace

	* Save back to Everything_Wide so it flows to final datasets
	save `trans_folder'Everything_Wide, replace
}

****************************************
* SECTION 10: ROSTER PARTICIPANTS MERGE
****************************************

use rosters_participants, clear
*keep pid pr_3 pr_4 hhid r_deviceid r_date
rename r_deviceid numero_tableta
gen pidr=real(pid)
*drop if pidr==. /* check if any obs are missing pid */
egen duplic=count(pid), by(pid) /* check for duplicate PID: should all be =1 if no duplicates */
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
egen sd_sex=sd(pr_3), by(pid)
egen sd_age=sd(pr_4), by(pid)
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid

gen pid_en_listas=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
*save rosters_check.dta, replace /* I think you could drop these lines, and save just tracker per next line */
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
save "`temp_dir'/temp_rosters_participants.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_rosters_participants.dta"
tab _merge
display "Total rows: "
count

drop _merge
save `trans_folder'Everything_Wide, replace


****************************************
* SECTION 11: HOUSEHOLD DATA MERGE
****************************************

use `trans_folder'Household, clear
*keep hhid h_interid h_deviceid1 h_date
gen hhidr=real(hhid)
*drop if hhidr==.
egen duplic=count(hhid), by(hhid)
tab duplic
sort hhid

gen existe_familiar=1 
drop hhidr duplic
*save hh_check.dta, replace
replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
save "`temp_dir'/temp_Household.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:m hhid using "`temp_dir'/temp_Household.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 12: NEIGHBORHOOD DATA MERGE
****************************************

use `trans_folder'Neighborhood, clear

collapse (mean) n_5-n_38, by(n_clustid)
foreach var of varlist n_5-n_38 {
	gen double `var'mean = recode(`var', 0.5, 1.5, 2.5, 3.5, 4)
	recode `var'mean (0.5=0) (1.5=1) (2.5=2) (3.5=3) (4=4), gen(`var'new)
}
*only cuba needs it to be converted to string
tostring n_clustid, replace

rename n_clustid cluster
save "`temp_dir'/temp_Neighborhood.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:1 cluster using "`temp_dir'/temp_Neighborhood.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 13: BLOOD DATA MERGE (PR & DR ONLY)
****************************************

if `country' ~= 2 {
    use "sangre_full.dta", clear
    
*keep pid XF7
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_sangre=1
drop pidr duplic
sum
*save sangre_check.dta, replace
capture tostring cluster, replace
capture tostring casa, replace
capture tostring participante, replace
save "`temp_dir'/temp_sangre_full.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:m pid using "`temp_dir'/temp_sangre_full.dta"
tab _merge
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

}

****************************************
* STANDARDIZE CLUSTER VARIABLE
****************************************
* Ensure cluster is filled and formatted as 2-character string with leading zero
use `trans_folder'Everything_Wide, clear

* Step 1: Fill missing or empty cluster from PID (positions 2-3)
replace cluster = substr(pid, 2, 2) if missing(cluster) | cluster == ""

* Step 2: Fill from clustid variables if still missing
foreach var of varlist * {
    if strpos(lower("`var'"), "clustid") > 0 {
        capture confirm string variable `var'
        if _rc == 0 {
            * Variable is string
            replace cluster = `var' if (missing(cluster) | cluster == "" | cluster == "00") & !missing(`var')
        }
        else {
            * Variable is numeric, convert to string
            capture replace cluster = string(`var') if (missing(cluster) | cluster == "" | cluster == "00") & !missing(`var')
        }
    }
}

* Step 3: Standardize to 2 characters with leading zero
* First, trim any whitespace
replace cluster = trim(cluster)
* If cluster is 1 character, add leading zero
replace cluster = "0" + cluster if strlen(cluster) == 1 & cluster != ""
* If cluster is numeric-looking but wrong length, reformat
capture destring cluster, replace
if _rc == 0 {
    * It was successfully converted to numeric, convert back with proper format
    tostring cluster, replace format(%02.0f)
}

save `trans_folder'Everything_Wide, replace

****************************************
* SECTION 14: RURAL/URBAN DATA (DR ONLY)
****************************************

if `country' == 1 {
	use UPM_CADAS_RD.dta, clear
	capture rename Cluster cluster
	* Standardize cluster to 2 characters with leading zero
	replace cluster = trim(cluster)
	replace cluster = "0" + cluster if strlen(cluster) == 1 & cluster != ""
	save "`temp_dir'/temp_UPM_CADAS_RD.dta", replace
    use `trans_folder'Everything_Wide, clear
	merge m:1 cluster using "`temp_dir'/temp_UPM_CADAS_RD.dta"
tab _merge
display "Total rows: "
count
	drop _merge
	save `trans_folder'Everything_Wide, replace
}

****************************************
* MERGE CONSENSUS DATA
****************************************
use "../consensus/consensus_long.dta", clear
keep pid finalniaa_int_binary
sort pid
by pid: gen dup = _n == 1
keep if dup
drop dup

save "../consensus/unique_classifications.dta", replace
use `trans_folder'Everything_Wide, clear
merge m:1 pid using "../consensus/unique_classifications.dta"
tab _merge

keep if _merge==3 | _merge==1
display "Total rows: "
count
drop _merge
save `trans_folder'Everything_Wide, replace

*** DOES SEX MATCH IN SOCIO AND ROSTER ****
tab pr_3 s_0, miss

corr pr_4 s_2_3

save `trans_folder'Everything_Wide.dta, replace
export excel using "`trans_folder'excel/Everything_Wide.xlsx", replace firstrow(variables)

d,s
sum

* SUMMARY VARIABLE FOR WHICH SURVEYS EACH LINE HAS
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
replace B_in=" " if pid_en_sangre~=1

gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in + B_in
tab RSPCZIHXF7
}

else if `country' == 1 {
capture gen B_in=XF7 if pid_en_sangre==1
capture replace B_in=" " if pid_en_sangre~=1
capture replace B_in=" " if missing(B_in)

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

order pid House_ID Cluster

save `trans_folder'Everything_Wide_full, replace

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}


drop s_interid p_interid i_interid h_interid cs_interid c_interid
drop s_deviceid1 p_deviceid1 i_deviceid1 c_deviceid1 all_image_files_found all_audio_files_found

save `trans_folder'Everything_Wide_slim, replace

use door_merged_all

*keep hhid pid d_0 d_1 d_particid

merge m:m hhid using `trans_folder'Everything_Wide_slim 
tab _merge
display "Total rows: "
count 

capture drop RSPCZIHXF7

generate hhid_en_puerta = cond(_merge == 1, "Sola en Puerta", cond(_merge == 2, "Solo en Tracker", cond(_merge == 3, "Match", "")))
replace hhid_en_puerta = "Sin hhid" if missing(hhid)

* Keep only records from master or matched (drop door-only records)
keep if _merge == 1 | _merge == 3
drop _merge

*keep d_1 d_particid pid hhid hhid_en_puerta

save `trans_folder'Everything_Wide_door, replace


clear

use `trans_folder'Everything_Wide_full

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

rename pid_en_infor informante
rename pid_en_cog_scor scoring
rename pid_en_cog cognitiva
rename pid_en_phys examen_fisico
rename pid_en_socio sociodemografica

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


clear
use `trans_folder'Everything_Wide_slim

*keep if RSPCZIHXF7 == "G       "

*keep pid Cluster House_ID



log close

****************************************
* COPY CLEANED DTA FILES TO GOOGLE DRIVE
****************************************

* DR
if `country' == 1 & `"`user'"' == "Chris" {
    if `"$language"' == "E" {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/TRANSLATED/DTA"
        local gdrive_excel = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/TRANSLATED/EXCEL"
    }
    else {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/dta"
        local gdrive_excel = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/excel"
    }

    * Copy selected Everything_Wide files to Google Drive
    copy "`path'/DR_out/`trans_folder'Everything_Wide.dta" "`gdrive_out'/Everything_Wide.dta", replace
    copy "`path'/DR_out/`trans_folder'Everything_Wide_full.dta" "`gdrive_out'/Everything_Wide_full.dta", replace
    copy "`path'/DR_out/s_c_i_p_select.dta" "`gdrive_out'/s_c_i_p_select.dta", replace

    display "Everything_Wide files copied to Google Drive: `gdrive_out'"

    * Copy Excel file to Google Drive
    copy "`path'/DR_out/`trans_folder'excel/Everything_Wide.xlsx" "`gdrive_excel'/Everything_Wide.xlsx", replace

    display "Everything_Wide Excel copied to Google Drive: `gdrive_excel'"
}

* Cuba
if `country' == 2 & `"`user'"' == "Chris" {
    if `"$language"' == "E" {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/TRANSLATED/DTA"
        local gdrive_excel = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/TRANSLATED/EXCEL"
    }
    else {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/dta"
        local gdrive_excel = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/excel"
    }

    * Copy selected Everything_Wide files to Google Drive
    copy "`path'/CUBA_out/`trans_folder'Everything_Wide.dta" "`gdrive_out'/Everything_Wide.dta", replace
    copy "`path'/CUBA_out/`trans_folder'Everything_Wide_full.dta" "`gdrive_out'/Everything_Wide_full.dta", replace
    copy "`path'/CUBA_out/s_c_i_p_select.dta" "`gdrive_out'/s_c_i_p_select.dta", replace

    display "Everything_Wide files copied to Google Drive: `gdrive_out'"

    * Copy Excel file to Google Drive
    copy "`path'/CUBA_out/`trans_folder'excel/Everything_Wide.xlsx" "`gdrive_excel'/Everything_Wide.xlsx", replace

    display "Everything_Wide Excel copied to Google Drive: `gdrive_excel'"
}

*exit, clear

