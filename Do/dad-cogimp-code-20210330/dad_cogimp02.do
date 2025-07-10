capture log close

// ----------------------------------------------------------------------
// dad-cogimp02.do
//
// Cognition imputations for LASI-DAD wave 1, Part 2.
// This imputes some health variables in the LASI-DAD data that are
// used as covariates.
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
//            [Default: rseed-dad-health.dta ]
// SEEDLOG  - Log file when generating random seed
//            [Default: rseed-dad-health.log ]
// DEMOFILE - Imputed DAD data to be used as covariates
//            [Default: dad-demo.dta ]
// OUTFILE  - Output data file
//            [Default: dad-health.dta ]
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
log using "dad_cogimp02.log", text replace

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
    local seedfile `"rseed-dad-health.dta"'
}

// Log file to use when generating a random seed.
if (`"${SEEDLOG}"' != `""') {
    local seedlog `"${SEEDLOG}"'
}
else {
    // Default, in the current directory
    local seedlog `"rseed-dad-health.log"'
}

// Demographics
if (`"${DEMOFILE}"' != `""') {
    local demofile `"${DEMOFILE}"'
}
else {
    // Default, in the current directory
    local demofile "dad-demo.dta"
}

// Output file with imputed cognition variables
if (`"${OUTFILE}"' != `""') {
    local outfile `"${OUTFILE}"'
}
else {
    // Default, in the current directory
    local outfile "dad-health.dta"
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
summarize _all

// ---------------------------------------------------------------------
// Load DAD data

describe using "${HDAD}"

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
    rafemale    ///
    raeduc_l    ///
    raedyrs2

local dad_wavedemo ///
    r*agey      ///
    r*agecat    ///
    h*rural     ///
    r*stateid   ///
    r*caste     ///
    r*lang_d    ///
    r*risk      ///
    r*distance  ///
    r*location

local dad_infhlth ///
    r*inf_strok ///
    r*inf_parkn ///
    r*inf_alzhe ///
    r*inf_memry

local dad_adl ///
    r*dressa ///
    r*walkra ///
    r*batha  ///
    r*eata   ///
    r*beda   ///
    r*toilta

local dad_iadl ///
    r*mealsa   ///
    r*shopa    ///
    r*phonea   ///
    r*medsa    ///
    r*housewka ///
    r*moneya   ///
    r*geta

local dad_cesd ///
    r*mindts_d ///
    r*depres_d ///
    r*ftired_d ///
    r*fearl_d  ///
    r*enlife_d ///
    r*flone_d  ///
    r*bother_d ///
    r*effort_d ///
    r*fhope_d  ///
    r*whappy_d

local dad_bai ///
    r*worst   ///
    r*nerv    ///
    r*tremb   ///
    r*fdying  ///
    r*faint

local yvars_all
foreach w of numlist `wavelist' {
    local chronic`w'  ///
        r`w'inf_strok ///
        r`w'inf_parkn ///
        r`w'inf_alzhe ///
        r`w'inf_memry

    local adl`w' ///
        r`w'dressa ///
        r`w'walkra ///
        r`w'batha  ///
        r`w'eata   ///
        r`w'beda   ///
        r`w'toilta

    local iadl`w'  ///
        r`w'mealsa   ///
        r`w'shopa    ///
        r`w'phonea   ///
        r`w'medsa    ///
        r`w'housewka ///
        r`w'moneya   ///
        r`w'geta

    local cesd`w'  ///
        r`w'mindts_d ///
        r`w'depres_d ///
        r`w'ftired_d ///
        r`w'fearl_d  ///
        r`w'enlife_d ///
        r`w'flone_d  ///
        r`w'bother_d ///
        r`w'effort_d ///
        r`w'fhope_d  ///
        r`w'whappy_d

    local bai`w' ///
        r`w'worst   ///
        r`w'nerv    ///
        r`w'tremb   ///
        r`w'fdying  ///
        r`w'faint

    local yvars`w' `chronic`w'' `adl`w'' `iadl`w'' `cesd`w'' `bai`w''
    local yvars_all `yvars_all' `yvars`w''
}

// Dropped in phase 2, so let's drop it from these analyses as well
// local dad_hearsee ///
//     r*i_hear

local dad_hlth_all `dad_infhlth' `dad_adl' `dad_iadl' `dad_cesd' `dad_bai' // `dad_hearsee'

// ---------------------------------------------------------------------
// Load DAD data

use `dad_id' `dad_hlth_all' using "${HDAD}", clear

describe _all, fullnames
summarize _all

merge 1:1 prim_key using "`demofile'"
assert (_merge == 3)
drop _merge

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
// Imputation flags and random draws

local hlth_imp
local iflags
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

    local hlth_imp `hlth_imp' `yvars`w''
}

if (`redraw') {
    local redrawopt redraw
}
else {
    local redrawopt
}

