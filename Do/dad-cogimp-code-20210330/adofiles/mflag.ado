*!version 0.0.0 03apr2019 [EM]
program define mflag, rclass
syntax varlist [if] [in] [, generate(namelist) stub(string) ]

// Create simple missingness flag: "1" if not missing, otherwise copy the
// original variable.
// varlist is the list of variables that need flags
// namelist is the list of flags to be generated (one per original variable)
// stub is a stub for the flags to be generated (string to be prepended)
//   either generate or stub should be used. If none, this program does not
//   do anything; if both, generate takes precedence.

local vlist `varlist'
local glist `generate'

marksample touse, novarlist strok

if ("`glist'" != "") {
    local genl  1
    local stubl 0
}
else {
    local genl 0
    if ("`stub'" != "") {
        local stubl 1
    }
    else {
        local stubl 0
    }
}

local flist
if (`genl' | `stubl') {
    local j 0
    foreach v of varlist `vlist' {
        local ++j
        if (`genl') {
            local f : word `j' of `glist'
        }
        else {
            local f `stub'`v'
        }
        local flist `flist' `f'
        quietly {
            clonevar `f' = `v' if (`touse' & missing(`v'))
            label variable `f' "`f': Missing values of `v'"
    
            capture confirm numeric variable `v'
            if (_rc == 0) {
                // Numeric variable
                replace `f' = 1 if (`touse' & !missing(`v'))
            }
            else {
                // String variable
                replace `f' = "1" if (`touse' & !missing(`v'))
            }
        }
    }
    quietly compress `flist'
}

return local flags `flist'

end
exit

// EOF
