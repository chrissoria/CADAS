* Household_english_labels.do
* Apply English labels to Household variables
* Called from Household_Read.do when language == "E"

****************************************
****************************************
* VALUE LABELS (label define + label values)
****************************************

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba", replace
capture label values h_country country_label
label define H_3_1 .a"." 1 "Own" 2 "Rent" 3 "Other", replace
capture label values h_3_1 H_3_1
label define H_3_3A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3a_p H_3_3A_P
label define H_3_3A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3a_d H_3_3A_D
label define H_3_3A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3a_c H_3_3A_C
label define H_3_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3b_p H_3_3B_P
label define H_3_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3b_d H_3_3B_D
label define H_3_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3b_c H_3_3B_C
label define H_3_3C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3c_p H_3_3C_P
label define H_3_3C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3c_d H_3_3C_D
label define H_3_3C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_3c_c H_3_3C_C
label define H_3_5A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5a_p H_3_5A_P
label define H_3_5A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5a_d H_3_5A_D
label define H_3_5A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5a_c H_3_5A_C
label define H_3_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5b_p H_3_5B_P
label define H_3_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5b_d H_3_5B_D
label define H_3_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5b_c H_3_5B_C
label define H_3_5C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5c_p H_3_5C_P
label define H_3_5C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5c_d H_3_5C_D
label define H_3_5C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_5c_c H_3_5C_C
label define H_3_7A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7a_p H_3_7A_P
label define H_3_7A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7a_d H_3_7A_D
label define H_3_7A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7a_c H_3_7A_C
label define H_3_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7b_p H_3_7B_P
label define H_3_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7b_d H_3_7B_D
label define H_3_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7b_c H_3_7B_C
label define H_3_7C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7c_p H_3_7C_P
label define H_3_7C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7c_d H_3_7C_D
label define H_3_7C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_7c_c H_3_7C_C
label define H_3_8 .a"." 1 "Concrete" 2 "Tile" 3 "Wood" 4 "Tin" 5 "Other" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_8 H_3_8
label define N10ENESTAVIVIENDATIENEN .a"." 1 "Piped water inside the home?" 2 "Piped water outside the home but within the property?" 3 "Other piped water?" 4 "Non-piped water (well, river, other)?" 8 "Does not respond"9 "Does not know", replace
capture label values n10enestaviviendatienen N10ENESTAVIVIENDATIENEN
label define H_3_11 .a"." 1 "Have a water connection?" 2 "Filled with a water bucket?" 3 "Not filled with water? (latrine)" 4 "Does not have" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_11 H_3_11
label define H_3_12 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_12 H_3_12
label define S_3_13 .a"." 1 "Gas" 2 "Wood or coal" 3 "Electricity" 4 "Other" 8 "Does not respond"9 "Does not know", replace
capture label values s_3_13 S_3_13
label define H_3_14_1 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_1 H_3_14_1
label define H_3_14_2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_2 H_3_14_2
label define H_3_14_3 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_3 H_3_14_3
label define H_3_14_4 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_4 H_3_14_4
label define H_3_14_5 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_5 H_3_14_5
label define H_3_14_6 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_6 H_3_14_6
label define H_3_14_7 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_7 H_3_14_7
label define H_3_14_8 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_8 H_3_14_8
label define H_3_14_9 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_9 H_3_14_9
label define H_3_14_10 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_10 H_3_14_10
label define H_3_14_11 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_11 H_3_14_11
label define H_3_14_12 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_14_12 H_3_14_12
label define H_3_17A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17a_p H_3_17A_P
label define H_3_17A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17a_d H_3_17A_D
label define H_3_17A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17a_c H_3_17A_C
label define H_3_17B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17b_p H_3_17B_P
label define H_3_17B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17b_d H_3_17B_D
label define H_3_17B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17b_c H_3_17B_C
label define H_3_17C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17c_p H_3_17C_P
label define H_3_17C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17c_d H_3_17C_D
label define H_3_17C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_17c_c H_3_17C_C
label define H_3_18 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_18 H_3_18
label define H_3_20A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20a_p H_3_20A_P
label define H_3_20A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20a_d H_3_20A_D
label define H_3_20A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20a_c H_3_20A_C
label define H_3_20B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20b_p H_3_20B_P
label define H_3_20B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20b_d H_3_20B_D
label define H_3_20B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20b_c H_3_20B_C
label define H_3_20C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20c_p H_3_20C_P
label define H_3_20C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20c_d H_3_20C_D
label define H_3_20C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_20c_c H_3_20C_C
label define H_3_21 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_21 H_3_21
label define H_3_23A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23a_p H_3_23A_P
label define H_3_23A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23a_d H_3_23A_D
label define H_3_23A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23a_c H_3_23A_C
label define H_3_23B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23b_p H_3_23B_P
label define H_3_23B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23b_d H_3_23B_D
label define H_3_23B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23b_c H_3_23B_C
label define H_3_23C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23c_p H_3_23C_P
label define H_3_23C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23c_d H_3_23C_D
label define H_3_23C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_23c_c H_3_23C_C
label define H_3_24 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_24 H_3_24
label define H_3_26A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26a_p H_3_26A_P
label define H_3_26A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26a_d H_3_26A_D
label define H_3_26A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26a_c H_3_26A_C
label define H_3_26B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26b_p H_3_26B_P
label define H_3_26B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26b_d H_3_26B_D
label define H_3_26B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26b_c H_3_26B_C
label define H_3_26C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26c_p H_3_26C_P
label define H_3_26C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26c_d H_3_26C_D
label define H_3_26C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_26c_c H_3_26C_C
label define H_3_28A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28a_p H_3_28A_P
label define H_3_28A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28a_d H_3_28A_D
label define H_3_28A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28a_c H_3_28A_C
label define H_3_28B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28b_p H_3_28B_P
label define H_3_28B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28b_d H_3_28B_D
label define H_3_28B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28b_c H_3_28B_C
label define H_3_28C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28c_p H_3_28C_P
label define H_3_28C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28c_d H_3_28C_D
label define H_3_28C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_28c_c H_3_28C_C
label define H_3_29 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_29 H_3_29
label define H_3_31A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31a_p H_3_31A_P
label define H_3_31A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31a_d H_3_31A_D
label define H_3_31A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31a_c H_3_31A_C
label define H_3_31B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31b_p H_3_31B_P
label define H_3_31B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31b_d H_3_31B_D
label define H_3_31B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31b_c H_3_31B_C
label define H_3_31C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31c_p H_3_31C_P
label define H_3_31C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31c_d H_3_31C_D
label define H_3_31C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_31c_c H_3_31C_C
label define H_3_33A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33a_p H_3_33A_P
label define H_3_33A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33a_d H_3_33A_D
label define H_3_33A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33a_c H_3_33A_C
label define H_3_33B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33b_p H_3_33B_P
label define H_3_33B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33b_d H_3_33B_D
label define H_3_33B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33b_c H_3_33B_C
label define H_3_33C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33c_p H_3_33C_P
label define H_3_33C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33c_d H_3_33C_D
label define H_3_33C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_33c_c H_3_33C_C
label define H_3_34 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_3_34 H_3_34
label define H_4_1 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1 H_4_1
label define H_4_1B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b_p H_4_1B_P
label define H_4_1B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b_d H_4_1B_D
label define H_4_1B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b_c H_4_1B_C
label define H_4_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b2_p H_4_1B2_P
label define H_4_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b2_d H_4_1B2_D
label define H_4_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b2_c H_4_1B2_C
label define H_4_1B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b3_p H_4_1B3_P
label define H_4_1B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b3_d H_4_1B3_D
label define H_4_1B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_1b3_c H_4_1B3_C
label define H_4_2 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2 H_4_2
label define H_4_2B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b_p H_4_2B_P
label define H_4_2B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b_d H_4_2B_D
label define H_4_2B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b_c H_4_2B_C
label define H_4_2B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b2_p H_4_2B2_P
label define H_4_2B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b2_d H_4_2B2_D
label define H_4_2B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b2_c H_4_2B2_C
label define H_4_2B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b3_p H_4_2B3_P
label define H_4_2B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b3_d H_4_2B3_D
label define H_4_2B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_2b3_c H_4_2B3_C
label define H_4_3 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3 H_4_3
label define H_4_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b_p H_4_3B_P
label define H_4_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b_d H_4_3B_D
label define H_4_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b_c H_4_3B_C
label define H_4_3B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b2_p H_4_3B2_P
label define H_4_3B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b2_d H_4_3B2_D
label define H_4_3B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b2_c H_4_3B2_C
label define H_4_3B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b3_p H_4_3B3_P
label define H_4_3B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b3_d H_4_3B3_D
label define H_4_3B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_3b3_c H_4_3B3_C
label define H_4_4 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4 H_4_4
label define H_4_4B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b_p H_4_4B_P
label define H_4_4B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b_d H_4_4B_D
label define H_4_4B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b_c H_4_4B_C
label define H_4_4B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b2_p H_4_4B2_P
label define H_4_4B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b2_d H_4_4B2_D
label define H_4_4B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b2_c H_4_4B2_C
label define H_4_4B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b3_p H_4_4B3_P
label define H_4_4B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b3_d H_4_4B3_D
label define H_4_4B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_4b3_c H_4_4B3_C
label define H_4_5 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5 H_4_5
label define H_4_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b_p H_4_5B_P
label define H_4_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b_d H_4_5B_D
label define H_4_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b_c H_4_5B_C
label define H_4_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b2_p H_4_5B2_P
label define H_4_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b2_d H_4_5B2_D
label define H_4_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b2_c H_4_5B2_C
label define H_4_5B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b3_p H_4_5B3_P
label define H_4_5B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b3_d H_4_5B3_D
label define H_4_5B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_5b3_c H_4_5B3_C
label define H_4_6 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6 H_4_6
label define H_4_6B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b_p H_4_6B_P
label define H_4_6B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b_d H_4_6B_D
label define H_4_6B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b_c H_4_6B_C
label define H_4_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b2_p H_4_6B2_P
label define H_4_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b2_d H_4_6B2_D
label define H_4_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b2_c H_4_6B2_C
label define H_4_6B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b3_p H_4_6B3_P
label define H_4_6B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b3_d H_4_6B3_D
label define H_4_6B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_6b3_c H_4_6B3_C
label define H_4_7 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7 H_4_7
label define H_4_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b_p H_4_7B_P
label define H_4_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b_d H_4_7B_D
label define H_4_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b_c H_4_7B_C
label define H_4_7B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b2_p H_4_7B2_P
label define H_4_7B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b2_d H_4_7B2_D
label define H_4_7B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_7b2_c H_4_7B2_C
label define H_4_8 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8 H_4_8
label define H_4_8B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b_p H_4_8B_P
label define H_4_8B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b_d H_4_8B_D
label define H_4_8B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b_c H_4_8B_C
label define H_4_8B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b2_p H_4_8B2_P
label define H_4_8B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b2_d H_4_8B2_D
label define H_4_8B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_4_8b2_c H_4_8B2_C
label define H_5 .a"." 2 "Yes" 1 "No", replace
capture label values h_5 H_5
label define H_5_1 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1 H_5_1
label define H_5_1B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b_p H_5_1B_P
label define H_5_1B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b_d H_5_1B_D
label define H_5_1B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b_c H_5_1B_C
label define H_5_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b2_p H_5_1B2_P
label define H_5_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b2_d H_5_1B2_D
label define H_5_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b2_c H_5_1B2_C
label define H_5_1B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b3_p H_5_1B3_P
label define H_5_1B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b3_d H_5_1B3_D
label define H_5_1B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_1b3_c H_5_1B3_C
label define H_5_2 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2 H_5_2
label define H_5_2B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b_p H_5_2B_P
label define H_5_2B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b_d H_5_2B_D
label define H_5_2B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b_c H_5_2B_C
label define H_5_2B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b2_p H_5_2B2_P
label define H_5_2B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b2_d H_5_2B2_D
label define H_5_2B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b2_c H_5_2B2_C
label define H_5_2B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b3_p H_5_2B3_P
label define H_5_2B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b3_d H_5_2B3_D
label define H_5_2B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_2b3_c H_5_2B3_C
label define H_5_3 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3 H_5_3
label define H_5_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b_p H_5_3B_P
label define H_5_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b_d H_5_3B_D
label define H_5_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b_c H_5_3B_C
label define H_5_3B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b2_p H_5_3B2_P
label define H_5_3B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b2_d H_5_3B2_D
label define H_5_3B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b2_c H_5_3B2_C
label define H_5_3B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b3_p H_5_3B3_P
label define H_5_3B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b3_d H_5_3B3_D
label define H_5_3B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_3b3_c H_5_3B3_C
label define H_5_4 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4 H_5_4
label define H_5_4B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b_p H_5_4B_P
label define H_5_4B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b_d H_5_4B_D
label define H_5_4B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b_c H_5_4B_C
label define H_5_4B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b2_p H_5_4B2_P
label define H_5_4B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b2_d H_5_4B2_D
label define H_5_4B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b2_c H_5_4B2_C
label define H_5_4B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b3_p H_5_4B3_P
label define H_5_4B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b3_d H_5_4B3_D
label define H_5_4B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_4b3_c H_5_4B3_C
label define H_5_5 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5 H_5_5
label define H_5_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b_p H_5_5B_P
label define H_5_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b_d H_5_5B_D
label define H_5_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b_c H_5_5B_C
label define H_5_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b2_p H_5_5B2_P
label define H_5_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b2_d H_5_5B2_D
label define H_5_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b2_c H_5_5B2_C
label define H_5_5B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b3_p H_5_5B3_P
label define H_5_5B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b3_d H_5_5B3_D
label define H_5_5B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_5b3_c H_5_5B3_C
label define H_5_6 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6 H_5_6
label define H_5_6B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b_p H_5_6B_P
label define H_5_6B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b_d H_5_6B_D
label define H_5_6B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b_c H_5_6B_C
label define H_5_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b2_p H_5_6B2_P
label define H_5_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b2_d H_5_6B2_D
label define H_5_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b2_c H_5_6B2_C
label define H_5_6B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b3_p H_5_6B3_P
label define H_5_6B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b3_d H_5_6B3_D
label define H_5_6B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_6b3_c H_5_6B3_C
label define H_5_7 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7 H_5_7
label define H_5_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b_p H_5_7B_P
label define H_5_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b_d H_5_7B_D
label define H_5_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b_c H_5_7B_C
label define H_5_7B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b2_p H_5_7B2_P
label define H_5_7B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b2_d H_5_7B2_D
label define H_5_7B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_7b2_c H_5_7B2_C
label define H_5_8 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8 H_5_8
label define H_5_8B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b_p H_5_8B_P
label define H_5_8B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b_d H_5_8B_D
label define H_5_8B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b_c H_5_8B_C
label define H_5_8B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b2_p H_5_8B2_P
label define H_5_8B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b2_d H_5_8B2_D
label define H_5_8B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_5_8b2_c H_5_8B2_C
label define H_6_1 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1 H_6_1
label define H_6_1B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b1_p H_6_1B1_P
label define H_6_1B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b1_d H_6_1B1_D
label define H_6_1B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b1_c H_6_1B1_C
label define H_6_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b2_p H_6_1B2_P
label define H_6_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b2_d H_6_1B2_D
label define H_6_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_1b2_c H_6_1B2_C
label define H_6_2 .a"." 1 "More than enough?" 2 "Enough?" 3 "Not enough?" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_2 H_6_2
label define H_6_3 .a"." 1 "More than enough?" 2 "Enough?" 3 "Not enough?" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_3 H_6_3
label define H_6_41_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_41_d H_6_41_D
label define H_6_42_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_42_d H_6_42_D
label define H_6_43_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_43_d H_6_43_D
label define H_6_44_P .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_44_p H_6_44_P
label define H_6_5 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5 H_6_5
label define H_6_5B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b1_p H_6_5B1_P
label define H_6_5B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b1_d H_6_5B1_D
label define H_6_5B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b1_c H_6_5B1_C
label define H_6_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b2_p H_6_5B2_P
label define H_6_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b2_d H_6_5B2_D
label define H_6_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_5b2_c H_6_5B2_C
label define H_6_6 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6 H_6_6
label define H_6_6B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b1_p H_6_6B1_P
label define H_6_6B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b1_d H_6_6B1_D
label define H_6_6B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b1_c H_6_6B1_C
label define H_6_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b2_p H_6_6B2_P
label define H_6_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b2_d H_6_6B2_D
label define H_6_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_6_6b2_c H_6_6B2_C
label define H_7_1_P_C .a"." 1 "Independent-standing house" 2 "House which shares walls with another house" 3 "Apartment" 4 "Housing constructed in open spaces and alleys" 5 "Housing shared with business" 77 "Other" 99 "Does not know", replace
capture label values h_7_1_p_c H_7_1_P_C
label define H_7_1_D .a"." 1 "Independent-standing house" 2 "House which shares walls with another house" 3 "Apartment" 4 "Housing constructed in open spaces and alleys" 5 "Housing shared with business" 6 "Provisional housing, originally intended for plantation workers or disaster survivors" 77 "Other" 99 "Does not know", replace
capture label values h_7_1_d H_7_1_D
label define H_7_2_1 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_7_2_1 H_7_2_1
label define H_7_2_2 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_7_2_2 H_7_2_2
label define H_7_2_3 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_7_2_3 H_7_2_3
label define H_7_2_4 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_7_2_4 H_7_2_4
label define H_7_2_5 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know", replace
capture label values h_7_2_5 H_7_2_5

