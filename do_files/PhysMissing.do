clear all 
set more off
capture log close
log using PhysMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Phys.dta", clear
   

replace p2_2_1 = .i if (p2_2_1 == . | p2_2_1 == .a) & p2_1 ~= 0
replace p2_2_1 = .v if p2_2_1 == .

replace p2_2_2 = .i if (p2_2_2 == . | p2_2_2 == .a) & p2_1 ~= 0
replace p2_2_2 = .v if p2_2_2 == .

replace p9_2 = .i if (p9_2 == . | p9_2 == .a) & (p9_1 ~= 0 & p9_1 ~= 6)
replace p9_2 = .v if p9_2 == .

replace p12_2_2 = .i if (p12_2_2 == . | p12_2_2 == .a) & (p12_2_1 ~= 3 & p12_2_1 ~= 6)
replace p12_2_2 = .v if p12_2_2 == .

replace p12_3_2 = .i if (p12_3_2 == . | p12_3_2 == .a) & (p12_3_1 ~= 3 & p12_3_1 ~= 6)
replace p12_3_2 = .v if p12_3_2 == .

replace p2_3_1 = .i if (p2_3_1 == . | p2_3_1 == .a) & p2_3 ~= 0
replace p2_3_1 = .v if p2_3_1 == .

replace p2_3_2 = .i if (p2_3_2 == . | p2_3_2 == .a) & p2_3 ~= 0
replace p2_3_2 = .v if p2_3_2 == .

replace p15_1_1 = .i if (p15_1_1 == . | p15_1_1 == .a) & p15_a ~= 0
replace p15_1_1 = .v if p15_1_1 == .

replace p15_1_2 = .i if (p15_1_2 == . | p15_1_2 == .a) & p15_a ~= 0
replace p15_1_2 = .v if p15_1_2 == .

replace p15_1_3 = .i if (p15_1_3 == . | p15_1_3 == .a) & p15_a ~= 0
replace p15_1_3 = .v if p15_1_3 == .

replace p15_2_1 = .i if (p15_2_1 == . | p15_2_1 == .a) & p15_a ~= 0
replace p15_2_1 = .v if p15_2_1 == .

replace p15_2_2 = .i if (p15_2_2 == . | p15_2_2 == .a) & p15_a ~= 0
replace p15_2_2 = .v if p15_2_2 == .

replace p15_2_3 = .i if (p15_2_3 == . | p15_2_3 == .a) & p15_a ~= 0
replace p15_2_3 = .v if p15_2_3 == .

replace p16_2 = .i if (p16_2 == . | p16_2 == .a) & p16_1 ~= 0
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




*replace all remaining . with .i

