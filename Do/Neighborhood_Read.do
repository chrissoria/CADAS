
clear all 
set more off
capture log close

include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

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
    insheet using "../PR_in/Neighborhood.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Neighborhood.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Neighborhood.csv", comma names clear
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
    insheet using "../PR_in/Neighborhood.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Neighborhood.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Neighborhood.csv", comma names clear
}
}


generate N_COUNTRY = cond(n_country ==  0, "puerto rico", cond(n_country ==  1, "república dominicana", cond(n_country ==  2, "cuba", "")))

drop n_country

generate N_1 = cond(n_1 ==  0, "clase baja", cond(n_1 ==  1, "clase media", cond(n_1 ==  2, "clase alta", "")))

drop n_1

generate N_5 = cond(n_5 ==  0, "no (cero)", cond(n_5 ==  1, "unos pocos", cond(n_5 ==  2, "varios", cond(n_5 ==  3, "mucho/100%", ""))))

drop n_5

generate N_6 = cond(n_6 ==  0, "no (cero)", cond(n_6 ==  1, "unos pocos", cond(n_6 ==  2, "varios", cond(n_6 ==  3, "mucho/100%", ""))))

drop n_6

generate N_7 = cond(n_7 ==  0, "no (cero)", cond(n_7 ==  1, "unos pocos", cond(n_7 ==  2, "varios", cond(n_7 ==  3, "mucho/100%", ""))))

drop n_7

generate N_8 = cond(n_8 ==  0, "no (cero)", cond(n_8 ==  1, "unos pocos", cond(n_8 ==  2, "varios", cond(n_8 ==  3, "mucho/100%", ""))))

drop n_8

generate N_9 = cond(n_9 ==  0, "no (cero)", cond(n_9 ==  1, "unos pocos", cond(n_9 ==  2, "varios", cond(n_9 ==  3, "mucho/100%", ""))))

drop n_9

generate N_10 = cond(n_10 ==  0, "no (cero)", cond(n_10 ==  1, "unos pocos", cond(n_10 ==  2, "varios", cond(n_10 ==  3, "mucho/100%", ""))))

drop n_10

generate N_11 = cond(n_11 ==  0, "no (cero)", cond(n_11 ==  1, "unos pocos", cond(n_11 ==  2, "varios", cond(n_11 ==  3, "mucho/100%", ""))))

drop n_11

generate N_12 = cond(n_12 ==  0, "no (cero)", cond(n_12 ==  1, "unos pocos", cond(n_12 ==  2, "varios", cond(n_12 ==  3, "mucho/100%", ""))))

drop n_12

generate N_13 = cond(n_13 ==  0, "no (cero)", cond(n_13 ==  1, "unos pocos", cond(n_13 ==  2, "varios", cond(n_13 ==  3, "mucho/100%", ""))))

drop n_13

generate N_14 = cond(n_14 ==  0, "no (cero)", cond(n_14 ==  1, "unos pocos", cond(n_14 ==  2, "varios", cond(n_14 ==  3, "mucho/100%", ""))))

drop n_14

generate N_15 = cond(n_15 ==  0, "no (cero)", cond(n_15 ==  1, "unos pocos", cond(n_15 ==  2, "varios", cond(n_15 ==  3, "mucho/100%", ""))))

drop n_15

generate N_16 = cond(n_16 ==  0, "no (cero)", cond(n_16 ==  1, "unos pocos", cond(n_16 ==  2, "varios", cond(n_16 ==  3, "mucho/100%", ""))))

drop n_16

generate N_17 = cond(n_17 ==  0, "no (cero)", cond(n_17 ==  1, "unos pocos", cond(n_17 ==  2, "varios", cond(n_17 ==  3, "mucho/100%", ""))))

drop n_17

generate N_18 = cond(n_18 ==  0, "no (cero)", cond(n_18 ==  1, "unos pocos", cond(n_18 ==  2, "varios", cond(n_18 ==  3, "mucho/100%", ""))))

drop n_18

generate N_19 = cond(n_19 ==  0, "no (cero)", cond(n_19 ==  1, "unos pocos", cond(n_19 ==  2, "varios", cond(n_19 ==  3, "mucho/100%", ""))))

drop n_19

generate N_20 = cond(n_20 ==  0, "no (cero)", cond(n_20 ==  1, "unos pocos", cond(n_20 ==  2, "varios", cond(n_20 ==  3, "mucho/100%", ""))))

