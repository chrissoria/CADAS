clear all 
set more off
capture log close
log using PhysMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Phys.dta", clear
   

replace p2_2_1 = .b if (p2_2_1 == . | p2_2_1 == .a) & p2_1 ~= 0
replace p2_2_1 = .v if p2_2_1 == .

replace p2_2_2 = .b if (p2_2_2 == . | p2_2_2 == .a) & p2_1 ~= 0
replace p2_2_2 = .v if p2_2_2 == .

replace p9_2 = .b if (p9_2 == . | p9_2 == .a) & (p9_1 ~= 0 & p9_1 ~= 6)
replace p9_2 = .v if p9_2 == .

replace p12_2_2 = .b if (p12_2_2 == . | p12_2_2 == .a) & (p12_2_1 ~= 3 & p12_2_1 ~= 6)
replace p12_2_2 = .v if p12_2_2 == .

replace p12_3_2 = .b if (p12_3_2 == . | p12_3_2 == .a) & (p12_3_1 ~= 3 & p12_3_1 ~= 6)
replace p12_3_2 = .v if p12_3_2 == .

replace p2_3_1 = .b if (p2_3_1 == . | p2_3_1 == .a) & p2_3 ~= 0
replace p2_3_1 = .v if p2_3_1 == .

replace p2_3_2 = .b if (p2_3_2 == . | p2_3_2 == .a) & p2_3 ~= 0
replace p2_3_2 = .v if p2_3_2 == .

replace p15_1_1 = .b if (p15_1_1 == . | p15_1_1 == .a) & p15_a ~= 0
replace p15_1_1 = .v if p15_1_1 == .

replace p15_1_2 = .b if (p15_1_2 == . | p15_1_2 == .a) & p15_a ~= 0
replace p15_1_2 = .v if p15_1_2 == .

replace p15_1_3 = .b if (p15_1_3 == . | p15_1_3 == .a) & p15_a ~= 0
replace p15_1_3 = .v if p15_1_3 == .

replace p15_2_1 = .b if (p15_2_1 == . | p15_2_1 == .a) & p15_a ~= 0
replace p15_2_1 = .v if p15_2_1 == .

replace p15_2_2 = .b if (p15_2_2 == . | p15_2_2 == .a) & p15_a ~= 0
replace p15_2_2 = .v if p15_2_2 == .

replace p15_2_3 = .b if (p15_2_3 == . | p15_2_3 == .a) & p15_a ~= 0
replace p15_2_3 = .v if p15_2_3 == .

replace p16_2 = .b if (p16_2 == . | p16_2 == .a) & p16_1 ~= 0
replace p16_2 = .v if p16_2 == .



replace p3_d_c = .v if (p3_d_c == . | p3_d_c == .a) & p_country == 0
replace p3_p = .v if (p3_p == . | p3_p == .a) & (p_country == 1 | p_country == 2)
replace p4_d_c = .v if (p4_d_c == . | p4_d_c == .a) & p_country == 0
replace p4_p = .v if (p4_p == . | p4_p == .a) & (p_country == 1 | p_country == 2)
replace p5_1_d_c = .v if (p5_1_d_c == . | p5_1_d_c == .a) & p_country == 0
replace p5_1_p = .v if (p5_1_p == . | p5_1_p == .a) & (p_country == 1 | p_country == 2)
replace p5_2_d_c = .v if (p5_2_d_c == . | p5_2_d_c == .a) & p_country == 0
replace p5_2_p = .v if (p5_2_p == . | p5_2_p == .a) & (p_country == 1 | p_country == 2)
replace p18_d_c = .v if (p18_d_c == . | p18_d_c == .a) & p_country == 0
replace p18_p = .v if (p18_p == . | p18_p == .a) & (p_country == 1 | p_country == 2)


capture log close
log using PhysMissingCodebook, text replace

codebook

   save PhysMissing, replace


log close
exit, clear

