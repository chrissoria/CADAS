clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

*Change the filepath name here to the folder containing the data and output folders
if `"`user'"' == "Chris" {
	local path = "/Users/chrissoria/documents/CADAS/Data"
	
	if `country' == 0 {
		import excel using "`path'/PR_in/ty_pent_scoring_in_PR.xlsx", firstrow allstring clear
		}
	else if `country' == 1 {
		import excel using "`path'/DR_in/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
}
	else if `country' == 2 {
		import excel using "`path'/CUBA_in/ty_pent_scoring_in_CU.xlsx", firstrow allstring clear
}
}

else if `"`user'"' == "Ty" {
	local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
	
	if `country' == 0 {
		import excel using "`path'/consensus/ty_pent_scoring_in_PR.xlsx", firstrow allstring clear
}
	else if `country' == 1 {
		import excel using "`path'/consensus/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
}
	else if `country' == 2 {
		import excel using "`path'/consensus/ty_pent_scoring_in_CU.xlsx", firstrow allstring clear
}
}


if `country' == 0 {
    cd "`path'/PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_in"
}

* Rename column from Excel (comes in with wrong name)
rename cs_40_ty cs_32_ty

*sometimes reading in 1,048,575 lines so we will drop empty lines
drop if pid == "" & hhid == "" & pent_pic == "" & cs_32_ty == ""

replace pent_pic = pent_pic + ".jpg"


if `country' == 0 {
    merge 1:m pent_pic using "../PR_out/Cog.dta"
}
else if `country' == 1 {
    merge 1:m pent_pic using "../DR_out/Cog.dta"
}
else if `country' == 2 {
    merge 1:m pent_pic using "../CUBA_out/Cog.dta"
}

drop if (pent_pic_found == "missing" & cs_32_ty == "missing")
drop if (pent_pic_found == "missing" & cs_32_ty == "")
replace cs_32_ty = "" if (pent_pic_found == "found" & cs_32_ty == "missing")

* Create cs_32_cleaned: prioritize Ty's scores, fall back to cs_32
* Temporarily rename to avoid "ambiguous abbreviation" error with cs_32
rename cs_32_ty ty_pent_score
rename cs_32 orig_pent_score

* Convert Ty's string score to numeric
destring ty_pent_score, gen(ty_score_num) force

* Create cleaned variable: use Ty's score if available, otherwise use original
gen cs_32_cleaned = ty_score_num if ty_score_num < .
replace cs_32_cleaned = orig_pent_score if cs_32_cleaned >= .
label variable cs_32_cleaned "32. Dibujo de pentagonos (cleaned, Ty scores prioritized)"

* Rename back and clean up
rename ty_pent_score cs_32_ty
rename orig_pent_score cs_32
drop ty_score_num

keep pid hhid pent_pic cs_32_ty cs_32 cs_32_cleaned globalrecordid pent_pic_found
drop if (pent_pic == ".i" | pent_pic == ".v")

replace pent_pic = subinstr(pent_pic, ".jpg", "", .)

order pid hhid globalrecordid pent_pic cs_32_ty cs_32 cs_32_cleaned

* Export data to Excel
export excel using "ty_pent_scoring_out.xlsx", replace firstrow(variables)

* Indicate if observation has a CROPPED pentagon picture uploaded
rename cs_32_ty cropped_pent_uploaded
rename globalrecordid c_globalrecordid
replace cropped_pent_uploaded = "missing" if (cropped_pent_uploaded ~= "0" & cropped_pent_uploaded ~= "1" & cropped_pent_uploaded ~= "2")
save pent_cropped_check.dta , replace

*clear all

exit, clear
