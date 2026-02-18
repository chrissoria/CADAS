* ══════════════════════════════════════════════════════════════════════════════
* Physical Exam Range Checks — Dominican Republic
* Flags cases with out-of-range measurement values and exports one Excel
* per variable group to duplicates/ and Google Drive SAMPLE_DIAGNOSTIC_EXCELS.
* Sentinel codes: 666 = could not complete, 999 = missing → excluded from flags.
* Runs BEFORE global_checks_DR.do in the pipeline.
* ══════════════════════════════════════════════════════════════════════════════

clear all
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

local country = 1

if `"`user'"' == "Chris" {
    local path = "/Users/chrissoria/documents/CADAS/Data"
}
else if `"`user'"' == "Ty" {
    local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}

cd "`path'/DR_out"

* Set translation folder path based on language
if `"$language"' == "E" {
    local trans_folder "translation_DR/"
}
else {
    local trans_folder ""
}

* ── Load physical exam data ──────────────────────────────────────────────────
use `trans_folder'Phys.dta, clear

display _newline(2)
display "════════════════════════════════════════════════════════"
display "  Physical Exam Range Checks — DR"
display "════════════════════════════════════════════════════════"

* ── Ensure duplicates directory exists ───────────────────────────────────────
capture mkdir "duplicates"

* ══════════════════════════════════════════════════════════════════════════════
* HELPER PROGRAM: flag_and_export
*   Flags rows where any of the listed variables are outside [lo, hi],
*   excluding sentinels 666 and 999. Exports flagged rows to Excel.
* ══════════════════════════════════════════════════════════════════════════════
capture program drop flag_and_export
program define flag_and_export
    syntax, vars(string) lo(real) hi(real) filename(string) label(string)

    preserve

    * Build a flag for any variable out of range
    gen byte _any_flag = 0
    gen str200 _flag_details = ""

    foreach v of local vars {
        capture confirm numeric variable `v'
        if _rc == 0 {
            * Flag out-of-range (not sentinel, not missing)
            gen byte _oor_`v' = (!missing(`v') & `v' != 666 & `v' != 999 & (`v' < `lo' | `v' > `hi'))
            * Flag sentinels
            gen byte _sent_`v' = (!missing(`v') & (`v' == 666 | `v' == 999))
            replace _any_flag = 1 if _oor_`v' == 1 | _sent_`v' == 1

            * Build detail string
            replace _flag_details = _flag_details + "`v'=" + string(`v') + " [OUT OF RANGE]; " ///
                if _oor_`v' == 1
            replace _flag_details = _flag_details + "`v'=" + string(`v') + " [SENTINEL]; " ///
                if _sent_`v' == 1

            drop _oor_`v' _sent_`v'
        }
    }

    * Keep only flagged cases
    keep if _any_flag == 1
    local n_flagged = _N

    if `n_flagged' > 0 {
        * Keep useful identifiers + measurement vars + flag
        keep pid globalrecordid `vars' _flag_details
        rename _flag_details flag_details

        * Sort for readability
        sort pid

        capture erase "duplicates/`filename'"
        export excel using "duplicates/`filename'", replace firstrow(variables)
        display "  `label': `n_flagged' cases flagged -> duplicates/`filename'"
    }
    else {
        display "  `label': 0 cases flagged — no file written."
    }

    restore
end

* ══════════════════════════════════════════════════════════════════════════════
* 1. WEIGHT (kg) — no explicit range in labels; clinical plausibility 30–200
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Weight (kg) ---"
flag_and_export, vars(p_18_d_c) lo(30) hi(200) ///
    filename("phys_range_weight.xlsx") label("Weight (kg)")

* ══════════════════════════════════════════════════════════════════════════════
* 2. BMI (computed from weight and stature)
*    Plausible range: 10–60
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- BMI ---"

* Compute BMI temporarily
gen double _weight_kg = p_18_d_c if !missing(p_18_d_c) & p_18_d_c != 666 & p_18_d_c != 999
gen double _height_m  = p_5_2_d_c / 100 if !missing(p_5_2_d_c) & p_5_2_d_c != 666 & p_5_2_d_c != 999
gen double bmi = _weight_kg / (_height_m^2) if _height_m > 0 & !missing(_weight_kg)
label variable bmi "Computed BMI (weight_kg / height_m^2)"

preserve

gen byte _bmi_flag = (!missing(bmi) & (bmi < 10 | bmi > 60))
keep if _bmi_flag == 1
local n_bmi = _N

if `n_bmi' > 0 {
    keep pid globalrecordid p_18_d_c p_5_2_d_c bmi
    gen str60 flag_details = "BMI=" + string(bmi, "%9.1f") + " [OUT OF RANGE 10-60]"
    sort pid
    capture erase "duplicates/phys_range_bmi.xlsx"
    export excel using "duplicates/phys_range_bmi.xlsx", replace firstrow(variables)
    display "  BMI: `n_bmi' cases flagged -> duplicates/phys_range_bmi.xlsx"
}
else {
    display "  BMI: 0 cases flagged — no file written."
}

restore
drop _weight_kg _height_m bmi

* ══════════════════════════════════════════════════════════════════════════════
* 3. BLOOD PRESSURE — Systolic 80–200, Diastolic 50–200 (from labels)
*    Two readings: p_2_2_1/p_2_2_2 (reading 1), p_2_3_1/p_2_3_2 (reading 2)
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Blood Pressure ---"

preserve

gen byte _any_bp = 0
gen str400 _flag_details = ""

