
clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

local country = 1

if `country' == 0 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/PR_out"
}
else if `country' == 1 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
}
else if `country' == 2 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
}

*below we read in a country-specific file

/*The goal of this do file is to:
A. Track which individuals took one survey but not the others
B. Count Unique Households
C. Check to see gender in Socio matches gender in Roster
*/

//below we'll pull out the pid row and any columns that might be relevant

if `country' == 0 {
    import excel using "../PR_in/Resumen de entrevistas.xlsx", firstrow
}    
else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas.xlsx", firstrow
}
else if `country' == 2 {
    import excel using "../CU_in/Resumen de entrevistas.xlsx", firstrow
}

drop in 1/3

rename ResumendeEntrevistasCADASD Cluster
rename C House_ID
rename D Participante
rename E sex
rename F age
rename G Fecha
rename H Notas
rename I Notas_2

gen pais = .

if `country' == 0 {
    replace pais = 0 if Participante != ""
}    
else if `country' == 1 {
    replace pais = 1 if Participante != ""
}
else if `country' == 2 {
    replace pais = 2 if Participante != ""
}

drop if pais == .
replace Notas = lower(trim(Notas))
drop if Notas == "rechazo"
replace Notas_2 = lower(trim(Notas_2))
drop if Notas_2 == "rechazo"

gen country_str = string(pais, "%12.0f")

replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)

replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)

replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)

gen pid = country_str + Cluster + House_ID + Participante
drop country_str

*********
* RESUMEN ENTREVISTAS
********

log using logs/tracker, text replace

keep pid age sex
gen pidr=real(pid)
rename sex SEX
replace SEX = lower(trim(SEX))

generate sex = cond(SEX == "m", 0, cond(SEX == "f", 1, .))
drop SEX
destring age, replace

egen duplic=count(pid), by(pid)
egen sd_sex=sd(sex), by(pid)
egen sd_age=sd(age), by(pid)
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid sex age duplic if duplic>1 /* print duplicate obs */
gen in_resumen_par=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
sum
save tracker, replace

********** 
* ROSTER_PARTICIPANTS
**********
use rosters_merged, clear
keep pid pr_3 pr_4 r_interid r_deviceid
gen pidr=real(pid)
drop if pidr==. /* check if any obs are missing pid */
egen duplic=count(pid), by(pid) /* check for duplicate PID: should all be =1 if no duplicates */
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
egen sd_sex=sd(pr_3), by(pid)
egen sd_age=sd(pr_4), by(pid)
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid pr_3 pr_4 duplic if duplic>1 /* print duplicate obs */
gen in_rosters_par=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
sum
*save rosters_check.dta, replace /* I think you could drop these lines, and save just tracker per next line */
merge m:m pid using tracker
rename sex sex_resumen
tab pr_3 sex_resumen, miss
list pid pr_3 sex_resumen if (pr_3 ~= sex_resumen +1) & _merge==3 /* list if sex differs between Roster and Resumen */
corr pr_4 age
list pid pr_4 age if abs(pr_4 - age) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Resumen */

drop _merge
save tracker, replace
d,s
sum

********** 
* SOCIO
**********
use Socio, clear
*s_2_3 will be slightly different if age on official documents differs from roster age
keep pid s_0 s_2_3 s_interid s_deviceid1
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid s_0 s_2_3 duplic if duplic>1 
gen in_socio=1 
drop pidr duplic
sum
*save socio_check.dta, replace
merge m:m pid using tracker

tab pr_3 s_0, miss
list pid pr_3 s_0 if (pr_3 ~= s_0 +1) & _merge==3 /* list if sex differs between Roster and Socio */
corr pr_4 s_2_3
list pid pr_4 s_2_3 if abs(pr_4 - s_2_3) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Socio */

drop _merge
save tracker, replace
d,s
sum

********** 
* PHYS
**********
use Phys, clear
keep pid p_interid p_deviceid1
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen in_phys=1 
drop pidr duplic
sum
*save phys_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* COG
**********
use Cog, clear
keep pid c_interid c_deviceid1
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen in_cog=1 
drop pidr duplic
sum
*save cog_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* COG SCORING
**********
use Cog_Scoring, clear
keep pid cs_interid
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen in_cog_scor=1 
drop pidr duplic
sum
*save cog_scoring_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* INFORMANT
**********
use Infor, clear
keep pid i_interid i_deviceid1
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen in_infor=1 
drop pidr duplic
sum
*save infor_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* HOUSEHOLD
**********
use tracker, clear
gen hhid=substr(pid,1,6)
save tracker, replace
d,s
sum

use Household, clear
keep hhid h_interid h_deviceid1
gen hhidr=real(hhid)
drop if hhidr==.
egen duplic=count(hhid), by(hhid)
tab duplic
sort hhid
list hhid duplic if duplic>1 
gen in_hh=1 
drop hhidr duplic
sum
*save hh_check.dta, replace
merge m:m hhid using tracker
drop _merge
save tracker, replace
d,s
sum

* SUMMARY VARIABLE FOR WHICH SURVEYS EACH LINE HAS
gen RES_in ="Res" if in_resumen_par==1
gen R_in="R" if in_rosters_par==1
gen S_in="S" if in_socio==1
gen P_in="P" if in_phys==1
gen C_in="C" if in_cog==1
gen CS_in="Cs" if in_cog_scor==1
gen I_in="I" if in_infor==1
gen H_in="H" if in_hh==1 
replace S_in=" " if in_socio~=1
replace P_in=" " if in_phys~=1
replace C_in=" " if in_cog~=1
replace CS_in=" " if in_cog_scor~=1
replace I_in=" " if in_infor~=1
replace H_in=" " if in_hh~=1 

gen RSPCZIH = RES_in+R_in + S_in + P_in + C_in + CS_in + I_in + H_in
tab RSPCZIH

sum in*

drop R_in S_in P_in C_in CS_in I_in H_in
save tracker_full, replace

* Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

export excel using "duplicates/tracker_full.xlsx", replace firstrow(variables)

drop r_interid s_interid p_interid i_interid h_interid cs_interid c_interid
drop r_deviceid s_deviceid1 p_deviceid1 i_deviceid1 c_deviceid1

save tracker_slim, replace

export excel using "duplicates/tracker_slim.xlsx", replace firstrow(variables)

log close
exit, clear
