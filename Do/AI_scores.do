clear all 
set more off
capture log close

*note Oct 19th an update was sent out to break out pictures for 72 and 79

capture include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

display "Initial user value: `user'"

if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

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
	import excel using "../consensus/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
	tostring pent_pic, replace force
	replace pent_pic = pent_pic + ".jpg" if !strpos(pent_pic, ".jpg")
	drop pent_pic_found hhid pid globalrecordid
	save "../DR_in/ty_pent_pic_scores.dta", replace
	
	import excel using "../4_Image/ty_4_image_scoring_in_DR.xlsx", firstrow allstring clear
	drop c_interid
	*replace c_72_1_pic = c_72_1_pic + ".jpg" if !strpos(c_72_1_pic, ".jpg")
	*replace c_72_1_pic = c_72_1_pic + ".jpg" if !strpos(c_72_1_pic, ".jpg")
	tostring *pic, replace force
	drop *pic_found hhid pid *pic
	save"../DR_in/ty_4_image_scoring.dta", replace
	
	forvalues i = 1/4 {
        display "Processing c_72_`i'"
        insheet using "../DR_in/final_AI_scores/c_72_`i'_machine_scored_full.csv", comma names clear
		drop image_input link1 json none
		duplicates drop c_72_`i'_pic, force
		if `i' == 2 {
			replace c_72_2_ai_score = similar + diamond_4_sides + diamond_equal_sides
			replace c_72_2_ai_score_strict = c_72_2_ai_score_strict + 1 if diamond_square == 1 & c_72_2_ai_score_strict < 3
		}
		if `i' == 3 {
			replace c_72_3_ai_score = min(similar, rect_1_4_sides, rect_2_4_sides) + rectangles_overlap - rect_overlap_top_portrudes
		}
		rename drawing_present drawing_present_72_`i'_set1
		capture rename c_72_1_ai_score_strict c_72_1_ai_score_strict_set1
		capture rename c_72_2_ai_score_strict c_72_2_ai_score_strict_set1
		capture rename c_72_3_ai_score c_72_3_ai_score_set1
		capture rename c_72_4_ai_score c_72_4_ai_score_set1
        save "../DR_in/c_72_`i'_machine_score_set1.dta", replace
    }
    
	
	
     forvalues i = 1/4 {
        display "Processing c_72_`i'"
        insheet using "../DR_in/AI_scores/c_72_`i'_machine_score_full_rescore1.csv", comma names clear
		drop image_input link1 json none
		*duplicates drop c_72_`i'_pic, force
		if `i' == 2 {
			replace score = score + 1 if diamond_square == 1 & score < 3
		}
		rename drawing_present drawing_present_72_`i'
		rename image_file c_72_`i'_pic
		if `i' == 1 | `i' == 2 {
			rename score c_72_`i'_ai_score_strict
		}
		else {
			rename score c_72_`i'_ai_score
		}
		drop if c_72_`i'_pic == "All_Image_Files"
		drop if c_72_`i'_pic == ".i.jpg"
        save "../DR_in/c_72_`i'_machine_score_set2.dta", replace
    }
	
    forvalues i = 1/4 {
        display "Processing c_79_`i'"
        insheet using "../DR_in/final_AI_scores/c_79_`i'_machine_scored_full.csv", comma names clear
		drop image_filepath link1 json none
		duplicates drop c_79_`i'_pic, force
		if `i' == 2 {
			replace c_79_2_ai_score = 3 if diamond_square == 1 & c_79_2_ai_score == 0
		}
		if `i' == 3 {
			replace c_79_3_ai_score = min(r1_4_sides, r2_4_sides) + rectangles_cross
		}
		rename drawing_present drawing_present_79_`i'_set1
		capture rename c_79_1_score_strict_ai c_79_1_score_strict_ai_set1
		capture rename c_79_2_ai_score c_79_2_ai_score_set1
		capture rename c_79_3_ai_score c_79_3_ai_score_set1
		capture rename c_79_4_ai_score c_79_4_ai_score_set1
        save "../DR_in/c_79_`i'_machine_score_set1.dta", replace
    }
    
    forvalues i = 1/4 {
        display "Processing c_79_`i'"
        insheet using "../DR_in/AI_scores/c_79_`i'_machine_score_full_rescore1.csv", comma names clear
		drop link1 json none
		*duplicates drop c_79_`i'_pic, force
		if `i' == 2 {
			replace score = score + 1 if diamond_square == 1 & score < 3
		}
		rename drawing_present drawing_present_79_`i'
		if `i' == 1 {
			rename score c_79_`i'_score_strict_ai
		}
		else {
			rename score c_79_`i'_ai_score
		}
		gen c_79_`i'_pic = substr(image_input,-17,17)
		drop if c_79_`i'_pic == "mage_Files/.i.jpg"
        save "../DR_in/c_79_`i'_machine_score_set2.dta", replace
    }
    
    import delimited using "../DR_in/AI_scores/pent_scoring.csv", stringcols(_all) clear
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
	
	merge m:1 pent_pic using "../DR_in/ty_pent_pic_scores.dta", nogen keep(master match)
    
    forvalues i = 1/4 {
	merge m:m c_72_`i'_pic using "../DR_in/c_72_`i'_machine_score_set1.dta", keep(master match)
	drop _merge
    }
	forvalues i = 1/4 {
	merge m:m c_72_`i'_pic using "../DR_in/c_72_`i'_machine_score_set2.dta", keep(master match)
	drop _merge
    }
    forvalues i = 1/4 {
	merge m:m c_79_`i'_pic using "../DR_in/c_79_`i'_machine_score_set1.dta", keep(master match)
	drop _merge
    }
	forvalues i = 1/4 {
	merge m:m c_79_`i'_pic using "../DR_in/c_79_`i'_machine_score_set2.dta", keep(master match)
	drop _merge
    }
	
	merge m:1 globalrecordid using "../DR_in/ty_4_image_scoring.dta", nogen
    
    save cog_merged_figures.dta, replace
}
else if `country' == 2 {

    
}


}

replace c_72_1_ai_score_strict = c_72_1_ai_score_strict_set1 if c_72_1_ai_score_strict == .
replace c_72_2_ai_score_strict = c_72_2_ai_score_strict_set1 if c_72_2_ai_score_strict == .
replace c_72_3_ai_score = c_72_3_ai_score_set1 if c_72_3_ai_score == .
replace c_72_4_ai_score = c_72_4_ai_score_set1 if c_72_4_ai_score == .
replace c_79_1_score_strict_ai = c_79_1_score_strict_ai_set1 if c_79_1_score_strict_ai == .
replace c_79_2_ai_score = c_79_2_ai_score_set1 if c_79_2_ai_score == .
replace c_79_3_ai_score = c_79_3_ai_score_set1 if c_79_3_ai_score == .
replace c_79_4_ai_score = c_79_4_ai_score_set1 if c_79_4_ai_score == .


forvalues i = 1/4 {
	replace drawing_present_72_`i' = drawing_present_72_`i'_set1 if drawing_present_72_`i' == .
	replace drawing_present_79_`i' = drawing_present_79_`i'_set1 if drawing_present_79_`i' == .
}

gen cs_72_1_orig = cs_72_1
gen cs_72_2_orig = cs_72_2
gen cs_72_3_orig = cs_72_3
gen cs_72_4_orig = cs_72_4

gen cs_79_1_orig = cs_79_1
gen cs_79_2_orig = cs_79_2
gen cs_79_3_orig = cs_79_3
gen cs_79_4_orig = cs_79_4

replace cs_72_1 = . if cs_72_1 > 2 | cs_72_1 < 0
replace cs_72_2 = . if cs_72_2 > 3 | cs_72_2 < 0
replace cs_72_3 = . if cs_72_3 > 2 | cs_72_3 < 0
replace cs_72_4 = . if cs_72_4 > 4 | cs_72_4 < 0
replace cs_79_1 = . if cs_79_1 > 2 | cs_79_1 < 0
replace cs_79_2 = . if cs_79_2 > 3 | cs_79_2 < 0
replace cs_79_3 = . if cs_79_3 > 2 | cs_79_3 < 0
replace cs_79_4 = . if cs_79_4 > 4 | cs_79_4 < 0


*drop ai scores of 0 when interviewer gave 2+ or drawing not present
gen c_72_1_ai_cleaned = c_72_1_ai_score_strict
replace c_72_1_ai_cleaned = . if (cs_72_1 >= 2 & c_72_1_ai_score_strict == 0) | drawing_present_72_1 == 0

gen c_72_2_ai_cleaned = c_72_2_ai_score_strict
replace c_72_2_ai_cleaned = . if (cs_72_2 >= 2 & c_72_2_ai_score_strict == 0) | drawing_present_72_2 == 0

gen c_72_3_ai_cleaned = c_72_3_ai_score
replace c_72_3_ai_cleaned = . if (cs_72_3 >= 2 & c_72_3_ai_score == 0) | drawing_present_72_3 == 0

gen c_72_4_ai_cleaned = c_72_4_ai_score
replace c_72_4_ai_cleaned = . if (cs_72_4 >= 2 & c_72_4_ai_score == 0) | drawing_present_72_4 == 0

gen c_79_1_ai_cleaned = c_79_1_score_strict_ai
replace c_79_1_ai_cleaned = . if (cs_79_1 >= 2 & c_79_1_score_strict_ai == 0) | drawing_present_79_1 == 0

gen c_79_2_ai_cleaned = c_79_2_ai_score
replace c_79_2_ai_cleaned = . if (cs_79_2 >= 2 & c_79_2_ai_score == 0) | drawing_present_79_2 == 0

gen c_79_3_ai_cleaned = c_79_3_ai_score
replace c_79_3_ai_cleaned = . if (cs_79_3 >= 2 & c_79_3_ai_score == 0) | drawing_present_79_3 == 0

gen c_79_4_ai_cleaned = c_79_4_ai_score
replace c_79_4_ai_cleaned = . if (cs_79_4 >= 2 & c_79_4_ai_score == 0) | drawing_present_79_4 == 0


*collapse circles
*0 / 1,2
gen collapsed_72_1_ai = 0 if c_72_1_ai_cleaned == 0
replace collapsed_72_1_ai = 1 if c_72_1_ai_cleaned == 1 | c_72_1_ai_cleaned == 2

gen collapsed_79_1_ai = 0 if c_79_1_ai_cleaned == 0
replace collapsed_79_1_ai = 1 if c_79_1_ai_cleaned == 1 | c_79_1_ai_cleaned == 2

gen collapsed_72_1_int = 0 if cs_72_1 == 0
replace collapsed_72_1_int = 1 if cs_72_1 == 1 | cs_72_1 == 2

gen collapsed_79_1_int = 0 if cs_79_1 == 0
replace collapsed_79_1_int = 1 if cs_79_1 == 1 | cs_79_1 == 2

*collapse diamonds
*0,1 / 2,3 
gen collapsed_72_2_ai = 0 if c_72_2_ai_cleaned == 0 | c_72_2_ai_cleaned == 1
replace collapsed_72_2_ai = 1 if c_72_2_ai_cleaned == 2 | c_72_2_ai_cleaned == 3

gen collapsed_79_2_ai = 0 if c_79_2_ai_cleaned == 0 | c_79_2_ai_cleaned == 1
replace collapsed_79_2_ai = 1 if c_79_2_ai_cleaned == 2 | c_79_2_ai_cleaned == 3

gen collapsed_72_2_int = 0 if cs_72_2 == 0 | cs_72_2 == 1
replace collapsed_72_2_int = 1 if cs_72_2 == 2 | cs_72_2 == 3

gen collapsed_79_2_int = 0 if cs_79_2 == 0 | cs_79_2 == 1
replace collapsed_79_2_int = 1 if cs_79_2 == 2 | cs_79_2 == 3

*rectangles remain unchanged
*0 / 1 / 2
gen collapsed_72_3_ai = c_72_3_ai_cleaned
gen collapsed_79_3_ai = c_79_3_ai_cleaned

gen collapsed_72_3_int = cs_72_3
gen collapsed_79_3_int = cs_79_3

*collapse cubes
*0,1 / 2 / 3,4
gen collapsed_72_4_ai = 0 if c_72_4_ai_cleaned == 0 | c_72_4_ai_cleaned == 1
replace collapsed_72_4_ai = 2 if c_72_4_ai_cleaned == 2
replace collapsed_72_4_ai = 4 if c_72_4_ai_cleaned == 3 | c_72_4_ai_cleaned == 4

gen collapsed_79_4_ai = 0 if c_79_4_ai_cleaned == 0 | c_79_4_ai_cleaned == 1
replace collapsed_79_4_ai = 2 if c_79_4_ai_cleaned == 2
replace collapsed_79_4_ai = 4 if c_79_4_ai_cleaned == 3 | c_79_4_ai_cleaned == 4

gen collapsed_72_4_int = 0 if cs_72_4 == 0 | cs_72_4 == 1
replace collapsed_72_4_int = 2 if cs_72_4 == 2
replace collapsed_72_4_int = 4 if cs_72_4 == 3 | cs_72_4 == 4

gen collapsed_79_4_int = 0 if cs_79_4 == 0 | cs_79_4 == 1
replace collapsed_79_4_int = 2 if cs_79_4 == 2
replace collapsed_79_4_int = 4 if cs_79_4 == 3 | cs_79_4 == 4
*add up all scores for the section
gen sum_c_72_ai = collapsed_72_1_ai + collapsed_72_2_ai + collapsed_72_3_ai + collapsed_72_4_ai
gen sum_c_72_int = collapsed_72_1_int + collapsed_72_2_int + collapsed_72_3_int + collapsed_72_4_int
gen sum_c_79_ai = collapsed_79_1_ai + collapsed_79_2_ai + collapsed_79_3_ai + collapsed_79_4_ai
gen sum_c_79_int = collapsed_79_1_int + collapsed_79_2_int + collapsed_79_3_int + collapsed_79_4_int


*step 2.2
local imagescoring 72_1 72_2 72_3 72_4 79_1 79_2 79_3 79_4
foreach var in `imagescoring' {
	levelsof cs_`var', local(scores)
	foreach response in `scores' {
		egen c_`var'_ai_avg_if_`response' = mean(collapsed_`var'_ai) if cs_`var' == `response'
	}
}