drop n_20

generate N_21 = cond(n_21 ==  0, "no (cero)", cond(n_21 ==  1, "unos pocos", cond(n_21 ==  2, "varios", cond(n_21 ==  3, "mucho/100%", ""))))

drop n_21

generate N_22 = cond(n_22 ==  0, "no (cero)", cond(n_22 ==  1, "unos pocos", cond(n_22 ==  2, "varios", cond(n_22 ==  3, "mucho/100%", ""))))

drop n_22

generate N_23 = cond(n_23 ==  0, "no (cero)", cond(n_23 ==  1, "unos pocos", cond(n_23 ==  2, "varios", cond(n_23 ==  3, "mucho/100%", ""))))

drop n_23

generate N_24 = cond(n_24 ==  0, "no (cero)", cond(n_24 ==  1, "unos pocos", cond(n_24 ==  2, "varios", cond(n_24 ==  3, "mucho/100%", ""))))

drop n_24

generate N_25 = cond(n_25 ==  0, "no (cero)", cond(n_25 ==  1, "unos pocos", cond(n_25 ==  2, "varios", cond(n_25 ==  3, "mucho/100%", ""))))

drop n_25

generate N_26 = cond(n_26 ==  0, "no (cero)", cond(n_26 ==  1, "unos pocos", cond(n_26 ==  2, "varios", cond(n_26 ==  3, "mucho/100%", ""))))

drop n_26

generate N_27 = cond(n_27 ==  0, "no (cero)", cond(n_27 ==  1, "unos pocos", cond(n_27 ==  2, "varios", cond(n_27 ==  3, "mucho/100%", ""))))

drop n_27

generate N_28 = cond(n_28 ==  0, "no (cero)", cond(n_28 ==  1, "unos pocos", cond(n_28 ==  2, "varios", cond(n_28 ==  3, "mucho/100%", ""))))

drop n_28

generate N_29 = cond(n_29 ==  0, "no (cero)", cond(n_29 ==  1, "unos pocos", cond(n_29 ==  2, "varios", cond(n_29 ==  3, "mucho/100%", ""))))

drop n_29

generate N_30 = cond(n_30 ==  0, "no (cero)", cond(n_30 ==  1, "unos pocos", cond(n_30 ==  2, "varios", cond(n_30 ==  3, "mucho/100%", ""))))

drop n_30

generate N_31 = cond(n_31 ==  0, "no (cero)", cond(n_31 ==  1, "unos pocos", cond(n_31 ==  2, "varios", cond(n_31 ==  3, "mucho/100%", ""))))

drop n_31

generate N_32 = cond(n_32 ==  0, "no (cero)", cond(n_32 ==  1, "unos pocos", cond(n_32 ==  2, "varios", cond(n_32 ==  3, "mucho/100%", ""))))

drop n_32

generate N_33 = cond(n_33 ==  0, "no (cero)", cond(n_33 ==  1, "unos pocos", cond(n_33 ==  2, "varios", cond(n_33 ==  3, "mucho/100%", ""))))

drop n_33

generate N_34 = cond(n_34 ==  0, "no (cero)", cond(n_34 ==  1, "unos pocos", cond(n_34 ==  2, "varios", cond(n_34 ==  3, "mucho/100%", ""))))

drop n_34

generate N_35 = cond(n_35 ==  0, "no (cero)", cond(n_35 ==  1, "unos pocos", cond(n_35 ==  2, "varios", cond(n_35 ==  3, "mucho/100%", ""))))

drop n_35

generate N_36 = cond(n_36 ==  0, "no (cero)", cond(n_36 ==  1, "unos pocos", cond(n_36 ==  2, "varios", cond(n_36 ==  3, "mucho/100%", ""))))

drop n_36

generate N_37 = cond(n_37 ==  0, "no (cero)", cond(n_37 ==  1, "unos pocos", cond(n_37 ==  2, "varios", cond(n_37 ==  3, "mucho/100%", ""))))

drop n_37

generate N_38 = cond(n_38 ==  0, "no (cero)", cond(n_38 ==  1, "unos pocos", cond(n_38 ==  2, "varios", cond(n_38 ==  3, "mucho/100%", ""))))

drop n_38

*now encode


