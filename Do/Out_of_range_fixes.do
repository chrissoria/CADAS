clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}

if $country == 0 {
    cd "`path'/PR_out"
    local country_folder "translation_PR"
}
else if $country == 1 {
    cd "`path'/DR_out"
    local country_folder "translation_DR"
}
else if $country == 2 {
    cd "`path'/CUBA_out"
    local country_folder "translation_CUBA"
}

* Set translation folder path based on language
if `"$language"' == "E" {
    local trans_folder "`country_folder'/"
}
else {
    local trans_folder ""
}
 
use `trans_folder'Socio

*replace 88 and 99 with .n (no response) and .d (don't know)
replace s_2_3 = .d if s_2_3 == 999
replace s_2_8c = .n if s_2_8c == 88
replace s_2_8c = .d if s_2_8c == 99
replace s_2_10 = .n if s_2_10 == 88
replace s_2_10 = .d if s_2_10 == 99
replace s_3_18 = .n if s_3_18 == 888
replace s_3_18 = .d if s_3_18 == 999
replace s_4_3 = .n if s_4_3 == 888
replace s_4_3 = .d if s_4_3 == 999
replace s_4_6 = .n if s_4_6 == 888
replace s_4_6 = .d if s_4_6 == 999
replace s_4_7 = .n if s_4_7 == 888
replace s_4_7 = .d if s_4_7 == 999
replace s_4_13 = .n if s_4_13 == 888
replace s_4_13 = .d if s_4_13 == 999
replace s_4_16 = .n if s_4_16 == 888
replace s_4_16 = .d if s_4_16 == 999
replace s_4_17 = .n if s_4_17 == 888
replace s_4_17 = .d if s_4_17 == 999
replace s_4_20 = .n if s_4_20 == 88
replace s_4_20 = .d if s_4_20 == 99
replace s_4_23_1 = .n if s_4_23_1 == 88
replace s_4_23_1 = .d if s_4_23_1 == 99
replace s_4_27_1 = .n if s_4_27_1 == 88
replace s_4_27_1 = .d if s_4_27_1 == 99
replace s_4_29_1 = .n if s_4_29_1 == 88
replace s_4_29_1 = .d if s_4_29_1 == 99
replace s_5_3 = .n if s_5_3 == 88
replace s_5_3 = .d if s_5_3 == 99
replace s_6_2 = .n if s_6_2 == 88
replace s_6_2 = .d if s_6_2 == 99
replace s_6_4 = .n if s_6_4 == 88
replace s_6_4 = .d if s_6_4 == 99
replace s_6_6 = .n if s_6_6 == 888
replace s_6_6 = .d if s_6_6 == 999
replace s_8_2 = .n if s_8_2 == 888
replace s_8_2 = .d if s_8_2 == 999
replace s_8_5c = .n if s_8_5c == 88
replace s_8_5c = .d if s_8_5c == 99
replace s_8_8 = .n if s_8_8 == 8
replace s_8_8 = .d if s_8_8 == 9
replace s_8_9 = .n if s_8_9 == 8
replace s_8_9 = .d if s_8_9 == 9
replace s_9_6 = .n if s_9_6 == 888
replace s_9_6 = .d if s_9_6 == 999
replace s_9_9 = .n if s_9_9 == 888
replace s_9_9 = .d if s_9_9 == 999
replace s_9_22 = .n if s_9_22 == 888
replace s_9_22 = .d if s_9_22 == 999
replace s_9_25 = .n if s_9_25 == 888
replace s_9_25 = .d if s_9_25 == 999
replace s_9_31 = .n if s_9_31 == 888
replace s_9_31 = .d if s_9_31 == 999
replace s_9_36 = .n if s_9_36 == 888
replace s_9_36 = .d if s_9_36 == 999
replace s_9_43a = .n if s_9_43a == 888
replace s_9_43a = .d if s_9_43a == 999
replace s_9_45a = .n if s_9_45a == 888
replace s_9_45a = .d if s_9_45a == 999
replace s_9_48 = .n if s_9_48 == 888
replace s_9_48 = .d if s_9_48 == 999
replace s_9_57 = .n if s_9_57 == 88
replace s_9_57 = .d if s_9_57 == 99
replace s_9_59 = .n if s_9_59 == 88
replace s_9_59 = .d if s_9_59 == 99
replace s_9_60 = .n if s_9_60 == 888
replace s_9_60 = .d if s_9_60 == 999
replace s_9_61 = .n if s_9_61 == 88
replace s_9_61 = .d if s_9_61 == 99
replace s_9_65 = .n if s_9_65 == 88
replace s_9_65 = .d if s_9_65 == 99
replace s_13_2 = .n if s_13_2 == 88
replace s_13_2 = .d if s_13_2 == 99 | s_13_2 == 999
replace s_13_4 = .n if s_13_4 == 888
replace s_13_4 = .d if s_13_4 == 999
replace s_13_6_d = .n if s_13_6_d == 88
replace s_13_6_d = .d if s_13_6_d == 99
replace s_13_6_p_c = .n if s_13_6_p_c == 88
replace s_13_6_p_c = .d if s_13_6_p_c == 99
replace s_13_7_d = .n if s_13_7_d == 88
replace s_13_7_d = .d if s_13_7_d == 99
replace s_13_7_p_c = .n if s_13_7_p_c == 88
replace s_13_7_p_c = .d if s_13_7_p_c == 99
replace s_13_10 = .n if s_13_10 == 88
replace s_13_10 = .d if s_13_10 == 99
replace s_13_11 = .n if s_13_11 == 88
replace s_13_11 = .d if s_13_11 == 99
replace s_13_20 = .n if s_13_20 == 88
replace s_13_20 = .d if s_13_20 == 99
replace s_13_23_p = .n if s_13_23_p == 888
replace s_13_23_p = .d if s_13_23_p == 999
replace s_13_23_d_c = .n if s_13_23_d_c == 888
replace s_13_23_d_c = .d if s_13_23_d_c == 999
replace s_13_24 = .n if s_13_24 == 88
replace s_13_24 = .d if s_13_24 == 99
replace s_13_25_p = .n if s_13_25_p == 888
replace s_13_25_p = .d if s_13_25_p == 999
replace s_13_25_d_c = .n if s_13_25_d_c == 888
replace s_13_25_d_c = .d if s_13_25_d_c == 999
replace s_13_26 = .n if s_13_26 == 88
replace s_13_26 = .d if s_13_26 == 99
replace s_13_27_p = .n if s_13_27_p == 888
replace s_13_27_p = .d if s_13_27_p == 999
replace s_13_27_d_c = .n if s_13_27_d_c == 888
replace s_13_27_d_c = .d if s_13_27_d_c == 999
replace s_13_28 = .n if s_13_28 == 88
replace s_13_28 = .d if s_13_28 == 99
replace s_13_29 = .n if s_13_29 == 88
replace s_13_29 = .d if s_13_29 == 99
replace s_14_4 = .n if s_14_4 == 88
replace s_14_4 = .d if s_14_4 == 99
replace s_14_5 = .n if s_14_5 == 88
replace s_14_5 = .d if s_14_5 == 99
replace s_14_6 = .n if s_14_6 == 88
replace s_14_6 = .d if s_14_6 == 99
replace s_14_8 = .n if s_14_8 == 88
replace s_14_8 = .d if s_14_8 == 99
replace s_14_9 = .n if s_14_9 == 88
replace s_14_9 = .d if s_14_9 == 99
replace s_14_11 = .n if s_14_11 == 88
replace s_14_11 = .d if s_14_11 == 99
replace s_14_12 = .n if s_14_12 == 88
replace s_14_12 = .d if s_14_12 == 99
replace s_14_13 = .n if s_14_13 == 88
replace s_14_13 = .d if s_14_13 == 99
replace s_14_14 = .n if s_14_14 == 88
replace s_14_14 = .d if s_14_14 == 99
replace s_14_15 = .n if s_14_15 == 88
replace s_14_15 = .d if s_14_15 == 99
replace s_14_16 = .n if s_14_16 == 88
replace s_14_16 = .d if s_14_16 == 99
replace s_14_20 = .n if s_14_20 == 88
replace s_14_20 = .d if s_14_20 == 99
replace s_14_22 = .n if s_14_22 == 88
replace s_14_22 = .d if s_14_22 == 99
replace s_14_24 = .n if s_14_24 == 88
replace s_14_24 = .d if s_14_24 == 99
replace s_14_25 = .n if s_14_25 == 88
replace s_14_25 = .d if s_14_25 == 99
replace s_14_30a = .n if s_14_30a == 88
replace s_14_30a = .d if s_14_30a == 99



*age
replace s_2_3 = .r if (s_2_3 > 110 & s_2_3 < .) | s_2_3 < 65
*years of education
replace s_2_8c = .r if (s_2_8c > 20 & s_2_8c < .) | s_2_8c < 0
*number of children fathered/given birth to
replace s_2_10 = .r if (s_2_10 > 10 & s_2_10 < .) | s_2_10 < 0
*years lived in this city/town/district
replace s_3_0 = .r if (s_3_0 > s_2_3 & s_3_0 < .) | s_3_0 < 0
*age during last natural disaster
replace s_3_18 = .r if (s_3_18 > s_2_3 & s_3_18 < .) | s_3_18 < 0
*time displaced from natural disaster
replace s_3_19_1 = .r if (s_3_19_1 > s_2_3 & s_3_19_1 < .) | s_3_19_1 < 0
*age of mother (if alive)
replace s_4_3 = .r if (s_4_3 > 120 & s_4_3 < .) | s_4_3 < (s_2_3 + 10)
*age of mother at death
replace s_4_6 = .r if (s_4_6 > 120 & s_4_6 < .) | s_4_6 < 0
*age of partic when mother died
replace s_4_7 = .r if (s_4_7 > s_2_3 & s_4_7 < .) | s_4_7 < 0
*age of father (if alive)
replace s_4_13 = .r if (s_4_13 > 120 & s_4_13 < .) | s_4_13 < (s_2_3 + 10)
*age of father at death
replace s_4_16 = .r if (s_4_16 > 120 & s_4_16 < .) | s_4_16 < 0
*age of partic when father died
replace s_4_17 = .r if (s_4_17 > s_2_3 & s_4_17 < .) | s_4_17 < 0
*number of living siblings
replace s_4_20 = .r if (s_4_20 > 10 & s_4_20 < .) | s_4_20 < 0
*number of hours spent helping people
//return here!! replace s_4_23_1 = .r if (s_4_23_1 > 50 & s_4_23_1 < .) | s_4_23_1 < 0
*hours spent helping children/grandchildren etc
//return here!! replace s_4_27_1 = .r if (s_4_27_1 > 50 & s_4_27_1 < .) | s_4_27_1 < 0
*hours spent getting help
replace s_4_29_1 = .r if (s_4_29_1 > 50 & s_4_29_1 < .) | s_4_29_1 < 0
*time since 18yo with financial hardship
replace s_5_3 = .r if (s_5_3 > (s_2_3 - 18) & s_5_3 < .) | s_5_3 < 0
*years spent in US
replace s_6_2 = .r if (s_6_2 > s_2_3 & s_6_2 < .) | s_6_2 < 0
*years spent foreign countries other than US
replace s_6_4 = .r if (s_6_4 > s_2_3 & s_6_4 < .) | s_6_4 < 0
*age when returning from last work/live abroad
replace s_6_6 = .r if (s_6_6 > s_2_3 & s_6_6 < .) | s_6_6 < 0
*years working for payment/profit
replace s_8_2 = .r if (s_8_2 > s_2_3 & s_8_2 < .) | s_8_2 < 0
*years since leaving last job
replace s_8_5c = .r if (s_8_5c > 80 & s_8_5c < .) | s_8_5c < 0
*number of nightshifts per week
replace s_8_8 = .r if (s_8_8 > 7 & s_8_8 < .) | s_8_8 < 0
*number of years working nightshift jobs
replace s_8_9 = .r if (s_8_9 > s_2_3 & s_8_9 < .) | s_8_9 < 0
*age when first told had asthma
replace s_9_6 = .r if (s_9_6 > s_2_3 & s_9_6 < .) | s_9_6 < 0
*age when first told had hypertension
replace s_9_9 = .r if (s_9_9 > s_2_3 & s_9_9 < .) | s_9_9 < 0
*how long loss of consciousness from head injury
replace s_9_21a = .r if (s_9_21a > 1000 & s_9_21a < .) | s_9_21a < 0
*age during loss of consciousness from head injury
replace s_9_22 = .r if (s_9_22 > s_2_3 & s_9_22 < .) | s_9_22 < 0
*age when first told had diabetes
replace s_9_25 = .r if (s_9_25 > s_2_3 & s_9_25 < .) | s_9_25 < 0
*age when first told had high cholesterol
replace s_9_31 = .r if (s_9_31 > s_2_3 & s_9_31 < .) | s_9_31 < 0
*number of times fallen in last year for no reason
replace s_9_36 = .r if (s_9_36 > 20 & s_9_36 < .) | s_9_36 < 0
*age when first told had parkinson's
replace s_9_43a = .r if (s_9_43a > s_2_3 & s_9_43a < .) | s_9_43a < 0
*age when first told had dementia/alzheimers
replace s_9_45a = .r if (s_9_45a > s_2_3 & s_9_45a < .) | s_9_45a < 0
*age first time depression lasting >= 2weeks
replace s_9_48 = .r if (s_9_48 > s_2_3 & s_9_48 < .) | s_9_48 < 0
*age first menstruation/period
replace s_9_57 = .r if (s_9_57 > 25 & s_9_57 < .) | s_9_57 < 9
*age first time giving birth
replace s_9_59 = .r if (s_9_59 > 65 & s_9_59 < .) | s_9_59 < 10
*number of times giving birth
replace s_9_60 = .r if (s_9_60 > 15 & s_9_60 < .) | s_9_60 < 0
*age at last period (menopause)
replace s_9_61 = .r if (s_9_61 > 65 & s_9_61 < . & s_9_61 ~= 97) | s_9_61 < 35
*age first time using contraceptive/sterilized
replace s_9_65 = .r if (s_9_65 > s_2_3 & s_9_65 < .) | s_9_65 < 10
*age started smoking
replace s_13_2 = .r if (s_13_2 > s_2_3 & s_13_2 < .) | s_13_2 < 5
*age quit smoking
replace s_13_4 = .r if (s_13_4 > s_2_3 & s_13_4 < .) | s_13_4 < s_13_2
*how many cigarettes normally smoke PER DAY
replace s_13_6_d = .r if (s_13_6_d > 87 & s_13_6_d < .) | s_13_6_d < 0
*how many cigarettes normally smoke PER DAY
replace s_13_6_p_c = .r if (s_13_6_p_c > 87 & s_13_6_p_c < .) | s_13_6_p_c < 0
*how many cigarettes smoked PER DAY when they were smoking the most
replace s_13_7_d = .r if (s_13_7_d > 87 & s_13_7_d < .) | s_13_7_d < s_13_6_d
*how many cigarettes smoked PER DAY when they were smoking the most
replace s_13_7_p_c = .r if (s_13_7_p_c > 87 & s_13_7_p_c < .) | s_13_7_p_c < s_13_6_p_c
*how many alcoholic beverages per week
replace s_13_10 = .r if (s_13_10 > 112 & s_13_10 < .) | s_13_10 < 0
*how many alcoholic beverages per week when they were drinking the most
replace s_13_11 = .r if (s_13_11 > 112 & s_13_11 < .) | s_13_11 < s_13_10
*how many walks >0.5km in last month
replace s_13_20 = .r if (s_13_20 > 200 & s_13_20 < .) | s_13_20 < 0
*current weight
replace s_13_23_p = .r if (s_13_23_p > 300 & s_13_23_p < .) | s_13_23_p < 30 //return here!
replace s_13_23_d_c = .r if (s_13_23_d_c > 300 & s_13_23_d_c < .) | s_13_23_d_c < 30 //return here!
*which body type they look like?
replace s_13_24 = .r if (s_13_24 > 9 & s_13_24 < .) | s_13_24 < 0
*weight at age 25
replace s_13_25_p = .r if (s_13_25_p > 300 & s_13_25_p < .) | s_13_25_p < 60
replace s_13_25_d_c = .r if (s_13_25_d_c > 150 & s_13_25_d_c < .) | s_13_25_d_c < 30
*which body type they looked like at age 25?
replace s_13_26 = .r if (s_13_26 > 9 & s_13_26 < .) | s_13_26 < 0
*max weight during lifetime
replace s_13_27_p = .r if (s_13_27_p > 350 & s_13_27_p < .) | s_13_27_p < s_13_23_p | s_13_27_p < s_13_25_p
replace s_13_27_d_c = .r if (s_13_27_d_c > 150 & s_13_27_d_c < .) | s_13_27_d_c < s_13_23_d_c | s_13_27_d_c < s_13_25_p
*body type they looked like at heaviest
replace s_13_28 = .r if (s_13_28 > 9 & s_13_28 < .) | s_13_28 < s_13_24 | s_13_28 < s_13_26
*age at max weight
replace s_13_29 = .r if (s_13_29 > s_2_3 & s_13_29 < .) | s_13_29 < 10
*total consults with doctor in last 3 months
replace s_14_4 = .r if (s_14_4 > 30 & s_14_4 < .) | s_14_4 < 0
*time spent traveling to doctor each trip (minutes)
replace s_14_5 = .r if (s_14_5 > 120 & s_14_5 < .) | s_14_5 < 0
*money spent traveling to doctor each trip
replace s_14_6 = .r if (s_14_6 > 10000 & s_14_6 < .) | s_14_6 < 0
*time spent waiting for consult (minutes)
replace s_14_8 = .r if (s_14_8 > 120 & s_14_8 < .) | s_14_8 < 0
*money spent at doctor each consult
replace s_14_9 = .r if (s_14_9 > 10000 & s_14_9 < .) | s_14_9 < 0
*number of visits to doctor in last year
replace s_14_11 = .r if (s_14_11 > 100 & s_14_11 < .) | s_14_11 < s_14_4
*total money spent at doctor in last year
replace s_14_12 = .r if (s_14_12 > 1000000 & s_14_12 < .) | s_14_12 < s_14_9
*surgical procedures that needed to be done without getting admitted to hospital in last year
replace s_14_13 = .r if (s_14_13 > 30 & s_14_13 < .) | s_14_13 < 0
*total paid for all consultations (except those included in 14_12)
replace s_14_14 = .r if (s_14_14 > 100000 & s_14_14 < .) | s_14_14 < 0
*visits to dentist in last year
replace s_14_15 = .r if (s_14_15 > 30 & s_14_15 < .) | s_14_15 < 0
*money paid for dental visits in last year
replace s_14_16 = .r if (s_14_16 > 100000 & s_14_16 < .) | s_14_16 < 0
*total nights spent in hospital in last year
replace s_14_20 = .r if (s_14_20 > 365 & s_14_20 < .) | s_14_20 < 0
*total paid for overnight hospital stays in last year
replace s_14_22 = .r if (s_14_22 > 1000000 & s_14_22 < .) | s_14_22 < 0
*total nights spent in other recovery/sick facilities in last year
replace s_14_24 = .r if (s_14_24 > 365 & s_14_24 < .) | s_14_24 < 0
*total paid for nights spent in other recovery/sick facilities in last year
replace s_14_25 = .r if (s_14_25 > 1000000 & s_14_25 < .) | s_14_25 < 0
*total paid for medications in last month
replace s_14_30a = .r if (s_14_30a > 10000 & s_14_30a < .) | s_14_30a < 0

save `trans_folder'Socio.dta, replace

