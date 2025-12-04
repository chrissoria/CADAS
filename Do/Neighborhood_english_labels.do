* Neighborhood_english_labels.do
* Apply English labels to Neighborhood Survey variables
* Called from Neighborhood_Read.do when language == "E"

****************************************
* VARIABLE LABELS (label variable)
****************************************

* Identifier variables
capture label variable n_survey_date "Date of Neighborhood Survey"
capture label variable n_interid "Interviewer's ID #"
capture label variable n_clustid "Neighborhood Cluster ID #"
capture label variable n_housenum "House ID #"

* Neighborhood characteristics
capture label variable n_1 "This neighborhood is:"

capture label variable n_5 "Paved roads"

capture label variable n_6 "Sidewalks"

capture label variable n_7 "Bus stops"

capture label variable n_8 "Abandoned lots without enclosure"

capture label variable n_9 "Strewn garbage"

capture label variable n_10 "Graffiti on walls"

capture label variable n_11 "Bad smells (sewer, urine, chemicals, etc.)"

capture label variable n_12 "Dangerous places"

capture label variable n_13 "Public lighting"

capture label variable n_14 "Homeless/unhoused people, gang members, drunk people, etc"

capture label variable n_15 "Gardens in the houses"

capture label variable n_16 "Deprived area / shanty town"

capture label variable n_17 "Circulation of vehicles at high speed (avenues)"

capture label variable n_18 "Traffic jams"

capture label variable n_19 "Traffic calming (speed bumps)"

capture label variable n_20 "Private community surveillance / security"

capture label variable n_21 "Grocery stores, supermarkets, greengrocers, bakeries and the like"

capture label variable n_22 "Cafes, restaurants"

capture label variable n_23 "Barber shops, beauty salons"

capture label variable n_24 "Chapels, churches, community halls"

capture label variable n_25 "Abandoned damaged cars, scrap metal"

capture label variable n_26 "Parks, football/soccer fields, basketball/soccer courts"

capture label variable n_27 "Bars, canteens, liquor stores"

capture label variable n_28 "ATMs"

capture label variable n_29 "Cell phone signal"

capture label variable n_30 "Stores, food stalls, children/baby shops, video-clubs, internet-cafes"

capture label variable n_31 "Gas pump or gas station"

capture label variable n_32 "Doctor/dentist offices, pharmacies"

capture label variable n_33 "Adult pedestrians walking on the street"

capture label variable n_34 "Children, older adults, women with children on the street"

capture label variable n_35 "Abandoned houses/businesses"

capture label variable n_36 "Houses/buildings under construction"

capture label variable n_37 "Noise, sound pollution, loud speakers"

capture label variable n_38 "Automobile exhaust or garbage burning"
