clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out/translation_PR"
}
else if `country' == 1 {
    cd "`path'/DR_out/translation_DR"
}
else if `country' == 2 {
    cd "`path'/CUBA_out/translation_CUBA"
}

if `country' == 0 {
    use using "../Neighborhood"
}
else if `country' == 1 {
    use using "../Neighborhood"
}
else if `country' == 2 {
    use using "../Neighborhood"
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translation_PR"
}
else if `country' == 1 {
    cd "`path'/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}

if `country' == 0 {
    use using "../PR_out/Neighborhood"
}
else if `country' == 1 {
    use using "../DR_out/Neighborhood"
}
else if `country' == 2 {
    use using "../CUBA_out/Neighborhood"
}
}

label drop _all

label variable n_survey_date "Date of Neighborhood Survey"

// fkey is also not necessary for this survey

forvalues x=5/38 {

	label define N_`x' .a"." 1 "No, zero"2 "A few"3 "Some, several"4 "Many/100%"

}


label define N_1 .a"." 0"Lower class" 1"Middle class" 2"Upper class"

label define country 0 "puerto rico" 1 "república dominicana" 2 "cuba"


//labeling each question according to how it's asked 

label variable n_interid "Interviewer's ID #" 
label variable n_clustid "Neighborhood Cluster ID #"
label variable n_housenum "House ID #"

label variable n_1 "This neighborhood is:"

label variable n_5 "Paved roads"

label variable n_6 "Sidewalks"

label variable n_7 "Bus stops"

label variable n_8 "Abandoned lots without enclosure"

label variable n_9 "Strewn garbage"

label variable n_10 "Graffiti on walls"

label variable n_11 "Bad smells (sewer, urine, chemicals, etc.)"

label variable n_12 "Dangerous places"

label variable n_13 "Public lighting"

label variable n_14 "Homeless/unhoused people, gang members, drunk people, etc"

label variable n_15 "Gardens in the houses"

label variable n_16 "Deprived area / shanty town"

label variable n_17 "Circulation of vehicles at high speed (avenues)"

label variable n_18 "Traffic jams"
***************************NUMBER 19 IS SKIPPED ON THE DOCUMENT, SO THE NUMBERING IS ALL WRONG AFTER THIS
label variable n_19 "Traffic calming (speed bumps)"

label variable n_20 "Private community surveillance / security"

label variable n_21 "Grocery stores, supermarkets, greengrocers, bakeries and the like"

label variable n_22 "Cafés, restaurants"

label variable n_23 "Barber shops, beauty salons"
***************************HERE THE NUMBERING IS FIXED AGAIN BECAUSE THE DOCUMENT HAS A 23a AND 23b
label variable n_24 "Chapels, churches, community halls"

label variable n_25 "Abandoned damaged cars, scrap metal"

label variable n_26 "Parks, football/soccer fields, basketball/soccer courts"

label variable n_27 "Bars, canteens, liquor stores"

label variable n_28 "ATMs"
***************************ONCE AGAIN THE NUMBERINIG IS OFF SINCE THE DOCUMENT SKIPS 29
label variable n_29 "Cell phone signal"

label variable n_30 "Stores, food stalls, children/baby shops, video-clubs, internet-cafés"

label variable n_31 "Gas pump or gas station"

label variable n_32 "Doctor/dentist offices, pharmacies"

label variable n_33 "Adult pedestrians walking on the street"

label variable n_34 "Children, older adults, women with children on the street"

label variable n_35 "Abandoned houses/businesses"

label variable n_36 "Houses/buildings under construction"

label variable n_37 "Noise, sound pollution, loud speakers"

label variable n_38 "Automobile exhaust or garbage burning"

save Neighborhood.dta, replace
