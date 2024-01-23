clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

*Change the filepath name here to the folder containing the data and output folders
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
*local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

if `"`user'"' == "Chris" {

	if `country' == 0 {
	cd "`path'/PR_out"
	}
	else if `country' == 1 {
	cd "`path'/DR_out"
	}
	else if `country' == 2 {
	cd "`path'/CUBA_out"
	}

	use Cog.dta

}

else if `"`user'"' == "Ty" {

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
    use using "../PR_out/cog.dta"
	}
	else if `country' == 1 {
	use using "../DR_out/cog.dta"
	}
	else if `country' == 2 {
	use using "../CUBA_out/cog.dta"
	}
}

*CREATE ty_manual_scoring

gen cs_40_ty = .
gen cs_72_1_ty = .
gen cs_72_2_ty = .
gen cs_72_3_ty = .
gen cs_72_4_ty = .
gen cs_79_1_ty = .
gen cs_79_2_ty = .
gen cs_79_3_ty = .
gen cs_79_4_ty = .

replace pent_pic = substr(pent_pic, 18, .)
replace pent_pic = substr(pent_pic,1,length(pent_pic)-18)

*Ty says we can delete the commented out because we converted this to numeric
/*
replace c_72_1_pic = substr(c_72_1_pic, 18, .)
replace c_72_1_pic = substr(c_72_1_pic,1,length(c_72_1_pic)-18)
replace c_72_2_pic = substr(c_72_2_pic, 18, .)
replace c_72_2_pic = substr(c_72_2_pic,1,length(c_72_2_pic)-18)
replace c_72_3_pic = substr(c_72_3_pic, 18, .)
replace c_72_3_pic = substr(c_72_3_pic,1,length(c_72_3_pic)-18)
replace c_72_4_pic = substr(c_72_4_pic, 18, .)
replace c_72_4_pic = substr(c_72_4_pic,1,length(c_72_4_pic)-18)
replace c_79_1_pic = substr(c_79_1_pic, 18, .)
replace c_79_1_pic = substr(c_79_1_pic,1,length(c_79_1_pic)-18)
replace c_79_2_pic = substr(c_79_2_pic, 18, .)
replace c_79_2_pic = substr(c_79_2_pic,1,length(c_79_2_pic)-18)
replace c_79_3_pic = substr(c_79_3_pic, 18, .)
replace c_79_3_pic = substr(c_79_3_pic,1,length(c_79_3_pic)-18)
replace c_79_4_pic = substr(c_79_4_pic, 18, .)
replace c_79_4_pic = substr(c_79_4_pic,1,length(c_79_4_pic)-18)
*/


keep pid hhid *pic* *_ty
drop anim_pic symb_pic

save ty_manual_scoring_temp1.dta, replace

clear all

if `"`user'"' == "Chris" {
	if `country' == 0 {
	import excel using "../PR_in/ty_manual_scoring_in.xlsx", firstrow clear
	}	
	else if `country' == 1 {
	import excel using "../DR_in/ty_manual_scoring_in.xlsx", firstrow clear
	}
	else if `country' == 2 {
	import excel using "../CUBA_in/ty_manual_scoring_in.xlsx", firstrow clear
	}

}

else if `"`user'"' == "Ty" {
	if `country' == 0 {
	import excel using "ty_manual_scoring_in.xlsx", firstrow clear
	}
	else if `country' == 1 {
	import excel using "ty_manual_scoring_in.xlsx", firstrow clear
	}
	else if `country' == 2 {
	import excel using "ty_manual_scoring_in.xlsx", firstrow clear
	}
}

tostring *pic* , replace

merge m:m pid using ty_manual_scoring_temp1.dta
drop _merge

* Export data to Excel
export excel using "ty_manual_scoring_out.xlsx", replace firstrow(variables)

clear all

************************************************

************************************************
if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

clear all
capture log close
use using cog_merged.dta

replace g_1_file = substr(g_1_file, 32, .)
replace g_1_file = substr(g_1_file,1,length(g_1_file)-4)
replace g_2_file = substr(g_2_file, 32, .)
replace g_2_file = substr(g_2_file,1,length(g_2_file)-4)
replace g_2_file2 = substr(g_2_file2, 32, .)
replace g_2_file2 = substr(g_2_file2,1,length(g_2_file2)-4)
replace g_3_file = substr(g_3_file, 32, .)
replace g_3_file = substr(g_3_file,1,length(g_3_file)-4)
replace g_3_file2 = substr(g_3_file2, 32, .)
replace g_3_file2 = substr(g_3_file2,1,length(g_3_file2)-4)


*drop an observation with no tablet number
drop if pid == "10921701"
*sort by newest
gsort c_deviceid1 -c_date_end -c_date
*number the observations by tablet
quietly by c_deviceid1:  gen dup = cond(_N==1,0,_n)



/*
destring pid, replace
*tablet 2 recordings had to be manually checked, these are the ones that have a real recording
egen g1 = anymatch(pid), values(17802501 17804301 17801001 11002102 11003101)
egen g21 = anymatch(pid), values(17804301 11003101 11005101 10219601 10219602)
egen g22 = anymatch(pid), values(11005101 11004101 10725501 10916101 10909001)
egen g31 = anymatch(pid), values(17802501 11005101 11003101 11004101 17903701)
egen g32 = anymatch(pid), values(17802501 11005101 17903701 10222001 10916101)
*/




*only keep the 5 most recent observations (and the most recent observations from tablet 2 that have audio)
*keep if (dup < 6 | g1 | g21 | g22 | g31 | g32)
*use the line above for data from september 7th 2023, otherwise use line below
keep if dup < 6


/*
*delete data from the observations without audio so we don't get confused which recordings to look at
replace g_1_file = "" if (c_deviceid1 == "02_do" & ~g1)
replace g_2_file = "" if (c_deviceid1 == "02_do" & ~g21)
replace g_2_file2 = "" if (c_deviceid1 == "02_do" & ~g22)
replace g_3_file = "" if (c_deviceid1 == "02_do" & ~g31)
replace g_3_file2 = "" if (c_deviceid1 == "02_do" & ~g32)

replace cs_40 = . if g_1_file == ""
*/



foreach x of varlist c_66a-c_66f {
replace `x' = . if g_2_file == ""
}

foreach x of varlist c_67_01-c_67_25 {
replace `x' = . if g_2_file2 == ""
}

foreach x of varlist c_77a-c_77f {
replace `x' = . if g_3_file == ""
}

foreach x of varlist c_78_01-c_78_25 {
replace `x' = . if g_3_file2 == ""
}

*keep only the important variables
keep pid c_interid c_houseid c_clustid c_particid c_country c_houseid2 c_conglid2 c_particid2 c_deviceid1 globalrecordid fkey c_date c_date_end g_1_file g_2_file g_2_file2 g_3_file g_3_file2 cs_40 c_67* c_66* c_77* c_78*
order pid
export excel using cog_mp4.xlsx, firstrow(variables) replace
clear all
exit, clear
