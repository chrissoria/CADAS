*!version 0.0.2 22sep2019 [EM]
program define imp_trivial, rclass

// Imputations for trivial cases:
// (1) No missings -> nothing to impute
// (2) No observations in the estimation sample -> fail
// (3) Only 1 value of the y variable -> impute this value

syntax varlist(min=1 fv ts) [if] [in] [pw fw iw aw] ///
    [, VERBose  ESAMple(name) TOIMPute(name) ]

// varlist:  variable to be imputed and covariates
// verbose:  show detailed output
// esample:  newvarname for estimation sample indicator
// toimpute: newvarname for indicator whether case needs to be imputed

// ---------------------------------------------------------------------
// Parsing the command

// Sample to use; this includes both the estimation sample and the
// cases to be imputed.
marksample touse, novarlist strok

// Dependent variable (to be imputed) and covariates
gettoken y x : varlist

// Weights, if any
local wtype `weight'
local wexp  `"`exp'"'
// We'll be using tabulate/summarize below, which do not allow pweights;
// therefore, use iweights.
local tabwgtopt
if ("`wtype'" != "") {
    local tabwgtopt `"[iweight`wexp']"'
}

// Detailed output?
local qui quietly
if ("`verbose'" != "") {
    local qui
}

// ---------------------------------------------------------------------
// (1) Imputation sample; if 0 observations we're done

if ("`toimpute'" != "") {
    local toimp `toimpute'
}
else {
    tempvar toimp
}
generate byte `toimp' = (`touse' & missing(`y'))

quietly count if (`toimp')
local ntoimp = r(N)
`qui' display as text _n "imp_trivial: `ntoimp' cases to be imputed"
if (`ntoimp' == 0) {
    display as text _n "Variable `y' has no missing values; nothing to impute"
    return scalar fail       = 0
    return scalar N_imputed  = `ntoimp'
    return scalar N_toimpute = `ntoimp'
    return scalar done       = 1
    exit
}

// ---------------------------------------------------------------------
// (2) Estimation sample; if 0 observations no imputations can be done

// We need to be able to take factor variables and weights into account.
// The easiest way to do this is to use regress.

quietly {
    tempvar ytmp
    generate double `ytmp' = rnormal() if (`touse' & !missing(`y'))
    capture regress `ytmp' `x' [`weight'`wexp'] if (`touse' & !missing(`y'))
    if ("`esample'" != "") {
        local estimsamp `esample'
    }
    else {
        tempvar estimsamp
    }
    generate byte `estimsamp' = e(sample)
    drop `ytmp'
    count if (`estimsamp')
    local nesample = r(N)
}
`qui' display as text _n "`nesample' observations in estimation sample"
if (`nesample' == 0) {
    display as error _n "No observations in the estimation sample; imputation failed"
    return scalar fail       = 1
    return scalar N_imputed  = 0
    return scalar N_toimpute = `ntoimp'
    return scalar done       = 1
    exit
}

// ---------------------------------------------------------------------
// (3) Only 1 value of the y variable

tempname ymin ymax
quietly summarize `y' if (`estimsamp')
scalar `ymin' = r(min)
scalar `ymax' = r(max)

if (`ymin' == `ymax') {
    // Only one value -> all imputed with this value
    display as text _n "Note: `y' has only one nonmissing value (" ///
        `ymin' "); all imputations have this value"
    quietly replace `y' = `ymin' if (`toimp')
    display as text _n "`ntoimp' observations imputed"
    return scalar fail       = 0
    return scalar N_imputed  = `ntoimp'
    return scalar N_toimpute = `ntoimp'
    return scalar done       = 1
    exit
}

// ---------------------------------------------------------------------
// (4) Nontrivial case

`qui' display as text _n "imp_trivial: not trivial -> nothing imputed"

return scalar N_estim    = `nesample'
return scalar N_toimpute = `ntoimp'
return scalar done       = 0

end
exit

// EOF
