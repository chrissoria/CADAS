*! version 2.2.1  29oct2020  [EM]
program imp_chainplus, rclass

// Impute using a chained method. This allows
// - Recomputing derived variables between imputations of different variables
// - Different model/imputation types for different variables
// - Different covariates for different variables
// - Different samples for different variables

syntax varlist(numeric) [if] [in] [pw aw iw fw] ///
    , DRAWs(varlist numeric) MODELs(string) ///
    [ TOIMPute(varlist numeric) COVARiates(varlist numeric fv ts) ///
      YCOVars(varlist numeric fv ts) DROP1(varlist numeric fv ts) ///
      noINITialize MAXIter(integer 10) ///
      UPDatederived(string) SPECprog(string) ]

// varlist    : variables that have to be imputed
// if/in      : observations that are used (either in estimation or imputation)
// weights    : allowed
// draws      : uniform pseudo-random draws in variables corresponding to
//              each variable in varlist
// models     : type of imputation model, e.g., ologit
// toimpute   : one binary variable for each variable in varlist, indicating
//              whether it needs to be imputed (1) or not (0); if omitted,
//              toimpute are those cases with missing variable
// covariates : always nonmissing covariates that are used in all models
// ycovars    : variables that take the place of the y variables as
//              additional covariates. This is intended to be of the form
//              i.y, where y is a variable that is part of the chain, so
//              y could be categorical, imputed using mlogit, and then
//              used as a categorical covariate for the other variables that
//              need to be imputed. This is, however, not checked.
//              If omitted, `varlist' is used.
// drop1      : subset of covariates & ycovars that is dropped from the
//              model after the initial model failed.
// initialize : If 'noinitialize' is chosen, imputations have already been
//              initialized, so there shouldn't be any missings in them and
//              which ones need to be imputed *must* be indicated in the
//              toimpute option. In this case, iteration 0 is skipped.
//              The default is that initialization is done in iteration 0,
//              in which elements of `ycovars' (or `varlist', if `ycovars'
//              is omitted) that have missings are dropped from the model.
//              If a specprog is defined (see below), that is supposed to
//              handle initialization and this option has no effect beyond
//              starting at iteration 0 or 1.
// maxiter    : number of iterations in the chain
// updatederived : name of program for initializing/updating derived variables
//              before and between imputations
// specprog   : name of program that delivers the specification of the
//              imputation for a specific variable
//
// updatederived:
//   syntax varlist [if] [in] [pw iw fw aw] [, initialize current(varname) ///
//     prev(varname) toimp(varname) iter(integer) ]
// where varlist is the list of all variables that are imputed, current
// is the current value of the latest imputed one, prev is the previous
// value of that same variable, toimp is the subset that needs imputation
// (more precisely: `touse' & `toimp' need imputation), iter is the
// iteration number (esp. useful for 0 vs positive), and initialize flags
// that the derived variables need to be initialized (generated).
//
// specprog:
//   syntax varname [if] [in] [pw iw fw aw] ///
//       [ , DRAWs(varlist numeric) MODEL(string) ///
//       TOIMPute(varname numeric) COVARiates(varlist numeric fv ts) ///
//       YCOVars(varlist numeric fv ts) DROP1(varlist numeric fv ts) ///
//       MAXIter(integer 10) ITER(integer -1) SAMPle(name) ]
// with most options copied from the options to this program, varname
// being the specific variable that is imputed, i.e., one item from this
// program's varlist, and analogously for model and toimpute. sample may
// be a further reduction of the estimation/imputation sample (output variable).
//
// specprog is rclass and should return
//   r(covariates) : list of covariates for this y (including other y's)
//   r(mtype) [optional]: model type; default is the model type given above
//   r(ndropsets) [optional]: number of sets of variables to be dropped
//     sequentially in case of imputation fail
//   r(drop`d'), d=1..`ndropsets': lists of variables for each dropset
//   r(add`d'), d=1..`ndropsets': lists of variables to add for each dropset (typically replacements)

marksample touse, novarlist

local yvars `varlist'
local xvars `covariates'

if ("`weight'" != "") {
    local wtopt `"[`weight'`exp']"'
}
else {
    local wtopt
}

// Which observations need to be imputed?
if ("`toimpute'" == "") {
    foreach y of varlist `yvars' {
        tempvar ti_`y'
        quietly generate byte `ti_`y'' = (`touse' & missing(`y'))
        local toimpute `toimpute' `ti_`y''
    }
}

// How are y variables used as covariates? Default: linearly
if ("`ycovars'" == "") {
    local ycovars `yvars'
}

if ("`initialize'" != "") { // i.e., it is "noinitialize"
    local init 0
}
else {
    local init 1
}

// Sets of covariates to be dropped if estimation/imputation failed
local dropsets
forvalues d=1/1 { // Could add more fallback options later
    if ("`drop`d''" != "") {
        local dropsets `dropsets' `d'
    }
}

local ny : word count `yvars'
forvalues i=1/`ny' {
    local y         : word `i' of `yvars'
    local mtype_`y' : word `i' of `models'
    local u_`y'     : word `i' of `draws'
    local toimp_`y' : word `i' of `toimpute'
    local c_`y'     : word `i' of `ycovars'
}

// -------------------------------------------------------------------

// Initialize derived variables, if any
if ("`updatederived'" != "") {
    `updatederived' `yvars' if (`touse') `wtopt', initialize
}

// Iterate
tempvar yprev samp toimpy
local done 0
if (`init') {
    // Initialization requested: start iterating at 0
    local iter -1
}
else {
    // No initialization requested: start iterating at 1
    local iter 0
}

