capture log close

// ----------------------------------------------------------------------
// dad-cogimp03.do
//
// Cognition imputations for LASI-DAD wave 1, Part 3.
// This imputes the cognition variables and informant reports in the
// LASI-DAD data.
//
// Erik Meijer, USC
// This version: March 28, 2021
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
//            [Default: rseed-dad-cog.dta ]
// SEEDLOG  - Log file when generating random seed
//            [Default: rseed-dad-cog.log ]
// DEMOFILE - Imputed DAD demographics to be used as covariates
//            [Default: dad-demo.dta ]
// HLTHFILE - Imputed DAD health variables to be used as covariates
//            [Default: dad-health.dta ]
// OUTFILE  - Output data file
//            [Default: dad-cognition.dta ]
// OUTFILE2 - Output data file
//            [Default: dad-cognition-finalized.dta ]
//
// Programs used:
//
// genrseed        - Generating or reading a random seed
// mvpatterns_em   - Missing value patterns
// mflag           - Create missingness flags
// rdraws          - Read or generate pseudo-random draws
// imp_simplefrac  - Imputation based on simple fractions within another categorical variable
// imp_chainplus   - Chained imputation
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
set matsize 11000
set varabbrev off
set linesize 254
capture program drop _all

// ----------------------------------------------------------------------
log using "dad_cogimp03.log", text replace

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
    local seedfile `"rseed-dad-cog.dta"'
}

// Log file to use when generating a random seed.
if (`"${SEEDLOG}"' != `""') {
    local seedlog `"${SEEDLOG}"'
}
else {
    // Default, in the current directory
    local seedlog `"rseed-dad-cog.log"'
}

// Demographics
if (`"${DEMOFILE}"' != `""') {
    local demofile `"${DEMOFILE}"'
}
else {
    // Default, in the current directory
    local demofile "dad-demo.dta"
}

// Health
if (`"${HLTHFILE}"' != `""') {
    local hlthfile `"${HLTHFILE}"'
}
else {
    // Default, in the current directory
    local hlthfile "dad-health.dta"
}

// Output file with imputed cognition variables
if (`"${OUTFILE}"' != `""') {
    local outfile `"${OUTFILE}"'
}
else {
    // Default, in the current directory
    local outfile "dad-cognition.dta"
}

// Output file with imputed cognition variables without auxiliary variables
if (`"${OUTFILE2}"' != `""') {
    local outfile2 `"${OUTFILE2}"'
}
else {
    // Default, in the current directory
    local outfile2 "dad-cognition-finalized.dta"
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

local dad_health ///
    r*chronic    ///
    r*adl        ///
    /// r*iadl   /// Already part of r*adl
    r*cesd10     ///
    r*anx5

// Cognitive tests
local dad_cog_all
foreach w of numlist `wavelist' {
    local orient5t_`w' r`w'mo r`w'yr r`w'dw r`w'date r`w'season
    local orient5p_`w' r`w'state r`w'city r`w'name r`w'address r`w'floor
    local recall3_`w'  r`w'trial1 r`w'trial2 r`w'trial3 r`w'dlrc3
    local serial7_`w'  r`w'ser7
    local backward_`w' r`w'backward6
    local object_`w'   r`w'object1 r`w'object2
    local repeat_`w'   r`w'repeat
    local follow_`w'   r`w'copyfol r`w'readfol
    local exec_`w'     r`w'execu
    local senten_`w'   r`w'say r`w'write
    local draw_`w'     r`w'draw2
    local recall10_`w' r`w'word1 r`w'word_d r`w'word2 r`w'word3
    local recog_`w'    r`w'wre_org r`w'wre_foil
    // Brave man story
    local braveman_`w'    // Immediate; 0=no, 1=gist, 2=exact
    local bravemanr_`w'   // Recall;    0=no, 1=gist, 2=exact
    forvalues j=1/10 {
        local braveman_`w'  `braveman_`w''  r`w'bm_s`j'
        local bravemanr_`w' `bravemanr_`w'' r`w'bm_rs`j'
    }
    // Robbery story
    local robbery_`w'
    local robberyr_`w'
    forvalues j=1/25 {
        local robbery_`w'  `robbery_`w''  r`w'lmb_s`j'
        local robberyr_`w' `robberyr_`w'' r`w'lmb_rs`j'
    }
    local recallpr_`w' r`w'log_rcmix r`w'log_wron
    local lmrecog_`w' r`w'log_reco
    local logmem_`w' `braveman_`w'' `bravemanr_`w'' `robbery_`w'' ///
        `robberyr_`w'' `recallpr_`w'' `lmrecog_`w''
    local tics_`w' r`w'scis r`w'coconut r`w'prime
    local digitspan_`w' r`w'ds_for r`w'ds_back
    local verbal_`w' r`w'verbal r`w'verbal_inc
    local symcan_`w' r`w'sc_anw r`w'sc_wr
    local conprax_`w' r`w'cp_circle r`w'cp_rectan r`w'cp_cube r`w'cp_diamon ///
        r`w'cpr_circle r`w'cpr_rectan r`w'cpr_cube r`w'cpr_diamon
    local clock_`w' r`w'dr_clock3
    // local bwc_`w' r`w'bc_score r`w'bc_inc
    local csid_`w' r`w'elbow r`w'hammer r`w'store r`w'point
    local raven_`w' r`w'rv_score // r`w'ek_score
    local gonogo_`w' r`w'go_score1 r`w'go_score2
    local handseq_`w' r`w'ef_palm r`w'ef_clench r`w'ef_fist
    local token_`w' r`w'tt_crcl r`w'tt_sqr r`w'tt_dmnd r`w'tt_blckcrl ///
        r`w'tt_blsqr r`w'tt_yldmnd r`w'tt_ylsqr
    local judg_`w' r`w'jp_animl r`w'jp_flwr r`w'jp_lie r`w'jp_river ///
        r`w'jp_rupee1 r`w'jp_rupee2 r`w'jp_fndkid

    local cog`w'              ///
        `orient5t_`w''        ///
        `orient5p_`w''        ///
        `recall3_`w''         ///
        `serial7_`w''         ///
        `backward_`w''        ///
        `object_`w''          ///
        `repeat_`w''          ///
        `follow_`w''          ///
        `exec_`w''            ///
        `senten_`w''          ///
        `draw_`w''            ///
        `recall10_`w''        ///
        `recog_`w''           ///
        `logmem_`w''          ///
        `tics_`w''            ///
        `digitspan_`w''       ///
        `verbal_`w''          ///
        `symcan_`w''          ///
        `conprax_`w''         ///
        `clock_`w''           ///
        /// `bwc_`w''         ///
        `csid_`w''            ///
        `raven_`w''           ///
        `gonogo_`w''          ///
        `handseq_`w''         ///
        `token_`w''           ///
        `judg_`w''

    local dad_cog_all `dad_cog_all' `cog`w''
}