*step 2.3
levelsof c_interid, local(inters)
foreach ID in `inters' {
	foreach var in `imagescoring' {
		levelsof cs_`var', local(scores)
		foreach response in `scores' {
			egen c_`var'_ai_avg_if_ID`ID'_gave_`response' = mean(c_`var'_ai_cleaned) if (cs_`var' == `response' & c_interid == `ID')
		}
	}
}

*egen sum = rowtotal(*avg_if_ID*)

*step 2.4
foreach ID in `inters' {
	foreach var in `imagescoring' {
		levelsof cs_`var' if c_interid == `ID', local(scores)
		foreach response in `scores' {
			gen callibrate_ratio_`var'_ID`ID'_`response' = c_`var'_ai_avg_if_ID`ID'_gave_`response' / c_`var'_ai_avg_if_`response'
			capture gen callibrated_`var'_int = cs_`var' / callibrate_ratio_`var'_ID`ID'_`response'
			replace callibrated_`var'_int = cs_`var' / callibrate_ratio_`var'_ID`ID'_`response' if (cs_`var' ~= . & callibrate_ratio_`var'_ID`ID'_`response' ~= .)
		}
	}
}

*step 2.5
egen sum_c_72_int_callibrated = rowtotal(callibrated_72*)
egen sum_c_79_int_callibrated = rowtotal(callibrated_79*)

order sum_c_72_int sum_c_72_int_callibrated sum_c_72_ai sum_c_79_int sum_c_79_int_callibrated sum_c_79_ai

save Callibrated_scores.dta, replace
