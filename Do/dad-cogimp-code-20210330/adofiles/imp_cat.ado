*!version 0.0.2 22sep2019 [EM]
program define imp_cat, rclass

// Impute categorical variable with given nontrivial probabilities
// (i.e. >= 2 categories with positive probabilities)
// Typically used as part of an imputation program that uses logit
// models etc.

syntax varlist(min=3) [if] [in] , CATegories(name) [ RAND(varname numeric) VERBose ]

// varlist:    variable to be imputed and probabilities for each of k categories
// categories: matrix (column vector) with the category values of the k categories
// rand:       variable with draws from a uniform(0,1) distribution
// verbose:    show detailed output

// ---------------------------------------------------------------------

// Sample to use; this typically only includes the cases to be imputed.
marksample touse, novarlist strok

// Dependent variable (to be imputed) and probabilities
gettoken y plist : varlist

local ycats `categories'

// Detailed output?
local qui quietly
if ("`verbose'" != "") {
    local qui
}


// ---------------------------------------------------------------------

tempvar toimp
quietly {
    generate byte `toimp' = (`touse' & missing(`y'))
    count if (`toimp')
    local ntoimp = r(N)
}
`qui' display as text _n "imp_cat: `ntoimp' cases to be imputed"

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

// Cumulative probability of previous category, i.e., Pr(y < cat)
tempvar cumprev
quietly generate double `cumprev' = 0 if (`toimp')

tempname yval
local ncat = rowsof(`ycats')
assert (`ncat' >= 2)
local ncm1 = `ncat' - 1
forvalues cat=1/`ncm1' {
    // y value for category `cat'; this is usually `cat' but allows
    // categorical variables with categories other than 1..K

    scalar `yval' = `ycats'[`cat',1]

    // Probability of category `cat', Pr(y = `yval')
    local curr : word `cat' of `plist'

    quietly {

        // Impute if Pr(y < `yval') <= u < Pr(y <= `yval')
        replace `y' = `yval' if (`toimp' ///
            & `cumprev' <= `u' & `u' < `cumprev' + `curr' ///
            & !missing(`cumprev') & !missing(`curr'))

        // Pr(y <= `yval')
        replace `cumprev' = `cumprev' + `curr' if (`toimp')
    }
}

// Last category
scalar `yval' = `ycats'[`ncat',1]

// Impute if Pr(y < `yval') <= u <= 1
quietly replace `y' = `yval' if (`toimp' & `cumprev' <= `u' & !missing(`cumprev'))

// How many have we imputed and how many have failed? (The latter could
// happen if there are missings in `x'.)

quietly {
    count if (`toimp' & !missing(`y'))
    local nimp = r(N)
    count if (`toimp' & missing(`y'))
    local nnoimp = r(N)
}

`qui' display as text _n "imp_cat: `nimp' observations imputed"
if (`nimp' == 0) {
    return scalar fail = 1
}
else {
    return scalar fail = 0
}
if (`nnoimp' != 0) {
    `qui' display as error "imp_cat: `nnoimp' observations not imputed"
    return scalar N_notimputed = `nnoimp'
    return scalar fail = 1
}
return scalar N_imputed  = `nimp'
return scalar N_toimpute = `ntoimp'

end
exit

// EOF
