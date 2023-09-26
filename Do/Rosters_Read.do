clear all 
set more off
capture log close
log using Rosters, text replace

local country = 1

*Change the filepath name here to the folder containing the data and output folders
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
*local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

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
    insheet using "../PR_in/Roster_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Roster_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Roster_Parent.csv", comma names clear
}

// The only key variable here is the GPS coordinates. 
// There's no need label these
  
    save Roster_Parent.dta, replace
    
    clear all
    
if `country' == 0 {
    insheet using "../PR_in/Participants.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Participants.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Participants.csv", comma names clear
}


  
   drop globalrecordid
   rename fkey globalrecordid
   
    label variable pr_2_1 "¿Cuál es la relación de este miembro con el participante (#1)?"
   
rename pr_2_1 PR_2_1
   
    label define PR_2_1 0 "0 - Si Mismo" ///
    1 "1 - Esposo/a, pareja" ///
    2 "2 - Hijo(a)" ///
    3 "3 - Hijastro(a)" ///
    4 "4 - Hijo(a) adoptivo(a)" ///
    5 "5 - Hijo(a) de crianza" ///
    6 "6 - Madre/padre" ///
    7 "7 - Suegro(a)" ///
    8 "8 - Abuelo(a)" ///
    9 "9 - Nieto(a)" ///
    10 "10 - Bisnieto(a)" ///
    11 "11 - Yerno/nuera" ///
    12 "12 - Hermano(a)/Hermanastro(a)" ///
    13 "13 - Cuñado(a)/Concuños/Primos" ///
    14 "14 - Tío(a)" ///
    15 "15 - Sobrino(a)" ///
    16 "16 - Otro pariente" ///
    17 "17 - No pariente" ///
    88 "88 - No responde" ///
    99 "99 - No sabe"
    
encode PR_2_1, gen(pr_2_1) label(PR_2_1)
   
   label define PR_2_1_ 0 "si mismo" ///
    1 "esposo/a, pareja" ///
    2 "hijo(a)" ///
    3 "hijastro(a)" ///
    4 "hijo(a) adoptivo(a)" ///
    5 "hijo(a) de crianza" ///
    6 "madre/padre" ///
    7 "suegro(a)" ///
    8 "abuelo(a)" ///
    9 "nieto(a)" ///
    10 "bisnieto(a)" ///
    11 "yerno/nuera" ///
    12 "hermano(a)/hermanastro(a)" ///
    13 "cuñado(a)/concuños/primos" ///
    14 "tío(a)" ///
    15 "sobrino(a)" ///
    16 "otro pariente" ///
    17 "no pariente" ///
    88 "no responde" ///
    99 "no sabe"

   label values pr_2_1 PR_2_1_
   
*drop PR_2_1
   
   label variable pr_2_2 "¿Cuál es la relación de este miembro con el participante (#2)?"
   
rename pr_2_2 PR_2_2

label define PR_2_2 0 "0 - Si Mismo" ///
    1 "1 - Esposo/a, pareja" ///
    2 "2 - Hijo(a)" ///
    3 "3 - Hijastro(a)" ///
    4 "4 - Hijo(a) adoptivo(a)" ///
    5 "5 - Hijo(a) de crianza" ///
    6 "6 - Madre/padre" ///
    7 "7 - Suegro(a)" ///
    8 "8 - Abuelo(a)" ///
    9 "9 - Nieto(a)" ///
    10 "10 - Bisnieto(a)" ///
    11 "11 - Yerno/nuera" ///
    12 "12 - Hermano(a)/Hermanastro(a)" ///
    13 "13 - Cuñado(a)/Concuños/Primos" ///
    14 "14 - Tío(a)" ///
    15 "15 - Sobrino(a)" ///
    16 "16 - Otro pariente" ///
    17 "17 - No pariente" ///
18 "18 - No Hay Otro Participante" ///
    88 "88 - No responde" ///
    99 "99 - No sabe"
   
encode PR_2_2, gen(pr_2_2) label(PR_2_2)

label define PR_2_2_ 0 "si mismo" ///
    1 "esposo/a, pareja" ///
    2 "hijo(a)" ///
    3 "hijastro(a)" ///
    4 "hijo(a) adoptivo(a)" ///
    5 "hijo(a) de crianza" ///
    6 "madre/padre" ///
    7 "suegro(a)" ///
    8 "abuelo(a)" ///
    9 "nieto(a)" ///
    10 "bisnieto(a)" ///
    11 "yerno/nuera" ///
    12 "hermano(a)/hermanastro(a)" ///
    13 "cuñado(a)/concuños/primos" ///
    14 "tío(a)" ///
    15 "sobrino(a)" ///
    16 "otro pariente" ///
    17 "no pariente" ///
18 "no hay otro participante" ///
    88 "no responde" ///
    99 "no sabe"
   
label values pr_2_2 PR_2_2_
   
drop PR_2_2  
 
   label variable pr_2_3 "¿Cuál es la relación de este miembro con el participante (#3)?"
   
rename pr_2_3 PR_2_3
   
encode PR_2_3, gen(pr_2_3) label(PR_2_2)

label values pr_2_3 PR_2_2_

drop PR_2_3

   label variable pr_3 "¿Es hombre o mujer?"
 
generate PR_3 = cond(pr_3 == 0, "hombre", cond(pr_3 == 1, "mujer", ".a"))

drop pr_3

   label define PR_3 .a"." 1 "hombre" 2 "mujer"

   encode PR_3, gen(pr_3) label (PR_3)
   
drop PR_3
   
   label variable pr_4 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
 
label define PR_5 0 "0 - Ninguno" ///
    1 "1 - De 1 a 5" ///
    2 "2 - De 6 a 8" ///
    3 "3 - De 9 a 12" ///
    4 "4 - Más que 12" ///
    8 "8 - No responde" ///
    9 "9 - No sabe"   
    
rename pr_5 PR_5

encode PR_5, gen(pr_5) label(PR_5)
   
   label define PR_5_ 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values pr_5 PR_5_

    label define PR_6 1 "1 - Empleo pagado a tiempo completo" ///
    2 "2 - Empleo pagado a tiempo parcial" ///
    3 "3 - Desempleado (buscando trabajo)" ///
    4 "4 - Estudiante" ///
    5 "5 - Ama/Amo de casa" ///
    6 "6 - Retirado" ///
    8 "8 - No responde" ///
    9 "9 - No sabe"

rename pr_6 PR_6

encode PR_6, gen(pr_6) label(PR_6)

label define PR_6_ 1 "empleo pagado a tiempo completo" ///
    2 "empleo pagado a tiempo parcial" ///
    3 "desempleado (buscando trabajo)" ///
    4 "estudiante" ///
    5 "ama/amo de casa" ///
    6 "retirado" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values pr_6 PR_6_
    
drop PR_6
    
    save Participants.dta, replace
    
    clear all
 
if `country' == 0 {
    insheet using "../PR_in/NonParticipants.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/NonParticipants.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/NonParticipants.csv", comma names clear
}
  
   drop globalrecordid
   rename fkey globalrecordid
   
   label variable r_2_1 "¿Cuál es la relación de este miembro con el participante (#1)?"
   