****************************************

* VARIABLE LABELS (label variable)
****************************************

* Identifier variables
capture label variable h_interid "Interviewer number:"
capture label variable h_houseid "House number:"
capture label variable h_clustid "Cluster number"
capture label variable h_houseid2 "House number:"
capture label variable h_conglid2 "Cluster number"
capture label variable h_country "Country:"
capture label variable h_deviceid1 "Device ID:"
capture label variable h_deviceid2 "Device ID:"

* Section 3: Housing and Assets
capture label variable h_3_1 "3.1 Does the family own or rent the house?"
capture label variable h_3_2_p "3.2 If you sold it today and paid what you owe on this property (land and dwelling), how much money would you get? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_2_d "3.2 If you sold it today and paid what you owe on this property (land and dwelling), how much money would you get? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_2_c "3.2 If you sold it today and paid what you owe on this property (land and dwelling), how much money would you get? CUP NO RESPONSE=88 DON'T KNOW=99"

* 3.3 Unfolding brackets for property value
capture label variable h_3_3a_p "3.3a more than $36,000?"
capture label variable h_3_3a_d "3.3a more than $500,000 pesos?"
capture label variable h_3_3a_c "3.3a more than 1,100,000 CUP?"
capture label variable h_3_3b_p "3.3b more than $18,500?"
capture label variable h_3_3b_d "3.3b more than $250,000 pesos?"
capture label variable h_3_3b_c "3.3b more than 550,000 CUP?"
capture label variable h_3_3c_p "3.3c more than $180,000?"
capture label variable h_3_3c_d "3.3c more than $2,500,000 pesos?"
capture label variable h_3_3c_c "3.3c more than 5,500,000 CUP?"

