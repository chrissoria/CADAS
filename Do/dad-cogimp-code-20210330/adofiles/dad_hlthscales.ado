*! version 0.0.0  27may2020  [EM]

program define dad_hlthscales, rclass

// Compute health scales in the LASI-DAD data.

syntax [if] [in] [, wave(integer 1) GENerate ]

// wave: wave number
// generate: whether scales need to be generated (initialized)
//   If not requested, replace is used.

marksample touse, novarlist strok

local w `wave'

// -----------------------------------------------------------------
// Define local macros

local adl`w'   ///
    r`w'dressa ///
    r`w'walkra ///
    r`w'eata   ///
    r`w'beda   ///
    r`w'toilta ///
    r`w'batha

local bai`w'    ///
    r`w'tremb   ///
    r`w'worst   ///
    r`w'nerv    ///
    r`w'faint   ///
    r`w'fdying

local chronic`w'  ///
    r`w'inf_alzhe ///
    r`w'inf_parkn ///
    r`w'inf_strok ///
    r`w'inf_memry

local cesd`w'    ///
    r`w'ftired_d ///
    r`w'mindts_d ///
    r`w'depres_d ///
    r`w'flone_d  ///
    r`w'whappy_d ///
    r`w'fearl_d  ///
    r`w'bother_d ///
    r`w'enlife_d ///
    r`w'fhope_d  ///
    r`w'effort_d

local iadl`w'    ///
    r`w'medsa    ///
    r`w'housewka ///
    r`w'shopa    ///
    r`w'geta     ///
    r`w'mealsa   ///
    r`w'moneya   ///
    r`w'phonea

// -----------------------------------------------------------------
// Initialize

if ("`generate'" != "") {
    foreach scale in adl iadl cesd bai chronic {
        quietly generate int r`w'`scale' = .
    }
}

// -----------------------------------------------------------------
// Compute scales

local scalevars
foreach scale in adl iadl bai chronic {
    quietly {
        // Use explicit summation instead of egen ... = rowtotal()
        // so that any missing makes the whole scale missing.
        replace r`w'`scale' = 0 if (`touse')
        foreach y of varlist ``scale'`w'' {
            replace r`w'`scale' = r`w'`scale' + `y' if (`touse')
        }
    }
    local scalevars `scalevars' r`w'`scale'
}

// Scale correction
quietly replace r`w'bai = r`w'bai - 5

// CESD
//
// From the DAD codebook:
// RwCESD10 is a summary of RwMINDTS_D, RwDEPRES_D, RwFTRIED_D, RwFEARL_D,
// RwENLIFE_D, RwFLONE_D, RwBOTHER_D, RwEFFORT_D, RwFHOPE_D, and
// RwWHAPPY_D. RwENLIFE_D, RwFHOPE_D, and RwWHAPPY_D are reverse coded for
// RwCESD10. RwCESD10 is the sum of these variables. The higher the score,
// the more negative the respondent felt in the past week.

quietly {
    local scale cesd

    local reverse    r`w'enlife_d r`w'fhope_d r`w'whappy_d
    local nonreverse : list cesd`w' - reverse

    replace r`w'`scale' = 0 if (`touse')
    foreach y of varlist `nonreverse' {
        replace r`w'`scale' = r`w'`scale' + `y' if (`touse')
    }
    foreach y of varlist `reverse' {
        // Reverse code: 1->4, 2->3, 3->2, 4->1
        replace r`w'`scale' = r`w'`scale' + (5 - `y') if (`touse')
    }
    local scalevars `scalevars' r`w'`scale'

    // The codebook now suggests that the summary score is the sum of these
    // 10 variables, but the variables vary from 1-4, so the sum would vary
    // from 10-40, but it varies from 0-30, so we have to subtract 10.

    replace r`w'cesd = r`w'cesd - 10
}

label variable r`w'adl     "w`w' Number of ADL limitations (0-6)"
label variable r`w'iadl    "w`w' Number of IADL limitations (0-7)"
label variable r`w'bai     "r`w'bai:w`w' r anxiety score 5 item (0-15)"
label variable r`w'cesd    "r`w'cesd:w`w' r CESD score 10 item (0-30)"
label variable r`w'chronic "w`w' Number of diagnosed cognitive conditions (0-4)"

return local scales `scalevars'

end
exit

// EOF
