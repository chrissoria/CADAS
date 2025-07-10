capture log close

// ----------------------------------------------------------------------
// prep_lasi.do
//
// Prepare (imputed) LASI core data for use as covariates in the
// imputation of the LASI-DAD data.
//
// Erik Meijer, USC
// This version: March 26, 2021
// ----------------------------------------------------------------------

// Globals that are used if they exist:
//
// PROGDIR  - Directory of imputation programs
//            [Default: . (current directory) ]
// HLASI    - Harmonized LASI data file (excl. the cognitive imputations)
//            [Default: H_LASI.dta ]
// WAVES    - Waves to process.
//            [Default: 1 ]
// BASEFILE - Data file with (imputed) baseline demographics
//            [Default: lasi-basedemo.dta ]
// DEMOFILE - Data file with (imputed) wave-specific demographics
//            [Default: lasi-wavedemo.dta ]
// HLTHFILE - Data file with (imputed) wave-specific health and economic variables
//            [Default: lasi-econ-health.dta ]
// COGFILE  - Data file with (imputed) wave-specific cognition variables
//            [Default: lasi-cognition.dta ]
// INFFILE  - Data file with (imputed) wave-specific informant reports
//            [Default: lasi-informant.dta ]
// OUTFILE  - Output data file that combines and processes these data
//            [Default: lasi-imputed.dta ]
//
// Output data:
// $OUTFILE

clear all
set more off
set maxvar 32767
set varabbrev off
set linesize 254
capture program drop _all

// ----------------------------------------------------------------------
log using "prep_lasi.log", text replace

// Directory of imputation programs
if (`"${PROGDIR}"' != `""') {
    adopath ++`"${PROGDIR}"'
}
else {
    // Assume programs are in current directory
    adopath ++.
}

// Harmonized LASI data file (without cognitive imputations but with
// income and wealth imputations).
if (`"${HLASI}"' != `""') {
    local hlasi `"${HLASI}"'
}
else {
    // Default, in the current directory
    local hlasi `"H_LASI.dta"'
}

// Which waves to process?
if (`"${WAVES}"' != `""') {
    local wavelist `"${WAVES}"'
}
else {
    // Default
    local wavelist 1
}

// File with (imputed) baseline demographics
if (`"${BASEFILE}"' != `""') {
    local basefile `"${BASEFILE}"'
}
else {
    // Default, in the current directory
    local basefile "lasi-basedemo.dta"
}

// File with (imputed) wave-specific demographics
if (`"${DEMOFILE}"' != `""') {
    local demofile `"${DEMOFILE}"'
}
else {
    // Default, in the current directory
    local demofile "lasi-wavedemo.dta"
}

// File with (imputed) wave-specific health and economic variables
if (`"${HLTHFILE}"' != `""') {
    local hlthfile `"${HLTHFILE}"'
}
else {
    // Default, in the current directory
    local hlthfile "lasi-econ-health.dta"
}

// File with imputed cognition variables
if (`"${COGFILE}"' != `""') {
    local cogfile `"${COGFILE}"'
}
else {
    // Default, in the current directory
    local cogfile "lasi-cognition.dta"
}

// File with imputed informant reports
if (`"${INFFILE}"' != `""') {
    local inffile `"${INFFILE}"'
}
else {
    // Default, in the current directory
    local inffile "lasi-informant.dta"
}

// Output data file that combines and processes these data
if (`"${OUTFILE}"' != `""') {
    local outfile `"${OUTFILE}"'
}
else {
    // Default, in the current directory
    local outfile "lasi-imputed.dta"
}

// ----------------------------------------------------------------------
// Load data

// Identifiers
local identifiers prim_key hhid h*coupid inw* r*iwy r*iwm

// ----------------------------------------------------------------------
// Load Harmonized LASI data

use `identifiers' using `"`hlasi'"', clear
assert (!missing(prim_key))
// drop if (missing(prim_key))
drop if (!inw1)
assert (!missing(hhid))
sort prim_key

// Merge with imputed data

merge 1:1 prim_key using `"`basefile'"'
assert (_merge == 3)
drop _merge
sort prim_key

merge 1:1 prim_key using `"`demofile'"'
assert (_merge == 3)
drop _merge
sort prim_key

merge 1:1 prim_key using `"`hlthfile'"'
assert (_merge == 3)
drop _merge
sort prim_key

merge 1:1 prim_key using `"`cogfile'"'
assert (_merge == 3)
drop _merge
sort prim_key

merge 1:1 prim_key using `"`inffile'"'
assert (_merge == 3)
drop _merge
sort prim_key

// ---------------------------------------------------------------------
// Combine graduate degree and professional degree and then use these
// variables linearly
recode rafeduc_l rameduc_l (9=8)
// This one is not used linearly, so combine some of the rare categories
recode raeduc_l (6=5) (8 9=7)

// ---------------------------------------------------------------------
// Lists of covariates to keep

local keeplist `identifiers'
local basedemo rafemale raedyrs2 raeduc_l rameduc_l rafeduc_l  // M&F edu linear
local keeplist `keeplist' `basedemo'

foreach w of numlist `wavelist' {
    local wavedemo`w'  hh`w'state hh`w'rural r`w'caste r`w'lang_l r`w'agecat h`w'cpl
    local econ`w'      hh`w'quint_inc hh`w'quint_wlth
    local health`w'    r`w'shlt r`w'chronic r`w'nsighta r`w'dsighta r`w'hearcnde ///
                       r`w'fl r`w'adl r`w'iadl r`w'cesd10
    local inf`w'       r`w'jormscore

    // Compute cognitive scales
    lasi_cogscales if (inw`w'), wave(`w') generate
    local cog`w' r`w'proxy `r(scales)'

    local keeplist `keeplist' `wavedemo`w'' `econ`w'' `health`w'' `cog`w'' `inf`w''
}

describe `keeplist', fullnames
keep `keeplist'

// ---------------------------------------------------------------------
// Store this core file

rename * lasi_*
rename lasi_prim_key prim_key

compress
save "`outfile'", replace
summarize _all
describe _all, fullnames

log close
exit

// EOF
