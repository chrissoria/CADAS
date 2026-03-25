* Socio_english_labels.do
* Apply English labels to Sociodemographic Risk Factors variables
* Called from Socio_Read.do when language == "E"

****************************************
* VALUE LABELS (label define + label values)
****************************************

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba", replace
capture label values s_country country_label
label define S_2_9a .a"." 0 "0 - Has not completed any education" 1 "1 - Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "2 - Primary" 3 "3 - Intermediate" 4 "4 - Secondary " 5 "5 - Tertiary education (e.g. associate degree or technical degree)" 6 "6 - University education or higher" 8 "8 - Does not respond" 9 "9 - Does not know", replace
capture label values s_2_9a S_2_9a
label define S_3_11 .a"." 1 "1 - Professional, executive" 2 "2 - Office worker" 3 "3 - Salesperson, retailer" 4 "4 - Independent Farmer" 5 "5 - Farm worker" 6 "6 - Domestic worker" 7 "7 - Other services" 8 "8 - Skilled Worker" 9 "9 - Unskilled worker" 10 "10 - Informal work" 11 "11 - Other" 12 "12 - Did not work" 13 "13 - Did not have a father or guardian" 88 "88 - Does not respond" 99 "99 - Does not know", replace
capture label values s_3_11 S_3_11
label define S_6_7 .a"." 1 "01 - you were sick?" 2 "02 - you missed your family?" 3 "03 - it was difficult to stay abroad?" 4 "04 - it was expensive to stay abroad?" 5 "05 - you did not earn enough there?" 6 "06 - you had problems related to migration?" 7 "07 - you had family problems here?" 8 "08 - Other" 88 "88 - Does not respond" 99 "99 - Does not know", replace
capture label values s_6_7 S_6_7
label define S_1_1_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_1_1_p S_1_1_P
label define S_1_1_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_1_1_d S_1_1_D
label define S_1_1_C .a"." 1 "BLACK" 3 "WHITE" 6 "MULATO / MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_1_1_c S_1_1_C
label define S_2_9 .a"." 1 "Never married" 2 "Married/Consensual Union" 3 "Widowed" 4 "Divorced/Separated", replace
capture label values s_2_9 S_2_9
label define S_2_11 .a"." 0 "Agnostic/Atheist" 1 "Roman Catholic" 2 "Evangelical / Pentecostal" 3 "Other Christian" 4 "Santeria" 5 "Jewish" 6 "Other" 7 "None" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_11 S_2_11
label define S_2_12 .a"." 0 "Every day" 1 "More than once a week" 2 "Once a week" 3 "Two or three times a month" 4 "Once or more times a year " 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_12 S_2_12
label define S_2_13 .a"." 0 "No" 1 "Yes, regularly" 2 "Yes, occasionally" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_13 S_2_13
label define S_2_14_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_14_p S_2_14_P
label define S_2_14_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_14_d S_2_14_D
label define S_2_14_C .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_14_c S_2_14_C
label define S_2_15_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_15_p S_2_15_P
label define S_2_15_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_15_d S_2_15_D
label define S_2_15_C .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know", replace
capture label values s_2_15_c S_2_15_C
label define S_3_1_P .a"." 1 "Puerto Rico" 2 "United States" 4 "Other country", replace
capture label values s_3_1_p S_3_1_P
label define S_3_1_D .a"." 1 "Dominican Republic" 2 "United States" 3 "Haiti" 4 "Other country", replace
capture label values s_3_1_d S_3_1_D
label define S_3_1_C .a"." 1 "Cuba" 4 "Other country", replace
capture label values s_3_1_c S_3_1_C
label define S_3_2 .a"." 0 "City" 1 "Town" 2 "Countryside", replace
capture label values s_3_2 S_3_2
label define S_3_4 .a"." 0 "City" 1 "Town" 2 "Countryside" 8 "Does not respond" 9 "Does not know", replace
capture label values s_3_4 S_3_4
label define S_3_5 .a"." 0 "City" 1 "Town" 2 "Countryside" 8 "Does not respond" 9 "Does not know", replace
capture label values s_3_5 S_3_5
label define S_3_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_6 S_3_6
label define S_3_7 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_7 S_3_7
label define S_3_8 .a"." 1 "Much better" 2 "Better" 3 "Average" 4 "Worse" 5 "Much worse" 8 "Does not respond"9 "Does not know" 10 "Did not go to school", replace
capture label values s_3_8 S_3_8
label define S_3_9 .a"." 1 "Much better" 2 "Better" 3 "Average" 4 "Worse" 5 "Much worse" 8 "Does not respond"9 "Does not know" 10 "Did not go to school", replace
capture label values s_3_9 S_3_9
label define S_3_12_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_12_1 S_3_12_1
label define S_3_12_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_12_2 S_3_12_2
label define S_3_12_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_12_3 S_3_12_3
label define S_3_12_6 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_12_6 S_3_12_6
label define S_3_12_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_12_8 S_3_12_8
label define S_3_13 .a"." 1 "Better" 2 "More or less the same" 3 "Worse" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_13 S_3_13
label define S_3_17 .a"." 1 "No" 2 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_17 S_3_17
label define S_3_19_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year", replace
capture label values s_3_19_2 S_3_19_2
label define S_4_1 .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_1 S_4_1
label define S_4_2 .a"." 1 "No" 2 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_2 S_4_2
label define S_4_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_8 S_4_8
label define S_4_11 .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_11 S_4_11
label define S_4_12 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_12 S_4_12
label define S_4_18 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_18 S_4_18
label define S_4_21 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_21 S_4_21
label define S_4_22 .a"." 0 "Spouse" 1 "Mother" 2 "Father" 3 "Mother-in-law" 4 "Father-in-law" 5 "Daughter" 6 "Son" 7 "Granddaughter" 8 "Grandson" 9 "Friend" 10 "Otra relative" 11 "Otra person" 88 "Does not respond"99 "Does not know", replace
capture label values s_4_22 S_4_22
label define S_4_23_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year", replace
capture label values s_4_23_2 S_4_23_2
label define S_4_26 .a"." 2 "No" 1 "Yes" 3 "I don’t have any" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_26 S_4_26
label define S_4_27_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year", replace
capture label values s_4_27_2 S_4_27_2
label define S_4_27A .a"." 1 "Less than 2 hours per week?" 2 "2 to 4 hours per week?" 3 "more than 4 hours per week?" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_27a S_4_27A
label define S_4_28 .a"." 2 "No" 1 "Yes" 3"I don’t have any" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_28 S_4_28
label define S_4_29_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year", replace
capture label values s_4_29_2 S_4_29_2
label define S_4_29A .a"." 1 "Less than 2 hours per week?" 2 "2 to 4 hours per week?" 3 "more than 4 hours per week?" 8 "Does not respond"9 "Does not know", replace
capture label values s_4_29a S_4_29A
label define S_5_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_5_1 S_5_1
label define S_5_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_5_2 S_5_2
label define S_6_1 .a"." 2 "No" 1 "Yes" 7 "Born in the United States" 8 "Does not respond"9 "Does not know", replace
capture label values s_6_1 S_6_1
label define S_6_3 .a"." 2 "No" 1 "Yes" 7 "Born in another country" 8 "Does not respond"9 "Does not know", replace
capture label values s_6_3 S_6_3
label define S_6_5_P .a"." 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other", replace
capture label values s_6_5_p S_6_5_P
label define S_6_5_D .a"." 1 "Haiti" 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other", replace
capture label values s_6_5_d S_6_5_D
label define S_6_5_C .a"." 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other", replace
capture label values s_6_5_c S_6_5_C
label define S_7_0 .a"." 1 "Very satisfied" 2 "Somewhat satisfied" 3 "Somewhat dissatisfied" 4 "Very dissatisfied" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_0 S_7_0
label define S_7_1 .a"." 1 "No" 0 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_1 S_7_1
label define S_7_2A .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_2a S_7_2A
label define S_7_2B .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_2b S_7_2B
label define S_7_2C .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_2c S_7_2C
label define S_7_4A .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_4a S_7_4A
label define S_7_4B .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_4b S_7_4B
label define S_7_4C .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_4c S_7_4C
label define S_7_5A .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_5a S_7_5A
label define S_7_5B .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_5b S_7_5B
label define S_7_5C .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know", replace
capture label values s_7_5c S_7_5C
label define S_7_6A .a"." 1 "Almost every day" 2 "At least once a week" 3 "Several times a month" 4 "Several times a year" 5 "Less than once a year" 6 "Never" 88 "Does not respond"99 "Does not know", replace
capture label values s_7_6a S_7_6A
label define S_7_6B .a"." 1 "Always or almost always" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 88 "Does not respond"99 "Does not know", replace
capture label values s_7_6b S_7_6B
label define S_8_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_1 S_8_1
label define S_8_3 .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know", replace
capture label values s_8_3 S_8_3
label define S_8_4 .a"." 1 "manager or boss?" 2 "self-employed?" 3 "cooperative worker?" 4 "worker with a fixed wage, salary or daily pay?" 5 "pieceworker, commission worker" 6 "unpaid family worker?" 7 "non-family worker without pay?" 8 "Other" 88 "Does not respond"99 "Does not know", replace
capture label values s_8_4 S_8_4
label define S_8_5A .a"." 1 "Work" 2 "Look for work" 3 "Don’t work" 8 "Does not respond", replace
capture label values s_8_5a S_8_5A
label define S_8_5D .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know", replace
capture label values s_8_5d S_8_5D
label define S_8_7 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_7 S_8_7
label define S_8_10 .a"." 1 "Always or almost" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_10 S_8_10
label define S_8_11 .a"." 1 "Always or almost" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_11 S_8_11
label define S_8_12 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_12 S_8_12
label define S_8_13 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_13 S_8_13
label define S_8_141 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_141 S_8_141
label define S_8_15 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_8_15 S_8_15
label define S_8_16 .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know", replace
capture label values s_8_16 S_8_16
label define S_9_1 .a"." 1 "Excellent" 2 "Very good" 3 "Good" 4 "Regular" 5 "Poor" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_1 S_9_1
label define S_9_3 .a"." 0 "Does not have that health problem" 1 "Has that problem, but it does not interfere" 2 "Has that problem, and it interferes a little" 3 "Has that problem, and it interferes a lot" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_3 S_9_3
label define S_9_4 .a"." 0 "Does not have that health problem" 1 "Has that problem, but it does not interfere" 2 "Has that problem, and it interferes a little" 3 "Has that problem, and it interferes a lot" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_4 S_9_4
label define S_9_5 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_5 S_9_5
label define S_9_7 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_7 S_9_7
label define S_9_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_8 S_9_8
label define S_9_11 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_11 S_9_11
label define S_9_13 .a"." 1 "Less than 6 months" 2 "Between 6 and 11 months" 3 "Between 1 and 2 years" 4 "More than 2 years" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_13 S_9_13
label define S_9_14 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_14 S_9_14
label define S_9_15 .a"." 1 "0-5 years ago" 2 "5-10 years ago" 3 "10 or more years ago" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_15 S_9_15
label define S_9_16 .a"." 1 "Heart attack" 2 "Angina" 3 "Cardiac arrest" 4 "Valve disease" 5 "Other" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_16 S_9_16
label define S_9_17 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_17 S_9_17
label define S_9_18 .a"." 0 "Nobody" 1 "General practitioner" 2 "Specialist" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_18 S_9_18
label define S_9_19 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_19 S_9_19
label define S_9_20 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_20 S_9_20
label define S_9_23 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_23 S_9_23
label define S_9_24 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_24 S_9_24
label define S_9_26 .a"." 0 "Diet only" 1 "Oral hypoglycemic agents (no insulin)" 2 "Insulin" 3 "No treatment" 88 "Does not respond"99 "Does not know", replace
capture label values s_9_26 S_9_26
label define S_9_28 .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_28 S_9_28
label define S_9_29 .a"." 1 "Once every three months" 2 "Once every six months" 3 "Once a year" 4 "Less than once a year" 5 "Does not have" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_29 S_9_29
label define S_9_30 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_30 S_9_30
label define S_9_32 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_32 S_9_32
label define S_9_33 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_33 S_9_33
label define S_9_35 .a"." 1 "Less than 6 months" 2 "Between 6 and 11 months" 3 "Between 1 and 2 years" 4 "More than 2 years" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_35 S_9_35
label define S_9_37 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_37 S_9_37
label define S_9_39 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_39 S_9_39
label define S_9_40 .a"." 1 "Yes, a few (up to 4)" 2 "Yes, quite a lot (more than 4 and less than half)" 3 "Yes, most (half or more)" 4 "No" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_40 S_9_40
label define S_9_41 .a"." 0 "No" 1 "Yes, rarely" 2 "Yes, frequently" 3 "Yes, very frequently" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_41 S_9_41
label define S_9_42 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_42 S_9_42
label define S_9_44 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_44 S_9_44
label define S_9_46 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_46 S_9_46
label define S_9_47 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_47 S_9_47
label define S_9_49 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_49 S_9_49
label define S_9_50 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_50 S_9_50
label define S_9_51 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_51 S_9_51
label define S_9_52 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_52 S_9_52
label define S_9_53 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_53 S_9_53
label define S_9_54 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_54 S_9_54
label define S_9_55 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_55 S_9_55
label define S_9_56 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_56 S_9_56
label define S_9_58 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_58 S_9_58
label define S_9_61A .a"." 1 "Less than 45 years old?" 2 "More or less 50 years old?" 3 "Over 55 years old?" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_61a S_9_61A
label define S_9_62 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_62 S_9_62
label define S_9_63 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_63 S_9_63
label define S_9_64_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_64_1 S_9_64_1
label define S_9_64_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_64_2 S_9_64_2
label define S_9_64_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_64_3 S_9_64_3
label define S_9_64_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_64_4 S_9_64_4
label define S_9_66 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_9_66 S_9_66
label define S_10_1A .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1a S_10_1A
label define S_10_1B .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1b S_10_1B
label define S_10_1C .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1c S_10_1C
label define S_10_1D .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1d S_10_1D
label define S_10_1E .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1e S_10_1E
label define S_10_1F .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1f S_10_1F
label define S_10_1G .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1g S_10_1G
label define S_10_1H .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_1h S_10_1H
label define S_10_2 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_2 S_10_2
label define S_10_3 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_3 S_10_3
label define S_10_4 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_4 S_10_4
label define S_10_5 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_5 S_10_5
label define S_10_6_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_1 S_10_6_1
label define S_10_6_1A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_1a S_10_6_1A
label define S_10_6_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_2 S_10_6_2
label define S_10_6_2A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_2a S_10_6_2A
label define S_10_6_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"7 "Not applicable (does not work)", replace
capture label values s_10_6_3 S_10_6_3
label define S_10_6_3A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_3a S_10_6_3A
label define S_10_6_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_4 S_10_6_4
label define S_10_6_4A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_6_4a S_10_6_4A
label define S_10_7_1 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 7 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_7_1 S_10_7_1
label define S_10_7_2 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 7 "Not applicable" 8 "Does not respond"9 "Does not know", replace
capture label values s_10_7_2 S_10_7_2
label define S_11_1 .a"." 1 "Never" 2 "2-3 times in the last month" 3 "About once a week" 4 "2-3 days per week" 5 "Every day" 8 "Does not respond"9 "Does not know", replace
capture label values s_11_1 S_11_1
label define S_11_2 .a"." 1 "Mild pain" 2 "Moderate pain" 3 "Severe pain" 4 "Very severe pain" 5 "Excruciating pain" 8 "Does not respond"9 "Does not know", replace
capture label values s_11_2 S_11_2
label define S_11_3 .a"." 1 "Not at all" 2 "Not much" 3 "Moderately" 4 "A lot" 8 "Does not respond"9 "Does not know", replace
capture label values s_11_3 S_11_3
label define S_12_1A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_1a S_12_1A
label define S_12_1B .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_1b S_12_1B
label define S_12_1C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_1c S_12_1C
label define S_12_2A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_2a S_12_2A
label define S_12_2C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_2c S_12_2C
label define S_12_3A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_3a S_12_3A
label define S_12_3C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_3c S_12_3C
label define S_12_4A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_4a S_12_4A
label define S_12_4B .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_4b S_12_4B
label define S_12_4C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_4c S_12_4C
label define S_12_5A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_5a S_12_5A
label define S_12_5C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_5c S_12_5C
label define S_12_6A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_6a S_12_6A
label define S_12_6C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_6c S_12_6C
label define S_12_7 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_7 S_12_7
label define S_12_8 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_8 S_12_8
label define S_12_9 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_9 S_12_9
label define S_12_10 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_10 S_12_10
label define S_12_11 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_11 S_12_11
label define S_12_13 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_13 S_12_13
label define S_12_14 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_14 S_12_14
label define S_12_15 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_12_15 S_12_15
label define S_12_16 .a"." 1 "Totally lifted them" 2 "Partially raised them" 3 "Cannot lift them" 4 "Did not agree to take the test", replace
capture label values s_12_16 S_12_16
label define S_13_1_P_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_1_p_c S_13_1_P_C
label define S_13_1_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_1_d S_13_1_D
label define S_13_3_P_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_3_p_c S_13_3_P_C
label define S_13_3_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_3_d S_13_3_D
label define S_13_5 .a"." 1 "Daily" 2 "Not every day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_5 S_13_5
label define S_13_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_8 S_13_8
label define S_13_9 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_9 S_13_9
label define S_13_12 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_12 S_13_12
label define S_13_13 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_13 S_13_13
label define S_13_14 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_14 S_13_14
label define S_13_15 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_15 S_13_15
label define S_13_16 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_16 S_13_16
label define S_13_17 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_17 S_13_17
label define S_13_18 .a"." 1 "Physically very active" 2 "Physically quite active" 3 "Physically not very active" 4 "Not physically active" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_18 S_13_18
label define S_13_19 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_19 S_13_19
label define S_13_22 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_22 S_13_22
label define S_13_30_D_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_30_d_c S_13_30_D_C
label define S_13_30_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_13_30_p S_13_30_P
label define S_14_1_P_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_1_p_d S_14_1_P_D
label define S_14_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_3 S_14_3
label define S_14_17 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_17 S_14_17
label define S_14_18_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_1 S_14_18_1
label define S_14_18_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_2 S_14_18_2
label define S_14_18_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_3 S_14_18_3
label define S_14_18_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_4 S_14_18_4
label define S_14_18_5 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_5 S_14_18_5
label define S_14_18_6 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_18_6 S_14_18_6
label define S_14_23 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_23 S_14_23
label define S_14_30B1_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b1_p S_14_30B1_P
label define S_14_30B1_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b1_d S_14_30B1_D
label define S_14_30B2_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b2_p S_14_30B2_P
label define S_14_30B2_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b2_d S_14_30B2_D
label define S_14_30B3_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b3_p S_14_30B3_P
label define S_14_30B3_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_30b3_d S_14_30B3_D
label define S_14_31 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_31 S_14_31
label define S_14_32 .a"." 1 "1" 2 "2" 3 "3" 4 "4 or more" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_32 S_14_32
label define S_14_33 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values s_14_33 S_14_33
label define S_15_1 .a"." 0 "Only the participant" 1 "Participant and proxy" 2 "Only the proxy", replace
capture label values s_15_1 S_15_1
label define S_15_2 .a"." 1 "Spouse" 2 "Son/daughter" 3 "Son-in-law/daughter-in-law" 4 "Sibling" 5 "Other relative" 6 "Friend" 7 "Neighbor" 8 "Other", replace
capture label values s_15_2 S_15_2
label define S_15_3 .a"." 0 "Reasonable (the interviewee responded appropriately to more or less all the questions)" 1 "Some doubts" 2 "Moderate doubts" 3 "Serious doubts (the interviewer considered that the interviewee was unable or did not cooperate in responding appropriately to most questions)" 4 "No value (the questions were answered randomly)", replace
capture label values s_15_3 S_15_3
label define S_7_7a 0 "false" 1 "true", replace
capture label values s_7_7a S_7_7a
label define S_7_7b 0 "false" 1 "true", replace
capture label values s_7_7b S_7_7b
label define S_7_7c 0 "false" 1 "true", replace
capture label values s_7_7c S_7_7c
label define S_7_7d 0 "false" 1 "true", replace
capture label values s_7_7d S_7_7d
label define S_7_7e 0 "false" 1 "true", replace
capture label values s_7_7e S_7_7e
label define S_7_7f 0 "false" 1 "true", replace
capture label values s_7_7f S_7_7f
label define S_7_7g 0 "false" 1 "true", replace
capture label values s_7_7g S_7_7g
label define S_7_7h 0 "false" 1 "true", replace
capture label values s_7_7h S_7_7h
label define S_7_7i 0 "false" 1 "true", replace
capture label values s_7_7i S_7_7i
label define S_7_7j 0 "false" 1 "true", replace
capture label values s_7_7j S_7_7j
label define S_7_7k 0 "false" 1 "true", replace
capture label values s_7_7k S_7_7k
label define S_8_5b2 0 "false" 1 "true", replace
capture label values s_8_5b2 S_8_5b2
label define S_8_5b1 0 "false" 1 "true", replace
capture label values s_8_5b1 S_8_5b1
label define S_8_5b3 0 "false" 1 "true", replace
capture label values s_8_5b3 S_8_5b3
label define S_8_5b4 0 "false" 1 "true", replace
capture label values s_8_5b4 S_8_5b4
label define S_8_5b5 0 "false" 1 "true", replace
capture label values s_8_5b5 S_8_5b5
label define S_8_5b6 0 "false" 1 "true", replace
capture label values s_8_5b6 S_8_5b6
label define S_8_5b7 0 "false" 1 "true", replace
capture label values s_8_5b7 S_8_5b7
label define S_8_5b8 0 "false" 1 "true", replace
capture label values s_8_5b8 S_8_5b8
label define S_8_5b9 0 "false" 1 "true", replace
capture label values s_8_5b9 S_8_5b9
label define S_8_5b10 0 "false" 1 "true", replace
capture label values s_8_5b10 S_8_5b10
label define S_9_38a 0 "false" 1 "true", replace
capture label values s_9_38a S_9_38a
label define S_9_38g 0 "false" 1 "true", replace
capture label values s_9_38g S_9_38g
label define S_9_38b 0 "false" 1 "true", replace
capture label values s_9_38b S_9_38b
label define S_9_38f 0 "false" 1 "true", replace
capture label values s_9_38f S_9_38f
label define S_9_38c 0 "false" 1 "true", replace
capture label values s_9_38c S_9_38c
label define S_9_38d 0 "false" 1 "true", replace
capture label values s_9_38d S_9_38d
label define S_9_38j 0 "false" 1 "true", replace
capture label values s_9_38j S_9_38j
label define S_9_38e 0 "false" 1 "true", replace
capture label values s_9_38e S_9_38e
label define S_9_38k 0 "false" 1 "true", replace
capture label values s_9_38k S_9_38k
label define S_9_38h 0 "false" 1 "true", replace
capture label values s_9_38h S_9_38h
label define S_9_38l 0 "false" 1 "true", replace
capture label values s_9_38l S_9_38l
label define S_9_38i 0 "false" 1 "true", replace
capture label values s_9_38i S_9_38i
label define S_14_2a_P 0 "false" 1 "true", replace
capture label values s_14_2a_p S_14_2a_P
label define S_14_1b_P 0 "false" 1 "true", replace
capture label values s_14_1b_p S_14_1b_P
label define S_14_2c_P 0 "false" 1 "true", replace
capture label values s_14_2c_p S_14_2c_P
label define S_14_2d_P 0 "false" 1 "true", replace
capture label values s_14_2d_p S_14_2d_P
label define S_14_2e_P 0 "false" 1 "true", replace
capture label values s_14_2e_p S_14_2e_P
label define S_14_2f_P 0 "false" 1 "true", replace
capture label values s_14_2f_p S_14_2f_P
label define S_14_2g_P 0 "false" 1 "true", replace
capture label values s_14_2g_p S_14_2g_P
label define S_14_2h_P 0 "false" 1 "true", replace
capture label values s_14_2h_p S_14_2h_P
label define S_14_2i_P 0 "false" 1 "true", replace
capture label values s_14_2i_p S_14_2i_P
label define S_14_2j_P 0 "false" 1 "true", replace
capture label values s_14_2j_p S_14_2j_P
label define S_14_2a_D 0 "false" 1 "true", replace
capture label values s_14_2a_d S_14_2a_D
label define S_14_2b_D 0 "false" 1 "true", replace
capture label values s_14_2b_d S_14_2b_D
label define S_14_2c_D 0 "false" 1 "true", replace
capture label values s_14_2c_d S_14_2c_D
label define S_14_2d_D 0 "false" 1 "true", replace
capture label values s_14_2d_d S_14_2d_D
label define S_14_2e_D 0 "false" 1 "true", replace
capture label values s_14_2e_d S_14_2e_D
label define S_14_2f_D 0 "false" 1 "true", replace
capture label values s_14_2f_d S_14_2f_D
label define S_14_2g_D 0 "false" 1 "true", replace
capture label values s_14_2g_d S_14_2g_D
label define S_0 .a "." 0 "Man" 1 "Woman", replace
capture label values s_0 S_0
label define S_2_9a_ .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond" 9 "Does not know", replace
capture label values s_2_9a_ S_2_9a_
capture label values s_2_9a S_2_9a_
label define S_3_11_ .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 12 "Did not work" 13 "Did not have a father or guardian" 88 "Does not respond" 99 "Does not know", replace
capture label values s_3_11_ S_3_11_
capture label values s_3_11 S_3_11_
label define S_6_7_ .a"." 1 "you were sick?" 2 "you missed your family?" 3 "it was difficult to stay abroad?" 4 "it was expensive to stay abroad?" 5 "you did not earn enough there?" 6 "you had problems related to migration?" 7 "you had family problems here?" 8 "OTHER" 88 "Does not respond" 99 "Does not know", replace
capture label values s_6_7_ S_6_7_
capture label values s_6_7 S_6_7_
label define checkbox_label 0 "unchecked" 1 "checked", replace
capture label values checkbox_label checkbox_label
capture label values s_7_7a checkbox_label
capture label values s_7_7b checkbox_label
capture label values s_7_7c checkbox_label
capture label values s_7_7d checkbox_label
capture label values s_7_7e checkbox_label
capture label values s_7_7f checkbox_label
capture label values s_7_7g checkbox_label
capture label values s_7_7h checkbox_label
capture label values s_7_7i checkbox_label
capture label values s_7_7j checkbox_label
capture label values s_7_7k checkbox_label
capture label values s_8_5b2 checkbox_label
capture label values s_8_5b1 checkbox_label
capture label values s_8_5b4 checkbox_label
capture label values s_8_5b3 checkbox_label
capture label values s_8_5b5 checkbox_label
capture label values s_8_5b6 checkbox_label
capture label values s_8_5b7 checkbox_label
capture label values s_8_5b8 checkbox_label
capture label values s_8_5b9 checkbox_label
capture label values s_9_38a checkbox_label
capture label values s_9_38g checkbox_label
capture label values s_9_38b checkbox_label
capture label values s_9_38f checkbox_label
capture label values s_9_38c checkbox_label
capture label values s_9_38d checkbox_label
capture label values s_9_38j checkbox_label
capture label values s_9_38e checkbox_label
capture label values s_9_38k checkbox_label
capture label values s_9_38h checkbox_label
capture label values s_9_38l checkbox_label
capture label values s_9_38i checkbox_label
capture label values s_14_2a_p checkbox_label
capture label values s_14_2b_p checkbox_label
capture label values s_14_2c_p checkbox_label
capture label values s_14_2d_p checkbox_label
capture label values s_14_2e_p checkbox_label
capture label values s_14_2f_p checkbox_label
capture label values s_14_2g_p checkbox_label
capture label values s_14_2h_p checkbox_label
capture label values s_14_2i_p checkbox_label
capture label values s_14_2j_p checkbox_label
capture label values s_14_2a_d checkbox_label
capture label values s_14_2b_d checkbox_label
capture label values s_14_2c_d checkbox_label
capture label values s_14_2d_d checkbox_label
capture label values s_14_2e_d checkbox_label
capture label values s_14_2f_d checkbox_label
capture label values s_14_2g_d checkbox_label

