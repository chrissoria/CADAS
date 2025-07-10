*!version 0.0.0 01apr2019 [EM]
program define tab1miss
syntax varlist [if] [in] [fw pw iw aw] [, * ]

// Tabulate missings, plus "1" if not missing

local vlist `varlist'

marksample touse, novarlist strok
local wtype `weight'
local wexp  `"`exp'"'
if ("`wtype'" == "") {
    local wtopt
}
else {
    local wtopt `"[`wtype'`wexp']"'
}

preserve
foreach v of varlist `vlist' {
    capture confirm numeric variable `v'
    if (_rc == 0) {
        // Numeric variable
        quietly replace `v' = 1 if (!missing(`v'))
    }
    else {
        // String variable; probably doesn't work, but let tab1m throw the error.
        quietly replace `v' = "1" if (!missing(`v'))
    }
}
quietly compress `vlist'
display as text _n "Tabulation of missingness and missings:"
tab1m `vlist' if (`touse') `wtopt' , `options' missing
restore

end
exit

// EOF