use `trans_folder'Cog_Scoring

*replace 666 and 777 with .p (physical limitation) and .r (refuse)
replace cs_32 = .p if cs_32 == 666
replace cs_32 = .r if cs_32 == 777
replace cs_40 = .p if cs_40 == 666
replace cs_40 = .r if cs_40 == 777
replace cs_41 = .p if cs_41 == 666
replace cs_41 = .r if cs_41 == 777
replace cs_43 = .p if cs_43 == 666
replace cs_43 = .r if cs_43 == 777
replace cs_44 = .p if cs_44 == 666
replace cs_44 = .r if cs_44 == 777
replace cs_72_1 = .p if cs_72_1 == 666
replace cs_72_1 = .r if cs_72_1 == 777
replace cs_72_2 = .p if cs_72_2 == 666
replace cs_72_2 = .r if cs_72_2 == 777
replace cs_72_3 = .p if cs_72_3 == 666
replace cs_72_3 = .r if cs_72_3 == 777
replace cs_72_4 = .p if cs_72_4 == 666
replace cs_72_4 = .r if cs_72_4 == 777
replace cs_79_1 = .p if cs_79_1 == 666
replace cs_79_1 = .r if cs_79_1 == 777
replace cs_79_2 = .p if cs_79_2 == 666
replace cs_79_2 = .r if cs_79_2 == 777
replace cs_79_3 = .p if cs_79_3 == 666
replace cs_79_3 = .r if cs_79_3 == 777
replace cs_79_4 = .p if cs_79_4 == 666
replace cs_79_4 = .r if cs_79_4 == 777


*pent score
replace cs_32 = .r if cs_32 > 1 | cs_32 < 0
*unique animal names
replace cs_40 = .r if cs_40 > 40 | cs_40 < 0
*repeated animal names
replace cs_41 = .r if cs_41 > 40 | cs_41 < 0
*correct symbols cancelled (come back here to check max number)
replace cs_43 = .r if cs_43 > 50 | cs_43 < 0
*incorrect symbols cancelled (come back here to check max number)
replace cs_44 = .r if cs_44 > 60 | cs_44 < 0
*circle copy
replace cs_72_1 = .r if cs_72_1 > 2 | cs_72_1 < 0
*diamond copy
replace cs_72_2 = .r if cs_72_2 > 3 | cs_72_2 < 0
*rectangles copy
replace cs_72_3 = .r if cs_72_3 > 2 | cs_72_3 < 0
*cube copy
replace cs_72_4 = .r if cs_72_4 > 4 | cs_72_4 < 0
*circle recall
replace cs_79_1 = .r if cs_79_1 > 2 | cs_79_1 < 0
*diamond recall
replace cs_79_2 = .r if cs_79_2 > 3 | cs_79_2 < 0
*rectangles recall
replace cs_79_3 = .r if cs_79_3 > 2 | cs_79_3 < 0
*cube recall
replace cs_79_4 = .r if cs_79_4 > 4 | cs_79_4 < 0

save `trans_folder'Cog_Scoring.dta, replace