****************************************
* VARIABLE LABELS (label variable)
****************************************

* Identifier variables
capture label variable s_interid "Interviewer number:"
capture label variable s_houseid "House number:"
capture label variable s_particid "Participant number:"
capture label variable s_clustid "Cluster number:"
capture label variable s_country "Country"
capture label variable s_houseid2 "HOUSE NUMBER"
capture label variable s_conglid2 "CLUSTER NUMBER:"
capture label variable s_particid2 "PARTICIPANT NUMBER"
capture label variable s_0 "Is participant male or female?"
capture label variable s_deviceid1 "Device ID:"
capture label variable s_deviceid2 "Device ID:"

* Section 1: Physical Appearance
capture label variable s_1_1_p "1.1 If you had to classify the participant in one of the following categories, which category would you classify them in? * Trigueno refers to white and black mixture. Mestizo refers to Indian and white mixture"
capture label variable s_1_1_d "1.1 If you had to classify the participant in one of the following categories, which category would you classify them in?"
capture label variable s_1_1_c "1.1 If you had to classify the participant in one of the following categories, which category would you classify them in?"
capture label variable s_1_2 "1.2 As you know, humans show a wide variety of skin color. The image shows a skin color scale ranging from 1 (lightest color) to 11 (darkest color). Please observe the participant's face color and indicate which number represents their closest color according to the COLOR CARD."

