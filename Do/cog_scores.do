clear all 
set more off
capture log close

*note Oct 19th an update was sent out to break out pictures for 72 and 79

capture include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
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
    *insheet using "../PR_in/final_AI_scores.csv", comma names clear
}
else if `country' == 1 {
	
	import excel using "../DR_in/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
	tostring pent_pic, replace force
	replace pent_pic = pent_pic + ".jpg" if !strpos(pent_pic, ".jpg")
	rename cs_40_ty pent_pic_score_ty
	drop pent_pic_found hhid pid globalrecordid
	
	save "../DR_in/ty_pent_score.dta", replace
	
	import excel using "../DR_in/ty_4_image_scoring_in_DR.xlsx", firstrow allstring clear
	foreach var in c_72_1_pic c_72_2_pic c_72_3_pic c_72_4_pic c_79_1_pic c_79_2_pic c_79_3_pic c_79_4_pic {
		tostring `var', replace force
		replace `var' = `var' + ".jpg"
		preserve
		keep `var' `var'_ty
		drop if `var'_ty == ""
		save "../DR_in/`var'_image_scoring_in_DR.dta", replace
		restore
	}

	save "../DR_in/ty_4_image_scoring_in_DR.dta", replace
	
	clear

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
    tostring pent_pic, replace format(%20.0f) force
    replace pent_pic = pent_pic + ".jpg" if !strpos(pent_pic, ".jpg")
    keep pent_pic total_score total_score_binary
    rename total_score pent_pic_AI_score 
    rename total_score_binary pent_pic_AI_binary_score
    
    duplicates drop pent_pic, force
    
    save "../DR_in/pent_pic_machine_score.dta", replace
    
    use cog_merged.dta
    tostring pent_pic, replace format(%20.0f) force
    
    capture drop _merge
    *merging in AI pent scores
    merge m:1 pent_pic using "../DR_in/pent_pic_machine_score.dta", keep(master match)
    drop _merge
    
    merge m:1 pent_pic using "../DR_in/ty_pent_score.dta", keep(master match)
    drop _merge

    *merging in AI scores for 72_n
    forvalues i = 1/4 {
	merge m:1 c_72_`i'_pic using "../DR_in/c_72_`i'_machine_score.dta", keep(master match)
	drop _merge
    }
    *merging in Ty's scores for 72_n
    forvalues i = 1/4 {
	merge m:1 c_72_`i'_pic using "../DR_in/c_72_`i'_pic_image_scoring_in_DR.dta", keep(master match)
	drop _merge
    }
    *merging in AI scores for 79_n
    forvalues i = 1/4 {
	merge m:1 c_79_`i'_pic using "../DR_in/c_79_`i'_machine_score.dta", keep(master match)
	drop _merge
    }
    forvalues i = 1/4 {
	merge m:1 c_79_`i'_pic using "../DR_in/c_79_`i'_pic_image_scoring_in_DR.dta", keep(master match)
	drop _merge
    }
}
    
else if `country' == 2 {

    
}


}

save cog_merged_all_scores.dta, replace
    
    *create a file that's only scores
 rename c_79_2_ai_score c_79_2_score_ai
 rename c_79_3_ai_score c_79_3_score_ai
 rename c_79_4_ai_score c_79_4_score_ai
 rename pent_pic_AI_score pent_pic_score_ai
 rename pent_pic_AI_binary_score pent_pic_score_binary_ai
 
foreach var in 72_1 72_2 72_3 72_4 79_1 79_2 79_3 79_4 {
    rename c_`var' c_`var'_score_interviewer
}

rename cs_32 c_32_score_interviewer

foreach var in c_72_1 c_72_2 c_72_3 c_72_4 c_79_1 c_79_2 c_79_3 c_79_4{
	rename `var'_pic_ty `var'_score_ty
} 

    
keep globalrecordid pid pent_pic c_32_score_interviewer pent_pic_score_ty pent_pic_score_ai pent_pic_score_binary_ai ///
c_72_1_pic c_72_1_score_interviewer c_72_1_score_ty c_72_1_ai_score c_72_1_ai_score_strict ///
c_72_2_pic c_72_2_score_interviewer c_72_2_score_ty c_72_2_ai_score ///
c_72_3_pic c_72_3_score_interviewer c_72_3_score_ty c_72_3_ai_score ///
c_72_4_pic c_72_4_score_interviewer c_72_4_score_ty c_72_4_ai_score ///
c_79_1_pic c_79_1_score_interviewer c_79_1_score_ty c_79_1_score_ai ///
c_79_2_pic c_79_2_score_interviewer c_79_2_score_ty c_79_2_score_ai ///
c_79_3_pic c_79_3_score_interviewer c_79_3_score_ty c_79_3_score_ai ///
c_79_4_pic c_79_4_score_interviewer c_79_4_score_ty c_79_4_score_ai 

order globalrecordid pid pent_pic c_32_score_interviewer pent_pic_score_ty pent_pic_score_ai pent_pic_score_binary_ai ///
c_72_1_pic c_72_1_score_interviewer c_72_1_score_ty c_72_1_ai_score c_72_1_ai_score_strict ///
c_72_2_pic c_72_2_score_interviewer c_72_2_score_ty c_72_2_ai_score ///
c_72_3_pic c_72_3_score_interviewer c_72_3_score_ty c_72_3_ai_score ///
c_72_4_pic c_72_4_score_interviewer c_72_4_score_ty c_72_4_ai_score ///
c_79_1_pic c_79_1_score_interviewer c_79_1_score_ty c_79_1_score_ai ///
c_79_2_pic c_79_2_score_interviewer c_79_2_score_ty c_79_2_score_ai ///
c_79_3_pic c_79_3_score_interviewer c_79_3_score_ty c_79_3_score_ai ///
c_79_4_pic c_79_4_score_interviewer c_79_4_score_ty c_79_4_score_ai 

save picture_scores.dta, replace