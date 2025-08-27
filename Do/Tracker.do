
clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
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
    import excel using "../PR_in/Resumen de Entrevistas.xlsx", firstrow clear
    *drop N-Z
    keep if strpos(lower(NotasCuestionariosnohechos), "complete") > 0
    keep Cluster Casa Participante GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos
    rename (Casa GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos) ///
           (House_ID sex age Fecha Notas)
    drop if missing(Cluster, House_ID, Participante, sex, age, Fecha, Notas)
}


else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas.xlsx", firstrow
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    rename NotasCuestionariosnohechos Notas
}
else if `country' == 2 {
    import excel using "../CUBA_in/Resumen de entrevistas.xlsx", firstrow
    rename Sexo1Hombre2Mujer sex
rename Edad age
rename Fechacompleto Fecha
rename Casa House_ID1
rename Porque1nohubo2rehuso Notas

destring Participante, replace
rename Completo1si2no Completo

destring Completo, replace
destring Cluster, replace
destring House_ID1, replace
}

gen pais = 0
  
if `country' == 1 {
    replace pais = 1 if Participante != .
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
replace Completo = "3" if missing(Completo)
replace Completo = "1" if Completo == "SI"
destring Completo, replace
drop if Completo == 2
}
drop if missing(Cluster)

gen country_str = string(pais, "%12.0f")

if `country' != 2 {
destring Cluster, replace
destring House_ID, replace
destring Participante, replace

gen Cluster_str = string(Cluster, "%12.0f")
gen House_ID_str = string(House_ID, "%12.0f")
gen Participante_str = string(Participante, "%12.0f")

replace Cluster_str = cond(strlen(Cluster_str) == 1, "0" + Cluster_str, Cluster_str)
replace House_ID_str = cond(strlen(House_ID_str) == 1, "00" + House_ID_str, House_ID_str)
replace House_ID_str = cond(strlen(House_ID_str) == 2, "0" + House_ID_str, House_ID_str)
replace Participante_str = cond(strlen(Participante_str) == 1, "0" + Participante_str, Participante_str)

gen pid = country_str + Cluster_str + House_ID_str + Participante_str
drop country_str Cluster_str House_ID_str Participante_str
}

else if `country' == 2 {
	rename Cluster cluster_real
	tostring cluster_real, generate(Cluster) format(%12.0g)
replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)
gen House_ID = string(House_ID)
replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)
	rename Participante Participante1
gen Participante = string(Participante1)
replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)

gen pid = country_str + Cluster + House_ID + Participante
drop country_str
}

duplicates drop pid, force

save resumen_tracker.dta, replace
clear

*here i want to pull out a "master unique" set of pid's, pulling a unique list from all data rather than just one source
clear
set obs 0
gen pid = ""
save "all_unique_pids.dta", replace

local datasets "resumen_tracker rosters_participants Socio Phys Cog Cog_Scoring Infor"

foreach dataset in `datasets' {
    use "`dataset'.dta", clear
    
    keep pid
    duplicates drop
    
    append using "all_unique_pids.dta"
    save "all_unique_pids.dta", replace
}

use "all_unique_pids.dta", clear
duplicates drop
gen hhid=substr(pid,1,6)
save "all_unique_pids.dta", replace

log using logs/tracker, text replace


*********
* RESUMEN ENTREVISTAS
********

use resumen_tracker.dta, clear


keep pid age sex House_ID Cluster
gen pidr=real(pid)
rename sex SEX

if `country' != 2 {
replace SEX = lower(trim(SEX))
generate sex = cond(SEX == "m", 0, cond(SEX == "f", 1, .))
}

else if `country' == 2 {
	replace SEX = lower(trim(SEX))
	replace SEX = "1" if SEX == "masculino"
	replace SEX = "2" if SEX == "femenino"
	destring SEX, replace
generate sex = cond(SEX == 1,0, cond(SEX == 2, 1,.))
}


drop SEX
destring age, replace

egen duplic=count(pid), by(pid)
egen sd_sex=sd(sex), by(pid)
destring age, replace force
egen sd_age=sd(age), by(pid)
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid sex age duplic if duplic>1 /* print duplicate obs */
gen pid_en_resumen=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
sum
save tracker, replace

use all_unique_pids.dta, clear
merge 1:m pid using tracker.dta
drop _merge
save tracker.dta, replace

********** 
* ROSTER_PARTICIPANTS
**********
use rosters_participants, clear
keep pid pr_3 pr_4 hhid r_deviceid r_date
rename r_deviceid numero_tableta
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
*replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
*replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m pid using tracker
tab pr_3 sex, miss
list pid pr_3 sex if (pr_3 ~= sex +1) & _merge==3 /* list if sex differs between Roster and Resumen */
corr pr_4 age
list pid pr_4 age if abs(pr_4 - age) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Resumen */
drop _merge
order pid hhid
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

keep pid s_0 s_2_3 s_interid s_deviceid1 s_date
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
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker

tab pr_3 s_0, miss
list pid pr_3 s_0 if (pr_3 ~= s_0 +1) & _merge==3 /* list if sex differs between Roster and Socio */
corr pr_4 s_2_3
list pid pr_4 s_2_3 if abs(pr_4 - s_2_3) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Socio */

drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* PHYS
**********
use Phys, clear
keep pid p_interid p_deviceid1 p_date
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
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* COG
**********
use Cog, clear
keep pid c_interid c_deviceid1 all_image_files_found all_audio_files_found c_date
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
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* COG SCORING
**********
use Cog_Scoring, clear
keep pid cs_interid cs_date
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
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* INFORMANT
**********
use Infor, clear
keep pid i_interid i_deviceid1 i_date
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
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using tracker
drop _merge
save tracker, replace
d,s
sum

********** 
* HOUSEHOLD
**********

use Household, clear
keep hhid h_interid h_deviceid1 h_date
gen hhidr=real(hhid)
*drop if hhidr==.
egen duplic=count(hhid), by(hhid)
tab duplic
sort hhid
list hhid duplic if duplic>1 
gen existe_familiar=1 
*drop hhidr duplic
sum
*save hh_check.dta, replace
replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m hhid using tracker
drop _merge
order pid hhid
save tracker, replace
d,s
sum

********** 
* BLOOD
**********

if `country' ~= 2 {
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

if `country' == 0 {
gen B_in=XF7 if pid_en_sangre==1
replace B_in=" " if pid_en_sangre~=1

gen RSPCZIHXF7 = G_in+R_in + S_in + P_in + C_in + Z_in + I_in + H_in + B_in
tab RSPCZIHXF7
}

else if `country' == 1 {
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
rename s_2_3 edad_en_socio
rename age edad_en_resumen

drop Cluster House_ID

gen Cluster = substr(pid, 2, 2)
gen House_ID = substr(pid, 4, 3)

order pid hhid House_ID Cluster
sort pid


*********
**CDR***
********

if `country' == 2 {
	merge m:m pid using Cuba_CDR.dta
	drop _merge
}

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

drop s_interid p_interid i_interid h_interid cs_interid c_interid
drop s_deviceid1 p_deviceid1 i_deviceid1 c_deviceid1 all_image_files_found all_audio_files_found

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
export excel using "duplicates/tracker_door.xlsx", replace firstrow(variables)


clear

use tracker_full

*in this first version, we will focus only on the individual surveys (cog, cog_score, socio, infor, phys)

gen real_pid = real(pid)
sort real_pid
drop real_pid

drop if RSPCZIHXF7 == "GRSPCZIH"
drop if RSPCZIHXF7 == " RSPCZIH"
drop if RSPCZIHXF7 == "       H"
drop if RSPCZIHXF7 == " R      "
drop if RSPCZIHXF7 == " R     H"
drop if RSPCZIHXF7 == "  SPCZI "
drop if RSPCZIHXF7 == "G SPCZIH"
drop if RSPCZIHXF7 == "GRSPCZI "

*creating this to identify which cases are only in the resumen
gen solo_en_resumen = ""
replace solo_en_resumen = "solo en el resumen" if RSPCZIHXF7 == "G       "

drop edad_en_socio
drop sexo_en_socio
drop edad_en_resumen
drop existe_familiar pid_en_resumen pid_en_listas

foreach var in pid_en_infor pid_en_cog pid_en_cog_scor pid_en_phys pid_en_socio {
    tostring `var', replace
}
capture tostring pid_en_sangre, replace

foreach var in pid_en_infor pid_en_cog pid_en_cog_scor pid_en_phys pid_en_socio {
    replace `var' = " " if `var' == "1"
    replace `var' = "no presente" if `var' == "."
}

drop Cluster

rename pid_en_infor informante
rename pid_en_cog_scor scoring
rename pid_en_cog cognitiva
rename pid_en_phys examen_fisico
rename pid_en_socio sociodemografica

gen cluster = substr(pid, 2, 2)
gen casa = substr(pid, 4, 3)
gen participante = substr(pid, 8, 1)

drop sex
drop House_ID
drop numero_tableta
order cluster casa participante 

replace cluster = substr(hhid, 2, 2) if cluster == ""
replace casa = substr(hhid, 4, 3) if casa == ""

capture drop RSPCZIHXF7

gen is_duplicate = pid[_n] == pid[_n-1]
drop if is_duplicate == 1
drop is_duplicate

drop pid
drop hhid

gen all_missing = 1 if (informante == "no presente") & (scoring == "no presente") & (cognitiva == "no presente") & (examen_fisico == "no presente") & (sociodemografica == "no presente")
gen none_missing = 1 if (informante == " ") & (scoring == " ") & (cognitiva == " ") & (examen_fisico == " ") & (sociodemografica == " ")

drop if all_missing == 1
drop if none_missing == 1

drop none_missing all_missing
drop h_interid i_interid cs_interid h_deviceid1 s_interid all_audio all_image_files_found p_interid c_interid h_date r_date
capture drop XF7

rename c_deviceid1 tableta_cognitiva
rename i_deviceid1 tableta_informante
rename s_deviceid1 tableta_sociodemografico
rename p_deviceid1 tableta_examen_fisico

order tableta_informante tableta_cognitiva tableta_examen_fisico tableta_sociodemografico cluster casa participante i_date cs_date c_date p_date s_date	informante scoring cognitiva examen_fisico sociodemografica solo_en_resumen

capture replace pid_en_sangre = " " if pid_en_sangre == "1"

capture drop pid_en_sangre

export excel using "duplicates/casos_incompletos.xlsx", replace firstrow(variables)

clear
use tracker_slim
keep if RSPCZIHXF7 == "G       "

keep pid Cluster House_ID

capture export excel using "duplicates/in_resumen_not_in_data.xlsx", replace firstrow(variables)


log close
*exit, clear
