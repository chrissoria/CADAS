clear all 
set more off
capture log close
log using Rosters, text replace

 cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
 
  insheet using "../CUBA_in/Roster_Parent.csv", comma names clear
// The only key variable here is the GPS coordinates. 
// There's no need label these
 
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime
  
    save Roster_GPS.dta, replace
    
    clear all
    
  insheet using "../CUBA_in/Participants.csv", comma names clear
  
   drop globalrecordid
   rename fkey globalrecordid
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime
   
    label variable pr_2_1 "¿Cuál es la relación de este miembro con el participante (#1)?"
   
   label define PR_2_1 0 "si mismo" ///
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

   label values pr_2_1 PR_2_1
   
   label variable pr_2_2 "¿Cuál es la relación de este miembro con el participante (#2)?"
   
   label define PR_2_2 0 "si mismo" ///
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

   label values pr_2_2 PR_2_2
   
   label variable pr_2_3 "¿Cuál es la relación de este miembro con el participante (#3)?"
   
   label define PR_2_3 0 "si mismo" ///
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

   label values pr_2_3 PR_2_3

   label variable pr_3 "¿Es hombre o mujer?"
   
   rename pr_3 (PR_3)

   capture confirm numeric variable PR_3
   if !_rc{
        tostring PR_3, replace
   }

   gen PR_3_trimmed = ustrlower(ustrtrim(PR_3))
   replace PR_3 = PR_3_trimmed
   drop PR_3_trimmed

   label define PR_3 .a"." 1 "hombre" 2 "mujer"

   encode PR_3, gen(pr_3) label (PR_3)
   
   label variable pr_4 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
   
   label define PR_5 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values pr_5 PR_5

    label define PR_6 1 "empleo pagado a tiempo completo" ///
    2 "empleo pagado a tiempo parcial" ///
    3 "desempleado (buscando trabajo)" ///
    4 "estudiante" ///
    5 "ama/amo de casa" ///
    6 "retirado" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values pr_6 PR_6
    
    save Participants.dta, replace
    
    clear all
    
  insheet using "../CUBA_in/NonParticipants.csv", comma names clear
  
   drop globalrecordid
   rename fkey globalrecordid
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime
   
   label variable r_2_1 "¿Cuál es la relación de este miembro con el participante (#1)?"
   
   label define R_2_1 0 "si mismo" ///
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

   label values r_2_1 R_2_1
   
   label variable r_2_2 "¿Cuál es la relación de este miembro con el participante (#2)?"
   
   label define R_2_2 0 "si mismo" ///
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

   label values r_2_2 R_2_2
   
   label variable r_2_3 "¿Cuál es la relación de este miembro con el participante (#3)?"
   
   label define R_2_3 0 "si mismo" ///
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

   label values r_2_3 R_2_3

   label variable r_3 "¿Es hombre o mujer?"
   
   rename r_3 (R_3)

   capture confirm numeric variable R_3
   if !_rc{
        tostring R_3, replace
   }

   gen R_3_trimmed = ustrlower(ustrtrim(R_3))
   replace R_3 = R_3_trimmed
   drop R_3_trimmed

   label define R_3 .a"." 1 "hombre" 2 "mujer"

   encode R_3, gen(r_3) label (R_3)
   
   label variable r_4 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
   
   label define R_5 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values r_5 R_5

    label define R_6 1 "empleo pagado a tiempo completo" ///
    2 "empleo pagado a tiempo parcial" ///
    3 "desempleado (buscando trabajo)" ///
    4 "estudiante" ///
    5 "ama/amo de casa" ///
    6 "retirado" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values r_6 R_6
    
    save NonParticipants.dta, replace
    
    clear all
    
  insheet using "../CUBA_in/NonResidentChildren.csv", comma names clear
     
    drop globalrecordid
   rename fkey globalrecordid
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime
   
   label variable cr_2 "2. ¿Cuál es el número de código de su madre?"
   
   label variable cr_3 "2. ¿Cuál es el número de código de su padre?"
   
   label variable cr_4 "¿Es hombre o mujer?"
   
   rename cr_4 (CR_4)

   capture confirm numeric variable CR_4
   if !_rc{
        tostring CR_4, replace
   }

   gen CR_4_trimmed = ustrlower(ustrtrim(CR_4))
   replace CR_4 = CR_4_trimmed
   drop CR_4_trimmed

   label define CR_4 .a"." 1 "hombre" 2 "mujer"

   encode CR_4, gen(cr_4) label (CR_4)
   
   label variable cr_5 "¿Cuántos años tiene? Registrar en años (edad aproximada si no se sabe exactamente)"
   
   label define CR_6 0 "ninguno" ///
    1 "de 1 a 5" ///
    2 "de 6 a 8" ///
    3 "de 9 a 12" ///
    4 "más que 12" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values cr_6 CR_6
    
    label define CR_7 1 "dentro de 15 minutos de aquí" ///
    2 "dentro de una hora de aquí" ///
    3 "otra parte del país" ///
    4 "otra parte, estados unidos" ///
    5 "otro país" ///
    8 "no responde" ///
    9 "no sabe"
    
    label values cr_7 CR_7

    save NonResidentChildren.dta, replace
    
    clear all


 insheet using "../CUBA_in/MainHousehold.csv", comma names clear
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
  
  *dropped below because junk
  drop if inlist(globalrecordid, "6960e6a6-29c2-4567-8826-48f40918d8e0","dd6d514a-0dc6-4ba6-ac6b-6d6ba99b9585","6960e6a6-29c2-4567-8826-48f40918d8e0","44842eb7-f3f0-4a28-bd83-e4d895bf44fe","0d9ad36e-e19e-4a95-8a75-fae393587e17")
  *is dropped below has person id 201004, for which there appears to be two entries for (both have the same age, gender, etc) I'm dropping the one that looks more correct
  drop if inlist(globalrecordid, "34bab32c-fbce-492b-b488-e9bbeed4f14f")
  *is dropped because duplicate, contradicting gender, and missing info has personid 20103501
  drop if inlist(globalrecordid, "1444788e-6d3b-439d-b241-468191f55b5a")
  *is dropped below because suplicate and another case has all of the exact same information
  drop if inlist(globalrecordid, "1e5c9452-4c2a-4a43-831d-dbb2616b8d1e")
  *two weird things about the case below
  *First, both cases have the same male gender
  *Second, both have the same person number, but one is "esposo/a" and the other is si mismo
  *for now, I will recode the case the came after as person 2
  
  replace pr_person_number = 2 if globalrecordid == "1303aefe-487f-4e40-a58b-c4e1ffc323c2"

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

 save rosters_merged.dta,replace
 export excel using "Rosters_Merged.xlsx", firstrow(variables) nolabel replace
 
   d
 sum
 list
 
  
 log close
 exit, clear