* 3.4 Rental value
capture label variable h_3_4_p "3.4 If this house were rented to another person, what would the monthly rent be? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_4_d "3.4 If this house were rented to another person, what would the monthly rent be? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_4_c "3.4 If this house were rented to another person, what would the monthly rent be? CUP NO RESPONSE=88 DON'T KNOW=99"

* 3.5 Unfolding brackets for rental value
capture label variable h_3_5a_p "3.5a more than $1,200 per month?"
capture label variable h_3_5a_d "3.5a more than $15,000 pesos per month?"
capture label variable h_3_5a_c "3.5a more than 35,000 CUP"
capture label variable h_3_5b_p "3.5b more than $400 per month?"
capture label variable h_3_5b_d "3.5b more than $5,000 pesos per month?"
capture label variable h_3_5b_c "3.5b more than 12,500 CUP?"
capture label variable h_3_5c_p "3.5c more than $3,600?"
capture label variable h_3_5c_d "3.5c more than $50,000 pesos?"
capture label variable h_3_5c_c "3.5c more than 110,000 CUP"

* 3.6 Actual rent paid
capture label variable h_3_6_p "3.6 How much is paid for rent per month? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_6_d "3.6 How much is paid for rent per month? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_6_c "3.6 How much is paid for rent per month? CUP NO RESPONSE=88 DON'T KNOW=99"

