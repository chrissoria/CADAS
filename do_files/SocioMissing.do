clear all 
set more off
capture log close
log using SocioMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Socio.dta", clear
   

   
replace s_2_9a = .i if (s_2_9a == . | s_2_9a == .a) & s_2_9 ~= 1

replace s_2_12 = .i if (s_2_12 == . | s_2_12 == .a) & (s_2_11 ~=7 & s_2_11 ~= 8 & s_2_11 ~= 9)

replace s_3_3_c = ".i" if (s_3_3_c == "" | s_3_3_c == ".")& (s_3_1_c ~= 4 & s_country == 2)

replace s_3_3_p = ".i" if (s_3_3_p == "" | s_3_3_p == "." )& ((s_3_1_p ~= 2 & s_3_1_p ~= 4) & s_country == 0)

replace s_3_3_d = ".i" if (s_3_3_d == "" | s_3_3_d == "." )& ((s_3_1_d ~= 2 & s_3_1_d ~= 3 & s_3_1_d ~= 4) & s_country == 1)

replace s_3_18 = .i if (s_3_18 == . | s_3_18 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)
*line 14 should not have answered this

replace s_3_19_1 = .i if (s_3_19_1 == . | s_3_19_1 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)

replace s_3_19_2 = .i if (s_3_19_2 == . | s_3_19_2 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)
*line 1 should have answered this

