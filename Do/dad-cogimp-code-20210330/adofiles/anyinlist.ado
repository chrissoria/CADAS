*!version 0.0.0  23feb2019 [EM]

* Is any of the variables equal to an element of a list of categories?
program define anyinlist
syntax [varlist] [if] [in] , CATegories(string) GENerate(name)

// varlist:    list of variables for which to check
// if/in:      observations to check
// categories: values to check
// generate:   binary variable that indicates whether any of varlist is
//               equal to any of categories

local vlist `varlist'
marksample touse, novarlist strok
local anyc `generate'
quietly generate byte `anyc' = 0 if (`touse')
foreach v of varlist `vlist' {
    foreach c in `categories' {
        quietly replace `anyc' = 1 if (`touse' & `v' == `c')
    }
}

end
exit

// EOF
