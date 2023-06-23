clear all 
set more off
capture log close
log using InforMissing, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/data/info"
 
   use using "C:\Users\Ty\Desktop\Cuba DTA files\Infor.dta", clear
   
   
replace i_c2 = .b if (i_c2 == . | i_c2 == .a) & i_c1 ~= 3

replace i_c3 = .b if (i_c3 == . | i_c3 == .a) & i_c1 ~= 3

replace i_c4 = .b if (i_c4 == . | i_c4 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c5 = .b if (i_c5 == . | i_c5 == .a) & (i_c4 == 1 | i_c4 == .b)
*c5 should not have been answered in line 11

replace i_c6 = .b if (i_c6 == . | i_c6 == .a) & (i_c5 == 1 | i_c5 == .b)

replace i_c7 = .b if (i_c7 == . | i_c7 == .a) & (i_c5 == 2 | i_c5 == .b)

replace i_c7_1 = .b if (i_c7_1 == . | i_c7_1 == .a) & (i_c5 == 1 | i_c5 == 2 | i_c5 == .b)

replace i_c8 = .b if (i_c8 == . | i_c8 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c8a = .b if (i_c8a == . | i_c8a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c9 = .b if (i_c9 == . | i_c9 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c10 = .b if (i_c10 == . | i_c10 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4 & i_c9 ~= 2 & i_c9 ~= 8)

replace i_c11 = .b if (i_c11 == . | i_c11 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c12 = .b if (i_c12 == . | i_c12 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9)

replace i_c23 = .b if (i_c23 == . | i_c23 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9)

replace i_c24 = .b if (i_c24 == . | i_c24 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9 & i_c23 ~= 2 & i_c23 ~= 8 & i_c23 ~= 9)
*c24 should not have been answered in line 11, 16

replace i_c25 = .b if (i_c25 == . | i_c25 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c26 = .b if (i_c26 == . | i_c26 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c26a = .b if (i_c26a == . | i_c26a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c27 = .b if (i_c27 == . | i_c27 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c27a = .b if (i_c27a == . | i_c27a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_d2 = .b if (i_d2 == . | i_d2 == .a) & i_c4 == 1

replace i_d3 = .b if (i_d3 == . | i_d3 == .a) & i_c4 == 1

replace i_d5 = .b if (i_d5 == . | i_d5 == .a) & i_c4 == 1

replace i_d6 = .b if (i_d6 == . | i_d6 == .a) & i_c4 == 1

replace i_d9 = .b if (i_d9 == . | i_d9 == .a) & i_c4 == 1

replace i_d10 = .b if (i_d10 == . | i_d10 == .a) & i_c4 == 1

replace i_d11 = .b if (i_d11 == . | i_d11 == .a) & i_c4 == 1

replace i_d12 = .b if (i_d12 == . | i_d12 == .a) & i_c4 == 1

replace i_d17 = .b if (i_d17 == . | i_d17 == .a) & i_c4 == 1

replace i_d19 = .b if (i_d19 == . | i_d19 == .a) & i_c4 == 1

replace i_d20 = .b if (i_d20 == . | i_d20 == .a) & i_c4 == 1

replace i_d21 = .b if (i_d21 == . | i_d21 == .a) & i_c4 == 1

replace i_f_csid_17a = .b if (i_f_csid_17a == . | i_f_csid_17a == .a) & i_f_csid_17 ~= 0

replace i_f_csid_22_2 = .b if (i_f_csid_22_2 == . | i_f_csid_22_2 == .a) & i_f_csid_22_1 ~= 0

replace i_f_csid_23_2 = .b if (i_f_csid_23_2 == . | i_f_csid_23_2 == .a) & i_f_csid_23_1 ~= 0

replace i_f_csid_24_2 = .b if (i_f_csid_24_2 == . | i_f_csid_24_2 == .a) & i_f_csid_22_1 ~= 0

*lines 6 and 9 did not skip to section H after answering si to f.csid.28

replace i_g0 = .b if (i_g0 == . | i_g0 == .a) & i_f_csid_28 ~= 1

replace i_g1 = .b if (i_g1 == . | i_g1 == .a) & i_f_csid_28 ~= 1

replace i_g1_1 = .b if (i_g1_1 == . | i_g1_1 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_2 = .b if (i_g1_2 == . | i_g1_2 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_3 = .b if (i_g1_3 == . | i_g1_3 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9 & i_g1_2 ~= 0 & i_g1_2 ~= 8 & i_g1_2 ~= 9)

replace i_g1_4 = .b if (i_g1_4 == . | i_g1_4 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_5 = .b if (i_g1_5 == . | i_g1_5 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9 & i_g1_4 ~= 0 & i_g1_4 ~= 8 & i_g1_4 ~= 9)

replace i_g_has_2 = .b if (i_g_has_2 == . | i_g_has_2 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_1 = .b if (i_g_has_3_1 == . | i_g_has_3_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_11 = .b if (i_g_has_3_11 == . | i_g_has_3_11 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_13 = .b if (i_g_has_3_13 == . | i_g_has_3_13 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_14 = .b if (i_g_has_3_14 == . | i_g_has_3_14 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_16 = .b if (i_g_has_3_16 == . | i_g_has_3_16 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_22 = .b if (i_g_has_3_22 == . | i_g_has_3_22 == .a) & i_f_csid_28 ~= 1

replace i_g_has_4 = .b if (i_g_has_4 == . | i_g_has_4 == .a) & i_f_csid_28 ~= 1

replace i_g_has_5_1 = .b if (i_g_has_5_1 == . | i_g_has_5_1 == .a) & (i_f_csid_28 ~= 1 & i_g_has_4 ~= 0 & i_g_has_4 ~= 8 & i_g_has_4 ~= 9)

replace i_g_has_6 = .b if (i_g_has_6 == . | i_g_has_6 == .a) & i_f_csid_28 ~= 1

replace i_g_has_7_1 = .b if (i_g_has_7_1 == . | i_g_has_7_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_10 = .b if (i_g_has_10 == . | i_g_has_10 == .a) & i_f_csid_28 ~= 1

replace i_g_has_11 = .b if (i_g_has_11 == . | i_g_has_11 == .a) & i_f_csid_28 ~= 1

replace i_g_has_12 = .b if (i_g_has_12 == . | i_g_has_12 == .a) & i_f_csid_28 ~= 1

replace i_g_has_13 = .b if (i_g_has_13 == . | i_g_has_13 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_10 ~= 0 | i_g_has_11 ~= 0 | i_g_has_12 ~= 0))

replace i_g_has_14_1 = .b if (i_g_has_14_1 == . | i_g_has_14_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_15 = .b if (i_g_has_15 == . | i_g_has_15 == .a) & i_f_csid_28 ~= 1

replace i_g_has_17 = .b if (i_g_has_17 == . | i_g_has_17 == .a) & i_f_csid_28 ~= 1

replace i_g_has_18 = .b if (i_g_has_18 == . | i_g_has_18 == .a) & (i_f_csid_28 ~= 1 & i_g_has_17 ~= 0 & i_g_has_17 ~= 8 & i_g_has_17 ~= 9)

replace i_g_has_47 = .b if (i_g_has_47 == . | i_g_has_47 == .a) & i_f_csid_28 ~= 1

replace i_g_has_48 = .b if (i_g_has_48 == . | i_g_has_48 == .a) & i_f_csid_28 ~= 1

replace i_g_has_49 = .b if (i_g_has_49 == . | i_g_has_49 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_47 ~= 0 | i_g_has_48 ~= 0))

replace i_g_has_50 = .b if (i_g_has_50 == . | i_g_has_50 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_47 ~= 0 | i_g_has_48 ~= 0))

replace i_g_has_52 = .b if (i_g_has_52 == . | i_g_has_52 == .a) & i_f_csid_28 ~= 1

replace i_h_npi_1_1 = .b if (i_h_npi_1_1 == . | i_h_npi_1_1 == .a) & (i_h_npi_1 ~= 0 & i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9)
*line 11 was not supposed to answer this question

replace i_h_npi_1_2 = .b if (i_h_npi_1_2 == . | i_h_npi_1_2 == .a) & (i_h_npi_1 ~= 0 & i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9)

replace i_h_npi_2_1 = .b if (i_h_npi_2_1 == . | i_h_npi_2_1 == .a) & (i_h_npi_2 ~= 0 & i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9)

replace i_h_npi_2_2 = .b if (i_h_npi_2_2 == . | i_h_npi_2_2 == .a) & (i_h_npi_2 ~= 0 & i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9)
*line 3 did not answer this

replace i_h_npi_3_1 = .b if (i_h_npi_3_1 == . | i_h_npi_3_1 == .a) & (i_h_npi_3 ~= 0 & i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9)

replace i_h_npi_3_2 = .b if (i_h_npi_3_2 == . | i_h_npi_3_2 == .a) & (i_h_npi_3 ~= 0 & i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9)
*line 9 and 13 did not answer this

replace i_h_npi_4_1 = .b if (i_h_npi_4_1 == . | i_h_npi_4_1 == .a) & (i_h_npi_4 ~= 0 & i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9)

replace i_h_npi_4_2 = .b if (i_h_npi_4_2 == . | i_h_npi_4_2 == .a) & (i_h_npi_4 ~= 0 & i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9)

replace i_h_npi_5_1 = .b if (i_h_npi_5_1 == . | i_h_npi_5_1 == .a) & (i_h_npi_5 ~= 0 & i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9)

replace i_h_npi_5_2 = .b if (i_h_npi_5_2 == . | i_h_npi_5_2 == .a) & (i_h_npi_5 ~= 0 & i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9)

replace i_h_npi_6_1 = .b if (i_h_npi_6_1 == . | i_h_npi_6_1 == .a) & (i_h_npi_6 ~= 0 & i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9)

replace i_h_npi_6_2 = .b if (i_h_npi_6_2 == . | i_h_npi_6_2 == .a) & (i_h_npi_6 ~= 0 & i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9)

replace i_h_npi_7_1 = .b if (i_h_npi_7_1 == . | i_h_npi_7_1 == .a) & (i_h_npi_7 ~= 0 & i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9)

replace i_h_npi_7_2 = .b if (i_h_npi_7_2 == . | i_h_npi_7_2 == .a) & (i_h_npi_7 ~= 0 & i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9)

replace i_h_npi_2_1 = .b if (i_h_npi_8_1 == . | i_h_npi_8_1 == .a) & (i_h_npi_8 ~= 0 & i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9)

replace i_h_npi_2_2 = .b if (i_h_npi_8_2 == . | i_h_npi_8_2 == .a) & (i_h_npi_8 ~= 0 & i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9)

replace i_h_npi_9_1 = .b if (i_h_npi_9_1 == . | i_h_npi_9_1 == .a) & (i_h_npi_9 ~= 0 & i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9)

replace i_h_npi_9_2 = .b if (i_h_npi_9_2 == . | i_h_npi_9_2 == .a) & (i_h_npi_9 ~= 0 & i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9)

replace i_h_npi_10_1 = .b if (i_h_npi_10_1 == . | i_h_npi_10_1 == .a) & (i_h_npi_10 ~= 0 & i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9)

replace i_h_npi_10_2 = .b if (i_h_npi_10_2 == . | i_h_npi_10_2 == .a) & (i_h_npi_10 ~= 0 & i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9)

replace i_h_npi_11_1 = .b if (i_h_npi_11_1 == . | i_h_npi_11_1 == .a) & (i_h_npi_11 ~= 0 & i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9)

replace i_h_npi_11_2 = .b if (i_h_npi_11_2 == . | i_h_npi_11_2 == .a) & (i_h_npi_11 ~= 0 & i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9)

replace i_h_npi_12_1 = .b if (i_h_npi_12_1 == . | i_h_npi_12_1 == .a) & (i_h_npi_12 ~= 0 & i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9)

replace i_h_npi_12_2 = .b if (i_h_npi_12_2 == . | i_h_npi_12_2 == .a) & (i_h_npi_12 ~= 0 & i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9)

replace i_j2 = .b if (i_j2 == . | i_j2 == .a) & (i_j1 ~= 0 & i_j1 ~= 8 & i_j1 ~= 9)

replace i_j3 = .b if (i_j3 == . | i_j3 == .a) & (i_j1 ~= 0 & i_j1 ~= 8 & i_j1 ~= 9)

replace i_k_act_17 = .b if (i_k_act_17 == . | i_k_act_17 == .a) & (i_k_act_16 ~= 6 & i_k_act_16 ~= 8 & i_k_act_16 ~= 9)






replace i_c2 = .v if (i_c2 == . | i_c2 == .a)
replace i_c3 = .v if (i_c3 == . | i_c3 == .a)
replace i_c4 = .v if (i_c4 == . | i_c4 == .a)
replace i_c5 = .v if (i_c5 == . | i_c5 == .a)
replace i_c6 = .v if (i_c6 == . | i_c6 == .a)
replace i_c7 = .v if (i_c7 == . | i_c7 == .a)
replace i_c7_1 = .v if (i_c7_1 == . | i_c7_1 == .a)
replace i_c8 = .v if (i_c8 == . | i_c8 == .a)
replace i_c8a = .v if (i_c8a == . | i_c8a == .a)
replace i_c9 = .v if (i_c9 == . | i_c9 == .a)
replace i_c10 = .v if (i_c10 == . | i_c10 == .a)
replace i_c11 = .v if (i_c11 == . | i_c11 == .a)
replace i_c12 = .v if (i_c12 == . | i_c12 == .a)
replace i_c23 = .v if (i_c23 == . | i_c23 == .a)
replace i_c24 = .v if (i_c24 == . | i_c24 == .a)
replace i_c25 = .v if (i_c25 == . | i_c25 == .a)
replace i_c26 = .v if (i_c26 == . | i_c26 == .a)
replace i_c26a = .v if (i_c26a == . | i_c26a == .a)
replace i_c27 = .v if (i_c27 == . | i_c27 == .a)
replace i_c27a = .v if (i_c27a == . | i_c27a == .a)
replace i_d2 = .v if (i_d2 == . | i_d2 == .a)
replace i_d3 = .v if (i_d3 == . | i_d3 == .a)
replace i_d5 = .v if (i_d5 == . | i_d5 == .a)
replace i_d6 = .v if (i_d6 == . | i_d6 == .a)
replace i_d9 = .v if (i_d9 == . | i_d9 == .a)
replace i_d10 = .v if (i_d10 == . | i_d10 == .a)
replace i_d11 = .v if (i_d11 == . | i_d11 == .a)
replace i_d12 = .v if (i_d12 == . | i_d12 == .a)
replace i_d17 = .v if (i_d17 == . | i_d17 == .a)
replace i_d19 = .v if (i_d19 == . | i_d19 == .a)
replace i_d20 = .v if (i_d20 == . | i_d20 == .a)
replace i_d21 = .v if (i_d21 == . | i_d21 == .a)
replace i_f_csid_17a = .v if (i_f_csid_17a == . | i_f_csid_17a == .a)
replace i_f_csid_22_2 = .v if (i_f_csid_22_2 == . | i_f_csid_22_2 == .a)
replace i_f_csid_23_2 = .v if (i_f_csid_23_2 == . | i_f_csid_23_2 == .a)
replace i_f_csid_24_2 = .v if (i_f_csid_24_2 == . | i_f_csid_24_2 == .a)
replace i_g0 = .v if (i_g0 == . | i_g0 == .a)
replace i_g1 = .v if (i_g1 == . | i_g1 == .a)
replace i_g1_1 = .v if (i_g1_1 == . | i_g1_1 == .a)
replace i_g1_2 = .v if (i_g1_2 == . | i_g1_2 == .a)
replace i_g1_3 = .v if (i_g1_3 == . | i_g1_3 == .a)
replace i_g1_4 = .v if (i_g1_4 == . | i_g1_4 == .a)
replace i_g1_5 = .v if (i_g1_5 == . | i_g1_5 == .a)
replace i_g_has_2 = .v if (i_g_has_2 == . | i_g_has_2 == .a)
replace i_g_has_3_1 = .v if (i_g_has_3_1 == . | i_g_has_3_1 == .a)
replace i_g_has_3_11 = .v if (i_g_has_3_11 == . | i_g_has_3_11 == .a)
replace i_g_has_3_13 = .v if (i_g_has_3_13 == . | i_g_has_3_13 == .a)
replace i_g_has_3_14 = .v if (i_g_has_3_14 == . | i_g_has_3_14 == .a)
replace i_g_has_3_16 = .v if (i_g_has_3_16 == . | i_g_has_3_16 == .a)
replace i_g_has_3_22 = .v if (i_g_has_3_22 == . | i_g_has_3_22 == .a)
replace i_g_has_4 = .v if (i_g_has_4 == . | i_g_has_4 == .a)
replace i_g_has_5_1 = .v if (i_g_has_5_1 == . | i_g_has_5_1 == .a)
replace i_g_has_6 = .v if (i_g_has_6 == . | i_g_has_6 == .a)
replace i_g_has_7_1 = .v if (i_g_has_7_1 == . | i_g_has_7_1 == .a)
replace i_g_has_10 = .v if (i_g_has_10 == . | i_g_has_10 == .a)
replace i_g_has_11 = .v if (i_g_has_11 == . | i_g_has_11 == .a)
replace i_g_has_12 = .v if (i_g_has_12 == . | i_g_has_12 == .a)
replace i_g_has_13 = .v if (i_g_has_13 == . | i_g_has_13 == .a)
replace i_g_has_14_1 = .v if (i_g_has_14_1 == . | i_g_has_14_1 == .a)
replace i_g_has_15 = .v if (i_g_has_15 == . | i_g_has_15 == .a)
replace i_g_has_17 = .v if (i_g_has_17 == . | i_g_has_17 == .a)
replace i_g_has_18 = .v if (i_g_has_18 == . | i_g_has_18 == .a)
replace i_g_has_47 = .v if (i_g_has_47 == . | i_g_has_47 == .a)
replace i_g_has_48 = .v if (i_g_has_48 == . | i_g_has_48 == .a)
replace i_g_has_49 = .v if (i_g_has_49 == . | i_g_has_49 == .a)
replace i_g_has_50 = .v if (i_g_has_50 == . | i_g_has_50 == .a)
replace i_g_has_52 = .v if (i_g_has_52 == . | i_g_has_52 == .a)
replace i_h_npi_1_1 = .v if (i_h_npi_1_1 == . | i_h_npi_1_1 == .a)
replace i_h_npi_1_2 = .v if (i_h_npi_1_2 == . | i_h_npi_1_2 == .a)
replace i_h_npi_2_1 = .v if (i_h_npi_2_1 == . | i_h_npi_2_1 == .a)
replace i_h_npi_2_2 = .v if (i_h_npi_2_2 == . | i_h_npi_2_2 == .a)
replace i_h_npi_3_1 = .v if (i_h_npi_3_1 == . | i_h_npi_3_1 == .a)
replace i_h_npi_3_2 = .v if (i_h_npi_3_2 == . | i_h_npi_3_2 == .a)
replace i_h_npi_4_1 = .v if (i_h_npi_4_1 == . | i_h_npi_4_1 == .a)
replace i_h_npi_4_2 = .v if (i_h_npi_4_2 == . | i_h_npi_4_2 == .a)
replace i_h_npi_5_1 = .v if (i_h_npi_5_1 == . | i_h_npi_5_1 == .a)
replace i_h_npi_5_2 = .v if (i_h_npi_5_2 == . | i_h_npi_5_2 == .a)
replace i_h_npi_6_1 = .v if (i_h_npi_6_1 == . | i_h_npi_6_1 == .a)
replace i_h_npi_6_2 = .v if (i_h_npi_6_2 == . | i_h_npi_6_2 == .a)
replace i_h_npi_7_1 = .v if (i_h_npi_7_1 == . | i_h_npi_7_1 == .a)
replace i_h_npi_7_2 = .v if (i_h_npi_7_2 == . | i_h_npi_7_2 == .a)
replace i_h_npi_2_1 = .v if (i_h_npi_2_1 == . | i_h_npi_2_1 == .a)
replace i_h_npi_2_2 = .v if (i_h_npi_2_2 == . | i_h_npi_2_2 == .a)
replace i_h_npi_9_1 = .v if (i_h_npi_9_1 == . | i_h_npi_9_1 == .a)
replace i_h_npi_9_2 = .v if (i_h_npi_9_2 == . | i_h_npi_9_2 == .a)
replace i_h_npi_10_1 = .v if (i_h_npi_10_1 == . | i_h_npi_10_1 == .a)
replace i_h_npi_10_2 = .v if (i_h_npi_10_2 == . | i_h_npi_10_2 == .a)
replace i_h_npi_11_1 = .v if (i_h_npi_11_1 == . | i_h_npi_11_1 == .a)
replace i_h_npi_11_2 = .v if (i_h_npi_11_2 == . | i_h_npi_11_2 == .a)
replace i_h_npi_12_1 = .v if (i_h_npi_12_1 == . | i_h_npi_12_1 == .a)
replace i_h_npi_12_2 = .v if (i_h_npi_12_2 == . | i_h_npi_12_2 == .a)
replace i_j2 = .v if (i_j2 == . | i_j2 == .a)
replace i_j3 = .v if (i_j3 == . | i_j3 == .a)
replace i_k_act_17 = .v if (i_k_act_17 == . | i_k_act_17 == .a)




capture log close
log using InforMissingCodebook, text replace

codebook

   save InforMissing, replace


log close
exit, clear