while (!`done' & `iter' < `maxiter') {
    local ++iter

    display as text _n "--------------------------------------------------"
    display as text    "Iteration # `iter'"
    display as text    "--------------------------------------------------" _n

    // All values the same as in the previous iteration?
    local allsame 1

    foreach y of varlist `yvars' {
        display as text _n "--------------------------------------------------"
        display as text    "[`iter'] y = `y'" _n

        // Which cases need to be imputed? May be changed by specprog below.
        quietly {
            clonevar `toimpy' = `toimp_`y'' if (`touse')
            replace `toimpy' = 0 if (!`touse')
        }

        if ("`specprog'" != "") {
            // Run program that delivers specification; feed it with any
            // settings we already have (which may or may not be ignored)

            capture drop `samp'
            `specprog' `y' if (`touse') `wtopt', model(`mtype_`y'')   ///
                draws(`u_`y'') covariates(`xvars') ycovars(`ycovars') ///
                drop1(`drop1') toimp(`toimpy') samp(`samp')           ///
                iter(`iter') maxiter(`maxiter')

            // Model type
            local mtype `r(mtype)'
            // Covariates; if this is empty, leave it, because that could
            // be a legitimate specification.
            local covariates `r(covariates)'
            // Fallback options: incrementally dropping sets of covariates.
            // Again, if this is empty, leave it.
            local ndropsets  `r(ndropsets)'
            local dropsetsy
            if ("`ndropsets'" != "") {
                if (`ndropsets' > 0 & !missing(`ndropsets')) {
                    forvalues d=1/`ndropsets' {
                        local drop`d'y `r(drop`d')'
                        local add`d'y  `r(add`d')'
                        local dropsetsy `dropsetsy' `d'
                    }
                }
            }

            // If not specified, use the default
            if ("`mtype'" == "") {
                local mtype `mtype_`y''
            }
            // Sample
            capture confirm variable `samp'
            if (_rc != 0) {
                display as text _n "!!!! samp not defined !!!!" _n
                // Not generated by specprog -> replace with default
                quietly clonevar `samp' = `touse'
            }

            display as text "y = `y'; covariates = `covariates'"
        }
        else {
            // No specprog defined; build specification

            // If this is an initialization, drop y variables that still
            // have missings from the list of covariates.
            local ycovars2 `ycovars'
            if (`init' & `iter' == 0) {
                foreach xy of varlist `yvars' {
                    // Any missings?
                    quietly count if (`touse' & missing(`xy'))
                    if (r(N) != 0) {
                        local ycovars2 : list ycovars2 - c_`xy'
                    }
                }
            }

            // Covariates: all x and y vars except current y

            local covariates `xvars' `ycovars2'
            local covariates : list covariates - c_`y'

            // Sample
            quietly clonevar `samp' = `touse'

            // Model type
            local mtype `mtype_`y''

            // Drop sets for fallback options
            local dropsetsy `dropsets'
            foreach d of local dropsetsy {
                local drop`d'y `drop`d''
            }
        }

        quietly {
            // Remove previous imputation of y
            clonevar `yprev' = `y' if (`samp' & `toimpy')
            replace `y'      = .   if (`samp' & `toimpy')
        }

        // Imputation
        capture noisily imp_`mtype' `y' `covariates' `wtopt' if (`samp') ///
            , rand(`u_`y'') // verbose

        quietly count if (`samp' & `toimpy' & missing(`y'))
        local nn = r(N)
        if (`nn' != 0) {
            display as error _n _n "!!!! FAILED IMPUTATION !!!!" _n

            // Fallbacks: imputation with fewer covariates
            local xlist `covariates'
            foreach d of local dropsetsy {
                if (`nn' != 0) {
                    capture noisily `mtype'

                    display as text _n "Fallback `d'"
                    local droplist `drop`d'y'
                    local addlist  `add`d'y'
                    display as text "Dropping `droplist'"
                    local xlist : list xlist - droplist
                    // First drop then add
                    if ("`addlist'" != "") {
                        display as text "Adding `addlist'"
                        local xlist `xlist' `addlist'
                    }

                    // Imputation
                    capture noisily imp_`mtype' `y' `xlist' `wtopt' if (`samp') ///
                        , rand(`u_`y'') // verbose

                    quietly count if (`samp' & `toimpy' & missing(`y'))
                    local nn = r(N)
                }
            }

            if (`nn' != 0) {
                `mtype'

                summarize `y' `yprev' `xlist' `toimpy' `samp' if (`samp')
                if (`iter' == 0) {
                    display as text _n "Final fallback: imputation without covariates"
                    capture noisily imp_`mtype' `y' `wtopt' if (`samp') ///
                        , rand(`u_`y'') // verbose
                }
                else {
                    display as text _n "Final fallback: copy previous value"
                    quietly replace `y' = `yprev' if (`samp' & `toimpy' & missing(`y'))
                }
            }
            else {
                display as text _n "Successful imputation"
            }
        }
        else {
            display as text _n "Successful imputation"
        }

        quietly count if (`samp' & `toimpy' & `y' != `yprev')
        if (r(N) != 0) {
            // If there are values that changed in this iteration, then...
            local allsame 0

            // Update derived variables, if any
            if ("`updatederived'" != "") {
                `updatederived' `yvars' if (`touse') `wtopt', current(`y') ///
                    prev(`yprev') toimp(`toimpy') iter(`iter')
            }
        }

        drop `samp' `yprev' `toimpy'

    } // end loop over yvars

    if (`allsame' & `iter' > 0) {
        // Nothing changed in this iteration -> we're done
        display as text _n "No changes in this iteration; converged" _n
        local done 1
    }
} // end iterations

return scalar iter = `iter'
return scalar done = `done'

end
exit

// EOF
