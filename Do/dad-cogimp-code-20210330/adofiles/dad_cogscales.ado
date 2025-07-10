*! version 0.1.0  03jun2020  [EM]
program define dad_cogscales, rclass

// Compute summary measures from the cognitive and informant scales

syntax [if] [in] [, wave(integer 1) generate ]

// ---------------------------------------------------------------------
// Sample to use
marksample touse, novarlist strok

local w `wave'

// ---------------------------------------------------------------------
// Contingencies and other derived variables
// ---------------------------------------------------------------------

quietly {
    // Alternative versions that are useful for computing scales
    if ("`generate'" != "") {
        generate int  r`w'verbalc   = . if (`touse')
        generate byte r`w'trial2imp = . if (`touse')
        generate byte r`w'trial3imp = . if (`touse')
        generate byte r`w'copyfolz  = . if (`touse')
        generate byte r`w'sayz      = . if (`touse')
        generate byte r`w'readfolz  = . if (`touse')
        generate byte r`w'writez    = . if (`touse')
        generate byte r`w'feel36r   = . if (`touse')
        generate byte r`w'feel37r   = . if (`touse')

        label variable r`w'verbalc   "r`w'verbalc:w`w' animal naming censored at 35"
        label variable r`w'trial2imp "r`w'trial2imp:w`w' implied value of r`w'trial2"
        label variable r`w'trial3imp "r`w'trial3imp:w`w' implied value of r`w'trial3"
        label variable r`w'copyfolz  "r`w'copyfolz:w`w' r`w'copyfol with 0 for literate"
        label variable r`w'sayz      "r`w'sayz:w`w' r`w'say with 0 for literate"
        label variable r`w'readfolz  "r`w'readfolz:w`w' r`w'readfol with 0 for illiterate"
        label variable r`w'writez    "r`w'writez:w`w' r`w'write with 0 for illiterate"
        label variable r`w'feel36r   "r`w'feel36r:w`w' r`w'feel36 reverse-coded"
        label variable r`w'feel37r   "r`w'feel37r:w`w' r`w'feel37 reverse-coded"
    }

    // Censored version of animal naming
    replace r`w'verbalc = r`w'verbal if (`touse')
    replace r`w'verbalc = 35 if (`touse' & r`w'verbal > 35 & !missing(r`w'verbal))

    // Implied values of trial2 and trial3
    replace r`w'trial2imp = r`w'trial2 if (`touse')
    replace r`w'trial2imp = 3 if (`touse' & r`w'trial1 == 3 & missing(f_r`w'trial2))
    replace r`w'trial3imp = r`w'trial3 if (`touse')
    replace r`w'trial3imp = 3 if (`touse' & r`w'trial2imp == 3 & missing(f_r`w'trial3))

    // date=0 if mo=0
    replace r`w'date = 0 if (`touse' & r`w'mo == 0 & r`w'date != 0 & missing(f_r`w'date))

    // Zeros for literacy-related skips
    replace r`w'copyfolz  = r`w'copyfol if (`touse' & r`w'illiterate == 1)
    replace r`w'sayz      = r`w'say     if (`touse' & r`w'illiterate == 1)
    replace r`w'readfolz  = r`w'readfol if (`touse' & r`w'illiterate != 1)
    replace r`w'writez    = r`w'write   if (`touse' & r`w'illiterate != 1)
    replace r`w'copyfolz  = 0 if (`touse' & r`w'illiterate != 1)
    replace r`w'sayz      = 0 if (`touse' & r`w'illiterate != 1)
    replace r`w'readfolz  = 0 if (`touse' & r`w'illiterate == 1)
    replace r`w'writez    = 0 if (`touse' & r`w'illiterate == 1)

    // Reverse coded negative feelings
    replace r`w'feel36r = 6 - r`w'feel36 if (`touse')
    replace r`w'feel37r = 6 - r`w'feel37 if (`touse')

    // bl1a questions only asked if any loss in corresponding bl1 question
    forvalues j=1/8 {
        replace r`w'bl1_`j'a = .s if (`touse' & r`w'bl1_`j' == 1 & missing(f_r`w'bl1_`j'a))
    }
}

// ---------------------------------------------------------------------
// Cognitive tests
// ---------------------------------------------------------------------

// Structure of the self-tests follows Gross et al. (2020) but uses
// simpler aggregates instead of factor analysis.

// ---------------------------------------------------------------------
// Lowest-level aggregates: simple sum scores

// Orientation to time and place
local orient5t    r`w'mo    r`w'yr   r`w'dw   r`w'date    r`w'season
local orient5p    r`w'state r`w'city r`w'name r`w'address r`w'floor

// 10-word recall and 3-word recall (immediate, delayed, recognition)
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

// Recall problems
local recallpr r`w'log_rcmix r`w'log_wron  // mix up, wrong story

// Constructional praxis, immediate and delayed
local conpraximm r`w'cp_circle  r`w'cp_rectan  r`w'cp_cube  r`w'cp_diamon
local conpraxdel r`w'cpr_circle r`w'cpr_rectan r`w'cpr_cube r`w'cpr_diamon

// Go-no-go score
local gonogo r`w'go_score1 r`w'go_score2

// Symbol cancelation
local symcan r`w'sc_anw r`w'sc_wr // wr = wrong answers

// Digit span (forward and backward)
local digitspan r`w'ds_for r`w'ds_back

// Naming common objects
local object r`w'object1 r`w'object2
// Animal naming
local animal r`w'verbal r`w'verbal_inc // inc = incorrect words
// Writing or saying a sentence
local senten r`w'say r`w'write
// Close your eyes
local follow r`w'copyfol r`w'readfol
// Naming described objects
local tics2  r`w'scis r`w'coconut    
// CSID
local csid   r`w'elbow r`w'hammer r`w'store r`w'point

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

// List of level-1 scales; this excludes single-item ones and items
// with number of "wrong" answers or other complications
local level1scales orient5t orient5p recall10 recall3 braveman bravemanr ///
    robbery robberyr conpraximm conpraxdel gonogo digitspan object tics2 ///
    csid lit illit

// Phase 2&3 only
local level1scales_ph2 handseq token simdiff prsolv

// Defining sample for each scale
foreach scale of local level1scales {
    local tu_`scale' `"`touse'"'
}
foreach scale of local level1scales_ph2 {
    local tu_`scale' `"`touse' & r`w'phase != 1"'
}
local alllevel1 `level1scales' `level1scales_ph2'

