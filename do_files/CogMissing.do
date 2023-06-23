clear all 
set more off
capture log close
log using CogMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Cog.dta", clear
   

replace c_26_1 = ".b" if c_26_1 == "" & c_26 ~= 7

replace c_33_1 = .b if (c_33_1 == . | c_33_1 == .a) & c_33_a ~= 1

replace c_33_2 = .b if (c_33_2 == . | c_33_2 == .a) & c_33_a ~= 1

replace c_33_3 = .b if (c_33_3 == . | c_33_3 == .a) & c_33_a ~= 1

replace c_33_4 = .b if (c_33_4 == . | c_33_4 == .a) & c_33_a ~= 1

replace c_33_5 = .b if (c_33_5 == . | c_33_5 == .a) & c_33_a ~= 1

replace c_33_6 = .b if (c_33_6 == . | c_33_6 == .a) & c_33_a ~= 1

replace c_33_7 = .b if (c_33_7 == . | c_33_7 == .a) & c_33_a ~= 1

replace c_33_8 = .b if (c_33_8 == . | c_33_8 == .a) & c_33_a ~= 1

replace c_33_9 = .b if (c_33_9 == . | c_33_9 == .a) & c_33_a ~= 1

replace c_33_10 = .b if (c_33_10 == . | c_33_10 == .a) & c_33_a ~= 1

