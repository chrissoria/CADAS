clear all 
set more off
capture log close
log using CogMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Cog.dta", clear
   

replace c_26_1 = ".i" if c_26_1 == "" & c_26 ~= 7

/*
replace c_33_1 = .i if (c_33_1 == . | c_33_1 == .a) & c_33_a ~= 7

replace c_33_2 = .i if (c_33_2 == . | c_33_2 == .a) & c_33_a ~= 7

replace c_33_3 = .i if (c_33_3 == . | c_33_3 == .a) & c_33_a ~= 7

replace c_33_4 = .i if (c_33_4 == . | c_33_4 == .a) & c_33_a ~= 7

replace c_33_5 = .i if (c_33_5 == . | c_33_5 == .a) & c_33_a ~= 7

replace c_33_6 = .i if (c_33_6 == . | c_33_6 == .a) & c_33_a ~= 7

replace c_33_7 = .i if (c_33_7 == . | c_33_7 == .a) & c_33_a ~= 7

replace c_33_8 = .i if (c_33_8 == . | c_33_8 == .a) & c_33_a ~= 7

replace c_33_9 = .i if (c_33_9 == . | c_33_9 == .a) & c_33_a ~= 7

replace c_33_10 = .i if (c_33_10 == . | c_33_10 == .a) & c_33_a ~= 7

replace c_34_1 = .i if (c_34_1 == . | c_34_1 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_2 = .i if (c_34_2 == . | c_34_2 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_3 = .i if (c_34_3 == . | c_34_3 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_4 = .i if (c_34_4 == . | c_34_4 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_5 = .i if (c_34_5 == . | c_34_5 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_6 = .i if (c_34_6 == . | c_34_6 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_7 = .i if (c_34_7 == . | c_34_7 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_8 = .i if (c_34_8 == . | c_34_8 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_9 = .i if (c_34_9 == . | c_34_9 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_34_10 = .i if (c_34_10 == . | c_34_10 == .a) & (c_33_a ~= 7 & c_34_a ~= 7)

replace c_35_1 = .i if (c_35_1 == . | c_35_1 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_2 = .i if (c_35_2 == . | c_35_2 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_3 = .i if (c_35_3 == . | c_35_3 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_4 = .i if (c_35_4 == . | c_35_4 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_5 = .i if (c_35_5 == . | c_35_5 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_6 = .i if (c_35_6 == . | c_35_6 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_7 = .i if (c_35_7 == . | c_35_7 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_8 = .i if (c_35_8 == . | c_35_8 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_9 = .i if (c_35_9 == . | c_35_9 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

replace c_35_10 = .i if (c_35_10 == . | c_35_10 == .a) & (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)
*/

replace c_45_a = .i if (c_45_a == . | c_45_a == .a) & (c_45 ~= 2 & c_45 ~= 7)

replace c_46 = .i if (c_46 == . | c_46 == .a) & (c_45 ~= 7 & c_45 ~= 1 & c_45 ~= 0)

replace c_46_a = .i if (c_46_a == . | c_46_a == .a) & (c_45 ~= 7 & c_45 ~= 1 & c_45 ~= 0)

/*
replace c_63_1 = .i if (c_63_1 == . | c_63_1 == .a) & c_63_a ~= 7

replace c_63_2 = .i if (c_63_2 == . | c_63_2 == .a) & c_63_a ~= 7

replace c_63_3 = .i if (c_63_3 == . | c_63_3 == .a) & c_63_a ~= 7

replace c_63_4 = .i if (c_63_4 == . | c_63_4 == .a) & c_63_a ~= 7

replace c_63_5 = .i if (c_63_5 == . | c_63_5 == .a) & c_63_a ~= 7

replace c_63_6 = .i if (c_63_6 == . | c_63_6 == .a) & c_63_a ~= 7

replace c_63_7 = .i if (c_63_7 == . | c_63_7 == .a) & c_63_a ~= 7

replace c_63_8 = .i if (c_63_8 == . | c_63_8 == .a) & c_63_a ~= 7

replace c_63_9 = .i if (c_63_9 == . | c_63_9 == .a) & c_63_a ~= 7

replace c_63_10 = .i if (c_63_10 == . | c_63_10 == .a) & c_63_a ~= 7
*/

replace c_66a = .i if (c_66a == . | c_66a == .a) & c_66_a ~= 7

replace c_66b = .i if (c_66b == . | c_66b == .a) & c_66_a ~= 7

replace c_66c = .i if (c_66c == . | c_66c == .a) & c_66_a ~= 7

replace c_66d = .i if (c_66d == . | c_66d == .a) & c_66_a ~= 7

replace c_66e = .i if (c_66e == . | c_66e == .a) & c_66_a ~= 7

replace c_66f = .i if (c_66f == . | c_66f == .a) & c_66_a ~= 7

replace c_67_01 = .i if (c_67_01 == . | c_67_01 == .a) & c_67_a ~= 7

replace c_67_02 = .i if (c_67_02 == . | c_67_02 == .a) & c_67_a ~= 7

replace c_67_03 = .i if (c_67_03 == . | c_67_03 == .a) & c_67_a ~= 7

replace c_67_04 = .i if (c_67_04 == . | c_67_04 == .a) & c_67_a ~= 7

