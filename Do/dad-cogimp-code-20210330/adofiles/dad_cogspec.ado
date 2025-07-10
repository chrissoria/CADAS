*! version 0.3.0  27mar2021  [EM]

program define dad_cogspec, rclass

// Model specification for a specific cognition variable in the LASI-DAD data.

syntax varname [if] [in] [pw iw fw aw] ///
    [ , DRAWs(varlist numeric) MODEL(string) ///
    TOIMPute(varname numeric) COVARiates(varlist numeric fv ts) ///
    YCOVars(varlist numeric fv ts) DROP1(varlist numeric fv ts) ///
    MAXIter(integer 10) ITER(integer -1) SAMPle(name) ]

// varlist    : variable that has to be imputed
// if/in      : observations that are used (either in estimation or imputation)
// weights    : allowed but ignored
// draws      : uniform pseudo-random draws in variables corresponding to
//              each variable in varlist; ignored
// model      : type of imputation model, e.g., ologit; ignored
// toimpute   : binary variable, indicating whether it needs to be
//              imputed (1) or not (0)
// covariates : always nonmissing covariates that are used in the model
// ycovars    : list of y variables that are additional covariates.
//              This is ignored here and replaced by a mix of y variables
//              and derived scales.
// drop1      : subset of covariates & ycovars that is dropped from the
//              model after the initial model failed. For now, this is
//              simply copied to the results.
// maxiter    : max number of iterations in the chain; ignored
// iter       : current iteration; if 0, the spec will only include
//              previously imputed y variables/scales.
// sample     : variable indicating combined estimation/imputation sample
//              (output)

marksample touse, novarlist strok

// Weight option
if ("`weight'" != "") {
    local wtopt `"[`weight'`exp']"'
}
else {
    local wtopt
}

// Variable that has to be imputed
local y `varlist'

if ("`toimpute'" == "") {
    tempvar toimp
    quietly generate byte `toimp' = (`touse' & missing(`y'))
    local toimpute `toimp'
}

// wave number
local w = $CURRWAVE

// For printing stuff for testing
local qui quietly
if ("$TESTSPEC" != "" & "$TESTSPEC" != "0") {
    local qui
}

// -----------------------------------------------------------------
// Cognitive tests
// -----------------------------------------------------------------

// -----------------------------------------------------------------
// Sets of single items

local orient5t    r`w'mo    r`w'yr   r`w'dw   r`w'date    r`w'season
local orient5p    r`w'state r`w'city r`w'name r`w'address r`w'floor
local recall10    r`w'word1   r`w'word2    r`w'word3
local recall10rec r`w'wre_org r`w'wre_foil // foil = incorrect words
local recall3     r`w'trial1 r`w'trial2imp r`w'trial3imp

// Brave man story
local braveman    // Immediate; 0=no, 1=gist, 2=exact
local bravemanr   // Recall;    0=no, 1=gist, 2=exact
forvalues j=1/10 {
    local braveman  `braveman'  r`w'bm_s`j'
    local bravemanr `bravemanr' r`w'bm_rs`j'
}

// Robbery story
local robbery  // Immediate; 0=no, 1=gist, 2=exact
local robberyr // Recall;    0=no, 1=gist, 2=exact
forvalues j=1/25 {
    local robbery  `robbery'  r`w'lmb_s`j'
    local robberyr `robberyr' r`w'lmb_rs`j'
}

local recallpr   r`w'log_rcmix r`w'log_wron  // mix up, wrong story
local conpraximm r`w'cp_circle  r`w'cp_rectan  r`w'cp_cube  r`w'cp_diamon
local conpraxdel r`w'cpr_circle r`w'cpr_rectan r`w'cpr_cube r`w'cpr_diamon
local gonogo     r`w'go_score1 r`w'go_score2
local symcan     r`w'sc_anw r`w'sc_wr // wr = wrong answers
local digitspan  r`w'ds_for r`w'ds_back
local object     r`w'object1 r`w'object2
local animal     r`w'verbalc r`w'verbal_inc // inc = incorrect words
// local senten     r`w'say r`w'write
// local follow     r`w'copyfol r`w'readfol
local tics2      r`w'scis r`w'coconut    
local csid       r`w'elbow r`w'hammer r`w'store r`w'point

// Tests that were only administered in phase 2 and 3
local handseq r`w'ef_palm    r`w'ef_clench  r`w'ef_fist
local token   r`w'tt_crcl    r`w'tt_sqr     r`w'tt_dmnd   r`w'tt_blckcrl ///
              r`w'tt_blsqr   r`w'tt_yldmnd  r`w'tt_ylsqr
