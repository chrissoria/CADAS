capture log close

// ----------------------------------------------------------------------
// dad-cogimp01.do
//
// Cognition imputations for LASI-DAD wave 1, Part 1.
// This edits/imputes some demographics in the LASI-DAD data that are
// used as covariates.
//
// NOTE! In this (latest) version, the only demographic that has missings
// is caste, for which the "imputations" are simply copied from the
// LASI core data. I left the old imputation code in for future purposes
// in which this may not be as simple (as in earlier versions of these
// data).
//
// Erik Meijer, USC
// This version: March 27, 2021
// ----------------------------------------------------------------------

// Globals that are used if they exist:
//
// PROGDIR  - Directory of imputation programs
//            [Default: . (current directory) ]
// ILASI    - Imputed/prepared LASI core data to be used as covariates
//            [Default: lasi-imputed.dta ]
// HDAD     - Harmonized LASI-DAD data (without imputations)
//            [Default: H_DAD.dta ]
// WAVES    - Waves to process.
//            [Default: 1 ]
// DRAWFILE - File with pseudo-random numbers to be used in imputation
//            [Default: dad_cogimp_draws.dta ]
// REDRAW   - Whether pseudo-random numbers need to be regenerated
//            [Default: 0 (no)]
// SEEDFILE - File with random seed
//            [Default: rseed-dad-demo.dta ]
// SEEDLOG  - Log file when generating random seed
//            [Default: rseed-dad-demo.log ]
// OUTFILE  - Output data file
//            [Default: dad-demo.dta ]
//
// Programs used:
//
// genrseed        - Generating or reading a random seed
// mvpatterns_em   - Missing value patterns
// mflag           - Create missingness flags
// rdraws          - Read or generate pseudo-random draws
// imp_simplefrac  - Imputation based on simple fractions within another categorical variable
//
// Some of these call other programs.
//
// Output data:
// $SEEDFILE (if it doesn't exist yet)
// $DRAWFILE (if it doesn't exist yet, one or more of the variables doesn't
//           exit yet, or $REDRAW==1)
// $OUTFILE


clear all
set more off
set maxvar 32767
set varabbrev off
set linesize 254
capture program drop _all

// ----------------------------------------------------------------------
log using "dad_cogimp01.log", text replace

// ----------------------------------------------------------------------
// Process optional globals, as listed above

// Directory of imputation programs
if (`"${PROGDIR}"' != `""') {
    adopath ++`"${PROGDIR}"'
}
else {
    // Assume programs are in current directory
    adopath ++.
}

// Imputed Harmonized LASI data file
if (`"${ILASI}"' != `""') {
    local ilasi `"${ILASI}"'
}
else {
    // Default, in the current directory
    local ilasi `"lasi-imputed.dta"'
}

// Harmonized DAD data file (without imputations)
if (`"${HDAD}"' != `""') {
    local hdad `"${HDAD}"'
}
else {
    // Default, in the current directory
    local hdad `"H_DAD.dta"'
}

// Which waves to process?
if (`"${WAVES}"' != `""') {
    local wavelist `"${WAVES}"'
}
else {
    // Default
    local wavelist 1
}

// File with pseudo-random numbers to be used in imputation
if (`"${DRAWFILE}"' != `""') {
    local drawfile `"${DRAWFILE}"'
}
else {
    // Default, in the current directory
    local drawfile `"dad_cogimp_draws.dta"'
}

// Whether to (re)generate this file
if (`"${REDRAW}"' != `""') {
    // Should be 0 or 1
    local redraw `"${REDRAW}"'
}
else {
    // Default: don't redraw/don't overwrite.
    // If the draws don't exist yet, we diagnose the problem and
    // generate the draws, but if new cases have been added and the
    // variables already exist, we need to explicitly set $REDRAW to 1
    // before calling this do file.
    local redraw 0
}

// File with random seed, if pseudo-random numbers need to be regenerated.
if (`"${SEEDFILE}"' != `""') {
    local seedfile `"${SEEDFILE}"'
}
else {
    // Default, in the current directory
    local seedfile `"rseed-dad-demo.dta"'
}