rdraws `hlth_imp', identifier(prim_key) drawfile(`"`drawfile'"') ///
    stub("u_") `redrawopt'

// ---------------------------------------------------------------------
// Variables that are both in the core and in DAD

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    mvpatterns `yvars`w'' , sort nodrop minfreq(99999)

    mvpatterns_em `adl`w'' `iadl`w'', identifiers(prim_key)
    foreach y of varlist `adl`w'' {
        tabulate `y' lasi_r`w'adl, missing
    }
    foreach y of varlist `iadl`w'' {
        tabulate `y' lasi_r`w'iadl, missing
    }

    mvpatterns_em `chronic`w'', identifiers(prim_key)
    foreach y of varlist `chronic`w'' {
        tabulate `y' lasi_r`w'chronic, missing
    }

    tabulate r`w'stateid  r`w'inf_alzhe, missing
    tabulate r`w'location r`w'inf_alzhe, missing

    // See dad-tmp-cesd.log for crosstabulations of CESD items.
    // Correlations are surprisingly low (in the 0.10 range)
    mvpatterns_em `cesd`w'', identifiers(prim_key)

    mvpatterns_em `bai`w'', identifiers(prim_key)
}

// ---------------------------------------------------------------------
// Lists of covariates from the Core data

local xbasedemo lasi_rameduc_l lasi_rafeduc_l  // M&F edu linear
foreach w of numlist `wavelist' {
    local xwavedemo`w' lasi_h`w'cpl
    local xecon`w' i.lasi_hh`w'quint_inc i.lasi_hh`w'quint_wlth
    local xhlth`w' i.lasi_r`w'shlt ///
        i.lasi_r`w'dsighta i.lasi_r`w'nsighta lasi_r`w'hearcnde ///
        lasi_r`w'chronic lasi_r`w'fl lasi_r`w'adl lasi_r`w'iadl

    quietly {
        replace lasi_r`w'follow = 0 if (lasi_inw`w' & missing(lasi_r`w'follow) ///
            & lasi_r`w'illiterate)
        replace lasi_r`w'sent = 0 if (lasi_inw`w' & missing(lasi_r`w'sent) ///
            & lasi_r`w'illiterate)
    }

    // Compute scales following Gross et al. (2020), although some of the
    // aggregates span multiple dimensions from that paper.
    quietly {
        generate int lasi_r`w'orientation = lasi_r`w'orient4p + lasi_r`w'orient4t ///
            if (lasi_inw`w' & !lasi_r`w'proxy)

        // Add computation to executive functioning
        generate int lasi_r`w'execfunc = lasi_r`w'serial7 + lasi_r`w'bwc ///
            + lasi_r`w'compu if (lasi_inw`w' & !lasi_r`w'proxy)

        // The three-stage task is called executive function in the LASI
        // codebook, but Alden has it in language.
        generate int lasi_r`w'langflu = lasi_r`w'object + lasi_r`w'verbal ///
            + lasi_r`w'exec ///
            if (lasi_inw`w' & !lasi_r`w'proxy)
        // For literates only
        generate int lasi_r`w'langlit = lasi_r`w'follow + lasi_r`w'sent ///
            if (lasi_inw`w' & !lasi_r`w'proxy)

        // For including non-proxies in the imputation model for proxies
        replace lasi_r`w'jormscore = 0 if (lasi_inw`w' & !lasi_r`w'proxy)
    }
    local xcogscales`w' lasi_r`w'orientation lasi_r`w'recall10 ///
        lasi_r`w'execfunc lasi_r`w'langflu lasi_r`w'langlit ///
        lasi_r`w'illiterate lasi_r`w'drawpic lasi_r`w'verbinc

    // Common covariates
    local xvarsc`w' `xbasedemo' `xwavedemo`w'' `xecon`w'' `xhlth`w''

    // Nonmissing covariates (self iw in core)
    local xvars`w'  `xvarsc`w'' `xcogscales`w''

    // Nonmissing covariates (proxy iw in core)
    local xvarsp`w' `xvarsc`w'' lasi_r`w'jormscore lasi_r`w'proxy
}

// Demographic covariates from DAD

local xdadbasedemo rafemale raedyrs2 i.raeduc_l
foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    quietly recode r`w'location (1=0) (2=1), generate(r`w'athome)
    label variable r`w'athome "w`w' Iw at home"
    local xdadwavedemo`w' r`w'athome i.r`w'stateid h`w'rural i.r`w'caste i.r`w'lang_d i.r`w'agecat

    local xvars`w'  `xvars`w''  `xdadbasedemo' `xdadwavedemo`w''
    local xvarsp`w' `xvarsp`w'' `xdadbasedemo' `xdadwavedemo`w''
    local xvarsc`w' `xvarsc`w'' `xdadbasedemo' `xdadwavedemo`w''

    display as text "Non-proxy interviews"
    summarize `yvars`w'' `xvars`w''  if (lasi_r`w'proxy != 1)

    display as text "Proxy interviews"
    summarize `yvars`w'' `xvarsp`w'' if (lasi_r`w'proxy == 1)

    display as text "Both"
    summarize `yvars`w'' `xvarsp`w''
}

