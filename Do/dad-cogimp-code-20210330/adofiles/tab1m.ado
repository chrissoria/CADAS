*! version 0.0.2  07feb2019
program define tab1m, byable(recall)

// Multiple one-way tables in 1 table, where all variables have the same
// (potential) values. The current version only does frequencies.

version 9.2

syntax varlist [if] [in] [fw pw iw aw] [, missing TOTals2(string) noTOTals ///
    matcell(name) matrow(name) varstring(string) valstring(string) ///
    categories(string) * ]

// missing : display missing codes as additional categories (suppress if not
//           requested, as in tabulate)
// totals(rows)    : display row totals
// totals(columns) : display column totals
// totals(all)     : display row and column totals (default)
// totals(none)    : don't display totals
// nototals        : same as totals(none)
// matcell, matrow : as in tabulate, but now for all variables jointly
// varstring : string of labels, 1 per variable, to be used for the rows
//           of the table (default is the variable names)
// valstring : string of value labels for the columns (default is the
//           values themselves with "." replaced by "_")
// categories : numlist or matrix with category codes that should be
//           presented. Default is all categories that gave at least 1
//           obs in any of the variables.
// [later add keep and drop to fine tune]

// process if and in
marksample touse, novarlist

// process weights
local wgtopt
if ("`weight'" != "") {
    tempvar wgt
    local wgtopt [`weight'`exp']
}

// variable list
local vlist `varlist'
local nvars : word count `vlist'

// Capture the case where there are no observations
quietly count if (`touse')
local nobs = r(N)
if (`nobs' == 0 & "`categories'" == "") {
    if (`"`varstring'"' == `""') {
        local varstring `vlist'
    }
    foreach v in `varstring' {
        display as text "`v' : no observations"
    }
    exit
}

// matlist options
local matlistopts `options'

// Adapted from names parsing of matlist.ado
if ("`totals'" != "" & `"`totals2'"' != "") {
    display as error "totals and totals() are exclusive"
    exit 198
}
if ("`totals'" != "") {
    local show_rowtotals = 0
    local show_coltotals = 0
}
else {
    ParseTotals `totals2'
    local show_rowtotals = inlist("`s(totals)'", "all", "rows")
    local show_coltotals = inlist("`s(totals)'", "all", "columns")
}

// do all oneway tables and store the category codes and frequencies
local cats
local cells
local vnum = 0
foreach v of varlist `vlist' {
    local ++vnum
    // tempname cat_`v' cell_`v' // crashes on long variable names; therefore:
    tempname cat`vnum' cell`vnum'
    quietly tabulate `v' `wgtopt' if (`touse'), `missing' ///
        matrow(`cat`vnum'') matcell(`cell`vnum'')
    // Note: if there are no observations, cat<i> and cell<i> are not filled.
    // We have to account for this below.
    local cats  `cats'  `cat`vnum''
    local cells `cells' `cell`vnum''
}

// make a master list of categories

tempname allcats
if (`"`categories'"' == `""') {
    MergeCats `cats'
    capture confirm matrix r(merged)
    if (_rc == 0) {
        matrix `allcats' = r(merged)
    }
    else {
        display as result "no observations"
        exit 2000
    }
}
else {
    capture confirm matrix `"`categories'"'
    if (_rc == 0) {
        // categories is a matrix
        matrix `allcats' = `categories'
    }
    else { // categories is a numlist; possibly with missing codes
        local ncats : word count `categories'
        forvalues j=1/`ncats' {
            local catj : word `j' of `categories'
            matrix `allcats' = (nullmat(`allcats') \ `catj')
        }
    }
}

local ncats = rowsof(`allcats')

// insert zeros for empty categories so that all rows align, and combine
// all results in one matrix

tempname allcells
local m = 0
foreach c in `cats' {
    local ++m
    local freqs : word `m' of `cells'
    ExpandMat `allcats' `c' `freqs'
    matrix `allcells' = (nullmat(`allcells'), `freqs')
}

// Transpose: variables in rows, categories in columns
matrix `allcells' = (`allcells')'

// Row and column labels
if (`"`varstring'"' != `""') {
    local rlabs `varstring'
}
else {
    local rlabs `vlist'
}
matrix rownames `allcells' = `rlabs'

if (`"`valstring'"' != `""') {
    local clabs `valstring'
}
else {
    local clabs
    forvalues c=1/`ncats' {
        local cc = `allcats'[`c',1]
        local clabs `clabs' `cc'
    }
    local clabs : subinstr local clabs "." "_", all
}
matrix colnames `allcells' = `clabs'

// Add totals, if requested
tempname printmat
matrix `printmat' = `allcells'
if (`show_rowtotals') {
    tempname rtots
    local ncol = colsof(`printmat')
    matrix `rtots' = `printmat' * J(`ncol', 1, 1)
    matrix `printmat' = (`printmat', `rtots')
    matrix colnames `printmat' = `clabs' Total
}
if (`show_coltotals') { 
    tempname ctots
    local nrow = rowsof(`printmat')
    matrix `ctots' = J(1, `nrow', 1) * `printmat'
    matrix `printmat' = (`printmat' \ `ctots')
    matrix rownames `printmat' = `rlabs' Total
}