// Log file to use when generating a random seed.
if (`"${SEEDLOG}"' != `""') {
    local seedlog `"${SEEDLOG}"'
}
else {
    // Default, in the current directory
    local seedlog `"rseed-dad-demo.log"'
}

// Output file with imputed cognition variables
if (`"${OUTFILE}"' != `""') {
    local outfile `"${OUTFILE}"'
}
else {
    // Default, in the current directory
    local outfile "dad-demo.dta"
}

// Maximum number of iterations for chained imputations; this is the Stata
// default as well.
local maxiter = 10

// ----------------------------------------------------------------------
// Generate or read random seed

genrseed using `"`seedfile'"', logfile(`"`seedlog'"')
local rseed `r(seed)'
set seed `rseed'

// ---------------------------------------------------------------------
// To preserve value labels
use "${ILASI}", clear
// Language seems to be coded differently
foreach w of numlist `wavelist' {
    local lasi_lang_lab : value label lasi_r`w'lang_l
    label copy `lasi_lang_lab' llang`w'
    label values lasi_r`w'lang_l llang`w'
}
tempfile tempcore
save "`tempcore'", replace

// ---------------------------------------------------------------------
// Load DAD data

// Identifiers
local dad_id    ///
    prim_key    ///
    hhidc       ///
    pnc         ///
    pn          ///
    r*phase     ///
    r*iwy_d     ///
    r*iwm_d     ///
    r*lasidy    ///
    r*inf_gendr ///
    r*inf_age   ///
    r*inf_rel

local dad_basedemo ///
    rabyear     ///
    rabmonth    ///
    ragender    ///
    raeduc_l    ///
    raeducl     ///
    raedyrs

local dad_wavedemo ///
    r*agey      ///
    h*rural     ///
    r*stateid   ///
    r*caste     ///
    r*lang_d    ///
    r*risk      ///
    r*distance  ///
    r*location

use `dad_id' `dad_basedemo' `dad_wavedemo' using "${HDAD}", clear

describe _all, fullnames
summarize _all

merge 1:1 prim_key using "`tempcore'"
// drop if (_merge != 3) // May need to keep _merge == 1 later
drop if (_merge == 2) // May need to keep _merge == 1 later
drop _merge

sort prim_key

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    tab1 r`w'inf*, missing
    // Informant present?
    generate byte r`w'inf_inw = (r`w'inf_rel != .h)

    // Proxy in core data?
    tabulate lasi_r`w'proxy, missing
}

// ---------------------------------------------------------------------

tabulate raedyrs raeduc_l, missing
recode raedyrs (18/max=17), generate(raedyrs2)
label variable raedyrs2 "raedyrs2: r years of education (topcoded)"
label values raedyrs2 raedyrs2
local dad_basedemo = subinword("`dad_basedemo'","raedyrs","raedyrs2",1)

// This one is not used linearly, so combine some of the rare categories
recode raeduc_l (6=5) (8 9=7)

generate byte rafemale = (ragender==2) if (!missing(ragender))
label variable rafemale "Female"

// ---------------------------------------------------------------------

local yvars_base ///
    rafemale     ///
    rabyear      ///
    raeduc_l     ///
    raedyrs2

local yvars_all `yvars_base'
foreach w of numlist `wavelist' {
    local yvars`w'    ///
        r`w'risk      ///
        r`w'stateid   ///
        r`w'distance  ///
        r`w'agey      ///
        h`w'rural     ///
        r`w'caste     ///
        r`w'location  ///
        r`w'lang_d
    local yvars_all `yvars_all' `yvars`w''
}

// ---------------------------------------------------------------------
// Imputation flags and random draws

local demo_imp  // List of variables that potentially need to be imputed
local iflags