// Informant reports
local dad_inform_all
foreach w of numlist `wavelist' {
    local jorm_`w'
    forvalues j=1/16 {
        local jorm_`w' `jorm_`w'' r`w'iqscore`j'
    }
    local bl2_`w' r`w'bl2_2r r`w'bl2_3r r`w'bl2_4r

    // Old        New
    // r1act1  -> r1act_tv    iact   r1act_tv:w1 Activities- watching TV
    // r1act2  -> r1act_read  iact   r1act_read:w1 Activities- reading
    // r1act5  -> r1act_chor  iact   r1act_chor:w1 Activities- chores, maintenance, or gardening
    // r1act7  -> r1act_comp  iact   r1act_comp:w1 Activities- computer or the internet
    // r1act8  -> r1act_nap   iact   r1act_nap:w1 Activities- taking naps
    // r1act10 -> r1act_meal  yeszno r1act_meal:w1 Activities- preparing hot meals
    // r1act13 -> r1act_trav  yeszno r1act_trav:w1 Activities- traveling
    // r1act14 -> r1act_pubt  yeszno r1act_pubt:w1 Activities- public transit
    // r1act15 -> r1act_work  idaily r1act_work:w1 Activities- work or volunteer
    // r1act16 -> r1act_stor  idaily r1act_stor:w1 Activities- store or market for food
    // r1act22 -> r1act_walk  idaily r1act_walk:w1 Activities- walks
    // r1act24 -> r1act_spor  idaily r1act_spor:w1 Activities- yoga or any other exercise
    // r1act38 -> r1act_dail  iactiv r1act_dail:w1 Activities- daily activities

    // local act_`w' r`w'act1 r`w'act2 r`w'act5 r`w'act7 r`w'act8 r`w'act10 ///
    //     r`w'act13 r`w'act14 r`w'act15 r`w'act16 r`w'act22 r`w'act24 r`w'act38

    local act_`w'     ///
        r`w'act_tv    ///
        r`w'act_read  ///
        r`w'act_chor  ///
        r`w'act_comp  ///
        r`w'act_nap   ///
        r`w'act_meal  ///
        r`w'act_trav  ///
        r`w'act_pubt  ///
        r`w'act_work  ///
        r`w'act_stor  ///
        r`w'act_walk  ///
        r`w'act_spor  ///
        r`w'act_dail

    local feel_`w' r`w'feel27 r`w'feel29 r`w'feel30 r`w'feel31 r`w'feel36 r`w'feel37
    local csi_`w'
    forvalues j=1/15 {
        local csi_`w' `csi_`w'' r`w'csi`j'
    }
    local ten_`w' r`w'ten1 r`w'ten2 r`w'ten3 r`w'ten4 r`w'ten5
    local bl1_`w'   // No loss, some loss, severe loss
    local bl1a_`w'  // Physical, mental, both
    forvalues j=1/8 {
        local bl1_`w'  `bl1_`w''  r`w'bl1_`j'
        local bl1a_`w' `bl1a_`w'' r`w'bl1_`j'a
    }

    local inform`w' `jorm_`w'' `bl2_`w'' `act_`w'' `feel_`w'' ///
        `csi_`w'' `ten_`w'' `bl1_`w'' `bl1a_`w''

    local dad_inform_all `dad_inform_all' `inform`w''

    local yvars`w' `cog`w'' `inform`w''
}

// ---------------------------------------------------------------------
// Load DAD data

use `dad_id' `dad_cog_all' `dad_inform_all' using "${HDAD}", clear

describe _all, fullnames
summarize _all

merge 1:1 prim_key using "`demofile'"
assert (_merge == 3)
drop _merge

merge 1:1 prim_key using "`hlthfile'"
assert (_merge == 3)
drop _merge

merge 1:1 prim_key using "`tempcore'"
// drop if (_merge != 3) // May need to keep _merge == 1 later
drop if (_merge == 2) // May need to keep _merge == 1 later
drop _merge