use `trans_folder'Phys

*replace 666 with .c (could not do it), 66 with .p (disability), 77 with .o (could not for other reason)
replace p_3_p = .c if p_3_p == 666
replace p_3_d_c = .c if p_3_d_c == 666
replace p_4_p = .c if p_4_p == 666
replace p_4_d_c = .c if p_4_d_c == 666
replace p_5_1_p = .c if p_5_1_p == 666
replace p_5_1_d_c = .c if p_5_1_d_c == 666
replace p_5_2_p = .c if p_5_2_p == 666
replace p_5_2_d_c = .c if p_5_2_d_c == 666
replace p_14_1 = .p if p_14_1 == 66
replace p_14_1 = .o if p_14_1 == 77
replace p_14_2 = .p if p_14_2 == 66
replace p_14_2 = .o if p_14_2 == 77
replace p_15_1_1 = .o if p_15_1_1 == 666
replace p_15_1_2 = .o if p_15_1_2 == 666
replace p_15_1_3 = .o if p_15_1_3 == 666
replace p_15_2_1 = .o if p_15_2_1 == 666
replace p_15_2_2 = .o if p_15_2_2 == 666
replace p_15_2_3 = .o if p_15_2_3 == 666
replace p_17_1 = .c if p_17_1 == 66
replace p_17_2 = .c if p_17_2 == 66
replace p_18_p = .c if p_18_p == 666.6
replace p_18_d_c = .c if p_18_d_c == 666.6
replace p_19_2 = .o if p_19_2 == 66


*systolic BP
replace p_2_2_1 = .r if (p_2_2_1 > 200 & p_2_2_1 < .) | p_2_2_1 < 80
*diastolic BP
replace p_2_2_2 = .r if (p_2_2_2 > 200 & p_2_2_2 < .) | p_2_2_2 < 50
*skull circumference
replace p_3_p = .r if (p_3_p > 25 & p_3_p < .) | p_3_p < 19
*skull circumference
replace p_3_d_c = .r if (p_3_d_c > 63 & p_3_d_c < .) | p_3_d_c < 49
*waist circumference
replace p_4_p = .r if (p_4_p > 50 & p_4_p < .) | p_4_p < 21
*waist circumference
replace p_4_d_c = .r if (p_4_d_c > 129 & p_4_d_c < .) | p_4_d_c < 56
*knee height
replace p_5_1_p = .r if (p_5_1_p > 23 & p_5_1_p < .) | p_5_1_p < 19
*knee height
replace p_5_1_d_c = .r if (p_5_1_d_c > 59 & p_5_1_d_c < .) | p_5_1_d_c < 49
*standing height
replace p_5_2_p = .r if (p_5_2_p > 74 & p_5_2_p < .) | p_5_2_p < 51
*standing height
replace p_5_2_d_c = .r if (p_5_2_d_c > 189 & p_5_2_d_c < .) | p_5_2_d_c < 131
*systolic BP
replace p_2_3_1 = .r if (p_2_3_1 > 200 & p_2_3_1 < .) | p_2_3_1 < 80
*diastolic BP
replace p_2_3_2 = .r if (p_2_3_2 > 200 & p_2_3_2 < .) | p_2_3_2 < 50
*number of steps to walk 5.5 yds
replace p_14_1 = .r if (p_14_1 > 80 & p_14_1 < .) | p_14_1 < 2
*time to walk 5.5 yds
replace p_14_2 = .r if (p_14_2 > 100 & p_14_2 < .) | p_14_2 < 0
*left hand grip strength (kg) try 1
replace p_15_1_1 = .r if (p_15_1_1 > 49 & p_15_1_1 < .) | p_15_1_1 < 6
*left hand grip strength (kg) try 2
replace p_15_1_2 = .r if (p_15_1_2 > 49 & p_15_1_2 < .) | p_15_1_2 < 6
*left hand grip strength (kg) try 3
replace p_15_1_3 = .r if (p_15_1_3 > 49 & p_15_1_3 < .) | p_15_1_3 < 6
*right hand grip strength (kg) try 1
replace p_15_2_1 = .r if (p_15_2_1 > 49 & p_15_2_1 < .) | p_15_2_1 < 6
*right hand grip strength (kg) try 2
replace p_15_2_2 = .r if (p_15_2_2 > 49 & p_15_2_2 < .) | p_15_2_2 < 6
*right hand grip strength (kg) try 3
replace p_15_2_3 = .r if (p_15_2_3 > 49 & p_15_2_3 < .) | p_15_2_3 < 6
*teeth on upper jaw
replace p_17_1 = .r if (p_17_1 > 20 & p_17_1 < .) | p_17_1 < 0
*teeth on lower jaw
replace p_17_2 = .r if (p_17_2 > 20 & p_17_2 < .) | p_17_2 < 0
*weight
replace p_18_p = .r if (p_18_p > 300 & p_18_p < .) | p_18_p < 30 // return here!!
*weight
replace p_18_d_c = .r if (p_18_d_c > 300 & p_18_d_c < .) | p_18_d_c < 30 // return here!!
*stand and sit repetitions in 30 seconds
replace p_19_2 = .r if (p_19_2 > 100 & p_19_2 < .) | p_19_2 < 0


save `trans_folder'Phys.dta, replace

clear all