replace c_67_05 = .i if (c_67_05 == . | c_67_05 == .a) & c_67_a ~= 7

replace c_67_06 = .i if (c_67_06 == . | c_67_06 == .a) & c_67_a ~= 7

replace c_67_07 = .i if (c_67_07 == . | c_67_07 == .a) & c_67_a ~= 7

replace c_67_08 = .i if (c_67_08 == . | c_67_08 == .a) & c_67_a ~= 7

replace c_67_09 = .i if (c_67_09 == . | c_67_09 == .a) & c_67_a ~= 7

replace c_67_10 = .i if (c_67_10 == . | c_67_10 == .a) & c_67_a ~= 7

replace c_67_11 = .i if (c_67_11 == . | c_67_11 == .a) & c_67_a ~= 7

replace c_67_12 = .i if (c_67_12 == . | c_67_12 == .a) & c_67_a ~= 7

replace c_67_13_c = .i if (c_67_13_c == . | c_67_13_c == .a) & (c_67_a ~= 7 & c_country == 2)

replace c_67_13_d = .i if (c_67_13_d == . | c_67_13_d == .a) & (c_67_a ~= 7 & c_country == 1)

replace c_67_13_p = .i if (c_67_13_p == . | c_67_13_p == .a) & (c_67_a ~= 7 & c_country == 0)

replace c_67_14 = .i if (c_67_14 == . | c_67_14 == .a) & c_67_a ~= 7

replace c_67_15 = .i if (c_67_15 == . | c_67_15 == .a) & c_67_a ~= 7

replace c_67_16 = .i if (c_67_16 == . | c_67_16 == .a) & c_67_a ~= 7

replace c_67_17 = .i if (c_67_17 == . | c_67_17 == .a) & c_67_a ~= 7

replace c_67_18 = .i if (c_67_18 == . | c_67_18 == .a) & c_67_a ~= 7

replace c_67_19 = .i if (c_67_19 == . | c_67_19 == .a) & c_67_a ~= 7

replace c_67_20 = .i if (c_67_20 == . | c_67_20 == .a) & c_67_a ~= 7

replace c_67_21 = .i if (c_67_21 == . | c_67_21 == .a) & c_67_a ~= 7

replace c_67_22 = .i if (c_67_22 == . | c_67_22 == .a) & c_67_a ~= 7

replace c_67_23 = .i if (c_67_23 == . | c_67_23 == .a) & c_67_a ~= 7

replace c_67_24 = .i if (c_67_24 == . | c_67_24 == .a) & c_67_a ~= 7

replace c_67_25 = .i if (c_67_25 == . | c_67_25 == .a) & c_67_a ~= 7

replace c_68_01 = .i if (c_68_01 == . | c_68_01 == .a) & c_68_a ~= 7

replace c_68_02 = .i if (c_68_02 == . | c_68_02 == .a) & c_68_a ~= 7

replace c_68_03 = .i if (c_68_03 == . | c_68_03 == .a) & c_68_a ~= 7

replace c_68_04 = .i if (c_68_04 == . | c_68_04 == .a) & c_68_a ~= 7

replace c_68_05 = .i if (c_68_05 == . | c_68_05 == .a) & c_68_a ~= 7

replace c_68_06 = .i if (c_68_06 == . | c_68_06 == .a) & c_68_a ~= 7

replace c_68_07 = .i if (c_68_07 == . | c_68_07 == .a) & c_68_a ~= 7

replace c_68_08 = .i if (c_68_08 == . | c_68_08 == .a) & c_68_a ~= 7

replace c_68_09 = .i if (c_68_09 == . | c_68_09 == .a) & c_68_a ~= 7

replace c_68_10 = .i if (c_68_10 == . | c_68_10 == .a) & c_68_a ~= 7

replace c_68_11 = .i if (c_68_11 == . | c_68_11 == .a) & c_68_a ~= 7

replace c_68_12 = .i if (c_68_12 == . | c_68_12 == .a) & c_68_a ~= 7

replace c_68_13 = .i if (c_68_13 == . | c_68_13 == .a) & c_68_a ~= 7

replace c_68_14 = .i if (c_68_14 == . | c_68_14 == .a) & c_68_a ~= 7

replace c_68_15 = .i if (c_68_15 == . | c_68_15 == .a) & c_68_a ~= 7

replace c_68_16 = .i if (c_68_16 == . | c_68_16 == .a) & c_68_a ~= 7

replace c_68_17 = .i if (c_68_17 == . | c_68_17 == .a) & c_68_a ~= 7

replace c_68_18 = .i if (c_68_18 == . | c_68_18 == .a) & c_68_a ~= 7

replace c_68_19 = .i if (c_68_19 == . | c_68_19 == .a) & c_68_a ~= 7

replace c_68_20 = .i if (c_68_20 == . | c_68_20 == .a) & c_68_a ~= 7

replace c_77a = .i if (c_77a == . | c_77a == .a) & c_77_a ~= 7

replace c_77b = .i if (c_77b == . | c_77b == .a) & c_77_a ~= 7

replace c_77c = .i if (c_77c == . | c_77c == .a) & c_77_a ~= 7

replace c_77d = .i if (c_77d == . | c_77d == .a) & c_77_a ~= 7

