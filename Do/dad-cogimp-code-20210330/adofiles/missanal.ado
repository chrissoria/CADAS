*!version 0.0.0  07feb2019 [EM]

* Analysis of missing data patterns
program define missanal, rclass
syntax [varlist] [if] [in] [, EXclude(varlist) SUMmary noPATterns ///
    TABulate(integer 9) CATegories1 CATegories2(string) ]

// varlist  : list of variables for which missingness patterns are studied (omitted = all)
// exclude  : list of variables to exclude from varlist; typical use is
//            to omit varlist (or * or _all) and exclude identifiers with this option
// summary  : if chosen, only summaries across variables are given
// patterns : if nopatterns chosen, skip mvpatterns (esp. useful when there
//            are many variables)
// tabulate : set tables/summary statistics threshold for #missings per obs;
//            default is tabulate(9) as with 'codebook'.
// categories1 : tabulate (all) missing values
// categories2 : tabulate specific (missing or otherwise) values
//            These two commands only apply to numeric variables. If both
//            are specified, categories2 is ignored without error.

// --------------------------------------------------------------
// Parse syntax

marksample touse, strok novarlist

local vlist `varlist'
if ("`vlist'" == "") {
    // Default is all variables
    unab vlist : _all
}
if ("`exclude'" != "") {
    local vlist : list vlist - exclude
}
if ("`summary'" != "") {
    local onlysum 1
}
else {
    local onlysum 0
}
if ("`patterns'" != "") {
    // Don't use mvpatterns
    local mvpattern 0
}
else {
    local mvpattern 1
}

// --------------------------------------------------------------
quietly {
    count if (`touse')
    local nobs = r(N)
}
local k : word count `vlist'

// --------------------------------------------------------------
// Missingness patterns for variables

local allmiss
local nomiss
local somemiss
foreach v of varlist `vlist' {
    quietly count if (`touse' & missing(`v'))
    if (`r(N)' == 0) {
        // no missings
        local nomiss `nomiss' `v'
    }
    else {
        quietly count if (`touse' & !missing(`v'))
        if (`r(N)' == 0) {
            // all missing
            local allmiss `allmiss' `v'
        }
        else {
            // some, but not all, missing
            local somemiss `somemiss' `v'
        }
    }
}
local nnomiss : word count `nomiss'
local nallmiss : word count `allmiss'
local nsomemiss : word count `somemiss'
display as text _n "No missings: `nnomiss'; all missing: `nallmiss'; some missing: `nsomemiss'" _n
if (!`onlysum') {
    if (`nnomiss' != 0) {
        display as text _n "Variables with no missings:" _n
        foreach v of varlist `nomiss' {
            display as result "`v'"
        }
    }
    else {
        display as text _n "No variables without missings" _n
    }

    if (`nallmiss' != 0) {
        display as text _n "Variables with all missing:" _n
        foreach v of varlist `allmiss' {
            display as result "`v'"
        }
    }
    else {
        display as text _n "No variables with only missings" _n
    }

    if (`nsomemiss' != 0) {
        display as text _n "Variables with some missings:" _n
        foreach v of varlist `somemiss' {
            display as result "`v'"
        }
    }
    else {
        display as text _n "No variables with both missings and nonmissings" _n
    }

    display as text _n "Variable report:" _n
    mdesc `vlist' if (`touse'), abbreviate(30)
}

if (`mvpattern') {
    display as text _n "Missing data patterns:" _n
    mvpatterns `vlist' if (`touse')
}

// --------------------------------------------------------------
// Missingness patterns for observations

tempvar nrmiss nrnonmiss
quietly {
    egen int `nrmiss'    = rowmiss(`vlist') if (`touse')
    egen int `nrnonmiss' = rownonmiss(`vlist') if (`touse'), strok

    count if (`touse' & `nrmiss' == 0)
    local nobsnomiss = r(N)
    count if (`touse' & `nrnonmiss' == 0)
    local nobsallmiss = r(N)
    count if (`touse' & `nrmiss' != 0 & `nrnonmiss' != 0)
    local nobssomemiss = r(N)
}
display as text _n "Obs with no missings: `nobsnomiss'" ///
    "; all missing: `nobsallmiss'; some missing: `nobssomemiss'" _n

// Distribution of number of missings and number of nonmissings
quietly levelsof `nrmiss' if (`touse')
local ncatnrmiss = r(r)
display as text _n "Distribution of the number of missings:"
if (`ncatnrmiss' > `tabulate') {
    summarize `nrmiss' if (`touse'), detail
}
else {
    tabulate `nrmiss' if (`touse'), missing
}
quietly levelsof `nrnonmiss' if (`touse')
local ncatnrnonmiss = r(r)
display as text _n "Distribution of the number of nonmissings:"
if (`ncatnrnonmiss' > `tabulate') {
    summarize `nrnonmiss' if (`touse'), detail
}
else {
    tabulate `nrnonmiss' if (`touse'), missing
}

// --------------------------------------------------------------
// Table of missingness categories per variable.

// list of numeric variables
local nvlist

if ("`categories1'" != "") {

    // All missing categories; first create a list of which missing
    // categories are in the data. Note that cat1 overrides cat2.
    local categories2
    foreach v of varlist `vlist' {
        capture confirm numeric variable `v'
        if (_rc == 0) {
            local nvlist `nvlist' `v'
            quietly levelsof `v' if (`touse' & missing(`v')) ///
                , missing local(mcat)
            local categories2 : list categories2 | mcat
        }
    }
    local categories2 : list sort categories2
    if ("`categories2'" == "") {
        display as error _n "No missings in numeric variables; no tabulation of categories" _n
    }
}
else if ("`categories2'" != "") {
    foreach v of varlist `vlist' {
        capture confirm numeric variable `v'
        if (_rc == 0) {
            local nvlist `nvlist' `v'
        }
    }
}

// Now tabulate
if ("`categories2'" != "") {
    local ncat : word count `categories2'
    local currlinesize = c(linesize)
    local totalwidth = 20 + 2 + 8 * `ncat' + 9
    if (`totalwidth' > 254) {
        // Doesn't fit; can only happen if user requests a large number of
        // numeric categories
        local totalwidth 254
    }
    if (`currlinesize' < `totalwidth') {
        set linesize `totalwidth'
    }

    display as text _n "Tabulation of missing categories per variable"
    local namesopt names(all)
    foreach v of varlist `nvlist' {
        tab1m `v' if (`touse'), missing categories(`categories2') totals(rows) ///
             lines(none) twidth(20) format(%6.0f) linesize(`totalwidth') `namesopt'
        local namesopt names(rows) noblank
    }

    if (`currlinesize' < `totalwidth') {
        set linesize `currlinesize'
    }
}

// --------------------------------------------------------------
// Return results
return local somemiss `somemiss'
return local allmiss `allmiss'
return local nomiss `nomiss'
return scalar k = `k'
return scalar N = `nobs'

// --------------------------------------------------------------
end
exit

// EOF