// Compute each scale
quietly {
    if ("`generate'" != "") {
        foreach scale of local alllevel1 {
            generate int r`w'`scale' = . if (`tu_`scale'')
            label variable r`w'`scale' "r`w'`scale':w`w' level-1 aggregate"
        }
    }

    foreach scale of local alllevel1 {
        replace r`w'`scale' = 0 if (`tu_`scale'')
        foreach y of local `scale' {
            replace r`w'`scale' = r`w'`scale' + `y' if (`tu_`scale'')
        }
    }
} // end quietly

// ---------------------------------------------------------------------
// Narrow domains and broad domains that don't have narrow subdomains

// Orientation (adds prime minister from TICS)
local orientation r`w'orient5t r`w'orient5p r`w'prime

// Immediate memory
local memory_imm r`w'recall10 r`w'recall3 r`w'braveman r`w'robbery
// Delayed memory
local memory_del r`w'word_d r`w'dlrc3 r`w'bravemanr r`w'robberyr r`w'conpraxdel
// Recognition memory
local memory_rec r`w'wre_org r`w'log_reco

// Abstract reasoning
local abstract r`w'rv_score r`w'gonogo r`w'dr_clock3
// Attention/speed
local attspeed r`w'ser7 r`w'backward6 r`w'sc_anw r`w'digitspan

// Language/fluency; add csid that's not in Alden's model
local langflu r`w'object r`w'verbalc r`w'repeat r`w'execu r`w'tics2 r`w'csid

// Visuospatial
local visuo r`w'draw2 r`w'conpraximm

