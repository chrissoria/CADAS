
clear all 
set more off
capture log close
log using Neighborhood_Dummy, text replace

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

if `country' == 0 {
    insheet using "../PR_in/Neighborhood.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Neighborhood.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Neighborhood.csv", comma names clear
}


//create a variable for date of survey
replace n_date = subinstr(n_date,substr(n_date, strlen(n_date)-11, strlen(n_date)), "",.) if strlen(n_date)>=12
replace n_date = subinstr(n_date, " ", "",.)
replace n_date = subinstr(n_date, "/", "-",.)
gen n_survey_date = date(n_date, "MDY")
format n_survey_date %td

label variable n_survey_date "Date of Neighborhood Survey"

// fkey is also not necessary for this survey
drop fkey uniquekey

forvalues x=5/38 {
	rename n_`x' N_`x'
	capture confirm numeric variable N_`x'
	if _rc {  /* _rc contains the return code of the previous command */
		tostring N_`x', replace
		gen N_`x'_trimmed = ustrlower(ustrtrim(N_`x'))
		replace N_`x' = N_`x'_trimmed
		drop N_`x'_trimmed
	}
}

forvalues x=5/38 {

	label define N_`x' .a"." 1 "no (cero)"2 "unos pocos"3 "varios"4 "mucho/100%"
	encode N_`x', gen(n_`x') label (N_`x')

}

rename n_1 N_1
capture confirm numeric variable N_1
if _rc {  /* _rc contains the return code of the previous command */
	tostring N_1, replace
	gen N_1_trimmed = ustrlower(ustrtrim(N_1))
	replace N_1 = N_1_trimmed
	drop N_1_trimmed
}

label define N_1 .a"." 1 "no (cero)"2 "unos pocos"3 "varios"4 "mucho/100%"
encode N_1, gen(n_1) label (N_1)

rename n_country N_country
label define country 0 "PR" 1 "DR" 2 "CU"
encode N_country, gen(n_country) label(country)


//labeling each question according to how it's asked 

label variable n_interid "Interviewer's ID #" 
label variable n_clustid "Neighborhood Cluster ID #"
label variable n_housenum "House ID #"

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
