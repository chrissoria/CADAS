clear all 
set more off
capture log close
log using InformationDoorMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
*   use using "C:\Users\Ty\Desktop\Cuba DTA files\Cog.dta", clear
   



replace d_0 = .i if (d_0 == . | d_0 == .a)
*check if si and no are 0/1 or 1/2 for this question (affects logic on following questions)

replace d_15 = .i if (d_15 == . | d_15 == .a) & (d_0 == 2 | d_0 == .i)
replace d_15 = .v if (d_15 == . | d_15 == .a) & d_0 == 1

replace d_1 = .i if (d_1 == . | d_1 == .a) & d_0 == 1
replace d_1 = .v if (d_1 == . | d_1 == .a) & d_0 == 2

replace d_2 = .i if (d_2 == . | d_2 == .a) & d_0 == 1
replace d_2 = .v if (d_2 == . | d_2 == .a) & d_0 == 1

replace d_3 = .i if (d_3 == . | d_3 == .a) & d_0 == 1
replace d_3 = .v if (d_3 == . | d_3 == .a) & d_0 == 1

replace d_4 = .i if (d_4 == . | d_4 == .a) & d_0 == 1
replace d_4 = .v if (d_4 == . | d_4 == .a) & d_0 == 1

replace d_5 = .i if (d_5 == . | d_5 == .a) & d_0 == 1
replace d_5 = .v if (d_5 == . | d_5 == .a) & d_0 == 1

replace d_6 = .i if (d_6 == . | d_6 == .a) & d_0 == 1
replace d_6 = .v if (d_6 == . | d_6 == .a) & d_0 == 1

replace d_7_1 = .i if (d_7_1 == . | d_7_1 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_1 = .v if (d_7_1 == . | d_7_1 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_2 = .i if (d_7_2 == . | d_7_2 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_2 = .v if (d_7_2 == . | d_7_2 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_3 = .i if (d_7_3 == . | d_7_3 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_3 = .v if (d_7_3 == . | d_7_3 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_4 = .i if (d_7_4 == . | d_7_4 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_4 = .v if (d_7_4 == . | d_7_4 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_5 = .i if (d_7_5 == . | d_7_5 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_5 = .v if (d_7_5 == . | d_7_5 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))



capture log close
log using InformationDoorMissingCodebook, text replace

codebook

   save InformationDoorMissing, replace


log close
log using InformationDoorOnlyMissing, text replace

local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

log close
exit, clear
