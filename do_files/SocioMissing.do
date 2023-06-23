clear all 
set more off
capture log close
log using SocioMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Socio.dta", clear
   

   
replace s_2_9a = .b if (s_2_9a == . | s_2_9a == .a) & s_2_9 ~= 1

replace s_2_12 = .b if (s_2_12 == . | s_2_12 == .a) & (s_2_11 ~=7 & s_2_11 ~= 8 & s_2_11 ~= 9)

replace s_3_3_c = ".b" if s_3_3_c == "" & s_3_1_c ~= 4

replace s_3_3_p = ".b" if s_3_3_p == "" & (s_3_1_p ~= 2 & s_3_1_p ~= 4)

replace s_3_3_d = ".b" if s_3_3_d == "" & (s_3_1_d ~= 2 & s_3_1_d ~= 3 & s_3_1_d ~= 4)

replace s_3_18 = .b if (s_3_18 == . | s_3_18 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)
*line 14 should not have answered this

replace s_3_19_1 = .b if (s_3_19_1 == . | s_3_19_1 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)

replace s_3_19_2 = .b if (s_3_19_2 == . | s_3_19_2 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)
*line 1 should have answered this

replace s_4_3 = .b if (s_4_3 == . | s_4_3 == .a) & (s_4_2 ~= 1 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_6 = .b if (s_4_6 == . | s_4_6 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_7 = .b if (s_4_7 == . | s_4_7 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_13 = .b if (s_4_13 == . | s_4_13 == .a) & (s_4_12 ~= 2 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_16 = .b if (s_4_16 == . | s_4_16 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_17 = .b if (s_4_17 == . | s_4_17 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_22 = .b if (s_4_22 == . | s_4_22 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_1 = .b if (s_4_23_1 == . | s_4_23_1 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_2 = .b if (s_4_23_2 == . | s_4_23_2 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_27_1 = .b if (s_4_27_1 == . | s_4_27_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_27_2 = .b if (s_4_27_2 == . | s_4_27_2 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & s_4_27_1 ~= 88 & s_4_27_1 ~= 99)

replace s_4_27a = .b if (s_4_27a == . | s_4_27a == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & (s_4_27_1 == 88 | s_4_27_1 == 99 | s_4_27_1 == .b))

replace s_4_29_1 = .b if (s_4_29_1 == . | s_4_29_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_29_2 = .b if (s_4_29_2 == . | s_4_29_2 == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & s_4_29_1 ~= 88 & s_4_29_1 ~= 99)

replace s_4_29a = .b if (s_4_29a == . | s_4_29a == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & (s_4_29_1 == 88 | s_4_29_1 == 99 | s_4_29_1 == .b))

replace s_5_3 = .b if (s_5_3 == . | s_5_3 == .a) & (s_5_2 ~= 2 & s_5_2 ~= 8 & s_5_2 ~= 9)

replace s_6_2 = .b if (s_6_2 == . | s_6_2 == .a) & (s_6_1 ~= 2 & s_6_1 ~= 8 & s_6_1 ~= 9)

replace s_6_4 = .b if (s_6_4 == . | s_6_4 == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_5_p = .b if (s_6_5_p == . | s_6_5_p == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_5_d = .b if (s_6_5_d == . | s_6_5_d == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_5_c = .b if (s_6_5_c == . | s_6_5_c == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_6 = .b if (s_6_6 == . | s_6_6 == .a) & (s_6_1 == 1 | s_6_1 == 7 | s_6_3 == 1 | s_6_3 == 7)

replace s_7_2a = .b if (s_7_2a == . | s_7_2a == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2b = .b if (s_7_2b == . | s_7_2b == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2c = .b if (s_7_2c == . | s_7_2c == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_7a = .b if (s_7_7a == . | s_7_7a == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7b = .b if (s_7_7b == . | s_7_7b == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7c = .b if (s_7_7c == . | s_7_7c == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7d = .b if (s_7_7d == . | s_7_7d == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7e = .b if (s_7_7e == . | s_7_7e == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7f = .b if (s_7_7f == . | s_7_7f == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7g = .b if (s_7_7g == . | s_7_7g == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7h = .b if (s_7_7h == . | s_7_7h == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7i = .b if (s_7_7i == . | s_7_7i == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7j = .b if (s_7_7j == . | s_7_7j == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7k = .b if (s_7_7k == . | s_7_7k == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_8_2 = .b if (s_8_2 == . | s_8_2 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3 = .b if (s_8_3 == . | s_8_3 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3a = ".b" if s_8_3a == "" & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_4 = .b if (s_8_4 == . | s_8_4 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_5a = .b if (s_8_5a == . | s_8_5a == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_5b1 = .b if (s_8_5b1 == . | s_8_5b1 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b2 = .b if (s_8_5b2 == . | s_8_5b2 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b3 = .b if (s_8_5b3 == . | s_8_5b3 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b4 = .b if (s_8_5b4 == . | s_8_5b4 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b5 = .b if (s_8_5b5 == . | s_8_5b5 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b6 = .b if (s_8_5b6 == . | s_8_5b6 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b7 = .b if (s_8_5b7 == . | s_8_5b7 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b8 = .b if (s_8_5b8 == . | s_8_5b8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b9 = .b if (s_8_5b9 == . | s_8_5b9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b10 = .b if (s_8_5b10 == . | s_8_5b10 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5c = .b if (s_8_5c == . | s_8_5c == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 8))

replace s_8_5d = .b if (s_8_5d == . | s_8_5d == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 2 & s_8_5a ~= 3 & s_8_5a ~= 8))

replace s_8_7 = .b if (s_8_7 == . | s_8_7 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_8 = .b if (s_8_8 == . | s_8_8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_9 = .b if (s_8_9 == . | s_8_9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_10 = .b if (s_8_10 == . | s_8_10 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_11 = .b if (s_8_11 == . | s_8_11 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_12 = .b if (s_8_12 == . | s_8_12 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_13 = .b if (s_8_13 == . | s_8_13 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_14 = .b if (s_8_14 == . | s_8_14 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_15 = .b if (s_8_15 == . | s_8_15 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_16 = .b if (s_8_16 == . | s_8_16 == .a) & (s_2_9 ~= 1)

replace s_9_6 = .b if (s_9_6 == . | s_9_6 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_7 = .b if (s_9_7 == . | s_9_7 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_9 = .b if (s_9_9 == . | s_9_9 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_11 = .b if (s_9_11 == . | s_9_11 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_15 = .b if (s_9_15 == . | s_9_15 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_16 = .b if (s_9_16 == . | s_9_16 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_18 = .b if (s_9_18 == . | s_9_18 == .a) & (s_9_17 ~= 2 & s_9_17 ~= 8 & s_9_17 ~= 9)

replace s_9_21a = .b if (s_9_21a == . | s_9_21a == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_21b = ".b" if s_9_21b == "" & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_22 = .b if (s_9_22 == . | s_9_22 == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_24 = .b if (s_9_24 == . | s_9_24 == .a) & (s_sex ~= 0)

replace s_9_25 = .b if (s_9_25 == . | s_9_25 == .a) & (s_9_24 ~= 1)

replace s_9_26 = .b if (s_9_26 == . | s_9_26 == .a) & (s_9_24 ~= 1)

replace s_9_28 = .b if (s_9_28 == . | s_9_28 == .a) & (s_9_24 ~= 1)

replace s_9_29 = .b if (s_9_29 == . | s_9_29 == .a) & (s_9_24 ~= 1)

replace s_9_31 = .b if (s_9_31 == . | s_9_31 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_32 = .b if (s_9_32 == . | s_9_32 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_33 = .b if (s_9_33 == . | s_9_33 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_38a = .b if (s_9_38a == . | s_9_38a == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38b = .b if (s_9_38b == . | s_9_38b == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38c = .b if (s_9_38c == . | s_9_38c == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38d = .b if (s_9_38d == . | s_9_38d == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38e = .b if (s_9_38e == . | s_9_38e == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38f = .b if (s_9_38f == . | s_9_38f == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38g = .b if (s_9_38g == . | s_9_38g == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38h = .b if (s_9_38h == . | s_9_38h == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38i = .b if (s_9_38i == . | s_9_38i == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38j = .b if (s_9_38j == . | s_9_38j == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38k = .b if (s_9_38k == . | s_9_38k == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38l = .b if (s_9_38l == . | s_9_38l == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_39 = .b if (s_9_39 == . | s_9_39 == .a ) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_43a = .b if (s_9_43a == . | s_9_43a == .a) & (s_9_42 ~= 2 & s_9_42 ~= 8 & s_9_42 ~= 9)

replace s_9_45a = .b if (s_9_45a == . | s_9_45a == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_46 = .b if (s_9_46 == . | s_9_46 == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_48 = .b if (s_9_48 == . | s_9_48 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_49 = .b if (s_9_49 == . | s_9_49 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_50 = .b if (s_9_50 == . | s_9_50 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_53 = .b if (s_9_53 == . | s_9_53 == .a) & (s_sex ~= 0)

replace s_9_54 = .b if (s_9_54 == . | s_9_54 == .a) & (s_sex ~= 0)

replace s_9_55 = .b if (s_9_55 == . | s_9_55 == .a) & (s_sex ~= 1)

replace s_9_56 = .b if (s_9_56 == . | s_9_56 == .a) & (s_sex ~= 1)

replace s_9_57 = .b if (s_9_57 == . | s_9_57 == .a) & (s_sex ~= 0)

replace s_9_58 = .b if (s_9_58 == . | s_9_58 == .a) & (s_sex ~= 0)

replace s_9_59 = .b if (s_9_59 == . | s_9_59 == .a) & (s_sex ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_60 = .b if (s_9_60 == . | s_9_60 == .a) & (s_sex ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_61 = .b if (s_9_61 == . | s_9_61 == .a) & (s_sex ~= 0)

replace s_9_61a = .b if (s_9_61a == . | s_9_61a == .a) & (s_sex ~= 0 & (s_9_61 == 88 | s_9_61 == 99))

replace s_9_62 = .b if (s_9_62 == . | s_9_62 == .a) & (s_sex ~= 0 & s_9_61 ~= 97)

replace s_9_64_1 = .b if (s_9_64_1 == . | s_9_64_1 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_2 = .b if (s_9_64_2 == . | s_9_64_2 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_3 = .b if (s_9_64_3 == . | s_9_64_3 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_4 = .b if (s_9_64_4 == . | s_9_64_4 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_65 = .b if (s_9_65 == . | s_9_65 == .a) & (s_sex ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)


*10.1 not answered by anyone



replace s_10_6_1a = .b if (s_10_6_1a == . | s_10_6_1a == .a) & (s_10_6_1 ~= 2 & s_10_6_1 ~= 8 & s_10_6_1 ~= 9)

replace s_10_6_2a = .b if (s_10_6_2a == . | s_10_6_2a == .a) & (s_10_6_2 ~= 2 & s_10_6_2 ~= 8 & s_10_6_2 ~= 9)

replace s_10_6_3a = .b if (s_10_6_3a == . | s_10_6_3a == .a) & (s_10_6_3 ~= 2 & s_10_6_3 ~= 8 & s_10_6_3 ~= 9 & s_10_6_3 ~= 7)

replace s_10_6_4a = .b if (s_10_6_4a == . | s_10_6_4a == .a) & (s_10_6_4 ~= 2 & s_10_6_4 ~= 8 & s_10_6_4 ~= 9)

replace s_11_2 = .b if (s_11_2 == . | s_11_2 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_11_3 = .b if (s_11_3 == . | s_11_3 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_12_1b = .b if (s_12_1b == . | s_12_1b == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_1c = .b if (s_12_1c == . | s_12_1c == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_2c = .b if (s_12_2c == . | s_12_2c == .a) & (s_12_2a ~= 2 & s_12_2a ~= 6 & s_12_2a ~= 7 & s_12_2a ~= 8 & s_12_2a ~= 9)

replace s_12_3c = .b if (s_12_3c == . | s_12_3c == .a) & (s_12_3a ~= 2 & s_12_3a ~= 6 & s_12_3a ~= 7 & s_12_3a ~= 8 & s_12_3a ~= 9)

replace s_12_4b = .b if (s_12_4b == . | s_12_4b == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_4c = .b if (s_12_4c == . | s_12_4c == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_5c = .b if (s_12_5c == . | s_12_5c == .a) & (s_12_5a ~= 2 & s_12_5a ~= 6 & s_12_5a ~= 7 & s_12_5a ~= 8 & s_12_5a ~= 9)

replace s_12_6c = .b if (s_12_6c == . | s_12_6c == .a) & (s_12_6a ~= 2 & s_12_6a ~= 6 & s_12_6a ~= 7 & s_12_6a ~= 8 & s_12_6a ~= 9)

replace s_12_13 = .b if (s_12_13 == . | s_12_13 == .a) & (s_12_11 ~= 2)

replace s_12_14 = .b if (s_12_14 == . | s_12_14 == .a) & (s_12_11 ~= 2)

replace s_12_15 = .b if (s_12_15 == . | s_12_15 == .a) & (s_12_11 ~= 2)

replace s_13_2 = .b if (s_13_2 == . | s_13_2 == .a) & (s_13_1_p_c == 1 | s_13_1_d == 1 | (s_13_1_p_c == .b & s_13_1_d == .b))

replace s_13_3_p_c = .b if (s_13_3_p_c == . | s_13_3_p_c == .a) & (s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9)

replace s_13_3_d = .b if (s_13_3_d == . | s_13_3_d == .a) & (s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9)

replace s_13_4 = .b if (s_13_4 == . | s_13_4 == .a) & (s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9 & s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9 & s_13_3_p_c ~= 1 & s_13_3_d ~= 1)

replace s_13_5 = .b if (s_13_5 == . | s_13_5 == .a) & (s_13_3_p_c == 1 | s_13_3_d == 1 | (s_13_3_p_c == .b & s_13_3_d == .b))
*come back to s_13_5

replace s_13_6_p_c = .b if (s_13_6_p_c == . | s_13_6_p_c == .a) & (s_13_5 == 1 | s_13_5 == .b)

replace s_13_6_d = .b if (s_13_6_d == . | s_13_6_d == .a) & (s_13_5 == 1 | s_13_5 == .b)

*come back to s_13_6

replace s_13_7_p_c = .b if (s_13_7_p_c == . | s_13_7_p_c == .a) & (s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9)

replace s_13_7_d = .b if (s_13_7_d == . | s_13_7_d == .a) & (s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9)

*s_13_1 through s_13_7 are weird since they depend on which country

replace s_13_9 = .b if (s_13_9 == . | s_13_9 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_10 = .b if (s_13_10 == . | s_13_10 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9 & s_13_9 ~= 2 & s_13_9 ~= 8 & s_13_9 ~= 9)

replace s_13_11 = .b if (s_13_11 == . | s_13_11 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_12 = .b if (s_13_12 == . | s_13_12 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_20 = .b if (s_13_20 == . | s_13_20 == .a) & (s_13_19 ~= 2 & s_13_19 ~= 8 & s_13_19 ~= 9)

replace s_14_1_p_d = .b if (s_14_1_p_d == . | s_14_1_p_d == .a) & (s_country ~= 2)

*14_2 all false, not sure if they didnt get answered or they were all intentionally marked false

replace s_14_2a_p = .b if (s_14_2a_p == . | s_14_2a_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_1b_p = .b if (s_14_1b_p == . | s_14_1b_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_p = .b if (s_14_2c_p == . | s_14_2c_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_p = .b if (s_14_2d_p == . | s_14_2d_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_p = .b if (s_14_2e_p == . | s_14_2e_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_p = .b if (s_14_2f_p == . | s_14_2f_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_p = .b if (s_14_2g_p == . | s_14_2g_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2h_p = .b if (s_14_2h_p == . | s_14_2h_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2i_p = .b if (s_14_2i_p == . | s_14_2i_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2j_p = .b if (s_14_2j_p == . | s_14_2j_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2a_d = .b if (s_14_2a_d == . | s_14_2a_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2b_d = .b if (s_14_2b_d == . | s_14_2b_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_d = .b if (s_14_2c_d == . | s_14_2c_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_d = .b if (s_14_2d_d == . | s_14_2d_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_d = .b if (s_14_2e_d == . | s_14_2e_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_d = .b if (s_14_2f_d == . | s_14_2f_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_d = .b if (s_14_2g_d == . | s_14_2g_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)
*i think s_14_1b_p is mislabeled in do file and data dictionary, should be s_14_2b_p




replace s_14_4 = .b if (s_14_4 == . | s_14_4 == .a) & (s_14_3 ~= 2 & s_14_3 ~= 8 & s_14_3 ~= 9)

replace s_14_12 = .b if (s_14_12 == . | s_14_12 == .a) & (s_14_11 ~= 00 & s_14_11 ~= 88 & s_14_11 ~= 99)

replace s_14_14 = .b if (s_14_14 == . | s_14_14 == .a) & (s_14_13 ~= 00 & s_14_13 ~= 88 & s_14_13 ~= 99)

replace s_14_16 = .b if (s_14_16 == . | s_14_16 == .a) & (s_14_15 ~= 0 & s_14_15 ~= 88 & s_14_15 ~= 99)
*ninguna is 0 in 14.15 instead of 00 (14.11 and 14.13 have 00)
*line 11, 17 and 22 should not have answered this

replace s_14_18_1 = .b if (s_14_18_1 == . | s_14_18_1 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_2 = .b if (s_14_18_2 == . | s_14_18_2 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_3 = .b if (s_14_18_3 == . | s_14_18_3 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_4 = .b if (s_14_18_4 == . | s_14_18_4 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_5 = .b if (s_14_18_5 == . | s_14_18_5 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_6 = .b if (s_14_18_6 == . | s_14_18_6 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_22 = .b if (s_14_22 == . | s_14_22 == .a) & (s_14_20 ~= 00 & s_14_20 ~= 88 & s_14_20 ~= 99)

replace s_14_24 = .b if (s_14_24 == . | s_14_24 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_25 = .b if (s_14_25 == . | s_14_25 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_30b1_p = .b if (s_14_30b1_p == . | s_14_30b1_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 0)

replace s_14_30b1_d = .b if (s_14_30b1_d == . | s_14_30b1_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 1)

*replace s_14_30b1_c = .b if (s_14_30b1_c == . | s_14_30b1_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 2)

replace s_14_30b2_p = .b if (s_14_30b2_p == . | s_14_30b2_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 2 | s_14_30b1_p == .b))

replace s_14_30b2_d = .b if (s_14_30b2_d == . | s_14_30b2_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 2 | s_14_30b1_d == .b))

*replace s_14_30b2_c = .b if (s_14_30b2_c == . | s_14_30b2_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 2 | s_14_30b1_c == .b))

replace s_14_30b3_p = .b if (s_14_30b3_p == . | s_14_30b3_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 1 | s_14_30b1_p == .b))

replace s_14_30b3_d = .b if (s_14_30b3_d == . | s_14_30b3_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 1 | s_14_30b1_d == .b))

*replace s_14_30b3_c = .b if (s_14_30b3_c == . | s_14_30b3_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 1 | s_14_30b1_c == .b))

replace s_14_32 = .b if (s_14_32 == . | s_14_32 == .a) & (s_14_31 ~= 2 & s_14_31 ~= 8 & s_14_31 ~= 9)

replace s_15_2 = .b if (s_15_2 == . | s_15_2 == .a) & s_15_1 ~= 0





replace s_2_9a = .v if (s_2_9a == . | s_2_9a == .a)
replace s_2_12 = .v if (s_2_12 == . | s_2_12 == .a)
replace s_3_3_c = ".v" if s_3_3_c == ""
replace s_3_3_p = ".v" if s_3_3_p == ""
replace s_3_3_d = ".v" if s_3_3_d == ""
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
replace s_7_7a = .v if (s_7_7a == . | s_7_7a == .a)
replace s_7_7b = .v if (s_7_7b == . | s_7_7b == .a)
replace s_7_7c = .v if (s_7_7c == . | s_7_7c == .a)
replace s_7_7d = .v if (s_7_7d == . | s_7_7d == .a)
replace s_7_7e = .v if (s_7_7e == . | s_7_7e == .a)
replace s_7_7f = .v if (s_7_7f == . | s_7_7f == .a)
replace s_7_7g = .v if (s_7_7g == . | s_7_7g == .a)
replace s_7_7h = .v if (s_7_7h == . | s_7_7h == .a)
replace s_7_7i = .v if (s_7_7i == . | s_7_7i == .a)
replace s_7_7j = .v if (s_7_7j == . | s_7_7j == .a)
replace s_7_7k = .v if (s_7_7k == . | s_7_7k == .a)
replace s_8_2 = .v if (s_8_2 == . | s_8_2 == .a)
replace s_8_3 = .v if (s_8_3 == . | s_8_3 == .a)
replace s_8_3a = ".v" if s_8_3a == ""
replace s_8_4 = .v if (s_8_4 == . | s_8_4 == .a)
replace s_8_5a = .v if (s_8_5a == . | s_8_5a == .a)
replace s_8_5b1 = .v if (s_8_5b1 == . | s_8_5b1 == .a)
replace s_8_5b2 = .v if (s_8_5b2 == . | s_8_5b2 == .a)
replace s_8_5b3 = .v if (s_8_5b3 == . | s_8_5b3 == .a)
replace s_8_5b4 = .v if (s_8_5b4 == . | s_8_5b4 == .a)
replace s_8_5b5 = .v if (s_8_5b5 == . | s_8_5b5 == .a)
replace s_8_5b6 = .v if (s_8_5b6 == . | s_8_5b6 == .a)
replace s_8_5b7 = .v if (s_8_5b7 == . | s_8_5b7 == .a)
replace s_8_5b8 = .v if (s_8_5b8 == . | s_8_5b8 == .a)
replace s_8_5b9 = .v if (s_8_5b9 == . | s_8_5b9 == .a)
replace s_8_5b10 = .v if (s_8_5b10 == . | s_8_5b10 == .a)
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
replace s_9_21b = ".v" if s_9_21b == ""
replace s_9_22 = .v if (s_9_22 == . | s_9_22 == .a)
replace s_9_24 = .v if (s_9_24 == . | s_9_24 == .a)
replace s_9_25 = .v if (s_9_25 == . | s_9_25 == .a)
replace s_9_26 = .v if (s_9_26 == . | s_9_26 == .a)
replace s_9_28 = .v if (s_9_28 == . | s_9_28 == .a)
replace s_9_29 = .v if (s_9_29 == . | s_9_29 == .a)
replace s_9_31 = .v if (s_9_31 == . | s_9_31 == .a)
replace s_9_32 = .v if (s_9_32 == . | s_9_32 == .a)
replace s_9_33 = .v if (s_9_33 == . | s_9_33 == .a)
replace s_9_38a = .v if (s_9_38a == . | s_9_38a == .a)
replace s_9_38b = .v if (s_9_38b == . | s_9_38b == .a)
replace s_9_38c = .v if (s_9_38c == . | s_9_38c == .a)
replace s_9_38d = .v if (s_9_38d == . | s_9_38d == .a)
replace s_9_38e = .v if (s_9_38e == . | s_9_38e == .a)
replace s_9_38f = .v if (s_9_38f == . | s_9_38f == .a)
replace s_9_38g = .v if (s_9_38g == . | s_9_38g == .a)
replace s_9_38h = .v if (s_9_38h == . | s_9_38h == .a)
replace s_9_38i = .v if (s_9_38i == . | s_9_38i == .a)
replace s_9_38j = .v if (s_9_38j == . | s_9_38j == .a)
replace s_9_38k = .v if (s_9_38k == . | s_9_38k == .a)
replace s_9_38l = .v if (s_9_38l == . | s_9_38l == .a)
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
replace s_14_2a_p = .v if (s_14_2a_p == . | s_14_2a_p == .a)
replace s_14_1b_p = .v if (s_14_1b_p == . | s_14_1b_p == .a)
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



capture log close
log using SocioMissingCodebook, text replace

codebook

   save SocioMissing, replace


log close
exit, clear