* 3.7 Unfolding brackets for rent
capture label variable h_3_7a_p "3.7a more than $1,200 per month?"
capture label variable h_3_7a_d "3.7a more than $15,000 pesos per month?"
capture label variable h_3_7a_c "3.7a more than 35,000 CUP?"
capture label variable h_3_7b_p "3.7b more than $400 per month?"
capture label variable h_3_7b_d "3.7b more than $5,000 pesos per month?"
capture label variable h_3_7b_c "3.7b more than 12,500 CUP?"
capture label variable h_3_7c_p "3.7c more than $3,600 per month?"
capture label variable h_3_7c_d "3.7c more than $50,000 pesos per month?"
capture label variable h_3_7c_c "3.7c more than 110,000 CUP?"

* Housing characteristics
capture label variable h_3_8 "3.8 What material is most of the roof of this dwelling made of?"
capture label variable h_3_9 "3.9 How many bedrooms does it have?"
capture label variable n10enestaviviendatienen "3.10 In this dwelling, do you have"
capture label variable h_3_11 "3.11 The sanitary service you use..."
capture label variable h_3_12 "3.12 Is this service used only by people in this dwelling?"
capture label variable h_3_13 "3.13 The fuel most used for cooking is..."

* 3.14 Household assets
capture label variable h_3_14_1 "3.14.1 television"
capture label variable h_3_14_2 "3.14.2 refrigerator and/or freezer"
capture label variable h_3_14_3 "3.14.3 electricity"
capture label variable h_3_14_4 "3.14.4 Residential/landline telephone"
capture label variable h_3_14_5 "3.14.5 Does any household member have a cell phone?"
capture label variable h_3_14_6 "3.14.6 plumbing bathtub"
capture label variable h_3_14_7 "3.14.7 radio"
capture label variable h_3_14_8 "3.14.8 sewing machine"
capture label variable h_3_14_9 "3.14.9 computer"
capture label variable h_3_14_10 "3.14.10 internet"
capture label variable h_3_14_11 "3.14.11 air conditioning"
capture label variable h_3_14_12 "3.14.12 electric fan"

* 3.15-3.17 Vehicles
capture label variable h_3_15 "3.15 How many motor vehicles (cars, trucks, etc.) do family members own?"
capture label variable h_3_16_p "3.16 If you sold all these vehicles today, how much would you get? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_16_d "3.16 If you sold all these vehicles today, how much would you get? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_16_c "3.16 If you sold all these vehicles today, how much would you get? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_17a_p "3.17a more than $36,000?"
capture label variable h_3_17a_d "3.17a more than $500,000 pesos?"
capture label variable h_3_17a_c "3.17a more than 1,110,000 CUP?"
capture label variable h_3_17b_p "3.17b more than $18,500?"
capture label variable h_3_17b_d "3.17b more than $250,000 pesos?"
capture label variable h_3_17b_c "3.17b more than 550,000 CUP?"
capture label variable h_3_17c_p "3.17c more than $100,000?"
capture label variable h_3_17c_d "3.17c more than $1,400,000 pesos?"
capture label variable h_3_17c_c "3.17b more than 5,500,000 CUP"

