*!version 0.0.2 22sep2019 [EM]
program define imp_simplefrac, rclass

// Impute a categorical variable using simple fractions

syntax varlist(min=1 max=2) [if] [in] [pw fw iw aw] ///
    [, RAND(varname numeric) VERBose ]

// varlist:    categorical variable to be imputed and an optional
//             categorical covariate
// rand:       variable with draws from a uniform(0,1) distribution
// verbose:    show detailed output

// ---------------------------------------------------------------------
// Parsing the command

// Sample to use; this includes both the estimation sample and the
// cases to be imputed.
marksample touse, novarlist strok

// Dependent variable (to be imputed) and covariate
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

// Create a dummy x if no x was given
if ("`x'" == "") {
    tempvar dummy
    quietly generate byte `dummy' = 1 if (`touse')
    local x `dummy'
}

// Categories of x with nonzero weight
tempname xcats
quietly tabulate `x' `tabwgtopt' if (`touse'), matrow(`xcats')
local ncatx = rowsof(`xcats')

// Categories of the dependent variable
tempname ycats
quietly tabulate `y' `tabwgtopt' if (`touse'), matrow(`ycats')
local ncaty = rowsof(`ycats')

// Probabilities
local plist
forvalues j=1/`ncaty' {
    quietly {
        tempvar p`j'
        generate double `p`j'' = 0 if (`touse')
        local plist `plist' `p`j''
    }
}

tempvar estimsamp2 toimp2

local totalfail = 0
local nimp = 0
forvalues k=1/`ncatx' {
    // Value of category k of x
    local xcat = `xcats'[`k',1]

    // Handle conditionally trivial cases
    // (1) No missings -> nothing to impute
    // (2) No observations in the estimation sample -> fail
    // (3) Only 1 value of the y variable -> impute this value

    capture drop `estimsamp2'
    capture drop `toimp2'
    imp_trivial `y' `x' if (`touse' & `x' == `xcat') [`weight'`exp'] ///
        , `verbose' esample(`estimsamp2') toimpute(`toimp2')

    local done2   = r(done)
    local ntoimp2 = r(N_toimpute)
    if (`done2') {
        local fail2 = r(fail)
        if (`fail2' == 1) {
            local totalfail = 1
        }

        local nimp2 = r(N_imputed)
        if (`nimp2' != . & `nimp' > 0) {
            local nimp = `nimp' + `nimp2'
        }
    }
    else {
        // Nontrivial cases for x = xcat
        tempname ycats2 ycounts2 ycounts2b

        // Distribution of y for x = xcat
        quietly tabulate `y' if (`touse' & `x' == `xcat') `tabwgtopt' ///
            , matrow(`ycats2') matcell(`ycounts2')

        // Expand matrix to include absent categories with zero counts
        ExpandMatrix `ycounts2' `ycats2' `ycounts2b' `ycats'

        // Transform matrix of counts to matrix of probabilities
        Freq2Prob `ycounts2b'

        // Store probabilities in variables

        forvalues j=1/`ncaty' {
            quietly replace `p`j'' = `ycounts2b'[`j',1] if (`toimp2')
        }
    }
} // end forvalues k : next category of x

// Impute category
local randopt
if ("`rand'" != "") {
    local randopt "rand(`rand')"
}
imp_cat `y' `plist' if (`toimp'), categories(`ycats') `randopt' `verbose'

local fail   = r(fail)
local nimp   = r(N_imputed)
local ntoimp = r(N_toimpute)
local nnoimp = r(N_notimputed)

return scalar fail         = `fail'
return scalar N_notimputed = `nnoimp'
return scalar N_imputed    = `nimp'
return scalar N_toimpute   = `ntoimp'

end

// -------------------------------------------------------------------

program define ExpandMatrix
args narrowcounts narrowcats broadcounts broadcats

// Given three column vectors:
// broadcats    contains the categories of variable y in the population
// narrowcats   contains the categories of y in a subpopulation;this could
//              be a strict subset of broadcats
// narrowcounts contains the frequencies of narrowcats of y in the
//              subpopulation
//
// This program computes the frequencies of broadcats of y in the
// subpopulation. So this has the same number of rows as broadcats, and
// if broadcats[j] = narrowcats[i], then broadcounts[j] = narrowcounts[i],
// but if broadcats[j] does not occur in narrowcats, then broadcounts[j] = 0.

// Dimensions
local nb = rowsof(`broadcats')
local nn = rowsof(`narrowcats')

if (`nb' == `nn') {
    // Assume categories are the same, as they should be given how they
    // are constructed above.
    matrix `broadcounts' = `narrowcounts'
}
else {
    // Strict subset.

    // Initializing matrix
    matrix `broadcounts' = 0 * `broadcats'

    local j = 1
    local bcat = `broadcats'[`j',1]
    forvalues i=1/`nn' {
        local ncat = `narrowcats'[`i',1]
        while (`bcat' < `ncat') {
            local ++j
            local bcat = `broadcats'[`j',1]
        }
        // Now we must have bcat = ncat
        assert (`bcat' == `ncat')
        matrix `broadcounts'[`j',1] = `narrowcounts'[`i',1]
    }
}
end

// -------------------------------------------------------------------

program define Freq2Prob
args v
// Transform column vector of counts to matrix of probabilities

local nrow = rowsof(`v')

// Compute sum
tempname s
scalar `s' = 0
forvalues r=1/`nrow' {
    scalar `s' = `s' + `v'[`r',1]
}
// Divide frequencies by sum
forvalues r=1/`nrow' {
    matrix `v'[`r',1] = `v'[`r',1]/`s'
}

end

// -------------------------------------------------------------------

exit

// EOF
