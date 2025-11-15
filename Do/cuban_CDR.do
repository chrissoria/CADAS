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

cd "`path'/CUBA_out"

import excel using "../CUBA_in/CogEval-sample t con pid.xls", firstrow clear

gen c_country_str = "2"

replace Cluster = Cluster*10 if Cluster < 1
gen c_clustid_str = string(Cluster, "%12.0f")
replace c_clustid_str = cond(strlen(c_clustid_str) == 1, "0" + c_clustid_str, c_clustid_str)

replace Casa = Casa*10 if Casa < 1
gen c_houseid_str = string(Casa, "%03.0f")
replace c_houseid_str = cond(strlen(c_houseid_str) == 1, "00" + c_houseid_str, c_houseid_str)
replace c_houseid_str = cond(strlen(c_houseid_str) == 2, "0" + c_houseid_str, c_houseid_str)

replace Participante = Participante*10 if Participante < 1
gen c_particid_str = string(Participante, "%12.0f")
replace c_particid_str = cond(strlen(c_particid_str) == 1, "0" + c_particid_str, c_particid_str)

drop pid
gen pid = c_country_str + c_clustid_str + c_houseid_str + c_particid_str
gen hhid = c_country_str + c_clustid_str + c_houseid_str

*juan, or somebody, seems to have typed in the wrong houseid here
replace pid = "20302901" if pid == "20302501"
replace pid = "20302501" if pid == "20302502"

rename Diagnóstico cuban_clinical_diagnosis
rename CDR cuban_CDR
rename F supp
rename Sexo CDR_sex
rename Edad_en_resumen CDR_age

replace cuban_clinical_diagnosis = supp if cuban_clinical_diagnosis == ""

keep pid hhid cuban_clinical_diagnosis cuban_CDR CDR_sex CDR_age

drop if pid == ""
drop if cuban_clinical_diagnosis == ""
sort pid

* drop the duplicates

duplicates tag pid, gen(dup_pid_flag)
bysort pid: drop if _n == 1 & dup_pid_flag > 0

gen cuba_CDR_binary = 0 if cuban_CDR != .
replace cuba_CDR_binary = 1 if cuban_CDR > .5 & cuban_CDR != .
*replace cuba_CDR_binary = 0 if cuban_CDR == 2

order pid cuban_clinical_diagnosis cuban_CDR cuba_CDR_binary

drop dup_pid_flag

save Cuba_CDR.dta, replace