replace p_deviceid1 = ".i" if p_deviceid1 == ""
replace p_interid = .i if (p_interid == . | p_interid == .a)
replace p_clustid = .i if (p_clustid == . | p_clustid == .a)
replace p_houseid = .i if (p_houseid == . | p_houseid == .a)
replace p_particid = .i if (p_particid == . | p_particid == .a)
replace p_country = .i if (p_country == . | p_country == .a)
replace p_houseid2 = .i if (p_houseid2 == . | p_houseid2 == .a)
replace p_conglid2 = .i if (p_conglid2 == . | p_conglid2 == .a)
replace p_particid2 = ".i" if p_particid2 == ""
replace p2_1 = .i if (p2_1 == . | p2_1 == .a)
replace p2_2_1 = .i if (p2_2_1 == . | p2_2_1 == .a)
replace p2_2_2 = .i if (p2_2_2 == . | p2_2_2 == .a)
replace p3_d_c = .i if (p3_d_c == . | p3_d_c == .a)
replace p3_p = .i if (p3_p == . | p3_p == .a)
replace p4_d_c = .i if (p4_d_c == . | p4_d_c == .a)
replace p4_p = .i if (p4_p == . | p4_p == .a)
replace p5_1_d_c = .i if (p5_1_d_c == . | p5_1_d_c == .a)
replace p5_1_p = .i if (p5_1_p == . | p5_1_p == .a)
replace p5_2_d_c = .i if (p5_2_d_c == . | p5_2_d_c == .a)
replace p5_2_p = .i if (p5_2_p == . | p5_2_p == .a)
replace p6 = .i if (p6 == . | p6 == .a)
replace p7_1 = .i if (p7_1 == . | p7_1 == .a)
replace p7_2 = .i if (p7_2 == . | p7_2 == .a)
replace p7_3 = .i if (p7_3 == . | p7_3 == .a)
replace p8_1 = .i if (p8_1 == . | p8_1 == .a)
replace p8_2 = .i if (p8_2 == . | p8_2 == .a)
replace p8_3 = .i if (p8_3 == . | p8_3 == .a)
replace p9_1 = .i if (p9_1 == . | p9_1 == .a)
replace p9_2 = .i if (p9_2 == . | p9_2 == .a)
replace p10_1_1_1 = .i if (p10_1_1_1 == . | p10_1_1_1 == .a)
replace p10_1_1_2 = .i if (p10_1_1_2 == . | p10_1_1_2 == .a)
replace p10_1_2_1 = .i if (p10_1_2_1 == . | p10_1_2_1 == .a)
replace p10_1_2_2 = .i if (p10_1_2_2 == . | p10_1_2_2 == .a)
replace p10_2_1_1 = .i if (p10_2_1_1 == . | p10_2_1_1 == .a)
replace p10_2_1_2 = .i if (p10_2_1_2 == . | p10_2_1_2 == .a)
replace p10_2_2_1 = .i if (p10_2_2_1 == . | p10_2_2_1 == .a)
replace p10_2_2_2 = .i if (p10_2_2_2 == . | p10_2_2_2 == .a)
replace p11_1 = .i if (p11_1 == . | p11_1 == .a)
replace p11_2_1 = .i if (p11_2_1 == . | p11_2_1 == .a)
replace p11_2_2 = .i if (p11_2_2 == . | p11_2_2 == .a)
replace p11_3_1_1 = .i if (p11_3_1_1 == . | p11_3_1_1 == .a)
replace p11_3_1_2 = .i if (p11_3_1_2 == . | p11_3_1_2 == .a)
replace p11_3_2_1 = .i if (p11_3_2_1 == . | p11_3_2_1 == .a)
replace p11_3_2_2 = .i if (p11_3_2_2 == . | p11_3_2_2 == .a)
replace p12_1 = .i if (p12_1 == . | p12_1 == .a)
replace p12_2_1 = .i if (p12_2_1 == . | p12_2_1 == .a)
replace p12_2_2 = .i if (p12_2_2 == . | p12_2_2 == .a)
replace p12_3_1 = .i if (p12_3_1 == . | p12_3_1 == .a)
replace p12_3_2 = .i if (p12_3_2 == . | p12_3_2 == .a)
replace p13_1 = .i if (p13_1 == . | p13_1 == .a)
replace p13_2 = .i if (p13_2 == . | p13_2 == .a)
replace p13_3 = .i if (p13_3 == . | p13_3 == .a)
replace p13_4 = .i if (p13_4 == . | p13_4 == .a)
replace p13_5 = .i if (p13_5 == . | p13_5 == .a)
replace p2_3 = .i if (p2_3 == . | p2_3 == .a)
replace p2_3_1 = .i if (p2_3_1 == . | p2_3_1 == .a)
replace p2_3_2 = .i if (p2_3_2 == . | p2_3_2 == .a)
replace p14_1 = .i if (p14_1 == . | p14_1 == .a)
replace p14_2 = .i if (p14_2 == . | p14_2 == .a)
replace p14_3_1 = .i if (p14_3_1 == . | p14_3_1 == .a)
replace p14_3_2 = .i if (p14_3_2 == . | p14_3_2 == .a)
replace p14_4 = .i if (p14_4 == . | p14_4 == .a)
replace p14_5 = .i if (p14_5 == . | p14_5 == .a)
replace p15_a = .i if (p15_a == . | p15_a == .a)
replace p15_1_1 = .i if (p15_1_1 == . | p15_1_1 == .a)
replace p15_1_2 = .i if (p15_1_2 == . | p15_1_2 == .a)
replace p15_1_3 = .i if (p15_1_3 == . | p15_1_3 == .a)
replace p15_2_1 = .i if (p15_2_1 == . | p15_2_1 == .a)
replace p15_2_2 = .i if (p15_2_2 == . | p15_2_2 == .a)
replace p15_2_3 = .i if (p15_2_3 == . | p15_2_3 == .a)
replace p16_1 = .i if (p16_1 == . | p16_1 == .a)
replace p16_2 = .i if (p16_2 == . | p16_2 == .a)
replace p17_1 = .i if (p17_1 == . | p17_1 == .a)
replace p17_2 = .i if (p17_2 == . | p17_2 == .a)
replace p17_3 = .i if (p17_3 == . | p17_3 == .a)
replace p18_d_c = .i if (p18_d_c == . | p18_d_c == .a)
replace p18_p = .i if (p18_p == . | p18_p == .a)
replace p19_1 = .i if (p19_1 == . | p19_1 == .a)
replace p19_2 = .i if (p19_2 == . | p19_2 == .a)
replace p20 = .i if (p20 == . | p20 == .a)
replace p21_1 = .i if (p21_1 == . | p21_1 == .a)
replace p21_2 = .i if (p21_2 == . | p21_2 == .a)
replace p22_1 = .i if (p22_1 == . | p22_1 == .a)
replace p22_2 = .i if (p22_2 == . | p22_2 == .a)
replace p_deviceid2 = ".i" if p_deviceid2 == ""




capture log close
log using PhysMissingCodebook, text replace

codebook

   save PhysMissing, replace


log close
exit, clear