replace s_4_3 = .i if (s_4_3 == . | s_4_3 == .a) & (s_4_2 ~= 1 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_6 = .i if (s_4_6 == . | s_4_6 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_7 = .i if (s_4_7 == . | s_4_7 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_13 = .i if (s_4_13 == . | s_4_13 == .a) & (s_4_12 ~= 2 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_16 = .i if (s_4_16 == . | s_4_16 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_17 = .i if (s_4_17 == . | s_4_17 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_22 = .i if (s_4_22 == . | s_4_22 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_1 = .i if (s_4_23_1 == . | s_4_23_1 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_2 = .i if (s_4_23_2 == . | s_4_23_2 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_27_1 = .i if (s_4_27_1 == . | s_4_27_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_27_2 = .i if (s_4_27_2 == . | s_4_27_2 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & s_4_27_1 ~= 88 & s_4_27_1 ~= 99)

replace s_4_27a = .i if (s_4_27a == . | s_4_27a == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & (s_4_27_1 == 88 | s_4_27_1 == 99 | s_4_27_1 == .i))

replace s_4_29_1 = .i if (s_4_29_1 == . | s_4_29_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_29_2 = .i if (s_4_29_2 == . | s_4_29_2 == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & s_4_29_1 ~= 88 & s_4_29_1 ~= 99)

replace s_4_29a = .i if (s_4_29a == . | s_4_29a == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & (s_4_29_1 == 88 | s_4_29_1 == 99 | s_4_29_1 == .i))

replace s_5_3 = .i if (s_5_3 == . | s_5_3 == .a) & (s_5_2 ~= 2 & s_5_2 ~= 8 & s_5_2 ~= 9)

replace s_6_2 = .i if (s_6_2 == . | s_6_2 == .a) & (s_6_1 ~= 2 & s_6_1 ~= 8 & s_6_1 ~= 9)

replace s_6_4 = .i if (s_6_4 == . | s_6_4 == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_5_p = .i if (s_6_5_p == . | s_6_5_p == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 0)

replace s_6_5_d = .i if (s_6_5_d == . | s_6_5_d == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 1)

replace s_6_5_c = .i if (s_6_5_c == . | s_6_5_c == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 2)

replace s_6_6 = .i if (s_6_6 == . | s_6_6 == .a) & (s_6_1 == 1 | s_6_1 == 7 | s_6_3 == 1 | s_6_3 == 7)

replace s_7_2a = .i if (s_7_2a == . | s_7_2a == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2b = .i if (s_7_2b == . | s_7_2b == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2c = .i if (s_7_2c == . | s_7_2c == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

/*
replace s_7_7a = .i if (s_7_7a == . | s_7_7a == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7b = .i if (s_7_7b == . | s_7_7b == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7c = .i if (s_7_7c == . | s_7_7c == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7d = .i if (s_7_7d == . | s_7_7d == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7e = .i if (s_7_7e == . | s_7_7e == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7f = .i if (s_7_7f == . | s_7_7f == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7g = .i if (s_7_7g == . | s_7_7g == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7h = .i if (s_7_7h == . | s_7_7h == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7i = .i if (s_7_7i == . | s_7_7i == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7j = .i if (s_7_7j == . | s_7_7j == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7k = .i if (s_7_7k == . | s_7_7k == .a) & (s_7_6a < 6 | s_7_6b < 5)
*/

replace s_8_2 = .i if (s_8_2 == . | s_8_2 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3 = .i if (s_8_3 == . | s_8_3 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3a = ".i" if (s_8_3a == "" | s_8_3a == ".") & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_4 = .i if (s_8_4 == . | s_8_4 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_5a = .i if (s_8_5a == . | s_8_5a == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

/*
replace s_8_5b1 = .i if (s_8_5b1 == . | s_8_5b1 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b2 = .i if (s_8_5b2 == . | s_8_5b2 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b3 = .i if (s_8_5b3 == . | s_8_5b3 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b4 = .i if (s_8_5b4 == . | s_8_5b4 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b5 = .i if (s_8_5b5 == . | s_8_5b5 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b6 = .i if (s_8_5b6 == . | s_8_5b6 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b7 = .i if (s_8_5b7 == . | s_8_5b7 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b8 = .i if (s_8_5b8 == . | s_8_5b8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b9 = .i if (s_8_5b9 == . | s_8_5b9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b10 = .i if (s_8_5b10 == . | s_8_5b10 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))
*/

replace s_8_5c = .i if (s_8_5c == . | s_8_5c == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 8))

replace s_8_5d = .i if (s_8_5d == . | s_8_5d == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 2 & s_8_5a ~= 3 & s_8_5a ~= 8))

replace s_8_7 = .i if (s_8_7 == . | s_8_7 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_8 = .i if (s_8_8 == . | s_8_8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_9 = .i if (s_8_9 == . | s_8_9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_10 = .i if (s_8_10 == . | s_8_10 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_11 = .i if (s_8_11 == . | s_8_11 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_12 = .i if (s_8_12 == . | s_8_12 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_13 = .i if (s_8_13 == . | s_8_13 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_14 = .i if (s_8_14 == . | s_8_14 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_15 = .i if (s_8_15 == . | s_8_15 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_16 = .i if (s_8_16 == . | s_8_16 == .a) & (s_2_9 ~= 1)

replace s_9_6 = .i if (s_9_6 == . | s_9_6 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_7 = .i if (s_9_7 == . | s_9_7 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_9 = .i if (s_9_9 == . | s_9_9 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_11 = .i if (s_9_11 == . | s_9_11 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_15 = .i if (s_9_15 == . | s_9_15 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_16 = .i if (s_9_16 == . | s_9_16 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_18 = .i if (s_9_18 == . | s_9_18 == .a) & (s_9_17 ~= 2 & s_9_17 ~= 8 & s_9_17 ~= 9)

replace s_9_21a = .i if (s_9_21a == . | s_9_21a == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_21b = ".i" if (s_9_21b == "" | s_9_21b == ".") & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_22 = .i if (s_9_22 == . | s_9_22 == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_24 = .i if (s_9_24 == . | s_9_24 == .a) & (s_sex ~= 0)

replace s_9_25 = .i if (s_9_25 == . | s_9_25 == .a) & (s_9_24 ~= 1)

replace s_9_26 = .i if (s_9_26 == . | s_9_26 == .a) & (s_9_24 ~= 1)

replace s_9_28 = .i if (s_9_28 == . | s_9_28 == .a) & (s_9_24 ~= 1)

replace s_9_29 = .i if (s_9_29 == . | s_9_29 == .a) & (s_9_24 ~= 1)

replace s_9_31 = .i if (s_9_31 == . | s_9_31 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_32 = .i if (s_9_32 == . | s_9_32 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_33 = .i if (s_9_33 == . | s_9_33 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

/*
replace s_9_38a = .i if (s_9_38a == . | s_9_38a == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38b = .i if (s_9_38b == . | s_9_38b == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38c = .i if (s_9_38c == . | s_9_38c == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38d = .i if (s_9_38d == . | s_9_38d == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38e = .i if (s_9_38e == . | s_9_38e == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38f = .i if (s_9_38f == . | s_9_38f == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38g = .i if (s_9_38g == . | s_9_38g == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38h = .i if (s_9_38h == . | s_9_38h == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38i = .i if (s_9_38i == . | s_9_38i == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38j = .i if (s_9_38j == . | s_9_38j == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38k = .i if (s_9_38k == . | s_9_38k == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38l = .i if (s_9_38l == . | s_9_38l == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)
*/

replace s_9_39 = .i if (s_9_39 == . | s_9_39 == .a ) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_43a = .i if (s_9_43a == . | s_9_43a == .a) & (s_9_42 ~= 2 & s_9_42 ~= 8 & s_9_42 ~= 9)

replace s_9_45a = .i if (s_9_45a == . | s_9_45a == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_46 = .i if (s_9_46 == . | s_9_46 == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_48 = .i if (s_9_48 == . | s_9_48 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_49 = .i if (s_9_49 == . | s_9_49 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_50 = .i if (s_9_50 == . | s_9_50 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_53 = .i if (s_9_53 == . | s_9_53 == .a) & (s_sex ~= 0)

replace s_9_54 = .i if (s_9_54 == . | s_9_54 == .a) & (s_sex ~= 0)

replace s_9_55 = .i if (s_9_55 == . | s_9_55 == .a) & (s_sex ~= 1)

replace s_9_56 = .i if (s_9_56 == . | s_9_56 == .a) & (s_sex ~= 1)

replace s_9_57 = .i if (s_9_57 == . | s_9_57 == .a) & (s_sex ~= 0)

replace s_9_58 = .i if (s_9_58 == . | s_9_58 == .a) & (s_sex ~= 0)

replace s_9_59 = .i if (s_9_59 == . | s_9_59 == .a) & (s_sex ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_60 = .i if (s_9_60 == . | s_9_60 == .a) & (s_sex ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_61 = .i if (s_9_61 == . | s_9_61 == .a) & (s_sex ~= 0)

replace s_9_61a = .i if (s_9_61a == . | s_9_61a == .a) & (s_sex ~= 0 & (s_9_61 == 88 | s_9_61 == 99))

replace s_9_62 = .i if (s_9_62 == . | s_9_62 == .a) & (s_sex ~= 0 & s_9_61 ~= 97)

replace s_9_64_1 = .i if (s_9_64_1 == . | s_9_64_1 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_2 = .i if (s_9_64_2 == . | s_9_64_2 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_3 = .i if (s_9_64_3 == . | s_9_64_3 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_4 = .i if (s_9_64_4 == . | s_9_64_4 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_65 = .i if (s_9_65 == . | s_9_65 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)


*10.1 not answered by anyone



replace s_10_6_1a = .i if (s_10_6_1a == . | s_10_6_1a == .a) & (s_10_6_1 ~= 2 & s_10_6_1 ~= 8 & s_10_6_1 ~= 9)

replace s_10_6_2a = .i if (s_10_6_2a == . | s_10_6_2a == .a) & (s_10_6_2 ~= 2 & s_10_6_2 ~= 8 & s_10_6_2 ~= 9)

replace s_10_6_3a = .i if (s_10_6_3a == . | s_10_6_3a == .a) & (s_10_6_3 ~= 2 & s_10_6_3 ~= 8 & s_10_6_3 ~= 9 & s_10_6_3 ~= 7)

replace s_10_6_4a = .i if (s_10_6_4a == . | s_10_6_4a == .a) & (s_10_6_4 ~= 2 & s_10_6_4 ~= 8 & s_10_6_4 ~= 9)

replace s_11_2 = .i if (s_11_2 == . | s_11_2 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_11_3 = .i if (s_11_3 == . | s_11_3 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_12_1b = .i if (s_12_1b == . | s_12_1b == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_1c = .i if (s_12_1c == . | s_12_1c == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_2c = .i if (s_12_2c == . | s_12_2c == .a) & (s_12_2a ~= 2 & s_12_2a ~= 6 & s_12_2a ~= 7 & s_12_2a ~= 8 & s_12_2a ~= 9)

replace s_12_3c = .i if (s_12_3c == . | s_12_3c == .a) & (s_12_3a ~= 2 & s_12_3a ~= 6 & s_12_3a ~= 7 & s_12_3a ~= 8 & s_12_3a ~= 9)

replace s_12_4b = .i if (s_12_4b == . | s_12_4b == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_4c = .i if (s_12_4c == . | s_12_4c == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_5c = .i if (s_12_5c == . | s_12_5c == .a) & (s_12_5a ~= 2 & s_12_5a ~= 6 & s_12_5a ~= 7 & s_12_5a ~= 8 & s_12_5a ~= 9)

replace s_12_6c = .i if (s_12_6c == . | s_12_6c == .a) & (s_12_6a ~= 2 & s_12_6a ~= 6 & s_12_6a ~= 7 & s_12_6a ~= 8 & s_12_6a ~= 9)

replace s_12_13 = .i if (s_12_13 == . | s_12_13 == .a) & (s_12_11 ~= 2)

replace s_12_14 = .i if (s_12_14 == . | s_12_14 == .a) & (s_12_11 ~= 2)

replace s_12_15 = .i if (s_12_15 == . | s_12_15 == .a) & (s_12_11 ~= 2)

replace s_13_1_p_c = .i if (s_13_1_p_c == . | s_13_1_p_c == .a) & (s_country ~= 1)

replace s_13_1_d = .i if (s_13_1_d == . | s_13_1_d == .a) & (s_country ~= 0 & s_country ~= 2)

replace s_13_2 = .i if (s_13_2 == . | s_13_2 == .a) & (s_13_1_p_c == 1 | s_13_1_d == 1 | (s_13_1_p_c == .i & s_13_1_d == .i))

replace s_13_3_p_c = .i if (s_13_3_p_c == . | s_13_3_p_c == .a) & ((s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9) & s_country ~= 1)

replace s_13_3_d = .i if (s_13_3_d == . | s_13_3_d == .a) & ((s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9) & s_country == 1)

replace s_13_4 = .i if (s_13_4 == . | s_13_4 == .a) & (s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9 & s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9 & s_13_3_p_c ~= 1 & s_13_3_d ~= 1)

replace s_13_5 = .i if (s_13_5 == . | s_13_5 == .a) & (s_13_3_p_c == 1 | s_13_3_d == 1 | (s_13_3_p_c == .i & s_13_3_d == .i))
*come back to s_13_5

replace s_13_6_p_c = .i if (s_13_6_p_c == . | s_13_6_p_c == .a) & ((s_13_5 == 1 | s_13_5 == .i) & s_country ~= 1)

replace s_13_6_d = .i if (s_13_6_d == . | s_13_6_d == .a) & ((s_13_5 == 1 | s_13_5 == .i) & s_country == 1)

*come back to s_13_6

replace s_13_7_p_c = .i if (s_13_7_p_c == . | s_13_7_p_c == .a) & ((s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9) & s_country ~= 1)

replace s_13_7_d = .i if (s_13_7_d == . | s_13_7_d == .a) & ((s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9) & s_country == 1)

*s_13_1 through s_13_7 are weird since they depend on which country

replace s_13_9 = .i if (s_13_9 == . | s_13_9 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_10 = .i if (s_13_10 == . | s_13_10 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9 & s_13_9 ~= 2 & s_13_9 ~= 8 & s_13_9 ~= 9)

replace s_13_11 = .i if (s_13_11 == . | s_13_11 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_12 = .i if (s_13_12 == . | s_13_12 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_20 = .i if (s_13_20 == . | s_13_20 == .a) & (s_13_19 ~= 2 & s_13_19 ~= 8 & s_13_19 ~= 9)

replace s_14_1_p_d = .i if (s_14_1_p_d == . | s_14_1_p_d == .a) & (s_country ~= 2)

/*
replace s_14_2a_p = .i if (s_14_2a_p == . | s_14_2a_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2b_p = .i if (s_14_2b_p == . | s_14_2b_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_p = .i if (s_14_2c_p == . | s_14_2c_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_p = .i if (s_14_2d_p == . | s_14_2d_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_p = .i if (s_14_2e_p == . | s_14_2e_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_p = .i if (s_14_2f_p == . | s_14_2f_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_p = .i if (s_14_2g_p == . | s_14_2g_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2h_p = .i if (s_14_2h_p == . | s_14_2h_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2i_p = .i if (s_14_2i_p == . | s_14_2i_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2j_p = .i if (s_14_2j_p == . | s_14_2j_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2a_d = .i if (s_14_2a_d == . | s_14_2a_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2b_d = .i if (s_14_2b_d == . | s_14_2b_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_d = .i if (s_14_2c_d == . | s_14_2c_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_d = .i if (s_14_2d_d == . | s_14_2d_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_d = .i if (s_14_2e_d == . | s_14_2e_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_d = .i if (s_14_2f_d == . | s_14_2f_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_d = .i if (s_14_2g_d == . | s_14_2g_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)
*/
*i think s_14_1b_p is mislabeled in do file and data dictionary, should be s_14_2b_p




replace s_14_4 = .i if (s_14_4 == . | s_14_4 == .a) & (s_14_3 ~= 2 & s_14_3 ~= 8 & s_14_3 ~= 9)

replace s_14_12 = .i if (s_14_12 == . | s_14_12 == .a) & (s_14_11 ~= 00 & s_14_11 ~= 88 & s_14_11 ~= 99)

replace s_14_14 = .i if (s_14_14 == . | s_14_14 == .a) & (s_14_13 ~= 00 & s_14_13 ~= 88 & s_14_13 ~= 99)

replace s_14_16 = .i if (s_14_16 == . | s_14_16 == .a) & (s_14_15 ~= 0 & s_14_15 ~= 88 & s_14_15 ~= 99)
*ninguna is 0 in 14.15 instead of 00 (14.11 and 14.13 have 00)
*line 11, 17 and 22 should not have answered this

replace s_14_18_1 = .i if (s_14_18_1 == . | s_14_18_1 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_2 = .i if (s_14_18_2 == . | s_14_18_2 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_3 = .i if (s_14_18_3 == . | s_14_18_3 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_4 = .i if (s_14_18_4 == . | s_14_18_4 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_5 = .i if (s_14_18_5 == . | s_14_18_5 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_6 = .i if (s_14_18_6 == . | s_14_18_6 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_22 = .i if (s_14_22 == . | s_14_22 == .a) & (s_14_20 ~= 00 & s_14_20 ~= 88 & s_14_20 ~= 99)

replace s_14_24 = .i if (s_14_24 == . | s_14_24 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_25 = .i if (s_14_25 == . | s_14_25 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_30b1_p = .i if (s_14_30b1_p == . | s_14_30b1_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 0)

replace s_14_30b1_d = .i if (s_14_30b1_d == . | s_14_30b1_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 1)

*replace s_14_30b1_c = .i if (s_14_30b1_c == . | s_14_30b1_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 2)

replace s_14_30b2_p = .i if (s_14_30b2_p == . | s_14_30b2_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 2 | s_14_30b1_p == .i))

replace s_14_30b2_d = .i if (s_14_30b2_d == . | s_14_30b2_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 2 | s_14_30b1_d == .i))

*replace s_14_30b2_c = .i if (s_14_30b2_c == . | s_14_30b2_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 2 | s_14_30b1_c == .i))

replace s_14_30b3_p = .i if (s_14_30b3_p == . | s_14_30b3_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 1 | s_14_30b1_p == .i))

replace s_14_30b3_d = .i if (s_14_30b3_d == . | s_14_30b3_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 1 | s_14_30b1_d == .i))

*replace s_14_30b3_c = .i if (s_14_30b3_c == . | s_14_30b3_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 1 | s_14_30b1_c == .i))

replace s_14_32 = .i if (s_14_32 == . | s_14_32 == .a) & (s_14_31 ~= 2 & s_14_31 ~= 8 & s_14_31 ~= 9)

replace s_15_2 = .i if (s_15_2 == . | s_15_2 == .a) & s_15_1 ~= 0




*country based valid skips

replace s_1_1_p = .v if (s_1_1_p == . | s_1_1_p == .a) & s_country ~= 0
replace s_1_1_d = .v if (s_1_1_d == . | s_1_1_d == .a) & s_country ~= 1
replace s_1_1_c = .v if (s_1_1_c == . | s_1_1_c == .a) & s_country ~= 2
replace s_2_14_p = .v if (s_2_14_p == . | s_2_14_p == .a) & s_country ~= 0
replace s_2_14_d = .v if (s_2_14_d == . | s_2_14_d == .a) & s_country ~= 1
replace s_2_14_c = .v if (s_2_14_c == . | s_2_14_c == .a) & s_country ~= 2
replace s_2_15_p = .v if (s_2_15_p == . | s_2_15_p == .a) & s_country ~= 0
replace s_2_15_d = .v if (s_2_15_d == . | s_2_15_d == .a) & s_country ~= 1
replace s_2_15_c = .v if (s_2_15_c == . | s_2_15_c == .a) & s_country ~= 2
replace s_3_1_p = .v if (s_3_1_p == . | s_3_1_p == .a) & s_country ~= 0
replace s_3_1_d = .v if (s_3_1_d == . | s_3_1_d == .a) & s_country ~= 1
replace s_3_1_c = .v if (s_3_1_c == . | s_3_1_c == .a) & s_country ~= 2
replace s_3_3_p = ".v" if (s_3_3_p == "" | s_3_3_p == ".") & s_country ~= 0
replace s_3_3_d = ".v" if (s_3_3_d == "" | s_3_3_d == ".") & s_country ~= 1
replace s_3_3_c = ".v" if (s_3_3_c == "" | s_3_3_c == ".") & s_country ~= 2
replace s_6_5_p = .v if (s_6_5_p == . | s_6_5_p == .a) & s_country ~= 0
replace s_6_5_d = .v if (s_6_5_d == . | s_6_5_d == .a) & s_country ~= 1
replace s_6_5_c = .v if (s_6_5_c == . | s_6_5_c == .a) & s_country ~= 2
replace s_13_1_p_c = .v if (s_13_1_p_c == . | s_13_1_p_c == .a) & s_country == 1
replace s_13_1_d = .v if (s_13_1_d == . | s_13_1_d == .a) & s_country ~= 1
replace s_13_3_p_c = .v if (s_13_3_p_c == . | s_13_3_p_c == .a) & s_country == 1
replace s_13_3_d = .v if (s_13_3_d == . | s_13_3_d == .a) & s_country ~= 1
replace s_13_6_p_c = .v if (s_13_6_p_c == . | s_13_6_p_c == .a) & s_country == 1
replace s_13_6_d = .v if (s_13_6_d == . | s_13_6_d == .a) & s_country ~= 1
replace s_13_7_p_c = .v if (s_13_7_p_c == . | s_13_7_p_c == .a) & s_country == 1
replace s_13_7_d = .v if (s_13_7_d == . | s_13_7_d == .a) & s_country ~= 1
replace s_13_23_p = .v if (s_13_23_p == . | s_13_23_p == .a) & s_country ~= 0
replace s_13_23_d_c = .v if (s_13_23_d_c == . | s_13_23_d_c == .a) & s_country == 0
replace s_13_25_d_c = .v if (s_13_25_d_c == . | s_13_25_d_c == .a) & s_country == 0
replace s_13_25_p = .v if (s_13_25_p == . | s_13_25_p == .a) & s_country ~= 0
replace s_13_27_d_c = .v if (s_13_27_d_c == . | s_13_27_d_c == .a) & s_country == 0
replace s_13_27_p = .v if (s_13_27_p == . | s_13_27_p == .a) & s_country ~= 0
replace s_13_30_d_c = .v if (s_13_30_d_c == . | s_13_30_d_c == .a) & s_country == 0
replace s_13_30_p = .v if (s_13_30_p == . | s_13_30_p == .a) & s_country ~= 0
replace s_14_1_p_d = .v if (s_14_1_p_d == . | s_14_1_p_d == .a) & s_country == 2
replace s_14_2a_p = .v if (s_14_2a_p == 0 | s_14_2a_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2b_p = .v if (s_14_2b_p == 0 | s_14_2b_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2c_p = .v if (s_14_2c_p == 0 | s_14_2c_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2d_p = .v if (s_14_2d_p == 0 | s_14_2d_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2e_p = .v if (s_14_2e_p == 0 | s_14_2e_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2f_p = .v if (s_14_2f_p == 0 | s_14_2f_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2g_p = .v if (s_14_2g_p == 0 | s_14_2g_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2h_p = .v if (s_14_2h_p == 0 | s_14_2h_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2i_p = .v if (s_14_2i_p == 0 | s_14_2i_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2j_p = .v if (s_14_2j_p == 0 | s_14_2j_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2a_d = .v if (s_14_2a_d == 0 | s_14_2a_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2b_d = .v if (s_14_2b_d == 0 | s_14_2b_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2c_d = .v if (s_14_2c_d == 0 | s_14_2c_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2d_d = .v if (s_14_2d_d == 0 | s_14_2d_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2e_d = .v if (s_14_2e_d == 0 | s_14_2e_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2f_d = .v if (s_14_2f_d == 0 | s_14_2f_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2g_d = .v if (s_14_2g_d == 0 | s_14_2g_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_30b1_p = .v if (s_14_30b1_p == . | s_14_30b1_p == .a) & s_country ~= 0
replace s_14_30b1_d = .v if (s_14_30b1_d == . | s_14_30b1_d == .a) & s_country ~= 1
*replace s_14_30b1_c = .v if (s_14_30b1_c == . | s_14_30b1_c == .a) & s_country ~= 2
replace s_14_30b2_p = .v if (s_14_30b2_p == . | s_14_30b2_p == .a) & s_country ~= 0
replace s_14_30b2_d = .v if (s_14_30b2_d == . | s_14_30b2_d == .a) & s_country ~= 1
*replace s_14_30b2_c = .v if (s_14_30b2_c == . | s_14_30b2_c == .a) & s_country ~= 2
replace s_14_30b3_p = .v if (s_14_30b3_p == . | s_14_30b3_p == .a) & s_country ~= 0
replace s_14_30b3_d = .v if (s_14_30b3_d == . | s_14_30b3_d == .a) & s_country ~= 1
*replace s_14_30b3_c = .v if (s_14_30b3_c == . | s_14_30b3_c == .a) & s_country ~= 2




*if a skippable question is missing but not invalid, then it is valid

replace s_2_9a = .v if (s_2_9a == . | s_2_9a == .a)
replace s_2_12 = .v if (s_2_12 == . | s_2_12 == .a)
replace s_3_3_c = ".v" if (s_3_3_c == "" | s_3_3_c == ".")
replace s_3_3_p = ".v" if (s_3_3_p == "" | s_3_3_p == ".")
replace s_3_3_d = ".v" if (s_3_3_d == "" | s_3_3_d == ".")
replace s_3_18 = .v if (s_3_18 == . | s_3_18 == .a)
replace s_3_19_1 = .v if (s_3_19_1 == . | s_3_19_1 == .a)
replace s_3_19_2 = .v if (s_3_19_2 == . | s_3_19_2 == .a)
replace s_4_3 = .v if (s_4_3 == . | s_4_3 == .a)
replace s_4_6 = .v if (s_4_6 == . | s_4_6 == .a)
replace s_4_7 = .v if (s_4_7 == . | s_4_7 == .a)
replace s_4_13 = .v if (s_4_13 == . | s_4_13 == .a)
replace s_4_16 = .v if (s_4_16 == . | s_4_16 == .a)
replace s_4_17 = .v if (s_4_17 == . | s_4_17 == .a)
replace s_4_22 = .v if (s_4_22 == . | s_4_22 == .a)
replace s_4_23_1 = .v if (s_4_23_1 == . | s_4_23_1 == .a)
replace s_4_23_2 = .v if (s_4_23_2 == . | s_4_23_2 == .a)
replace s_4_27_1 = .v if (s_4_27_1 == . | s_4_27_1 == .a)
replace s_4_27_2 = .v if (s_4_27_2 == . | s_4_27_2 == .a)
replace s_4_27a = .v if (s_4_27a == . | s_4_27a == .a)
replace s_4_29_1 = .v if (s_4_29_1 == . | s_4_29_1 == .a)
replace s_4_29_2 = .v if (s_4_29_2 == . | s_4_29_2 == .a)
replace s_4_29a = .v if (s_4_29a == . | s_4_29a == .a)
replace s_5_3 = .v if (s_5_3 == . | s_5_3 == .a)
replace s_6_2 = .v if (s_6_2 == . | s_6_2 == .a)
replace s_6_4 = .v if (s_6_4 == . | s_6_4 == .a)
replace s_6_5_p = .v if (s_6_5_p == . | s_6_5_p == .a)
replace s_6_5_d = .v if (s_6_5_d == . | s_6_5_d == .a)
replace s_6_5_c = .v if (s_6_5_c == . | s_6_5_c == .a)
replace s_6_6 = .v if (s_6_6 == . | s_6_6 == .a)
replace s_7_2a = .v if (s_7_2a == . | s_7_2a == .a)
replace s_7_2b = .v if (s_7_2b == . | s_7_2b == .a)
replace s_7_2c = .v if (s_7_2c == . | s_7_2c == .a)
replace s_7_7a = .v if (s_7_7a == 0 | s_7_7a == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7b = .v if (s_7_7b == 0 | s_7_7b == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7c = .v if (s_7_7c == 0 | s_7_7c == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7d = .v if (s_7_7d == 0 | s_7_7d == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7e = .v if (s_7_7e == 0 | s_7_7e == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7f = .v if (s_7_7f == 0 | s_7_7f == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7g = .v if (s_7_7g == 0 | s_7_7g == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7h = .v if (s_7_7h == 0 | s_7_7h == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7i = .v if (s_7_7i == 0 | s_7_7i == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7j = .v if (s_7_7j == 0 | s_7_7j == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7k = .v if (s_7_7k == 0 | s_7_7k == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_8_2 = .v if (s_8_2 == . | s_8_2 == .a)
replace s_8_3 = .v if (s_8_3 == . | s_8_3 == .a)
replace s_8_3a = ".v" if (s_8_3a == "" | s_8_3a == ".")
replace s_8_4 = .v if (s_8_4 == . | s_8_4 == .a)
replace s_8_5a = .v if (s_8_5a == . | s_8_5a == .a)
replace s_8_5b1 = .v if (s_8_5b1 == 0 | s_8_5b1 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b2 = .v if (s_8_5b2 == 0 | s_8_5b2 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b3 = .v if (s_8_5b3 == 0 | s_8_5b3 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b4 = .v if (s_8_5b4 == 0 | s_8_5b4 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b5 = .v if (s_8_5b5 == 0 | s_8_5b5 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b6 = .v if (s_8_5b6 == 0 | s_8_5b6 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b7 = .v if (s_8_5b7 == 0 | s_8_5b7 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b8 = .v if (s_8_5b8 == 0 | s_8_5b8 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b9 = .v if (s_8_5b9 == 0 | s_8_5b9 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
*replace s_8_5b10 = .v if (s_8_5b10 == 0 | s_8_5b10 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5c = .v if (s_8_5c == . | s_8_5c == .a)
replace s_8_5d = .v if (s_8_5d == . | s_8_5d == .a)
replace s_8_7 = .v if (s_8_7 == . | s_8_7 == .a)
replace s_8_8 = .v if (s_8_8 == . | s_8_8 == .a)
replace s_8_9 = .v if (s_8_9 == . | s_8_9 == .a)
replace s_8_10 = .v if (s_8_10 == . | s_8_10 == .a)
replace s_8_11 = .v if (s_8_11 == . | s_8_11 == .a)
replace s_8_12 = .v if (s_8_12 == . | s_8_12 == .a)
replace s_8_13 = .v if (s_8_13 == . | s_8_13 == .a)
replace s_8_14 = .v if (s_8_14 == . | s_8_14 == .a)
replace s_8_15 = .v if (s_8_15 == . | s_8_15 == .a)
replace s_8_16 = .v if (s_8_16 == . | s_8_16 == .a)
replace s_9_6 = .v if (s_9_6 == . | s_9_6 == .a)
replace s_9_7 = .v if (s_9_7 == . | s_9_7 == .a)
replace s_9_9 = .v if (s_9_9 == . | s_9_9 == .a)
replace s_9_11 = .v if (s_9_11 == . | s_9_11 == .a)
replace s_9_15 = .v if (s_9_15 == . | s_9_15 == .a)
replace s_9_16 = .v if (s_9_16 == . | s_9_16 == .a)
replace s_9_18 = .v if (s_9_18 == . | s_9_18 == .a)
replace s_9_21a = .v if (s_9_21a == . | s_9_21a == .a)
replace s_9_21b = ".v" if (s_9_21b == "" | s_9_21b == ".")
replace s_9_22 = .v if (s_9_22 == . | s_9_22 == .a)
replace s_9_24 = .v if (s_9_24 == . | s_9_24 == .a)
replace s_9_25 = .v if (s_9_25 == . | s_9_25 == .a)
replace s_9_26 = .v if (s_9_26 == . | s_9_26 == .a)
replace s_9_28 = .v if (s_9_28 == . | s_9_28 == .a)
replace s_9_29 = .v if (s_9_29 == . | s_9_29 == .a)
replace s_9_31 = .v if (s_9_31 == . | s_9_31 == .a)
replace s_9_32 = .v if (s_9_32 == . | s_9_32 == .a)
replace s_9_33 = .v if (s_9_33 == . | s_9_33 == .a)
replace s_9_38a = .v if (s_9_38a == 0 | s_9_38a == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38b = .v if (s_9_38b == 0 | s_9_38b == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38c = .v if (s_9_38c == 0 | s_9_38c == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38d = .v if (s_9_38d == 0 | s_9_38d == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38e = .v if (s_9_38e == 0 | s_9_38e == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38f = .v if (s_9_38f == 0 | s_9_38f == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38g = .v if (s_9_38g == 0 | s_9_38g == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38h = .v if (s_9_38h == 0 | s_9_38h == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38i = .v if (s_9_38i == 0 | s_9_38i == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38j = .v if (s_9_38j == 0 | s_9_38j == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38k = .v if (s_9_38k == 0 | s_9_38k == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38l = .v if (s_9_38l == 0 | s_9_38l == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_39 = .v if (s_9_39 == . | s_9_39 == .a)
replace s_9_43a = .v if (s_9_43a == . | s_9_43a == .a)
replace s_9_45a = .v if (s_9_45a == . | s_9_45a == .a)
replace s_9_46 = .v if (s_9_46 == . | s_9_46 == .a)
replace s_9_48 = .v if (s_9_48 == . | s_9_48 == .a)
replace s_9_49 = .v if (s_9_49 == . | s_9_49 == .a)
replace s_9_50 = .v if (s_9_50 == . | s_9_50 == .a)
replace s_9_53 = .v if (s_9_53 == . | s_9_53 == .a)
replace s_9_54 = .v if (s_9_54 == . | s_9_54 == .a)
replace s_9_55 = .v if (s_9_55 == . | s_9_55 == .a)
replace s_9_56 = .v if (s_9_56 == . | s_9_56 == .a)
replace s_9_57 = .v if (s_9_57 == . | s_9_57 == .a)
replace s_9_58 = .v if (s_9_58 == . | s_9_58 == .a)
replace s_9_59 = .v if (s_9_59 == . | s_9_59 == .a)
replace s_9_60 = .v if (s_9_60 == . | s_9_60 == .a)
replace s_9_61 = .v if (s_9_61 == . | s_9_61 == .a)
replace s_9_61a = .v if (s_9_61a == . | s_9_61a == .a)
replace s_9_62 = .v if (s_9_62 == . | s_9_62 == .a)
replace s_9_64_1 = .v if (s_9_64_1 == . | s_9_64_1 == .a)
replace s_9_64_2 = .v if (s_9_64_2 == . | s_9_64_2 == .a)
replace s_9_64_3 = .v if (s_9_64_3 == . | s_9_64_3 == .a)
replace s_9_64_4 = .v if (s_9_64_4 == . | s_9_64_4 == .a)
replace s_9_65 = .v if (s_9_65 == . | s_9_65 == .a)
replace s_10_6_1a = .v if (s_10_6_1a == . | s_10_6_1a == .a)
replace s_10_6_2a = .v if (s_10_6_2a == . | s_10_6_2a == .a)
replace s_10_6_3a = .v if (s_10_6_3a == . | s_10_6_3a == .a)
replace s_10_6_4a = .v if (s_10_6_4a == . | s_10_6_4a == .a)
replace s_11_2 = .v if (s_11_2 == . | s_11_2 == .a)
replace s_11_3 = .v if (s_11_3 == . | s_11_3 == .a)
replace s_12_1b = .v if (s_12_1b == . | s_12_1b == .a)
replace s_12_1c = .v if (s_12_1c == . | s_12_1c == .a)
replace s_12_2c = .v if (s_12_2c == . | s_12_2c == .a)
replace s_12_3c = .v if (s_12_3c == . | s_12_3c == .a)
replace s_12_4b = .v if (s_12_4b == . | s_12_4b == .a)
replace s_12_4c = .v if (s_12_4c == . | s_12_4c == .a)
replace s_12_5c = .v if (s_12_5c == . | s_12_5c == .a)
replace s_12_6c = .v if (s_12_6c == . | s_12_6c == .a)
replace s_12_13 = .v if (s_12_13 == . | s_12_13 == .a)
replace s_12_14 = .v if (s_12_14 == . | s_12_14 == .a)
replace s_12_15 = .v if (s_12_15 == . | s_12_15 == .a)
replace s_13_1_p_c = .v if (s_13_1_p_c == . | s_13_1_p_c == .a)
replace s_13_1_d = .v if (s_13_1_d == . | s_13_1_d == .a)
replace s_13_2 = .v if (s_13_2 == . | s_13_2 == .a)
replace s_13_3_p_c = .v if (s_13_3_p_c == . | s_13_3_p_c == .a)
replace s_13_3_d = .v if (s_13_3_d == . | s_13_3_d == .a)
replace s_13_4 = .v if (s_13_4 == . | s_13_4 == .a)
replace s_13_5 = .v if (s_13_5 == . | s_13_5 == .a)
replace s_13_6_p_c = .v if (s_13_6_p_c == . | s_13_6_p_c == .a)
replace s_13_6_d = .v if (s_13_6_d == . | s_13_6_d == .a)
replace s_13_7_p_c = .v if (s_13_7_p_c == . | s_13_7_p_c == .a)
replace s_13_7_d = .v if (s_13_7_d == . | s_13_7_d == .a)
replace s_13_9 = .v if (s_13_9 == . | s_13_9 == .a)
replace s_13_10 = .v if (s_13_10 == . | s_13_10 == .a)
replace s_13_11 = .v if (s_13_11 == . | s_13_11 == .a)
replace s_13_12 = .v if (s_13_12 == . | s_13_12 == .a)
replace s_13_20 = .v if (s_13_20 == . | s_13_20 == .a)
replace s_14_1_p_d = .v if (s_14_1_p_d == . | s_14_1_p_d == .a)
/*
replace s_14_2a_p = .v if (s_14_2a_p == . | s_14_2a_p == .a)
replace s_14_2b_p = .v if (s_14_2b_p == . | s_14_2b_p == .a)
replace s_14_2c_p = .v if (s_14_2c_p == . | s_14_2c_p == .a)
replace s_14_2d_p = .v if (s_14_2d_p == . | s_14_2d_p == .a)
replace s_14_2e_p = .v if (s_14_2e_p == . | s_14_2e_p == .a)
replace s_14_2f_p = .v if (s_14_2f_p == . | s_14_2f_p == .a)
replace s_14_2g_p = .v if (s_14_2g_p == . | s_14_2g_p == .a)
replace s_14_2h_p = .v if (s_14_2h_p == . | s_14_2h_p == .a)
replace s_14_2i_p = .v if (s_14_2i_p == . | s_14_2i_p == .a)
replace s_14_2j_p = .v if (s_14_2j_p == . | s_14_2j_p == .a)
replace s_14_2a_d = .v if (s_14_2a_d == . | s_14_2a_d == .a)
replace s_14_2b_d = .v if (s_14_2b_d == . | s_14_2b_d == .a)
replace s_14_2c_d = .v if (s_14_2c_d == . | s_14_2c_d == .a)
replace s_14_2d_d = .v if (s_14_2d_d == . | s_14_2d_d == .a)
replace s_14_2e_d = .v if (s_14_2e_d == . | s_14_2e_d == .a)
replace s_14_2f_d = .v if (s_14_2f_d == . | s_14_2f_d == .a)
replace s_14_2g_d = .v if (s_14_2g_d == . | s_14_2g_d == .a)
*/
replace s_14_4 = .v if (s_14_4 == . | s_14_4 == .a)
replace s_14_12 = .v if (s_14_12 == . | s_14_12 == .a)
replace s_14_14 = .v if (s_14_14 == . | s_14_14 == .a)
replace s_14_16 = .v if (s_14_16 == . | s_14_16 == .a)
replace s_14_18_1 = .v if (s_14_18_1 == . | s_14_18_1 == .a)
replace s_14_18_2 = .v if (s_14_18_2 == . | s_14_18_2 == .a)
replace s_14_18_3 = .v if (s_14_18_3 == . | s_14_18_3 == .a)
replace s_14_18_4 = .v if (s_14_18_4 == . | s_14_18_4 == .a)
replace s_14_18_5 = .v if (s_14_18_5 == . | s_14_18_5 == .a)
replace s_14_18_6 = .v if (s_14_18_6 == . | s_14_18_6 == .a)
replace s_14_22 = .v if (s_14_22 == . | s_14_22 == .a)
replace s_14_24 = .v if (s_14_24 == . | s_14_24 == .a)
replace s_14_25 = .v if (s_14_25 == . | s_14_25 == .a)
replace s_14_30b1_p = .v if (s_14_30b1_p == . | s_14_30b1_p == .a)
replace s_14_30b1_d = .v if (s_14_30b1_d == . | s_14_30b1_d == .a)
*replace s_14_30b1_c = .v if (s_14_30b1_c == . | s_14_30b1_c == .a)
replace s_14_30b2_p = .v if (s_14_30b2_p == . | s_14_30b2_p == .a)
replace s_14_30b2_d = .v if (s_14_30b2_d == . | s_14_30b2_d == .a)
*replace s_14_30b2_c = .v if (s_14_30b2_c == . | s_14_30b2_c == .a)
replace s_14_30b3_p = .v if (s_14_30b3_p == . | s_14_30b3_p == .a)
replace s_14_30b3_d = .v if (s_14_30b3_d == . | s_14_30b3_d == .a)
*replace s_14_30b3_c = .v if (s_14_30b3_c == . | s_14_30b3_c == .a)
replace s_14_32 = .v if (s_14_32 == . | s_14_32 == .a)
replace s_15_2 = .v if (s_15_2 == . | s_15_2 == .a)



*all remaining . are converted to .i

replace s_interid = .i if (s_interid == . | s_interid == .a)
replace s_houseid = .i if (s_houseid == . | s_houseid == .a)
replace s_particid = .i if (s_particid == . | s_particid == .a)
replace s_clustid = .i if (s_clustid == . | s_clustid == .a)
replace s_country = .i if (s_country == . | s_country == .a)
replace s_houseid2 = .i if (s_houseid2 == . | s_houseid2 == .a)
replace s_conglid2 = .i if (s_conglid2 == . | s_conglid2 == .a)
replace s_particid2 = ".i" if s_particid2 == ""
replace s_sex = .i if (s_sex == . | s_sex == .a)
replace s_deviceid1 = ".i" if s_deviceid1 == ""
replace s_1_1_p = .i if (s_1_1_p == . | s_1_1_p == .a)
replace s_1_1_d = .i if (s_1_1_d == . | s_1_1_d == .a)
replace s_1_1_c = .i if (s_1_1_c == . | s_1_1_c == .a)
replace s_1_2 = ".i" if (s_1_2 == "" | s_1_2 == ".")
replace s_2_3 = .i if (s_2_3 == . | s_2_3 == .a)
replace s_2_8c = .i if (s_2_8c == . | s_2_8c == .a)
replace s_2_9 = .i if (s_2_9 == . | s_2_9 == .a)
replace s_2_9a = .i if (s_2_9a == . | s_2_9a == .a)
replace s_2_10 = .i if (s_2_10 == . | s_2_10 == .a)
replace s_2_11 = .i if (s_2_11 == . | s_2_11 == .a)
replace s_2_12 = .i if (s_2_12 == . | s_2_12 == .a)
replace s_2_13 = .i if (s_2_13 == . | s_2_13 == .a)
replace s_2_14_p = .i if (s_2_14_p == . | s_2_14_p == .a)
replace s_2_14_d = .i if (s_2_14_d == . | s_2_14_d == .a)
replace s_2_14_c = .i if (s_2_14_c == . | s_2_14_c == .a)
replace s_2_15_p = .i if (s_2_15_p == . | s_2_15_p == .a)
replace s_2_15_d = .i if (s_2_15_d == . | s_2_15_d == .a)
replace s_2_15_c = .i if (s_2_15_c == . | s_2_15_c == .a)
replace s_2_16 = ".i" if (s_2_16 == "" | s_2_16 == ".")
replace s_3_0 = .i if (s_3_0 == . | s_3_0 == .a)
replace s_3_1_p = .i if (s_3_1_p == . | s_3_1_p == .a)
replace s_3_1_d = .i if (s_3_1_d == . | s_3_1_d == .a)
replace s_3_1_c = .i if (s_3_1_c == . | s_3_1_c == .a)
replace s_3_2 = .i if (s_3_2 == . | s_3_2 == .a)
replace s_3_3_p = ".i" if (s_3_3_p == "" | s_3_3_p == ".")
replace s_3_3_d = ".i" if (s_3_3_d == "" | s_3_3_d == ".")
replace s_3_3_c = ".i" if (s_3_3_c == "" | s_3_3_c == ".")
replace s_3_4 = .i if (s_3_4 == . | s_3_4 == .a)
replace s_3_5 = .i if (s_3_5 == . | s_3_5 == .a)
replace s_3_6 = .i if (s_3_6 == . | s_3_6 == .a)
replace s_3_7 = .i if (s_3_7 == . | s_3_7 == .a)
replace s_3_8 = .i if (s_3_8 == . | s_3_8 == .a)
replace s_3_9 = .i if (s_3_9 == . | s_3_9 == .a)
replace s_3_11 = .i if (s_3_11 == . | s_3_11 == .a)
replace s_3_12_1 = .i if (s_3_12_1 == . | s_3_12_1 == .a)
replace s_3_12_2 = .i if (s_3_12_2 == . | s_3_12_2 == .a)
replace s_3_12_3 = .i if (s_3_12_3 == . | s_3_12_3 == .a)
replace s_3_12_6 = .i if (s_3_12_6 == . | s_3_12_6 == .a)
replace s_3_12_8 = .i if (s_3_12_8 == . | s_3_12_8 == .a)
replace s_3_13 = .i if (s_3_13 == . | s_3_13 == .a)
replace s_3_17 = .i if (s_3_17 == . | s_3_17 == .a)
replace s_3_18 = .i if (s_3_18 == . | s_3_18 == .a)
replace s_3_19_1 = .i if (s_3_19_1 == . | s_3_19_1 == .a)
replace s_3_19_2 = .i if (s_3_19_2 == . | s_3_19_2 == .a)
replace s_4_1 = .i if (s_4_1 == . | s_4_1 == .a)
replace s_4_2 = .i if (s_4_2 == . | s_4_2 == .a)
replace s_4_3 = .i if (s_4_3 == . | s_4_3 == .a)
replace s_4_6 = .i if (s_4_6 == . | s_4_6 == .a)
replace s_4_7 = .i if (s_4_7 == . | s_4_7 == .a)
replace s_4_8 = .i if (s_4_8 == . | s_4_8 == .a)
replace s_4_11 = .i if (s_4_11 == . | s_4_11 == .a)
replace s_4_12 = .i if (s_4_12 == . | s_4_12 == .a)
replace s_4_13 = .i if (s_4_13 == . | s_4_13 == .a)
replace s_4_16 = .i if (s_4_16 == . | s_4_16 == .a)
replace s_4_17 = .i if (s_4_17 == . | s_4_17 == .a)
replace s_4_18 = .i if (s_4_18 == . | s_4_18 == .a)
replace s_4_20 = .i if (s_4_20 == . | s_4_20 == .a)
replace s_4_21 = .i if (s_4_21 == . | s_4_21 == .a)
replace s_4_22 = .i if (s_4_22 == . | s_4_22 == .a)
replace s_4_23_1 = .i if (s_4_23_1 == . | s_4_23_1 == .a)
replace s_4_23_2 = .i if (s_4_23_2 == . | s_4_23_2 == .a)
replace s_4_26 = .i if (s_4_26 == . | s_4_26 == .a)
replace s_4_27_1 = .i if (s_4_27_1 == . | s_4_27_1 == .a)
replace s_4_27_2 = .i if (s_4_27_2 == . | s_4_27_2 == .a)
replace s_4_27a = .i if (s_4_27a == . | s_4_27a == .a)
replace s_4_28 = .i if (s_4_28 == . | s_4_28 == .a)
replace s_4_29_1 = .i if (s_4_29_1 == . | s_4_29_1 == .a)
replace s_4_29_2 = .i if (s_4_29_2 == . | s_4_29_2 == .a)
replace s_4_29a = .i if (s_4_29a == . | s_4_29a == .a)
replace s_5_1 = .i if (s_5_1 == . | s_5_1 == .a)
replace s_5_2 = .i if (s_5_2 == . | s_5_2 == .a)
replace s_5_3 = .i if (s_5_3 == . | s_5_3 == .a)
replace s_5_4 = .i if (s_5_4 == . | s_5_4 == .a)
replace s_5_5 = .i if (s_5_5 == . | s_5_5 == .a)
replace s_6_1 = .i if (s_6_1 == . | s_6_1 == .a)
replace s_6_2 = .i if (s_6_2 == . | s_6_2 == .a)
replace s_6_3 = .i if (s_6_3 == . | s_6_3 == .a)
replace s_6_4 = .i if (s_6_4 == . | s_6_4 == .a)
replace s_6_5_p = .i if (s_6_5_p == . | s_6_5_p == .a)
replace s_6_5_d = .i if (s_6_5_d == . | s_6_5_d == .a)
replace s_6_5_c = .i if (s_6_5_c == . | s_6_5_c == .a)
replace s_6_6 = .i if (s_6_6 == . | s_6_6 == .a)
replace s_6_7 = .i if (s_6_7 == . | s_6_7 == .a)
replace s_7_0 = .i if (s_7_0 == . | s_7_0 == .a)
replace s_7_1 = .i if (s_7_1 == . | s_7_1 == .a)
replace s_7_2a = .i if (s_7_2a == . | s_7_2a == .a)
replace s_7_2b = .i if (s_7_2b == . | s_7_2b == .a)
replace s_7_2c = .i if (s_7_2c == . | s_7_2c == .a)
replace s_7_3 = .i if (s_7_3 == . | s_7_3 == .a)
replace s_7_4a = .i if (s_7_4a == . | s_7_4a == .a)
replace s_7_4b = .i if (s_7_4b == . | s_7_4b == .a)
replace s_7_4c = .i if (s_7_4c == . | s_7_4c == .a)
replace s_7_5a = .i if (s_7_5a == . | s_7_5a == .a)
replace s_7_5b = .i if (s_7_5b == . | s_7_5b == .a)
replace s_7_5c = .i if (s_7_5c == . | s_7_5c == .a)
replace s_7_6a = .i if (s_7_6a == . | s_7_6a == .a)
replace s_7_6b = .i if (s_7_6b == . | s_7_6b == .a)
/*
replace s_7_7a = .i if (s_7_7a == . | s_7_7a == .a)
replace s_7_7b = .i if (s_7_7b == . | s_7_7b == .a)
replace s_7_7c = .i if (s_7_7c == . | s_7_7c == .a)
replace s_7_7d = .i if (s_7_7d == . | s_7_7d == .a)
replace s_7_7e = .i if (s_7_7e == . | s_7_7e == .a)
replace s_7_7f = .i if (s_7_7f == . | s_7_7f == .a)
replace s_7_7g = .i if (s_7_7g == . | s_7_7g == .a)
replace s_7_7h = .i if (s_7_7h == . | s_7_7h == .a)
replace s_7_7i = .i if (s_7_7i == . | s_7_7i == .a)
replace s_7_7j = .i if (s_7_7j == . | s_7_7j == .a)
replace s_7_7k = .i if (s_7_7k == . | s_7_7k == .a)
*/
replace s_8_1 = .i if (s_8_1 == . | s_8_1 == .a)
replace s_8_2 = .i if (s_8_2 == . | s_8_2 == .a)
replace s_8_3 = .i if (s_8_3 == . | s_8_3 == .a)
replace s_8_3a = ".i" if (s_8_3a == "" | s_8_3a == ".")
replace s_8_4 = .i if (s_8_4 == . | s_8_4 == .a)
replace s_8_5a = .i if (s_8_5a == . | s_8_5a == .a)
/*
replace s_8_5b2 = .i if (s_8_5b2 == . | s_8_5b2 == .a)
replace s_8_5b1 = .i if (s_8_5b1 == . | s_8_5b1 == .a)
replace s_8_5b4 = .i if (s_8_5b4 == . | s_8_5b4 == .a)
replace s_8_5b3 = .i if (s_8_5b3 == . | s_8_5b3 == .a)
replace s_8_5b5 = .i if (s_8_5b5 == . | s_8_5b5 == .a)
replace s_8_5b6 = .i if (s_8_5b6 == . | s_8_5b6 == .a)
replace s_8_5b7 = .i if (s_8_5b7 == . | s_8_5b7 == .a)
replace s_8_5b8 = .i if (s_8_5b8 == . | s_8_5b8 == .a)
replace s_8_5b9 = .i if (s_8_5b9 == . | s_8_5b9 == .a)
replace s_8_5b10 = .i if (s_8_5b10 == . | s_8_5b10 == .a)
*/
replace s_8_5c = .i if (s_8_5c == . | s_8_5c == .a)
replace s_8_5d = .i if (s_8_5d == . | s_8_5d == .a)
replace s_8_7 = .i if (s_8_7 == . | s_8_7 == .a)
replace s_8_8 = .i if (s_8_8 == . | s_8_8 == .a)
replace s_8_9 = .i if (s_8_9 == . | s_8_9 == .a)
replace s_8_10 = .i if (s_8_10 == . | s_8_10 == .a)
replace s_8_11 = .i if (s_8_11 == . | s_8_11 == .a)
replace s_8_12 = .i if (s_8_12 == . | s_8_12 == .a)
replace s_8_13 = .i if (s_8_13 == . | s_8_13 == .a)
replace s_8_14 = .i if (s_8_14 == . | s_8_14 == .a)
replace s_8_15 = .i if (s_8_15 == . | s_8_15 == .a)
replace s_8_16 = .i if (s_8_16 == . | s_8_16 == .a)
replace s_9_1 = .i if (s_9_1 == . | s_9_1 == .a)
replace s_9_3 = .i if (s_9_3 == . | s_9_3 == .a)
replace s_9_4 = .i if (s_9_4 == . | s_9_4 == .a)
replace s_9_5 = .i if (s_9_5 == . | s_9_5 == .a)
replace s_9_6 = .i if (s_9_6 == . | s_9_6 == .a)
replace s_9_7 = .i if (s_9_7 == . | s_9_7 == .a)
replace s_9_8 = .i if (s_9_8 == . | s_9_8 == .a)
replace s_9_9 = .i if (s_9_9 == . | s_9_9 == .a)
replace s_9_11 = .i if (s_9_11 == . | s_9_11 == .a)
replace s_9_13 = .i if (s_9_13 == . | s_9_13 == .a)
replace s_9_14 = .i if (s_9_14 == . | s_9_14 == .a)
replace s_9_15 = .i if (s_9_15 == . | s_9_15 == .a)
replace s_9_16 = .i if (s_9_16 == . | s_9_16 == .a)
replace s_9_17 = .i if (s_9_17 == . | s_9_17 == .a)
replace s_9_18 = .i if (s_9_18 == . | s_9_18 == .a)
replace s_9_19 = .i if (s_9_19 == . | s_9_19 == .a)
replace s_9_20 = .i if (s_9_20 == . | s_9_20 == .a)
replace s_9_21a = .i if (s_9_21a == . | s_9_21a == .a)
replace s_9_21b = ".i" if (s_9_21b == "" | s_9_21b == ".")
replace s_9_22 = .i if (s_9_22 == . | s_9_22 == .a)
replace s_9_23 = .i if (s_9_23 == . | s_9_23 == .a)
replace s_9_24 = .i if (s_9_24 == . | s_9_24 == .a)
replace s_9_25 = .i if (s_9_25 == . | s_9_25 == .a)
replace s_9_26 = .i if (s_9_26 == . | s_9_26 == .a)
replace s_9_28 = .i if (s_9_28 == . | s_9_28 == .a)
replace s_9_29 = .i if (s_9_29 == . | s_9_29 == .a)
replace s_9_30 = .i if (s_9_30 == . | s_9_30 == .a)
replace s_9_31 = .i if (s_9_31 == . | s_9_31 == .a)
replace s_9_32 = .i if (s_9_32 == . | s_9_32 == .a)
replace s_9_33 = .i if (s_9_33 == . | s_9_33 == .a)
replace s_9_35 = .i if (s_9_35 == . | s_9_35 == .a)
replace s_9_36 = .i if (s_9_36 == . | s_9_36 == .a)
replace s_9_37 = .i if (s_9_37 == . | s_9_37 == .a)
/*
replace s_9_38a = .i if (s_9_38a == . | s_9_38a == .a)
replace s_9_38g = .i if (s_9_38g == . | s_9_38g == .a)
replace s_9_38b = .i if (s_9_38b == . | s_9_38b == .a)
replace s_9_38f = .i if (s_9_38f == . | s_9_38f == .a)
replace s_9_38c = .i if (s_9_38c == . | s_9_38c == .a)
replace s_9_38d = .i if (s_9_38d == . | s_9_38d == .a)
replace s_9_38j = .i if (s_9_38j == . | s_9_38j == .a)
replace s_9_38e = .i if (s_9_38e == . | s_9_38e == .a)
replace s_9_38k = .i if (s_9_38k == . | s_9_38k == .a)
replace s_9_38h = .i if (s_9_38h == . | s_9_38h == .a)
replace s_9_38l = .i if (s_9_38l == . | s_9_38l == .a)
replace s_9_38i = .i if (s_9_38i == . | s_9_38i == .a)
*/
replace s_9_39 = .i if (s_9_39 == . | s_9_39 == .a)
replace s_9_40 = .i if (s_9_40 == . | s_9_40 == .a)
replace s_9_41 = .i if (s_9_41 == . | s_9_41 == .a)
replace s_9_42 = .i if (s_9_42 == . | s_9_42 == .a)
replace s_9_43a = .i if (s_9_43a == . | s_9_43a == .a)
replace s_9_44 = .i if (s_9_44 == . | s_9_44 == .a)
replace s_9_45a = .i if (s_9_45a == . | s_9_45a == .a)
replace s_9_46 = .i if (s_9_46 == . | s_9_46 == .a)
replace s_9_47 = .i if (s_9_47 == . | s_9_47 == .a)
replace s_9_48 = .i if (s_9_48 == . | s_9_48 == .a)
replace s_9_49 = .i if (s_9_49 == . | s_9_49 == .a)
replace s_9_50 = .i if (s_9_50 == . | s_9_50 == .a)
replace s_9_51 = .i if (s_9_51 == . | s_9_51 == .a)
replace s_9_52 = .i if (s_9_52 == . | s_9_52 == .a)
replace s_9_53 = .i if (s_9_53 == . | s_9_53 == .a)
replace s_9_54 = .i if (s_9_54 == . | s_9_54 == .a)
replace s_9_55 = .i if (s_9_55 == . | s_9_55 == .a)
replace s_9_56 = .i if (s_9_56 == . | s_9_56 == .a)
replace s_9_57 = .i if (s_9_57 == . | s_9_57 == .a)
replace s_9_58 = .i if (s_9_58 == . | s_9_58 == .a)
replace s_9_59 = .i if (s_9_59 == . | s_9_59 == .a)
replace s_9_60 = .i if (s_9_60 == . | s_9_60 == .a)
replace s_9_61 = .i if (s_9_61 == . | s_9_61 == .a)
replace s_9_61a = .i if (s_9_61a == . | s_9_61a == .a)
replace s_9_62 = .i if (s_9_62 == . | s_9_62 == .a)
replace s_9_63 = .i if (s_9_63 == . | s_9_63 == .a)
replace s_9_64_1 = .i if (s_9_64_1 == . | s_9_64_1 == .a)
replace s_9_64_2 = .i if (s_9_64_2 == . | s_9_64_2 == .a)
replace s_9_64_3 = .i if (s_9_64_3 == . | s_9_64_3 == .a)
replace s_9_64_4 = .i if (s_9_64_4 == . | s_9_64_4 == .a)
replace s_9_65 = .i if (s_9_65 == . | s_9_65 == .a)
replace s_9_66 = .i if (s_9_66 == . | s_9_66 == .a)
replace s_10_1a = .i if (s_10_1a == . | s_10_1a == .a)
replace s_10_1b = .i if (s_10_1b == . | s_10_1b == .a)
replace s_10_1c = .i if (s_10_1c == . | s_10_1c == .a)
replace s_10_1d = .i if (s_10_1d == . | s_10_1d == .a)
replace s_10_1e = .i if (s_10_1e == . | s_10_1e == .a)
replace s_10_1f = .i if (s_10_1f == . | s_10_1f == .a)
replace s_10_1g = .i if (s_10_1g == . | s_10_1g == .a)
replace s_10_1h = .i if (s_10_1h == . | s_10_1h == .a)
replace s_10_2 = .i if (s_10_2 == . | s_10_2 == .a)
replace s_10_3 = .i if (s_10_3 == . | s_10_3 == .a)
replace s_10_4 = .i if (s_10_4 == . | s_10_4 == .a)
replace s_10_5 = .i if (s_10_5 == . | s_10_5 == .a)
replace s_10_6_1 = .i if (s_10_6_1 == . | s_10_6_1 == .a)
replace s_10_6_1a = .i if (s_10_6_1a == . | s_10_6_1a == .a)
replace s_10_6_2 = .i if (s_10_6_2 == . | s_10_6_2 == .a)
replace s_10_6_2a = .i if (s_10_6_2a == . | s_10_6_2a == .a)
replace s_10_6_3 = .i if (s_10_6_3 == . | s_10_6_3 == .a)
replace s_10_6_3a = .i if (s_10_6_3a == . | s_10_6_3a == .a)
replace s_10_6_4 = .i if (s_10_6_4 == . | s_10_6_4 == .a)
replace s_10_6_4a = .i if (s_10_6_4a == . | s_10_6_4a == .a)
replace s_10_7_1 = .i if (s_10_7_1 == . | s_10_7_1 == .a)
replace s_10_7_2 = .i if (s_10_7_2 == . | s_10_7_2 == .a)
replace s_11_1 = .i if (s_11_1 == . | s_11_1 == .a)
replace s_11_2 = .i if (s_11_2 == . | s_11_2 == .a)
replace s_11_3 = .i if (s_11_3 == . | s_11_3 == .a)
replace s_12_1a = .i if (s_12_1a == . | s_12_1a == .a)
replace s_12_1b = .i if (s_12_1b == . | s_12_1b == .a)
replace s_12_1c = .i if (s_12_1c == . | s_12_1c == .a)
replace s_12_2a = .i if (s_12_2a == . | s_12_2a == .a)
replace s_12_2c = .i if (s_12_2c == . | s_12_2c == .a)
replace s_12_3a = .i if (s_12_3a == . | s_12_3a == .a)
replace s_12_3c = .i if (s_12_3c == . | s_12_3c == .a)
replace s_12_4a = .i if (s_12_4a == . | s_12_4a == .a)
replace s_12_4b = .i if (s_12_4b == . | s_12_4b == .a)
replace s_12_4c = .i if (s_12_4c == . | s_12_4c == .a)
replace s_12_5a = .i if (s_12_5a == . | s_12_5a == .a)
replace s_12_5c = .i if (s_12_5c == . | s_12_5c == .a)
replace s_12_6a = .i if (s_12_6a == . | s_12_6a == .a)
replace s_12_6c = .i if (s_12_6c == . | s_12_6c == .a)
replace s_12_7 = .i if (s_12_7 == . | s_12_7 == .a)
replace s_12_8 = .i if (s_12_8 == . | s_12_8 == .a)
replace s_12_9 = .i if (s_12_9 == . | s_12_9 == .a)
replace s_12_10 = .i if (s_12_10 == . | s_12_10 == .a)
replace s_12_11 = .i if (s_12_11 == . | s_12_11 == .a)
replace s_12_13 = .i if (s_12_13 == . | s_12_13 == .a)
replace s_12_14 = .i if (s_12_14 == . | s_12_14 == .a)
replace s_12_15 = .i if (s_12_15 == . | s_12_15 == .a)
replace s_12_16 = .i if (s_12_16 == . | s_12_16 == .a)
replace s_13_1_p_c = .i if (s_13_1_p_c == . | s_13_1_p_c == .a)
replace s_13_1_d = .i if (s_13_1_d == . | s_13_1_d == .a)
replace s_13_2 = .i if (s_13_2 == . | s_13_2 == .a)
replace s_13_3_p_c = .i if (s_13_3_p_c == . | s_13_3_p_c == .a)
replace s_13_3_d = .i if (s_13_3_d == . | s_13_3_d == .a)
replace s_13_4 = .i if (s_13_4 == . | s_13_4 == .a)
replace s_13_5 = .i if (s_13_5 == . | s_13_5 == .a)
replace s_13_6_p_c = .i if (s_13_6_p_c == . | s_13_6_p_c == .a)
replace s_13_6_d = .i if (s_13_6_d == . | s_13_6_d == .a)
replace s_13_7_p_c = .i if (s_13_7_p_c == . | s_13_7_p_c == .a)
replace s_13_7_d = .i if (s_13_7_d == . | s_13_7_d == .a)
replace s_13_8 = .i if (s_13_8 == . | s_13_8 == .a)
replace s_13_9 = .i if (s_13_9 == . | s_13_9 == .a)
replace s_13_10 = .i if (s_13_10 == . | s_13_10 == .a)
replace s_13_11 = .i if (s_13_11 == . | s_13_11 == .a)
replace s_13_12 = .i if (s_13_12 == . | s_13_12 == .a)
replace s_13_13 = .i if (s_13_13 == . | s_13_13 == .a)
replace s_13_14 = .i if (s_13_14 == . | s_13_14 == .a)
replace s_13_15 = .i if (s_13_15 == . | s_13_15 == .a)
replace s_13_16 = .i if (s_13_16 == . | s_13_16 == .a)
replace s_13_17 = .i if (s_13_17 == . | s_13_17 == .a)
replace s_13_18 = .i if (s_13_18 == . | s_13_18 == .a)
replace s_13_19 = .i if (s_13_19 == . | s_13_19 == .a)
replace s_13_20 = .i if (s_13_20 == . | s_13_20 == .a)
replace s_13_22 = .i if (s_13_22 == . | s_13_22 == .a)
replace s_13_23_p = .i if (s_13_23_p == . | s_13_23_p == .a)
replace s_13_23_d_c = .i if (s_13_23_d_c == . | s_13_23_d_c == .a)
replace s_13_24 = .i if (s_13_24 == . | s_13_24 == .a)
replace s_13_25_d_c = .i if (s_13_25_d_c == . | s_13_25_d_c == .a)
replace s_13_25_p = .i if (s_13_25_p == . | s_13_25_p == .a)
replace s_13_26 = .i if (s_13_26 == . | s_13_26 == .a)
replace s_13_27_d_c = .i if (s_13_27_d_c == . | s_13_27_d_c == .a)
replace s_13_27_p = .i if (s_13_27_p == . | s_13_27_p == .a)
replace s_13_28 = .i if (s_13_28 == . | s_13_28 == .a)
replace s_13_29 = .i if (s_13_29 == . | s_13_29 == .a)
replace s_13_30_d_c = .i if (s_13_30_d_c == . | s_13_30_d_c == .a)
replace s_13_30_p = .i if (s_13_30_p == . | s_13_30_p == .a)
replace s_14_1_p_d = .i if (s_14_1_p_d == . | s_14_1_p_d == .a)
/*
replace s_14_2a_p = .i if (s_14_2a_p == . | s_14_2a_p == .a)
replace s_14_2b_p = .i if (s_14_2b_p == . | s_14_2b_p == .a)
replace s_14_2c_p = .i if (s_14_2c_p == . | s_14_2c_p == .a)
replace s_14_2d_p = .i if (s_14_2d_p == . | s_14_2d_p == .a)
replace s_14_2e_p = .i if (s_14_2e_p == . | s_14_2e_p == .a)
replace s_14_2f_p = .i if (s_14_2f_p == . | s_14_2f_p == .a)
replace s_14_2g_p = .i if (s_14_2g_p == . | s_14_2g_p == .a)
replace s_14_2h_p = .i if (s_14_2h_p == . | s_14_2h_p == .a)
replace s_14_2i_p = .i if (s_14_2i_p == . | s_14_2i_p == .a)
replace s_14_2j_p = .i if (s_14_2j_p == . | s_14_2j_p == .a)
replace s_14_2a_d = .i if (s_14_2a_d == . | s_14_2a_d == .a)
replace s_14_2b_d = .i if (s_14_2b_d == . | s_14_2b_d == .a)
replace s_14_2c_d = .i if (s_14_2c_d == . | s_14_2c_d == .a)
replace s_14_2d_d = .i if (s_14_2d_d == . | s_14_2d_d == .a)
replace s_14_2e_d = .i if (s_14_2e_d == . | s_14_2e_d == .a)
replace s_14_2f_d = .i if (s_14_2f_d == . | s_14_2f_d == .a)
replace s_14_2g_d = .i if (s_14_2g_d == . | s_14_2g_d == .a)
*/
replace s_14_3 = .i if (s_14_3 == . | s_14_3 == .a)
replace s_14_4 = .i if (s_14_4 == . | s_14_4 == .a)
replace s_14_5 = .i if (s_14_5 == . | s_14_5 == .a)
replace s_14_6 = .i if (s_14_6 == . | s_14_6 == .a)
replace s_14_8 = .i if (s_14_8 == . | s_14_8 == .a)
replace s_14_9 = .i if (s_14_9 == . | s_14_9 == .a)
replace s_14_11 = .i if (s_14_11 == . | s_14_11 == .a)
replace s_14_12 = .i if (s_14_12 == . | s_14_12 == .a)
replace s_14_13 = .i if (s_14_13 == . | s_14_13 == .a)
replace s_14_14 = .i if (s_14_14 == . | s_14_14 == .a)
replace s_14_15 = .i if (s_14_15 == . | s_14_15 == .a)
replace s_14_16 = .i if (s_14_16 == . | s_14_16 == .a)
replace s_14_17 = .i if (s_14_17 == . | s_14_17 == .a)
replace s_14_18_1 = .i if (s_14_18_1 == . | s_14_18_1 == .a)
replace s_14_18_2 = .i if (s_14_18_2 == . | s_14_18_2 == .a)
replace s_14_18_3 = .i if (s_14_18_3 == . | s_14_18_3 == .a)
replace s_14_18_4 = .i if (s_14_18_4 == . | s_14_18_4 == .a)
replace s_14_18_5 = .i if (s_14_18_5 == . | s_14_18_5 == .a)
replace s_14_18_6 = .i if (s_14_18_6 == . | s_14_18_6 == .a)
replace s_14_20 = .i if (s_14_20 == . | s_14_20 == .a)
replace s_14_22 = .i if (s_14_22 == . | s_14_22 == .a)
replace s_14_23 = .i if (s_14_23 == . | s_14_23 == .a)
replace s_14_24 = .i if (s_14_24 == . | s_14_24 == .a)
replace s_14_25 = .i if (s_14_25 == . | s_14_25 == .a)
replace s_14_30a = .i if (s_14_30a == . | s_14_30a == .a)
replace s_14_30b1_p = .i if (s_14_30b1_p == . | s_14_30b1_p == .a)
replace s_14_30b1_d = .i if (s_14_30b1_d == . | s_14_30b1_d == .a)
replace s_14_30b2_p = .i if (s_14_30b2_p == . | s_14_30b2_p == .a)
replace s_14_30b2_d = .i if (s_14_30b2_d == . | s_14_30b2_d == .a)
replace s_14_30b3_p = .i if (s_14_30b3_p == . | s_14_30b3_p == .a)
replace s_14_30b3_d = .i if (s_14_30b3_d == . | s_14_30b3_d == .a)
replace s_14_31 = .i if (s_14_31 == . | s_14_31 == .a)
replace s_14_32 = .i if (s_14_32 == . | s_14_32 == .a)
replace s_14_33 = .i if (s_14_33 == . | s_14_33 == .a)
replace s_15_1 = .i if (s_15_1 == . | s_15_1 == .a)
replace s_15_2 = .i if (s_15_2 == . | s_15_2 == .a)
replace s_15_3 = .i if (s_15_3 == . | s_15_3 == .a)
replace s_deviceid2 = ".i" if s_deviceid2 == ""




*drop all uppercase variables

drop S_*




*COUNTS NUMBER OF .i IN EACH OBSERVATION UNDER NEW VARIABLE CALLED s_countmissing
local i 1
gen s_countmissing = 0

quietly ds hhid pid s_8_5b2_delete s_time2 s_time1 s_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey s_deviceid2, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace s_countmissing = s_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace s_countmissing = s_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}




*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED s_last
local i 1
gen s_last = "AllAnswered"

quietly ds s_countmissing s_8_5b2_delete hhid pid s_last s_time2 s_time1 s_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey s_deviceid2, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if (`v'[`i'] == ".i" | `v'[`i'] == ".v") {
				continue
			}
			else {
				replace s_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace s_last = "`v'" in `i'
				continue, break
			}
		}
	}
}



gen s_TotalTime = (Clock(s_time2, "MDYhms") - Clock(s_time1, "MDYhms"))/1000/60



capture log close
log using SocioMissingCodebook, text replace

codebook

   save SocioMissing, replace


log close
log using SocioOnlyMissing, text replace

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

log close
exit, clear