replace c_77e = .i if (c_77e == . | c_77e == .a) & c_77_a ~= 7

replace c_77f = .i if (c_77f == . | c_77f == .a) & c_77_a ~= 7

replace c_78_01 = .i if (c_78_01 == . | c_78_01 == .a) & c_78_a ~= 7

replace c_78_02 = .i if (c_78_02 == . | c_78_02 == .a) & c_78_a ~= 7

replace c_78_03 = .i if (c_78_03 == . | c_78_03 == .a) & c_78_a ~= 7

replace c_78_04 = .i if (c_78_04 == . | c_78_04 == .a) & c_78_a ~= 7

replace c_78_05 = .i if (c_78_05 == . | c_78_05 == .a) & c_78_a ~= 7

replace c_78_06 = .i if (c_78_06 == . | c_78_06 == .a) & c_78_a ~= 7

replace c_78_07 = .i if (c_78_07 == . | c_78_07 == .a) & c_78_a ~= 7

replace c_78_08 = .i if (c_78_08 == . | c_78_08 == .a) & c_78_a ~= 7

replace c_78_09 = .i if (c_78_09 == . | c_78_09 == .a) & c_78_a ~= 7

replace c_78_10 = .i if (c_78_10 == . | c_78_10 == .a) & c_78_a ~= 7

replace c_78_11 = .i if (c_78_11 == . | c_78_11 == .a) & c_78_a ~= 7

replace c_78_12 = .i if (c_78_12 == . | c_78_12 == .a) & c_78_a ~= 7

replace c_78_13 = .i if (c_78_13 == . | c_78_13 == .a) & c_78_a ~= 7

replace c_78_14 = .i if (c_78_14 == . | c_78_14 == .a) & c_78_a ~= 7

replace c_78_15 = .i if (c_78_15 == . | c_78_15 == .a) & c_78_a ~= 7

replace c_78_16 = .i if (c_78_16 == . | c_78_16 == .a) & c_78_a ~= 7

replace c_78_17 = .i if (c_78_17 == . | c_78_17 == .a) & c_78_a ~= 7

replace c_78_18 = .i if (c_78_18 == . | c_78_18 == .a) & c_78_a ~= 7

replace c_78_19 = .i if (c_78_19 == . | c_78_19 == .a) & c_78_a ~= 7

replace c_78_20 = .i if (c_78_20 == . | c_78_20 == .a) & c_78_a ~= 7

replace c_78_21 = .i if (c_78_21 == . | c_78_21 == .a) & c_78_a ~= 7

replace c_78_22 = .i if (c_78_22 == . | c_78_22 == .a) & c_78_a ~= 7

replace c_78_23 = .i if (c_78_23 == . | c_78_23 == .a) & c_78_a ~= 7

replace c_78_24 = .i if (c_78_24 == . | c_78_24 == .a) & c_78_a ~= 7

replace c_78_25 = .i if (c_78_25 == . | c_78_25 == .a) & c_78_a ~= 7







