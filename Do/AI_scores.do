clear all 
set more off
capture log close

*note Oct 19th an update was sent out to break out pictures for 72 and 79

capture include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

display "Initial user value: `user'"

if `"`user'"' == "Chris" {
local path = "/global/home/users/chrissoria/Desktop/Stata_CADAS/Data"
include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/final_AI_scores.csv", comma names clear
}
else if `country' == 1 {
	
	import excel using "../DR_in/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
	tostring pent_pic, replace force
	replace pent_pic = pent_pic + ".jpg" if !strpos(pent_pic, ".jpg")
	drop pent_pic_found hhid pid globalrecordid
	
	save "../DR_in/ty_pent_pic_machine_score.dta", replace
	
     forvalues i = 1/4 {
        display "Processing c_72_`i'"
        insheet using "../DR_in/final_AI_scores/c_72_`i'_machine_score.csv", comma names clear
	duplicates drop c_72_`i'_pic, force
        save "../DR_in/c_72_`i'_machine_score.dta", replace
    }
    
    forvalues i = 1/4 {
        display "Processing c_79_`i'"
        insheet using "../DR_in/final_AI_scores/c_79_`i'_machine_score.csv", comma names clear
	duplicates drop c_79_`i'_pic, force
        save "../DR_in/c_79_`i'_machine_score.dta", replace
    }
    
    insheet using "../DR_in/pent_scoring.csv", comma names clear
    keep pent_pic total_score total_score_binary
    rename total_score pent_pic_AI_score 
    rename total_score_binary pent_pic_AI_binary_score
    tostring pent_pic, replace force
    replace pent_pic = pent_pic + ".jpg" if !strpos(pent_pic, ".jpg")
    
    duplicates drop pent_pic, force
    
    save "../DR_in/pent_pic_machine_score.dta", replace
    
    use cog_merged.dta
    
    capture drop _merge
    
    merge m:1 pent_pic using "../DR_in/pent_pic_machine_score.dta", keep(master match)
    drop _merge
    
    forvalues i = 1/4 {
	merge m:1 c_72_`i'_pic using "../DR_in/c_72_`i'_machine_score.dta", keep(master match)
	drop _merge
    }
    forvalues i = 1/4 {
	merge m:1 c_79_`i'_pic using "../DR_in/c_79_`i'_machine_score.dta", keep(master match)
	drop _merge
    }
    
    save cog_merged.dta, replace
}
else if `country' == 2 {

    
}


}



