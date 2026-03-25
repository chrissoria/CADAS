clear all
set more off
capture log close

*next, I want to find out if we have the right amount of cog scoring and cog surveys

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/Cog_Scoring_cleaned.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Cog_Scoring_cleaned.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Cog_Scoring_cleaned.csv", comma names clear
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/Cog_Scoring_cleaned.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Cog_Scoring_cleaned.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Cog_Scoring_cleaned.csv", comma names clear
}
}
replace cs_country = "2 - Cuba" if cs_country == "" & `country' == 2

* 3/19/26 cleaning — orphan cog scoring fixes (match by interviewer/device/date)
if `country' == 1 {
    *cs filed under cluster 52 house 012 — matches 15200001 (int 5, 2025-02-08), house 12→0
    replace cs_houseid = 0 if globalrecordid == "2394ec35-8e10-409d-a744-a986c2a17ab8"
    *cs filed under cluster 276 house 176 (9-digit PID 127617601) — matches 10217601 (int 2, 2024-03-05)
    replace cs_clustid = 2 if globalrecordid == "c8446ae0-a3dd-475d-b708-d1d38245335a"
    replace cs_houseid = 176 if globalrecordid == "c8446ae0-a3dd-475d-b708-d1d38245335a"
    *cs filed under house 056 — matches 13700301 (int 5, 2024-12-05), house 56→3
    replace cs_houseid = 3 if globalrecordid == "ce2fe51d-32b3-4c8d-819f-944362a289c8"
    *cs filed under house 006 — matches 13901101 (int 5, 2024-11-02), house 6→11 part 1
    replace cs_houseid = 11 if globalrecordid == "ec1f3e39-735c-4649-b2e0-c995e1c33e0d"
    replace cs_particid = 1 if globalrecordid == "ec1f3e39-735c-4649-b2e0-c995e1c33e0d"
    *cs filed under house 002 part 02 — matches 14000102 (int 5, 2024-11-06), house 2→1 part 2
    replace cs_houseid = 1 if globalrecordid == "df4ba60a-30cb-483c-b63a-19821c166e67"
    *cs filed under house 085 — matches 14108302 (int 5, 2025-03-19), house 85→83
    replace cs_houseid = 83 if globalrecordid == "c2628f7d-a40b-4305-bf43-f434806d61e9"
    *cs filed under cluster 48 — matches 14703801 (int 5, 2025-05-29), cluster 48→47
    replace cs_clustid = 47 if globalrecordid == "77b23675-ad0c-41b8-81ec-c191547d117f"
    *cs filed under house 078 — matches 15007901 (int 5, Oct 6 2023), house 78→79
    replace cs_houseid = 79 if globalrecordid == "01908d5b-227e-4595-b97a-aa88b38ca8ab"
    *cs filed under house 046 — matches 11100001 (int 2, 2025-04-26), house 46→0
    replace cs_houseid = 0 if globalrecordid == "920d855a-4869-41fb-99d8-1a4fe992da91"
    *cs filed under house 037 — matches 17001101 (int 1, 2023-10-25), house 37→11
    replace cs_houseid = 11 if globalrecordid == "f4d5a77e-7ef2-4a8d-977f-64ac56347b4c"

    *--- CS-only orphans: no matching cog or other surveys, no fix possible ---
    *cluster 9 house 217 part 01, 2023-07-26 — no match
    drop if globalrecordid == "0b015af0-644c-48cd-a0b2-d51c12a0e648"
    *cluster 26 house 005 part 01, 2024-05-03 — no match
    drop if globalrecordid == "f8895a62-ad60-4751-901a-e740e856e351"
    *cluster 40 house 008 part 01, 2024-11-08 — cog+phys also orphaned, no socio/infor
    drop if globalrecordid == "99a766bd-2350-4a10-867f-bf158d7a4fe5"
}

capture gen cs_country_num = 0
replace cs_country_num = 1 if cs_country == "1 - República Dominicana"
replace cs_country_num = 2 if cs_country == "2 - Cuba"
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

drop cs_particid_str cs_country_str cs_clustid_str cs_houseid_str

order cs_interid cs_houseid cs_clustid cs_particid cs_country cs_houseid2 cs_conglid2 cs_particid2 cs_32 cs_40 cs_41 cs_43 cs_44 cs_72_1 cs_72_2 cs_72_3 cs_72_4 cs_79_1 cs_79_2 cs_79_3 cs_79_4

label variable cs_interid "NUMERO DEL ENTREVISTADOR"