replace c_26_1 = ".v" if c_26_1 == ""
replace c_33_1 = .v if c_33_1 == 0 & c_33_a == 7
replace c_33_2 = .v if c_33_2 == 0 & c_33_a == 7
replace c_33_3 = .v if c_33_3 == 0 & c_33_a == 7
replace c_33_4 = .v if c_33_4== 0 & c_33_a == 7
replace c_33_5 = .v if c_33_5== 0 & c_33_a == 7
replace c_33_6 = .v if c_33_6== 0 & c_33_a == 7
replace c_33_7 = .v if c_33_7== 0 & c_33_a == 7
replace c_33_8 = .v if c_33_8== 0 & c_33_a == 7
replace c_33_9 = .v if c_33_9== 0 & c_33_a == 7
replace c_33_10 = .v if c_33_10== 0 & c_33_a == 7
replace c_34_1 = .v if c_34_1== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_2 = .v if c_34_2== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_3 = .v if c_34_3== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_4 = .v if c_34_4== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_5 = .v if c_34_5== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_6 = .v if c_34_6== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_7 = .v if c_34_7== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_8 = .v if c_34_8== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_9 = .v if c_34_9== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_34_10 = .v if c_34_10== 0 & (c_33_a == 7 | c_34_a == 7)
replace c_35_1 = .v if c_35_1== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_2 = .v if c_35_2== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_3 = .v if c_35_3== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_4 = .v if c_35_4== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_5 = .v if c_35_5== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_6 = .v if c_35_6== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_7 = .v if c_35_7== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_8 = .v if c_35_8== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_9 = .v if c_35_9== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_10 = .v if c_35_10== 0 & (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_45_a = .v if c_45_a== .
replace c_46 = .v if (c_46== . | c_46== .a)
replace c_46_a = .v if c_46_a== .
replace c_63_1 = .v if c_63_1== 0 & c_63_a == 7
replace c_63_2 = .v if c_63_2== 0 & c_63_a == 7
replace c_63_3 = .v if c_63_3== 0 & c_63_a == 7
replace c_63_4 = .v if c_63_4== 0 & c_63_a == 7
replace c_63_5 = .v if c_63_5== 0 & c_63_a == 7
replace c_63_6 = .v if c_63_6== 0 & c_63_a == 7
replace c_63_7 = .v if c_63_7== 0 & c_63_a == 7
replace c_63_8 = .v if c_63_8== 0 & c_63_a == 7
replace c_63_9 = .v if c_63_9== 0 & c_63_a == 7
replace c_63_10 = .v if c_63_10== 0 & c_63_a == 7
replace c_66a = .v if c_66a== .
replace c_66b = .v if c_66b== .
replace c_66c = .v if c_66c== .
replace c_66d = .v if c_66d== .
replace c_66e = .v if c_66e== .
replace c_66f = .v if c_66f== .
replace c_67_01 = .v if c_67_01== .
replace c_67_02 = .v if c_67_02== .
replace c_67_03 = .v if c_67_03== .
replace c_67_04 = .v if c_67_04== .
replace c_67_05 = .v if c_67_05== .
replace c_67_06 = .v if c_67_06== .
replace c_67_07 = .v if c_67_07== .
replace c_67_08 = .v if c_67_08== .
replace c_67_09 = .v if c_67_09== .
replace c_67_10 = .v if c_67_10== .
replace c_67_11 = .v if c_67_11== .
replace c_67_12 = .v if c_67_12== .
replace c_67_13_c = .v if c_67_13_c== .
replace c_67_13_d = .v if c_67_13_d== .
replace c_67_13_p = .v if c_67_13_p== .
replace c_67_14 = .v if c_67_14== .
replace c_67_15 = .v if c_67_15== .
replace c_67_16 = .v if c_67_16== .
replace c_67_17 = .v if c_67_17== .
replace c_67_18 = .v if c_67_18== .
replace c_67_19 = .v if c_67_19== .
replace c_67_20 = .v if c_67_20== .
replace c_67_21 = .v if c_67_21== .
replace c_67_22 = .v if c_67_22== .
replace c_67_23 = .v if c_67_23== .
replace c_67_24 = .v if c_67_24== .
replace c_67_25 = .v if c_67_25== .
replace c_68_01 = .v if c_68_01== .
replace c_68_02 = .v if c_68_02== .
replace c_68_03 = .v if c_68_03== .
replace c_68_04 = .v if c_68_04== .
replace c_68_05 = .v if c_68_05== .
replace c_68_06 = .v if c_68_06== .
replace c_68_07 = .v if c_68_07== .
replace c_68_08 = .v if c_68_08== .
replace c_68_09 = .v if c_68_09== .
replace c_68_10 = .v if c_68_10== .
replace c_68_11 = .v if c_68_11== .
replace c_68_12 = .v if c_68_12== .
replace c_68_13 = .v if c_68_13== .
replace c_68_14 = .v if c_68_14== .
replace c_68_15 = .v if c_68_15== .
replace c_68_16 = .v if c_68_16== .
replace c_68_17 = .v if c_68_17== .
replace c_68_18 = .v if c_68_18== .
replace c_68_19 = .v if c_68_19== .
replace c_68_20 = .v if c_68_20== .
replace c_77a = .v if c_77a== .
replace c_77b = .v if c_77b== .
replace c_77c = .v if c_77c== .
replace c_77d = .v if c_77d== .
replace c_77e = .v if c_77e== .
replace c_77f = .v if c_77f== .
replace c_78_01 = .v if c_78_01== .
replace c_78_02 = .v if c_78_02== .
replace c_78_03 = .v if c_78_03== .
replace c_78_04 = .v if c_78_04== .
replace c_78_05 = .v if c_78_05== .
replace c_78_06 = .v if c_78_06== .
replace c_78_07 = .v if c_78_07== .
replace c_78_08 = .v if c_78_08== .
replace c_78_09 = .v if c_78_09== .
replace c_78_10 = .v if c_78_10== .
replace c_78_11 = .v if c_78_11== .
replace c_78_12 = .v if c_78_12== .
replace c_78_13 = .v if c_78_13== .
replace c_78_14 = .v if c_78_14== .
replace c_78_15 = .v if c_78_15== .
replace c_78_16 = .v if c_78_16== .
replace c_78_17 = .v if c_78_17== .
replace c_78_18 = .v if c_78_18== .
replace c_78_19 = .v if c_78_19== .
replace c_78_20 = .v if c_78_20== .
replace c_78_21 = .v if c_78_21== .
replace c_78_22 = .v if c_78_22== .
replace c_78_23 = .v if c_78_23== .
replace c_78_24 = .v if c_78_24== .
replace c_78_25 = .v if c_78_25== .


replace c_2_p_c = .v if (c_2_p_c == . | c_2_p_c == .a) & c_country == 1
replace c_2_d = .v if (c_2_d == . | c_2_d == .a) & (c_country == 0 | c_country == 2)
replace c_7_d_c = .v if (c_7_d_c == . | c_7_d_c == .a) & c_country == 0
replace c_7_p = .v if (c_7_p == . | c_7_p == .a) & (c_country == 1 | c_country == 2)
replace c_67_13_c = .v if (c_67_13_c == . | c_67_13_c == .a) & (c_country == 0 | c_country == 1)
replace c_67_13_d = .v if (c_67_13_d == . | c_67_13_d == .a) & (c_country == 0 | c_country == 2)
replace c_67_13_p = .v if (c_67_13_p == . | c_67_13_p == .a) & (c_country == 1 | c_country == 2)
replace c_69_c = .v if (c_69_c == . | c_69_c == .a) & (c_country == 0 | c_country == 1)
replace c_69_d = .v if (c_69_d == . | c_69_d == .a) & (c_country == 0 | c_country == 2)
replace c_69_p = .v if (c_69_p == . | c_69_p == .a) & (c_country == 1 | c_country == 2)
replace c_70_d_c = .v if (c_70_d_c == . | c_70_d_c == .a) & c_country == 0
replace c_70_p = .v if (c_70_p == . | c_70_p == .a) & (c_country == 1 | c_country == 2)
replace c_71_c = .v if (c_71_c == . | c_71_c == .a) & (c_country == 0 | c_country == 1)
replace c_71_d = .v if (c_71_d == . | c_71_d == .a) & (c_country == 0 | c_country == 2)
replace c_71_p = .v if (c_71_p == . | c_71_p == .a) & (c_country == 1 | c_country == 2)



*change all remaining . to .i

replace c_interid = ".i" if c_interid == ""
replace c_houseid = .i if (c_houseid == . | c_houseid == .a)
replace c_clustid = .i if (c_clustid == . | c_clustid == .a)
replace c_particid = .i if (c_particid == . | c_particid == .a)
replace c_country = .i if (c_country == . | c_country == .a)
replace c_houseid2 = .i if (c_houseid2 == . | c_houseid2 == .a)
replace c_conglid2 = .i if (c_conglid2 == . | c_conglid2 == .a)
replace c_particid2 = ".i" if c_particid2 == ""
replace c_deviceid1 = ".i" if c_deviceid1 == ""
replace c_0 = .i if (c_0 == . | c_0 == .a)
replace c_1 = .i if (c_1 == . | c_1 == .a)
replace c_2_p_c = .i if (c_2_p_c == . | c_2_p_c == .a)
replace c_2_d = .i if (c_2_d == . | c_2_d == .a)
replace c_3 = .i if (c_3 == . | c_3 == .a)
replace c_4 = .i if (c_4 == . | c_4 == .a)
replace c_5 = .i if (c_5 == . | c_5 == .a)
replace c_6 = .i if (c_6 == . | c_6 == .a)
replace c_7_d_c = .i if (c_7_d_c == . | c_7_d_c == .a)
replace c_7_p = .i if (c_7_p == . | c_7_p == .a)
replace c_8 = .i if (c_8 == . | c_8 == .a)
replace c_9 = .i if (c_9 == . | c_9 == .a)
replace c_10 = .i if (c_10 == . | c_10 == .a)
replace c_11 = .i if (c_11 == . | c_11 == .a)
replace c_12 = .i if (c_12 == . | c_12 == .a)
replace c_13 = .i if (c_13 == . | c_13 == .a)
replace c_14 = .i if (c_14 == . | c_14 == .a)
replace c_15 = .i if (c_15 == . | c_15 == .a)
replace c_16 = .i if (c_16 == . | c_16 == .a)
replace c_17 = .i if (c_17 == . | c_17 == .a)
replace c_18 = .i if (c_18 == . | c_18 == .a)
replace c_19 = .i if (c_19 == . | c_19 == .a)
replace c_20 = ".i" if c_20 == ""
replace c_21 = .i if (c_21 == . | c_21 == .a)
replace c_22 = .i if (c_22 == . | c_22 == .a)
replace c_23 = .i if (c_23 == . | c_23 == .a)
replace c_24 = .i if (c_24 == . | c_24 == .a)
replace c_25 = .i if (c_25 == . | c_25 == .a)
replace c_26 = .i if (c_26 == . | c_26 == .a)
replace c_26_1 = ".i" if c_26_1 == ""
replace c_27 = .i if (c_27 == . | c_27 == .a)
replace c_28 = .i if (c_28 == . | c_28 == .a)
replace c_29 = .i if (c_29 == . | c_29 == .a)
replace c_30 = .i if (c_30 == . | c_30 == .a)
replace c_31 = .i if (c_31 == . | c_31 == .a)
replace c_32 = .i if (c_32 == . | c_32 == .a)
replace pent_pic = ".i" if pent_pic == ""
/*
replace c_33_a = .i if (c_33_a == . | c_33_a == .a)
replace c_33_1 = .i if (c_33_1 == . | c_33_1 == .a)
replace c_33_2 = .i if (c_33_2 == . | c_33_2 == .a)
replace c_33_3 = .i if (c_33_3 == . | c_33_3 == .a)
replace c_33_4 = .i if (c_33_4 == . | c_33_4 == .a)
replace c_33_5 = .i if (c_33_5 == . | c_33_5 == .a)
replace c_33_6 = .i if (c_33_6 == . | c_33_6 == .a)
replace c_33_7 = .i if (c_33_7 == . | c_33_7 == .a)
replace c_33_8 = .i if (c_33_8 == . | c_33_8 == .a)
replace c_33_9 = .i if (c_33_9 == . | c_33_9 == .a)
replace c_33_10 = .i if (c_33_10 == . | c_33_10 == .a)
replace c_34_a = .i if (c_34_a == . | c_34_a == .a)
replace c_34_1 = .i if (c_34_1 == . | c_34_1 == .a)
replace c_34_2 = .i if (c_34_2 == . | c_34_2 == .a)
replace c_34_3 = .i if (c_34_3 == . | c_34_3 == .a)
replace c_34_4 = .i if (c_34_4 == . | c_34_4 == .a)
replace c_34_5 = .i if (c_34_5 == . | c_34_5 == .a)
replace c_34_6 = .i if (c_34_6 == . | c_34_6 == .a)
replace c_34_7 = .i if (c_34_7 == . | c_34_7 == .a)
replace c_34_8 = .i if (c_34_8 == . | c_34_8 == .a)
replace c_34_9 = .i if (c_34_9 == . | c_34_9 == .a)
replace c_34_10 = .i if (c_34_10 == . | c_34_10 == .a)
replace c_35_a = .i if (c_35_a == . | c_35_a == .a)
replace c_35_1 = .i if (c_35_1 == . | c_35_1 == .a)
replace c_35_2 = .i if (c_35_2 == . | c_35_2 == .a)
replace c_35_3 = .i if (c_35_3 == . | c_35_3 == .a)
replace c_35_4 = .i if (c_35_4 == . | c_35_4 == .a)
replace c_35_5 = .i if (c_35_5 == . | c_35_5 == .a)
replace c_35_6 = .i if (c_35_6 == . | c_35_6 == .a)
replace c_35_7 = .i if (c_35_7 == . | c_35_7 == .a)
replace c_35_8 = .i if (c_35_8 == . | c_35_8 == .a)
replace c_35_9 = .i if (c_35_9 == . | c_35_9 == .a)
replace c_35_10 = .i if (c_35_10 == . | c_35_10 == .a)
*/
replace g_1 = .i if (g_1 == . | g_1 == .a)
replace g_1_file = ".i" if g_1_file == ""
replace c_40 = .i if (c_40 == . | c_40 == .a)
replace anim_pic = ".i" if anim_pic == ""
replace c_43 = .i if (c_43 == . | c_43 == .a)
replace symb_pic = ".i" if (symb_pic == "" | symb_pic == ".a")
replace c_45 = .i if (c_45 == . | c_45 == .a)
replace c_45_a = .i if (c_45_a == . | c_45_a == .a)
replace c_46 = .i if (c_46 == . | c_46 == .a)
replace c_46_a = .i if (c_46_a == . | c_46_a == .a)
replace c_48 = .i if (c_48 == . | c_48 == .a)
replace c_49 = .i if (c_49 == . | c_49 == .a)
replace c_50 = .i if (c_50 == . | c_50 == .a)
replace c_51 = .i if (c_51 == . | c_51 == .a)
replace c_52 = .i if (c_52 == . | c_52 == .a)
replace c_53 = .i if (c_53 == . | c_53 == .a)
replace c_54 = .i if (c_54 == . | c_54 == .a)
replace c_55 = .i if (c_55 == . | c_55 == .a)
replace c_56 = .i if (c_56 == . | c_56 == .a)
replace c_58 = .i if (c_58 == . | c_58 == .a)
replace c_59 = .i if (c_59 == . | c_59 == .a)
replace c_60 = .i if (c_60 == . | c_60 == .a)
replace c_61 = .i if (c_61 == . | c_61 == .a)
replace c_62 = .i if (c_62 == . | c_62 == .a)
/*
replace c_63_a = .i if (c_63_a == . | c_63_a == .a)
replace c_63_1 = .i if (c_63_1 == . | c_63_1 == .a)
replace c_63_2 = .i if (c_63_2 == . | c_63_2 == .a)
replace c_63_3 = .i if (c_63_3 == . | c_63_3 == .a)
replace c_63_4 = .i if (c_63_4 == . | c_63_4 == .a)
replace c_63_5 = .i if (c_63_5 == . | c_63_5 == .a)
replace c_63_6 = .i if (c_63_6 == . | c_63_6 == .a)
replace c_63_7 = .i if (c_63_7 == . | c_63_7 == .a)
replace c_63_8 = .i if (c_63_8 == . | c_63_8 == .a)
replace c_63_9 = .i if (c_63_9 == . | c_63_9 == .a)
replace c_63_10 = .i if (c_63_10 == . | c_63_10 == .a)
*/
replace c_65 = .i if (c_65 == . | c_65 == .a)
replace g_2 = .i if (g_2 == . | g_2 == .a)
replace c_66_a = .i if (c_66_a == . | c_66_a == .a)
replace g_2_file = ".i" if g_2_file == ""
replace c_66a = .i if (c_66a == . | c_66a == .a)
replace c_66b = .i if (c_66b == . | c_66b == .a)
replace c_66c = .i if (c_66c == . | c_66c == .a)
replace c_66d = .i if (c_66d == . | c_66d == .a)
replace c_66e = .i if (c_66e == . | c_66e == .a)
replace c_66f = .i if (c_66f == . | c_66f == .a)
replace c_67_a = .i if (c_67_a == . | c_67_a == .a)
replace g_2_file2 = ".i" if g_2_file2 == ""
replace c_67_01 = .i if (c_67_01 == . | c_67_01 == .a)
replace c_67_02 = .i if (c_67_02 == . | c_67_02 == .a)
replace c_67_03 = .i if (c_67_03 == . | c_67_03 == .a)
replace c_67_04 = .i if (c_67_04 == . | c_67_04 == .a)
replace c_67_05 = .i if (c_67_05 == . | c_67_05 == .a)
replace c_67_06 = .i if (c_67_06 == . | c_67_06 == .a)
replace c_67_07 = .i if (c_67_07 == . | c_67_07 == .a)
replace c_67_08 = .i if (c_67_08 == . | c_67_08 == .a)
replace c_67_09 = .i if (c_67_09 == . | c_67_09 == .a)
replace c_67_10 = .i if (c_67_10 == . | c_67_10 == .a)
replace c_67_11 = .i if (c_67_11 == . | c_67_11 == .a)
replace c_67_12 = .i if (c_67_12 == . | c_67_12 == .a)
replace c_67_13_c = .i if (c_67_13_c == . | c_67_13_c == .a)
replace c_67_13_d = .i if (c_67_13_d == . | c_67_13_d == .a)
replace c_67_13_p = .i if (c_67_13_p == . | c_67_13_p == .a)
replace c_67_14 = .i if (c_67_14 == . | c_67_14 == .a)
replace c_67_15 = .i if (c_67_15 == . | c_67_15 == .a)
replace c_67_16 = .i if (c_67_16 == . | c_67_16 == .a)
replace c_67_17 = .i if (c_67_17 == . | c_67_17 == .a)
replace c_67_18 = .i if (c_67_18 == . | c_67_18 == .a)
replace c_67_19 = .i if (c_67_19 == . | c_67_19 == .a)
replace c_67_20 = .i if (c_67_20 == . | c_67_20 == .a)
replace c_67_21 = .i if (c_67_21 == . | c_67_21 == .a)
replace c_67_22 = .i if (c_67_22 == . | c_67_22 == .a)
replace c_67_23 = .i if (c_67_23 == . | c_67_23 == .a)
replace c_67_24 = .i if (c_67_24 == . | c_67_24 == .a)
replace c_67_25 = .i if (c_67_25 == . | c_67_25 == .a)
replace c_68_a = .i if (c_68_a == . | c_68_a == .a)
replace c_68_01 = .i if (c_68_01 == . | c_68_01 == .a)
replace c_68_02 = .i if (c_68_02 == . | c_68_02 == .a)
replace c_68_03 = .i if (c_68_03 == . | c_68_03 == .a)
replace c_68_04 = .i if (c_68_04 == . | c_68_04 == .a)
replace c_68_05 = .i if (c_68_05 == . | c_68_05 == .a)
replace c_68_06 = .i if (c_68_06 == . | c_68_06 == .a)
replace c_68_07 = .i if (c_68_07 == . | c_68_07 == .a)
replace c_68_08 = .i if (c_68_08 == . | c_68_08 == .a)
replace c_68_09 = .i if (c_68_09 == . | c_68_09 == .a)
replace c_68_10 = .i if (c_68_10 == . | c_68_10 == .a)
replace c_68_11 = .i if (c_68_11 == . | c_68_11 == .a)
replace c_68_12 = .i if (c_68_12 == . | c_68_12 == .a)
replace c_68_13 = .i if (c_68_13 == . | c_68_13 == .a)
replace c_68_14 = .i if (c_68_14 == . | c_68_14 == .a)
replace c_68_15 = .i if (c_68_15 == . | c_68_15 == .a)
replace c_68_16 = .i if (c_68_16 == . | c_68_16 == .a)
replace c_68_17 = .i if (c_68_17 == . | c_68_17 == .a)
replace c_68_18 = .i if (c_68_18 == . | c_68_18 == .a)
replace c_68_19 = .i if (c_68_19 == . | c_68_19 == .a)
replace c_68_20 = .i if (c_68_20 == . | c_68_20 == .a)
replace c_69_c = .i if (c_69_c == . | c_69_c == .a)
replace c_69_d = .i if (c_69_d == . | c_69_d == .a)
replace c_69_p = .i if (c_69_p == . | c_69_p == .a)
replace c_70_d_c = .i if (c_70_d_c == . | c_70_d_c == .a)
replace c_70_p = .i if (c_70_p == . | c_70_p == .a)
replace c_71_c = .i if (c_71_c == . | c_71_c == .a)
replace c_71_p = .i if (c_71_p == . | c_71_p == .a)
replace c_71_d = .i if (c_71_d == . | c_71_d == .a)
replace c_72_1 = .i if (c_72_1 == . | c_72_1 == .a)
replace c_72_2 = .i if (c_72_2 == . | c_72_2 == .a)
replace c_72_3 = .i if (c_72_3 == . | c_72_3 == .a)
replace c_72_4 = .i if (c_72_4 == . | c_72_4 == .a)
replace c_72_4_pic = ".i" if (c_72_4_pic == "" | c_72_4_pic == ".a")
replace g_3 = .i if (g_3 == . | g_3 == .a)
replace c_77_a = .i if (c_77_a == . | c_77_a == .a)
replace g_3_file = ".i" if g_3_file == ""
replace c_77a = .i if (c_77a == . | c_77a == .a)
replace c_77b = .i if (c_77b == . | c_77b == .a)
replace c_77c = .i if (c_77c == . | c_77c == .a)
replace c_77d = .i if (c_77d == . | c_77d == .a)
replace c_77e = .i if (c_77e == . | c_77e == .a)
replace c_77f = .i if (c_77f == . | c_77f == .a)
replace c_78_a = .i if (c_78_a == . | c_78_a == .a)
replace g_3_file2 = ".i" if g_3_file2 == ""
replace c_78_01 = .i if (c_78_01 == . | c_78_01 == .a)
replace c_78_02 = .i if (c_78_02 == . | c_78_02 == .a)
replace c_78_03 = .i if (c_78_03 == . | c_78_03 == .a)
replace c_78_04 = .i if (c_78_04 == . | c_78_04 == .a)
replace c_78_05 = .i if (c_78_05 == . | c_78_05 == .a)
replace c_78_06 = .i if (c_78_06 == . | c_78_06 == .a)
replace c_78_07 = .i if (c_78_07 == . | c_78_07 == .a)
replace c_78_08 = .i if (c_78_08 == . | c_78_08 == .a)
replace c_78_09 = .i if (c_78_09 == . | c_78_09 == .a)
replace c_78_10 = .i if (c_78_10 == . | c_78_10 == .a)
replace c_78_11 = .i if (c_78_11 == . | c_78_11 == .a)
replace c_78_12 = .i if (c_78_12 == . | c_78_12 == .a)
replace c_78_13 = .i if (c_78_13 == . | c_78_13 == .a)
replace c_78_14 = .i if (c_78_14 == . | c_78_14 == .a)
replace c_78_15 = .i if (c_78_15 == . | c_78_15 == .a)
replace c_78_16 = .i if (c_78_16 == . | c_78_16 == .a)
replace c_78_17 = .i if (c_78_17 == . | c_78_17 == .a)
replace c_78_18 = .i if (c_78_18 == . | c_78_18 == .a)
replace c_78_19 = .i if (c_78_19 == . | c_78_19 == .a)
replace c_78_20 = .i if (c_78_20 == . | c_78_20 == .a)
replace c_78_21 = .i if (c_78_21 == . | c_78_21 == .a)
replace c_78_22 = .i if (c_78_22 == . | c_78_22 == .a)
replace c_78_23 = .i if (c_78_23 == . | c_78_23 == .a)
replace c_78_24 = .i if (c_78_24 == . | c_78_24 == .a)
replace c_78_25 = .i if (c_78_25 == . | c_78_25 == .a)
replace c_79_1 = .i if (c_79_1 == . | c_79_1 == .a)
replace c_79_2 = .i if (c_79_2 == . | c_79_2 == .a)
replace c_79_3 = .i if (c_79_3 == . | c_79_3 == .a)
replace c_79_4 = .i if (c_79_4 == . | c_79_4 == .a)
replace c_79_4_pic = ".i" if (c_79_4_pic == "" | c_79_4_pic == ".a")
replace c_80a = .i if (c_80a == . | c_80a == .a)
replace c_80b = .i if (c_80b == . | c_80b == .a)
replace c_80c = .i if (c_80c == . | c_80c == .a)
replace c_81 = .i if (c_81 == . | c_81 == .a)
replace c_82 = .i if (c_82 == . | c_82 == .a)
replace c_deviceid2 = ".i" if c_deviceid2 == ""




*drop all uppercase variables

drop C_*
drop G_*




*COUNTS NUMBER OF .i IN EACH OBERVATION UNDER NEW VARIABLE CALLED c_countmissing
local i 1
gen c_countmissing = 0

quietly ds hhid pid c_time2 c_time1 c_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey c_deviceid2, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace c_countmissing = c_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace c_countmissing = c_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}