local simdiff r`w'jp_animl   r`w'jp_flwr    r`w'jp_lie    r`w'jp_river
local prsolv  r`w'jp_rupee1  r`w'jp_rupee2  r`w'jp_fndkid

// Items for literate and illiterate individuals. These have been
// initialized to zero for the "other" group so always exist.
local lit   r`w'writez r`w'readfolz
local illit r`w'sayz   r`w'copyfolz

local othercogvars r`w'dlrc3 r`w'ser7 r`w'backward6 r`w'repeat r`w'execu   ///
    r`w'draw2 r`w'word_d r`w'log_reco r`w'prime r`w'dr_clock3 r`w'rv_score ///
    r`w'illiterate

local cogvars         ///
    `orient5t'        ///
    `orient5p'        ///
    `recall10'        ///
    `recall10rec'     ///
    `recall3'         ///
    `braveman'        ///
    `bravemanr'       ///
    `robbery'         ///
    `robberyr'        ///
    `recallpr'        ///
    `conpraximm'      ///
    `conpraxdel'      ///
    `gonogo'          ///
    `symcan'          ///
    `digitspan'       ///
    `object'          ///
    `animal'          ///
    `tics2'           ///
    `csid'            ///
    `handseq'         ///
    `token'           ///
    `simdiff'         ///
    `prsolv'          ///
    `lit'             ///
    `illit'           ///
    `othercogvars'

// -----------------------------------------------------------------
// Level-1 sum scores

// List of level-1 scales
local level1scales orient5t orient5p recall10 recall3 braveman bravemanr ///
    robbery robberyr conpraximm conpraxdel gonogo digitspan object tics2 ///
    csid lit illit

// Phase 2&3 only
local level1scales_ph2 handseq token simdiff prsolv

local alllevel1 `level1scales' `level1scales_ph2'

local coglevel1
foreach scale of local alllevel1 {
    local coglevel1 `coglevel1' r`w'`scale'
}

// ---------------------------------------------------------------------
// Narrow domains and broad domains that don't have narrow subdomains

local orientation r`w'orient5t r`w'orient5p r`w'prime
local memory_imm  r`w'recall10 r`w'recall3 r`w'braveman r`w'robbery
local memory_del  r`w'word_d r`w'dlrc3 r`w'bravemanr r`w'robberyr r`w'conpraxdel
local memory_rec  r`w'wre_org r`w'log_reco
local abstract    r`w'rv_score r`w'gonogo r`w'dr_clock3
local attspeed    r`w'ser7 r`w'backward6 r`w'sc_anw r`w'digitspan
local langflu     r`w'object r`w'verbalc r`w'repeat r`w'execu r`w'tics2 r`w'csid
local visuo       r`w'draw2 r`w'conpraximm
local efttjp      r`w'handseq r`w'token r`w'simdiff r`w'prsolv

// List of narrow domain scales
local narrowscales orientation memory_imm memory_del memory_rec ///
    abstract attspeed langflu visuo
local narrowscales_ph2 efttjp
local allnarrow `narrowscales' `narrowscales_ph2'

local cognarrow
foreach scale of local allnarrow {
    local cognarrow `cognarrow' r`w'`scale'_std
}

// ---------------------------------------------------------------------
// Broad domains

local memory   r`w'memory_imm_std r`w'memory_del_std r`w'memory_rec_std
local execfunc r`w'abstract_std r`w'attspeed_std

