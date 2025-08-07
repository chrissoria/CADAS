clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

*Change the filepath name here to the folder containing the data and output folders
capture local path = "/Users/chrissoria/documents/CADAS/Data"
*capture local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

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
set linesize 120

use Cog.dta

* Dropping obs before November 8th 2023
gen c_date_temp = date(c_date, "YMD")
format c_date_temp %tdCCYY/nn/dd
drop if c_date_temp < date("20231108", "YMD")

levelsof c_interid, local(interviewers)

*****************************************************************************
* Show the percentiles for time taken for each interviewer
* TEMPORARY NOTE: I CHANGED NEGATIVE TIMES, SUMMARY TIMES >100minutes, AND TOTAL TIME >200minutes TO "." TO COMBAT OUTLIERS
quietly replace c_ThreeWordDelay = . if (c_ThreeWordDelay < 0 | c_ThreeWordDelay > 100)
quietly replace c_TenWordDelay = . if (c_TenWordDelay < 0 | c_TenWordDelay > 100)
quietly replace c_TenWordRecognition = . if (c_TenWordRecognition < 0 | c_TenWordRecognition > 100)
quietly replace c_Story1Delay = . if (c_Story1Delay < 0 | c_Story1Delay > 100)
quietly replace c_Story2Delay = . if (c_Story2Delay < 0 | c_Story2Delay > 100)
quietly replace c_FigureDelay = . if (c_FigureDelay < 0 | c_FigureDelay > 100)
quietly replace c_TotalTime = . if (c_TotalTime < 0 | c_TotalTime > 200)

sort c_interid
by c_interid: summarize c_ThreeWordDelay c_TenWordDelay c_TenWordRecognition c_Story1Delay c_Story2Delay c_FigureDelay c_TotalTime , detail

*****************************************************************************
* Tabulate questions where any 2 interviewers (with >20 interviews) have at least a 10% difference for a response
quietly foreach var of varlist c_0-c_82 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesC `importantvariablesC' `var'
	}
}


if `country' != 0 {
    quietly foreach var of local importantvariablesC {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if c_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 20 {
                    quietly count if `var' == `answer' & c_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEc `ISSUEc' "`var'"
                continue, break
            }
        }
    }
}
else if `country' == 0 {
    quietly foreach var of local importantvariablesC {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if c_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 5 {
                    quietly count if `var' == `answer' & c_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEc `ISSUEc' "`var'"
                continue, break
            }
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
set linesize 120

use Household.dta

* Dropping obs before November 8th 2023
gen h_date_temp = date(h_date, "YMD")
format h_date_temp %tdCCYY/nn/dd
drop if h_date_temp < date("20231108", "YMD")

levelsof h_interid, local(interviewers)

*****************************************************************************
* Show the percentiles for time taken for each interviewer
* TEMPORARY NOTE: I CHANGED NEGATIVE TIMES AND TOTAL TIME >200minutes TO "." TO COMBAT OUTLIERS
quietly replace h_TotalTime = . if (h_TotalTime < 0 | h_TotalTime > 200)

sort h_interid
by h_interid: summarize h_TotalTime , detail

*****************************************************************************
* Tabulate questions where any 2 interviewers (with >20 interviews) have at least a 10% difference for a response
quietly foreach var of varlist h_3_1-h_7_2_5 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesH `importantvariablesH' `var'
	}
}


if `country' != 0 {
    quietly foreach var of local importantvariablesH {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if h_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 20 {
                    quietly count if `var' == `answer' & h_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEh `ISSUEh' "`var'"
                continue, break
            }
        }
    }
}
else if `country' == 0 {
    quietly foreach var of local importantvariablesH {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if h_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 5 {
                    quietly count if `var' == `answer' & h_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEh `ISSUEh' "`var'"
                continue, break
            }
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
set linesize 120

use Infor.dta

* Dropping obs before November 8th 2023
gen i_date_temp = date(i_date, "YMD")
format i_date_temp %tdCCYY/nn/dd
drop if i_date_temp < date("20231108", "YMD")

levelsof i_interid, local(interviewers)