foreach w of numlist `wavelist' {
    // Sort y variables roughly in order of #missings, but keep subsets
    // together

    // From mvpatterns above:
    //
    // r1phonea     | byte    3961  135   r1phonea:w1 r Some Diff-Use telephone
    // r1effort_d   | byte    3992  104   r1effort_d:w1 r CESD everything was an effort
    // r1fhope_d    | byte    3998   98   r1fhope_d:w1 r CESD felt hopeful
    // r1inf_memry  | byte    4002   94   r1inf_memry:w1 Informant: r diagnosed with memory problems
    // r1enlife_d   | byte    4009   87   r1enlife_d:w1 r CESD enjoyed life
    // r1bother_d   | byte    4011   85   r1bother_d:w1 r CESD bothered by things
    // r1inf_strok  | byte    4015   81   r1inf_strok:w1 Informant: r diagnosed with stroke
    // r1inf_parkn  | byte    4016   80   r1inf_parkn:w1 Informant: r diagnosed with Parkinsons
    // r1moneya     | byte    4017   79   r1moneya:w1 r Some Diff-Managing money
    // r1fearl_d    | byte    4019   77   r1fearl_d:w1 r CESD afraid
    // r1inf_alzhe  | byte    4020   76   r1inf_alzhe:w1 Informant: r diagnosed with Alzheimers
    // r1whappy_d   | byte    4021   75   r1whappy_d:w1 r CESD was happy
    // r1flone_d    | byte    4022   74   r1flone_d:w1 r CESD lonely
    // r1depres_d   | byte    4024   72   r1depres_d:w1 r CESD felt depressed
    // r1fdying     | byte    4027   69   r1fdying:w1 r BAI fear of dying
    // r1faint      | byte    4031   65   r1faint:w1 r BAI felt faint
    // r1nerv       | byte    4032   64   r1nerv:w1 r BAI nervous
    // r1mindts_d   | byte    4032   64   r1mindts_d:w1 r CESD trouble concentrating
    // r1mealsa     | byte    4033   63   r1mealsa:w1 r Some Diff-Prepare hot meal
    // r1ftired_d   | byte    4035   61   r1ftired_d: w1 r CESD felt tired
    // r1worst      | byte    4037   59   r1worst:w1 r BAI worst happening
    // r1tremb      | byte    4038   58   r1tremb:w1 r BAI hands trembling
    // r1geta       | byte    4040   56   r1geta:w1 r Some Diff-Getting around
    // r1shopa      | byte    4042   54   r1shopa:w1 r Some Diff-Shop for grocery
    // r1housewka   | byte    4044   52   r1housewka:w1 r Some Diff-Doing hhold chores
    // r1medsa      | byte    4056   40   r1medsa:w1 r Some Diff-Take medications
    // r1batha      | byte    4064   32   r1batha:w1 r Some Diff-Bathing
    // r1eata       | byte    4065   31   r1eata:w1 r Some Diff-Eating
    // r1beda       | byte    4065   31   r1beda:w1 r Some Diff-Get in/out bed
    // r1toilta     | byte    4065   31   r1toilta:w1 r Some Diff-Using the toilet
    // r1dressa     | byte    4065   31   r1dressa:w1 r Some Diff-Dressing
    // r1walkra     | byte    4065   31   r1walkra:w1 r Some Diff-Walk across room

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
        /// r`w'inf_alzhe /// Gives problems, so defer until the end
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

    local yvars`w' `adl`w'' `bai`w'' `chronic`w'' `cesd`w'' `iadl`w''

    foreach y of varlist `chronic`w'' `adl`w'' `iadl`w'' {
        local mtype_`y' logit
    }
    foreach y of varlist `cesd`w'' `bai`w'' {
        local mtype_`y' ologit
    }
}

// ----------------------------------------------------------------------
// Define a template program for use in the imputation

capture program drop UpdateScales
program define UpdateScales
// Updating derived variables in between imputations.
// This program ignores most options and (re)computes the health scales
// for everyone in the sample.

syntax varlist [if] [in] [pw iw fw aw] [, initialize current(varname) ///
    prev(varname) toimp(varname) iter(integer -1) ]

marksample touse, novarlist strok

if ("`initialize'" != "") {
    local genopt generate
    if ("$INITSCALES" == "0") {
        local genopt
    }
}
else {
    local genopt
}

