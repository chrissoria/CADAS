*!version 0.0.0  23apr2019 [EM]

program define sumscore
syntax varlist(min=1 numeric) [if] [in], GENerate(name)

// Compute (rowwise) sumscores; like egen ... = rowtotal(), except
// that any missing leads to a missing result.

marksample touse, novarlist strok

local vlist `varlist'
local s `generate'
confirm new variable `s'
quietly {
    generate double `s' = 0 if (`touse')
    foreach v of varlist `vlist' {
        replace `s' = `s' + `v'  // missing if v is missing
    }
    compress `s'
}

end
exit

// EOF