// Not in Alden's model, but a pca suggests a 1-dimensional scale does a
// decent job in summarizing them.
local efttjp r`w'handseq r`w'token r`w'simdiff r`w'prsolv

// List of narrow domain scales; this excludes the literacy-related scales
local narrowscales orientation memory_imm memory_del memory_rec ///
    abstract attspeed langflu visuo
local narrowscales_ph2 efttjp

// Defining sample for each scale
foreach scale of local narrowscales {
    local tu_`scale' `"`touse'"'
}
foreach scale of local narrowscales_ph2 {
    local tu_`scale' `"`touse' & r`w'phase != 1"'
}
local allnarrow `narrowscales' `narrowscales_ph2'

// Compute each scale
tempvar ystd
quietly {
    if ("`generate'" != "") {
        foreach scale of local allnarrow {
            generate int    r`w'`scale'     = . if (`tu_`scale'')
            generate double r`w'`scale'_std = . if (`tu_`scale'')
            label variable r`w'`scale'     "r`w'`scale':w`w' narrow domain (sum score)"
            label variable r`w'`scale'_std "r`w'`scale'_std:w`w' narrow domain (sum of std)"
        }
    }

    foreach scale of local allnarrow {
        replace r`w'`scale'     = 0 if (`tu_`scale'')
        replace r`w'`scale'_std = 0 if (`tu_`scale'')
        foreach y of local `scale' {
            replace r`w'`scale'     = r`w'`scale' + `y'        if (`tu_`scale'')
            egen double `ystd'      = std(`y')                 if (`tu_`scale'')
            replace r`w'`scale'_std = r`w'`scale'_std + `ystd' if (`tu_`scale'')
            drop `ystd'
        }

        if ($TESTSCALES) {
            // Compare scales with PCA-based scales

            noisily pca ``scale'' if (`tu_`scale''), components(1)
            predict double r`w'`scale'_pc if (`tu_`scale'')

            noisily correlate r`w'`scale' r`w'`scale'_std r`w'`scale'_pc if (`tu_`scale'')

            // Conclusion: the std scales correlate extremely highly with
            // the 1st pc; the unstandardized scales sometimes notably less.
            // So we prefer to use the standardized scales.

            drop r`w'`scale'_pc
        }
    }
}

// ---------------------------------------------------------------------
// Broad domains

// Memory
// local memory r`w'memory_imm r`w'memory_del r`w'memory_rec
local memory r`w'memory_imm_std r`w'memory_del_std r`w'memory_rec_std

// Executive functioning
// local execfunc r`w'abstract r`w'attspeed
local execfunc r`w'abstract_std r`w'attspeed_std

// List of broad domain scales; this excludes the literacy-related scales
local broadscales memory execfunc

// Defining sample for each scale
foreach scale of local broadscales {
    local tu_`scale' `"`touse'"'
}
local allbroad `broadscales'

// Compute each scale
quietly {
    if ("`generate'" != "") {
        foreach scale of local allbroad {
            generate double r`w'`scale'     = . if (`tu_`scale'')
            generate double r`w'`scale'_std = . if (`tu_`scale'')
            label variable r`w'`scale'     "r`w'`scale':w`w' broad domain (sum score)"
            label variable r`w'`scale'_std "r`w'`scale'_std:w`w' broad domain (sum of std)"
        }
    }

    foreach scale of local allbroad {
        replace r`w'`scale'     = 0 if (`tu_`scale'')
        replace r`w'`scale'_std = 0 if (`tu_`scale'')
        foreach y of local `scale' {
            replace r`w'`scale'     = r`w'`scale' + `y'        if (`tu_`scale'')
            egen double `ystd'      = std(`y')                 if (`tu_`scale'')
            replace r`w'`scale'_std = r`w'`scale'_std + `ystd' if (`tu_`scale'')
            drop `ystd'
        }

        if ($TESTSCALES) {
            // Compare scales with PCA-based scales

            noisily pca ``scale'' if (`tu_`scale''), components(1)
            predict double r`w'`scale'_pc if (`tu_`scale'')

            noisily correlate r`w'`scale' r`w'`scale'_std r`w'`scale'_pc if (`tu_`scale'')

            // Conclusion: the std scales correlate extremely highly with
            // the 1st pc; the unstandardized scales sometimes notably less.
            // So we prefer to use the standardized scales.

            drop r`w'`scale'_pc
        }
    }
}