//create a variable for date of survey
replace n_date = subinstr(n_date,substr(n_date, strlen(n_date)-11, strlen(n_date)), "",.) if strlen(n_date)>=12
replace n_date = subinstr(n_date, " ", "",.)
replace n_date = subinstr(n_date, "/", "-",.)
gen n_survey_date = date(n_date, "MDY")
format n_survey_date %td

label variable n_survey_date "Date of Neighborhood Survey"

// fkey is also not necessary for this survey

forvalues x=5/38 {

	label define N_`x' .a"." 1 "no (cero)"2 "unos pocos"3 "varios"4 "mucho/100%"
	encode N_`x', gen(n_`x') label (N_`x')

}

capture confirm numeric variable N_1
if _rc {  /* _rc contains the return code of the previous command */
	tostring N_1, replace
	gen N_1_trimmed = ustrlower(ustrtrim(N_1))
	replace N_1 = N_1_trimmed
	drop N_1_trimmed
}

label define N_1 .a"." 0"clase baja" 1"clase media" 2"clase alta"

encode N_1, gen(n_1) label(N_1)

drop N_1

label define country 0 "puerto rico" 1 "república dominicana" 2 "cuba"
encode N_COUNTRY, gen(n_country) label(country)


//labeling each question according to how it's asked 

label variable n_interid "Interviewer's ID #" 
label variable n_clustid "Neighborhood Cluster ID #"
label variable n_housenum "House ID #"

label variable n_1 "Este barrio es de:"

label variable n_5 "Calles asfaltadas"

label variable n_6 "Aceras"

label variable n_7 "Paradas de autobús"

label variable n_8 "Solares abandonados sin cerramiento"

label variable n_9 "Basura tirada"

label variable n_10 "Grafiti en paredes"

label variable n_11 "Malos olores (cloaca, orines, químicos, etc)"

label variable n_12 "Lugares peligrosos"

label variable n_13 "Alumbrado público"

label variable n_14 "Indigentes, pandilleros, borrachos y similares"

label variable n_15 "Jardines en las casas"

label variable n_16 "Un lugar atravalisado / un arrabal"

label variable n_17 "Circulación de vehículos a alta velocidad (avenidas)"

label variable n_18 "Congestión de tráfico"

label variable n_19 "Reductores de velocidad (Muertos / policía acostado)"

label variable n_20 "Vigilancia privada comunitaria"

label variable n_21 "Colmaditos, supermercados, verdulerías, panaderías y similares"

label variable n_22 "Cafés, restaurantes"

label variable n_23 "barberías, salones de belleza"

label variable n_24 "Capillas, iglesias, salón comunal"

label variable n_25 "Carros dañados en abandono, chatarra"

label variable n_26 "Parques, cancha de fútbol, plays, baloncesto/soccer"

label variable n_27 "Bares, cantinas, licorerías"

label variable n_28 "Cajeros automáticos"

label variable n_29 "Señal para teléfono celular"

label variable n_30 "Bazares, chinchorreros, pañaleras, video-clubs, internet-café"

label variable n_31 "Bomba o estación de gasolina"

label variable n_32 "Consultorios médicos/dentistas, farmacias"

label variable n_33 "Peatones adultos circulando en las calles"

label variable n_34 "Niños, ancianos, mujeres con infantes en la calle"

label variable n_35 "Casas/locales abandonados"

label variable n_36 "Casas/edificios en construcción"

label variable n_37 "Ruido, contaminación sónica, alto parlantes"

label variable n_38 "Humo de automóviles o quemar basura"

quietly ds n*, not
local varlist = r(varlist)

foreach var of local varlist {
    drop `var'
}



save Neighborhood.dta, replace
export excel using "Neighborhood.xlsx", firstrow(variables) nolabel replace

 d
 sum
 list
 
clear all 
set more off

/*
 cd "/Users/chrissoria/Documents/Research/CADAS/Dummy_Data/Neighborhood"

use Neighborhood_Dummy

//check for missing country codes and who is forgetting to input them

gen missing_country=1 if n_country==.
tab missing_country 
tab n_interid missing_country, miss
tab n_date missing_country, miss

//check to see if anyone is forgetting to input their interviewer id

gen missing_id=1 if n_interid==.
tab missing_id
tab missing_id globalrecordid

//count missing values all inputs by an interviwer id

egen missing_row = rowmiss(*)
sort n_interid
by n_interid: egen missing_interid = total(missing_row)

tabulate n_interid, summarize(missing_interid) means

 log close
 exit, clear*/