rename r_2_1 R_2_1
   
   label define R_2_1 0 "0 - Si Mismo" ///
    1 "1 - Esposo/a, pareja" ///
    2 "2 - Hijo(a)" ///
    3 "3 - Hijastro(a)" ///
    4 "4 - Hijo(a) adoptivo(a)" ///
    5 "5 - Hijo(a) de crianza" ///
    6 "6 - Madre/padre" ///
    7 "7 - Suegro(a)" ///
    8 "8 - Abuelo(a)" ///
    9 "9 - Nieto(a)" ///
    10 "10 - Bisnieto(a)" ///
    11 "11 - Yerno/Nuera" ///
    12 "12 - Hermano(a)/Hermanastro(a)" ///
    13 "13 - Cuñado(a)/Concuños/Primos" ///
    14 "14 - Tío(a)" ///
    15 "15 - Sobrino(a)" ///
    16 "16 - Otro pariente" ///
    17 "17 - No Pariente" ///
    88 "88 - No responde" ///
    99 "99 - No sabe"
    
encode R_2_1, gen(r_2_1) label(R_2_1)

label define R_2_1_ 0 "si mismo" ///
    1 "esposo/a, pareja" ///
    2 "hijo(a)" ///
    3 "hijastro(a)" ///
    4 "hijo(a) adoptivo(a)" ///
    5 "hijo(a) de crianza" ///
    6 "madre/padre" ///
    7 "suegro(a)" ///
    8 "abuelo(a)" ///
    9 "nieto(a)" ///
    10 "bisnieto(a)" ///
    11 "yerno/nuera" ///
    12 "hermano(a)/hermanastro(a)" ///
    13 "cuñado(a)/concuños/primos" ///
    14 "tío(a)" ///
    15 "sobrino(a)" ///
    16 "otro pariente" ///
    17 "no pariente" ///
    88 "no responde" ///
    99 "no sabe"

   label values r_2_1 R_2_1_
   