local broadscales memory execfunc
local allbroad `broadscales'

local cogbroad
foreach scale of local allbroad {
    local cogbroad `cogbroad' r`w'`scale'_std
}

// ---------------------------------------------------------------------
// Informant reports
// ---------------------------------------------------------------------

// -----------------------------------------------------------------
// Sets of single items

local jorm_mem
forvalues j=1/7 {
    local jorm_mem `jorm_mem' r`w'iqscore`j'
}
local jorm_nonmem
forvalues j=8/16 {
    local jorm_nonmem `jorm_nonmem' r`w'iqscore`j'
}
local csi_mem
foreach j of numlist 2/6 11/13 {
    local csi_mem `csi_mem' r`w'csi`j'
}
local csi_nonmem
foreach j of numlist 1 7/10 14/15 {
    local csi_nonmem `csi_nonmem' r`w'csi`j'
}
local bl2 r`w'bl2_2r r`w'bl2_3r r`w'bl2_4r
local act         ///
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

local feelpos r`w'feel27 r`w'feel29 r`w'feel30 r`w'feel31 r`w'feel36r r`w'feel37r
local ten     r`w'ten1 r`w'ten2 r`w'ten3 r`w'ten4 r`w'ten5

local bl1   // No loss, some loss, severe loss
local bl1a  // Physical, mental, both
forvalues j=1/8 {
    local bl1  `bl1'  r`w'bl1_`j'
    local bl1a `bl1a' r`w'bl1_`j'a
}
local bl1phys `bl1' `bl1a'
local bl1ment `bl1' `bl1a'

local infvars `jorm_mem' `jorm_nonmem' `csi_mem' `csi_nonmem' `bl2' ///
    `feelpos' `ten' `act' `bl1' `bl1a'

// -----------------------------------------------------------------
// Level-1 sum scores

local level1infscales jorm_mem jorm_nonmem csi_mem csi_nonmem bl2 feelpos ten
local level1actscales act_pc1 act_pc2 act_pc3 // 3 principal components of activities
local level1bl1scales bl1 bl1phys bl1ment

local allinflevel1 `level1infscales' `level1actscales' `level1bl1scales'

local inflevel1 
foreach scale of local allinflevel1 {
    local inflevel1 `inflevel1' r`w'`scale'
}

// -----------------------------------------------------------------
// Narrow domain (actually more broad)

local infscore2 r`w'jorm_mem r`w'jorm_nonmem r`w'csi_mem r`w'csi_nonmem ///
    r`w'ten

local narrowinfscales infscore2

local infnarrow
foreach scale of local narrowinfscales {
    local infnarrow `infnarrow' r`w'`scale'_std
}

// -----------------------------------------------------------------
// Create nested outline of scale dependencies
// -----------------------------------------------------------------

local allsets ///
    cogvars   ///
    coglevel1 ///
    cognarrow ///
    cogbroad  ///
    infvars   ///
    inflevel1 ///
    infnarrow

// Combine resp & inf sets
local cibroad  `cogbroad'
local cinarrow `cognarrow' `infnarrow'
local cilevel1 `coglevel1' `inflevel1'
local civars   `cogvars'   `infvars'

// List of to-be-imputed variables and their variants as covariate (which
// are occasionally different)

local yvars `civars'
foreach yy of local civars {
    local ycov_`yy' `yy'
}
// Exceptions where y as covariate differs from y as imputed var
local ycov_r`w'verbal  r`w'verbalc  
local ycov_r`w'trial2  r`w'trial2imp
local ycov_r`w'trial3  r`w'trial3imp
local ycov_r`w'copyfol r`w'copyfolz 
local ycov_r`w'say     r`w'sayz     
local ycov_r`w'readfol r`w'readfolz 
local ycov_r`w'write   r`w'writez   
local ycov_r`w'feel36  r`w'feel36r  
local ycov_r`w'feel37  r`w'feel37r  

local yvars = subinword("`yvars'","r`w'verbalc",  "r`w'verbal",1)
local yvars = subinword("`yvars'","r`w'trial2imp","r`w'trial2",1)
local yvars = subinword("`yvars'","r`w'trial3imp","r`w'trial3",1)
local yvars = subinword("`yvars'","r`w'copyfolz", "r`w'copyfol",1)
local yvars = subinword("`yvars'","r`w'sayz",     "r`w'say",1)
local yvars = subinword("`yvars'","r`w'readfolz", "r`w'readfol",1)
local yvars = subinword("`yvars'","r`w'writez",   "r`w'write",1)
local yvars = subinword("`yvars'","r`w'feel36r",  "r`w'feel36",1)
local yvars = subinword("`yvars'","r`w'feel37r",  "r`w'feel37",1)