* Section 2: Demographics
capture label variable s_2_3 "2.3 Age according to official document: ____ [999 = No documentation]"
capture label variable s_2_8c "2.8c How many years of education have you completed (excluding pre-primary)? Years ____ No response............88 Don't know.....................99"
capture label variable s_2_9 "2.9 Are you currently married?"
capture label variable s_2_9a "2.9a What is the highest degree or grade level your spouse or ex-spouse has completed?"
capture label variable s_2_10 "2.10 How many children have you had [fathered / given birth to]? Please do not count miscarriages or stillbirths or adopted or stepchildren for this question No response............88 Don't know.....................99"
capture label variable s_2_11 "2.11 Are you a member of any religious group?"
capture label variable s_2_12 "2.12 Approximately how often did you attend religious services during the past year?"
capture label variable s_2_13 "2.13 Do you attend meetings of community or social groups such as clubs, lectures, or similar?"
capture label variable s_2_14_p "2.14 If you had to classify yourself in one of the following categories, which category would you classify yourself? Black, mulatto, trigueno, white, mestizo or another category? * Trigueno refers to white and black mixture. Mestizo refers to Indian and white mixture"
capture label variable s_2_14_d "2.14 If you had to classify yourself in one of the following categories, which category would you classify yourself? Black, mulatto, white, Indian or another category?"
capture label variable s_2_14_c "2.14 If you had to classify yourself in one of the following categories, which category would you classify yourself? Black, mulatto, white, mestizo or another category?"
capture label variable s_2_15_p "2.15 If you were walking down the street, what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"
capture label variable s_2_15_d "2.15 If you were walking down the street, what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"
capture label variable s_2_15_c "2.15 If you were walking down the street, what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"
capture label variable s_2_16 "2.16 As you know, humans show a wide variety of skin color. The image shows a skin color scale ranging from 1 (lightest color) to 11 (darkest color). Please indicate which number represents your closest color for your face. SHOW COLOR CARD"

