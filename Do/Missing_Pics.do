*Here we are creating a new cog dta that gives us the observations with missing pictures for Cog (

clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}
}

else if `"`user'"' == "Ty" {
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
}

use Cog

keep c_houseid c_clustid c_interid pid2 c_particid c_country c_deviceid1 *_pic*

replace symb_pic_found = "not in drive" if symb_pic_found == "missing" & (symb_pic ~= "." & symb_pic ~= ".i" & symb_pic ~= ".v")
replace pent_pic_found = "not in drive" if pent_pic_found == "missing" & (pent_pic ~= "." & pent_pic ~= ".i" & pent_pic ~= ".v")
replace anim_pic_found = "not in drive" if anim_pic_found == "missing" & (anim_pic ~= "." & anim_pic ~= ".i" & anim_pic ~= ".v")
replace c_72_4_pic_found = "not in drive" if c_72_4_pic_found == "missing" & (c_72_4_pic ~= "." & c_72_4_pic ~= ".i" & c_72_4_pic ~= ".v")
replace c_79_4_pic_found = "not in drive" if c_79_4_pic_found == "missing" & (c_79_4_pic ~= "." & c_79_4_pic ~= ".i" & c_79_4_pic ~= ".v")

drop c_72_1* c_72_2* c_72_3* c_79_1* c_79_2* c_79_3*

drop if (symb_pic_found == "found" & pent_pic_found == "found" & anim_pic_found == "found" & c_72_4_pic_found == "found" & c_79_4_pic_found == "found")

foreach var of varlist *pic {
	replace `var'_found = "rehúsa" if `var' == ".v" & `var'_found == "missing"
}
foreach var of varlist *found {
	replace `var' = "Foto no recibida" if `var' == "not in drive"
	replace `var' = "Foto recibida" if `var' == "found"
	replace `var' = "Foto no fue tomada" if `var' == "missing"
}

export excel using "Cog_pics", sheetreplace firstrow(variables)

save Cog_Pics.dta, replace

clear all