// illiterate is not a to-be-imputed variable
local r`w'illiterate r`w'illiterate
local yvars : list yvars - r`w'illiterate

// Associate each scale variable with a scale macro containing its components

foreach b of local cibroad {
    // b is of the form r`w'`scale', possibly with _std and/or _pc`j' added;

    // extract `scale'
    local bscale = subinstr("`b'","r`w'","",1)
    local bscale = subinstr("`bscale'","_std","",1)
    forvalues j=1/3 {
        local bscale = subinstr("`bscale'","_pc`j'","",1)
    }

    local scale_`b' `bscale'
    local type_`b'  broad

    `qui' display as text %-19s "`b'" %-19s "`scale_`b''" %-19s "`type_`b''"
}

// Narrow subscales
foreach n of local cinarrow {
    // n is of the form r`w'`scale', possibly with _std and/or _pc`j' added

    // extract `scale'
    local nscale = subinstr("`n'","r`w'","",1)
    local nscale = subinstr("`nscale'","_std","",1)
    forvalues j=1/3 {
        local nscale = subinstr("`nscale'","_pc`j'","",1)
    }

    local scale_`n' `nscale'
    local type_`n'  narrow

    `qui' display as text %-19s "`n'" %-19s "`scale_`n''" %-19s "`type_`n''"
}

// Level-1 aggregates
foreach l of local cilevel1 {
    // l is of the form r`w'`scale', possibly with _std and/or _pc`j' added

    // extract `scale'
    local lscale = subinstr("`l'","r`w'","",1)
    local lscale = subinstr("`lscale'","_std","",1)
    forvalues j=1/3 {
        local lscale = subinstr("`lscale'","_pc`j'","",1)
    }

    local scale_`l' `lscale'
    local type_`l'  level1

    `qui' display as text %-19s "`l'" %-19s "`scale_`l''" %-19s "`type_`l''"
}

// Single variables
local none
foreach ycov of local civars {
    local scale_`ycov' none
    local type_`ycov'  var

    `qui' display as text %-19s "`ycov'" %-19s "`scale_`ycov''" %-19s "`type_`ycov''"
}

// Top-down traversing the tree and building the reverse trajectory
// for facilitating traveling the tree upward below.

// (1) Assign broad scales to their components

// Broad scales
`qui' display as text _n "(1)"
foreach b of local cibroad {
    `qui' display as text "`b'"
    // Narrow subscales
    foreach n of local `scale_`b'' {
        `qui' display as text "   `n'"
        local broad_`n' `broad_`n'' `b'

        // Level-1 subscales
        foreach l of local `scale_`n'' {
            `qui' display as text "      `l'"
            local broad_`l' `broad_`l'' `b'

            // Single items
            foreach ycov of local `scale_`l'' {
                `qui' display as text "         `ycov'"
                local broad_`ycov' `broad_`ycov'' `b'
            }
        }
    }
}

// (2) Assign narrow scales to their components

// Narrow subscales
`qui' display as text _n "(2)"
foreach n of local cinarrow {
    `qui' display as text "   `n'"

    // Level-1 subscales
    foreach l of local `scale_`n'' {
        `qui' display as text "      `l'"
        local narrow_`l' `narrow_`l'' `n'

        // Single items
        foreach ycov of local `scale_`l'' {
            `qui' display as text "         `ycov'"
            local narrow_`ycov' `narrow_`ycov'' `n'
        }
    }
}

// (3) Assign level-1 aggregates to their components

// Level-1 subscales
`qui' display as text _n "(3)"
foreach l of local cilevel1 {
    `qui' display as text "      `l'"

    // Single items
    foreach ycov of local `scale_`l'' {
        `qui' display as text "         `ycov'"
        local level1_`ycov' `level1_`ycov'' `l'
    }
}

// Replace blanks by "none"
foreach ycov of local civars {
    if ("`level1_`ycov''" == "") {
        local level1_`ycov' none
    }
    if ("`narrow_`ycov''" == "") {
        local narrow_`ycov' none
    }
    if ("`broad_`ycov''" == "") {
        local broad_`ycov' none
    }
}
foreach l of local cilevel1 {
    if ("`narrow_`l''" == "") {
        local narrow_`l' none
    }
    if ("`broad_`l''" == "") {
        local broad_`l' none
    }
}
foreach n of local cinarrow {
    if ("`broad_`n''" == "") {
        local broad_`n' none
    }
}

// -----------------------------------------------------------------
// Print out what we have assembled (test)