drop R_2_1
   
   label variable r_2_2 "¿Cuál es la relación de este miembro con el participante (#2)?"
   
rename r_2_2 R_2_2

label define R_2_2 0 "0 - Si Mismo" ///
    1 "1 - Esposo/a, pareja" ///
    2 "2 - Hijo(a)" ///
    3 "3 - Hijastro(a)" ///
    4 "4 - Hijo(a) adoptivo(a)" ///
    5 "5 - Hijo(a) de crianza" ///
    6 "6 - Madre/padre" ///
    7 "7 - Suegro(a)" ///
    8 "8 - Abuelo(a)" ///
    9 "9 - Nieto(a)" ///
    10 "10 - Bisnieto(a)" ///
    11 "11 - Yerno/Nuera" ///
    12 "12 - Hermano(a)/Hermanastro(a)" ///
    13 "13 - Cuñado(a)/Concuños/Primos" ///
    14 "14 - Tío(a)" ///
    15 "15 - Sobrino(a)" ///
    16 "16 - Otro pariente" ///
    17 "17 - No Pariente" ///
18 "18 - No Hay Otro Participante" ///
    88 "88 - No responde" ///
    99 "99 - No sabe"

encode R_2_2, gen(r_2_2) label(R_2_2)

label define R_2_2_ 0 "si mismo" ///
    1 "esposo/a, pareja" ///
    2 "hijo(a)" ///
    3 "hijastro(a)" ///
    4 "hijo(a) adoptivo(a)" ///
    5 "hijo(a) de crianza" ///
    6 "madre/padre" ///
    7 "suegro(a)" ///
    8 "abuelo(a)" ///
    9 "nieto(a)" ///
    10 "bisnieto(a)" ///
    11 "yerno/nuera" ///
    12 "hermano(a)/hermanastro(a)" ///
    13 "cuñado(a)/concuños/primos" ///
    14 "tío(a)" ///
    15 "sobrino(a)" ///
    16 "otro pariente" ///
    17 "no pariente" ///
18 "no hay otro participante" ///
    88 "no responde" ///
    99 "no sabe"

label values r_2_2 R_2_2_

drop R_2_2
   
   label variable r_2_3 "¿Cuál es la relación de este miembro con el participante (#3)?"
   
rename r_2_3 R_2_3

encode R_2_3, gen(r_2_3) label(R_2_2)

label values r_2_3 R_2_2_

*drop R_2_3

   label variable r_3 "¿Es hombre o mujer?"
   
generate R_3 = cond(r_3 == 0, "hombre", cond(r_3 == 1, "mujer", ".a"))

drop r_3

   label define R_3 .a"." 1 "hombre" 2 "mujer"

   encode R_3, gen(r_3) label (R_3)
   
drop R_3
   
   label variable r_4 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
   
rename r_5 R_5
   
   label define R_5 0 "0 - Ninguno" ///
    1 "1 - De 1 a 5" ///
    2 "2 - De 6 a 8" ///
    3 "3 - De 9 a 12" ///
    4 "4 - Más que 12" ///
    8 "8 - No responde" ///
    9 "9 - No sabe"
    
encode R_5, gen(r_5) label (R_5)

label define R_5_ 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
label values r_5 R_5_
    
drop R_5

rename r_6 R_6

label define R_6 1 "1 - Empleo pagado a tiempo completo" ///
    2 "2-  Empleo pagado a tiempo parcial" ///
    3 "3 - Desempleado (buscando trabajo)" ///
    4 "4 - Estudiante" ///
    5 "5 - Ama/Amo de casa" ///
    6 "6 - Retirado" ///
    8 "8-  No responde" ///
    9 "9 - No sabe"
    
encode R_6, gen(r_6) label(R_6)

    label define R_6_ 1 "empleo pagado a tiempo completo" ///
    2 "empleo pagado a tiempo parcial" ///
    3 "desempleado (buscando trabajo)" ///
    4 "estudiante" ///
    5 "ama/amo de casa" ///
    6 "retirado" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values r_6 R_6_
    
drop R_6
    
    save NonParticipants.dta, replace
    
    clear all

