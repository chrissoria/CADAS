clear all 
set more off
capture log close
log using Door, text replace

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

if `country' == 0 {
    insheet using "../PR_in/InformationDoor.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/InformationDoor.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/InformationDoor.csv", comma names clear
}
   
   
   rename globalrecordid globalrecordid1
   rename fkey globalrecordid
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime firstsavetime
   
   label variable d_1 "Relation to the household"
 
   replace d_date = subinstr(d_date,substr(d_date, strlen(d_date)-11, strlen(d_date)), "",.) if strlen(d_date)>=12
   replace d_date = subinstr(d_date, " ", "",.)
   replace d_date = subinstr(d_date, "/", "-",.)
   gen d_survey_date = date(d_date, "MDY")
   format d_survey_date %td
   
   drop d_date
 
   label variable d_2 "2. Número de personas de edad <= 15"
 
   label variable d_3 "3. Número de personas de edad entre 16 y 39 años "
 
   label variable d_4 "4. Número de personas de edad entre 40 y 64 años"
 
   label variable d_5 "5. Número de hombres de edad >= 65"
 
   label variable d_6 "6. Número de mujeres de edad >= 65"
   
   label variable d_0 "¿Pudo hacer la entrevista toca-puerta?"
   
   label variable d_1 "1. Informante es:"
   
   label variable d_15 "15. Cual es la razón por no poder hacer la entrevista? [Marque la primera respuesta que corresponda]"
   
   rename d_0 (D_0)
   
   capture confirm numeric variable D_0
   if !_rc{
       tostring D_0, replace
   } 
   
   gen D_0_trimmed = ustrlower(ustrtrim(D_0))
   replace D_0 = D_0_trimmed
   drop D_0_trimmed
   
   label define D_0 .a"." 0 "no"1 "si"
   
   encode D_0, gen(d_0) label (D_0)

   rename d_1 D_1
   capture confirm numeric variable D_1
   if !_rc{
       tostring D_1, replace
   } 
   gen D_1_trimmed = ustrlower(ustrtrim(D_1))
   replace D_1 = D_1_trimmed
   drop D_1_trimmed

   label define D_1 .a"." 1 "miembro del hogar"2 "vecino"3 "otro"8 "no responde"9 "no sabe"
   encode D_1, gen(d_1) label (D_1)
   
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

   
   drop globalrecordid
   rename fkey globalrecordid1
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime firstsavetime
    
   label variable d_7_1 "7.1 Edad aproximada"

   label variable d_7_2 "7.2 Sexo"
   
   rename d_7_2 D_7_2
   capture confirm numeric variable D_7_2
   if !_rc{
       tostring D_7_2, replace
   } 
   gen D_7_2_trimmed = ustrlower(ustrtrim(D_7_2))
   replace D_7_2 = D_7_2_trimmed
   drop D_7_2_trimmed

   label define D_7_2 .a"." 1 "hombre"2 "mujer"8 "no responde"
  
   encode D_7_2, gen(d_7_2) label (D_7_2)
   
   label variable d_7_3 "7.3 Salud física"
   
   rename d_7_3 D_7_3
   capture confirm numeric variable D_7_3
   if !_rc{
       tostring D_7_3, replace
   } 
   gen D_7_3_trimmed = ustrlower(ustrtrim(D_7_3))
   replace D_7_3 = D_7_3_trimmed
   drop D_7_3_trimmed

   label define D_7_3 .a"." 1 "buena/regular"2 "mala"8 "no responde"9 "no sabe"
   encode D_7_3, gen(d_7_3) label (D_7_3)
   
   label variable d_7_4 "7.4 Salud Cognitiva"

   rename d_7_4 D_7_4
   capture confirm numeric variable D_7_4
   if !_rc{
       tostring D_7_4, replace
   } 
   gen D_7_4_trimmed = ustrlower(ustrtrim(D_7_4))
   replace D_7_4 = D_7_4_trimmed
   drop D_7_4_trimmed

   label define D_7_4 .a"." 1 "buena/regular"2 "mala"8 "no responde"9 "no sabe"
   encode D_7_4, gen(d_7_4) label (D_7_4)
   
   label variable d_7_5 "7.5 Resultados del intento de las entrevistas"

   rename d_7_5 D_7_5
   capture confirm numeric variable D_7_5
   if !_rc{
       tostring D_7_5, replace
   } 
   gen D_7_5_trimmed = ustrlower(ustrtrim(D_7_5))
   replace D_7_5 = D_7_5_trimmed
   drop D_7_5_trimmed

   label define D_7_5 .a"." 1 "completa"2 "parcial"3 "incapacitado"4 "indisponible"5 "rechazada"
   encode D_7_5, gen(d_7_5) label (D_7_5)

   
   save InformationDoorParticipants.dta, replace
   
   clear
   
    if `country' == 0 {
    insheet using "../PR_in/Door_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Door_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Door_Parent.csv", comma names clear
}
   
   drop uniquekey recstatus firstsavelogonname lastsavelogonname lastsavetime fkey firstsavetime
   
   save Door.dta, replace
   
   merge 1:m globalrecordid using "InformationDoor.dta"
  
   drop _merge

   save door_merged1.dta,replace
   
   clear all
   
   use "InformationDoor.dta" //just replace this with informationdoor instead and skip whole step above
 
   merge 1:m globalrecordid1 using "InformationDoorParticipants.dta"
 
   drop _merge globalrecordid

   save door_merged_all.dta,replace
   
   clear all
   
   log close
