********************************************************************************
* STEP 6: SAVE OUTPUT
* Keep relevant variables and save to 1066.dta and excel/1066.xlsx
********************************************************************************

display _newline(1)
display "--------------------------------------------------------------------------------"
display "STEP 6: Saving output..."
display "--------------------------------------------------------------------------------"

*-------------------------------------------------------------------------------
* KEEP RELEVANT VARIABLES
*-------------------------------------------------------------------------------

keep pid relscore cogscore nametot count animals_diss animals animtot ///
     wordtot1 wordtot2 paper papertot c_66a c_66b c_66c c_66d c_66e c_66f story ///
     storytot pencil watch chair shoes knuckle elbow should bridge hammer ///
     pray chemist repeat town street store address month day year nod point ///
     circle circle_diss pentag pentag_diss pentag_strict chief longmem season c_11 c_12 ///
     c_13 wordimm c_21 c_22 c_23 worddel miss1 miss3 misstot activ mental memory put ///
     kept frdname famname convers wordfind wordwrg past lastsee lastday ///
     orient lostout lostin chores hobby money change reason feed dress ///
     toilet recall dem1066_score dem1066 dem1066_score_quint dem1066_quint immed ///
     learn1 learn2 learn3

*-------------------------------------------------------------------------------
* ORDER VARIABLES
*-------------------------------------------------------------------------------

order pid relscore cogscore nametot count animals_diss animals animtot ///
      wordtot1 wordtot2 paper papertot c_66a c_66b c_66c c_66d c_66e c_66f story ///
      storytot pencil watch chair shoes knuckle elbow should bridge hammer ///
      pray chemist repeat town street store address month day year nod point ///
      circle circle_diss pentag pentag_diss pentag_strict chief longmem season c_11 c_12 ///
      c_13 wordimm c_21 c_22 c_23 worddel miss1 miss3 misstot activ mental memory put ///
      kept frdname famname convers wordfind wordwrg past lastsee lastday ///
      orient lostout lostin chores hobby money change reason feed dress ///
      toilet recall dem1066_score dem1066 dem1066_score_quint dem1066_quint immed ///
      learn1 learn2 learn3

*-------------------------------------------------------------------------------
* EXPORT TO EXCEL
*-------------------------------------------------------------------------------

capture mkdir excel
export excel using "excel/1066.xlsx", replace firstrow(variables)

*-------------------------------------------------------------------------------
* SAVE STATA FILE
*-------------------------------------------------------------------------------

save 1066.dta, replace

*-------------------------------------------------------------------------------
* EXPORT CASES WITH MISSING ALGORITHM VARIABLES
*-------------------------------------------------------------------------------

* Create diagnostics folder if it doesn't exist
capture mkdir "1066_diagnostics"

* Google Drive path for diagnostics
if $country == 1 {
    if `"$language"' == "E" {
        local gdrive_path "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/TRANSLATED/1066_DIAGNOSTIC_EXCELS"
    }
    else {
        local gdrive_path "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/Rep Dom/latest_data/1066_DIAGNOSTIC_EXCELS"
    }
}
else if $country == 2 {
    if `"$language"' == "E" {
        local gdrive_path "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/TRANSLATED/1066_DIAGNOSTIC_EXCELS"
    }
    else {
        local gdrive_path "/Users/chrissoria/Google Drive/other computers/My Laptop (1)/documents/cadas/data/CADAS data upload/cuba/latest_data/1066_DIAGNOSTIC_EXCELS"
    }
}
capture mkdir "`gdrive_path'"

preserve

* Count and display cases missing dem1066 classification
quietly count if missing(dem1066)
local n_missing = r(N)
display _newline(1)
display "Cases with missing dem1066 classification: `n_missing'"

* Keep only cases with missing dem1066
keep if missing(dem1066)

if _N > 0 {
    * Keep pid and all algorithm variables for diagnostics
    keep pid dem1066 dem1066_score cogscore relscore recall ///
         nametot count animtot wordtot1 wordtot2 papertot storytot ///
         animals wordimm worddel paper story ///
         pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag ///
         activ mental memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores hobby money change reason feed dress toilet ///
         miss1 miss3 misstot learn1 learn2 learn3 immed

    * Export to local diagnostics folder
    export delimited using "1066_diagnostics/1066_missing_cases.csv", replace

    * Also copy to Google Drive
    capture export delimited using "`gdrive_path'/1066_missing_cases.csv", replace

    display "Missing cases exported to:"
    display "  - 1066_diagnostics/1066_missing_cases.csv"
    display "  - Google Drive: 1066_DIAGNOSTIC_EXCELS/"
}
else {
    display "No cases with missing algorithm variables."
}

restore

display _newline(1)
display "STEP 6 complete: Data saved."
display "  - 1066.dta"
display "  - excel/1066.xlsx"
display "  - 1066_diagnostics/1066_missing_cases.csv"
display "  - Google Drive: 1066_DIAGNOSTIC_EXCELS/1066_missing_cases.csv"
display "--------------------------------------------------------------------------------"
