clear all 
set more off
capture log close
log using HouseholdMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Household.dta", clear
   


*response on line 6 did invalid skip on 3_3a_c, but answered 3_3b_c so my code marked 3_3c_c as invalid (valid because 3_3b_c was answered, but i can change if we want to)
*response on line 8 should not have answered 3_3a_c, but they did so it also let them answer 3_3c_c (which also should have been skipped because of their answer to 3_2_c)

*all cuba invalid

replace h_3_2_c = .i if (h_3_2_c == . | h_3_2_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_c = .i if (h_3_3a_c == . | h_3_3a_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i))

replace h_3_3b_c = .i if (h_3_3b_c == . | h_3_3b_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i) & (h_3_3a_c == 2 | h_3_3a_c == .i))

replace h_3_3c_c = .i if (h_3_3c_c == . | h_3_3c_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i) & (h_3_3a_c == 1 | h_3_3a_c == .i))

replace h_3_4_c = .i if (h_3_4_c == . | h_3_4_c == .a) & (h_country == 2 & h_3_1 ~= 2)

replace h_3_5a_c = .i if (h_3_5a_c == . | h_3_5a_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i))

replace h_3_5b_c = .i if (h_3_5b_c == . | h_3_5b_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i) & (h_3_5a_c == 2 | h_3_5a_c == .i))

replace h_3_5c_c = .i if (h_3_5c_c == . | h_3_5c_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i) & (h_3_5a_c == 1 | h_3_5a_c == .i))

replace h_3_6_c = .i if (h_3_6_c == . | h_3_6_c == .i) & (h_country == 2 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_c = .i if (h_3_7a_c == . | h_3_7a_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i))

replace h_3_7b_c = .i if (h_3_7b_c == . | h_3_7b_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i) & (h_3_7a_c == 2 | h_3_7a_c == .i))

replace h_3_7c_c = .i if (h_3_7c_c == . | h_3_7c_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i) & (h_3_7a_c == 1 | h_3_7a_c == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace s_3_13 = .i if (s_3_13 == . | s_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_c = .i if (h_3_16_c == . | h_3_16_c == .a) & (h_country == 2 & h_3_15 ~= 0)

replace h_3_17a_c = .i if (h_3_17a_c == . | h_3_17a_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i))

replace h_3_17b_c = .i if (h_3_17b_c == . | h_3_17b_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i) & (h_3_17a_c == 2 | h_3_17a_c == .i))

replace h_3_17c_c = .i if (h_3_17c_c == . | h_3_17c_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i) & (h_3_17a_c == 1 | h_3_17a_c == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 2

replace h_3_19_c = .i if (h_3_19_c == . | h_3_19_c == .a) & (h_country == 2 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_c = .i if (h_3_20a_c == . | h_3_20a_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i))

replace h_3_20b_c = .i if (h_3_20b_c == . | h_3_20b_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i) & (h_3_20a_c == 2 | h_3_20a_c == .i))

replace h_3_20c_c = .i if (h_3_20c_c == . | h_3_20c_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i) & (h_3_20a_c == 1 | h_3_20a_c == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_c = .i if (h_3_22_c == . | h_3_22_c == .a) & (h_country == 2 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_c = .i if (h_3_23a_c == . | h_3_23a_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i))

replace h_3_23b_c = .i if (h_3_23b_c == . | h_3_23b_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i) & (h_3_23a_c == 2 | h_3_23a_c == .i))

replace h_3_23c_c = .i if (h_3_23c_c == . | h_3_23c_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i) & (h_3_23a_c == 1 | h_3_23a_c == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_c = .i if (h_3_25_c == . | h_3_25_c == .a) & (h_country == 2 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_c = .i if (h_3_26a_c == . | h_3_26a_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i))

replace h_3_26b_c = .i if (h_3_26b_c == . | h_3_26b_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i) & (h_3_26a_c == 2 | h_3_26a_c == .i))

replace h_3_26c_c = .i if (h_3_26c_c == . | h_3_26c_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i) & (h_3_26a_c == 1 | h_3_26a_c == .i))

replace h_3_27_c = .i if (h_3_27_c == . | h_3_27_c == .a) & h_country == 2

replace h_3_28a_c = .i if (h_3_28a_c == . | h_3_28a_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i))

replace h_3_28b_c = .i if (h_3_28b_c == . | h_3_28b_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i) & (h_3_28a_c == 2 | h_3_28a_c == .i))

replace h_3_28c_c = .i if (h_3_28c_c == . | h_3_28c_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i) & (h_3_28a_c == 1 | h_3_28a_c == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_c = .i if (h_3_30_c == . | h_3_30_c == .a) & (h_country == 2 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_c = .i if (h_3_31a_c == . | h_3_31a_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i))

replace h_3_31b_c = .i if (h_3_31b_c == . | h_3_31b_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i) & (h_3_31a_c == 2 | h_3_31a_c == .i))

replace h_3_31c_c = .i if (h_3_31c_c == . | h_3_31c_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i) & (h_3_31a_c == 1 | h_3_31a_c == .i))

replace h_3_32_c = .i if (h_3_32_c == . | h_3_32_c == .a) & h_country == 2

replace h_3_33a_c = .i if (h_3_33a_c == . | h_3_33a_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i))

replace h_3_33b_c = .i if (h_3_33b_c == . | h_3_33b_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i) & (h_3_33a_c == 2 | h_3_33a_c == .i))