if ("$TESTSPEC" != "" & "$TESTSPEC" != "0") {
    // Print out the contents of the sets
    foreach set of local allsets {
        display as text _n "`set'"
        foreach ycov of local `set' {
            display as text "   `ycov'"
        }
    }

    display as text _n _n "---- Broad ----" _n
    foreach b of local cibroad {
        display as text _n "`b' -> `scale_`b''"
        foreach n of local `scale_`b'' {
            display as text "   `n' -> `scale_`n''"
            foreach l of local `scale_`n'' {
                display as text "      `l' -> `scale_`l''"
                foreach ycov of local `scale_`l'' {
                    display as text "         `ycov'"
                }
            }
        }
    }

    display as text _n _n "---- Narrow (no broad) ----" _n
    foreach n of local cinarrow {
        if ("`broad_`n''" == "none") {
            display as text "   `n' -> `scale_`n''"
            foreach l of local `scale_`n'' {
                display as text "      `l' -> `scale_`l''"
                foreach ycov of local `scale_`l'' {
                    display as text "         `ycov'"
                }
            }
        }
    }

    display as text _n _n "---- Level-1 (no higher) ----" _n
    foreach l of local cilevel1 {
        if ("`narrow_`l''" == "none" & "`broad_`l''" == "none") {
            display as text "      `l' -> `scale_`l''"
            foreach ycov of local `scale_`l'' {
                display as text "         `ycov'"
            }
        }
    }

    display as text _n _n "---- Single vars (not part of aggregates) ----" _n
    foreach ycov of local civars {
        if ("`level1_`ycov''" == "none" & "`narrow_`ycov''" == "none" ///
            & "`broad_`ycov''" == "none") {
            display as text "            `ycov'"
        }
    }

    display as text _n _n "---- All vars ----" _n

    display as text     ///
        %-19s "y"       ///
        %-19s "ycov"    ///
        %-19s "level-1" ///
        %-19s "narrow"  ///
        %-19s "broad"

    foreach yv of local yvars {
        local ycov `ycov_`yv''
        local ycov2 `ycov'
        if ("`ycov'" == "`yv'") {
            local ycov2
        }

        // Duplicity only at level 1; this is 1 except for act, bl1, and bl1a
        local nl : word count `level1_`ycov''
        local nn : word count `narrow_`ycov''
        local nb : word count `broad_`ycov''

        forvalues jl = 1/`nl' {
            local l : word `jl' of `level1_`ycov''
            forvalues jn = 1/`nn' {
                local n : word `jn' of `narrow_`ycov''
                forvalues jb = 1/`nb' {
                    local b : word `jb' of `broad_`ycov''
                    display as text     ///
                        %-19s "`yv'"    ///
                        %-19s "`ycov2'" ///
                        %-19s "`l'"     ///
                        %-19s "`n'"     ///
                        %-19s "`b'"
                }
            }
        }
    }
}

// -----------------------------------------------------------------
// Assign covariates to regression/imputation of `y'
// -----------------------------------------------------------------

// The list of covariates includes:
//
// (1) All covariates passed to the program, which should be nonmissing
//     in the sample.
// (2) All broad scales, except the one `y' is part of (`b', say), if any.
// (3) All narrow scales that are not part of broad scales or that are part
//     of `b', except the one `y' is part of (`n', say).
// (4) All level-1 aggregates that are not part of broad or narrow scales,
//     or that are only part of broad and narrow scales that have been
//     excluded from the covariate list, except the one `y' is part of (`l', say).
// (5) All single variables that are not part of any of the scales that
//     have already been included, except `y'.
//
// Exceptions/modifications:
// (a) Literacy-related variables (copy, read, write, say) drop
//     r`w'illiterate and the variables administered to the "other" group
//     from the set of covariates and restrict the sample only to the
//     "own" group.
// (b) Contingencies: skip patterns for one variable depending on another.
//     This implies dropping the other and subsetting the sample.
// (c) Variables that were added in phase 2 are excluded from 2-5 except
//     when y was also added in phase 2.
// (d) Blessed Part 1 variables and scores are treated in the same spirit,
//     but it's more complicated:
//     - First. they are considered to have been added in phase 2 and
//       are only imputed in phase 2 & 3.
//     - After all variables, including Blessed 1 in phases 2 & 3, have
//       been imputed, non-skip missings in Blessed 1 in phase 1 are
//       imputed, with the other Blessed 1 variables/scores as covariates
//       and the sample restricted to observations that would not have been
//       skipped in phase 1. This sample selection must be done in the
//       calling program, and the global macro BL1phase1 should be not
//       empty to indicate this behavior.
// (e) In the initialization (iteration 0), variables that have missings
//     in the sample (which haven't been imputed yet) are excluded from
//     2-5.

