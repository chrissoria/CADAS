*!version 0.0.1 18may2020 [EM]
program define rdraws, rclass
syntax varlist , IDentifiers(varlist) drawfile(string) ///
    [ generate(namelist) stub(string) redraw ]

// Read or generate random draws and save to a datafile. If the file
// already exists, the draws are updated if redraw is requested and left
// alone otherwise.

// varlist     is the list of variables that need random draws
// identifiers is the list of identifiers
// drawfile    is the file that contains (or will contain) the draws
// redraw      If chosen, any existing draws are discarded and replaced by
//             new draws. If drawfile does not exist yet, new draws are
//             generated and save regardless of redraw, and if one or more
//             of the draw variables do not exist yet, they are added to
//             the drawfile regardless of redraw.

// generate is the list of flags to be generated (one per original variable)
// stub is a stub for the flags to be generated (string to be prepended)
//   If neither generate nor stub is chosen, a stub of "u_" is used.
//   If both are chosen, generate takes precedence.

local vlist `varlist'
local ulist `generate'

if ("`stub'" == "") {
    local stub u_
}
if ("`ulist'" == "") {
    foreach v of varlist `vlist' {
        local ulist `ulist' `stub'`v'
    }
}
if ("`redraw'" == "") {
    local redraw 0
}
else {
    local redraw 1
}

// Merge with file with random draws, if it exists
tempfile tempdraws
capture confirm file `"`drawfile'"'
if (_rc == 0) {
    // Only the variables we need, if they exist in the file
    quietly {
        preserve
        use `"`drawfile'"', clear
        describe _all, varlist
        local dlist `r(varlist)'
        local keeplist : list ulist & dlist
        keep `identifiers' `keeplist'
        save "`tempdraws'", replace
        restore
    }

    merge 1:1 `identifiers' using `"`tempdraws'"'
    drop _merge
}
else {
    // Make sure drawfile exists
    quietly {
        preserve
        keep `identifiers'
        drop if (1) // Drop all observations, but keep the identifier variables
        save `"`drawfile'"', replace
        restore
    }
}

// So now we have (a subset of) the random draws merged in. Replace them
// with new draws if a redraw is requested, and generate any variables
// that don't exist.

local updatedraws 0  // Whether draws file needs to be updated.
foreach y of varlist `vlist' {
    capture confirm variable u_`y'
    if (_rc == 0) {
        if (`redraw') {
            quietly replace u_`y' = runiform()
            local updatedraws 1
        }
    }
    else {
        // Generate random draws once
        quietly generate double u_`y' = runiform()
        label variable u_`y' "Random draw for imp of `y'"
        local updatedraws 1
    }
}

// Save draws to drawfile if they have been newly generated.
if (`updatedraws') {
    preserve
    // Save draws to tempfile
    keep `identifiers' `ulist'
    save "`tempdraws'", replace

    // Read draws file and drop draw variables that are to be updated
    use `"`drawfile'"', clear
    foreach u of local ulist {
        capture drop `u'
    }

    // Add the new draws
    merge 1:1 `identifiers' using "`tempdraws'"
    drop _merge
    save `"`drawfile'"', replace
    restore
}

return local draws `ulist'

end
exit

// EOF