// ---------------------------------------------------------------------
// Informant reports
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// Lowest-level aggregates: simple sum scores

// Jorm IQCODE scale. Per Alden's MCI study, I split these into memory
// and non-memory.
local jorm_mem
forvalues j=1/7 {
    local jorm_mem `jorm_mem' r`w'iqscore`j'
}
local jorm_nonmem
forvalues j=8/16 {
    local jorm_nonmem `jorm_nonmem' r`w'iqscore`j'
}

// CSI; same split
local csi_mem
foreach j of numlist 2/6 11/13 {
    local csi_mem `csi_mem' r`w'csi`j'
}
local csi_nonmem
foreach j of numlist 1 7/10 14/15 {
    local csi_nonmem `csi_nonmem' r`w'csi`j'
}

// Blessed Pt 2 (ADLs)
local bl2 r`w'bl2_2r r`w'bl2_3r r`w'bl2_4r

// Everyday activities; not clear what a meaningful sum score would be ->
// look at PCA below.
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

// Positive and negative feelings, the latter reverse-coded
local feelpos r`w'feel27 r`w'feel29 r`w'feel30 r`w'feel31 r`w'feel36r r`w'feel37r

// 10/66 (also kind of ADLs)
local ten r`w'ten1 r`w'ten2 r`w'ten3 r`w'ten4 r`w'ten5

// Blessed Pt 1 (IADLs)
local bl1   // No loss, some loss, severe loss
local bl1a  // Physical, mental, both
forvalues j=1/8 {
    local bl1  `bl1'  r`w'bl1_`j'
    local bl1a `bl1a' r`w'bl1_`j'a
}

// List of level-1 sum scores
local level1infscales jorm_mem jorm_nonmem csi_mem csi_nonmem bl2 act feelpos ten
local level1bl1scales bl1 bl1a

// Defining sample for each scale
foreach scale of local level1infscales {
    local tu_`scale' `"`touse'"'
}
foreach scale of local level1bl1scales {
    local tu_`scale' `"`touse' & !r`w'skipbl1"'
}
local alllevel1inf `level1infscales' bl1

// Compute each scale
quietly {
    if ("`generate'" != "") {
        foreach scale of local alllevel1inf {
            generate double r`w'`scale' = . if (`tu_`scale'')
            label variable r`w'`scale' "r`w'`scale':w`w' informant scale"
        }
    }

    foreach scale of local alllevel1inf {
        replace r`w'`scale' = 0 if (`tu_`scale'')
        foreach y of local `scale' {
            replace r`w'`scale' = r`w'`scale' + `y' if (`tu_`scale'')
        }
    }
} // end quietly

if ($TESTSCALES) {
    // Compare act scale with PCA-based scale

    local scale act
    pca ``scale'' if (`tu_`scale'') // , components(1)
    predict double r`w'`scale'_pc* if (`tu_`scale'')
    rotate, oblimin oblique kaiser factors(3)

    correlate r`w'`scale' r`w'`scale'_pc* if (`tu_`scale'')

    drop r`w'`scale'_pc*
}

// So 1 scale doesn't sufficiently cover this; 2 or 3 is better.
// Also, these scales are not well approximated by sum scores,
// at least not obviously so, so let's keep the pca and use the
// first 3 pc's as scale scores.

quietly {
    local scale act

    if ("`generate'" == "") {
        forvalues j=1/3 {
            capture drop r`w'`scale'_pc`j'
        }
    }

    pca ``scale'' if (`tu_`scale''), components(3)
    predict double r`w'`scale'_pc* if (`tu_`scale'')
}

