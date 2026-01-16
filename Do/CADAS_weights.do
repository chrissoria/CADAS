********************************************************************************
********************************************************************************
**                                                                            **
**                    CADAS WEIGHTS AND APPENDED DATASET                      **
**                                                                            **
**                 Generate weights and append s_c_i_p_select                 **
**                                                                            **
********************************************************************************
********************************************************************************

clear
set more off
capture log close

* Uses global $country and $language set in CADAS_master.do

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
    local path = "/Users/chrissoria/documents/CADAS/Data"
}
else if `"`user'"' == "Ty" {
    local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}
else {
    * Fallback path for Chris's machine
    local path = "/Users/chrissoria/documents/CADAS/Data"
}

* Set translation folder path based on language
if `"$language"' == "E" {
    local trans_folder_pr "translation_PR/"
    local trans_folder_dr "translation_DR/"
    local trans_folder_cu "translation_CUBA/"
}
else {
    local trans_folder_pr ""
    local trans_folder_dr ""
    local trans_folder_cu ""
}

****************************************
* SECTION 1: CUBA WEIGHTS
****************************************

if $country == 2 {

    capture mkdir "`path'/CUBA_out"
    capture mkdir "`path'/CUBA_out/logs"
    capture log close
    log using "`path'/CUBA_out/logs/CADAS_weights", text replace

    display _newline(2)
    display "================================================================================"
    display "GENERATING POST-STRATIFICATION WEIGHTS FOR CUBA"
    display "================================================================================"
    display _newline(1)

    *---------------------------------------------------------------------------
    * Step 1.1: Load Cuba Socio data (has pid, s_0, s_2_3)
    *---------------------------------------------------------------------------

    use "`path'/CUBA_out/`trans_folder_cu'Socio.dta", clear

    display "Loaded Cuba Socio: N = " _N

    *---------------------------------------------------------------------------
    * Step 1.2: Check for required variables
    *---------------------------------------------------------------------------

    * Verify pid exists
    capture confirm variable pid
    if _rc != 0 {
        display as error "ERROR: pid variable not found in dataset"
        exit 111
    }

    * Verify sex variable exists (s_0: 0=male, 1=female)
    capture confirm variable s_0
    if _rc != 0 {
        display as error "ERROR: Sex variable s_0 not found in dataset"
        exit 111
    }

    * Verify age variable exists (s_2_3: age from official document)
    capture confirm variable s_2_3
    if _rc != 0 {
        display as error "ERROR: Age variable s_2_3 not found in dataset"
        exit 111
    }

    *---------------------------------------------------------------------------
    * Step 1.3: Create age groups matching census data
    *---------------------------------------------------------------------------

    * Age groups: 65-69, 70-74, 75-79, 80-84, 85+
    capture drop age_group
    capture drop sex
    capture drop age_sex_cell
    capture drop weight

    gen age_group = ""
    replace age_group = "65-69" if s_2_3 >= 65 & s_2_3 <= 69
    replace age_group = "70-74" if s_2_3 >= 70 & s_2_3 <= 74
    replace age_group = "75-79" if s_2_3 >= 75 & s_2_3 <= 79
    replace age_group = "80-84" if s_2_3 >= 80 & s_2_3 <= 84
    replace age_group = "85+"   if s_2_3 >= 85 & s_2_3 < .

    label variable age_group "Age group for weighting"

    * Check for cases outside age range or missing age
    count if age_group == ""
    local n_missing_age = r(N)
    if `n_missing_age' > 0 {
        display "WARNING: " `n_missing_age' " cases have missing or out-of-range age (s_2_3)"
        tab s_2_3 if age_group == "", missing
    }

    *---------------------------------------------------------------------------
    * Step 1.4: Create sex variable for weighting
    *---------------------------------------------------------------------------

    * s_0: 0=hombre(male), 1=mujer(female)
    gen sex = s_0
    label variable sex "Sex for weighting (0=male, 1=female)"

    * Check for missing sex
    count if missing(sex)
    local n_missing_sex = r(N)
    if `n_missing_sex' > 0 {
        display "WARNING: " `n_missing_sex' " cases have missing sex (s_0)"
    }

    *---------------------------------------------------------------------------
    * Step 1.5: Create age-sex cells for weighting
    *---------------------------------------------------------------------------

    * Create combined age-sex variable
    gen str20 age_sex_cell = age_group + "_" + string(sex) if age_group != "" & !missing(sex)
    label variable age_sex_cell "Age-sex cell for weighting"

    * Display sample distribution
    display _newline(1)
    display "SAMPLE DISTRIBUTION BY AGE GROUP AND SEX"
    display "----------------------------------------"
    tab age_group sex, missing

    *---------------------------------------------------------------------------
    * Step 1.6: Calculate sample proportions
    *---------------------------------------------------------------------------

    * Count total valid cases (have both age group and sex)
    count if age_group != "" & !missing(sex)
    local sample_total = r(N)
    display _newline(1)
    display "Total valid cases for weighting: " `sample_total'

    * Calculate sample counts by age-sex cell
    preserve

    keep if age_group != "" & !missing(sex)

    gen _one = 1
collapse (count) sample_n = _one, by(age_group sex)

    * Calculate sample proportions
    egen sample_total = total(sample_n)
    gen sample_prop = sample_n / sample_total

    * Display sample proportions
    display _newline(1)
    display "SAMPLE PROPORTIONS BY AGE-SEX CELL"
    display "----------------------------------"
    list age_group sex sample_n sample_prop, noobs

    tempfile sample_props
    save `sample_props'

    restore

    *---------------------------------------------------------------------------
    * Step 1.7: Create population proportions from Cuba census
    *---------------------------------------------------------------------------

    * Cuba Census Population 65+ by age group and sex
    * Source: Cuban Census
    preserve

    clear
    input str10 age_group sex pop_n
    "65-69" 0 241247
    "65-69" 1 270355
    "70-74" 0 207368
    "70-74" 1 239476
    "75-79" 0 150179
    "75-79" 1 187665
    "80-84" 0 98465
    "80-84" 1 131994
    "85+"   0 80746
    "85+"   1 117606
    end

    * Calculate population proportions
    egen pop_total = total(pop_n)
    gen pop_prop = pop_n / pop_total

    display _newline(1)
    display "POPULATION PROPORTIONS (Cuba Census 65+)"
    display "----------------------------------------"
    list age_group sex pop_n pop_prop, noobs

    display _newline(1)
    display "Total population 65+: " pop_total[1]

    tempfile pop_props
    save `pop_props'

    restore

    *---------------------------------------------------------------------------
    * Step 1.8: Merge sample and population proportions
    *---------------------------------------------------------------------------

    preserve

    use `sample_props', clear

    merge 1:1 age_group sex using `pop_props', nogen

    *---------------------------------------------------------------------------
    * Step 1.9: Calculate post-stratification weights
    *---------------------------------------------------------------------------

    * Weight = population proportion / sample proportion
    gen weight = pop_prop / sample_prop

    display _newline(1)
    display "POST-STRATIFICATION WEIGHTS BY AGE-SEX CELL"
    display "-------------------------------------------"
    list age_group sex sample_n sample_prop pop_prop weight, noobs

    * Save weights lookup table
    keep age_group sex weight

    tempfile weights_lookup
    save `weights_lookup'

    restore

    *---------------------------------------------------------------------------
    * Step 1.10: Merge weights back to main dataset
    *---------------------------------------------------------------------------

    merge m:1 age_group sex using `weights_lookup', gen(_merge_weight)

    * Check merge results
    display _newline(1)
    display "WEIGHT MERGE RESULTS"
    display "--------------------"
    tab _merge_weight

    * Cases without weights (missing age or sex)
    count if _merge_weight == 1
    local n_no_weight = r(N)
    if `n_no_weight' > 0 {
        display "WARNING: " `n_no_weight' " cases could not be assigned weights (missing age group or sex)"
    }

    drop _merge_weight

    * Label the weight variable
    label variable weight "Post-stratification weight (age x sex)"

    *---------------------------------------------------------------------------
    * Step 1.11: Validate weights
    *---------------------------------------------------------------------------

    display _newline(1)
    display "================================================================================"
    display "WEIGHT VALIDATION"
    display "================================================================================"

    * Summary statistics
    display _newline(1)
    display "Weight summary statistics:"
    display "--------------------------"
    summarize weight, detail

    *---------------------------------------------------------------------------
    * Validation by AGE x SEX cells (the actual weighting cells)
    *---------------------------------------------------------------------------

    display _newline(1)
    display "VALIDATION BY AGE x SEX CELLS"
    display "-----------------------------"
    display "If weights are correct, weighted_prop should equal pop_prop"
    display ""

    preserve
    keep if !missing(weight)

    * Collapse by age-sex cell
    gen _one = 1
    collapse (sum) weighted_n = weight (count) sample_n = _one, by(age_group sex)

    * Calculate proportions
    egen weighted_total = total(weighted_n)
    egen sample_total = total(sample_n)
    gen sample_prop = sample_n / sample_total
    gen weighted_prop = weighted_n / weighted_total

    * Add population proportions (total pop 65+ = 1,725,101)
    gen pop_n = .
    replace pop_n = 241247 if age_group == "65-69" & sex == 0
    replace pop_n = 270355 if age_group == "65-69" & sex == 1
    replace pop_n = 207368 if age_group == "70-74" & sex == 0
    replace pop_n = 239476 if age_group == "70-74" & sex == 1
    replace pop_n = 150179 if age_group == "75-79" & sex == 0
    replace pop_n = 187665 if age_group == "75-79" & sex == 1
    replace pop_n = 98465  if age_group == "80-84" & sex == 0
    replace pop_n = 131994 if age_group == "80-84" & sex == 1
    replace pop_n = 80746  if age_group == "85+"   & sex == 0
    replace pop_n = 117606 if age_group == "85+"   & sex == 1

    gen pop_prop = pop_n / 1725101

    * Calculate difference (should be ~0 if correct)
    gen diff = weighted_prop - pop_prop
    gen pct_diff = abs(diff) * 100

    * Create sex label for display
    gen str6 sex_label = "Male" if sex == 0
    replace sex_label = "Female" if sex == 1

    * Sort for display
    gen sort_order = .
    replace sort_order = 1 if age_group == "65-69"
    replace sort_order = 2 if age_group == "70-74"
    replace sort_order = 3 if age_group == "75-79"
    replace sort_order = 4 if age_group == "80-84"
    replace sort_order = 5 if age_group == "85+"
    sort sort_order sex

    * Convert to percentages for display
    replace sample_prop = sample_prop * 100
    replace weighted_prop = weighted_prop * 100
    replace pop_prop = pop_prop * 100
    replace diff = diff * 100

    * Display comparison table
    display ""
    display "VALIDATION TABLE: Weighted% should match Census%"
    display ""
    list age_group sex_label sample_prop weighted_prop pop_prop diff, noobs abbreviate(20)

    * Check if all differences are essentially zero (< 0.01%)
    summarize pct_diff
    local max_diff = r(max)

    display ""
    if `max_diff' < 0.01 {
        display "VALIDATION PASSED: All weighted proportions match census proportions"
        display "Maximum difference: `max_diff'%"
    }
    else {
        display "VALIDATION FAILED: Weighted proportions do not match census"
        display "Maximum difference: `max_diff'%"
    }

    restore

    *---------------------------------------------------------------------------
    * Step 1.12: Save weights.dta with pid and weight only
    *---------------------------------------------------------------------------

    display _newline(1)
    display "================================================================================"
    display "SAVING CUBA WEIGHTS FILE"
    display "================================================================================"

    * Keep only pid and weight
    keep pid weight

    * Save weights.dta
    capture erase "`path'/CUBA_out/`trans_folder_cu'weights.dta"
    save "`path'/CUBA_out/`trans_folder_cu'weights.dta", replace
    display "Saved: `path'/CUBA_out/`trans_folder_cu'weights.dta"

    * Copy to Google Drive
    if `"$language"' == "E" {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/TRANSLATED/DTA"
    }
    else {
        local gdrive_out = "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/dta"
    }

    capture copy "`path'/CUBA_out/`trans_folder_cu'weights.dta" "`gdrive_out'/weights.dta", replace
    if _rc == 0 {
        display "Copied to Google Drive: `gdrive_out'/weights.dta"
    }
    else {
        display "Note: Could not copy to Google Drive (directory may not exist)"
    }

    display _newline(1)
    display "Cuba weighting complete. Saved weights.dta with pid and weight columns."
    display "================================================================================"

    log close
}

