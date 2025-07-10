*! version 0.2.0  27mar2021  [EM]

program define dad_hlthspec, rclass

// Model specification for a specific health variable in the LASI-DAD data.

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

local scalelist adl bai chronic cesd iadl

// -----------------------------------------------------------------
// Include scales other than current one and from the current scale,
// variables other than the current one.

local ycovars
foreach scale of local scalelist {
    // Is current y in this scale?
    local yinscale : list y in `scale'`w'
    if (!`yinscale') {
        // No -> add scale to covariates
        local ycovars `ycovars' r`w'`scale'
    }
    else {
        // Yes -> add scale items to covariates
        local ycovars `ycovars' ``scale'`w''
        // Remove y itself
        local ycovars : list ycovars - y
    }
}

// Iteration 0 (initialization): drop covariates with missings
local droplist
if (`iter' <= 0) {
    foreach yc of varlist `ycovars' {
        quietly count if (`touse' & missing(`yc'))
        if (r(N) != 0) {
            local droplist `droplist' `yc'
        }
    }
}

// Exceptions (none here)

local ycovars : list ycovars - droplist

// Covariates to drop if estimation gives problems
if ("`y'" == "r`w'inf_parkn") {
    // One difficult variable: drop stateid as well
    local drop1 `drop1' i.r`w'stateid
}

// -----------------------------------------------------------------
// Estimation + imputation sample

// sample should not be missing, but just in case

if ("`sample'" != "") {
    quietly {
        generate byte `sample' = (`touse' & (`toimpute' | !missing(`y')))

        // Exceptions
        // No exceptions here
    }
}

// Add other y's to the list of covariates
local covariates `covariates' `ycovars'

// List of covariates for this y (including other y's)
return local covariates `covariates'

// Fallback options
if ("`drop1'" != "") {
    return scalar ndropsets = 1
    return local  drop1 `drop1'
}

end
exit

// EOF