local ycov `ycov_`y''

// (1) Covariates without missings
local xcovariates `covariates'
// (2) Broad scales, except the one(s) that y is part of.
//     Note that this also works with broad_`ycov' = "none".
local xbroad : list cibroad - broad_`ycov'
// (3) Narrow scales
local xnarrow
foreach n of local cinarrow {
    // Default: add
    local addn 1
    foreach b of local broad_`n' {
        local binx : list b in xbroad
        if (`binx') {
            // Corresponding broad scale already included => do not include
            // this narrow scale.
            local addn 0
        }
    }
    local yinn : list n in narrow_`ycov'
    if (`yinn') {
        // Narrow scale contains y => do not include
        local addn 0
    }
    if (`addn') {
        local xnarrow `xnarrow' `n'
    }
}
// (4) Level-1 aggregates
local xlevel1
foreach l of local cilevel1 {
    // Default: add
    local addl 1
    foreach b of local broad_`l' {
        local binx : list b in xbroad
        if (`binx') {
            // Corresponding broad scale already included => do not include
            // this aggregate
            local addl 0
        }
    }
    foreach n of local narrow_`l' {
        local ninx : list n in xnarrow
        if (`ninx') {
            // Corresponding narrow scale already included => do not include
            // this aggregate
            local addl 0
        }
    }
    local yinl : list l in level1_`ycov'
    if (`yinl') {
        // Aggregate contains y => do not include
        local addl 0
    }
    if (`addl') {
        local xlevel1 `xlevel1' `l'
    }
}
// (5) Single variables
local xsingle
foreach v of local civars {
    // Default: add
    local addv 1
    foreach b of local broad_`v' {
        local binx : list b in xbroad
        if (`binx') {
            // Corresponding broad scale already included => do not include
            // this aggregate
            local addv 0
        }
    }
    foreach n of local narrow_`v' {
        local ninx : list n in xnarrow
        if (`ninx') {
            // Corresponding narrow scale already included => do not include
            // this aggregate
            local addv 0
        }
    }
    foreach l of local level1_`v' {
        local linx : list l in xlevel1
        if (`linx') {
            // Corresponding aggegate already included => do not include
            // this variable
            local addv 0
        }
    }
    if ("`ycov'" == "`v'") {
        // Variable is y => do not include
        local addv 0
    }
    if (`addv') {
        local xsingle `xsingle' `v'
    }
}

// Combine and cleanup, just in case
local xall `xcovariates' `xbroad' `xnarrow' `xlevel1' `xsingle'
local xall : list uniq xall
local xnone none
local xall : list xall - xnone

// Initialize estimation/imputation sample
quietly generate byte `sample' = `touse'

// (a) Literacy-based exceptions
local d
if (inlist("`y'","r`w'copyfol","r`w'say")) {
    // For illiterates only
    local d r`w'readfolz r`w'writez r`w'lit r`w'illiterate
    quietly replace `sample' = (`sample' & r`w'illiterate)
}
else if (inlist("`y'","r`w'readfol","r`w'write")) {
    // For literates only
    local d r`w'copyfolz r`w'sayz r`w'illit r`w'illiterate
    quietly replace `sample' = (`sample' & !r`w'illiterate)
}
local xall : list xall - d

// (b) Contingencies