// wave number
local w = $CURRWAVE

// Compute health scales
dad_hlthscales if (`touse'), wave(`w') `genopt'
end
// ----

// ----------------------------------------------------------------------
// Chained imputation (1): self-interviews in core data

// Initialize the scales
global INITSCALES 1

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n
    global CURRWAVE = `w'

    // Imputation of r`w'inf_alzhe, so it's available for the scales
    imp_simplefrac r`w'inf_alzhe r`w'stateid if (inw`w' & !lasi_r`w'proxy) ///
        , rand(u_r`w'inf_alzhe)

    local ulist
    local mtypes
    foreach y of varlist `yvars`w'' {
        local ulist `ulist' u_`y'
        local mtypes `mtypes' `mtype_`y''
    }

    imp_chainplus `yvars`w'' if (inw`w' & !lasi_r`w'proxy), draws(`ulist') ///
        models(`mtypes') covariates(`xvars`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_hlthspec)

    foreach y of varlist `yvars`w'' {
        assert (!missing(`y')) if (inw`w' & !lasi_r`w'proxy)
    }
}

// ----------------------------------------------------------------------
// Impute missings (2): proxy interviews in core data

// Don't re-initialize the scales
global INITSCALES 0

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n
    global CURRWAVE = `w'

    // Imputation of r`w'inf_alzhe, so it's available for the scales
    imp_simplefrac r`w'inf_alzhe r`w'stateid if (inw`w') ///
        , rand(u_r`w'inf_alzhe)

    local ulist
    local mtypes
    foreach y of varlist `yvars`w'' {
        local ulist `ulist' u_`y'
        local mtypes `mtypes' `mtype_`y''
    }

    imp_chainplus `yvars`w'' if (inw`w'), draws(`ulist') ///
        models(`mtypes') covariates(`xvarsp`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_hlthspec)

    foreach y of varlist `yvars`w'' {
        assert (!missing(`y')) if (inw`w')
    }
}

// ----------------------------------------------------------------------

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    rename r`w'cesd r`w'cesd10
    rename r`w'bai  r`w'anx5

    mvpatterns_em `yvars`w'' r`w'adl r`w'iadl r`w'cesd10 r`w'anx5 r`w'chronic, identifiers(prim_key)
}

keep prim_key `yvars_all' `iflags' r*adl /* r*iadl */ r*cesd10 r*anx5 r*chronic
sort prim_key
compress
save "`outfile'", replace
describe _all, fullnames
summarize `yvars_all' r*adl /* r*iadl */ r*cesd10 r*anx5

// ----------------------------------------------------------------------
set linesize 80
log close
exit

// EOF