// Create two scales out of the Blessed Pt 1 items:
// sum of loss scores due to physical reasons and 
// sum of loss scores due to mental reasons

foreach scale in bl1phys bl1ment {
    local tu_`scale' `"`tu_bl1'"'
}

quietly {
    if ("`generate'" != "") {
        foreach scale in bl1phys bl1ment {
            generate double r`w'`scale' = . if (`tu_`scale'')
            label variable r`w'`scale' "r`w'`scale':w`w' informant scale"
        }
    }

    foreach scale in bl1phys bl1ment {
        replace r`w'`scale' = 0 if (`tu_`scale'')
    }
    forvalues j=1/8 {
        local scale bl1phys
        replace r`w'`scale' = r`w'`scale' + 1 if (`tu_`scale'' & inlist(r`w'bl1_`j'a,1,3))
        replace r`w'`scale' = . if (`tu_`scale'' & missing(r`w'bl1_`j'))
        replace r`w'`scale' = . if (`tu_`scale'' & inlist(r`w'bl1_`j',2,3) ///
            & missing(r`w'bl1_`j'a))

        local scale bl1ment
        replace r`w'`scale' = r`w'`scale' + 1 if (`tu_`scale'' & inlist(r`w'bl1_`j'a,2,3))
        replace r`w'`scale' = . if (`tu_`scale'' & missing(r`w'bl1_`j'))
        replace r`w'`scale' = . if (`tu_`scale'' & inlist(r`w'bl1_`j',2,3) ///
            & missing(r`w'bl1_`j'a))
    }
} // end quietly

// ---------------------------------------------------------------------
// Narrow domains

local infscores r`w'jorm_mem r`w'jorm_nonmem r`w'csi_mem r`w'csi_nonmem ///
    r`w'bl2 r`w'feelpos r`w'ten r`w'act_pc1 r`w'act_pc2 r`w'act_pc3

local infscore2 r`w'jorm_mem r`w'jorm_nonmem r`w'csi_mem r`w'csi_nonmem ///
    r`w'ten

local infscores_bl1 r`w'bl1 r`w'bl1phys r`w'bl1ment

foreach scale in infscores infscore2 {
    local tu_`scale' `"`touse'"'
}
foreach scale in infscores_bl1 {
    local tu_`scale' `"`tu_bl1'"'
}

local narrowinf infscore2

quietly {
    if ("`generate'" != "") {
        foreach scale of local narrowinf {
            generate double r`w'`scale'     = . if (`tu_`scale'')
            generate double r`w'`scale'_std = . if (`tu_`scale'')

            label variable r`w'`scale'     "r`w'`scale':w`w' informant narrow sum"
            label variable r`w'`scale'_std "r`w'`scale'_std:w`w' informant narrow sum of std"
        }
    }

    foreach scale of local narrowinf {
        replace r`w'`scale'     = 0 if (`tu_`scale'')
        replace r`w'`scale'_std = 0 if (`tu_`scale'')
        foreach y of local `scale' {
            replace r`w'`scale'     = r`w'`scale'     + `y'    if (`tu_`scale'')
            egen double `ystd'      = std(`y')                 if (`tu_`scale'')
            replace r`w'`scale'_std = r`w'`scale'_std + `ystd' if (`tu_`scale'')
            drop `ystd'
        }
    }
}

if ($TESTSCALES) {
    local scale infscores
    pca ``scale'' if (`tu_`scale'') // , components(1)
    // predict double r`w'`scale'_pc* if (`tu_`scale'')

    local scale infscores_bl1
    pca ``scale'' ``infscores'' if (`tu_`scale'') // , components(1)
    // predict double r`w'`scale'_pc* if (`tu_`scale'')

    pwcorr ``scale'' ``infscores'' if (`touse')

    local scale infscore2
    pca ``scale'' if (`tu_`scale''), components(1)
    quietly predict double r`w'`scale'_pc if (`tu_`scale'')
    correlate r`w'`scale' r`w'`scale'_std r`w'`scale'_pc if (`tu_`scale'')
}

end
exit

// EOF
