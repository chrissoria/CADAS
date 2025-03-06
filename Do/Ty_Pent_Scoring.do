clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

*Change the filepath name here to the folder containing the data and output folders
if `"`user'"' == "Chris" {
	local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
}

else if `"`user'"' == "Ty" {
	local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
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

if `country' == 0 {
    import excel using "`path'/consensus/ty_pent_scoring_in_PR.xlsx", firstrow allstring clear
}
else if `country' == 1 {
    import excel using "`path'/consensus/ty_pent_scoring_in_DR.xlsx", firstrow allstring clear
}
else if `country' == 2 {
    import excel using "`path'/consensus/ty_pent_scoring_in_CU.xlsx", firstrow allstring clear
}

*sometimes reading in 1,048,575 lines so we will drop empty lines
drop if pid == "" & hhid == "" & pent_pic == "" & cs_40_ty == ""

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

drop if (pent_pic_found == "missing" & cs_40_ty == "missing")
drop if (pent_pic_found == "missing" & cs_40_ty == "")
replace cs_40_ty = "" if (pent_pic_found == "found" & cs_40_ty == "missing")
keep pid hhid pent_pic cs_40_ty globalrecordid pent_pic_found
drop if (pent_pic == ".i" | pent_pic == ".v")

replace pent_pic = subinstr(pent_pic, ".jpg", "", .)

order pid hhid globalrecordid pent_pic cs_40_ty

* Export data to Excel
if `country' == 0 {
    export excel using "`path'/consensus/ty_pent_scoring_out_PR.xlsx", replace firstrow(variables)
}
else if `country' == 1 {
    export excel using "`path'/consensus/ty_pent_scoring_out_DR.xlsx", replace firstrow(variables)
}
else if `country' == 2 {
    export excel using "`path'/consensus/ty_pent_scoring_out_CU.xlsx", replace firstrow(variables)
}

* Indicate if observation has a CROPPED pentagon picture uploaded
rename cs_40_ty cropped_pent_uploaded
rename globalrecordid c_globalrecordid
replace cropped_pent_uploaded = "missing" if (cropped_pent_uploaded ~= "0" & cropped_pent_uploaded ~= "1" & cropped_pent_uploaded ~= "2")
save pent_cropped_check.dta , replace

*clear all

exit, clear
