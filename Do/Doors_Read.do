clear all 
set more off
capture log close

capture include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/global/home/users/chrissoria/Desktop/Stata_CADAS/Data"
include "/global/home/users/chrissoria/Desktop/Stata_CADAS/Do/Read/CADAS_country_define.do"

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
    insheet using "../PR_in/InformationDoor.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/InformationDoor.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/InformationDoor.csv", comma names clear
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

if `country' == 0 {
    insheet using "../PR_in/InformationDoor.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/InformationDoor.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/InformationDoor.csv", comma names clear
}
}

drop v1   
rename d_clustid d_clustid2
rename d_houseid d_houseid2
rename d_interid d_interid2
   
   rename globalrecordid globalrecordid1
   duplicates drop globalrecordid1, force
   rename fkey globalrecordid
   
   label variable d_1 "Relation to the household"
 
   label variable d_2 "2. Número de personas de edad <= 15"
 
   label variable d_3 "3. Número de personas de edad entre 16 y 39 años "
 
   label variable d_4 "4. Número de personas de edad entre 40 y 64 años"
 
   label variable d_5 "5. Número de hombres de edad >= 65"
 
   label variable d_6 "6. Número de mujeres de edad >= 65"
   
   label variable d_0 "¿Pudo hacer la entrevista toca-puerta?"
   
   label variable d_1 "1. Informante es:"
   
   label variable d_15 "15. Cual es la razón por no poder hacer la entrevista? [Marque la primera respuesta que corresponda]"
   
   label define D_0 .a"." 0 "no"1 "si"

label values d_0 D_0

recode d_1 (0=1) (1=2) (2=3) (3=8) (4=9)

label define D_1 .a"." 1 "miembro del hogar"2 "vecino"3 "otro"8 "no responde"9 "no sabe"

label values d_1 D_1
   
   rename d_15 D_15
   capture confirm numeric variable D_15
   if !_rc{
       tostring D_15, replace
   } 
   gen D_15_trimmed = ustrlower(ustrtrim(D_15))
   replace D_15 = D_15_trimmed
   drop D_15_trimmed

   label define D_15 .a"." 0 "casa esta deshabitada"1 "parece habitada pero nadie abrió la puerta"2 "los presentes no sabían las respuestas"3 "rechazada"
   encode D_15, gen(d_15) label (D_15)
   
   save InformationDoor.dta, replace
   
   clear all
   
 if `country' == 0 {
    insheet using "../PR_in/InformationDoorParticipants.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/InformationDoorParticipants.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/InformationDoorParticipants.csv", comma names clear
}

gsort fkey -d_7_1
 
by fkey: gen d_particid = _n

duplicates drop globalrecordid, force

   drop globalrecordid
   rename fkey globalrecordid1
    
   label variable d_7_1 "7.1 Edad aproximada"

   label variable d_7_2 "7.2 Sexo"
   
generate D_7_2 = cond(d_7_2 == 0, "hombre", cond(d_7_2 == 1, "mujer", cond(d_7_2 == 2, "no responde", "")))

drop d_7_2

   label define D_7_2 .a"." 0 "hombre"1 "mujer"2 "no responde"
   
encode D_7_2, gen(d_7_2) label (D_7_2)

drop D_7_2
   
   label variable d_7_3 "7.3 Salud física"
   
generate D_7_3 = cond(d_7_3 == 0, "buena/regular", cond(d_7_3 == 1, "mala", cond(d_7_3 == 2, "no responde", cond(d_7_3 == 3, "no sabe", ""))))

drop d_7_3

   label define D_7_3 .a"." 1 "buena/regular"2 "mala"8 "no responde"9 "no sabe"
   
   encode D_7_3, gen(d_7_3) label (D_7_3)
   
drop D_7_3
   
   label variable d_7_4 "7.4 Salud Cognitiva"
   
generate D_7_4 = cond(d_7_4 == 0, "buena/regular", cond(d_7_4 == 1, "mala", cond(d_7_4 == 2, "no responde", cond(d_7_4 == 3, "no sabe", ""))))

drop d_7_4

   label define D_7_4 .a"." 1 "buena/regular"2 "mala"8 "no responde"9 "no sabe"
   
   encode D_7_4, gen(d_7_4) label (D_7_4)
   
drop D_7_4
   
   label variable d_7_5 "7.5 Resultados del intento de las entrevistas"
   
generate D_7_5 = cond(d_7_5 == 0, "completa", cond(d_7_5 == 1, "parcial", cond(d_7_5 == 2, "incapacitado", cond(d_7_5 == 3, "indisponible", cond(d_7_5 == 4,"rechazada", "")))))

drop d_7_5

   label define D_7_5 .a"." 1 "completa"2 "parcial"3 "incapacitado"4 "indisponible"5 "rechazada"
   
   encode D_7_5, gen(d_7_5) label (D_7_5)