label variable cs_houseid "NÚMERO DE LA CASA"

label variable cs_clustid "NUMERO DEL CLUSTER:"

label variable cs_particid "NUMERO DEL PARTICIPANTE"

label variable cs_country "Pais"

label variable cs_houseid2 "NÚMERO DE LA CASA"

label variable cs_conglid2 "NUMERO DEL CLUSTER:"

label variable cs_particid2 "NUMERO DEL PARTICIPANTE"

label variable cs_32 "32. Dibujo de pentagonos (0-1)"

label variable cs_40 "40.# Animales"

label variable cs_41 "41.# Repetitiones"

label variable cs_43 "43. Correctas"

label variable cs_44 "44. Incorrectas"

label variable cs_72_1 "72.1. El círculo (0-2)"

label variable cs_72_2 "72.2. El diamante (0-3)"

label variable cs_72_3 "72.3. Rectángulos cruzados (0-2)"

label variable cs_72_4 "72.4. El cubo (0-4)"

label variable cs_79_1 "79.1. El círculo (0-2)"

label variable cs_79_2 "79.2. El diamante (0-3)"

label variable cs_79_3 "79.3. Rectángulos cruzados (0-2)"

label variable cs_79_4 "79.4. El cubo (0-4)"

*Fix animal scoring so cs_40 is the #UNIQUE animals listed
replace cs_40 = cs_40 - cs_41 if (cs_40 < . & cs_41 < .) & `country' == 1

****************************************
* MERGE TY'S PENTAGON SCORING
****************************************
* Preserve current data
tempfile cog_scoring_main
save `cog_scoring_main', replace

* Import Ty's scoring file
if `"`user'"' == "Chris" {
    if `country' == 0 {
        import excel using "`path'/PR_in/ty_pent_scoring_in_PR.xlsx", firstrow allstring clear
    }
    else if `country' == 1 {
        import excel using "`path'/DR_in/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
    }
    else if `country' == 2 {
        import excel using "`path'/CUBA_in/ty_pent_scoring_in_CU.xlsx", firstrow allstring clear
    }
}
else if `"`user'"' == "Ty" {
    if `country' == 0 {
        import excel using "`path'/consensus/ty_pent_scoring_in_PR.xlsx", firstrow allstring clear
    }
    else if `country' == 1 {
        import excel using "`path'/consensus/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
    }
    else if `country' == 2 {
        import excel using "`path'/consensus/ty_pent_scoring_in_CU.xlsx", firstrow allstring clear
    }
}

* Rename column from Excel (comes in with wrong name)
rename cs_40_ty cs_32_ty

* Drop empty rows
drop if pid == "" & cs_32_ty == ""

* Clean up missing values
replace cs_32_ty = "" if cs_32_ty == "missing"

* Keep only needed variables for merge
keep pid cs_32_ty

* Remove duplicates if any
duplicates drop pid, force

* Save Ty's scoring as temp file
tempfile ty_scoring
save `ty_scoring', replace

* Reload main data and merge
use `cog_scoring_main', clear
merge m:1 pid using `ty_scoring', nogenerate keep(master match)

* Create cs_32_cleaned: prioritize Ty's scores, fall back to cs_32
* Convert Ty's string score to numeric
destring cs_32_ty, gen(ty_score_num) force

* Create cleaned variable: use Ty's score if available, otherwise use original
gen cs_32_cleaned = ty_score_num if ty_score_num < .
replace cs_32_cleaned = cs_32 if cs_32_cleaned >= .
label variable cs_32_cleaned "32. Dibujo de pentagonos (cleaned, Ty scores prioritized)"

* Clean up temporary variable
drop ty_score_num
capture drop cs_32_ty

* Apply English labels if language is set to "E" and save to appropriate location
if `"$language"' == "E" {
    capture include "/Users/chrissoria/documents/CADAS/Do/Read/Cog_Scoring_english_labels.do"
    capture include "C:\Users\Ty\Desktop\CADAS Data do files\Cog_Scoring_english_labels.do"

    * Save to translation folder for English
    if `country' == 0 {
        save "translation_PR/Cog_Scoring.dta", replace
    }
    else if `country' == 1 {
        save "translation_DR/Cog_Scoring.dta", replace
    }
    else if `country' == 2 {
        save "translation_CUBA/Cog_Scoring.dta", replace
    }
}
else {
    * Save to default location for Spanish
    save Cog_Scoring.dta, replace
}

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

clear all