foreach v in p_2_2_1 p_2_3_1 {
    gen byte _oor_`v' = (!missing(`v') & `v' != 666 & `v' != 999 & (`v' < 80 | `v' > 200))
    gen byte _sent_`v' = (!missing(`v') & (`v' == 666 | `v' == 999))
    replace _any_bp = 1 if _oor_`v' == 1 | _sent_`v' == 1
    replace _flag_details = _flag_details + "`v'=" + string(`v') + " [SYS OUT OF RANGE 80-200]; " if _oor_`v' == 1
    replace _flag_details = _flag_details + "`v'=" + string(`v') + " [SENTINEL]; " if _sent_`v' == 1
    drop _oor_`v' _sent_`v'
}

foreach v in p_2_2_2 p_2_3_2 {
    gen byte _oor_`v' = (!missing(`v') & `v' != 666 & `v' != 999 & (`v' < 50 | `v' > 200))
    gen byte _sent_`v' = (!missing(`v') & (`v' == 666 | `v' == 999))
    replace _any_bp = 1 if _oor_`v' == 1 | _sent_`v' == 1
    replace _flag_details = _flag_details + "`v'=" + string(`v') + " [DIA OUT OF RANGE 50-200]; " if _oor_`v' == 1
    replace _flag_details = _flag_details + "`v'=" + string(`v') + " [SENTINEL]; " if _sent_`v' == 1
    drop _oor_`v' _sent_`v'
}

keep if _any_bp == 1
local n_bp = _N

if `n_bp' > 0 {
    keep pid globalrecordid p_2_2_1 p_2_2_2 p_2_3_1 p_2_3_2 _flag_details
    rename _flag_details flag_details
    sort pid
    capture erase "duplicates/phys_range_blood_pressure.xlsx"
    export excel using "duplicates/phys_range_blood_pressure.xlsx", replace firstrow(variables)
    display "  Blood Pressure: `n_bp' cases flagged -> duplicates/phys_range_blood_pressure.xlsx"
}
else {
    display "  Blood Pressure: 0 cases flagged — no file written."
}

restore

* ══════════════════════════════════════════════════════════════════════════════
* 4. HEAD CIRCUMFERENCE — 49–63 cm (from labels)
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Head Circumference ---"
flag_and_export, vars(p_3_d_c) lo(49) hi(63) ///
    filename("phys_range_head_circumference.xlsx") label("Head Circumference (cm)")

* ══════════════════════════════════════════════════════════════════════════════
* 5. WAIST CIRCUMFERENCE — 56–129 cm (from labels)
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Waist Circumference ---"
flag_and_export, vars(p_4_d_c) lo(56) hi(129) ///
    filename("phys_range_waist_circumference.xlsx") label("Waist Circumference (cm)")

* ══════════════════════════════════════════════════════════════════════════════
* 6. KNEE HEIGHT — 35–65 cm
*    Note: Phys_Read.do "usual range" is 49-59 cm, but the DR elderly
*    population median is ~47 cm. Widened to flag only true data-entry errors.
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Knee Height ---"
flag_and_export, vars(p_5_1_d_c) lo(35) hi(65) ///
    filename("phys_range_knee_height.xlsx") label("Knee Height (cm)")

* ══════════════════════════════════════════════════════════════════════════════
* 7. STATURE — 131–189 cm (from labels)
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Stature ---"
flag_and_export, vars(p_5_2_d_c) lo(131) hi(189) ///
    filename("phys_range_stature.xlsx") label("Stature (cm)")

* ══════════════════════════════════════════════════════════════════════════════
* 8. GRIP STRENGTH — 0–80 kg-force (clinical plausibility)
*    Right hand: p_15_1_1, p_15_1_2, p_15_1_3
*    Left hand:  p_15_2_1, p_15_2_2, p_15_2_3
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Grip Strength ---"
flag_and_export, vars(p_15_1_1 p_15_1_2 p_15_1_3 p_15_2_1 p_15_2_2 p_15_2_3) lo(0) hi(80) ///
    filename("phys_range_grip_strength.xlsx") label("Grip Strength (kg)")

* ══════════════════════════════════════════════════════════════════════════════
* 9. GAIT / WALKING TEST
*    Steps (p_14_1): 1–60;  Time in seconds (p_14_2): 1–120
* ══════════════════════════════════════════════════════════════════════════════
display _newline "--- Gait: Steps ---"
flag_and_export, vars(p_14_1) lo(1) hi(60) ///
    filename("phys_range_gait_steps.xlsx") label("Gait: Steps")

display _newline "--- Gait: Time ---"
flag_and_export, vars(p_14_2) lo(1) hi(120) ///
    filename("phys_range_gait_time.xlsx") label("Gait: Time (seconds)")

* ══════════════════════════════════════════════════════════════════════════════
* Copy range-check files to Google Drive
* ══════════════════════════════════════════════════════════════════════════════
if `"`user'"' == "Chris" {
    local gdrive_diag = "/Users/chrissoria/Google Drive/Other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/SAMPLE_DIAGNOSTIC_EXCELS"

    local range_files "phys_range_weight phys_range_bmi phys_range_blood_pressure phys_range_head_circumference phys_range_waist_circumference phys_range_knee_height phys_range_stature phys_range_grip_strength phys_range_gait_steps phys_range_gait_time"

    foreach f of local range_files {
        capture copy "duplicates/`f'.xlsx" "`gdrive_diag'/`f'.xlsx", replace
    }

    display _newline "Range-check files copied to Google Drive: `gdrive_diag'"
}

display _newline(2)
display "════════════════════════════════════════════════════════"
display "  Physical Exam Range Checks — Complete"
display "════════════════════════════════════════════════════════"

clear all