* 3.18-3.20 Other real estate
capture label variable h_3_18 "3.18 Do you (or your spouse or other older adult in this house) own any other house, condo, or real estate property such as land and/or lots?"
capture label variable h_3_19_p "3.19 If you sold them today and paid what you owe on these properties, how much would you get? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_19_d "3.19 If you sold them today and paid what you owe on these properties, how much would you get? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_19_c "3.19 If you sold them today and paid what you owe on these properties, how much would you get? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_20a_p "3.20a more than $36,000?"
capture label variable h_3_20a_d "3.20a more than $500,000 pesos?"
capture label variable h_3_20a_c "3.20a more than 1,110,000 CUP"
capture label variable h_3_20b_p "3.20b more than $18,500?"
capture label variable h_3_20b_d "3.20b more than $250,000 pesos?"
capture label variable h_3_20b_c "3.20b more than 550,000 CUP"
capture label variable h_3_20c_p "3.20c more than $180,000?"
capture label variable h_3_20c_d "3.20c more than $2,500,000 pesos?"
capture label variable h_3_20c_c "3.20c more than 5,500,000 CUP"

* 3.21-3.23 Business ownership
capture label variable h_3_21 "3.21 Do you (and/or your spouse or other older adult in this house) own any business, farmland, or livestock?"
capture label variable h_3_22_p "3.22 If you sold it now (and paid what you owe), how much would you get? [Include value of business equipment, animals, etc., but exclude property value already estimated] $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_22_d "3.22 If you sold it now (and paid what you owe), how much would you get? [Include value of business equipment, animals, etc., but exclude property value already estimated] pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_22_c "3.22 If you sold it now (and paid what you owe), how much would you get? [Include value of business equipment, animals, etc., but exclude property value already estimated] CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_23a_p "3.23a more than $30,000?"
capture label variable h_3_23a_d "3.23a more than $400,000 pesos?"
capture label variable h_3_23a_c "3.23a more than 150,000 CUP?"
capture label variable h_3_23b_p "3.23b more than $10,000?"
capture label variable h_3_23b_d "3.23b more than $140,000 pesos?"
capture label variable h_3_23b_c "3.23b more than 75,000 CUP?"
capture label variable h_3_23c_p "3.23c more than $100,000?"
capture label variable h_3_23c_d "3.23c more than $1,400,000 pesos?"
capture label variable h_3_23c_c "3.23c more than 550,000 CUP?"

* 3.24-3.26 Financial accounts
capture label variable h_3_24 "3.24 Do you (and/or your spouse or other older adult in this house) have checking accounts, savings, fixed-term investments, loans made to others, stocks, bonds, etc.?"
capture label variable h_3_25_p "3.25 Adding all accounts together, what is their total value? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_25_d "3.25 Adding all accounts together, what is their total value? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_25_c "3.25 Adding all accounts together, what is their total value? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_26a_p "3.26a more than $5,000?"
capture label variable h_3_26a_d "3.26a more than $70,000 pesos?"
capture label variable h_3_26a_c "3.26a more than 150,000 CUP?"
capture label variable h_3_26b_p "3.26b more than $2,500?"
capture label variable h_3_26b_d "3.26b more than $32,000 pesos?"
capture label variable h_3_26b_c "3.26b more than 75,000 CUP?"
capture label variable h_3_26c_p "3.26c more than $18,000?"
capture label variable h_3_26c_d "3.26c more than $240,000 pesos?"
capture label variable h_3_26c_c "3.26c more than 550,000 CUP?"

* 3.27-3.28 Other assets
capture label variable h_3_27_p "3.27 In case of a family emergency where you had to sell all other assets not mentioned, how much would you get? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_27_d "3.27 In case of a family emergency where you had to sell all other assets not mentioned, how much would you get? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_27_c "3.27 In case of a family emergency where you had to sell all other assets not mentioned, how much would you get? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_28a_p "3.28a more than $36,000?"
capture label variable h_3_28a_d "3.28a more than $500,000 pesos?"
capture label variable h_3_28a_c "3.28a more than 1,110,000 CUP?"
capture label variable h_3_28b_p "3.28b more than $18,500?"
capture label variable h_3_28b_d "3.28b more than $250,000 pesos?"
capture label variable h_3_28b_c "3.28b more than 550,000 CUP?"
capture label variable h_3_28c_p "3.28c more than $100,000?"
capture label variable h_3_28c_d "3.28c more than $1,400,000 pesos?"
capture label variable h_3_28c_c "3.28c more than 3,000,000 CUP?"

* 3.29-3.31 Debts
capture label variable h_3_29 "3.29 Do you (and/or your spouse or other older adult in this house) have debts we haven't asked about, such as credit cards, medical debts, life insurance loans, loans from relatives, etc.?"
capture label variable h_3_30_p "3.30 Taking all of these together, how much do you owe? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_30_d "3.30 Taking all of these together, how much do you owe? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_30_c "3.30 Taking all of these together, how much do you owe? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_31a_p "3.31a more than $5,000?"
capture label variable h_3_31a_d "3.31a more than $70,000 pesos?"
capture label variable h_3_31a_c "3.31a more than 150,000 CUP?"
capture label variable h_3_31b_p "3.31b more than $2,500?"
capture label variable h_3_31b_d "3.31b more than $32,000 pesos?"
capture label variable h_3_31b_c "3.31b more than 75,000 CUP?"
capture label variable h_3_31c_p "3.31c more than $18,000?"
capture label variable h_3_31c_d "3.31c more than $240,000 pesos?"
capture label variable h_3_31c_c "3.31c more than 550,000 CUP?"