sort prim_key

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    // If no inw`w' variable, create it.
    capture confirm variable inw`w'
    if (_rc != 0) {
        quietly generate byte inw`w' = (!missing(r`w'iwy_d))
        label variable inw`w' "inw`w':w`w' Participating in DAD"
    }

    tab1 r`w'inf*, missing
    // Informant present?
    generate byte r`w'inf_inw = (r`w'inf_rel != .h)
    label variable r`w'inf_inw "Informant iw in wave `w'"

    // Proxy in core data?
    tabulate lasi_r`w'proxy if (inw`w'), missing

    // No distinction anymore between phase 1a and 1b
    generate byte r`w'phase1a = (r`w'phase == 1 ///
        & (r`w'iwy_d == 2017 | (r`w'iwy_d == 2018 & r`w'iwm_d <= 7))) ///
        if (inw`w')

    tabulate r`w'phase r`w'phase1a, missing
    drop r`w'phase1a

    display as text _n "Informant variables wave `w' (informant absent):"
    tab1miss `inform`w'' if (r`w'inf_inw != 1 & inw`w' == 1)

    display as text _n _n "---------------" _n "Phase 1" _n "---------------"

    display as text _n "Cognition variables wave `w':"
    tab1miss `cog`w''    if (r`w'phase == 1 & inw`w' == 1)
    display as text _n "Informant variables wave `w' (informant present):"
    tab1miss `inform`w'' if (r`w'phase == 1 & r`w'inf_inw == 1)

    display as text _n _n "---------------" _n "Phase 2 & 3" _n "---------------"
    display as text _n "Cognition variables wave `w':"
    tab1miss `cog`w''    if (r`w'phase != 1 & inw`w' == 1)
    display as text _n "Informant variables wave `w' (informant present):"
    tab1miss `inform`w'' if (r`w'phase != 1 & r`w'inf_inw == 1)
}

// ---------------------------------------------------------------------
// Imputation flags and random draws

local cog_imp
local iflags
foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    mflag `yvars`w'' if (inw`w'), stub("f_")
    local iflags`w' `r(flags)'
    local iflags `iflags' `iflags`w''

    // Comment this out: recoding of .d -> 0 for most variables below
    // and we don't use mi impute anymore, so special missings are fine
    // foreach e of varlist `yvars`w'' {
    //     quietly replace `e' = . if (inw`w' & missing(`e'))
    // }

    local cog_imp `cog_imp' `yvars`w''
}

if (`redraw') {
    local redrawopt redraw
}
else {
    local redrawopt
}

rdraws `cog_imp', identifier(prim_key) drawfile(`"`drawfile'"') ///
    stub("u_") `redrawopt'

// ---------------------------------------------------------------------
// Variables that are both in the core and in DAD

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    // mvpatterns `yvars`w'' if (inw`w'), sort nodrop minfreq(99999)

    foreach y of varlist `yvars`w'' {
        capture confirm variable lasi_`y'
        if (_rc == 0) {
            tabulate `y' lasi_`y' if (inw`w'), missing
        }
    }
}

// ---------------------------------------------------------------------
// Lists of covariates

// Leave out any covariates that have also been measured in DAD, e.g.,
// ADLs

local xbasedemo lasi_rameduc_l lasi_rafeduc_l  // M&F edu linear
foreach w of numlist `wavelist' {
    local xwavedemo`w' lasi_h`w'cpl
    local xecon`w' i.lasi_hh`w'quint_inc i.lasi_hh`w'quint_wlth
    local chronic`w' lasi_r`w'hibpe lasi_r`w'hearte lasi_r`w'diabe
    local xhlth`w' i.lasi_r`w'shlt ///
        i.lasi_r`w'dsighta i.lasi_r`w'nsighta lasi_r`w'hearcnde ///
        lasi_r`w'chronic lasi_r`w'fl

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
    local xdadhlth`w' r`w'chronic r`w'adl r`w'iadl r`w'cesd10 r`w'anx5

    local xvars`w'  `xvars`w''  `xdadbasedemo' `xdadwavedemo`w'' `xdadhlth`w''
    local xvarsp`w' `xvarsp`w'' `xdadbasedemo' `xdadwavedemo`w'' `xdadhlth`w''
    local xvarsc`w' `xvarsc`w'' `xdadbasedemo' `xdadwavedemo`w'' `xdadhlth`w''

    display as text "Non-proxy interviews"
    summarize `yvars`w'' `xvars`w''  if (inw`w' & lasi_r`w'proxy != 1)

    display as text "Proxy interviews"
    summarize `yvars`w'' `xvarsp`w'' if (inw`w' & lasi_r`w'proxy == 1)

    display as text "Both"
    summarize `yvars`w'' `xvarsp`w'' if (inw`w')
}

// ---------------------------------------------------------------------
// Set up things for the imputations: recode .d to 0 and other coding,
// define samples  

foreach w of numlist `wavelist' {

    display as text _n "------------------------------------------------------------------"
    display as text    "                         WAVE `w'"
    display as text    "------------------------------------------------------------------" _n

    local yvars`w'

    // Preliminary: illiterate
    tabulate r`w'readfol r`w'write, missing
    quietly {
        generate byte r`w'illiterate = 1 if (inw`w' & r`w'readfol == .l)
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & !missing(r`w'readfol))
        replace r`w'illiterate = 1 if (inw`w' & missing(r`w'illiterate) & r`w'write == .l)
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & !missing(r`w'write))
        replace r`w'illiterate = 1 if (inw`w' & missing(r`w'illiterate) & !missing(r`w'copyfol))
        replace r`w'illiterate = 1 if (inw`w' & missing(r`w'illiterate) & !missing(r`w'say))
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & r`w'copyfol == .s)
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & r`w'say == .s)
        replace r`w'illiterate = 1 if (inw`w' & missing(r`w'illiterate) & inlist(r`w'copyfol,.d,.r))
        replace r`w'illiterate = 1 if (inw`w' & missing(r`w'illiterate) & inlist(r`w'say,.d,.r))
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & inlist(r`w'readfol,.d,.r))
        replace r`w'illiterate = 0 if (inw`w' & missing(r`w'illiterate) & inlist(r`w'write,.d,.r))
        // 6 missing cases remaining; simply copy these from LASI core
        noisily tabulate r`w'illiterate lasi_r`w'illiterate if (inw`w'), missing
        replace r`w'illiterate = lasi_r`w'illiterate if (inw`w' & missing(r`w'illiterate))
    }
    label variable r`w'illiterate "w`w' R is illiterate"
    tab2 r`w'illiterate r`w'readfol r`w'write r`w'copyfol r`w'say if (inw`w'), missing first

    assert (!missing(r`w'illiterate)) if (inw`w')
    assert (missing(r`w'readfol) & missing(r`w'write)) if (inw`w' & r`w'illiterate == 1)
    assert (missing(r`w'copyfol) & missing(r`w'say))   if (inw`w' & r`w'illiterate != 1)
    assert (r`w'illiterate == 0) if (inw`w' & (!missing(r`w'readfol) | !missing(r`w'write)))
    assert (r`w'illiterate == 1) if (inw`w' & (!missing(r`w'copyfol) | !missing(r`w'say)))

    display as text _n "---------------------------------------------"
    display as text    "        Section B: Cognition"
    display as text    "---------------------------------------------" _n

    display as text _n "------------------------"
    display as text    "Date/time orientation"
    display as text    "------------------------" _n

    mvpatterns_em `orient5t_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d .n)
    local yvars`w' `yvars`w'' `orient5t_`w''
    foreach y of varlist `orient5t_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Location orientation"
    display as text    "------------------------" _n

    mvpatterns_em `orient5p_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d .n)
    local yvars`w' `yvars`w'' `orient5p_`w''
    foreach y of varlist `orient5p_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "3-Word recall"
    display as text    "------------------------" _n

    // There are three trials, which are identical:
    // iwer reads (the same) three words; R is asked to recall them. It's
    // unclear whether this is immediately or after a few minutes, but it
    // looks like the whole procedure is repeated 3 times under identical
    // protocol. However, respondents who had all 3 correct in Trial 1 skip
    // Trials 2 & 3 and respondents who had all 3 correct in Trial 2 skip
    // Trial 3.

    tab2 `recall3_`w'' if (inw`w'), missing
    assert (r`w'trial2 == .s & r`w'trial3 == .s) if (inw`w' & r`w'trial1 == 3)
    assert (r`w'trial3 == .s) if (inw`w' & r`w'trial2 == 3)
    assert (r`w'trial2 != .s) if (inw`w' & r`w'trial1 != 3)
    assert (r`w'trial3 != .s) if (inw`w' & (r`w'trial2 != 3 & r`w'trial2 != .s))

    mvpatterns_em `recall3_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `recall3_`w''
    foreach y of varlist `recall3_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Serial 7s"
    display as text    "------------------------" _n

    mvpatterns_em `serial7_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `serial7_`w''
    foreach y of varlist `serial7_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Backward day naming"
    display as text    "------------------------" _n

    mvpatterns_em `backward_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `backward_`w''
    foreach y of varlist `backward_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Object naming"
    display as text    "------------------------" _n

    mvpatterns_em `object_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `object_`w''
    foreach y of varlist `object_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Repeat a phrase"
    display as text    "------------------------" _n

    mvpatterns_em `repeat_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `repeat_`w''
    foreach y of varlist `repeat_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Follow a command"
    display as text    "------------------------" _n

    // R's who are illiterate get the "copyfol" question, others get "readfol"

    assert (missing(r`w'readfol)) if (inw`w' & r`w'illiterate == 1)
    assert (missing(r`w'copyfol)) if (inw`w' & r`w'illiterate != 1)

    mvpatterns_em `follow_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `follow_`w''
    foreach y of varlist `follow_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Executive functioning"
    display as text    "------------------------" _n

    mvpatterns_em `exec_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `exec_`w''
    foreach y of varlist `exec_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Writing or saying sentence"
    display as text    "------------------------" _n

    assert (missing(r`w'write)) if (inw`w' & r`w'illiterate == 1)
    assert (missing(r`w'say))   if (inw`w' & r`w'illiterate != 1)

    mvpatterns_em `senten_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `senten_`w''
    foreach y of varlist `senten_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Drawing pentagon"
    display as text    "------------------------" _n

    mvpatterns_em `draw_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `draw_`w''
    foreach y of varlist `draw_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "10-Word recall"
    display as text    "------------------------" _n

    tab2 `recall10_`w'' if (inw`w'), missing
    mvpatterns_em `recall10_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `recall10_`w''
    foreach y of varlist `recall10_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Word list recognition"
    display as text    "------------------------" _n

    tab2 r`w'wre_org `recall10_`w'' if (inw`w'), missing first
    mvpatterns_em r`w'wre_org if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `recog_`w''
    foreach y of varlist `recog_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Logical memory"
    display as text    "------------------------" _n

    mvpatterns_em `logmem_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `logmem_`w''
    foreach y of varlist `braveman_`w'' `bravemanr_`w'' `robbery_`w'' ///
        `robberyr_`w'' `lmrecog_`w'' {
        local mtype_`y' ologit
    }
    foreach y of varlist `recallpr_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "TICS"
    display as text    "------------------------" _n

    mvpatterns_em `tics_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `tics_`w''
    foreach y of varlist `tics_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Digit span"
    display as text    "------------------------" _n

    mvpatterns_em `digitspan_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `digitspan_`w''
    foreach y of varlist `digitspan_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Verbal fluency"
    display as text    "------------------------" _n

    tabulate r`w'verbal if (inw`w'), missing
    mvpatterns_em r`w'verbal if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `verbal_`w''
    foreach y of varlist `verbal_`w'' {
        local mtype_`y' nbreg
    }

    display as text _n "------------------------"
    display as text    "Symbol cancelation"
    display as text    "------------------------" _n

    mvpatterns_em r`w'sc_anw if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `symcan_`w''
    foreach y of varlist `symcan_`w'' {
        local mtype_`y' nbreg
    }

    display as text _n "------------------------"
    display as text    "Constructional praxis"
    display as text    "------------------------" _n

    mvpatterns_em `conprax_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `conprax_`w''
    foreach y of varlist `conprax_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Clock drawing"
    display as text    "------------------------" _n

    mvpatterns_em `clock_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `clock_`w''
    foreach y of varlist `clock_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "CSID"
    display as text    "------------------------" _n

    mvpatterns_em `csid_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `csid_`w''
    foreach y of varlist `csid_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Raven's test"
    display as text    "------------------------" _n

    mvpatterns_em `raven_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `raven_`w''
    foreach y of varlist `raven_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Go-no-go score"
    display as text    "------------------------" _n

    mvpatterns_em `gonogo_`w'' if (inw`w'), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `gonogo_`w''
    foreach y of varlist `gonogo_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Hand sequencing test"
    display as text    "------------------------" _n

    // Should be all missing (.x) in phase 1
    forvalues p=1/3 {
        display as text _n "p = `p'"
        tab1m `handseq_`w'' if (inw`w' & r`w'phase == `p'), missing
    }

    mvpatterns_em `handseq_`w'' if (inw`w' & r`w'phase != 1), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `handseq_`w''
    foreach y of varlist `handseq_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Token test"
    display as text    "------------------------" _n

    // Should be all missing (.x) in phase 1
    forvalues p=1/3 {
        display as text _n "p = `p'"
        tab1m `token_`w'' if (inw`w' & r`w'phase == `p'), missing
    }

    mvpatterns_em `token_`w'' if (inw`w' & r`w'phase != 1), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `token_`w''
    foreach y of varlist `token_`w'' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Judgment and Problem Solving"
    display as text    "------------------------" _n

    // Should be all missing (.x) in phase 1
    forvalues p=1/3 {
        display as text _n "p = `p'"
        tab1m `judg_`w'' if (inw`w' & r`w'phase == `p'), missing
    }

    mvpatterns_em `judg_`w'' if (inw`w' & r`w'phase != 1), identifiers(prim_key) incorrect(.d)
    local yvars`w' `yvars`w'' `judg_`w''
    foreach y of varlist `judg_`w'' {
        local mtype_`y' logit
    }

    display as text _n "---------------------------------------------"
    display as text    "        Section C: Informant report"
    display as text    "---------------------------------------------" _n

    display as text _n "------------------------"
    display as text    "JORM IQCODE test"
    display as text    "------------------------" _n

    mvpatterns_em `jorm_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `jorm_`w''
    foreach y of varlist `jorm_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Blessed Test---Part 2"
    display as text    "------------------------" _n

    mvpatterns_em `bl2_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `bl2_`w''
    foreach y of varlist `bl2_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Everyday Activities"
    display as text    "------------------------" _n

    mvpatterns_em `act_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `act_`w''

    local act_`w'b r`w'act_meal r`w'act_trav r`w'act_pubt   // binary
    local act_`w'o : list act_`w' - act_`w'b                // ordered
    foreach y of varlist `act_`w'o' {
        local mtype_`y' ologit
    }
    foreach y of varlist `act_`w'b' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Everyday Feelings"
    display as text    "------------------------" _n

    mvpatterns_em `feel_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `feel_`w''
    foreach y of varlist `feel_`w'' {
        local mtype_`y' ologit
    }

    display as text _n "------------------------"
    display as text    "Cognitive activity score (CSI)"
    display as text    "------------------------" _n

    mvpatterns_em `csi_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `csi_`w''

    // The first two have a 0-1 binary coding. The remaining have
    // 0=no, 1=yes, 2=sometimes, which is not ordered correctly for
    // an ologit model, so we recode these first and then recode
    // back at the end.

    local csi_`w'b r`w'csi1 r`w'csi2          // binary
    local csi_`w'o : list csi_`w' - csi_`w'b  // ordered
    foreach y of varlist `csi_`w'o' {
        recode `y' (2=1) (1=2)
        local mtype_`y' ologit
    }
    foreach y of varlist `csi_`w'b' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "10/66"
    display as text    "------------------------" _n

    mvpatterns_em `ten_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `ten_`w''

    // Most of these have coding 0-1-2 (ordered, but 2 needs to be
    // between 0 and 1) but some just 0-1 (binary)
    local ten_`w'b r`w'ten2 r`w'ten5          // binary
    local ten_`w'o : list ten_`w' - ten_`w'b  // ordered
    foreach y of varlist `ten_`w'o' {
        recode `y' (2=1) (1=2)
        local mtype_`y' ologit
    }
    foreach y of varlist `ten_`w'b' {
        local mtype_`y' logit
    }

    display as text _n "------------------------"
    display as text    "Blessed Test---Part 1"
    display as text    "------------------------" _n

    // In phase 1, Blessed Pt 1 only asked if Jorm < 3
    // where Jorm = average of j1score-j16score; include only items where
    // value of jscore equals 1-5.

    tab1m `jorm_`w'' if (inw`w'), missing
    quietly {
        egen double r`w'iqcode_raw = rowmean(`jorm_`w'') if (inw`w')
        label variable r`w'iqcode_raw "Mean of nonmissing unimputed Jorm IQCODE items"
        generate byte r`w'iqlt3 = (r`w'iqcode_raw < 3) if (inw`w' & !missing(r`w'iqcode_raw))
        label variable r`w'iqlt3 "Raw Jorm IQCODE < 3"

        // Basic criterion in Phase 1
        generate byte r`w'skipcrit = (r`w'iqlt3 == 0) if (inw`w' & !missing(r`w'iqlt3))
        // All Jorm IQCODE questions missing
        replace r`w'skipcrit = 1 if (inw`w' & missing(r`w'iqlt3) & r`w'inf_inw)
        // No informant -> .h instead of .s
        replace r`w'skipcrit = 0 if (inw`w' & missing(r`w'iqlt3) & !r`w'inf_inw)
        label variable r`w'skipcrit "Blessed Pt 1 Skip criterion"

        generate byte r`w'skipbl1 = (r`w'skipcrit & r`w'phase == 1) if (inw`w')
        label variable r`w'skipbl1 "Skip Blessed Pt 1"
    }

    // 'A' questions are contingent on main counterparts.

    local bl1bl1a_`w'
    forvalues j=1/8 {
        display as text _n "j = `j'" _n
        // Order it with 1a in between 1 to keep corresponding items
        // synchronized during the imputations
        local bl1bl1a_`w' `bl1bl1a_`w'' r`w'bl1_`j' r`w'bl1_`j'a

        // Still inconsistencies
        generate byte r`w'inconsist`j' = ((r`w'bl1_`j' == .s & !r`w'skipbl1) ///
            | (r`w'bl1_`j' != .s & r`w'skipbl1)) if (inw`w')

        list prim_key inw`w' r`w'phase r`w'iwy_d r`w'iwm_d ///
            r`w'iqcode_raw r`w'skipbl1 r`w'bl1_`j' if (inw`w' & r`w'inconsist`j') ///
            , clean noobs nolabel

        //        prim_key   inw1   r1phase   r1iwy_d   r1iwm_d   r1iqcod~w   r1skip~1   r1bl1_1  
        // 109058002660101      1         1      2018         5           3          1         2  
        // 109058100300101      1         1      2018         5      3.0625          1         2  
        // 109058700180101      1         1      2018         6   4.1333333          1         3  
        // 132209703700102      1         1      2018         2           .          1         3  
        // 132214400960101      1         1      2017        12           .          1         1  
        // 133220901440102      1         1      2018         3      2.9375          0        .s  

        tabulate r`w'bl1_`j' r`w'skipbl1  if (inw`w'), missing
        tabulate r`w'bl1_`j' r`w'skipcrit if (inw`w'), missing
        tabulate r`w'bl1_`j' r`w'phase    if (inw`w'), missing
        tabulate r`w'bl1_`j' r`w'inf_inw  if (inw`w'), missing
        tabulate r`w'bl1_`j' r`w'iqlt3    if (inw`w' & r`w'phase == 1), missing
        tabulate r`w'bl1_`j' r`w'bl1_`j'a if (inw`w'), missing

        assert (r`w'bl1_`j'  == .s) if (inw`w' & r`w'bl1_1 == .s)
        assert (r`w'bl1_`j'  != .s) if (inw`w' & r`w'bl1_1 != .s)
        assert (r`w'bl1_`j'a == .h) if (inw`w' & r`w'bl1_`j' == .h)
        assert (r`w'bl1_`j'a != .h) if (inw`w' & r`w'bl1_`j' != .h)
        assert (r`w'bl1_`j'a == .m) if (inw`w' & r`w'bl1_`j' == .m)
        assert (r`w'bl1_`j'a != .m) if (inw`w' & r`w'bl1_`j' != .m)
        assert (r`w'bl1_`j'a == .s) if (inw`w' & r`w'bl1_`j' == 1)
        assert (r`w'bl1_`j'a == .s) if (inw`w' & r`w'bl1_`j' == .s)
        assert (r`w'bl1_`j'a == .s) if (inw`w' & missing(r`w'bl1_`j') ///
            & !inlist(r`w'bl1_`j',.h,.m,.s))
        assert (r`w'bl1_`j'a != .s) if (inw`w' & !missing(r`w'bl1_`j') ///
            & r`w'bl1_`j' != 1)

        replace r`w'skipbl1 = (r`w'bl1_1 == .s) if (inw`w')
    }

    mvpatterns_em `bl1bl1a_`w'' if (inw`w'), identifiers(prim_key)
    local yvars`w' `yvars`w'' `bl1bl1a_`w''
    foreach y of varlist `bl1_`w'' {
        local mtype_`y' ologit
    }
    foreach y of varlist `bl1a_`w'' {
        local mtype_`y' mlogit
    }

    display as text _n "------------------------"
    display as text    "Final tables"
    display as text    "------------------------" _n

    // Missingness flags
    forvalues p=1/3 {
        display as text _n "p = `p'"
        tab1m `iflags`w'' if (inw`w' & r`w'phase == `p'), missing
    }

    // Combined

    local yvars_all `yvars_all' `yvars`w''

    display as text "Non-proxy interviews"
    summarize `yvars`w'' `xvars`w''  if (inw`w' & lasi_r`w'proxy != 1)

    display as text "Proxy interviews"
    summarize `yvars`w'' `xvarsp`w'' if (inw`w' & lasi_r`w'proxy == 1)

    display as text "Both"
    summarize `yvars`w'' `xvarsp`w'' if (inw`w')


    capture noisily mvpatterns `yvars`w'' if (inw`w'), sort nodrop minfreq(99999)

    // Reorder subscales roughly according to number of missings, with
    // tests before informant (without reordering within or across scales)
    local yvars`w' `tics_`w'' `recall3_`w'' `object_`w'' `exec_`w''               ///
        `recall10_`w'' `csid_`w'' `verbal_`w'' `repeat_`w'' `gonogo_`w''          ///
        `digitspan_`w'' `backward_`w'' `recog_`w'' `braveman_`w'' `bravemanr_`w'' ///
        `orient5p_`w'' `orient5t_`w'' `symcan_`w'' `raven_`w''                    ///
        `robbery_`w'' `robberyr_`w'' `draw_`w'' `lmrecog_`w'' `recallpr_`w''      ///
        `clock_`w'' `conprax_`w'' `serial7_`w'' `follow_`w'' `senten_`w''         ///
        `judg_`w'' `handseq_`w'' `token_`w''                                      ///
        `bl2_`w'' `act_`w'' `csi_`w'' `ten_`w'' `feel_`w'' `jorm_`w''             ///
        `bl1bl1a_`w''
}

// ----------------------------------------------------------------------
// Define a template program for use in the imputation

capture program drop UpdateScales
program define UpdateScales
// Updating derived variables in between imputations.
// This program ignores most options and (re)computes the cognition scales
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

// Compute cognitive scales
dad_cogscales if (`touse'), wave(`w') `genopt'
end
// ----

// ----------------------------------------------------------------------
// Chained imputation (1): self-interviews in core data

// Set to 1 for additional tests and output; see earlier output
global TESTSCALES 0
global TESTSPEC   0

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n
    global CURRWAVE = `w'

    // Initialize the scales
    global INITSCALES 1

    if ($TESTSCALES) {
        UpdateScales `yvars`w'' if (inw`w'), initialize iter(0)
        global INITSCALES 0
    }

    if ($TESTSPEC) {
        global TESTSCALES 0

        quietly UpdateScales `yvars`w'' if (inw`w'), initialize iter(0)
        global INITSCALES 0

        local ny : word count `yvars`w''
        display as text _n "Number of y variables: `ny'"

        local testvars r`w'wre_foil r`w'yr r`w'mo r`w'date r`w'word1 ///
            r`w'wre_org r`w'trial1 r`w'trial2 r`w'trial3 r`w'verbal  ///
            r`w'ef_palm r`w'write r`w'say r`w'iqscore1 r`w'feel36    ///
            r`w'act_tv r`w'bl1_5 r`w'bl1_5a
        local y1 : word 1 of `testvars'
        foreach y of varlist `testvars' {
            quietly dad_cogspec `y' if (inw`w' & !lasi_r`w'proxy) ///
                , samp(samp`w') iter(1) covariates(`xvars`w'') ///
                drop1(i.r`w'lang_d i.raeduc_l)
            local x `r(covariates)'
            local nx : word count `x'
            if ("`y'" == "`y1'") {
                // First one: reference case
                local x1 `x'
                display as text _n "`nx' covariates for `y':"
                foreach v of local x {
                    display as text "   `v'"
                }
            }
            else {
                // Only list differences from reference case
                local xadd  : list x - x1
                local xdrop : list x1 - x
                display as text _n "`nx' covariates for `y'."
                display as text "Added to list for `y1':"
                foreach v of local xadd {
                    display as text "   `v'"
                }
                display as text "Dropped from list for `y1':"
                foreach v of local xdrop {
                    display as text "   `v'"
                }
            }
            display as text _n "Sample:"
            tabulate samp`w' inw`w', missing
            drop samp`w'
        }
        foreach y of varlist `testvars' {
            // Now for the initialization phase
            quietly dad_cogspec `y' if (inw`w' & !lasi_r`w'proxy) ///
                , samp(samp`w') iter(0) covariates(`xvars`w'') ///
                drop1(i.r`w'lang_d i.raeduc_l)
            local x `r(covariates)'
            local nx : word count `x'
            if ("`y'" == "`y1'") {
                // First one: reference case
                local x1 `x'
                display as text _n "`nx' covariates for `y':"
                foreach v of local x {
                    display as text "   `v'"
                }
            }
            else {
                // Only list differences from reference case
                local xadd  : list x - x1
                local xdrop : list x1 - x
                display as text _n "`nx' covariates for `y'."
                display as text "Added to list for `y1':"
                foreach v of local xadd {
                    display as text "   `v'"
                }
                display as text "Dropped from list for `y1':"
                foreach v of local xdrop {
                    display as text "   `v'"
                }
            }
            display as text _n "Sample:"
            tabulate samp`w' inw`w', missing
            drop samp`w'
        }
    }

    local ulist
    local mtypes
    foreach y of varlist `yvars`w'' {
        local ulist `ulist' u_`y'
        local mtypes `mtypes' `mtype_`y''
    }                                                         

    display as text _n "Non-proxy main imputations" _n

    imp_chainplus `yvars`w'' if (inw`w' & !lasi_r`w'proxy), draws(`ulist') ///
        models(`mtypes') covariates(`xvars`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_cogspec)

    global INITSCALES 0

    // Blessed Part 1 for those in phase 1 who weren't skipped

    local bl1samp "((r`w'phase == 1 & !r`w'skipbl1) | (r`w'phase != 1 & !r`w'skipcrit))"
    global BL1phase1 "1"

    local yvarsbl1 `bl1bl1a_`w''
    local ulistbl1
    local mtypesbl1
    foreach y of varlist `yvarsbl1' {
        local ulistbl1 `ulistbl1' u_`y'
        local mtypesbl1 `mtypesbl1' `mtype_`y''
    }

    display as text _n "Blessed Pt1 (phase 1)" _n

    imp_chainplus `yvarsbl1' if (inw`w' & !lasi_r`w'proxy ///
        & `bl1samp'), draws(`ulistbl1') ///
        models(`mtypesbl1') covariates(`xvars`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_cogspec)

    global BL1phase1

    // Commented out because not all skip patterns are imputed
    // foreach y of varlist `yvars`w'' {
    //     assert (!missing(`y')) if (inw`w' & !lasi_r`w'proxy)
    // }
}

// ----------------------------------------------------------------------
// Impute missings (2): proxy interviews in core data

// The only missings left are the proxy interviews. The number of those
// is too small to estimate imputation models on, so we simply let all
// others be part of the estimation sample. Hence, we simply omit the
// proxy variable from the if.

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    local ulist
    local mtypes
    foreach y of varlist `yvars`w'' {
        local ulist `ulist' u_`y'
        local mtypes `mtypes' `mtype_`y''
    }

    display as text _n "Proxy main imputations" _n

    imp_chainplus `yvars`w'' if (inw`w'), draws(`ulist') ///
        models(`mtypes') covariates(`xvarsp`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_cogspec)

    // Blessed Part 1 for those in phase 1 who weren't skipped

    local yvarsbl1 `bl1bl1a_`w''
    local ulistbl1
    local mtypesbl1
    foreach y of varlist `yvarsbl1' {
        local ulistbl1 `ulistbl1' u_`y'
        local mtypesbl1 `mtypesbl1' `mtype_`y''
    }

    local bl1samp "((r`w'phase == 1 & !r`w'skipbl1) | (r`w'phase != 1 & !r`w'skipcrit))"
    global BL1phase1 "1"

    display as text _n "Proxy Blessed Pt1 (phase 1)" _n

    imp_chainplus `yvarsbl1' if (inw`w' & `bl1samp'), draws(`ulistbl1') ///
        models(`mtypesbl1') covariates(`xvarsc`w'') maxiter(`maxiter') ///
        drop1(i.r`w'lang_d i.raeduc_l) ///
        updatederived(UpdateScales) specprog(dad_cogspec)

    global BL1phase1

    // Commented out because not all skip patterns are imputed
    // foreach y of varlist `yvars`w'' {
    //     assert (!missing(`y')) if (inw`w' & !lasi_r`w'proxy)
    // }
}

// ----------------------------------------------------------------------

foreach w of numlist `wavelist' {
    display as text _n _n "Wave `w'" _n

    quietly {

        // Restore original coding

        foreach y of varlist `csi_`w'o' {
            recode `y' (2=1) (1=2)
        }
        foreach y of varlist `ten_`w'o' {
            recode `y' (2=1) (1=2)
        }

        // "Impute" some missings (skip patterns) due to dependencies

        // Trial2 and trial3 skipped if prior trial was 3
        replace r`w'trial2 = .s if (inw`w' & r`w'trial1 == 3 & missing(f_r`w'trial2))
        replace r`w'trial3 = .s if (inw`w' & inlist(r`w'trial2,3,.s) & missing(f_r`w'trial3))

        // Some cases were not explicitly classified as literate or illiterate
        // a.o. because they skipped out of the interview before. Here, we
        // fill in our classification.
        replace r`w'copyfol = .s if (inw`w' & r`w'illiterate != 1 & missing(f_r`w'copyfol))
        replace r`w'say     = .s if (inw`w' & r`w'illiterate != 1 & missing(f_r`w'say))
        replace r`w'readfol = .l if (inw`w' & r`w'illiterate == 1 & missing(f_r`w'readfol))
        replace r`w'write   = .l if (inw`w' & r`w'illiterate == 1 & missing(f_r`w'write))

        // bl1a questions only asked if any loss in corresponding bl1 question
        forvalues j=1/8 {
            replace r`w'bl1_`j'a = .s if (inw`w' & r`w'bl1_`j' == 1 & missing(f_r`w'bl1_`j'a))
        }
    }

    capture noisily mvpatterns `yvars`w'' if (inw`w'), sort nodrop minfreq(99999)

    tab1miss `recall3_`w'' `follow_`w'' `senten_`w'' `handseq_`w'' ///
        `token_`w'' `judg_`w'' `bl1_`w'' `bl1a_`w'' if (inw`w')
}

// All imputation flag variables
foreach f of varlist f_* {
    // 1 = Not missing
    label define `f' 1 "1.Not missing", replace

    // Copy labels of special missings

    // Loop of all lowercase letters
    foreach c in `c(alpha)' {
        local labtxt : label (`f') .`c', strict
        if (`"`labtxt'"' != `""') {
            label define `f' .`c' `"`labtxt'"', add
        }
    }

    label values `f' `f'
}

keep prim_key `yvars_all' `iflags' r*illiterate r*skipcrit r*skipbl1
sort prim_key
compress
save "`outfile'", replace
describe _all, fullnames
summarize `yvars_all' r*illiterate r*skipcrit r*skipbl1

drop r*illiterate r*skipcrit r*skipbl1
save "`outfile2'", replace
describe _all, fullnames

set linesize 100
log close
exit

// EOF