* Section 3: Birthplace and Early Life
capture label variable s_3_0 "3.0 How long have you lived in this city/town/district? code in years (1 year or less = 0)"
capture label variable s_3_1_p "3.1 Where were you born?"
capture label variable s_3_1_d "3.1 Where were you born?"
capture label variable s_3_1_c "3.1 Where were you born?"
capture label variable s_3_2 "3.2 Where were you born?"
capture label variable s_3_3_p "3.3 In what municipality were you born?"
capture label variable s_3_3_d "3.3 In what province were you born?"
capture label variable s_3_3_c "3.3 In what province were you born?"
capture label variable s_3_4 "3.4 Where did you live most of the time between ages 20 and 60?"
capture label variable s_3_5 "3.5 Where have you lived most of the time since turning 60?"
capture label variable s_3_6 "3.6 Can you read a newspaper?"
capture label variable s_3_7 "3.7 Could you write a letter if you needed to?"
capture label variable s_3_8 "3.8 How did you do in math compared to other children in your class?"
capture label variable s_3_9 "3.9 How well did you do in reading and writing compared to other children in your class?"
capture label variable s_3_11 "3.11 (Before turning 10), what type of work did your father or guardian do most of the time..."
capture label variable s_3_12_1 "3.12.1 Did your home have an indoor toilet?"
capture label variable s_3_12_2 "3.12.2 Did your home have electricity?"
capture label variable s_3_12_3 "3.12.3 Did your family have economic problems that prevented you from eating regularly, dressing properly, or having necessary medical care?"
capture label variable s_3_12_6 "3.12.6 Did you or any family member sleep in the same room used for cooking?"
capture label variable s_3_12_8 "3.12.8 Did either of your parents or guardians smoke?"
capture label variable s_3_13 "3.13 (Before turning 16), compared to other children your age, how was your health condition?"
capture label variable s_3_17 "3.17 Have you ever experienced a natural disaster (e.g., earthquake, hurricane) that displaced you from your home for at least a week?"
capture label variable s_3_18 "3.18 How old were you when this last happened? RECORD AGE NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_3_19_1 "NUMBER: NO RESPONSE...........................88 DON'T KNOW....................................99"
capture label variable s_3_19_2 "Indicate if it was year, month, week, or day"