replace c_34_1 = .b if (c_34_1 == . | c_34_1 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_2 = .b if (c_34_2 == . | c_34_2 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_3 = .b if (c_34_3 == . | c_34_3 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_4 = .b if (c_34_4 == . | c_34_4 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_5 = .b if (c_34_5 == . | c_34_5 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_6 = .b if (c_34_6 == . | c_34_6 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_7 = .b if (c_34_7 == . | c_34_7 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_8 = .b if (c_34_8 == . | c_34_8 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_9 = .b if (c_34_9 == . | c_34_9 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_34_10 = .b if (c_34_10 == . | c_34_10 == .a) & (c_33_a ~= 1 & c_34_a ~= 1)

replace c_35_1 = .b if (c_35_1 == . | c_35_1 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_2 = .b if (c_35_2 == . | c_35_2 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_3 = .b if (c_35_3 == . | c_35_3 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_4 = .b if (c_35_4 == . | c_35_4 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_5 = .b if (c_35_5 == . | c_35_5 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_6 = .b if (c_35_6 == . | c_35_6 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_7 = .b if (c_35_7 == . | c_35_7 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_8 = .b if (c_35_8 == . | c_35_8 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_9 = .b if (c_35_9 == . | c_35_9 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_35_10 = .b if (c_35_10 == . | c_35_10 == .a) & (c_33_a ~= 1 & c_34_a ~= 1 & c_35_a ~= 1)

replace c_45_a = .b if (c_45_a == . | c_45_a == .a) & (c_45 ~= 2 & c_45 ~= 7)

replace c_46 = .b if (c_46 == . | c_46 == .a) & (c_45 ~= 7 & c_45 ~= 1 & c_45 ~= 0)

replace c_46_a = .b if (c_46_a == . | c_46_a == .a) & (c_45 ~= 7 & c_45 ~= 1 & c_45 ~= 0)

replace c_63_1 = .b if (c_63_1 == . | c_63_1 == .a) & c_63_a ~= 1

replace c_63_2 = .b if (c_63_2 == . | c_63_2 == .a) & c_63_a ~= 1

replace c_63_3 = .b if (c_63_3 == . | c_63_3 == .a) & c_63_a ~= 1

replace c_63_4 = .b if (c_63_4 == . | c_63_4 == .a) & c_63_a ~= 1

replace c_63_5 = .b if (c_63_5 == . | c_63_5 == .a) & c_63_a ~= 1

replace c_63_6 = .b if (c_63_6 == . | c_63_6 == .a) & c_63_a ~= 1

replace c_63_7 = .b if (c_63_7 == . | c_63_7 == .a) & c_63_a ~= 1

replace c_63_8 = .b if (c_63_8 == . | c_63_8 == .a) & c_63_a ~= 1

replace c_63_9 = .b if (c_63_9 == . | c_63_9 == .a) & c_63_a ~= 1

replace c_63_10 = .b if (c_63_10 == . | c_63_10 == .a) & c_63_a ~= 1

replace c_66a = .b if (c_66a == . | c_66a == .a) & c_66_a ~= 1

replace c_66b = .b if (c_66b == . | c_66b == .a) & c_66_a ~= 1

replace c_66c = .b if (c_66c == . | c_66c == .a) & c_66_a ~= 1

replace c_66d = .b if (c_66d == . | c_66d == .a) & c_66_a ~= 1

replace c_66e = .b if (c_66e == . | c_66e == .a) & c_66_a ~= 1

replace c_66f = .b if (c_66f == . | c_66f == .a) & c_66_a ~= 1

replace c_67_01 = .b if (c_67_01 == . | c_67_01 == .a) & c_67_a ~= 1

replace c_67_02 = .b if (c_67_02 == . | c_67_02 == .a) & c_67_a ~= 1

replace c_67_03 = .b if (c_67_03 == . | c_67_03 == .a) & c_67_a ~= 1

replace c_67_04 = .b if (c_67_04 == . | c_67_04 == .a) & c_67_a ~= 1

replace c_67_05 = .b if (c_67_05 == . | c_67_05 == .a) & c_67_a ~= 1

replace c_67_06 = .b if (c_67_06 == . | c_67_06 == .a) & c_67_a ~= 1

replace c_67_07 = .b if (c_67_07 == . | c_67_07 == .a) & c_67_a ~= 1

replace c_67_08 = .b if (c_67_08 == . | c_67_08 == .a) & c_67_a ~= 1

replace c_67_09 = .b if (c_67_09 == . | c_67_09 == .a) & c_67_a ~= 1

replace c_67_10 = .b if (c_67_10 == . | c_67_10 == .a) & c_67_a ~= 1

replace c_67_11 = .b if (c_67_11 == . | c_67_11 == .a) & c_67_a ~= 1

replace c_67_12 = .b if (c_67_12 == . | c_67_12 == .a) & c_67_a ~= 1

replace c_67_13_c = .b if (c_67_13_c == . | c_67_13_c == .a) & (c_67_a ~= 1 & c_country == 2)

replace c_67_13_d = .b if (c_67_13_d == . | c_67_13_d == .a) & (c_67_a ~= 1 & c_country == 1)

replace c_67_13_p = .b if (c_67_13_p == . | c_67_13_p == .a) & (c_67_a ~= 1 & c_country == 0)

replace c_67_14 = .b if (c_67_14 == . | c_67_14 == .a) & c_67_a ~= 1

replace c_67_15 = .b if (c_67_15 == . | c_67_15 == .a) & c_67_a ~= 1

replace c_67_16 = .b if (c_67_16 == . | c_67_16 == .a) & c_67_a ~= 1

replace c_67_17 = .b if (c_67_17 == . | c_67_17 == .a) & c_67_a ~= 1

replace c_67_18 = .b if (c_67_18 == . | c_67_18 == .a) & c_67_a ~= 1

replace c_67_19 = .b if (c_67_19 == . | c_67_19 == .a) & c_67_a ~= 1

replace c_67_20 = .b if (c_67_20 == . | c_67_20 == .a) & c_67_a ~= 1

replace c_67_21 = .b if (c_67_21 == . | c_67_21 == .a) & c_67_a ~= 1

replace c_67_22 = .b if (c_67_22 == . | c_67_22 == .a) & c_67_a ~= 1

replace c_67_23 = .b if (c_67_23 == . | c_67_23 == .a) & c_67_a ~= 1

replace c_67_24 = .b if (c_67_24 == . | c_67_24 == .a) & c_67_a ~= 1

replace c_67_25 = .b if (c_67_25 == . | c_67_25 == .a) & c_67_a ~= 1

replace c_68_01 = .b if (c_68_01 == . | c_68_01 == .a) & c_68_a ~= 1

replace c_68_02 = .b if (c_68_02 == . | c_68_02 == .a) & c_68_a ~= 1

replace c_68_03 = .b if (c_68_03 == . | c_68_03 == .a) & c_68_a ~= 1

replace c_68_04 = .b if (c_68_04 == . | c_68_04 == .a) & c_68_a ~= 1

replace c_68_05 = .b if (c_68_05 == . | c_68_05 == .a) & c_68_a ~= 1

replace c_68_06 = .b if (c_68_06 == . | c_68_06 == .a) & c_68_a ~= 1

replace c_68_07 = .b if (c_68_07 == . | c_68_07 == .a) & c_68_a ~= 1

replace c_68_08 = .b if (c_68_08 == . | c_68_08 == .a) & c_68_a ~= 1

replace c_68_09 = .b if (c_68_09 == . | c_68_09 == .a) & c_68_a ~= 1

replace c_68_10 = .b if (c_68_10 == . | c_68_10 == .a) & c_68_a ~= 1

replace c_68_11 = .b if (c_68_11 == . | c_68_11 == .a) & c_68_a ~= 1

replace c_68_12 = .b if (c_68_12 == . | c_68_12 == .a) & c_68_a ~= 1

replace c_68_13 = .b if (c_68_13 == . | c_68_13 == .a) & c_68_a ~= 1

replace c_68_14 = .b if (c_68_14 == . | c_68_14 == .a) & c_68_a ~= 1

replace c_68_15 = .b if (c_68_15 == . | c_68_15 == .a) & c_68_a ~= 1

replace c_68_16 = .b if (c_68_16 == . | c_68_16 == .a) & c_68_a ~= 1

replace c_68_17 = .b if (c_68_17 == . | c_68_17 == .a) & c_68_a ~= 1

replace c_68_18 = .b if (c_68_18 == . | c_68_18 == .a) & c_68_a ~= 1

replace c_68_19 = .b if (c_68_19 == . | c_68_19 == .a) & c_68_a ~= 1

replace c_68_20 = .b if (c_68_20 == . | c_68_20 == .a) & c_68_a ~= 1

replace c_77a = .b if (c_77a == . | c_77a == .a) & c_77_a ~= 1

replace c_77b = .b if (c_77b == . | c_77b == .a) & c_77_a ~= 1

replace c_77c = .b if (c_77c == . | c_77c == .a) & c_77_a ~= 1

replace c_77d = .b if (c_77d == . | c_77d == .a) & c_77_a ~= 1

replace c_77e = .b if (c_77e == . | c_77e == .a) & c_77_a ~= 1

replace c_77f = .b if (c_77f == . | c_77f == .a) & c_77_a ~= 1

replace c_78_01 = .b if (c_78_01 == . | c_78_01 == .a) & c_78_a ~= 1

replace c_78_02 = .b if (c_78_02 == . | c_78_02 == .a) & c_78_a ~= 1

replace c_78_03 = .b if (c_78_03 == . | c_78_03 == .a) & c_78_a ~= 1

replace c_78_04 = .b if (c_78_04 == . | c_78_04 == .a) & c_78_a ~= 1

replace c_78_05 = .b if (c_78_05 == . | c_78_05 == .a) & c_78_a ~= 1

replace c_78_06 = .b if (c_78_06 == . | c_78_06 == .a) & c_78_a ~= 1

replace c_78_07 = .b if (c_78_07 == . | c_78_07 == .a) & c_78_a ~= 1

replace c_78_08 = .b if (c_78_08 == . | c_78_08 == .a) & c_78_a ~= 1

replace c_78_09 = .b if (c_78_09 == . | c_78_09 == .a) & c_78_a ~= 1

replace c_78_10 = .b if (c_78_10 == . | c_78_10 == .a) & c_78_a ~= 1

replace c_78_11 = .b if (c_78_11 == . | c_78_11 == .a) & c_78_a ~= 1

replace c_78_12 = .b if (c_78_12 == . | c_78_12 == .a) & c_78_a ~= 1

replace c_78_13 = .b if (c_78_13 == . | c_78_13 == .a) & c_78_a ~= 1

replace c_78_14 = .b if (c_78_14 == . | c_78_14 == .a) & c_78_a ~= 1

replace c_78_15 = .b if (c_78_15 == . | c_78_15 == .a) & c_78_a ~= 1

replace c_78_16 = .b if (c_78_16 == . | c_78_16 == .a) & c_78_a ~= 1

replace c_78_17 = .b if (c_78_17 == . | c_78_17 == .a) & c_78_a ~= 1

replace c_78_18 = .b if (c_78_18 == . | c_78_18 == .a) & c_78_a ~= 1

replace c_78_19 = .b if (c_78_19 == . | c_78_19 == .a) & c_78_a ~= 1

replace c_78_20 = .b if (c_78_20 == . | c_78_20 == .a) & c_78_a ~= 1

replace c_78_21 = .b if (c_78_21 == . | c_78_21 == .a) & c_78_a ~= 1

replace c_78_22 = .b if (c_78_22 == . | c_78_22 == .a) & c_78_a ~= 1

replace c_78_23 = .b if (c_78_23 == . | c_78_23 == .a) & c_78_a ~= 1

replace c_78_24 = .b if (c_78_24 == . | c_78_24 == .a) & c_78_a ~= 1

replace c_78_25 = .b if (c_78_25 == . | c_78_25 == .a) & c_78_a ~= 1







replace c_26_1 = ".v" if c_26_1 == ""
replace c_33_1 = .v if c_33_1 == .
replace c_33_2 = .v if c_33_2 == .
replace c_33_3 = .v if c_33_3 == .
replace c_33_4 = .v if c_33_4== .
replace c_33_5 = .v if c_33_5== .
replace c_33_6 = .v if c_33_6== .
replace c_33_7 = .v if c_33_7== .
replace c_33_8 = .v if c_33_8== .
replace c_33_9 = .v if c_33_9== .
replace c_33_10 = .v if c_33_10== .
replace c_34_1 = .v if c_34_1== .
replace c_34_2 = .v if c_34_2== .
replace c_34_3 = .v if c_34_3== .
replace c_34_4 = .v if c_34_4== .
replace c_34_5 = .v if c_34_5== .
replace c_34_6 = .v if c_34_6== .
replace c_34_7 = .v if c_34_7== .
replace c_34_8 = .v if c_34_8== .
replace c_34_9 = .v if c_34_9== .
replace c_34_10 = .v if c_34_10== .
replace c_35_1 = .v if c_35_1== .
replace c_35_2 = .v if c_35_2== .
replace c_35_3 = .v if c_35_3== .
replace c_35_4 = .v if c_35_4== .
replace c_35_5 = .v if c_35_5== .
replace c_35_6 = .v if c_35_6== .
replace c_35_7 = .v if c_35_7== .
replace c_35_8 = .v if c_35_8== .
replace c_35_9 = .v if c_35_9== .
replace c_35_10 = .v if c_35_10== .
replace c_45_a = .v if c_45_a== .
replace c_46 = .v if (c_46== . | c_46== .a)
replace c_46_a = .v if c_46_a== .
replace c_63_1 = .v if c_63_1== .
replace c_63_2 = .v if c_63_2== .
replace c_63_3 = .v if c_63_3== .
replace c_63_4 = .v if c_63_4== .
replace c_63_5 = .v if c_63_5== .
replace c_63_6 = .v if c_63_6== .
replace c_63_7 = .v if c_63_7== .
replace c_63_8 = .v if c_63_8== .
replace c_63_9 = .v if c_63_9== .
replace c_63_10 = .v if c_63_10== .
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


capture log close
log using CogMissingCodebook, text replace

codebook

   save CogMissing, replace


log close
exit, clear
