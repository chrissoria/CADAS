*!version 0.0.0  22sep2019 [EM]

* Create a list of missing categories used in a list of variables
program define misscats, rclass
syntax [varlist] [if] [in] [, EXclude(varlist) ]

// varlist  : list of variables for which missingness patterns are studied (omitted = all)
// exclude  : list of variables to exclude from varlist; typical use is
//            to omit varlist (or * or _all) and exclude identifiers with this option

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

// list of numeric variables
local nvlist
// list of missingness categories used
local categories
foreach v of varlist `vlist' {
    capture confirm numeric variable `v'
    if (_rc == 0) {
        local nvlist `nvlist' `v'
        quietly levelsof `v' if (`touse' & missing(`v')) ///
            , missing local(mcat)
        local categories : list categories | mcat
    }
}
local categories : list sort categories

// --------------------------------------------------------------
// Return results
return local categories `categories'

// --------------------------------------------------------------
end
exit

// EOF
