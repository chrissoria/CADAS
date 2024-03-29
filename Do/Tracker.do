
clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
}

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
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
    import excel using "../CUBA_in/Resumen de entrevistas.xlsx", firstrow
}

if `country' == 1 {

rename HouseID House_ID
rename GénerodeParticpante sex
rename EdaddeParticpante age
rename Fechaenquecompletoelchequeo Fecha
rename NotasCuestionariosnohechos Notas

destring age, replace
rename age age_string
gen age = real(age_string)
drop age_string
}

else if `country' == 2 {
rename Sexo1Hombre2Mujer sex
rename Edad age
rename Fechacompleto Fecha
rename Casa House_ID1
rename Porque1nohubo2rehuso Notas
rename Participante Participante1
rename Cluster cluster1

destring Participante, replace
rename Completo1si2no Completo

destring Completo, replace
destring cluster1, replace
destring House_ID1, replace
}

gen pais = 0

if `country' == 0 {
    replace pais = 0 if Participante != ""
}    
else if `country' == 1 {
    replace pais = 1 if Participante != ""
}
else if `country' == 2 {
    replace pais = 2 if Participante != .
}

if `country' == 1 {
drop if pais == .
replace Notas = lower(trim(Notas))
drop if Notas == "rechazo"

capture replace Notas_2 = lower(trim(Notas_2))
capture drop if Notas_2 == "rechazo"
}

if `country' == 2 {
drop if pais == 0
replace Notas = lower(trim(Notas))
drop if Completo == 2
}
drop if missing(Cluster)

gen country_str = string(pais, "%12.0f")

if `country' == 1 {
replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)
replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)
replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)
}

else if `country' == 2 {
gen Cluster = string(cluster1)
replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)
gen House_ID = string(House_ID)
replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)
gen Participante = string(Participante1)
replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)
}


gen pid = country_str + Cluster + House_ID + Participante
drop country_str

duplicates drop pid, force

*********
* RESUMEN ENTREVISTAS
********

log using logs/tracker, text replace

keep pid age sex House_ID Cluster
gen pidr=real(pid)
rename sex SEX

if `country' == 1 {
replace SEX = lower(trim(SEX))
generate sex = cond(SEX == "m", 0, cond(SEX == "f", 1, .))
}

else if `country' == 2 {
generate sex = cond(SEX == 1,0, cond(SEX == 2, 1,.))
}


drop SEX
destring age, replace

egen duplic=count(pid), by(pid)
egen sd_sex=sd(sex), by(pid)
egen sd_age=sd(age), by(pid)
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid sex age duplic if duplic>1 /* print duplicate obs */
gen pid_en_resumen=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
sum
save tracker, replace

********** 
* ROSTER_PARTICIPANTS
**********
use rosters_participants, clear
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
gen pid_en_listas=1 /* create indicator to use after merge with other questionnaire files */
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

capture confirm variable s_sex
if _rc == 0 {
    rename s_sex s_0
}

keep pid s_0 s_2_3 s_interid s_deviceid1
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid s_0 s_2_3 duplic if duplic>1 
gen pid_en_socio=1 
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
gen pid_en_phys=1 
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
keep pid c_interid c_deviceid1 all_image_files_found all_audio_files_found
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_cog=1 
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
gen pid_en_cog_scor=1 
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
gen pid_en_infor=1 
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
gen existe_familiar=1 
drop hhidr duplic
sum
*save hh_check.dta, replace
merge m:m hhid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* BLOOD
**********


if `country' == 0 {
    use "..\SANGRE\PR_blood\Sangre_tracker_full.dta", clear
}    
else if `country' == 1 {
    use "sangre_full.dta", clear
    
keep pid XF7
gen pidr=real(pid)
drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_sangre=1 
drop pidr duplic
sum
*save sangre_check.dta, replace
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum
}

* SUMMARY VARIABLE FOR WHICH SURVEYS EACH LINE HAS
gen G_in ="G" if pid_en_resumen==1
gen R_in="R" if pid_en_listas==1
gen S_in="S" if pid_en_socio==1
gen P_in="P" if pid_en_phys==1
gen C_in="C" if pid_en_cog==1
gen Z_in="Z" if pid_en_cog_scor==1
gen I_in="I" if pid_en_infor==1
gen H_in="H" if existe_familiar==1
replace G_in=" " if pid_en_resumen~=1
replace R_in=" " if pid_en_listas~=1
replace S_in=" " if pid_en_socio~=1
replace P_in=" " if pid_en_phys~=1
replace C_in=" " if pid_en_cog~=1
replace Z_in=" " if pid_en_cog_scor~=1
replace I_in=" " if pid_en_infor~=1
replace H_in=" " if existe_familiar~=1

if `country' == 1 {
gen B_in=XF7 if pid_en_sangre==1
replace B_in=" " if pid_en_sangre~=1

gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in + B_in
tab RSPCZIHXF7
}
else if `country' == 2 {
gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in
tab RSPCZIHXF7
}

sum pid*

drop R_in S_in P_in C_in Z_in I_in H_in G_in
capture drop B_in

rename s_0 sexo_en_socio
rename pr_3 sexo_listas
rename s_2_3 edad_en_socio
rename pr_4 edad_en_listas
rename age edad_en_resumen

order pid House_ID Cluster

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
drop r_deviceid s_deviceid1 p_deviceid1 i_deviceid1 c_deviceid1 all_image_files_found all_audio_files_found

save tracker_slim, replace

export excel using "duplicates/tracker_slim.xlsx", replace firstrow(variables)

use door_merged_all

keep hhid pid d_0 d_1 d_particid

merge m:m hhid using tracker_slim 

capture drop XF7 RSPCZIHXF7

generate hhid_en_puerta = cond(_merge == 1, "Sola en Puerta", cond(_merge == 2, "Solo en Tracker", cond(_merge == 3, "Match", "")))
replace hhid_en_puerta = "Sin hhid" if missing(hhid)
drop _merge

keep d_1 d_particid pid hhid hhid_en_puerta

save tracker_door, replace

log close
exit, clear