// 3-word recall: 2nd & 3rd trial only done if prev not perfect
if ("`y'" == "r`w'trial1") {
    local d r`w'trial2imp r`w'trial3imp
}
else if ("`y'" == "r`w'trial2") {
    local d r`w'trial3imp
    quietly replace `sample' = (`sample' & r`w'trial1 != 3)
}
else if ("`y'" == "r`w'trial3") {
    quietly replace `sample' = (`sample' & r`w'trial1 != 3 & r`w'trial2imp != 3)
}
local xall : list xall - d

// date=0 if mo=0
if ("`y'" == "r`w'mo") {
    local d r`w'date
}
else if ("`y'" == "r`w'date") {
    local d r`w'mo
    quietly replace `sample' = (`sample' & r`w'mo == 1)
}
local xall : list xall - d

// (c) Phase 2&3 only
local phase2vars
foreach s of local level1scales_ph2 {
    // Variables
    local phase2vars `phase2vars' ``s''
}
foreach s of local narrowscales_ph2 {
    // Level-1 aggregates
    local phase2vars `phase2vars' ``s''
}
// Narrow domains
local phase2vars `phase2vars' r`w'efttjp_std
local yphase2 : list y in phase2vars

if (`yphase2') {
    quietly replace `sample' = (`sample' & r`w'phase != 1)
}

// (d) Blessed Pt 1 variables
local allbl1 `bl1' `bl1a' r`w'bl1 r`w'bl1phys r`w'bl1ment
local ybl1 : list y in allbl1

if (!`yphase2' & !`ybl1') {
    // y is not a phase 2+3 variable: drop all phase 2+3 variables from
    // covariate list
    local xall : list xall - phase2vars
    local xall : list xall - allbl1
}
else if (!`ybl1') {
    // y is a phase 2+3 variable but not in Blessed Pt 1: keep phase 2+3
    // variables in covariate list, but restrict sample to phase 2+3 only
    quietly replace `sample' = (`sample' & r`w'phase != 1)
}
else if ("$BL1phase1" == "") {
    // y is a Blessed-1 variable and we are imputing it for Phases 2+3
    // => treat it as a regular Phase 2+3 variable
    quietly replace `sample' = (`sample' & r`w'phase != 1)
}
else {
    // y is a Blessed-1 variable and we are imputing it for Phase 1.
    // `touse' should already restrict the sample to those who would have
    // been (or were) eligible for Blessed 1 in phase 1 (phase 1a or 1b).
    // For these observations, phase 2 variables are not available.
    local xall : list xall - phase2vars
}

// The only remaining issue is that Blessed-1a items are asked only if
// the corresponding Blessed-1 item was 2 or 3 (at least some loss) and
// that Blessed-1a items are unordered categorical. The easiest way to
// deal with this is to create versions of r`w'bl1ment and r`w'bl1phys
// that exclude the current item and use those as covariates instead of
// the separate 1a items, and restricting the sample appropriately.

if (`ybl1') {
    quietly {
        local ybl1a : list y in bl1a
        if (!`ybl1a') {
            // Regular bl1 variable, not bl1a -> j is last character of varname
            local itemno = substr("`y'",-1,1)
        }
        else {
            // bl1a variable -> j is second-to-last character of varname
            local itemno = substr("`y'",-2,1)
            replace `sample' = (`sample' & inlist(r`w'bl1_`itemno',2,3))
        }

        capture confirm variable r`w'bl1_m`itemno'
        if (_rc != 0) {
            generate byte r`w'bl1_m`itemno' = .
            generate byte r`w'bl1phys_m`itemno' = .
            generate byte r`w'bl1ment_m`itemno' = .
            label variable r`w'bl1_m`itemno' "bl1 sum score except `itemno'"
            label variable r`w'bl1phys_m`itemno' "bl1a #Phys losses except `itemno'"
            label variable r`w'bl1ment_m`itemno' "bl1a #Ment losses except `itemno'"
        }

        foreach scale in bl1_m`itemno' bl1phys_m`itemno' bl1ment_m`itemno' {
            replace r`w'`scale' = 0 if (`sample')
        }

        forvalues j=1/8 {
            // Only include previous items if we're in the initialization phase
            if ((`iter' <= 0 & `j' < `itemno') | (`iter' > 0 & `j' != `itemno')) {
                local scale bl1_m`itemno'
                replace r`w'`scale' = r`w'`scale' + r`w'bl1_`j' if (`sample')

                local scale bl1phys_m`itemno'
                replace r`w'`scale' = r`w'`scale' + 1 if (`sample' & inlist(r`w'bl1_`j'a,1,3))
                replace r`w'`scale' = . if (`sample' & missing(r`w'bl1_`j'))
                replace r`w'`scale' = . if (`sample' & inlist(r`w'bl1_`j',2,3) ///
                    & missing(r`w'bl1_`j'a))

                local scale bl1ment_m`itemno'
                replace r`w'`scale' = r`w'`scale' + 1 if (`sample' & inlist(r`w'bl1_`j'a,2,3))
                replace r`w'`scale' = . if (`sample' & missing(r`w'bl1_`j'))
                replace r`w'`scale' = . if (`sample' & inlist(r`w'bl1_`j',2,3) ///
                    & missing(r`w'bl1_`j'a))
            }
        }

        // There are no previous items for item #1
        if (`iter' <= 0 & `itemno' == 1) {
            foreach scale in bl1_m`itemno' bl1phys_m`itemno' bl1ment_m`itemno' {
                replace r`w'`scale' = . if (`sample')
            }
        }
    }

    // Replace bl1a items with these two partial scales
    local xall : list xall - bl1a
    local xall `xall' r`w'bl1phys_m`itemno' r`w'bl1ment_m`itemno'
}

// (e) Initialization phase

// In regular imputations, observations with missings are dropped per
// usual Stata, but there shouldn't be any, because they have been imputed
// already. In the initialization phase, variables with missings are
// dropped instead, keeping all observations, because these variables
// haven't been imputed yet.

if (`iter' <= 0) {
    local ycovars : list xall - xcovariates
    foreach x of varlist `ycovars' {
        quietly count if (`sample' & missing(`x'))
        if (r(N) != 0) {
            local xall : list xall - x
        }
    }
}


// Fallback options

// This is an awkward combination of a droplist from the input and
// hardcoded additions, but it works

if ("`drop1'" != "") {
    local ndropsets 1
    local xcurr : list xall - drop1
}
else {
    local ndropsets 0
    local xcurr `xall'
}

// Variables whose models sometimes crash because of r`w'stateid
local ytmplist ///
    r`w'object1  ///
    r`w'write    ///
    r`w'bl1_5a   ///
    r`w'bl1_6a

local yintmp : list y in ytmplist
if (`yintmp') {
    local ++ndropsets
    local drop`ndropsets' i.r`w'stateid
    local xcurr : list xcurr - drop`ndropsets'
}

// r`w'athome seems to be a problem for these
if (inlist("`y'","r`w'bl1_2a","r`w'jp_rupee1","r`w'jp_fndkid","r`w'tt_crcl")) {
    local ++ndropsets
    local drop`ndropsets' r`w'athome
    local xcurr : list xcurr - drop`ndropsets'
}

// Additional fallbacks for Blessed Pt 1
if (`ybl1') {
    if (`iter' > 0 | `itemno' != 1) {
        local ++ndropsets
        local drop`ndropsets' `bl1'            // Drop separate bl1 items
        local add`ndropsets' r`w'bl1_m`itemno' // Add aggregate of the other items
        local xcurr : list xcurr - drop`ndropsets'
    }

    // Drop everything except other cog vars; drop some minor cog variables as well
    local ++ndropsets
    local drop`ndropsets' `xcovariates' ///
        r`w'wre_foil r`w'log_rcmix r`w'log_wron r`w'sc_wr r`w'verbal_inc
    local xcurr : list xcurr - drop`ndropsets'



    if (`iter' > 0 | `itemno' != 1) {
        local ++ndropsets
        // Only keep these three aggregates
        local keep`ndropsets' r`w'bl1_m`itemno' r`w'bl1phys_m`itemno' r`w'bl1ment_m`itemno'
        local drop`ndropsets' : list xcurr - keep`ndropsets'
        local xcurr : list xcurr - drop`ndropsets'
    }

    // More fallbacks
    // if (inlist("`y'", "r`w'bl1_3")) {
    //     local ++ndropsets
    //     // Only keep one aggregate (r`w'bl1_m`itemno'), which is
    //     // extremely predictive
    //     local drop`ndropsets' r`w'bl1phys_m`itemno' r`w'bl1ment_m`itemno'
    //     local xcurr : list xcurr - drop`ndropsets'
    // }
}

// List of covariates for this y (including other y's)
return local covariates `xall'

if (`ndropsets' > 0) {
    forvalues s=1/`ndropsets' {
        return local drop`s' `drop`s''
        if ("`add`s''" != "") {
            return local add`s' `add`s''
        }
    }
    return scalar ndropsets = `ndropsets'
}

end
exit

// EOF