* Section 4: Family
capture label variable s_4_1 "4.1 What is the highest degree or grade level your mother completed?"
capture label variable s_4_2 "4.2 [ONLY ASK IF NOT YET CLEAR] Is your mother currently alive?"
capture label variable s_4_3 "4.3 How old is your mother? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_6 "4.6 How old was your mother when she died? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_7 "4.7 How old were you when your mother died? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_8 "4.8 Does or did your mother have dementia, senility, or any other serious memory impairment?"
capture label variable s_4_11 "4.11 What is the highest degree or grade level your father completed?"
capture label variable s_4_12 "4.12 [ONLY ASK IF NOT YET CLEAR] Is your father currently alive?"
capture label variable s_4_13 "4.13 How old is your father? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_16 "4.16 How old was your father when he died? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_17 "4.17 How old were you when your father died? NO RESPONSE............888 DON'T KNOW.....................999"
capture label variable s_4_18 "4.18 Does or did your father have dementia, senility, or any other serious memory impairment?"
capture label variable s_4_20 "4.20 How many living brothers and sisters do you have? NO RESPONSE................88 DON'T KNOW.....................99"
capture label variable s_4_21 "4.21 During the past year, did you generally spend at least one hour a week helping someone with basic activities like dressing, eating, or bathing due to a health problem? Exclude help with household activities, errands, transportation."
capture label variable s_4_22 "4.22 Who received that support?"
capture label variable s_4_23_1 "4.23.1 NUMBER OF HOURS: NO RESPONSE............ 88 DON'T KNOW...................... 99"
capture label variable s_4_23_2 "4.23.2 PER PERIOD"
capture label variable s_4_26 "4.26 In the past year, have you spent at least one hour a week helping your children/daughter-in-law/son-in-law/grandchildren? Please do not include help with basic activities already mentioned before."
capture label variable s_4_27_1 "4.27.1 NUMBER OF HOURS: NO RESPONSE............ 88 DON'T KNOW...................... 99"
capture label variable s_4_27_2 "4.27.2 PER PERIOD"
capture label variable s_4_27a "4.27a Would you say they were..."
capture label variable s_4_28 "4.28 In the past year, have your children/daughter-in-law/son-in-law/grandchildren dedicated at least 1 hour a week to help you with household chores, errands, transportation?"
capture label variable s_4_29_1 "4.29.1 NUMBER OF HOURS NO RESPONSE............ 888 DON'T KNOW...................... 999"
capture label variable s_4_29_2 "4.29.2 PER PERIOD"
capture label variable s_4_29a "4.29a Would you say they were..."

* Section 5: Economic Status
capture label variable s_5_1 "5.1 In the past year, have you always had enough money to buy the food you need?"
capture label variable s_5_2 "5.2 After turning 18, have you ever experienced severe economic hardship (such as problems buying food)?"
capture label variable s_5_3 "5.3 For how many years? Years |__|__| Less than a year...........0 No response..................88 Don't know....................99"
capture label variable s_5_4 "5.4 Indicate on the ladder step where you would place yourself. Number [ ]"
capture label variable s_5_5 "5.5 When you were born, where would you place your parents on this ladder? Number [ ]"

* Section 6: Migration
capture label variable s_6_1 "6.1 Not counting vacations or short visits, have you ever worked or lived in the United States?"
capture label variable s_6_2 "6.2 In total, approximately how many years have you lived in the United States? 12 MONTHS OR LESS..................01 NO RESPONSE.............................88 DON'T KNOW..............................99"
capture label variable s_6_3 "6.3 Not counting vacations or short visits, have you ever lived in another country other than the United States?"
capture label variable s_6_4 "6.4 In total, approximately how many years have you worked or lived abroad other than the United States? 12 MONTHS OR LESS............................01 NO RESPONSE.....................................88 DON'T KNOW.......................................99"
capture label variable s_6_5_p "6.5 In which country have you spent the most time?"
capture label variable s_6_5_d "6.5 In which country have you spent the most time?"
capture label variable s_6_5_c "6.5 In which country have you spent the most time?"
capture label variable s_6_6 "6.6 Now think about the last time you worked or lived abroad, how old were you when you returned or came to this country? NO RESPONSE............... 888 DON'T KNOW.................. 999"
capture label variable s_6_7 "6.7 The last time you came from abroad, what would you say was the main reason you came..."

* Section 7: Social Relations and Wellbeing
capture label variable s_7_0 "7.0 In general, how do you feel about your life?"
capture label variable s_7_1 "[ONLY ASK IF NOT YET CLEAR] 7.1 Do you have children who do not live with you?"
capture label variable s_7_2a "7.2a Getting together (include organized and casual meetings)"
capture label variable s_7_2b "7.2b Talking on the phone"
capture label variable s_7_2c "7.2c Communicating in writing on paper or internet (email, WhatsApp, Skype, Facebook or other social networks)"
capture label variable s_7_3 "7.3 With how many of your children would you say you have a close relationship? NOT APPLICABLE (no children).77 NO RESPONSE...................... 88"
capture label variable s_7_4a "7.4a Getting together (include organized and casual meetings)"
capture label variable s_7_4b "7.4b Talking on the phone"
capture label variable s_7_4c "7.4c Communicating in writing on paper or internet (email, WhatsApp, Skype, Facebook or other social networks)"
capture label variable s_7_5a "7.5a Do you feel you lack companionship?"
capture label variable s_7_5b "7.5b Do you feel ignored by others?"
capture label variable s_7_5c "7.5c Do you feel isolated, set apart from others?"
capture label variable s_7_6a "7.6a You are treated with less courtesy or respect than other people"
capture label variable s_7_6b "7.6b You receive poorer service or treatment than other people from doctors or hospitals."
capture label variable s_7_7a "Your ancestry or national origin"
capture label variable s_7_7b "Your gender"
capture label variable s_7_7c "Your race"
capture label variable s_7_7d "Your religion"
capture label variable s_7_7e "Your weight"
capture label variable s_7_7f "A physical disability"
capture label variable s_7_7g "A mental disability / dementia"
capture label variable s_7_7h "An aspect of your physical appearance"
capture label variable s_7_7i "Your sexual orientation"
capture label variable s_7_7j "Your financial status"
capture label variable s_7_7k "Other"

