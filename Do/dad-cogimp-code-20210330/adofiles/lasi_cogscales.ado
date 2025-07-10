*! version 0.1.1  05mar2021  [EM]

program define lasi_cogscales, rclass

// Compute cognitive scales in the LASI core data.

syntax [if] [in] [, wave(integer 1) GENerate ]

// wave: wave number
// generate: whether scales need to be generated (initialized)
//   If not requested, replace is used.

marksample touse, novarlist strok

local w `wave'

// -----------------------------------------------------------------
// Process dependencies

// bwc100 only asked if bwc20 = 1, assumed to be 0 if bwc20 = 0
quietly replace r`w'bwc100 = 0 if (`touse' & r`w'bwc20 == 0 & missing(f_r`w'bwc100))

// -----------------------------------------------------------------
// Define local macros

// Location orientation
local orient4p_`w' r`w'city r`w'dist r`w'place r`w'address
// Date/time orientation
local orient4t_`w' r`w'dw r`w'dy r`w'yr r`w'mo
// Object naming
local object_`w' r`w'object1 r`w'object2
// Verbal fluency (keep incorrect separate)
local verbal_`w'  r`w'verbf
local verbinc_`w' r`w'verbf_inc
// Computing
local compu_`w' r`w'compu1 r`w'compu2
// Executive functioning
local exec_`w' r`w'execu
// 10-Word recall
local recall10_`w' r`w'imrc r`w'dlrc
// Drawing picture
local drawpic_`w' r`w'draw r`w'drawcl
// Serial 7s
local serial7_`w' r`w'ser7
// Backward counting
local bwc_`w' r`w'bwc20 r`w'bwc100
// Read and follow a command
local follow_`w' r`w'read
// Writing sentence
local sent_`w' r`w'senten

// All scales are simple sums (sometimes of just one variable)

local scalelist    ///
    orient4p       ///
    orient4t       ///
    object         ///
    verbal         ///
    verbinc        ///
    compu          ///
    exec           ///
    recall10       ///
    drawpic        ///
    serial7        ///
    bwc            ///
    /// follow     /// Special treatment below
    //  sent       //  Special treatment below

// -----------------------------------------------------------------
// Initialize

if ("`generate'" != "") {
    foreach scale in `scalelist' follow sent {
        quietly generate int r`w'`scale' = .
    }
}

// -----------------------------------------------------------------
// Compute scales

local scalevars
foreach scale of local scalelist {
    quietly {
        // Use explicit summation instead of egen ... = rowtotal()
        // so that any missing makes the whole scale missing.
        replace r`w'`scale' = 0 if (`touse')
        foreach y of varlist ``scale'_`w'' {
            replace r`w'`scale' = r`w'`scale' + `y' if (`touse')
        }
    }
    local scalevars `scalevars' r`w'`scale'
}

// Censor verbal fluency at 35 for this purpose
quietly replace r`w'verbal  = 35 if (r`w'verbal  > 35 & !missing(r`w'verbal))
quietly replace r`w'verbinc = 35 if (r`w'verbinc > 35 & !missing(r`w'verbinc))

// These two are not asked if illiterate. For usage as a scale as part
// of a set of covariates, we set them to zero for illiterates and
// add the illiterate dummy to the list of scales.

local scalevars `scalevars' r`w'illiterate
foreach scale in follow sent {
    quietly {
        // Use explicit summation instead of egen ... = rowtotal()
        // so that any missing makes the whole scale missing.
        replace r`w'`scale' = 0 if (`touse')
        foreach y of varlist ``scale'_`w'' {
            replace r`w'`scale' = r`w'`scale' + `y' if (`touse' & f_`y' != .l)
        }
    }
    local scalevars `scalevars' r`w'`scale'
}

label variable r`w'orient4p   "r`w'orient4p:w`w' Orientation to place (0-4)"
label variable r`w'orient4t   "r`w'orient4t:w`w' Orientation to time (0-4)"
label variable r`w'object     "r`w'object:w`w' Object naming (0-2)"
label variable r`w'verbal     "r`w'verbal:w`w' Verbal fluency (0-35)"
label variable r`w'verbinc    "r`w'verbinc:w`w' Verbal fluency incorrect words (0-35)"
label variable r`w'compu      "r`w'compu:w`w' Computation (0-2)"
label variable r`w'exec       "r`w'exec:w`w' Exec function (0-3)"
label variable r`w'recall10   "r`w'recall10:w`w' 10-Word recall (0-20)"
label variable r`w'drawpic    "r`w'drawpic:w`w' Draw picture/clock (0-4)"
label variable r`w'serial7    "r`w'serial7:w`w' Serial 7s (0-5)"
label variable r`w'bwc        "r`w'bwc:w`w' Backward counting (0-2)"
label variable r`w'illiterate "r`w'illiterate:w`w' Illiterate"
label variable r`w'follow     "r`w'follow:w`w' Read and follow command"
label variable r`w'sent       "r`w'sent:w`w' Write sentence"

return local scales `scalevars'

end
exit

// EOF
