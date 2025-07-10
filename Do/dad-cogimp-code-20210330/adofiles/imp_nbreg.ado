*!version 0.0.1 13may2019 [EM]
program define imp_nbreg, rclass

// Impute a count variable using a negative binomial regression model

syntax varlist(min=1 fv ts) [if] [in] [pw fw iw aw] ///
    [, ITERations(integer 100) RAND(varname numeric) VERBose * ]

// varlist:    variable to be imputed and covariates
// iterations: max number of iterations in nbreg; we don't impute if
//             convergence has not been reached
// verbose:    show detailed output
// rand:       variable with draws from a uniform(0,1) distribution
// * :         (other) nbreg options

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

// Estimate nbreg model
capture noisily `qui' nbreg `y' `x' [`weight'`exp'] ///
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

// Random draws
if ("`rand'" != "") {
    // Variable with random draws supplied
    quietly count if (`toimp' & !(0 <= `rand' & `rand' <= 1))
    local nnou = r(N)
    if (`nnou' != 0) {
        display as error _n "`rand' has `nnou' observations outside [0,1] interval; no imputations done"
        return scalar fail = 1
        return scalar N_notimputed = `ntoimp'
        return scalar N_imputed    = 0
        return scalar N_toimpute   = `ntoimp'
        exit
    }

    local u `rand'
}
else {
    tempvar u
    quietly generate double `u' = runiform() if (`toimp')
}

// Loop over y=0, 1, ... until all imputable cases are imputed.
quietly {
    tempvar xb toimp2 probltk probk

    predict double `xb' if (`toimp') // This is to exclude cases that can't be imputed
    generate byte `toimp2' = (!missing(`xb'))
    generate double `probltk' = 0  if (`toimp2') // Pr(y < k) with k=0

    count if (`toimp2')
    local ntodo = r(N)
    local k = 0
    while (`ntodo' > 0) {
        predict double `probk', pr(`k')

        // Impute if Pr(y < `k') <= u < Pr(y <= `k')
        replace `y' = `k' if (`toimp2' ///
            & `probltk' <= `u' & `u' < `probltk' + `probk' ///
            & !missing(`probltk') & !missing(`probk'))

        count if (`toimp2' & missing(`y'))
        local ntodo = r(N)

        local ++k
        replace `probltk' = `probltk' + `probk'
        drop `probk'
    }
} // end quietly


// How many have we imputed and how many have failed? (The latter could
// happen if there are missings in `x'.)

quietly {
    count if (`toimp' & !missing(`y'))
    local nimp = r(N)
    count if (`toimp' & missing(`y'))
    local nnoimp = r(N)
}

display as text _n "`nimp' observations imputed"
if (`nimp' == 0) {
    return scalar fail = 1
}
else {
    return scalar fail = 0
}
if (`nnoimp' != 0) {
    display as error "`nnoimp' observations not imputed"
    return scalar N_notimputed = `nnoimp'
    return scalar fail = 1
}
return scalar N_imputed  = `nimp'
return scalar N_toimpute = `ntoimp'

end
exit

// EOF