* Section 8: Employment
capture label variable s_8_1 "8.1 [ONLY ASK IF NOT YET CLEAR] Have you ever had a job?"
capture label variable s_8_2 "8.2 Approximately how much total time have you worked (work) receiving pay or profit throughout your life? Record years No response.............................888 Don't know......................................999"
capture label variable s_8_3 "8.3 What was (has been) your longest-lasting job..."
capture label variable s_8_3a "8.3a What was your main occupation?"
capture label variable s_8_4 "8.4 In that longest job, most of the time were you (were you)..."
capture label variable s_8_5a "8.5a Currently you:"
capture label variable s_8_5b2_delete "Dedicated to household chores"
capture label variable s_8_5b1 "Dedicated to household chores"
capture label variable s_8_5b3 "Advanced age"
capture label variable s_8_5b2 "Retired or pensioned"
capture label variable s_8_5b4 "Sick or with temporary disability"
capture label variable s_8_5b5 "Unable to work for the rest of your life"
capture label variable s_8_5b6 "No clients/can't find work"
capture label variable s_8_5b7 "Need to provide family care"
capture label variable s_8_5b8 "No Response"
capture label variable s_8_5b9 "Don't Know"
capture label variable s_8_5c "8.5c How many years ago did you leave your last job? Years ____ No response...............88 Don't know..................99"
capture label variable s_8_5d "8.5d What is your job now:"
capture label variable s_8_7 "8.7 Have you ever had a job that required you to work frequently at night?"
capture label variable s_8_8 "8.8 In a typical week, how many night shifts would you work? No response................. 8 Don't know...................... 9"
capture label variable s_8_9 "8.9 For how many years were you in a job that required this night work? No response................. 8 Don't know...................... 9"
capture label variable s_8_10 "8.10 Your job required a lot of concentration or attention."
capture label variable s_8_11 "8.11 Your job was interesting and enjoyable."
capture label variable s_8_12 "8.12 Your job involved a lot of stress."
capture label variable s_8_13 "8.13 You really enjoyed going to work."
capture label variable s_8_14 "8.14 The job was physically demanding."
capture label variable s_8_15 "8.15 At work, you felt you had control over what happened in most situations."
capture label variable s_8_16 "8.16 What was (has been) the longest-lasting job of your spouse/ex-spouse [the last one if there is more than one ex-spouse]"

* Section 9: Health Conditions
capture label variable s_9_1 "9.1 Now I have some questions about your health, would you say your health is..."
capture label variable s_9_3 "9.3 Vision problems If yes, how much does it interfere with your activities; not at all, a little, or a lot?"
capture label variable s_9_4 "9.4 Hearing difficulty or deafness If yes, how much does it interfere with your activities; not at all, a little, or a lot?"
capture label variable s_9_5 "9.5 Have you ever been told you had asthma?"
capture label variable s_9_6 "9.6 How old were you when you were first told? Record age No response...................... 888 Don't know................................ 999"
capture label variable s_9_7 "9.7 Do you still have asthma?"
capture label variable s_9_8 "9.8 Have you ever been told you had hypertension?"
capture label variable s_9_9 "9.9 How old were you when you were first told? Record age or Record year No response...................... 888 Don't know................................ 999"
capture label variable s_9_11 "9.11 Are you taking medication to control your hypertension?"
capture label variable s_9_13 "9.13 When was the last time you had your blood pressure measured?"
capture label variable s_9_14 "9.14 Has a doctor ever told you that you had a heart disorder?"
capture label variable s_9_15 "9.15 When was the first time?"
capture label variable s_9_16 "9.16 What did the doctor tell you it was?"
capture label variable s_9_17 "9.17 Have you ever had a stroke (cerebral ischemia) that required medical attention? What happened? (Assign only if there is clear history of sudden onset of unilateral paralysis, and/or loss of speech, and/or blindness lasting at least 2 days)"
capture label variable s_9_18 "9.18 Who diagnosed this stroke?"
capture label variable s_9_19 "9.19 Have you ever experienced sudden weakness of a limb, loss of speech, or partial blindness that improved quickly, in less than a day? (Doctors sometimes call these TIA attacks)"
capture label variable s_9_20 "9.20 Have you ever had a blow to the head, head injury, or head trauma that was severe enough to require medical attention, cause loss of consciousness, or loss of memory for a period of time?"
capture label variable s_9_21a "9.21a Number:"
capture label variable s_9_21b "9.21b Hours or minutes?"
capture label variable s_9_22 "9.22 How old were you at that time? If there were multiple incidents, please refer to the first incident. Record age No response...................... 888 Don't know................................ 999"
capture label variable s_9_23 "9.23 Have you ever been told you had diabetes?"
capture label variable s_9_24 "9.24 Was the diabetes only present during pregnancy?"
capture label variable s_9_25 "9.25 At what age were you first told you had diabetes? If there were multiple incidents, please refer to the worst incident. Record age No response...................... 888 Don't know................................ 999"
capture label variable s_9_26 "9.26 Do you need a special diet, take tablets, or inject insulin?"
capture label variable s_9_28 "9.28 How often do you measure your blood sugar level yourself?"
capture label variable s_9_29 "9.29 How often do you visit a doctor for your diabetes?"
capture label variable s_9_30 "9.30 Have you ever been told you have high cholesterol/triglycerides/blood fats?"
capture label variable s_9_31 "9.31 How old were you at that time? If there were multiple incidents, please refer to the first incident. Record age No response...................... 888 Don't know................................ 999"
capture label variable s_9_32 "9.32 Do you need a special diet for cholesterol?"
capture label variable s_9_33 "9.33 Are you currently taking medication to control your cholesterol?"
capture label variable s_9_35 "9.35 How long ago was your cholesterol last measured?"
capture label variable s_9_36 "9.36 During the past year, how many times have you fallen without apparent reason? Record the number of falls"
capture label variable s_9_38a "Lung"
capture label variable s_9_38b "Liver"
capture label variable s_9_38c "Stomach or intestine"
capture label variable s_9_38d "Leukemia or lymphoma"
capture label variable s_9_38e "Skin"
capture label variable s_9_38f "Mouth or throat"
capture label variable s_9_38g "Colon"
capture label variable s_9_38h "Prostate (men)"
capture label variable s_9_38i "Breast"
capture label variable s_9_39 "9.39 Have you ever received chemotherapy or radiation therapy?"
capture label variable s_9_40 "9.40 Are you missing any natural teeth?"
capture label variable s_9_41 "9.41 Have you had urine accidents? Does urine leak if you can't get to the bathroom quickly?"
capture label variable s_9_42 "9.42 Have you ever been told you have Parkinson's disease?"
capture label variable s_9_43a "9.43a How old were you when you were first told? No response...................... 888 Don't know................................ 999"
capture label variable s_9_44 "9.44 Has a doctor ever told you that you have dementia or Alzheimer's?"
capture label variable s_9_45a "9.45a How old were you when you were first told? No response...................... 888 Don't know................................ 999"
capture label variable s_9_46 "9.46 Did the doctor prescribe any medication?"
capture label variable s_9_47 "9.47 Have there been times in your life before the past year when you suffered symptoms of sadness, empty feelings, depression, or lost interest in most things like work, hobbies, or other things that lasted at least two weeks?"
capture label variable s_9_48 "9.48 How old were you when this first happened? No response...................... 888 Don't know................................ 999"
capture label variable s_9_49 "9.49 Did you receive treatment from a family doctor or psychiatrist?"
capture label variable s_9_50 "9.50 Were you admitted to a hospital or psychiatric ward?"
capture label variable s_9_51 "9.51 Hearing exam?"
capture label variable s_9_52 "9.52 Vision exam?"
capture label variable s_9_53 "9.53 Mammogram or breast X-ray?"
capture label variable s_9_54 "9.54 Cervical cancer test (Pap smear)?"
capture label variable s_9_55 "9.55 Blood test for prostate?"
capture label variable s_9_56 "9.56 Rectal exam for prostate?"
capture label variable s_9_57 "9.57 How old were you when you started your first menstruation or period? No response...................... 88 Don't know................................ 99"
capture label variable s_9_58 "9.58 [ONLY ASK IF NOT YET CLEAR] Have you given birth to a baby?"
capture label variable s_9_59 "9.59 How old were you when you gave birth for the first time (first baby)? No response...................... 88 Don't know................................ 99"
capture label variable s_9_60 "9.60 How many times have you given birth? No response...................... 88 Don't know................................ 99"
capture label variable s_9_61 "9.61 How old were you when you finished going through menopause, that is, your last menstruation or period? STILL MENSTRUATING.........97 No response......................88 Don't know.............................99"
capture label variable s_9_61a "9.61a Did you have..."
capture label variable s_9_62 "9.62 Have you had a hysterectomy, that is, surgery to remove your uterus and ovaries, or uterus only?"
capture label variable s_9_63 "9.63 Have you used any contraceptive or been sterilized?"
capture label variable s_9_64_1 "9.64.1 Pills"
capture label variable s_9_64_2 "9.64.2 Injections"
capture label variable s_9_64_3 "9.64.3 Sterilization"
capture label variable s_9_64_4 "9.64.4 Others"
capture label variable s_9_65 "9.65 At what age did you start using the first of the methods you have used? Record age No response...................... 88 Don't know................................ 99"
capture label variable s_9_66 "9.66 Have you ever used female hormones (estrogens) in the form of pills, patches, or cream for 3 years or more to treat menopause?"

