*!version 0.0.1  27mar2019 [EM]

* Missing value patterns; before and after recoding selected missings to zeros
program define mvpatterns_em, sortpreserve
syntax [varlist] [if] [in] [, TABulate(varlist) IDentifiers(varlist) ///
    incorrect(string) detail ]

// varlist:     list of variables for which to check
// if/in:       observations to check
// tabulate:    list of variables to tabulate
// identifiers: list of identifier variables (for sorting & listing)
// incorrect:   list of categories that is to be recoded to 0 (incorrect)
// detail:      distinguish patterns by type of special missing

marksample touse, novarlist strok

local vlist `varlist'
if ("`vlist'" == "") {
    unab vlist : _all
}

if ("`tabulate'" != "") {
    local tlist `tabulate'
    local tab 1
}
else {
    local tab 0
}
local idlist `identifiers'


if (`tab') {
    tab1m `tlist' if (`touse'), missing
}

sort `touse' `vlist' `idlist'

// Check for refusals
tempvar anyrf
anyinlist `vlist' if (`touse'), cat(.r) generate(`anyrf')
quietly count if (`touse' & `anyrf' == 1)
local nanyrf = r(N)
if (`nanyrf' != 0) {
    display as text _n "`nanyrf' cases with at least one refusal"
    if (`tab') {
        tab1m `tlist' if (`touse' & `anyrf' == 1), missing
    }
    if (`nanyrf' <= 100) {
        list `idlist' `vlist' if (`touse' & `anyrf' == 1), clean noobs nolabel
    }
}
else {
    display as text _n "No refusals"
}

if ("`incorrect'" != "") {
    display as text _n "Missing value patterns before recoding" _n
    if ("`detail'" != "") {
        DetPat `vlist' if (`touse')
    }
    else {
        mvpatterns `vlist' if (`touse'), nodrop
    }
    recode0 `vlist' if (`touse'), categories(`incorrect')
    display as text _n "Missing value patterns after recoding to 0" _n
    if ("`detail'" != "") {
        DetPat `vlist' if (`touse')
    }
    else {
        mvpatterns `vlist' if (`touse'), nodrop
    }
}
else {
    display as text _n "Missing value patterns" _n
    if ("`detail'" != "") {
        DetPat `vlist' if (`touse')
    }
    else {
        mvpatterns `vlist' if (`touse'), nodrop
    }
}

tempvar nmiss
quietly {
    egen int `nmiss' = rowmiss(`vlist') if (`touse')
    count if (`touse' & `nmiss' != 0)
}
if (`r(N)' != 0 & `r(N)' <= 100) {
    list `idlist' `vlist' if (`touse' & `nmiss' != 0), clean noobs nolabel
}

end

// ------------------------------------------------------------------
program define DetPat
syntax varlist [if] [in]

// Detailed missingness patterns

marksample touse, novarlist strok

local vlist `varlist'

preserve
foreach v of varlist `vlist' {
    capture confirm numeric variable `v'
    if (_rc == 0) {
        quietly replace `v' = 1 if (`touse' & !missing(`v'))
    }
    else {
        quietly replace `v' = "1" if (`touse' & !missing(`v'))
    }
}

tempvar first nobs obsno
generate long `obsno' = _n
sort `touse' `vlist' `obsno'
by `touse' `vlist': generate byte `first' = (_n == 1)
by `touse' `vlist': generate long `nobs' = _N
char define `nobs'[varname] nobs
format `nobs' %15.0fc
gsort `touse' - `nobs' + `vlist' `obsno'
list `vlist' `nobs' if (`touse' & `first'), clean noobs nolabel subvarname

restore

end
exit

// EOF