****************************************
* SECTION 2: DOMINICAN REPUBLIC WEIGHTS
****************************************

if $country == 1 {
    capture mkdir "`path'/DR_out/logs"
    log using "`path'/DR_out/logs/CADAS_weights", text replace

    display _newline(2)
    display "================================================================================"
    display "DR WEIGHTS - TO BE IMPLEMENTED"
    display "================================================================================"
    display "Population data needed for Dominican Republic 65+ by age group and sex"

    log close
}

****************************************
* SECTION 3: PUERTO RICO WEIGHTS
****************************************

if $country == 0 {
    capture mkdir "`path'/PR_out/logs"
    log using "`path'/PR_out/logs/CADAS_weights", text replace

    display _newline(2)
    display "================================================================================"
    display "PR WEIGHTS - TO BE IMPLEMENTED"
    display "================================================================================"
    display "Population data needed for Puerto Rico 65+ by age group and sex"

    log close
}

****************************************
* SECTION 4: APPEND ALL COUNTRIES
****************************************

* This section will append weighted datasets from all three countries
* To be implemented once all country weights are generated

/*
display _newline(2)
display "================================================================================"
display "APPENDING ALL COUNTRIES"
display "================================================================================"

* Load Cuba
use "`path'/CUBA_out/s_c_i_p_select_weighted.dta", clear
gen country = 2
label define country_lbl 0 "Puerto Rico" 1 "Dominican Republic" 2 "Cuba"
label values country country_lbl

* Append DR
append using "`path'/DR_out/s_c_i_p_select_weighted.dta"
replace country = 1 if country == .

* Append PR
append using "`path'/PR_out/s_c_i_p_select_weighted.dta"
replace country = 0 if country == .

* Save appended dataset
save "`path'/CADAS_all_countries_weighted.dta", replace
display "Saved: `path'/CADAS_all_countries_weighted.dta"
*/