* Section 10: Depression and Sleep
capture label variable s_10_1a "10.1a You felt depressed. Would you say yes or not true?"
capture label variable s_10_1b "10.1b You felt that everything you did was an effort. Would you say yes or not true?"
capture label variable s_10_1c "10.1c Your sleep was restless. Would you say yes or not true?"
capture label variable s_10_1d "10.1d You were happy. Would you say yes or not true?"
capture label variable s_10_1e "10.1e You felt lonely. Would you say yes or not true?"
capture label variable s_10_1f "10.1f You enjoyed life. Would you say yes or not true?"
capture label variable s_10_1g "10.1g You felt sad. Would you say yes or not true?"
capture label variable s_10_1h "10.1h You could not get going. Would you say yes or not true?"
capture label variable s_10_2 "10.2 How often do you have trouble falling asleep? Would you say..."
capture label variable s_10_3 "10.3 How often do you wake up during the night after falling asleep? Would you say..."
capture label variable s_10_4 "10.4 How often do you wake up early and can't fall back asleep? Would you say..."
capture label variable s_10_5 "10.5 How often do you feel rested when you wake up in the morning?"
capture label variable s_10_6_1 "10.6.1 Your health: Does this make you feel stressed or anxious?"
capture label variable s_10_6_1a "10.6.1a How long have you felt this stress or anxiety?"
capture label variable s_10_6_2 "10.6.2 Your financial situation: Does this make you feel stressed or anxious?"
capture label variable s_10_6_2a "10.6.2a How long have you felt this stress or anxiety?"
capture label variable s_10_6_3 "10.6.3 Work problems: Does this make you feel stressed or anxious?"
capture label variable s_10_6_3a "10.6.3a How long have you felt this stress or anxiety?"
capture label variable s_10_6_4 "10.6.4 Family relationships: Does this make you feel stressed or anxious?"
capture label variable s_10_6_4a "10.6.4a How long have you felt this stress or anxiety?"
capture label variable s_10_7_1 "10.7.1 A major source of stress in my life has been my children."
capture label variable s_10_7_2 "10.7.2 Looking back, I often felt overwhelmed by the responsibility of being a parent."

* Section 11: Pain
capture label variable s_11_1 "11.1 In the past month, how often has a health condition caused you pain?"
capture label variable s_11_2 "11.2 In general, how would you rate the severity of pain in the past month? Would you say it is..."
capture label variable s_11_3 "11.3 When the pain is most intense, how much does it restrict the things you do?"

* Section 12: Functional Limitations (ADL/IADL)
capture label variable s_12_1a "12.1a Due to a health problem, do you have difficulty walking from one side of a room to the other?"
capture label variable s_12_1b "12.1.b Do you use equipment or devices such as a cane, orthopedic walker, or wheelchair to walk from one side of a room to the other?"
capture label variable s_12_1c "12.1.c Does anyone help you walk from one side of a room to the other?"
capture label variable s_12_2a "12.2a Due to a health problem, do you have difficulty bathing in a shower?"
capture label variable s_12_2c "12.2.c Does anyone help you bathe in a shower?"
capture label variable s_12_3a "12.3a Due to a health problem, do you have difficulty eating, for example cutting your food?"
capture label variable s_12_3c "12.3.c Does anyone help you eat, for example cutting your food?"
capture label variable s_12_4a "12.4a Due to a health problem, do you have difficulty getting in and out of bed?"
capture label variable s_12_4b "12.4.b Do you use equipment or devices such as a cane, orthopedic walker, or wheelchair...getting in and out of bed?"
capture label variable s_12_4c "12.4.c Does anyone help you...getting in and out of bed?"
capture label variable s_12_5a "12.5a Due to a health problem, do you have difficulty using the toilet, including getting on and off or squatting?"
capture label variable s_12_5c "12.5c Does anyone help you use the toilet, including getting on and off or squatting?"
capture label variable s_12_6a "12.6a Due to a health problem, do you have difficulty cutting your toenails?"
capture label variable s_12_6c "12.6c Does anyone help you cut your toenails?"
capture label variable s_12_7 "12.7 Due to a health problem, do you have difficulty...preparing a hot meal?"
capture label variable s_12_8 "12.8 Due to a health problem, do you have difficulty...shopping for groceries/errands?"
capture label variable s_12_9 "12.9 Due to a health problem, do you have difficulty...taking your medications (if you take any or had to take any)?"
capture label variable s_12_10 "12.10 Due to a health problem, do you have difficulty...managing your money?"
capture label variable s_12_11 "12.11 Can you walk?"
capture label variable s_12_13 "12.13 Do you have difficulty walking several blocks?"
capture label variable s_12_14 "12.14 Do you have difficulty climbing stairs several floors without resting?"
capture label variable s_12_15 "12.15 Do you have difficulty pushing or pulling a large object like an armchair?"
capture label variable s_12_16 "12.16 Please raise and extend your arms above your shoulders."