* 3.32-3.34 Household expenditure
capture label variable h_3_32_p "3.32 In total, how much do you spend per month for the household? Exclude home-produced goods for self-consumption. $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_32_d "3.32 In total, how much do you spend per month for the household? Exclude home-produced goods for self-consumption. pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_32_c "3.32 In total, how much do you spend per month for the household? Exclude home-produced goods for self-consumption. CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_3_33a_p "3.33a more than $1,600?"
capture label variable h_3_33a_d "3.33a more than $20,000 pesos?"
capture label variable h_3_33a_c "3.33a more than 47,500 CUP?"
capture label variable h_3_33b_p "3.33b more than $800?"
capture label variable h_3_33b_d "3.33b more than $11,000 pesos?"
capture label variable h_3_33b_c "3.33b more than 25,000 CUP?"
capture label variable h_3_33c_p "3.33c more than $2,400?"
capture label variable h_3_33c_d "3.33c more than $32,000 pesos?"
capture label variable h_3_33c_c "3.33c more than 75,000 CUP?"
capture label variable h_3_34 "3.34 Do you or anyone else in the household make clothes, raise animals, or harvest food to be consumed in the household?"

* Section 4: Participant Income
capture label variable h_4 "4. Record the Code for the Participant whose income you are asking about in this section:"
capture label variable h_4_1 "4.1 Do you receive any income from paid work?"
capture label variable h_4_1a "4.1.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_1b_p "4.1.B more than $1,600?"
capture label variable h_4_1b_d "4.1.B more than $20,000 pesos?"
capture label variable h_4_1b_c "4.1.B more than 47,500 CUP?"
capture label variable h_4_1b2_p "4.1.B.2 more than $400 per month?"
capture label variable h_4_1b2_d "4.1.B.2 more than $5,000 pesos?"
capture label variable h_4_1b2_c "4.1.B.2 more than 12,500 CUP?"
capture label variable h_4_1b3_p "4.1.B.3 more than $3,000?"
capture label variable h_4_1b3_d "4.1.B.3 more than $40,000 pesos?"
capture label variable h_4_1b3_c "4.1.B.3 more than 90,000 CUP?"

capture label variable h_4_2 "4.2 Do you receive any government pension?"
capture label variable h_4_2a "4.2.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_2b_p "4.2.B more than $400?"
capture label variable h_4_2b_d "4.2.B more than $5,000 pesos?"
capture label variable h_4_2b_c "4.2.B more than 12,000 CUP?"
capture label variable h_4_2b2_p "4.2.B.2 more than $200?"
capture label variable h_4_2b2_d "4.2.B.2 more than $2,500 pesos?"
capture label variable h_4_2b2_c "4.2.B.2 more than 6,250 CUP?"
capture label variable h_4_2b3_p "4.2.B.3 more than $1,400?"
capture label variable h_4_2b3_d "4.2.B.3 more than $20,000 pesos?"
capture label variable h_4_2b3_c "4.2.B.3 more than 42,500 CUP?"

capture label variable h_4_3 "4.3 Do you receive any occupational pension?"
capture label variable h_4_3a "4.3.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_3b_p "4.3.B more than $400?"
capture label variable h_4_3b_d "4.3.B more than $5,000 pesos?"
capture label variable h_4_3b_c "4.3.B more than 12,000 CUP?"
capture label variable h_4_3b2_p "4.3.B.2 more than $200?"
capture label variable h_4_3b2_d "4.3.B.2 more than $2,500 pesos?"
capture label variable h_4_3b2_c "4.3.B.2 more than 6,250 CUP?"
capture label variable h_4_3b3_p "4.3.B.3 more than $1,400?"
capture label variable h_4_3b3_d "4.3.B.3 more than $20,000 pesos?"
capture label variable h_4_3b3_c "4.3.B.3 more than 42,500 CUP?"

capture label variable h_4_4 "4.4 Do you receive any disability pension or benefit?"
capture label variable h_4_4a "4.4.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_4b_p "4.4B more than $400?"
capture label variable h_4_4b_d "4.4.B more than $5,000 pesos?"
capture label variable h_4_4b_c "4.4.B more than 12,000 CUP?"
capture label variable h_4_4b2_p "4.4.B.2 more than $200?"
capture label variable h_4_4b2_d "4.4.B.2 more than $2,500 pesos?"
capture label variable h_4_4b2_c "4.4.B.2 more than 6,250 CUP?"
capture label variable h_4_4b3_p "4.4.B.3 more than $1,400?"
capture label variable h_4_4b3_d "4.4.B.3 more than $20,000 pesos?"
capture label variable h_4_4b3_c "4.4.B.3 more than 42,500 CUP?"

capture label variable h_4_5 "4.5 Do you receive any income from rented land or property?"
capture label variable h_4_5a "4.5.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_5b_p "4.5.B more than $1,200?"
capture label variable h_4_5b_d "4.5.B more than $15,000 pesos?"
capture label variable h_4_5b_c "4.5.B more than 35,000 CUP?"
capture label variable h_4_5b2_p "4.5.B.2 more than $400?"
capture label variable h_4_5b2_d "4.5.B.2 more than $5,000 pesos?"
capture label variable h_4_5b2_c "4.5.B.2 more than 12,500 CUP?"
capture label variable h_4_5b3_p "4.5.B.3 more than $3,600?"
capture label variable h_4_5b3_d "4.5.B.3 more than $50,000 pesos?"
capture label variable h_4_5b3_c "4.5.B.3 more than 110,000 CUP?"

capture label variable h_4_6 "4.6 Do you receive any profit from another business (income minus expenses)?"
capture label variable h_4_6a "4.6.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_6b_p "4.6.B more than $4,000?"
capture label variable h_4_6b_d "4.6.B more than $50,000 pesos?"
capture label variable h_4_6b_c "4.6.B more than 120,000 CUP?"
capture label variable h_4_6b2_p "4.6.B.2 more than $1,600?"
capture label variable h_4_6b2_d "4.6.B.2 more than $20,000 pesos?"
capture label variable h_4_6b2_c "4.6.B.2 more than 47,500 CUP?"
capture label variable h_4_6b3_p "4.6.B.3 more than $12,000?"
capture label variable h_4_6b3_d "4.6.B.3 more than $150,000 pesos?"
capture label variable h_4_6b3_c "4.6.B.3 more than 350,000 CUP?"

