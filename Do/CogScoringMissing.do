clear all 
set more off
capture log close
log using CogScoringMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
*   use using "C:\Users\Ty\Desktop\Cuba DTA files\Cog.dta", clear
   

replace cs_32 = .i if (cs_32 == . | cs_32 == .a) & (c_32 ~= 6 & c_32 ~= 7)
replace cs_32 = .v if (cs_32 == . | cs_32 == .a) & (c_32 == 6 | c_32 == 7)

replace cs_40 = .i if (cs_40 == . | cs_40 == .a) & (c_40 ~= 0 & c_40 ~= 777)
replace cs_40 = .v if (cs_40 == . | cs_40 == .a) & (c_40 == 0 | c_40 == 777)

replace cs_41 = .i if (cs_41 == . | cs_41 == .a) & (c_40 ~= 0 & c_40 ~= 777)
replace cs_41 = .v if (cs_41 == . | cs_41 == .a) & (c_40 == 0 | c_40 == 777)

replace cs_43 = .i if (cs_43 == . | cs_43 == .i) & (c_43 ~= 0 & c_43 ~= 666 & c_43 ~= 777)
replace cs_43 = .v if (cs_43 == . | cs_43 == .i) & (c_43 == 0 | c_43 == 666 | c_43 == 777)

replace cs_44 = .i if (cs_44 == . | cs_44 == .i) & (c_43 ~= 0 & c_43 ~= 666 & c_43 ~= 777)
replace cs_44 = .v if (cs_44 == . | cs_44 == .i) & (c_43 == 0 | c_43 == 666 | c_43 == 777)

replace cs_72_1 = .i if (cs_72_1 == . | cs_72_1 == .i) & (c_72_1 ~= 6 & c_72_1 ~= 7)
replace cs_72_1 = .v if (cs_72_1 == . | cs_72_1 == .i) & (c_72_1 == 6 | c_72_1 == 7)

replace cs_72_2 = .i if (cs_72_2 == . | cs_72_2 == .i) & (c_72_2 ~= 6 & c_72_2 ~= 7)
replace cs_72_2 = .v if (cs_72_2 == . | cs_72_2 == .i) & (c_72_2 == 6 | c_72_2 == 7)

replace cs_72_3 = .i if (cs_72_3 == . | cs_72_3 == .i) & (c_72_3 ~= 6 & c_72_3 ~= 7)
replace cs_72_3 = .v if (cs_72_3 == . | cs_72_3 == .i) & (c_72_3 == 6 | c_72_3 == 7)

replace cs_72_4 = .i if (cs_72_4 == . | cs_72_4 == .i) & (c_72_4 ~= 6 & c_72_4 ~= 7)
replace cs_72_4 = .v if (cs_72_4 == . | cs_72_4 == .i) & (c_72_4 == 6 | c_72_4 == 7)

replace cs_79_1 = .i if (cs_79_1 == . | cs_79_1 == .i) & (c_79_1 ~= 6 & c_79_1 ~= 7)
replace cs_79_1 = .v if (cs_79_1 == . | cs_79_1 == .i) & (c_79_1 == 6 | c_79_1 == 7)

replace cs_79_2 = .i if (cs_79_2 == . | cs_79_2 == .i) & (c_79_2 ~= 6 & c_79_2 ~= 7)
replace cs_79_2 = .v if (cs_79_2 == . | cs_79_2 == .i) & (c_79_2 == 6 | c_79_2 == 7)

replace cs_79_3 = .i if (cs_79_3 == . | cs_79_3 == .i) & (c_79_3 ~= 6 & c_79_3 ~= 7)
replace cs_79_3 = .v if (cs_79_3 == . | cs_79_3 == .i) & (c_79_3 == 6 | c_79_3 == 7)

replace cs_79_4 = .i if (cs_79_4 == . | cs_79_4 == .i) & (c_79_4 ~= 6 & c_79_4 ~= 7)
replace cs_79_4 = .v if (cs_79_4 == . | cs_79_4 == .i) & (c_79_4 == 6 | c_79_4 == 7)



capture log close
log using CogScoringMissingCodebook, text replace

codebook

   save CogScoringMissing, replace


log close
log using CogScoringOnlyMissing, text replace

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