replace h_3_33c_c = .i if (h_3_33c_c == . | h_3_33c_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i) & (h_3_33a_c == 1 | h_3_33a_c == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_c = .i if (h_4_1b_c == . | h_4_1b_c == .a) & (h_country == 2 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_c = .i if (h_4_1b2_c == . | h_4_1b2_c == .a) & (h_country == 2 & (h_4_1b_c == 2 | h_4_1b_c == .i))

replace h_4_1b3_c = .i if (h_4_1b3_c == . | h_4_1b3_c == .a) & (h_country == 2 & (h_4_1b_c == 1 | h_4_1b_c == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_c = .i if (h_4_2b_c == . | h_4_2b_c == .a) & (h_country == 2 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_c = .i if (h_4_2b2_c == . | h_4_2b2_c == .a) & (h_country == 2 & (h_4_2b_c == 2 | h_4_2b_c == .i))

replace h_4_2b3_c = .i if (h_4_2b3_c == . | h_4_2b3_c == .a) & (h_country == 2 & (h_4_2b_c == 1 | h_4_2b_c == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_c = .i if (h_4_3b_c == . | h_4_3b_c == .a) & (h_country == 2 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_c = .i if (h_4_3b2_c == . | h_4_3b2_c == .a) & (h_country == 2 & (h_4_3b_c == 2 | h_4_3b_c == .i))

replace h_4_3b3_c = .i if (h_4_3b3_c == . | h_4_3b3_c == .a) & (h_country == 2 & (h_4_3b_c == 1 | h_4_3b_c == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_c = .i if (h_4_4b_c == . | h_4_4b_c == .a) & (h_country == 2 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_c = .i if (h_4_4b2_c == . | h_4_4b2_c == .a) & (h_country == 2 & (h_4_4b_c == 2 | h_4_4b_c == .i))

replace h_4_4b3_c = .i if (h_4_4b3_c == . | h_4_4b3_c == .a) & (h_country == 2 & (h_4_4b_c == 1 | h_4_4b_c == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_c = .i if (h_4_5b_c == . | h_4_5b_c == .a) & (h_country == 2 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_c = .i if (h_4_5b2_c == . | h_4_5b2_c == .a) & (h_country == 2 & (h_4_5b_c == 2 | h_4_5b_c == .i))

replace h_4_5b3_c = .i if (h_4_5b3_c == . | h_4_5b3_c == .a) & (h_country == 2 & (h_4_5b_c == 1 | h_4_5b_c == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_c = .i if (h_4_6b_c == . | h_4_6b_c == .a) & (h_country == 2 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_c = .i if (h_4_6b2_c == . | h_4_6b2_c == .a) & (h_country == 2 & (h_4_6b_c == 2 | h_4_6b_c == .i))

replace h_4_6b3_c = .i if (h_4_6b3_c == . | h_4_6b3_c == .a) & (h_country == 2 & (h_4_6b_c == 1 | h_4_6b_c == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_c = .i if (h_4_7b_c == . | h_4_7b_c == .a) & (h_country == 2 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_c = .i if (h_4_7b2_c == . | h_4_7b2_c == .a) & (h_country == 2 & (h_4_7b_c == 2 | h_4_7b_c == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_c = .i if (h_4_8b_c == . | h_4_8b_c == .a) & (h_country == 2 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_c = .i if (h_4_8b2_c == . | h_4_8b2_c == .a) & (h_country == 2 & (h_4_8b_c == 2 | h_4_8b_c == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_c = .i if (h_5_1b_c == . | h_5_1b_c == .a) & (h_country == 2 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_c = .i if (h_5_1b2_c == . | h_5_1b2_c == .a) & (h_country == 2 & (h_5_1b_c == 2 | h_5_1b_c == .i) & h_5 ~= 1)

replace h_5_1b3_c = .i if (h_5_1b3_c == . | h_5_1b3_c == .a) & (h_country == 2 & (h_5_1b_c == 1 | h_5_1b_c == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_c = .i if (h_5_2b_c == . | h_5_2b_c == .a) & (h_country == 2 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_c = .i if (h_5_2b2_c == . | h_5_2b2_c == .a) & (h_country == 2 & (h_5_2b_c == 2 | h_5_2b_c == .i) & h_5 ~= 1)

replace h_5_2b3_c = .i if (h_5_2b3_c == . | h_5_2b3_c == .a) & (h_country == 2 & (h_5_2b_c == 1 | h_5_2b_c == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_c = .i if (h_5_3b_c == . | h_5_3b_c == .a) & (h_country == 2 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_c = .i if (h_5_3b2_c == . | h_5_3b2_c == .a) & (h_country == 2 & (h_5_3b_c == 2 | h_5_3b_c == .i) & h_5 ~= 1)

replace h_5_3b3_c = .i if (h_5_3b3_c == . | h_5_3b3_c == .a) & (h_country == 2 & (h_5_3b_c == 1 | h_5_3b_c == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_c = .i if (h_5_4b_c == . | h_5_4b_c == .a) & (h_country == 2 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_c = .i if (h_5_4b2_c == . | h_5_4b2_c == .a) & (h_country == 2 & (h_5_4b_c == 2 | h_5_4b_c == .i) & h_5 ~= 1)

replace h_5_4b3_c = .i if (h_5_4b3_c == . | h_5_4b3_c == .a) & (h_country == 2 & (h_5_4b_c == 1 | h_5_4b_c == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_c = .i if (h_5_5b_c == . | h_5_5b_c == .a) & (h_country == 2 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_c = .i if (h_5_5b2_c == . | h_5_5b2_c == .a) & (h_country == 2 & (h_5_5b_c == 2 | h_5_5b_c == .i) & h_5 ~= 1)

replace h_5_5b3_c = .i if (h_5_5b3_c == . | h_5_5b3_c == .a) & (h_country == 2 & (h_5_5b_c == 1 | h_5_5b_c == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_c = .i if (h_5_6b_c == . | h_5_6b_c == .a) & (h_country == 2 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_c = .i if (h_5_6b2_c == . | h_5_6b2_c == .a) & (h_country == 2 & (h_5_6b_c == 2 | h_5_6b_c == .i) & h_5 ~= 1)

replace h_5_6b3_c = .i if (h_5_6b3_c == . | h_5_6b3_c == .a) & (h_country == 2 & (h_5_6b_c == 1 | h_5_6b_c == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_c = .i if (h_5_7b_c == . | h_5_7b_c == .a) & (h_country == 2 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_c = .i if (h_5_7b2_c == . | h_5_7b2_c == .a) & (h_country == 2 & (h_5_7b_c == 2 | h_5_7b_c == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_c = .i if (h_5_8b_c == . | h_5_8b_c == .a) & (h_country == 2 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_c = .i if (h_5_8b2_c == . | h_5_8b2_c == .a) & (h_country == 2 & (h_5_8b_c == 2 | h_5_8b_c == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_c = .i if (h_6_1a_c == . | h_6_1a_c == .a) & (h_country == 2 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_c = .i if (h_6_1b1_c == . | h_6_1b1_c == .a) & (h_country == 2 & (h_6_1a_c == 88 | h_6_1a_c == 99 | h_6_1a_c == .i))

replace h_6_1b2_c = .i if (h_6_1b2_c == . | h_6_1b2_c == .a) & (h_country == 2 & (h_6_1b1_c == 1 | h_6_1b1_c == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_c = .i if (h_6_5a_c == . | h_6_5a_c == .a) & (h_country == 2 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_c = .i if (h_6_5b1_c == . | h_6_5b1_c == .a) & (h_country == 2 & (h_6_5a_c == 88 | h_6_5a_c == 99 | h_6_5a_c == .i))

replace h_6_5b2_c = .i if (h_6_5b2_c == . | h_6_5b2_c == .a) & (h_country == 2 & (h_6_5b1_c == 1 | h_6_5b1_c == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_c = .i if (h_6_6a_c == . | h_6_6a_c == .a) & (h_country == 2 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_c = .i if (h_6_6b1_c == . | h_6_6b1_c == .a) & (h_country == 2 & (h_6_6a_c == 88 | h_6_6a_c == 99 | h_6_6a_c == .i))

replace h_6_6b2_c = .i if (h_6_6b2_c == . | h_6_6b2_c == .a) & (h_country == 2 & (h_6_6b1_c == 1 | h_6_6b1_c == .i))

replace h_7_1_p_c = .i if (h_7_1_p_c == . | h_7_1_p_c == .a) & (h_country == 0 | h_country == 2)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)




*all puerto rico invalid

replace h_3_2_p = .i if (h_3_2_p == . | h_3_2_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_p = .i if (h_3_3a_p == . | h_3_3a_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i))

replace h_3_3b_p = .i if (h_3_3b_p == . | h_3_3b_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i) & (h_3_3a_p == 2 | h_3_3a_p == .i))

replace h_3_3c_p = .i if (h_3_3c_p == . | h_3_3c_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i) & (h_3_3a_p == 1 | h_3_3a_p == .i))

replace h_3_4_p = .i if (h_3_4_p == . | h_3_4_p == .a) & (h_country == 0 & h_3_1 ~= 2)

replace h_3_5a_p = .i if (h_3_5a_p == . | h_3_5a_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i))

replace h_3_5b_p = .i if (h_3_5b_p == . | h_3_5b_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i) & (h_3_5a_p == 2 | h_3_5a_p == .i))

replace h_3_5c_p = .i if (h_3_5c_p == . | h_3_5c_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i) & (h_3_5a_p == 1 | h_3_5a_p == .i))

replace h_3_6_p = .i if (h_3_6_p == . | h_3_6_p == .i) & (h_country == 0 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_p = .i if (h_3_7a_p == . | h_3_7a_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i))

replace h_3_7b_p = .i if (h_3_7b_p == . | h_3_7b_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i) & (h_3_7a_p == 2 | h_3_7a_p == .i))

replace h_3_7c_p = .i if (h_3_7c_p == . | h_3_7c_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i) & (h_3_7a_p == 1 | h_3_7a_p == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace s_3_13 = .i if (s_3_13 == . | s_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_p = .i if (h_3_16_p == . | h_3_16_p == .a) & (h_country == 0 & h_3_15 ~= 0)

replace h_3_17a_p = .i if (h_3_17a_p == . | h_3_17a_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i))

replace h_3_17b_p = .i if (h_3_17b_p == . | h_3_17b_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i) & (h_3_17a_p == 2 | h_3_17a_p == .i))

replace h_3_17c_p = .i if (h_3_17c_p == . | h_3_17c_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i) & (h_3_17a_p == 1 | h_3_17a_p == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 0

replace h_3_19_p = .i if (h_3_19_p == . | h_3_19_p == .a) & (h_country == 0 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_p = .i if (h_3_20a_p == . | h_3_20a_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i))

replace h_3_20b_p = .i if (h_3_20b_p == . | h_3_20b_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i) & (h_3_20a_p == 2 | h_3_20a_p == .i))

replace h_3_20c_p = .i if (h_3_20c_p == . | h_3_20c_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i) & (h_3_20a_p == 1 | h_3_20a_p == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_p = .i if (h_3_22_p == . | h_3_22_p == .a) & (h_country == 0 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_p = .i if (h_3_23a_p == . | h_3_23a_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i))

replace h_3_23b_p = .i if (h_3_23b_p == . | h_3_23b_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i) & (h_3_23a_p == 2 | h_3_23a_p == .i))

replace h_3_23c_p = .i if (h_3_23c_p == . | h_3_23c_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i) & (h_3_23a_p == 1 | h_3_23a_p == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_p = .i if (h_3_25_p == . | h_3_25_p == .a) & (h_country == 0 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_p = .i if (h_3_26a_p == . | h_3_26a_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i))

replace h_3_26b_p = .i if (h_3_26b_p == . | h_3_26b_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i) & (h_3_26a_p == 2 | h_3_26a_p == .i))

replace h_3_26c_p = .i if (h_3_26c_p == . | h_3_26c_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i) & (h_3_26a_p == 1 | h_3_26a_p == .i))

replace h_3_27_p = .i if (h_3_27_p == . | h_3_27_p == .a) & h_country == 0

replace h_3_28a_p = .i if (h_3_28a_p == . | h_3_28a_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i))

replace h_3_28b_p = .i if (h_3_28b_p == . | h_3_28b_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i) & (h_3_28a_p == 2 | h_3_28a_p == .i))

replace h_3_28c_p = .i if (h_3_28c_p == . | h_3_28c_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i) & (h_3_28a_p == 1 | h_3_28a_p == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_p = .i if (h_3_30_p == . | h_3_30_p == .a) & (h_country == 0 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_p = .i if (h_3_31a_p == . | h_3_31a_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i))

replace h_3_31b_p = .i if (h_3_31b_p == . | h_3_31b_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i) & (h_3_31a_p == 2 | h_3_31a_p == .i))

replace h_3_31c_p = .i if (h_3_31c_p == . | h_3_31c_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i) & (h_3_31a_p == 1 | h_3_31a_p == .i))

replace h_3_32_p = .i if (h_3_32_p == . | h_3_32_p == .a) & h_country == 0

replace h_3_33a_p = .i if (h_3_33a_p == . | h_3_33a_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i))

replace h_3_33b_p = .i if (h_3_33b_p == . | h_3_33b_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i) & (h_3_33a_p == 2 | h_3_33a_p == .i))

replace h_3_33c_p = .i if (h_3_33c_p == . | h_3_33c_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i) & (h_3_33a_p == 1 | h_3_33a_p == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_p = .i if (h_4_1b_p == . | h_4_1b_p == .a) & (h_country == 0 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_p = .i if (h_4_1b2_p == . | h_4_1b2_p == .a) & (h_country == 0 & (h_4_1b_p == 2 | h_4_1b_p == .i))

replace h_4_1b3_p = .i if (h_4_1b3_p == . | h_4_1b3_p == .a) & (h_country == 0 & (h_4_1b_p == 1 | h_4_1b_p == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_p = .i if (h_4_2b_p == . | h_4_2b_p == .a) & (h_country == 0 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_p = .i if (h_4_2b2_p == . | h_4_2b2_p == .a) & (h_country == 0 & (h_4_2b_p == 2 | h_4_2b_p == .i))

replace h_4_2b3_p = .i if (h_4_2b3_p == . | h_4_2b3_p == .a) & (h_country == 0 & (h_4_2b_p == 1 | h_4_2b_p == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_p = .i if (h_4_3b_p == . | h_4_3b_p == .a) & (h_country == 0 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_p = .i if (h_4_3b2_p == . | h_4_3b2_p == .a) & (h_country == 0 & (h_4_3b_p == 2 | h_4_3b_p == .i))

replace h_4_3b3_p = .i if (h_4_3b3_p == . | h_4_3b3_p == .a) & (h_country == 0 & (h_4_3b_p == 1 | h_4_3b_p == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_p = .i if (h_4_4b_p == . | h_4_4b_p == .a) & (h_country == 0 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_p = .i if (h_4_4b2_p == . | h_4_4b2_p == .a) & (h_country == 0 & (h_4_4b_p == 2 | h_4_4b_p == .i))

replace h_4_4b3_p = .i if (h_4_4b3_p == . | h_4_4b3_p == .a) & (h_country == 0 & (h_4_4b_p == 1 | h_4_4b_p == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_p = .i if (h_4_5b_p == . | h_4_5b_p == .a) & (h_country == 0 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_p = .i if (h_4_5b2_p == . | h_4_5b2_p == .a) & (h_country == 0 & (h_4_5b_p == 2 | h_4_5b_p == .i))

replace h_4_5b3_p = .i if (h_4_5b3_p == . | h_4_5b3_p == .a) & (h_country == 0 & (h_4_5b_p == 1 | h_4_5b_p == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_p = .i if (h_4_6b_p == . | h_4_6b_p == .a) & (h_country == 0 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_p = .i if (h_4_6b2_p == . | h_4_6b2_p == .a) & (h_country == 0 & (h_4_6b_p == 2 | h_4_6b_p == .i))

replace h_4_6b3_p = .i if (h_4_6b3_p == . | h_4_6b3_p == .a) & (h_country == 0 & (h_4_6b_p == 1 | h_4_6b_p == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_p = .i if (h_4_7b_p == . | h_4_7b_p == .a) & (h_country == 0 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_p = .i if (h_4_7b2_p == . | h_4_7b2_p == .a) & (h_country == 0 & (h_4_7b_p == 2 | h_4_7b_p == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_p = .i if (h_4_8b_p == . | h_4_8b_p == .a) & (h_country == 0 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_p = .i if (h_4_8b2_p == . | h_4_8b2_p == .a) & (h_country == 0 & (h_4_8b_p == 2 | h_4_8b_p == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_p = .i if (h_5_1b_p == . | h_5_1b_p == .a) & (h_country == 0 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_p = .i if (h_5_1b2_p == . | h_5_1b2_p == .a) & (h_country == 0 & (h_5_1b_p == 2 | h_5_1b_p == .i) & h_5 ~= 1)

replace h_5_1b3_p = .i if (h_5_1b3_p == . | h_5_1b3_p == .a) & (h_country == 0 & (h_5_1b_p == 1 | h_5_1b_p == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_p = .i if (h_5_2b_p == . | h_5_2b_p == .a) & (h_country == 0 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_p = .i if (h_5_2b2_p == . | h_5_2b2_p == .a) & (h_country == 0 & (h_5_2b_p == 2 | h_5_2b_p == .i) & h_5 ~= 1)

replace h_5_2b3_p = .i if (h_5_2b3_p == . | h_5_2b3_p == .a) & (h_country == 0 & (h_5_2b_p == 1 | h_5_2b_p == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_p = .i if (h_5_3b_p == . | h_5_3b_p == .a) & (h_country == 0 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_p = .i if (h_5_3b2_p == . | h_5_3b2_p == .a) & (h_country == 0 & (h_5_3b_p == 2 | h_5_3b_p == .i) & h_5 ~= 1)

replace h_5_3b3_p = .i if (h_5_3b3_p == . | h_5_3b3_p == .a) & (h_country == 0 & (h_5_3b_p == 1 | h_5_3b_p == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_p = .i if (h_5_4b_p == . | h_5_4b_p == .a) & (h_country == 0 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_p = .i if (h_5_4b2_p == . | h_5_4b2_p == .a) & (h_country == 0 & (h_5_4b_p == 2 | h_5_4b_p == .i) & h_5 ~= 1)

replace h_5_4b3_p = .i if (h_5_4b3_p == . | h_5_4b3_p == .a) & (h_country == 0 & (h_5_4b_p == 1 | h_5_4b_p == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_p = .i if (h_5_5b_p == . | h_5_5b_p == .a) & (h_country == 0 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_p = .i if (h_5_5b2_p == . | h_5_5b2_p == .a) & (h_country == 0 & (h_5_5b_p == 2 | h_5_5b_p == .i) & h_5 ~= 1)

replace h_5_5b3_p = .i if (h_5_5b3_p == . | h_5_5b3_p == .a) & (h_country == 0 & (h_5_5b_p == 1 | h_5_5b_p == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_p = .i if (h_5_6b_p == . | h_5_6b_p == .a) & (h_country == 0 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_p = .i if (h_5_6b2_p == . | h_5_6b2_p == .a) & (h_country == 0 & (h_5_6b_p == 2 | h_5_6b_p == .i) & h_5 ~= 1)

replace h_5_6b3_p = .i if (h_5_6b3_p == . | h_5_6b3_p == .a) & (h_country == 0 & (h_5_6b_p == 1 | h_5_6b_p == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_p = .i if (h_5_7b_p == . | h_5_7b_p == .a) & (h_country == 0 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_p = .i if (h_5_7b2_p == . | h_5_7b2_p == .a) & (h_country == 0 & (h_5_7b_p == 2 | h_5_7b_p == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_p = .i if (h_5_8b_p == . | h_5_8b_p == .a) & (h_country == 0 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_p = .i if (h_5_8b2_p == . | h_5_8b2_p == .a) & (h_country == 0 & (h_5_8b_p == 2 | h_5_8b_p == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_p = .i if (h_6_1a_p == . | h_6_1a_p == .a) & (h_country == 0 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_p = .i if (h_6_1b1_p == . | h_6_1b1_p == .a) & (h_country == 0 & (h_6_1a_p == 88 | h_6_1a_p == 99 | h_6_1a_p == .i))

replace h_6_1b2_p = .i if (h_6_1b2_p == . | h_6_1b2_p == .a) & (h_country == 0 & (h_6_1b1_p == 1 | h_6_1b1_p == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_44_p = .i if (h_6_44_p == . | h_6_44_p == .a) & h_country == 0

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_p = .i if (h_6_5a_p == . | h_6_5a_p == .a) & (h_country == 0 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_p = .i if (h_6_5b1_p == . | h_6_5b1_p == .a) & (h_country == 0 & (h_6_5a_p == 88 | h_6_5a_p == 99 | h_6_5a_p == .i))

replace h_6_5b2_p = .i if (h_6_5b2_p == . | h_6_5b2_p == .a) & (h_country == 0 & (h_6_5b1_p == 1 | h_6_5b1_p == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_p = .i if (h_6_6a_p == . | h_6_6a_p == .a) & (h_country == 0 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_p = .i if (h_6_6b1_p == . | h_6_6b1_p == .a) & (h_country == 0 & (h_6_6a_p == 88 | h_6_6a_p == 99 | h_6_6a_p == .i))

replace h_6_6b2_p = .i if (h_6_6b2_p == . | h_6_6b2_p == .a) & (h_country == 0 & (h_6_6b1_p == 1 | h_6_6b1_p == .i))

replace h_7_1_p_c = .i if (h_7_1_p_c == . | h_7_1_p_c == .a) & (h_country == 0 | h_country == 2)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)




*all dominican republic invalid

replace h_3_2_d = .i if (h_3_2_d == . | h_3_2_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_d = .i if (h_3_3a_d == . | h_3_3a_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i))

replace h_3_3b_d = .i if (h_3_3b_d == . | h_3_3b_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i) & (h_3_3a_d == 2 | h_3_3a_d == .i))

replace h_3_3c_d = .i if (h_3_3c_d == . | h_3_3c_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i) & (h_3_3a_d == 1 | h_3_3a_d == .i))

replace h_3_4_d = .i if (h_3_4_d == . | h_3_4_d == .a) & (h_country == 1 & h_3_1 ~= 2)

replace h_3_5a_d = .i if (h_3_5a_d == . | h_3_5a_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i))

replace h_3_5b_d = .i if (h_3_5b_d == . | h_3_5b_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i) & (h_3_5a_d == 2 | h_3_5a_d == .i))

replace h_3_5c_d = .i if (h_3_5c_d == . | h_3_5c_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i) & (h_3_5a_d == 1 | h_3_5a_d == .i))

replace h_3_6_d = .i if (h_3_6_d == . | h_3_6_d == .i) & (h_country == 1 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_d = .i if (h_3_7a_d == . | h_3_7a_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i))

replace h_3_7b_d = .i if (h_3_7b_d == . | h_3_7b_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i) & (h_3_7a_d == 2 | h_3_7a_d == .i))

replace h_3_7c_d = .i if (h_3_7c_d == . | h_3_7c_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i) & (h_3_7a_d == 1 | h_3_7a_d == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace s_3_13 = .i if (s_3_13 == . | s_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_d = .i if (h_3_16_d == . | h_3_16_d == .a) & (h_country == 1 & h_3_15 ~= 0)

replace h_3_17a_d = .i if (h_3_17a_d == . | h_3_17a_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i))

replace h_3_17b_d = .i if (h_3_17b_d == . | h_3_17b_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i) & (h_3_17a_d == 2 | h_3_17a_d == .i))

replace h_3_17c_d = .i if (h_3_17c_d == . | h_3_17c_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i) & (h_3_17a_d == 1 | h_3_17a_d == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 1

replace h_3_19_d = .i if (h_3_19_d == . | h_3_19_d == .a) & (h_country == 1 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_d = .i if (h_3_20a_d == . | h_3_20a_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i))

replace h_3_20b_d = .i if (h_3_20b_d == . | h_3_20b_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i) & (h_3_20a_d == 2 | h_3_20a_d == .i))

replace h_3_20c_d = .i if (h_3_20c_d == . | h_3_20c_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i) & (h_3_20a_d == 1 | h_3_20a_d == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_d = .i if (h_3_22_d == . | h_3_22_d == .a) & (h_country == 1 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_d = .i if (h_3_23a_d == . | h_3_23a_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i))

replace h_3_23b_d = .i if (h_3_23b_d == . | h_3_23b_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i) & (h_3_23a_d == 2 | h_3_23a_d == .i))

replace h_3_23c_d = .i if (h_3_23c_d == . | h_3_23c_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i) & (h_3_23a_d == 1 | h_3_23a_d == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_d = .i if (h_3_25_d == . | h_3_25_d == .a) & (h_country == 1 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_d = .i if (h_3_26a_d == . | h_3_26a_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i))

replace h_3_26b_d = .i if (h_3_26b_d == . | h_3_26b_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i) & (h_3_26a_d == 2 | h_3_26a_d == .i))

replace h_3_26c_d = .i if (h_3_26c_d == . | h_3_26c_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i) & (h_3_26a_d == 1 | h_3_26a_d == .i))

replace h_3_27_d = .i if (h_3_27_d == . | h_3_27_d == .a) & h_country == 1

replace h_3_28a_d = .i if (h_3_28a_d == . | h_3_28a_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i))

replace h_3_28b_d = .i if (h_3_28b_d == . | h_3_28b_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i) & (h_3_28a_d == 2 | h_3_28a_d == .i))

replace h_3_28c_d = .i if (h_3_28c_d == . | h_3_28c_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i) & (h_3_28a_d == 1 | h_3_28a_d == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_d = .i if (h_3_30_d == . | h_3_30_d == .a) & (h_country == 1 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_d = .i if (h_3_31a_d == . | h_3_31a_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i))

replace h_3_31b_d = .i if (h_3_31b_d == . | h_3_31b_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i) & (h_3_31a_d == 2 | h_3_31a_d == .i))

replace h_3_31c_d = .i if (h_3_31c_d == . | h_3_31c_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i) & (h_3_31a_d == 1 | h_3_31a_d == .i))

replace h_3_32_d = .i if (h_3_32_d == . | h_3_32_d == .a) & h_country == 1

replace h_3_33a_d = .i if (h_3_33a_d == . | h_3_33a_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i))

replace h_3_33b_d = .i if (h_3_33b_d == . | h_3_33b_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i) & (h_3_33a_d == 2 | h_3_33a_d == .i))

replace h_3_33c_d = .i if (h_3_33c_d == . | h_3_33c_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i) & (h_3_33a_d == 1 | h_3_33a_d == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_d = .i if (h_4_1b_d == . | h_4_1b_d == .a) & (h_country == 1 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_d = .i if (h_4_1b2_d == . | h_4_1b2_d == .a) & (h_country == 1 & (h_4_1b_d == 2 | h_4_1b_d == .i))

replace h_4_1b3_d = .i if (h_4_1b3_d == . | h_4_1b3_d == .a) & (h_country == 1 & (h_4_1b_d == 1 | h_4_1b_d == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_d = .i if (h_4_2b_d == . | h_4_2b_d == .a) & (h_country == 1 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_d = .i if (h_4_2b2_d == . | h_4_2b2_d == .a) & (h_country == 1 & (h_4_2b_d == 2 | h_4_2b_d == .i))

replace h_4_2b3_d = .i if (h_4_2b3_d == . | h_4_2b3_d == .a) & (h_country == 1 & (h_4_2b_d == 1 | h_4_2b_d == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_d = .i if (h_4_3b_d == . | h_4_3b_d == .a) & (h_country == 1 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_d = .i if (h_4_3b2_d == . | h_4_3b2_d == .a) & (h_country == 1 & (h_4_3b_d == 2 | h_4_3b_d == .i))

replace h_4_3b3_d = .i if (h_4_3b3_d == . | h_4_3b3_d == .a) & (h_country == 1 & (h_4_3b_d == 1 | h_4_3b_d == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_d = .i if (h_4_4b_d == . | h_4_4b_d == .a) & (h_country == 1 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_d = .i if (h_4_4b2_d == . | h_4_4b2_d == .a) & (h_country == 1 & (h_4_4b_d == 2 | h_4_4b_d == .i))

replace h_4_4b3_d = .i if (h_4_4b3_d == . | h_4_4b3_d == .a) & (h_country == 1 & (h_4_4b_d == 1 | h_4_4b_d == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_d = .i if (h_4_5b_d == . | h_4_5b_d == .a) & (h_country == 1 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_d = .i if (h_4_5b2_d == . | h_4_5b2_d == .a) & (h_country == 1 & (h_4_5b_d == 2 | h_4_5b_d == .i))

replace h_4_5b3_d = .i if (h_4_5b3_d == . | h_4_5b3_d == .a) & (h_country == 1 & (h_4_5b_d == 1 | h_4_5b_d == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_d = .i if (h_4_6b_d == . | h_4_6b_d == .a) & (h_country == 1 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_d = .i if (h_4_6b2_d == . | h_4_6b2_d == .a) & (h_country == 1 & (h_4_6b_d == 2 | h_4_6b_d == .i))

replace h_4_6b3_d = .i if (h_4_6b3_d == . | h_4_6b3_d == .a) & (h_country == 1 & (h_4_6b_d == 1 | h_4_6b_d == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_d = .i if (h_4_7b_d == . | h_4_7b_d == .a) & (h_country == 1 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_d = .i if (h_4_7b2_d == . | h_4_7b2_d == .a) & (h_country == 1 & (h_4_7b_d == 2 | h_4_7b_d == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_d = .i if (h_4_8b_d == . | h_4_8b_d == .a) & (h_country == 1 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_d = .i if (h_4_8b2_d == . | h_4_8b2_d == .a) & (h_country == 1 & (h_4_8b_d == 2 | h_4_8b_d == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_d = .i if (h_5_1b_d == . | h_5_1b_d == .a) & (h_country == 1 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_d = .i if (h_5_1b2_d == . | h_5_1b2_d == .a) & (h_country == 1 & (h_5_1b_d == 2 | h_5_1b_d == .i) & h_5 ~= 1)

replace h_5_1b3_d = .i if (h_5_1b3_d == . | h_5_1b3_d == .a) & (h_country == 1 & (h_5_1b_d == 1 | h_5_1b_d == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_d = .i if (h_5_2b_d == . | h_5_2b_d == .a) & (h_country == 1 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_d = .i if (h_5_2b2_d == . | h_5_2b2_d == .a) & (h_country == 1 & (h_5_2b_d == 2 | h_5_2b_d == .i) & h_5 ~= 1)

replace h_5_2b3_d = .i if (h_5_2b3_d == . | h_5_2b3_d == .a) & (h_country == 1 & (h_5_2b_d == 1 | h_5_2b_d == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_d = .i if (h_5_3b_d == . | h_5_3b_d == .a) & (h_country == 1 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_d = .i if (h_5_3b2_d == . | h_5_3b2_d == .a) & (h_country == 1 & (h_5_3b_d == 2 | h_5_3b_d == .i) & h_5 ~= 1)

replace h_5_3b3_d = .i if (h_5_3b3_d == . | h_5_3b3_d == .a) & (h_country == 1 & (h_5_3b_d == 1 | h_5_3b_d == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_d = .i if (h_5_4b_d == . | h_5_4b_d == .a) & (h_country == 1 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_d = .i if (h_5_4b2_d == . | h_5_4b2_d == .a) & (h_country == 1 & (h_5_4b_d == 2 | h_5_4b_d == .i) & h_5 ~= 1)

replace h_5_4b3_d = .i if (h_5_4b3_d == . | h_5_4b3_d == .a) & (h_country == 1 & (h_5_4b_d == 1 | h_5_4b_d == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_d = .i if (h_5_5b_d == . | h_5_5b_d == .a) & (h_country == 1 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_d = .i if (h_5_5b2_d == . | h_5_5b2_d == .a) & (h_country == 1 & (h_5_5b_d == 2 | h_5_5b_d == .i) & h_5 ~= 1)

replace h_5_5b3_d = .i if (h_5_5b3_d == . | h_5_5b3_d == .a) & (h_country == 1 & (h_5_5b_d == 1 | h_5_5b_d == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_d = .i if (h_5_6b_d == . | h_5_6b_d == .a) & (h_country == 1 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_d = .i if (h_5_6b2_d == . | h_5_6b2_d == .a) & (h_country == 1 & (h_5_6b_d == 2 | h_5_6b_d == .i) & h_5 ~= 1)

replace h_5_6b3_d = .i if (h_5_6b3_d == . | h_5_6b3_d == .a) & (h_country == 1 & (h_5_6b_d == 1 | h_5_6b_d == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_d = .i if (h_5_7b_d == . | h_5_7b_d == .a) & (h_country == 1 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_d = .i if (h_5_7b2_d == . | h_5_7b2_d == .a) & (h_country == 1 & (h_5_7b_d == 2 | h_5_7b_d == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_d = .i if (h_5_8b_d == . | h_5_8b_d == .a) & (h_country == 1 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_d = .i if (h_5_8b2_d == . | h_5_8b2_d == .a) & (h_country == 1 & (h_5_8b_d == 2 | h_5_8b_d == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_d = .i if (h_6_1a_d == . | h_6_1a_d == .a) & (h_country == 1 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_d = .i if (h_6_1b1_d == . | h_6_1b1_d == .a) & (h_country == 1 & (h_6_1a_d == 88 | h_6_1a_d == 99 | h_6_1a_d == .i))

replace h_6_1b2_d = .i if (h_6_1b2_d == . | h_6_1b2_d == .a) & (h_country == 1 & (h_6_1b1_d == 1 | h_6_1b1_d == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_41_d = .i if (h_6_41_d == . | h_6_41_d == .a) & h_country == 1

replace h_6_42_d = .i if (h_6_42_d == . | h_6_42_d == .a) & h_country == 1

replace h_6_43_d = .i if (h_6_43_d == . | h_6_43_d == .a) & h_country == 1

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_d = .i if (h_6_5a_d == . | h_6_5a_d == .a) & (h_country == 1 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_d = .i if (h_6_5b1_d == . | h_6_5b1_d == .a) & (h_country == 1 & (h_6_5a_d == 88 | h_6_5a_d == 99 | h_6_5a_d == .i))

replace h_6_5b2_d = .i if (h_6_5b2_d == . | h_6_5b2_d == .a) & (h_country == 1 & (h_6_5b1_d == 1 | h_6_5b1_d == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_d = .i if (h_6_6a_d == . | h_6_6a_d == .a) & (h_country == 1 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_d = .i if (h_6_6b1_d == . | h_6_6b1_d == .a) & (h_country == 1 & (h_6_6a_d == 88 | h_6_6a_d == 99 | h_6_6a_d == .i))

replace h_6_6b2_d = .i if (h_6_6b2_d == . | h_6_6b2_d == .a) & (h_country == 1 & (h_6_6b1_d == 1 | h_6_6b1_d == .i))

replace h_7_1_d = .i if (h_7_1_d == . | h_7_1_d == .a) & (h_country == 1)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)




*all remaining . are converted to .v

replace h_3_2_c = .v if (h_3_2_c == . | h_3_2_c == .a)
replace h_3_3a_c = .v if (h_3_3a_c == . | h_3_3a_c == .a)
replace h_3_3b_c = .v if (h_3_3b_c == . | h_3_3b_c == .a)
replace h_3_3c_c = .v if (h_3_3c_c == . | h_3_3c_c == .a)
replace h_3_4_c = .v if (h_3_4_c == . | h_3_4_c == .a)
replace h_3_5a_c = .v if (h_3_5a_c == . | h_3_5a_c == .a)
replace h_3_5b_c = .v if (h_3_5b_c == . | h_3_5b_c == .a)
replace h_3_5c_c = .v if (h_3_5c_c == . | h_3_5c_c == .a)
replace h_3_6_c = .v if (h_3_6_c == . | h_3_6_c == .a)
replace h_3_7a_c = .v if (h_3_7a_c == . | h_3_7a_c == .a)
replace h_3_7b_c = .v if (h_3_7b_c == . | h_3_7b_c == .a)
replace h_3_7c_c = .v if (h_3_7c_c == . | h_3_7c_c == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_c = .v if (h_3_16_c == . | h_3_16_c == .a)
replace h_3_17a_c = .v if (h_3_17a_c == . | h_3_17a_c == .a)
replace h_3_17b_c = .v if (h_3_17b_c == . | h_3_17b_c == .a)
replace h_3_17c_c = .v if (h_3_17c_c == . | h_3_17c_c == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_c = .v if (h_3_19_c == . | h_3_19_c == .a)
replace h_3_20a_c = .v if (h_3_20a_c == . | h_3_20a_c == .a)
replace h_3_20b_c = .v if (h_3_20b_c == . | h_3_20b_c == .a)
replace h_3_20c_c = .v if (h_3_20c_c == . | h_3_20c_c == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_c = .v if (h_3_22_c == . | h_3_22_c == .a)
replace h_3_23a_c = .v if (h_3_23a_c == . | h_3_23a_c == .a)
replace h_3_23b_c = .v if (h_3_23b_c == . | h_3_23b_c == .a)
replace h_3_23c_c = .v if (h_3_23c_c == . | h_3_23c_c == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_c = .v if (h_3_25_c == . | h_3_25_c == .a)
replace h_3_26a_c = .v if (h_3_26a_c == . | h_3_26a_c == .a)
replace h_3_26b_c = .v if (h_3_26b_c == . | h_3_26b_c == .a)
replace h_3_26c_c = .v if (h_3_26c_c == . | h_3_26c_c == .a)
replace h_3_27_c = .v if (h_3_27_c == . | h_3_27_c == .a)
replace h_3_28a_c = .v if (h_3_28a_c == . | h_3_28a_c == .a)
replace h_3_28b_c = .v if (h_3_28b_c == . | h_3_28b_c == .a)
replace h_3_28c_c = .v if (h_3_28c_c == . | h_3_28c_c == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_c = .v if (h_3_30_c == . | h_3_30_c == .a)
replace h_3_31a_c = .v if (h_3_31a_c == . | h_3_31a_c == .a)
replace h_3_31b_c = .v if (h_3_31b_c == . | h_3_31b_c == .a)
replace h_3_31c_c = .v if (h_3_31c_c == . | h_3_31c_c == .a)
replace h_3_32_c = .v if (h_3_32_c == . | h_3_32_c == .a)
replace h_3_33a_c = .v if (h_3_33a_c == . | h_3_33a_c == .a)
replace h_3_33b_c = .v if (h_3_33b_c == . | h_3_33b_c == .a)
replace h_3_33c_c = .v if (h_3_33c_c == . | h_3_33c_c == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_c = .v if (h_4_1b_c == . | h_4_1b_c == .a)
replace h_4_1b2_c = .v if (h_4_1b2_c == . | h_4_1b2_c == .a)
replace h_4_1b3_c = .v if (h_4_1b3_c == . | h_4_1b3_c == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_c = .v if (h_4_2b_c == . | h_4_2b_c == .a)
replace h_4_2b2_c = .v if (h_4_2b2_c == . | h_4_2b2_c == .a)
replace h_4_2b3_c = .v if (h_4_2b3_c == . | h_4_2b3_c == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_c = .v if (h_4_3b_c == . | h_4_3b_c == .a)
replace h_4_3b2_c = .v if (h_4_3b2_c == . | h_4_3b2_c == .a)
replace h_4_3b3_c = .v if (h_4_3b3_c == . | h_4_3b3_c == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_c = .v if (h_4_4b_c == . | h_4_4b_c == .a)
replace h_4_4b2_c = .v if (h_4_4b2_c == . | h_4_4b2_c == .a)
replace h_4_4b3_c = .v if (h_4_4b3_c == . | h_4_4b3_c == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_c = .v if (h_4_5b_c == . | h_4_5b_c == .a)
replace h_4_5b2_c = .v if (h_4_5b2_c == . | h_4_5b2_c == .a)
replace h_4_5b3_c = .v if (h_4_5b3_c == . | h_4_5b3_c == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_c = .v if (h_4_6b_c == . | h_4_6b_c == .a)
replace h_4_6b2_c = .v if (h_4_6b2_c == . | h_4_6b2_c == .a)
replace h_4_6b3_c = .v if (h_4_6b3_c == . | h_4_6b3_c == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_c = .v if (h_4_7b_c == . | h_4_7b_c == .a)
replace h_4_7b2_c = .v if (h_4_7b2_c == . | h_4_7b2_c == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_c = .v if (h_4_8b_c == . | h_4_8b_c == .a)
replace h_4_8b2_c = .v if (h_4_8b2_c == . | h_4_8b2_c == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_c = .v if (h_5_1b_c == . | h_5_1b_c == .a)
replace h_5_1b2_c = .v if (h_5_1b2_c == . | h_5_1b2_c == .a)
replace h_5_1b3_c = .v if (h_5_1b3_c == . | h_5_1b3_c == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_c = .v if (h_5_2b_c == . | h_5_2b_c == .a)
replace h_5_2b2_c = .v if (h_5_2b2_c == . | h_5_2b2_c == .a)
replace h_5_2b3_c = .v if (h_5_2b3_c == . | h_5_2b3_c == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_c = .v if (h_5_3b_c == . | h_5_3b_c == .a)
replace h_5_3b2_c = .v if (h_5_3b2_c == . | h_5_3b2_c == .a)
replace h_5_3b3_c = .v if (h_5_3b3_c == . | h_5_3b3_c == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_c = .v if (h_5_4b_c == . | h_5_4b_c == .a)
replace h_5_4b2_c = .v if (h_5_4b2_c == . | h_5_4b2_c == .a)
replace h_5_4b3_c = .v if (h_5_4b3_c == . | h_5_4b3_c == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_c = .v if (h_5_5b_c == . | h_5_5b_c == .a)
replace h_5_5b2_c = .v if (h_5_5b2_c == . | h_5_5b2_c == .a)
replace h_5_5b3_c = .v if (h_5_5b3_c == . | h_5_5b3_c == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_c = .v if (h_5_6b_c == . | h_5_6b_c == .a)
replace h_5_6b2_c = .v if (h_5_6b2_c == . | h_5_6b2_c == .a)
replace h_5_6b3_c = .v if (h_5_6b3_c == . | h_5_6b3_c == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_c = .v if (h_5_7b_c == . | h_5_7b_c == .a)
replace h_5_7b2_c = .v if (h_5_7b2_c == . | h_5_7b2_c == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_c = .v if (h_5_8b_c == . | h_5_8b_c == .a)
replace h_5_8b2_c = .v if (h_5_8b2_c == . | h_5_8b2_c == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_c = .v if (h_6_1a_c == . | h_6_1a_c == .a)
replace h_6_1b1_c = .v if (h_6_1b1_c == . | h_6_1b1_c == .a)
replace h_6_1b2_c = .v if (h_6_1b2_c == . | h_6_1b2_c == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_c = .v if (h_6_5a_c == . | h_6_5a_c == .a)
replace h_6_5b1_c = .v if (h_6_5b1_c == . | h_6_5b1_c == .a)
replace h_6_5b2_c = .v if (h_6_5b2_c == . | h_6_5b2_c == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_c = .v if (h_6_6a_c == . | h_6_6a_c == .a)
replace h_6_6b1_c = .v if (h_6_6b1_c == . | h_6_6b1_c == .a)
replace h_6_6b2_c = .v if (h_6_6b2_c == . | h_6_6b2_c == .a)
replace h_7_1_p_c = .v if (h_7_1_p_c == . | h_7_1_p_c == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)
replace h_3_2_p = .v if (h_3_2_p == . | h_3_2_p == .a)
replace h_3_3a_p = .v if (h_3_3a_p == . | h_3_3a_p == .a)
replace h_3_3b_p = .v if (h_3_3b_p == . | h_3_3b_p == .a)
replace h_3_3c_p = .v if (h_3_3c_p == . | h_3_3c_p == .a)
replace h_3_4_p = .v if (h_3_4_p == . | h_3_4_p == .a)
replace h_3_5a_p = .v if (h_3_5a_p == . | h_3_5a_p == .a)
replace h_3_5b_p = .v if (h_3_5b_p == . | h_3_5b_p == .a)
replace h_3_5c_p = .v if (h_3_5c_p == . | h_3_5c_p == .a)
replace h_3_6_p = .v if (h_3_6_p == . | h_3_6_p == .a)
replace h_3_7a_p = .v if (h_3_7a_p == . | h_3_7a_p == .a)
replace h_3_7b_p = .v if (h_3_7b_p == . | h_3_7b_p == .a)
replace h_3_7c_p = .v if (h_3_7c_p == . | h_3_7c_p == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_p = .v if (h_3_16_p == . | h_3_16_p == .a)
replace h_3_17a_p = .v if (h_3_17a_p == . | h_3_17a_p == .a)
replace h_3_17b_p = .v if (h_3_17b_p == . | h_3_17b_p == .a)
replace h_3_17c_p = .v if (h_3_17c_p == . | h_3_17c_p == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_p = .v if (h_3_19_p == . | h_3_19_p == .a)
replace h_3_20a_p = .v if (h_3_20a_p == . | h_3_20a_p == .a)
replace h_3_20b_p = .v if (h_3_20b_p == . | h_3_20b_p == .a)
replace h_3_20c_p = .v if (h_3_20c_p == . | h_3_20c_p == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_p = .v if (h_3_22_p == . | h_3_22_p == .a)
replace h_3_23a_p = .v if (h_3_23a_p == . | h_3_23a_p == .a)
replace h_3_23b_p = .v if (h_3_23b_p == . | h_3_23b_p == .a)
replace h_3_23c_p = .v if (h_3_23c_p == . | h_3_23c_p == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_p = .v if (h_3_25_p == . | h_3_25_p == .a)
replace h_3_26a_p = .v if (h_3_26a_p == . | h_3_26a_p == .a)
replace h_3_26b_p = .v if (h_3_26b_p == . | h_3_26b_p == .a)
replace h_3_26c_p = .v if (h_3_26c_p == . | h_3_26c_p == .a)
replace h_3_27_p = .v if (h_3_27_p == . | h_3_27_p == .a)
replace h_3_28a_p = .v if (h_3_28a_p == . | h_3_28a_p == .a)
replace h_3_28b_p = .v if (h_3_28b_p == . | h_3_28b_p == .a)
replace h_3_28c_p = .v if (h_3_28c_p == . | h_3_28c_p == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_p = .v if (h_3_30_p == . | h_3_30_p == .a)
replace h_3_31a_p = .v if (h_3_31a_p == . | h_3_31a_p == .a)
replace h_3_31b_p = .v if (h_3_31b_p == . | h_3_31b_p == .a)
replace h_3_31c_p = .v if (h_3_31c_p == . | h_3_31c_p == .a)
replace h_3_32_p = .v if (h_3_32_p == . | h_3_32_p == .a)
replace h_3_33a_p = .v if (h_3_33a_p == . | h_3_33a_p == .a)
replace h_3_33b_p = .v if (h_3_33b_p == . | h_3_33b_p == .a)
replace h_3_33c_p = .v if (h_3_33c_p == . | h_3_33c_p == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_p = .v if (h_4_1b_p == . | h_4_1b_p == .a)
replace h_4_1b2_p = .v if (h_4_1b2_p == . | h_4_1b2_p == .a)
replace h_4_1b3_p = .v if (h_4_1b3_p == . | h_4_1b3_p == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_p = .v if (h_4_2b_p == . | h_4_2b_p == .a)
replace h_4_2b2_p = .v if (h_4_2b2_p == . | h_4_2b2_p == .a)
replace h_4_2b3_p = .v if (h_4_2b3_p == . | h_4_2b3_p == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_p = .v if (h_4_3b_p == . | h_4_3b_p == .a)
replace h_4_3b2_p = .v if (h_4_3b2_p == . | h_4_3b2_p == .a)
replace h_4_3b3_p = .v if (h_4_3b3_p == . | h_4_3b3_p == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_p = .v if (h_4_4b_p == . | h_4_4b_p == .a)
replace h_4_4b2_p = .v if (h_4_4b2_p == . | h_4_4b2_p == .a)
replace h_4_4b3_p = .v if (h_4_4b3_p == . | h_4_4b3_p == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_p = .v if (h_4_5b_p == . | h_4_5b_p == .a)
replace h_4_5b2_p = .v if (h_4_5b2_p == . | h_4_5b2_p == .a)
replace h_4_5b3_p = .v if (h_4_5b3_p == . | h_4_5b3_p == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_p = .v if (h_4_6b_p == . | h_4_6b_p == .a)
replace h_4_6b2_p = .v if (h_4_6b2_p == . | h_4_6b2_p == .a)
replace h_4_6b3_p = .v if (h_4_6b3_p == . | h_4_6b3_p == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_p = .v if (h_4_7b_p == . | h_4_7b_p == .a)
replace h_4_7b2_p = .v if (h_4_7b2_p == . | h_4_7b2_p == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_p = .v if (h_4_8b_p == . | h_4_8b_p == .a)
replace h_4_8b2_p = .v if (h_4_8b2_p == . | h_4_8b2_p == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_p = .v if (h_5_1b_p == . | h_5_1b_p == .a)
replace h_5_1b2_p = .v if (h_5_1b2_p == . | h_5_1b2_p == .a)
replace h_5_1b3_p = .v if (h_5_1b3_p == . | h_5_1b3_p == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_p = .v if (h_5_2b_p == . | h_5_2b_p == .a)
replace h_5_2b2_p = .v if (h_5_2b2_p == . | h_5_2b2_p == .a)
replace h_5_2b3_p = .v if (h_5_2b3_p == . | h_5_2b3_p == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_p = .v if (h_5_3b_p == . | h_5_3b_p == .a)
replace h_5_3b2_p = .v if (h_5_3b2_p == . | h_5_3b2_p == .a)
replace h_5_3b3_p = .v if (h_5_3b3_p == . | h_5_3b3_p == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_p = .v if (h_5_4b_p == . | h_5_4b_p == .a)
replace h_5_4b2_p = .v if (h_5_4b2_p == . | h_5_4b2_p == .a)
replace h_5_4b3_p = .v if (h_5_4b3_p == . | h_5_4b3_p == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_p = .v if (h_5_5b_p == . | h_5_5b_p == .a)
replace h_5_5b2_p = .v if (h_5_5b2_p == . | h_5_5b2_p == .a)
replace h_5_5b3_p = .v if (h_5_5b3_p == . | h_5_5b3_p == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_p = .v if (h_5_6b_p == . | h_5_6b_p == .a)
replace h_5_6b2_p = .v if (h_5_6b2_p == . | h_5_6b2_p == .a)
replace h_5_6b3_p = .v if (h_5_6b3_p == . | h_5_6b3_p == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_p = .v if (h_5_7b_p == . | h_5_7b_p == .a)
replace h_5_7b2_p = .v if (h_5_7b2_p == . | h_5_7b2_p == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_p = .v if (h_5_8b_p == . | h_5_8b_p == .a)
replace h_5_8b2_p = .v if (h_5_8b2_p == . | h_5_8b2_p == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_p = .v if (h_6_1a_p == . | h_6_1a_p == .a)
replace h_6_1b1_p = .v if (h_6_1b1_p == . | h_6_1b1_p == .a)
replace h_6_1b2_p = .v if (h_6_1b2_p == . | h_6_1b2_p == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_44_p = .v if (h_6_44_p == . | h_6_44_p == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_p = .v if (h_6_5a_p == . | h_6_5a_p == .a)
replace h_6_5b1_p = .v if (h_6_5b1_p == . | h_6_5b1_p == .a)
replace h_6_5b2_p = .v if (h_6_5b2_p == . | h_6_5b2_p == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_p = .v if (h_6_6a_p == . | h_6_6a_p == .a)
replace h_6_6b1_p = .v if (h_6_6b1_p == . | h_6_6b1_p == .a)
replace h_6_6b2_p = .v if (h_6_6b2_p == . | h_6_6b2_p == .a)
replace h_7_1_p_c = .v if (h_7_1_p_c == . | h_7_1_p_c == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)
replace h_3_2_d = .v if (h_3_2_d == . | h_3_2_d == .a)
replace h_3_3a_d = .v if (h_3_3a_d == . | h_3_3a_d == .a)
replace h_3_3b_d = .v if (h_3_3b_d == . | h_3_3b_d == .a)
replace h_3_3c_d = .v if (h_3_3c_d == . | h_3_3c_d == .a)
replace h_3_4_d = .v if (h_3_4_d == . | h_3_4_d == .a)
replace h_3_5a_d = .v if (h_3_5a_d == . | h_3_5a_d == .a)
replace h_3_5b_d = .v if (h_3_5b_d == . | h_3_5b_d == .a)
replace h_3_5c_d = .v if (h_3_5c_d == . | h_3_5c_d == .a)
replace h_3_6_d = .v if (h_3_6_d == . | h_3_6_d == .a)
replace h_3_7a_d = .v if (h_3_7a_d == . | h_3_7a_d == .a)
replace h_3_7b_d = .v if (h_3_7b_d == . | h_3_7b_d == .a)
replace h_3_7c_d = .v if (h_3_7c_d == . | h_3_7c_d == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_d = .v if (h_3_16_d == . | h_3_16_d == .a)
replace h_3_17a_d = .v if (h_3_17a_d == . | h_3_17a_d == .a)
replace h_3_17b_d = .v if (h_3_17b_d == . | h_3_17b_d == .a)
replace h_3_17c_d = .v if (h_3_17c_d == . | h_3_17c_d == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_d = .v if (h_3_19_d == . | h_3_19_d == .a)
replace h_3_20a_d = .v if (h_3_20a_d == . | h_3_20a_d == .a)
replace h_3_20b_d = .v if (h_3_20b_d == . | h_3_20b_d == .a)
replace h_3_20c_d = .v if (h_3_20c_d == . | h_3_20c_d == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_d = .v if (h_3_22_d == . | h_3_22_d == .a)
replace h_3_23a_d = .v if (h_3_23a_d == . | h_3_23a_d == .a)
replace h_3_23b_d = .v if (h_3_23b_d == . | h_3_23b_d == .a)
replace h_3_23c_d = .v if (h_3_23c_d == . | h_3_23c_d == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_d = .v if (h_3_25_d == . | h_3_25_d == .a)
replace h_3_26a_d = .v if (h_3_26a_d == . | h_3_26a_d == .a)
replace h_3_26b_d = .v if (h_3_26b_d == . | h_3_26b_d == .a)
replace h_3_26c_d = .v if (h_3_26c_d == . | h_3_26c_d == .a)
replace h_3_27_d = .v if (h_3_27_d == . | h_3_27_d == .a)
replace h_3_28a_d = .v if (h_3_28a_d == . | h_3_28a_d == .a)
replace h_3_28b_d = .v if (h_3_28b_d == . | h_3_28b_d == .a)
replace h_3_28c_d = .v if (h_3_28c_d == . | h_3_28c_d == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_d = .v if (h_3_30_d == . | h_3_30_d == .a)
replace h_3_31a_d = .v if (h_3_31a_d == . | h_3_31a_d == .a)
replace h_3_31b_d = .v if (h_3_31b_d == . | h_3_31b_d == .a)
replace h_3_31c_d = .v if (h_3_31c_d == . | h_3_31c_d == .a)
replace h_3_32_d = .v if (h_3_32_d == . | h_3_32_d == .a)
replace h_3_33a_d = .v if (h_3_33a_d == . | h_3_33a_d == .a)
replace h_3_33b_d = .v if (h_3_33b_d == . | h_3_33b_d == .a)
replace h_3_33c_d = .v if (h_3_33c_d == . | h_3_33c_d == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_d = .v if (h_4_1b_d == . | h_4_1b_d == .a)
replace h_4_1b2_d = .v if (h_4_1b2_d == . | h_4_1b2_d == .a)
replace h_4_1b3_d = .v if (h_4_1b3_d == . | h_4_1b3_d == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_d = .v if (h_4_2b_d == . | h_4_2b_d == .a)
replace h_4_2b2_d = .v if (h_4_2b2_d == . | h_4_2b2_d == .a)
replace h_4_2b3_d = .v if (h_4_2b3_d == . | h_4_2b3_d == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_d = .v if (h_4_3b_d == . | h_4_3b_d == .a)
replace h_4_3b2_d = .v if (h_4_3b2_d == . | h_4_3b2_d == .a)
replace h_4_3b3_d = .v if (h_4_3b3_d == . | h_4_3b3_d == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_d = .v if (h_4_4b_d == . | h_4_4b_d == .a)
replace h_4_4b2_d = .v if (h_4_4b2_d == . | h_4_4b2_d == .a)
replace h_4_4b3_d = .v if (h_4_4b3_d == . | h_4_4b3_d == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_d = .v if (h_4_5b_d == . | h_4_5b_d == .a)
replace h_4_5b2_d = .v if (h_4_5b2_d == . | h_4_5b2_d == .a)
replace h_4_5b3_d = .v if (h_4_5b3_d == . | h_4_5b3_d == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_d = .v if (h_4_6b_d == . | h_4_6b_d == .a)
replace h_4_6b2_d = .v if (h_4_6b2_d == . | h_4_6b2_d == .a)
replace h_4_6b3_d = .v if (h_4_6b3_d == . | h_4_6b3_d == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_d = .v if (h_4_7b_d == . | h_4_7b_d == .a)
replace h_4_7b2_d = .v if (h_4_7b2_d == . | h_4_7b2_d == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_d = .v if (h_4_8b_d == . | h_4_8b_d == .a)
replace h_4_8b2_d = .v if (h_4_8b2_d == . | h_4_8b2_d == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_d = .v if (h_5_1b_d == . | h_5_1b_d == .a)
replace h_5_1b2_d = .v if (h_5_1b2_d == . | h_5_1b2_d == .a)
replace h_5_1b3_d = .v if (h_5_1b3_d == . | h_5_1b3_d == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_d = .v if (h_5_2b_d == . | h_5_2b_d == .a)
replace h_5_2b2_d = .v if (h_5_2b2_d == . | h_5_2b2_d == .a)
replace h_5_2b3_d = .v if (h_5_2b3_d == . | h_5_2b3_d == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_d = .v if (h_5_3b_d == . | h_5_3b_d == .a)
replace h_5_3b2_d = .v if (h_5_3b2_d == . | h_5_3b2_d == .a)
replace h_5_3b3_d = .v if (h_5_3b3_d == . | h_5_3b3_d == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_d = .v if (h_5_4b_d == . | h_5_4b_d == .a)
replace h_5_4b2_d = .v if (h_5_4b2_d == . | h_5_4b2_d == .a)
replace h_5_4b3_d = .v if (h_5_4b3_d == . | h_5_4b3_d == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_d = .v if (h_5_5b_d == . | h_5_5b_d == .a)
replace h_5_5b2_d = .v if (h_5_5b2_d == . | h_5_5b2_d == .a)
replace h_5_5b3_d = .v if (h_5_5b3_d == . | h_5_5b3_d == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_d = .v if (h_5_6b_d == . | h_5_6b_d == .a)
replace h_5_6b2_d = .v if (h_5_6b2_d == . | h_5_6b2_d == .a)
replace h_5_6b3_d = .v if (h_5_6b3_d == . | h_5_6b3_d == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_d = .v if (h_5_7b_d == . | h_5_7b_d == .a)
replace h_5_7b2_d = .v if (h_5_7b2_d == . | h_5_7b2_d == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_d = .v if (h_5_8b_d == . | h_5_8b_d == .a)
replace h_5_8b2_d = .v if (h_5_8b2_d == . | h_5_8b2_d == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_d = .v if (h_6_1a_d == . | h_6_1a_d == .a)
replace h_6_1b1_d = .v if (h_6_1b1_d == . | h_6_1b1_d == .a)
replace h_6_1b2_d = .v if (h_6_1b2_d == . | h_6_1b2_d == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_41_d = .v if (h_6_41_d == . | h_6_41_d == .a)
replace h_6_42_d = .v if (h_6_42_d == . | h_6_42_d == .a)
replace h_6_43_d = .v if (h_6_43_d == . | h_6_43_d == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_d = .v if (h_6_5a_d == . | h_6_5a_d == .a)
replace h_6_5b1_d = .v if (h_6_5b1_d == . | h_6_5b1_d == .a)
replace h_6_5b2_d = .v if (h_6_5b2_d == . | h_6_5b2_d == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_d = .v if (h_6_6a_d == . | h_6_6a_d == .a)
replace h_6_6b1_d = .v if (h_6_6b1_d == . | h_6_6b1_d == .a)
replace h_6_6b2_d = .v if (h_6_6b2_d == . | h_6_6b2_d == .a)
replace h_7_1_d = .v if (h_7_1_d == . | h_7_1_d == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)


*questions that are not country specific are repeated, but that shouldn't affect anything


capture log close
log using HouseholdMissingCodebook, text replace

codebook

   save HouseholdMissing, replace


log close
exit, clear
