*!version 0.0.0  23feb2019 [EM]

* Recode missings (typically .d) to 0 (incorrect)
program define recode0
syntax [varlist] [if] [in] , CATegories(string)

// varlist:    list of variables for which to recode
// if/in:      observations to recode
// categories: values to recode

local vlist `varlist'
marksample touse, novarlist strok
display as text _n "Before recoding"
tab1m `vlist' if (`touse'), categories(0 `categories') missing
foreach v of varlist `vlist' {
    foreach c in `categories' {
        quietly replace `v' = 0 if (`touse' & `v' == `c')
    }
}

display as text _n "After recoding"
tab1m `vlist' if (`touse'), categories(0 `categories') missing

end
exit

// EOF
