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

cd "`path'/DR_out"

import excel using "../DR_in/Calificacion CDR.xlsx", firstrow clear

drop Evalaudora L M N O P Q R S T U V W X Cuidadopersonal

gen c_country_str = "1"

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

gen pid = c_country_str + c_clustid_str + c_houseid_str + c_particid_str
gen hhid = c_country_str + c_clustid_str + c_houseid_str

*juan, or somebody, seems to have typed in the wrong houseid here
replace pid = "20302901" if pid == "20302501"
replace pid = "20302501" if pid == "20302502"

rename ValoracionCDR dr_CDR

keep pid hhid dr_CDR

drop if pid == ""
drop if dr_CDR == ""
sort pid

* drop the duplicates

duplicates drop pid, force

destring dr_CDR, replace

gen dr_CDR_binary = 0 if dr_CDR != .
replace dr_CDR_binary = 1 if dr_CDR > .5 & dr_CDR != .
*replace dr_CDR_binary = 0 if dr_CDR == 2

order pid dr_CDR dr_CDR_binary

save dr_CDR.dta, replace
