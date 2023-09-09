clear all 
set more off
capture log close

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

   
   drop globalrecordid
   rename fkey globalrecordid1
    
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
    insheet using "../PR_in/Door.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Door.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Door.csv", comma names clear
}
   
   
   save Door.dta, replace
   
   merge 1:m globalrecordid using "InformationDoor.dta"
  
   drop _merge

   save door_merged1.dta,replace
   
   clear all
   
   use "InformationDoor.dta" //just replace this with informationdoor instead and skip whole step above
 
   merge 1:m globalrecordid1 using "InformationDoorParticipants.dta"
 
   drop _merge globalrecordid
   
log using InformationDoorMissing, text replace
   
   
replace d_0 = .i if (d_0 == . | d_0 == .a)
*check if si and no are 0/1 or 1/2 for this question (affects logic on following questions)

replace d_15 = .i if (d_15 == . | d_15 == .a) & (d_0 == 2 | d_0 == .i)
replace d_15 = .v if (d_15 == . | d_15 == .a) & d_0 == 1

replace d_1 = .i if (d_1 == . | d_1 == .a) & d_0 == 1
replace d_1 = .v if (d_1 == . | d_1 == .a) & d_0 == 2

replace d_2 = .i if (d_2 == . | d_2 == .a) & d_0 == 1
replace d_2 = .v if (d_2 == . | d_2 == .a) & d_0 == 1

replace d_3 = .i if (d_3 == . | d_3 == .a) & d_0 == 1
replace d_3 = .v if (d_3 == . | d_3 == .a) & d_0 == 1

replace d_4 = .i if (d_4 == . | d_4 == .a) & d_0 == 1
replace d_4 = .v if (d_4 == . | d_4 == .a) & d_0 == 1

replace d_5 = .i if (d_5 == . | d_5 == .a) & d_0 == 1
replace d_5 = .v if (d_5 == . | d_5 == .a) & d_0 == 1

replace d_6 = .i if (d_6 == . | d_6 == .a) & d_0 == 1
replace d_6 = .v if (d_6 == . | d_6 == .a) & d_0 == 1

replace d_7_1 = .i if (d_7_1 == . | d_7_1 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_1 = .v if (d_7_1 == . | d_7_1 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_2 = .i if (d_7_2 == . | d_7_2 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_2 = .v if (d_7_2 == . | d_7_2 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_3 = .i if (d_7_3 == . | d_7_3 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_3 = .v if (d_7_3 == . | d_7_3 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_4 = .i if (d_7_4 == . | d_7_4 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_4 = .v if (d_7_4 == . | d_7_4 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))

replace d_7_5 = .i if (d_7_5 == . | d_7_5 == .a) & (d_0 == 2 & ((d_5 == 0 & d_5 == 88 & d_5 == 99 & d_5 == .i) | (d_6 == 0 & d_6 == 88 & d_6 == 99 & d_6 == .i)))
replace d_7_5 = .v if (d_7_5 == . | d_7_5 == .a) & (d_0 == 1 | ((d_5 == 0 | d_5 == 88 | d_5 == 99 | d_5 == .i) & (d_6 == 0 | d_6 == 88 | d_6 == 99 | d_6 == .i)))



capture log close
log using InformationDoorMissingCodebook, text replace

codebook

   save InformationDoorMissing, replace


log close
log using InformationDoorOnlyMissing, text replace

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

macro list _missvarlist

foreach v of local missvarlist {
	codebook `v'
}

   save door_merged_all.dta,replace
   log close
   clear all