// Print results
matlist `printmat', `matlistopts' nohalf


// Return category codes and frequencies if requested
if ("`matrow'" != "") {
    matrix `matrow' = `allcats'
}
if ("`matcell'" != "") {
    matrix `matcell' = `allcells'
}

end

//-----------------------------------------------
program define MergeCats, rclass

// Merge category codes from multiple ordered lists (column vectors as 
// matrices) of category codes.

version 9.2

// How many matrices?
local nmat : word count `0'

// Names of matrices
forvalues i=1/`nmat' {
    local m`i' : word `i' of `0'
}

tempname merged
capture matrix drop `merged'

// Merge with next matrix; MergeMat deals with empty matrices.
forvalues i=1/`nmat' {
    MergeMat `merged' `m`i''
}

// Check for empty result.
capture confirm matrix `merged'
if (_rc == 0) {
    return matrix merged = `merged'
}

end

//-----------------------------------------------
program define MergeMat

// Merge 2 matrices and store the result in the first one (which is thus
// overwritten). 

version 9.2
args m1 m2

// If one of them does not exist, the result is the other.
capture confirm matrix `m1'
local ismatrix1 = (_rc == 0)
capture confirm matrix `m2'
local ismatrix2 = (_rc == 0)

if (!`ismatrix1' & !`ismatrix2') {
    // Nothing to return; but m1 is already nothing, so that's fine.
    exit
}
else if (!`ismatrix2') {
    // Return m1, i.e., leave it unchanged.
    exit
}
else if (!`ismatrix1') {
    // m1 is not a matrix, but m2 is, so return m2.
    matrix `m1' = `m2'
    exit
}

// So now both m1 and m2 are bona fide matrices.

tempname m3

local n1 = rowsof(`m1')
local n2 = rowsof(`m2')

local i = 1
local j = 1

tempname x y
while (`i' <= `n1' & `j' <= `n2') {
    scalar `x' = `m1'[`i',1]
    scalar `y' = `m2'[`j',1]
    if (`x' < `y') {
        matrix `m3' = (nullmat(`m3') \ `x')
        local ++i
    }
    else if (`x' == `y') {
        matrix `m3' = (nullmat(`m3') \ `x')
        local ++i
        local ++j
    }
    else { // if (`x' > `y')
        matrix `m3' = (nullmat(`m3') \ `y')
        local ++j
    }
}

if (`i' <= `n1') { // m2 exhausted, m1 not
    forvalues k=`i'/`n1' {
        scalar `x' = `m1'[`k',1]
        matrix `m3' = (nullmat(`m3') \ `x')
    }
}

if (`j' <= `n2') { // m1 exhausted, m2 not
    forvalues k=`j'/`n2' {
        scalar `y' = `m2'[`k',1]
        matrix `m3' = (nullmat(`m3') \ `y')
    }
}

matrix `m1' = `m3'

end

//-----------------------------------------------
program define ExpandMat

version 9.2
args mastercat slavecat slavecell

// mastercat = column vector (matrix) with category codes
// slavecat  = column vector (matrix) with category codes
// slavecell = column vector (matrix) with category frequencies corresponding
//             to slavecat
//
// This program computes a column vector (matrix) with category frequencies
// from slavecell, corresponding to mastercat, filling in zeros for
// categories that are empty.

local m1 `mastercat'
local n1 = rowsof(`m1')

// slavecat and slavecell may be empty, but they're always empty at the
// same time.

capture confirm matrix `slavecell'
if (_rc != 0) {
    matrix `slavecell' = J(`n1',1,0)
    exit
}

// So now slavecat and slavecell are not empty.

local m2 `slavecat'
local x2 `slavecell'
local n2 = rowsof(`m2') // = rowsof(`x2')

// Initialize result to zero matrix of the desired dimensions
tempname x1
matrix `x1' = J(`n1',1,0)

tempname y1 y2 ny
local  j = 1 // index in m2
scalar `y2' = `m2'[`j',1]
scalar `ny' = `x2'[`j',1]

forvalues i=1/`n1' {
    scalar `y1' = `m1'[`i',1]
    // Move down in m2 until a value >= y1 is found
    while (`y2' < `y1' & `j' < `n2') {
        local ++j
        scalar `y2' = `m2'[`j',1]
        scalar `ny' = `x2'[`j',1]
    }
    if (`y2' == `y1') {
        matrix `x1'[`i',1] = `ny'
    }
}

matrix `slavecell' = `x1'

end

//-----------------------------------------------
// Adapted from ParseNames in matlist.ado

program ParseTotals, sclass

local 0 ,`0'
syntax [, All Columns Rows None ]

local opt `all' `columns' `rows' `none'
if ("`opt'" == "") {
    local opt all
}
opts_exclusive "`opt'" totals

sreturn clear
sreturn local totals `opt'

end

//-----------------------------------------------