forvalues ii=1/1 {
display as text _n _n "Baseline" _n

mflag `yvars_base', stub("f_")
local iflags0 `r(flags)'
local iflags `iflags' `iflags0'
foreach e of varlist `yvars_base' {
    quietly replace `e' = . if (missing(`e'))
}
local demo_imp `demo_imp' `yvars_base'

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    // If no inw`w' variable, create it.
    capture confirm variable inw`w'
    if (_rc != 0) {
        quietly generate byte inw`w' = (!missing(r`w'iwy_d))
        label variable inw`w' "inw`w':w`w' Participating in DAD"
    }

    mflag `yvars`w'' if (inw`w'), stub("f_")
    local iflags`w' `r(flags)'
    local iflags `iflags' `iflags`w''
    foreach e of varlist `yvars`w'' {
        quietly replace `e' = . if (inw`w' & missing(`e'))
    }

    local demo_imp `demo_imp' `yvars`w''
}

} // end forvalues ii=1/1

if (`redraw') {
    local redrawopt redraw
}
else {
    local redrawopt
}

rdraws `demo_imp', identifier(prim_key) drawfile(`"`drawfile'"') ///
    stub("u_") `redrawopt'

// ----------------------------------------------------------------------
// Numbers of missing values

// These can just be copied from the core data
mvpatterns `yvars_base', sort nodrop minfreq(99999)
foreach y of varlist `yvars_base' {
    display as text _n _n "---- `y' ----" _n
    assert (!missing(`y'))

    capture noisily tabulate `y' lasi_`y' if (`y' != lasi_`y'), missing
    if (_rc == 0) {
        // Both variables in this data set
        quietly replace `y' = lasi_`y' if (missing(`y') & !missing(lasi_`y'))
    }
}
mvpatterns_em `yvars_base', identifiers(prim_key)

// ----------------------------------------------------------------------
// Impute missings (simply copying if it's the same variable and there are no
// differences between LASI core & DAD.

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    mvpatterns `yvars`w'' if (inw`w'), sort nodrop minfreq(99999)

    foreach y of varlist `yvars`w'' {
        // Check with core variable if it exists there as well
        capture confirm variable lasi_`y'
        if (_rc == 0) {
            local lasiy  lasi_`y'
            local impsimple 1
        }
        else if ("`y'" == "r`w'lang_d") {
            local lasiy  lasi_r`w'lang_l
            local impsimple 1
            codebook `y' `lasiy' if (inw`w'), tabulate(25)
            // So coding schemes are the same now.
        }
        else if ("`y'" == "r`w'stateid") {
            local lasiy  lasi_hh`w'state
            local impsimple 1
        }
        else if ("`y'" == "h`w'rural") {
            local lasiy  lasi_hh`w'rural
            local impsimple 1
        }
        else if ("`y'" == "r`w'location") {
            tabulate r`w'distance `y' if (inw`w'), missing
            tabulate h`w'rural    `y' if (inw`w'), missing
            tabulate r`w'stateid  `y' if (inw`w'), missing
            tabulate r`w'agey     `y' if (inw`w'), missing
            // distance seems to be a particularly strong predictor
            local impsimple 0
        }
        else {
            local impsimple 0
        }

        if (`impsimple') {
            tabulate `y' `lasiy'  if (inw`w' & `y' != `lasiy'), missing
            imp_simplefrac `y' `lasiy' if (inw`w'), rand(u_`y')
        }
        else if ("`y'" == "r`w'location") {
            // Still simple fractions, but with a different x variable
            imp_simplefrac `y' r`w'distance if (inw`w'), rand(u_`y')
        }
    }
}

// ----------------------------------------------------------------------

foreach w of numlist `wavelist' {
    quietly recode r`w'agey (min/49=1) (50/59=2) (60/69=3) (70/79=4) (80/max=5) ///
        , generate(r`w'agecat)
    label variable r`w'agecat "w`w' Age category"
    label values r`w'agecat agecat

    mvpatterns_em `yvars`w'' r`w'agecat if (inw`w'), identifiers(prim_key)
    foreach y of varlist `yvars`w'' r`w'agecat {
        assert (!missing(`y')) if (inw`w')
    }
}

keep prim_key `yvars_all' `iflags' r*agecat
sort prim_key
compress
save "`outfile'", replace
describe _all, fullnames
summarize _all
// ----------------------------------------------------------------------
set linesize 80
log close
exit

// EOF