if `country' == 0 {
    insheet using "../PR_in/NonResidentChildren.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/NonResidentChildren.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/NonResidentChildren.csv", comma names clear
}
     
    drop globalrecordid
   rename fkey globalrecordid
   
   label variable cr_2 "2. ¿Cuál es el número de código de su madre?"
   
   label variable cr_3 "2. ¿Cuál es el número de código de su padre?"
   
   label variable cr_4 "¿Es hombre o mujer?"
  
generate CR_4 = cond(cr_4 == 1, "hombre", cond(cr_4 == 2, "mujer", ".a"))

drop cr_4

   label define CR_4 .a"." 1 "hombre" 2 "mujer"

   encode CR_4, gen(cr_4) label (CR_4)
   
drop CR_4
   
   label variable cr_5 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
   
rename cr_6 CR_6
   
   label define CR_6 0 "0 - Ninguno" ///
    1 "1 - De 1 a 5" ///
    2 "2 - De 6 a 8" ///
    3 "3 - De 9 a 12" ///
    4 "4 - Más que 12" ///
    8 "8 - No responde" ///
    9 "9 - No sabe"
    
encode CR_6, gen(cr_6) label(CR_6)

label define CR_6_ 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values cr_6 CR_6_
    
drop CR_6

rename cr_7 CR_7
    
    label define CR_7 1 "1 - Dentro de 15 minutos de aquí" ///
    2 "2 - Dentro de una hora de aquí" ///
    3 "3 - Otra parte del país" ///
    4 "4 - Otra parte, Estados Unidos" ///
    5 "5 - Otro país" ///
    8 "8 - No responde" ///
    9 "9 - No sabe"
    
encode CR_7, gen(cr_7) label(CR_7)

label define CR_7_ 1 "dentro de 15 minutos de aquí" ///
    2 "dentro de una hora de aquí" ///
    3 "otra parte del país" ///
    4 "otra parte, estados unidos" ///
    5 "otro país" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values cr_7 CR_7_
    
drop CR_7

    save NonResidentChildren.dta, replace
    
    clear all

if `country' == 0 {
    insheet using "../PR_in/MainHousehold.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/MainHousehold.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/MainHousehold.csv", comma names clear
}

//the key variables here are

   drop fkey
   
   label variable r_date "FECHA"
   label variable r_interid "NUMERO DEL ENTREVISTADOR"
   label variable r_houseid "NÚMERO DE LA CASA"
   label variable r_clustid "NUMERO DEL CLUSTER"
   label variable r_country "pais"
   
   replace r_date = subinstr(r_date,substr(r_date, strlen(r_date)-11, strlen(r_date)), "",.) if strlen(r_date)>=12
   replace r_date = subinstr(r_date, " ", "",.)
   replace r_date = subinstr(r_date, "/", "-",.)
   gen r_survey_date = date(r_date, "MDY")
   format r_survey_date %td
   
  save MainHousehold.dta, replace

 d
 sum
 list
 
  merge 1:m globalrecordid using "Participants.dta"
  
  drop _merge

  gen r_country_str = string(r_country, "%12.0f")

gen r_clustid_str = string(r_clustid, "%12.0f")
replace r_clustid_str = cond(strlen(r_clustid_str) == 1, "0" + r_clustid_str, r_clustid_str)

gen r_houseid_str = string(r_houseid, "%03.0f")
replace r_houseid_str = cond(strlen(r_houseid_str) == 1, "00" + r_houseid_str, r_houseid_str)
replace r_houseid_str = cond(strlen(r_houseid_str) == 2, "0" + r_houseid_str, r_houseid_str)

recode pr_person_number (missing = "0")
gen pr_particid_str = string(pr_person_number, "%12.0f")

replace pr_particid_str = cond(strlen(pr_particid_str) == 1, "0" + pr_particid_str, pr_particid_str)

gen pid = r_country_str + r_clustid_str + r_houseid_str + pr_particid_str
gen hhid = r_country_str + r_clustid_str + r_houseid_str
drop r_country_str r_clustid_str r_houseid_str pr_particid_str

 save rosters_participants.dta,replace
 export excel using "Rosters_Participants.xlsx", firstrow(variables) nolabel replace

 
  clear all
  
  use "MainHousehold.dta"
 
 merge 1:m globalrecordid using "NonParticipants.dta"
 
 drop _merge

 save rosters_merged2.dta,replace
 
 clear all
 
 use "MainHousehold.dta"
 
  merge 1:m globalrecordid using "NonResidentChildren.dta"

 save rosters_merged3.dta,replace
 
 //now we append all three
 
 use "rosters_participants.dta"
 append using "rosters_merged2.dta"
 append using "rosters_merged3.dta"

drop _merge

capture log close
log using logs/RostersMissingCodebook, text replace

codebook

log close


 save rosters_merged.dta,replace
 export excel using "Rosters_Merged.xlsx", firstrow(variables) nolabel replace
 
   d
 sum
 list
 
  
 log close
 *exit, clear
 
 