*****************************************************************************
* Show the percentiles for time taken for each interviewer
* TEMPORARY NOTE: I CHANGED NEGATIVE TIMES AND TOTAL TIME >200minutes TO "." TO COMBAT OUTLIERS
quietly replace i_TotalTime = . if (i_TotalTime < 0 | i_TotalTime > 200)

sort i_interid
by i_interid: summarize i_TotalTime , detail

*****************************************************************************
* Tabulate questions where any 2 interviewers (with >20 interviews) have at least a 10% difference for a response
quietly foreach var of varlist i_a2-i_lhas_54 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesI `importantvariablesI' `var'
	}
}


if `country' != 0 {
    quietly foreach var of local importantvariablesI {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if i_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 20 {
                    quietly count if `var' == `answer' & i_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEi `ISSUEi' "`var'"
                continue, break
            }
        }
    }
}
else if `country' == 0 {
    quietly foreach var of local importantvariablesI {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if i_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 5 {
                    quietly count if `var' == `answer' & i_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEi `ISSUEi' "`var'"
                continue, break
            }
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
set linesize 120

use Phys.dta

* Dropping obs before November 8th 2023
gen p_date_temp = date(p_date, "YMD")
format p_date_temp %tdCCYY/nn/dd
drop if p_date_temp < date("20231108", "YMD")

levelsof p_interid, local(interviewers)

*****************************************************************************
* Show the percentiles for time taken for each interviewer
* TEMPORARY NOTE: I CHANGED NEGATIVE TIMES AND TOTAL TIME >200minutes TO "." TO COMBAT OUTLIERS
quietly replace p_TotalTime = . if (p_TotalTime < 0 | p_TotalTime > 200)

sort p_interid
by p_interid: summarize p_TotalTime , detail

*****************************************************************************
* Tabulate questions where any 2 interviewers (with >20 interviews) have at least a 10% difference for a response
quietly foreach var of varlist p2_1-p22_2 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesP `importantvariablesP' `var'
	}
}


if `country' != 0 {
    quietly foreach var of local importantvariablesP {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if p_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 20 {
                    quietly count if `var' == `answer' & p_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEp `ISSUEp' "`var'"
                continue, break
            }
        }
    }
}
else if `country' == 0 {
    quietly foreach var of local importantvariablesP {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if p_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 5 {
                    quietly count if `var' == `answer' & p_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEp `ISSUEp' "`var'"
                continue, break
            }
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
set linesize 120

use Socio.dta

* Dropping obs before November 8th 2023
gen s_date_temp = date(s_date, "YMD")
format s_date_temp %tdCCYY/nn/dd
drop if s_date_temp < date("20231108", "YMD")

levelsof s_interid, local(interviewers)

*****************************************************************************
* Show the percentiles for time taken for each interviewer
* TEMPORARY NOTE: I CHANGED NEGATIVE TIMES AND TOTAL TIME >200minutes TO "." TO COMBAT OUTLIERS
quietly replace s_TotalTime = . if (s_TotalTime < 0 | s_TotalTime > 200)

sort s_interid
by s_interid: summarize s_TotalTime , detail

*****************************************************************************
* Tabulate questions where any 2 interviewers (with >20 interviews) have at least a 10% difference for a response
quietly foreach var of varlist s_1_1_p-s_15_3 {
	local x : type `var'
	if "`x'" == "long" {
		local importantvariablesS `importantvariablesS' `var'
	}
}


if `country' != 0 {
    quietly foreach var of local importantvariablesS {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if s_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 20 {
                    quietly count if `var' == `answer' & s_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEs `ISSUEs' "`var'"
                continue, break
            }
        }
    }
}
else if `country' == 0 {
    quietly foreach var of local importantvariablesS {
        levelsof `var', miss
        local responses `r(levels)'
        foreach answer of local responses {
            local max = 0
            local min = 100
            foreach interid of local interviewers {
                quietly count if s_interid == `interid'
                local quotient = r(N)
                
                if `quotient' >= 5 {
                    quietly count if `var' == `answer' & s_interid == `interid'
                    local frequency = r(N)
                    local percentage = `frequency' / `quotient' * 100
                    local max = max(`max', `percentage')
                    local min = min(`min', `percentage')
                }
            }
            if `max' - `min' >= 10 {
                local ISSUEs `ISSUEs' "`var'"
                continue, break
            }
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