* Section 13: Lifestyle and Diet
capture label variable s_13_1_p_c "13.1 Have you ever smoked cigarettes/cigars?"
capture label variable s_13_1_d "13.1 Have you ever smoked cigars/puros?"
capture label variable s_13_2 "13.2 How old were you when you started smoking? Record age No response...................... 888 Don't know................................ 999"
capture label variable s_13_3_p_c "13.3 Do you currently smoke cigarettes/cigars?"
capture label variable s_13_3_d "13.3 Do you currently smoke cigars/puros?"
capture label variable s_13_4 "13.4 [If no longer smokes] How old were you when you quit smoking? Record age or Record year No response...................... 888 Don't know................................ 999"
capture label variable s_13_5 "13.5 How often do you smoke?"
capture label variable s_13_6_p_c "13.6 How many cigarettes/cigars do you normally smoke per day? CIGARETTES/DAY..............................|_|_| 87 OR MORE CIGARETTES/DAY..................... 87 NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_6_d "13.6 How many cigars/puros do you normally smoke per day? CIGARETTES/DAY..............................|_|_| 87 OR MORE CIGARETTES/DAY..................... 87 NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_7_p_c "13.7 When you smoked the most, how many cigarettes/cigars did you smoke in a day? CIGARETTES/DAY..............................|_|_| 87 OR MORE CIGARETTES/DAY..................... 87 NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_7_d "13.7 When you smoked the most, how many cigars/puros did you smoke in a day? CIGARETTES/DAY..............................|_|_| 87 OR MORE CIGARETTES/DAY..................... 87 NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_8 "13.8 In your lifetime, have you had at least 12 glasses or cups of alcoholic beverages of any kind?"
capture label variable s_13_9 "13.9 Do you currently drink alcoholic beverages of any kind?"
capture label variable s_13_10 "13.10 How many alcoholic drinks do you usually have? (Interviewer instructions: 1 bottle of rum = 16 drinks; 1 bottle of wine = 7 drinks) RECORD NUMBER OF DRINKS.........|_|_| NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_11 "13.11 During the period when you drank the most alcohol, how many alcoholic drinks did you have in an average week? (Interviewer instructions: 1 bottle of rum = 16 drinks; 1 bottle of wine = 7 drinks) RECORD NUMBER OF DRINKS.........|_|_| NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_12 "13.12 Has there been a period of several years in which you would have said you were a heavy drinker?"
capture label variable s_13_13 "13.13 How often do you eat meat?"
capture label variable s_13_14 "13.14 How often do you eat fish?"
capture label variable s_13_15 "13.15 How often do you eat fruit?"
capture label variable s_13_16 "13.16 How often do you eat vegetables?"
capture label variable s_13_17 "13.17 How often do you drink soda (e.g. - Coca Cola, Fanta, etc.)?"
capture label variable s_13_18 "13.18 Considering both work and leisure, would you say you are"
capture label variable s_13_19 "13.19 Have you taken walks of half a kilometer or more in the past month? (That would normally be CONTINUOUS walking for at least 10-15 minutes)"
capture label variable s_13_20 "13.20 In the past month, how many times did you walk half a kilometer or more? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_22 "13.22 On average during the past year, have you exercised or done heavy physical work three times a week or more? INCLUDES VARIOUS ACTIVITIES SUCH AS SPORTS, HEAVY HOUSEHOLD CHORES, OR OTHER PHYSICAL WORK"
capture label variable s_13_23_p "13.23 What is your current weight? RECORD WEIGHT in pounds NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_23_d_c "13.23 What is your current weight? Record weight in kg (if answered in pounds, divide by 2.2) NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_24 "13.24 According to these images, how do you think you currently look? SHOW BODY IMAGE CARD NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_25_d_c "13.25 What was your weight at age 25? Record weight in kg (if answered in pounds, divide by 2.2) NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_25_p "13.25 What was your weight at age 25? RECORD WEIGHT in pounds NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_26 "13.26 According to these images, how do you think you looked at that time? SHOW CARD RECORD NUMBER.............................|_|_| NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_27_d_c "13.27 What was/has been your maximum weight during your life (if female, do not include pregnancies)? Not applicable if proxy needed Record weight in kg (if answered in pounds, divide by 2.2) NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_27_p "13.27 What was/has been your maximum weight during your life (if female, do not include pregnancies)? RECORD WEIGHT in pounds NO RESPONSE...................................... 888 DON'T KNOW................................................. 999"
capture label variable s_13_28 "13.28 According to these images, how do you think you looked at that time? SHOW CARD 'B' NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_29 "13.29 How old were you when you reached that maximum weight? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_13_30_d_c "13.30 In the past 6 months, have you lost more than 5 kilograms of weight unintentionally?"
capture label variable s_13_30_p "13.30 In the past 6 months, have you lost more than 10 pounds of weight unintentionally?"

* Section 14: Healthcare Access
capture label variable s_14_1_p_d "14.1 Do you have a health plan?"
capture label variable s_14_2a_p "Government Card, Mi salud or Vital"
capture label variable s_14_2b_p "Medicare Part A"
capture label variable s_14_2c_p "Medicare Part B"
capture label variable s_14_2d_p "Medicare Part D"
capture label variable s_14_2e_p "A Medicare supplemental plan"
capture label variable s_14_2f_p "A Medicare advantage plan"
capture label variable s_14_2g_p "A private individual health plan"
capture label variable s_14_2h_p "Other"
capture label variable s_14_2i_p "No response"
capture label variable s_14_2j_p "Don't know"
capture label variable s_14_2a_d "SENASA"
capture label variable s_14_2b_d "SENASA - SUBSIDIZED"
capture label variable s_14_2c_d "A private individual health plan"
capture label variable s_14_2d_d "A private plan through an employer"
capture label variable s_14_2e_d "Other"
capture label variable s_14_2f_d "No response"
capture label variable s_14_2g_d "Don't know"
capture label variable s_14_3 "14.3 In the past three months have you visited or consulted a general practitioner, meaning a primary care doctor or family doctor?"
capture label variable s_14_4 "14.4 Total number of consultations in the past three months RECORD NUMBER............................|_|_|_|_| NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_5 "14.5 Typically, for each visit to your regular doctor, how much time do you spend traveling (minutes)? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_6 "14.6 Typically, for each visit to your regular doctor, how much money do you spend traveling? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_8 "14.8 Typically, for each visit to your regular doctor, how much total time waiting for the consultation (minutes)? NO RESPONSE.......................... 888 DON'T KNOW.............................. 999"
capture label variable s_14_9 "14.9 Typically, for each consultation, how much do you pay? [You or your family, not including amounts paid by health insurance] NO RESPONSE.......................... 888 DON'T KNOW.............................. 999"
capture label variable s_14_11 "14.11 In the past year, approximately how many times have you visited or consulted with a doctor or medical personnel? (Does not include hospital stays) NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_12 "14.12 Including all visits to doctor or medical personnel, approximately how much was paid for these consultations in the past year? [You or your family, not including amounts paid by health insurance. NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_13 "14.13 In the past year, approximately how many times have you had surgical procedures without being admitted to the hospital? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_14 "14.14 Including all surgical procedures without being admitted to the hospital, approximately how much was paid for these consultations? [You or your family, not including amounts paid by health insurance. Do not include costs already mentioned in 14.12.]"
capture label variable s_14_15 "14.15 In the past year, approximately how many times have you consulted a dentist? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_16 "14.16 Including all consultations with a dentist, approximately how much was paid for these consultations? [You or your family, not including amounts paid by health insurance] NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_17 "14.17 In the past year, did you ever think you had a serious health problem but did not go to the doctor?"
capture label variable s_14_18_1 "14.18.1 Believed it wouldn't help you get better"
capture label variable s_14_18_2 "14.18.2 Believed it would take too long to get there"
capture label variable s_14_18_3 "14.18.3 Didn't have money"
capture label variable s_14_18_4 "14.18.4 Didn't want to bother someone to take you"
capture label variable s_14_18_5 "14.18.5 Was afraid of what the doctor would find"
capture label variable s_14_18_6 "14.18.6 Was afraid of COVID"
capture label variable s_14_20 "14.20 Including all times in the past year, approximately how many nights have you been hospitalized? NONE....................................................00 NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_22 "14.22 Including all times, approximately how much was paid for these hospitalizations? [You or your family, not including amounts paid by health insurance] NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_23 "14.23 In addition to hospitals, other facilities care for people when they are sick and/or recovering. Have you had another residential stay in the past year?"
capture label variable s_14_24 "14.24 Including all times in the past year, approximately how many nights have you been admitted to this residence? NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_25 "14.25 Including all times, approximately how much was paid? [You or your family, not including amounts paid by health insurance] NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_30a "14.30a Approximately how much was spent in total on medications and remedies in the past month? [Paid by you or your family, not including amounts paid by insurance] NO RESPONSE...................................... 88 DON'T KNOW................................................. 99"
capture label variable s_14_30b1_p "14.30b.1 Would you say these expenses were in total more than $100?"
capture label variable s_14_30b1_d "14.30b.1 Would you say these expenses were in total more than 5000 pesos?"
capture label variable s_14_30b1_c "14.30b.1 Would you say these expenses were in total more than 1250 CUP?"
capture label variable s_14_30b2_p "14.30b2 Would you say these expenses were in total more than $50?"
capture label variable s_14_30b2_d "14.30b2 Would you say these expenses were in total more than 2500 pesos?"
capture label variable s_14_30b2_c "14.30b2 Would you say these expenses were in total more than 125 CUP?"
capture label variable s_14_30b3_p "14.30b3 Would you say these expenses were in total more than $200?"
capture label variable s_14_30b3_d "14.30b3 Would you say these expenses were in total more than 10,000 pesos?"
capture label variable s_14_30b3_c "14.30b3 Would you say these expenses were in total more than 4500 CUP?"
capture label variable s_14_31 "14.31 Have you been vaccinated against COVID?"
capture label variable s_14_32 "14.32 How many doses have you received?"
capture label variable s_14_33 "14.33 Have you ever had COVID?"

* Section 15: Interview Completion
capture label variable s_15_1 "15.1 This sociodemographic risk factors interview was conducted with:"
capture label variable s_15_2 "15.2 What is the proxy's relationship to (xxx)?"
capture label variable s_15_3 "15.3 General confidence in the data"