capture label variable h_4_7 "4.7 Do you receive money regularly from your grandchildren or children?"
capture label variable h_4_7a "4.7.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_7b_p "4.7.B more than $50?"
capture label variable h_4_7b_d "4.7.B more than $700 pesos?"
capture label variable h_4_7b_c "4.7.B more than 1,250 CUP?"
capture label variable h_4_7b2_p "4.7.B.2 more than $100?"
capture label variable h_4_7b2_d "4.7.B.2 more than $1,500 pesos?"
capture label variable h_4_7b2_c "4.7.B.2 more than 2,500 CUP?"

capture label variable h_4_8 "4.8 Do you receive other regular income?"
capture label variable h_4_8a "4.8.A How much do you receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_4_8b_p "4.8.B more than $50?"
capture label variable h_4_8b_d "4.8.B more than $700 pesos?"
capture label variable h_4_8b_c "4.8.B more than 1,250 CUP?"
capture label variable h_4_8b2_p "4.8.B.2 more than $100?"
capture label variable h_4_8b2_d "4.8.B.2 more than $1,500 pesos?"
capture label variable h_4_8b2_c "4.8.B.2 more than 2,500 CUP?"

* Section 5: Spouse/Other Participant Income
capture label variable h_5 "5. Does the participant have a co-resident spouse/partner, or are there other Participants in the household?"
capture label variable h_5_1 "5.1 Do they receive any income from paid work?"
capture label variable h_5_1a "5.1.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_1b_p "5.1.B more than $1,600?"
capture label variable h_5_1b_d "5.1.B more than $20,000 pesos?"
capture label variable h_5_1b_c "5.1.B more than 47,500 CUP?"
capture label variable h_5_1b2_p "5.1.B.2 more than $400 per month?"
capture label variable h_5_1b2_d "5.1.B.2 more than $5,000 pesos?"
capture label variable h_5_1b2_c "5.1.B.2 more than 12,500 CUP?"
capture label variable h_5_1b3_p "5.1.B.3 more than $3,000?"
capture label variable h_5_1b3_d "5.1.B.3 more than $40,000 pesos?"
capture label variable h_5_1b3_c "5.1.B.3 more than 90,000 CUP?"

capture label variable h_5_2 "5.2 Do they receive any government pension?"
capture label variable h_5_2a "5.2.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_2b_p "5.2.B more than $400?"
capture label variable h_5_2b_d "5.2.B more than $5,000 pesos?"
capture label variable h_5_2b_c "5.2.B more than 12,000 CUP?"
capture label variable h_5_2b2_p "5.2.B.2 more than $200?"
capture label variable h_5_2b2_d "5.2.B.2 more than $2,500 pesos?"
capture label variable h_5_2b2_c "5.2.B.2 more than 6,250 CUP?"
capture label variable h_5_2b3_p "5.2.B.3 more than $1,400?"
capture label variable h_5_2b3_d "5.2.B.3 more than $20,000 pesos?"
capture label variable h_5_2b3_c "5.2.B.3 more than 42,500 CUP?"

capture label variable h_5_3 "5.3 Do they receive any occupational pension?"
capture label variable h_5_3a "5.3.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_3b_p "5.3.B more than $400?"
capture label variable h_5_3b_d "5.3.B more than $5,000 pesos?"
capture label variable h_5_3b_c "5.3.B more than 12,000 CUP?"
capture label variable h_5_3b2_p "5.3.B.2 more than $200?"
capture label variable h_5_3b2_d "5.3.B.2 more than $2,500 pesos?"
capture label variable h_5_3b2_c "5.3.B.2 more than 6,250 CUP?"
capture label variable h_5_3b3_p "5.3.B.3 more than $1,400?"
capture label variable h_5_3b3_d "5.3.B.3 more than $20,000 pesos?"
capture label variable h_5_3b3_c "5.3.B.3 more than 42,500 CUP?"

capture label variable h_5_4 "5.4 Do they receive any disability pension or benefit?"
capture label variable h_5_4a "5.4.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_4b_p "5.4B more than $400?"
capture label variable h_5_4b_d "5.4.B more than $5,000 pesos?"
capture label variable h_5_4b_c "5.4.B more than 12,000 CUP?"
capture label variable h_5_4b2_p "5.4.B.2 more than $200?"
capture label variable h_5_4b2_d "5.4.B.2 more than $2,500 pesos?"
capture label variable h_5_4b2_c "5.4.B.2 more than 6,250 CUP?"
capture label variable h_5_4b3_p "5.4.B.3 more than $1,400?"
capture label variable h_5_4b3_d "5.4.B.3 more than $20,000 pesos?"
capture label variable h_5_4b3_c "5.4.B.3 more than 42,500 CUP?"

capture label variable h_5_5 "5.5 Do they receive any income from rented land or property?"
capture label variable h_5_5a "5.5.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_5b_p "5.5.B more than $1,200?"
capture label variable h_5_5b_d "5.5.B more than $15,000 pesos?"
capture label variable h_5_5b_c "5.5.B more than 35,000 CUP?"
capture label variable h_5_5b2_p "5.5.B.2 more than $400?"
capture label variable h_5_5b2_d "5.5.B.2 more than $5,000 pesos?"
capture label variable h_5_5b2_c "5.5.B.2 more than 12,500 CUP?"
capture label variable h_5_5b3_p "5.5.B.3 more than $3,600?"
capture label variable h_5_5b3_d "5.5.B.3 more than $50,000 pesos?"
capture label variable h_5_5b3_c "5.5.B.3 more than 110,000 CUP?"

