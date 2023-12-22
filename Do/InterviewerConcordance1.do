clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

*Change the filepath name here to the folder containing the data and output folders
capture local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
capture local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

log using logs/InterviewerConcordanceCog.log, text replace

use Cog.dta

levelsof c_interid, local(interviewers)


quietly foreach var of varlist c_0-c_82 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesC `importantvariablesC' `var'
	}
}


quietly foreach var in `importantvariablesC' {
	levelsof `var' , miss
	local responses "`r(levels)'"
	quietly foreach answer in `responses' {
		local max 0
		local min 100
		quietly foreach interid in `interviewers' {
			quietly count if c_interid == `interid'
			local quotient = "`r(N)'"
			if `quotient' >= 20{
				quietly count if `var' == `answer' & c_interid == `interid'
				local frequency = "`r(N)'"
				if `frequency'/`quotient'*100 > `max' {
					local max `frequency'/`quotient'*100
				}
				if `frequency'/`quotient'*100 < `min' {
					local min `frequency'/`quotient'*100
				}
			}
		}
		if `max' - `min' >= 10 {
			local ISSUEc `ISSUEc' "`var'"
			continue, break
		}
	}
}

local ISSUEc : list uniq ISSUEc
foreach q in `ISSUEc' {
	display "`q'"
	tab `q' c_interid, miss col label
}

tab c_last c_interid, miss col label

quietly foreach interviewer in `interviewers' {
	count if (c_interid == `interviewer' & c_last ~= "c_82")
	noisily di "Interviewer " `interviewer' " has " "`r(N)'" " unfinished interviews"
}

log close
********************************************************************************

clear all 
set more off
capture log close

log using logs/InterviewerConcordanceHousehold.log, text replace

use Household.dta

levelsof h_interid, local(interviewers)


quietly foreach var of varlist h_3_1-h_7_2_5 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesH `importantvariablesH' `var'
	}
}


quietly foreach var in `importantvariablesH' {
	levelsof `var' , miss
	local responses "`r(levels)'"
	quietly foreach answer in `responses' {
		local max 0
		local min 100
		quietly foreach interid in `interviewers' {
			quietly count if h_interid == `interid'
			local quotient = "`r(N)'"
			if `quotient' >= 20{
				quietly count if `var' == `answer' & h_interid == `interid'
				local frequency = "`r(N)'"
				if `frequency'/`quotient'*100 > `max' {
					local max `frequency'/`quotient'*100
				}
				if `frequency'/`quotient'*100 < `min' {
					local min `frequency'/`quotient'*100
				}
			}
		}
		if `max' - `min' >= 10 {
			local ISSUEh `ISSUEh' "`var'"
			continue, break
		}
	}
}

local ISSUEh : list uniq ISSUEh
foreach q in `ISSUEh' {
	display "`q'"
	tab `q' h_interid, miss col label
}

tab h_last h_interid, miss col label

quietly foreach interviewer in `interviewers' {
	count if (h_interid == `interviewer' & h_last ~= "h_7_2_5")
	noisily di "Interviewer " `interviewer' " has " "`r(N)'" " unfinished interviews"
}

log close
********************************************************************************

clear all 
set more off
capture log close

log using logs/InterviewerConcordanceInfor.log, text replace

use Infor.dta

levelsof i_interid, local(interviewers)


quietly foreach var of varlist i_a2-i_lhas_54 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesI `importantvariablesI' `var'
	}
}


quietly foreach var in `importantvariablesI' {
	levelsof `var' , miss
	local responses "`r(levels)'"
	quietly foreach answer in `responses' {
		local max 0
		local min 100
		quietly foreach interid in `interviewers' {
			quietly count if i_interid == `interid'
			local quotient = "`r(N)'"
			if `quotient' >= 20{
				quietly count if `var' == `answer' & i_interid == `interid'
				local frequency = "`r(N)'"
				if `frequency'/`quotient'*100 > `max' {
					local max `frequency'/`quotient'*100
				}
				if `frequency'/`quotient'*100 < `min' {
					local min `frequency'/`quotient'*100
				}
			}
		}
		if `max' - `min' >= 10 {
			local ISSUEi `ISSUEi' "`var'"
			continue, break
		}
	}
}

local ISSUEi : list uniq ISSUEi
foreach q in `ISSUEi' {
	display "`q'"
	tab `q' i_interid, miss col label
}

tab i_last i_interid, miss col label

quietly foreach interviewer in `interviewers' {
	count if (i_interid == `interviewer' & i_last ~= "i_lhas_54")
	noisily di "Interviewer " `interviewer' " has " "`r(N)'" " unfinished interviews"
}

log close
********************************************************************************

clear all 
set more off
capture log close

log using logs/InterviewerConcordancePhys.log, text replace

use Phys.dta

levelsof p_interid, local(interviewers)


quietly foreach var of varlist p2_1-p22_2 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesP `importantvariablesP' `var'
	}
}


quietly foreach var in `importantvariablesP' {
	levelsof `var' , miss
	local responses "`r(levels)'"
	quietly foreach answer in `responses' {
		local max 0
		local min 100
		quietly foreach interid in `interviewers' {
			quietly count if p_interid == `interid'
			local quotient = "`r(N)'"
			if `quotient' >= 20{
				quietly count if `var' == `answer' & p_interid == `interid'
				local frequency = "`r(N)'"
				if `frequency'/`quotient'*100 > `max' {
					local max `frequency'/`quotient'*100
				}
				if `frequency'/`quotient'*100 < `min' {
					local min `frequency'/`quotient'*100
				}
			}
		}
		if `max' - `min' >= 10 {
			local ISSUEp `ISSUEp' "`var'"
			continue, break
		}
	}
}

local ISSUEp : list uniq ISSUEp
foreach q in `ISSUEp' {
	display "`q'"
	tab `q' p_interid, miss col label
}

tab p_last p_interid, miss col label

quietly foreach interviewer in `interviewers' {
	count if (p_interid == `interviewer' & p_last ~= "p22_2")
	noisily di "Interviewer " `interviewer' " has " "`r(N)'" " unfinished interviews"
}

log close
********************************************************************************

clear all 
set more off
capture log close

log using logs/InterviewerConcordanceSocio.log, text replace

use Socio.dta

levelsof s_interid, local(interviewers)


quietly foreach var of varlist s_1_1_p-s_15_3 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesS `importantvariablesS' `var'
	}
}


quietly foreach var in `importantvariablesS' {
	levelsof `var' , miss
	local responses "`r(levels)'"
	quietly foreach answer in `responses' {
		local max 0
		local min 100
		quietly foreach interid in `interviewers' {
			quietly count if s_interid == `interid'
			local quotient = "`r(N)'"
			if `quotient' >= 20{
				quietly count if `var' == `answer' & s_interid == `interid'
				local frequency = "`r(N)'"
				if `frequency'/`quotient'*100 > `max' {
					local max `frequency'/`quotient'*100
				}
				if `frequency'/`quotient'*100 < `min' {
					local min `frequency'/`quotient'*100
				}
			}
		}
		if `max' - `min' >= 10 {
			local ISSUEs `ISSUEs' "`var'"
			continue, break
		}
	}
}

local ISSUEs : list uniq ISSUEs
foreach q in `ISSUEs' {
	display "`q'"
	tab `q' s_interid, miss col label
}

tab s_last s_interid, miss col label

quietly foreach interviewer in `interviewers' {
	count if (s_interid == `interviewer' & s_last ~= "s_15_3")
	noisily di "Interviewer " `interviewer' " has " "`r(N)'" " unfinished interviews"
}

log close
********************************************************************************

exit, clear
