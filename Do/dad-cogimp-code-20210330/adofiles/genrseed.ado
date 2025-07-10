*!version 0.1.0  11may2019 [EM]

program define genrseed, rclass

// Generating a random seed. (For replicability.)

syntax [using/] [, LOGfile(string) ]

// using: data file containing random seed. If it exists, this program
//     simply reads it. We may add a 'force' option later to force
//     regenerating the seed file.
// logfile: log file in which the random seed will also be displayed.
//     use logfile(filename, replace) if it may already exist and may be
//     overwritten.

// Default seed file name
if ("`using'" == "") {
    local rseedfile "rseed.dta"
}
else {
    local rseedfile : copy local using
}


// Default log file name and replace option
if ("`logfile'" == "") {
    local logfile "genrseed.log"
    local replace
}
else {
    local 0 `logfile'
    syntax [ anything ] [ , replace ]
    if ("`anything'" == "") {
        local logfile "genrseed.log"
    }
    else {
        local logfile : copy local anything
    }
}


// Check whether seed file already exists. If so, do nothing.
// (Don't overwrite logfile either in that case.)

capture confirm file `"`rseedfile'"'
if (_rc == 0) {
    display as text _n `"Random seed file "`rseedfile'" already exists; not regenerated"'
    quietly {
        preserve
        // read random seed
        use `"`rseedfile'"', clear
        local rseed = rseed[1]
        restore
    }
    display as text _n "Random seed: |`rseed'|" _n
}
else {
    // Open a (second) log file
    tempname seedlog
    log using `"`logfile'"' , text `replace' name(`seedlog')
    Generate_Seed
    local rseed `r(seed)'
    // Write to data file
    quietly {
        preserve
        set obs 1
        generate str rseed = "`rseed'"
        saveold `"`rseedfile'"', version(13)
        restore
    }
    display as text _n "Random seed: |`rseed'|" _n
    log close `seedlog'
}

return local seed "`rseed'"

end

//-------------------------------------------------------------------------
program Generate_Seed, rclass

// Program to transform current date and time to a numeric value, so be
// used as a random seed.

version 9.2

local Mons     `c(Mons)'         // List of short months.
local curtime  `c(current_time)' // Time in "16:59:57" form.
local curdate  `c(current_date)' // Date in "01 Mar 2007" form.

// Replace colons by spaces in time
local curtime : subinstr local curtime ":" " ", all

// Extract hours, minutes, and seconds from curtime.
local nhms : word count `curtime'
if (`nhms' != 3) {
    display as error _n ///
        `"Current time does not appear to contain separate hours, "'
    display as error `"minutes, and seconds ("`curtime'")"' _n
    exit 198
}
local curhrs   : word 1 of `curtime'
local curmins  : word 2 of `curtime'
local cursecs  : word 3 of `curtime'

// Extract day, month, year from curdate.
local ndmy : word count `curdate'
if (`ndmy' != 3) {
    display as error _n ///
        `"Current date does not appear to contain separate day, "'
    display as error `"month, and year ("`curdate'")"' _n
    exit 198
}
local curday   : word 1 of `curdate'
local curmonth : word 2 of `curdate'
local curyear  : word 3 of `curdate'

// Transform month to number:
local nmonth : word count `Mons' // Should be 12 I guess.
if (`nmonth' != 12) {
    display as error _n ///
        `"Number of Month abbreviations does not equal 12"'
    display as error `""`Mons'")"' _n
    exit 198
}
local month_no = 0
forvalues m=1/`nmonth' {
    local month_m : word `m' of `Mons'
    if ("`curmonth'" == "`month_m'") {
        local month_no = `m'       // Month as number.
    }
}

tempname seednum
scalar `seednum' = `curyear' - 2000
scalar `seednum' = 12 * `seednum' + `month_no' - 1
scalar `seednum' = 31 * `seednum' + `curday'   - 1
scalar `seednum' = 24 * `seednum' + `curhrs'
scalar `seednum' = 60 * `seednum' + `curmins'
scalar `seednum' = 60 * `seednum' + `cursecs'
scalar `seednum' = `seednum' + 1
local seedmac = round(`seednum')

return local seed "`seedmac'"

end // Generate_Seed
//---------------------------------------------------------------------

exit

// EOF