drop D_7_5
   
   save InformationDoorParticipants.dta, replace
   
   clear
   
    if `country' == 0 {
    insheet using "../PR_in/Door.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Door.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Door.csv", comma names clear
}
drop v1
duplicates drop globalrecordid, force


   replace p_date = subinstr(p_date,substr(p_date, strlen(p_date)-11, strlen(p_date)), "",.) if strlen(p_date)>=12
   replace p_date = subinstr(p_date, " ", "",.)
   replace p_date = subinstr(p_date, "/", "-",.)
   gen d_survey_date = date(p_date, "MDY")
   format d_survey_date %td
   
   drop p_date   
   save Door.dta, replace
   
   
   *merging information door to door should be a 1:1 match, seeing 1 to many, implies maybe we are using one parent for many door knocking
   merge 1:m globalrecordid using "InformationDoor.dta"
  
   drop _merge

   save door_merged1.dta,replace
    
*something is going on here where InformationDoor isn't unique
merge m:m globalrecordid1 using "InformationDoorParticipants.dta"
 
   drop _merge
   
replace d_0 = .i if (d_0 == . | d_0 == .a)
*check if si and no are 0/1 or 1/2 for this question (affects logic on following questions)

replace d_15 = .i if (d_15 == . | d_15 == .a) & (d_0 == 0 | d_0 == .i)
replace d_15 = .v if (d_15 == . | d_15 == .a) & d_0 == 1

replace d_1 = .i if (d_1 == . | d_1 == .a) & (d_0 == 1 | d_0 == .i)
replace d_1 = .v if (d_1 == . | d_1 == .a) & d_0 == 0

replace d_2 = .i if (d_2 == . | d_2 == .a) & (d_0 == 1 | d_0 == .i)
replace d_2 = .v if (d_2 == . | d_2 == .a) & d_0 == 0

replace d_3 = .i if (d_3 == . | d_3 == .a) & (d_0 == 1 | d_0 == .i)
replace d_3 = .v if (d_3 == . | d_3 == .a) & d_0 == 0

replace d_4 = .i if (d_4 == . | d_4 == .a) & (d_0 == 1 | d_0 == .i)
replace d_4 = .v if (d_4 == . | d_4 == .a) & d_0 == 0

replace d_5 = .i if (d_5 == . | d_5 == .a) & (d_0 == 1 | d_0 == .i)
replace d_5 = .v if (d_5 == . | d_5 == .a) & d_0 == 0

replace d_6 = .i if (d_6 == . | d_6 == .a) & (d_0 == 1 | d_0 == .i)
replace d_6 = .v if (d_6 == . | d_6 == .a) & d_0 == 0

replace d_7_1 = .v if (d_7_1 == . | d_7_1 == .a) & (d_0 == 0 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .v) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .v)))
replace d_7_2 = .v if (d_7_2 == . | d_7_2 == .a) & (d_0 == 0 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .v) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .v)))
replace d_7_3 = .v if (d_7_3 == . | d_7_3 == .a) & (d_0 == 0 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .v) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .v)))
replace d_7_4 = .v if (d_7_4 == . | d_7_4 == .a) & (d_0 == 0 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .v) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .v)))
replace d_7_5 = .v if (d_7_5 == . | d_7_5 == .a) & (d_0 == 0 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .v) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .v)))

replace d_7_1 = .i if (d_7_1 == . | d_7_1 == .a)
replace d_7_2 = .i if (d_7_2 == . | d_7_2 == .a)
replace d_7_3 = .i if (d_7_3 == . | d_7_3 == .a)
replace d_7_4 = .i if (d_7_4 == . | d_7_4 == .a)
replace d_7_5 = .i if (d_7_5 == . | d_7_5 == .a)

*filling this in because interviewers aren't
if `country' == 0 {
    replace d_country = 0
}

else if `country' == 1 {
    replace d_country = 1
}

else if `country' == 2 {
    replace d_country = 2
}

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values d_country country_label

replace d_clustid = d_clustid2 if d_clustid == 0 | missing(d_clustid)
replace d_houseid = d_houseid2 if d_houseid == 0 | missing(d_houseid)
replace d_interid = d_interid2 if d_interid == 0 | missing(d_interid)

gen d_country_str = string(d_country, "%12.0f")

gen d_clustid_str = string(d_clustid, "%12.0f")
replace d_clustid_str = cond(strlen(d_clustid_str) == 1, "0" + d_clustid_str, d_clustid_str)

gen d_houseid_str = string(d_houseid, "%03.0f")
replace d_houseid_str = cond(strlen(d_houseid_str) == 1, "00" + d_houseid_str, d_houseid_str)
replace d_houseid_str = cond(strlen(d_houseid_str) == 2, "0" + d_houseid_str, d_houseid_str)

gen d_particid_str = string(d_particid, "%12.0f")

gen pid = d_country_str + d_clustid_str + d_houseid_str + d_particid_str
replace pid = "." if strpos(pid, ".") > 0

gen hhid = d_country_str + d_clustid_str + d_houseid_str
replace hhid = "." if strpos(hhid, ".") > 0

drop d_particid_str d_clustid_str d_houseid_str d_country_str informationdoor informationdoorparticipants d_date p_interid pais
capture drop dp_deviceid dp_time di_deviceid2 di_time2 di_time1 di_deviceid1 v1 d_survey_date d_time1
*drop d_clustid2 d_houseid2 d_interid2
order pid hhid d_particid


save door_merged_all.dta,replace


capture log close
log using logs/InformationDoorMissingCodebook, text replace

codebook

   save InformationDoorMissing, replace


log close
log using logs/InformationDoorOnlyMissing, text replace

local missvarlist
foreach v of var * {
	capture confirm str var `v'
	if _rc == 0 {
		quietly count if `v' == ".i"
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
	else {
		quietly count if `v' == .i
		if r(N) > 5 {
			local missvarlist `missvarlist' `v'
		}
	}
}

*macro list missvarlist

foreach v of local missvarlist {
	codebook `v'
}

capture log close
log using logs/DoorsMissingCodebook, text replace

codebook

log close

drop if missing(d_particid)

save door_participants.dta, replace

exit, clear
