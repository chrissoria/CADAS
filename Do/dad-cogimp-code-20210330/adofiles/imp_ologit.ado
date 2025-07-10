*!version 0.0.1 30apr2019 [EM]
program define imp_ologit, rclass

// Impute an ordinal variable using an ordered logit model

syntax varlist(min=1 fv ts) [if] [in] [pw fw iw aw] ///
    [, ITERations(integer 100) RAND(varname numeric) VERBose * ]

// varlist:    variable to be imputed and covariates
// iterations: max number of iterations in logit; we don't impute if
//             convergence has not been reached
// verbose:    show detailed output
// rand:       variable with draws from a uniform(0,1) distribution
// * :         (other) ologit options

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
// We'll be using tabulate below, which does not allow pweights; therefore,
// use iweights.
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
// Handle trivial cases
// (1) No missings -> nothing to impute
// (2) No observations in the estimation sample -> fail
// (3) Only 1 value of the y variable -> impute this value

tempvar estimsamp toimp
imp_trivial `y' `x' if (`touse') [`weight'`exp'], `verbose' ///
    esample(`estimsamp') toimpute(`toimp')
local done   = r(done)
local ntoimp = r(N_toimpute)
if (`done') {
    local fail = r(fail)
    local nimp = r(N_imputed)
    return scalar fail       = `fail'
    return scalar N_imputed  = `nimp'
    return scalar N_toimpute = `ntoimp'
    exit
}
else {
    local nesample = r(N_estim)
}

// ---------------------------------------------------------------------
// Nontrivial cases

// Estimate logit model
capture noisily `qui' ologit `y' `x' [`weight'`exp'] ///
    if (`estimsamp'), iter(`iterations') `options'

if (_rc != 0) {
    display as error _n "Estimation failed; no imputations done"
    return scalar fail       = 1
    return scalar N_imputed  = 0
    return scalar N_toimpute = `ntoimp'
    exit
}

if (e(converged) == 0) {
    display as error _n "No convergence achieved; no imputations done"
    return scalar fail       = 1
    return scalar N_imputed  = 0
    return scalar N_toimpute = `ntoimp'
    exit
}

// ---------------------------------------------------------------------
// Categories of the dependent variable
tempname ycats
matrix `ycats' = (e(cat))'  // Organize as column vector, as matrow option of tabulate
local ncat = e(k_cat)

// Probabilities
local plist
quietly {
    forvalues j=1/`ncat' {
        tempvar p`j'
        predict double `p`j'' if (`toimp'), pr outcome(#`j')
        local plist `plist' `p`j''
    }
}

// Impute category
local randopt
if ("`rand'" != "") {
    local randopt "rand(`rand')"
}
imp_cat `y' `plist' if (`toimp'), categories(`ycats') `randopt'

local fail   = r(fail)
local nimp   = r(N_imputed)
local ntoimp = r(N_toimpute)
local nnoimp = r(N_notimputed)

return scalar fail         = `fail'
return scalar N_notimputed = `nnoimp'
return scalar N_imputed    = `nimp'
return scalar N_toimpute   = `ntoimp'

end
exit

// EOF