*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED c_last
local i 1
gen c_last = "AllAnswered"

quietly ds c_countmissing hhid pid c_last c_time2 c_time1 c_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey c_deviceid2, not
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
				replace c_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace c_last = "`v'" in `i'
				continue, break
			}
		}
	}
}



/*
*time taken in minutes
gen c_TotalTime = (Clock(C_Time_END, "MDYhms") - Clock(C_Time1, "MDYhms"))/1000/60
gen c_ThreeWordDelay = (Clock(C_Time3, "MDYhms") - Clock(C_Time2, "MDYhms"))/1000/60
gen c_TenWordDelay = (Clock(C_Time5, "MDYhms") - Clock(C_Time4, "MDYhms"))/1000/60
gen c_TenWordRecognition = (Clock(C_Time8, "MDYhms") - Clock(C_Time4, "MDYhms"))/1000/60
gen c_Story1Delay = (Clock(C_Time10, "MDYhms") - Clock(C_Time6, "MDYhms"))/1000/60
gen c_Story2Delay = (Clock(C_Time11, "MDYhms") - Clock(C_Time7, "MDYhms"))/1000/60
gen c_FigureDelay = (Clock(C_Time_END, "MDYhms") - Clock(C_Time9, "MDYhms"))/1000/60
*/
gen c_TotalTime = (Clock(c_time2, "MDYhms") - Clock(c_time1, "MDYhms"))/1000/60



capture log close
log using CogMissingCodebook, text replace

codebook

   save CogMissing, replace


log close
log using CogOnlyMissing, text replace

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