capture label variable h_5_6 "5.6 Do they receive any profit from another business (income minus expenses)?"
capture label variable h_5_6a "5.6.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_6b_p "5.6.B more than $4,000?"
capture label variable h_5_6b_d "5.6.B more than $50,000 pesos?"
capture label variable h_5_6b_c "5.6.B more than 120,000 CUP?"
capture label variable h_5_6b2_p "5.6.B.2 more than $1,600?"
capture label variable h_5_6b2_d "5.6.B.2 more than $20,000 pesos?"
capture label variable h_5_6b2_c "5.6.B.2 more than 47,500 CUP?"
capture label variable h_5_6b3_p "5.6.B.3 more than $12,000?"
capture label variable h_5_6b3_d "5.6.B.3 more than $150,000 pesos?"
capture label variable h_5_6b3_c "5.6.B.3 more than 350,000 CUP?"

capture label variable h_5_7 "5.7 Do they receive money regularly from their grandchildren or children?"
capture label variable h_5_7a "5.7.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_7b_p "5.7.B more than $50?"
capture label variable h_5_7b_d "5.7.B more than $700 pesos?"
capture label variable h_5_7b_c "5.7.B more than 1,250 CUP?"
capture label variable h_5_7b2_p "5.7.B.2 more than $100?"
capture label variable h_5_7b2_d "5.7.B.2 more than $1,500 pesos?"
capture label variable h_5_7b2_c "5.7.B.2 more than 2,500 CUP?"

capture label variable h_5_8 "5.8 Do they receive other regular income?"
capture label variable h_5_8a "5.8.A How much do they receive each month? NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_5_8b_p "5.8.B more than $50?"
capture label variable h_5_8b_d "5.8.B more than $700 pesos?"
capture label variable h_5_8b_c "5.8.B more than 1,250 CUP?"
capture label variable h_5_8b2_p "5.8.B.2 more than $100?"
capture label variable h_5_8b2_d "5.8.B.2 more than $1,500 pesos?"
capture label variable h_5_8b2_c "5.8.B.2 more than 2,500 CUP?"

* Section 6: Intergenerational Transfers
capture label variable h_6_1 "6.1 In the last year, has any participant or their spouse received help in money or goods from children and/or grandchildren not living in this household? (Does not include monthly help already mentioned)"
capture label variable h_6_1a_p "6.1a Approximately, how much was that help in the last year? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_1a_d "6.1a Approximately, how much was that help in the last year? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_1a_c "6.1a Approximately, how much was that help in the last year? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_1b1_p "6.1b1 more than $250?"
capture label variable h_6_1b1_d "6.1b1 more than 15,000 pesos?"
capture label variable h_6_1b1_c "6.1b1 more than 35,000 CUP?"
capture label variable h_6_1b2_p "6.1b2 more than $500?"
capture label variable h_6_1b2_d "6.1b2 more than 30,000 pesos?"
capture label variable h_6_1b2_c "6.1b2 more than 70,000 CUP?"

capture label variable h_6_2 "6.2 The help in money or goods that you receive from your children/daughter-in-law/son-in-law/grandchildren (and those of your spouse). Do you think it is..."
capture label variable h_6_3 "6.3 The help with household chores, care, errands and transportation that you receive from your children/daughter-in-law/son-in-law/grandchildren (and those of your spouse), do you think it is..."

capture label variable h_6_41_d "6.4.1 Do you (and/or spouse or other older adult) receive the solidarity card (to buy food in supermarkets)?"
capture label variable h_6_42_d "6.4.2 Do you (and/or spouse or other older adult) receive a bonus called gas-bonus?"
capture label variable h_6_43_d "6.4.3 Do you (and/or spouse or other older adult) receive a bonus called electricity-bonus?"
capture label variable h_6_44_p "6.4.4 Do you (and/or spouse or other older adult) receive the Bread Card (to buy food)?"

capture label variable h_6_5 "6.5 In the last year, have you (or your spouse or other older adult) given help in money or goods to your children and/or grandchildren?"
capture label variable h_6_5a_p "6.5a Approximately, how much was that help in the last year? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_5a_d "6.5a Approximately, how much was that help in the last year? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_5a_c "6.5a Approximately, how much was that help in the last year? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_5b1_p "6.5b1 more than $500?"
capture label variable h_6_5b1_d "6.5b1 more than $7,000 pesos?"
capture label variable h_6_5b1_c "6.5b1 more than 15,000 CUP?"
capture label variable h_6_5b2_p "6.5b2 more than $1,000?"
capture label variable h_6_5b2_d "6.5b2 more than $15,000 pesos?"
capture label variable h_6_5b2_c "6.5b2 more than 30,000 CUP?"

capture label variable h_6_6 "6.6 During the last year, did you (and/or your spouse or other older adult) give financial support to your parents (and/or your in-laws) who do not live in this household?"
capture label variable h_6_6a_p "6.6a Approximately, how much money was that support in the last year? $ NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_6a_d "6.6a Approximately, how much money was that support in the last year? pesos NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_6a_c "6.6a Approximately, how much money was that support in the last year? CUP NO RESPONSE=88 DON'T KNOW=99"
capture label variable h_6_6b1_p "6.6b1 more than $500?"
capture label variable h_6_6b1_d "6.6b1 more than $7,000 pesos?"
capture label variable h_6_6b1_c "6.6b1 more than 15,000 CUP?"
capture label variable h_6_6b2_p "6.6b2 more than $1,000?"
capture label variable h_6_6b2_d "6.6b2 more than $15,000 pesos?"
capture label variable h_6_6b2_c "6.6b2 more than 30,000 CUP?"

* Section 7: Dwelling Location/Characteristics
capture label variable h_7_1_p_c "7.1 This dwelling is..."
capture label variable h_7_1_d "7.1 This dwelling is..."
capture label variable h_7_2_1 "7.2.1 on a paved street?"
capture label variable h_7_2_2 "7.2.2 on a highway?"
capture label variable h_7_2_3 "7.2.3 on a path or trail?"
capture label variable h_7_2_4 "7.2.4 next to cultivated fields?"
capture label variable h_7_2_5 "7.2.5 Less than 500 meters (about three blocks) from a large avenue with more than two lanes?"
