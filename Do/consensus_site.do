clear all 

set more off

capture log close



capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"

capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"



if `"`user'"' == "Chris" {

local path = "/Users/chrissoria/documents/CADAS/Data"

include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

}



else if `"`user'"' == "Ty" {

local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

}



if `country' == 0 {

    cd "`path'/PR_out"

}

else if `country' == 1 {

    cd "`path'/DR_out"

}

else if `country' == 2 {

    cd "`path'/CUBA_out"

}



*Start by merging important variables from Cognitive, Sociodemographic, Informant

* Set translation folder path based on language
if `"$language"' == "E" {
    if `country' == 0 {
        local trans_folder "translation_PR/"
    }
    else if `country' == 1 {
        local trans_folder "translation_DR/"
    }
    else if `country' == 2 {
        local trans_folder "translation_CUBA/"
    }
}
else {
    local trans_folder ""
}

use using `trans_folder'Infor



keep pid globalrecordid i_clustid i_a2 i_a3 i_a4 i_b5 i_b3 i_b4 i_b7 i_b1 i_c4 i_lhas_54 i_c1 i_c2 i_g0 i_e1 i_e2 i_e3 i_e4 i_e5 i_e6 i_e7 i_e8 i_e9 i_e10 i_e11 i_e12 i_e13 i_e14 i_e15 i_e16 i_f_csid_1 i_f_csid_2 i_f_csid_3 i_f_csid_4 i_f_csid_5 i_f_bse_3 i_f_bse_7 i_f_csid_6 i_f_csid_7 i_f_csid_8 i_f_csid_9 i_f_csid_10 i_f_csid_11 i_f_csid_12 i_f_csid_13 i_f_csid_14 i_f_csid_15 i_f_csid_16 i_f_csid_17 i_f_csid_17a i_f_csid_18 i_f_csid_19 i_f_csid_20 i_f_csid_21 i_f_csid_22_1 i_f_csid_22_2 i_f_csid_23_1 i_f_csid_23_2 i_f_csid_24_1 i_f_csid_24_2 i_f_csid_25 i_f_csid_26 i_f_csid_27 i_k_act_15 i_k_act_16 i_k_act_17 i_k_act_10 i_k_act_13 i_k_act_14 i_k_act_1 i_k_act_2 i_k_act_5 i_k_act_7 i_k_act_8 i_g_has_2 i_g_has_3_11 i_g_has_3_13 i_g_has_3_16 i_g_has_4 i_g_has_5_1 i_g_has_7_1 i_g_has_10 i_g_has_11 i_h_npi_1 i_h_npi_1_1 i_h_npi_2 i_h_npi_2_1 i_h_npi_3 i_h_npi_3_1 i_h_npi_4 i_h_npi_4_1 i_h_npi_5 i_h_npi_5_1 i_h_npi_6 i_h_npi_6_1 i_h_npi_7 i_h_npi_7_1 i_h_npi_8 i_h_npi_8_1 i_h_npi_9 i_h_npi_9_1 i_h_npi_10 i_h_npi_10_1 i_h_npi_11 i_h_npi_11_1 i_h_npi_12 i_h_npi_12_1

rename i_clustid n_clustid

rename globalrecordid i_globalrecordid



merge m:m pid using `trans_folder'Socio.dta, keepusing(globalrecordid s_2_3 s_0 s_2_9 s_2_8c s_8_5a s_8_3 s_3_6 s_3_7 s_3_5 s_2_12 s_2_13 s_13_19 s_13_20 s_13_22 s_12_11 s_12_13 s_12_14 s_12_15 s_12_16 s_10_1a s_10_1b s_10_1c s_10_1d s_10_1e s_10_1f s_10_1g s_10_1h)

rename globalrecordid s_globalrecordid

drop _merge



merge m:m pid using `trans_folder'cog_merged.dta, keepusing(pid globalrecordid c_80b c_80a c_15 c_16 c_17 c_18 c_19 c_45 c_45_a c_46 c_46_a c_81 c_1 c_2_d c_3 c_4 c_5 c_6 c_7_d_c c_7_p c_8 c_9 c_10 c_20 c_26 c_30 c_31 c_48 c_49 c_50 c_51 c_52 c_53 c_54 c_55 c_56 c_58 c_59 c_60 c_61 c_62 c_70_d_c c_70_p pent_pic c_33_1 c_33_2 c_33_3 c_33_4 c_33_5 c_33_6 c_33_7 c_33_8 c_33_9 c_33_10 c_34_1 c_34_2 c_34_3 c_34_4 c_34_5 c_34_6 c_34_7 c_34_8 c_34_9 c_34_10 c_35_1 c_35_2 c_35_3 c_35_4 c_35_5 c_35_6 c_35_7 c_35_8 c_35_9 c_35_10 c_63_1 c_63_2 c_63_3 c_63_4 c_63_5 c_63_6 c_63_7 c_63_8 c_63_9 c_63_10 c_68_01 c_68_02 c_68_03 c_68_04 c_68_05 c_68_06 c_68_07 c_68_08 c_68_09 c_68_10 c_68_11 c_68_12 c_68_13 c_68_14 c_68_15 c_68_16 c_68_17 c_68_18 c_68_19 c_68_20 c_11 c_12 c_13 c_21 c_22 c_23 c_24 c_25 c_27 c_28 c_29 cs_32 c_32 c_33_a c_34_a c_35_a c_63_a c_68_a c_2_p_c c_2_d)

rename globalrecordid c_globalrecordid

drop _merge



*add variable to indicate if observation has a cropped pentagon image uploaded and Ty's scoring of pentagons

if `country' == 0 {

    merge m:m pid using "`path'/PR_in/pent_cropped_check.dta", keepusing(cropped_pent_uploaded)

}

else if `country' == 1 {

    merge m:m pid using "`path'/DR_in/pent_cropped_check.dta", keepusing(cropped_pent_uploaded)

}

else if `country' == 2 {

    merge m:m pid using "`path'/CUBA_in/pent_cropped_check.dta", keepusing(cropped_pent_uploaded)

}

drop _merge

replace cropped_pent_uploaded = "missing" if (cropped_pent_uploaded ~= "0" & cropped_pent_uploaded ~= "1" & cropped_pent_uploaded ~= "2")



save `trans_folder'ConsensusVariables.dta, replace



clear all

* Re-define translation folder path after clear all
if `"$language"' == "E" {
    if `country' == 0 {
        local trans_folder "translation_PR/"
    }
    else if `country' == 1 {
        local trans_folder "translation_DR/"
    }
    else if `country' == 2 {
        local trans_folder "translation_CUBA/"
    }
}
else {
    local trans_folder ""
}

*Prepare to merge Neighborhood by collapsing into 1 observation for each cluster, and rounding n_1

use using `trans_folder'Neighborhood



collapse (mean) n_1, by(n_clustid)



gen double n_1a = recode(n_1, 0.49, 1.5, 3)



recode n_1a (0.49=0) (1.5=1) (3=2), gen(n_1new)



save temp1, replace



use using `trans_folder'ConsensusVariables



merge m:1 n_clustid using temp1.dta, keepusing(n_1new)

drop _merge



capture erase "`path'\DR_out\temp1.dta"



*merge all c_7 questions with each other, and c_70 questions with each other, and c_2 questions with each other (since they were country specific)

gen c_7_all = c_7_d_c

replace c_7_all = c_7_p if substr(pid, 1, 1) == "0"



gen c_70_all = c_70_d_c

replace c_70_all = c_70_p if substr(pid, 1, 1) == "0"



gen c_2_all = c_2_p_c

replace c_2_all = c_2_d if substr(pid, 1, 1) == "1"



*combine c_45 and c_46

replace c_45 = c_46 if c_45 == 2

replace c_45_a = c_46_a if (c_46_a ~= . & c_46_a ~= .i & c_46_a ~= .v & c_46_a <= c_45_a)

replace c_45_a = round(c_45_a)



*replace c_58,c_59,c_60 with i_a2,i_a3,i_a4

replace c_58 = i_a2

replace c_59 = i_a3

replace c_60 = i_a4



*fix s_2_8c if years of education is higher than 30

replace s_2_8c = .m if (s_2_8c > 30 & (s_2_8c ~= 88 & s_2_8c ~= 99 & s_2_8c ~= . & s_2_8c ~= .i & s_2_8c ~= .v))



*CREATE SUMMARY VARIABLES

*pent_pic, cs_32 are already created





*JORM IQ CODE

gen JORM_IQCODE_summ_raw = 0

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e1) if (i_e1 ~= 8 & i_e1 ~= 9 & i_e1 ~= .i & i_e1 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e2) if (i_e2 ~= 8 & i_e2 ~= 9 & i_e2 ~= .i & i_e2 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e3) if (i_e3 ~= 8 & i_e3 ~= 9 & i_e3 ~= .i & i_e3 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e4) if (i_e4 ~= 8 & i_e4 ~= 9 & i_e4 ~= .i & i_e4 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e5) if (i_e5 ~= 8 & i_e5 ~= 9 & i_e5 ~= .i & i_e5 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e6) if (i_e6 ~= 8 & i_e6 ~= 9 & i_e6 ~= .i & i_e6 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e7) if (i_e7 ~= 8 & i_e7 ~= 9 & i_e7 ~= .i & i_e7 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e8) if (i_e8 ~= 8 & i_e8 ~= 9 & i_e8 ~= .i & i_e8 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e9) if (i_e9 ~= 8 & i_e9 ~= 9 & i_e9 ~= .i & i_e9 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e10) if (i_e10 ~= 8 & i_e10 ~= 9 & i_e10 ~= .i & i_e10 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e11) if (i_e11 ~= 8 & i_e11 ~= 9 & i_e11 ~= .i & i_e11 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e12) if (i_e12 ~= 8 & i_e12 ~= 9 & i_e12 ~= .i & i_e12 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e13) if (i_e13 ~= 8 & i_e13 ~= 9 & i_e13 ~= .i & i_e13 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e14) if (i_e14 ~= 8 & i_e14 ~= 9 & i_e14 ~= .i & i_e14 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e15) if (i_e15 ~= 8 & i_e15 ~= 9 & i_e15 ~= .i & i_e15 ~= .)

replace JORM_IQCODE_summ_raw = (JORM_IQCODE_summ_raw + i_e16) if (i_e16 ~= 8 & i_e16 ~= 9 & i_e16 ~= .i & i_e16 ~= .)



gen JORM_IQCODE_impute = 0

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e1 == 8 | i_e1 == 9 | i_e1 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e2 == 8 | i_e2 == 9 | i_e2 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e3 == 8 | i_e3 == 9 | i_e3 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e4 == 8 | i_e4 == 9 | i_e4 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e5 == 8 | i_e5 == 9 | i_e5 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e6 == 8 | i_e6 == 9 | i_e6 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e7 == 8 | i_e7 == 9 | i_e7 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e8 == 8 | i_e8 == 9 | i_e8 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e9 == 8 | i_e9 == 9 | i_e9 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e10 == 8 | i_e10 == 9 | i_e10 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e11 == 8 | i_e11 == 9 | i_e11 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e12 == 8 | i_e12 == 9 | i_e12 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e13 == 8 | i_e13 == 9 | i_e13 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e14 == 8 | i_e14 == 9 | i_e14 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e15 == 8 | i_e15 == 9 | i_e15 == .i)

replace JORM_IQCODE_impute = (JORM_IQCODE_impute + 1) if (i_e16 == 8 | i_e16 == 9 | i_e16 == .i)



gen JORM_IQCODE_summ = ((JORM_IQCODE_summ_raw)/(16 - JORM_IQCODE_impute)) if JORM_IQCODE_impute ~= 16

format JORM_IQCODE_summ %9.1g



drop JORM_IQCODE_summ_raw JORM_IQCODE_impute



*CSI-D/Blessed 1 Total Score

gen CSID_blessed_score = 0

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_1 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_2 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_3 == 1

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_4 == 1

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_5 == 1

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_bse_3 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_bse_3 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_bse_7 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_bse_7 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_6 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_6 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_7 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_7 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_8 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_8 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_9 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_9 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_10 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_10 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_11 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_11 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_12 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_12 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_13 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_13 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_14 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_14 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_15 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_15 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_16 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_16 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if (i_f_csid_17 == 1 & i_f_csid_17a ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_17 == 2 & i_f_csid_17a ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_18 == 1

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_19 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_19 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_20 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_20 == 2

replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_21 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_21 == 2

replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_22_1 == 1 & i_f_csid_22_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_22_1 == 2 & i_f_csid_22_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_22_1 == 3 & i_f_csid_22_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_23_1 == 1 & i_f_csid_23_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_23_1 == 2 & i_f_csid_23_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_23_1 == 3 & i_f_csid_23_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_24_1 == 1 & i_f_csid_24_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_24_1 == 2 & i_f_csid_24_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_24_1 == 3 & i_f_csid_24_2 ~= 1)

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_25 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_26 == 1

replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_27 == 1



*ADL score

gen ADL_summ = 0

replace ADL_summ = (ADL_summ + 1) if ((i_f_csid_22_1 == 1 | i_f_csid_22_1 == 2 | i_f_csid_22_1 == 3) & i_f_csid_22_2 ~= 1)

replace ADL_summ = (ADL_summ + 1) if ((i_f_csid_23_1 == 1 | i_f_csid_23_1 == 2 | i_f_csid_23_1 == 3) & i_f_csid_23_2 ~= 1)

replace ADL_summ = (ADL_summ + 1) if ((i_f_csid_24_1 == 1 | i_f_csid_24_1 == 2 | i_f_csid_24_1 == 3) & i_f_csid_24_2 ~= 1)



*IADL SCORE

gen IADL_summ = 0

replace IADL_summ = (IADL_summ + 1) if (i_f_csid_16 == 1 | i_f_csid_16 == 2)

replace IADL_summ = (IADL_summ + 1) if ((i_f_csid_17 == 1 | i_f_csid_17 == 2) & i_f_csid_17a ~= 1)

replace IADL_summ = (IADL_summ + 1) if (i_f_csid_18 == 1)

replace IADL_summ = (IADL_summ + 1) if (i_f_csid_19 == 1 | i_f_csid_19 == 2)



*Walk score

gen walk_score = "."

replace walk_score = "Cannot walk" if s_12_11 == 2

replace walk_score = "Difficulty walking several blocks" if (s_12_11 == 1 & s_12_13 == 1)

replace walk_score =  "No difficulty walking several blocks" if s_12_13 == 2



*CES-D Depression score

gen s_depression_score1 = 0

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1a == 1

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1b == 1

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1c == 1

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1d == 5

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1e == 1

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1f == 5

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1g == 1

replace s_depression_score1 = (s_depression_score1 + 1) if s_10_1h == 1



*TICS_CSID_score

gen TICS_CSID_score = 0

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_48 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_49 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_50 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_51 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_52 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_53 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_54 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_55 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_56 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a2 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a3 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a4 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_61 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_62 == 1

replace TICS_CSID_score = (TICS_CSID_score + 1) if c_70_all == 1



gen TICS_CSID_denom = 15

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_48 == . | c_48 == .i | c_48 == .v | c_48 == 6 | c_48 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_49 == . | c_49 == .i | c_49 == .v | c_49 == 6 | c_49 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_50 == . | c_50 == .i | c_50 == .v | c_50 == 6 | c_50 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_51 == . | c_51 == .i | c_51 == .v | c_51 == 6 | c_51 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_52 == . | c_52 == .i | c_52 == .v | c_52 == 6 | c_52 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_53 == . | c_53 == .i | c_53 == .v | c_53 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_54 == . | c_54 == .i | c_54 == .v | c_54 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_55 == . | c_55 == .i | c_55 == .v | c_55 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_56 == . | c_56 == .i | c_56 == .v | c_56 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a2 == . | i_a2 == .i | i_a2 == .v | i_a2 == 8 | i_a2 == 9)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a3 == . | i_a3 == .i | i_a3 == .v | i_a2 == 8 | i_a2 == 9)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a4 == . | i_a4 == .i | i_a4 == .v | i_a4 == 8 | i_a4 == 9)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_61 == . | c_61 == .i | c_61 == .v | c_61 == 6 | c_61 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_62 == . | c_62 == .i | c_62 == .v | c_61 == 6 | c_61 == 7)

replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_70_all == . | c_70_all == .i | c_70_all == .v)



replace TICS_CSID_score = round((TICS_CSID_score * 15)/TICS_CSID_denom)

drop TICS_CSID_denom



*CSID object naming score

gen CSID_object_naming_score = 0

replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_48 == 1

replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_49 == 1

replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_50 == 1

replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_51 == 1

replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_52 == 1



gen object_naming_denom = 5

replace object_naming_denom = (object_naming_denom - 1) if (c_48 == . | c_48 == .i | c_48 == .v | c_48 == 6 | c_48 == 7)

replace object_naming_denom = (object_naming_denom - 1) if (c_49 == . | c_49 == .i | c_49 == .v | c_49 == 6 | c_49 == 7)

replace object_naming_denom = (object_naming_denom - 1) if (c_50 == . | c_50 == .i | c_50 == .v | c_50 == 6 | c_50 == 7)

replace object_naming_denom = (object_naming_denom - 1) if (c_51 == . | c_51 == .i | c_51 == .v | c_51 == 6 | c_51 == 7)

replace object_naming_denom = (object_naming_denom - 1) if (c_52 == . | c_52 == .i | c_52 == .v | c_52 == 6 | c_52 == 7)



replace CSID_object_naming_score = round((CSID_object_naming_score * 5)/object_naming_denom)

drop object_naming_denom



*CSID concept nomination score

gen CSID_concept_nomination_score = 0

replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_53 == 1

replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_54 == 1

replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_55 == 1

replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_56 == 1



gen concept_nomination_denom = 4

replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_53 == . | c_53 == .i | c_53 == .v | c_53 == 7)

replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_54 == . | c_54 == .i | c_54 == .v | c_54 == 7)

replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_55 == . | c_55 == .i | c_55 == .v | c_55 == 7)

replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_56 == . | c_56 == .i | c_56 == .v | c_56 == 7)



replace CSID_concept_nomination_score = round((CSID_concept_nomination_score * 4)/concept_nomination_denom)

drop concept_nomination_denom



*Orientation score

gen orientation_score = 0

replace orientation_score = (orientation_score + 1) if i_a2 == 1

replace orientation_score = (orientation_score + 1) if i_a3 == 1

replace orientation_score = (orientation_score + 1) if i_a4 == 1



gen orientation_denom = 3

replace orientation_denom = (orientation_denom - 1) if (i_a2 == . | i_a2 == .i | i_a2 == .v | i_a2 == 8 | i_a2 == 9)

replace orientation_denom = (orientation_denom - 1) if (i_a3 == . | i_a3 == .i | i_a3 == .v | i_a2 == 8 | i_a2 == 9)

replace orientation_denom = (orientation_denom - 1) if (i_a4 == . | i_a4 == .i | i_a4 == .v | i_a4 == 8 | i_a4 == 9)



replace orientation_score = round((orientation_score * 3)/orientation_denom)

drop orientation_denom



*Comprehension score

gen comprehension_score = 0

replace comprehension_score = (comprehension_score + 1) if c_61 == 1

replace comprehension_score = (comprehension_score + 1) if c_62 == 1



gen comprehension_denom = 2

replace comprehension_denom = (comprehension_denom - 1) if (c_61 == . | c_61 == .i | c_61 == .v | c_61 == 6 | c_61 == 7)

replace comprehension_denom = (comprehension_denom - 1) if (c_62 == . | c_62 == .i | c_62 == .v | c_61 == 6 | c_61 == 7)



replace comprehension_score = round((comprehension_score * 2)/comprehension_denom)

drop comprehension_denom



*Trial 1 immediate word recall

gen T1_immediate_word_recall_score = 0

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_1 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_2 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_3 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_4 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_5 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_6 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_7 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_8 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_9 == 1

replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_10 == 1

replace T1_immediate_word_recall_score = .v if (T1_immediate_word_recall_score == 0 & c_33_a == 7)



*Trial 2 immediate word recall

gen T2_immediate_word_recall_score = 0

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_1 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_2 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_3 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_4 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_5 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_6 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_7 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_8 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_9 == 1

replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_10 == 1

replace T1_immediate_word_recall_score = .v if (T2_immediate_word_recall_score == 0 & c_34_a == 7)



*Trial 3 immediate word recall

gen T3_immediate_word_recall_score = 0

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_1 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_2 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_3 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_4 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_5 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_6 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_7 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_8 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_9 == 1

replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_10 == 1

replace T3_immediate_word_recall_score = .v if (T3_immediate_word_recall_score == 0 & c_35_a == 7)



*Immediate word recall total

gen immediate_word_recall_total = .

replace immediate_word_recall_total = ((T1_immediate_word_recall_score + T2_immediate_word_recall_score) * 3) if (c_33_a ~= 7 & c_34_a == 7)

replace immediate_word_recall_total = round((T1_immediate_word_recall_score + T2_immediate_word_recall_score) * 1.5) if (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a == 7)

replace immediate_word_recall_total = (T1_immediate_word_recall_score + T2_immediate_word_recall_score + T3_immediate_word_recall_score) if (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)



*Delayed word recall

gen delayed_word_recall_score = 0

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_1 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_2 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_3 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_4 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_5 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_6 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_7 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_8 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_9 == 1

replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_10 == 1

replace delayed_word_recall_score = .v if (delayed_word_recall_score == 0 & c_63_a == 7)



*Word recognition total

*this one is not based on correctness?

gen word_recognition_total_score = 0

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_01 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_02 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_03 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_04 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_05 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_06 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_07 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_08 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_09 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_10 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_11 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_12 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_13 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_14 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_15 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_16 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_17 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_18 == 2

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_19 == 1

replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_20 == 1

replace word_recognition_total_score = .v if (word_recognition_total_score == 0 & c_68_a == 7)





*Serial7score   //*this is not imputed at all

gen serial7_score2 = 0

*+1 point if first number is 93

replace serial7_score2 = 1 if c_15 == 93

*+1 point if second number is seven less than the first number

replace serial7_score2 = (serial7_score2 + 1) if ((c_15 - 7 == c_16) & (c_15 ~= .i) & (c_15 ~= .v) & (c_15 ~= .) & (c_16 ~= .i) & (c_16 ~= .v) & (c_16 ~= .))

*+1 point if third number is seven less than the second number

replace serial7_score2 = (serial7_score2 + 1) if ((c_16 - 7 == c_17) & (c_17 ~= .i) & (c_17 ~= .) & (c_17 ~= .v) & (c_16 ~= .i) & (c_16 ~= .v) & (c_16 ~= .))

*+1 point if fourth number is seven less than the third number

replace serial7_score2 = (serial7_score2 + 1) if ((c_17 - 7 == c_18) & (c_17 ~= .i) & (c_17 ~= .) & (c_17 ~= .v) & (c_18 ~= .i) & (c_18 ~= .v) & (c_18 ~= .))

*+1 point if fifth number is seven less than the fourth number

replace serial7_score2 = (serial7_score2 + 1) if ((c_18 - 7 == c_19) & (c_19 ~= .i) & (c_19 ~= .) & (c_19 ~= .v) & (c_18 ~= .i) & (c_18 ~= .v) & (c_18 ~= .))



*Spell MUNDO backward - score

gen MUNDO_score = 0

*create temporary variable with c_20 string that we can edit

gen c_20_temp2 = c_20

*clean variable c_20_temp2 to delete any characters other than m, u, n, d, and o

quietly forvalues obs = 1(1) `=_N' {

	forvalues character = `=strlen(c_20_temp2[`obs'])'(-1) 1 {

		if substr(c_20_temp2[`obs'],-`character',1) ~= "o" {

			if substr(c_20_temp2[`obs'],-`character',1) ~= "d" {

				if substr(c_20_temp2[`obs'],-`character',1) ~= "n" {

					if substr(c_20_temp2[`obs'],-`character',1) ~= "u" {

						if substr(c_20_temp2[`obs'],-`character',1) ~= "m" {

							replace c_20_temp2 = subinstr(c_20_temp2[`obs'],substr(c_20_temp2[`obs'],-`character',1),"",1) in `obs'

						}

						else {

							continue

						}

					}

					else {

						continue

					}

				}

				else {

					continue

				}

			}	

			else {

				continue

			}

		}

		else {

			continue

		}

	}

}

*replace all o,d,n,u,m with 1,2,3,4,5

quietly forvalues i = 1(1) `=_N' {

	local x = 1

	while `x' <= strlen(c_20_temp2[`i']) {

		if substr(c_20_temp2[`i'],`x',1) == "o" {

			replace c_20_temp2 = subinstr(c_20_temp2[`i'],substr(c_20_temp2[`i'],`x',1),"1",.) in `i'

			local x = `x' + 1

			continue

		}



		else {

			if substr(c_20_temp2[`i'],`x',1) == "d" {

				replace c_20_temp2 = subinstr(c_20_temp2[`i'],substr(c_20_temp2[`i'],`x',1),"2",.) in `i'

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "n" {

				replace c_20_temp2 = subinstr(c_20_temp2[`i'],substr(c_20_temp2[`i'],`x',1),"3",.) in `i'

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "u" {

				replace c_20_temp2 = subinstr(c_20_temp2[`i'],substr(c_20_temp2[`i'],`x',1),"4",.) in `i'

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "m" {

				replace c_20_temp2 = subinstr(c_20_temp2[`i'],substr(c_20_temp2[`i'],`x',1),"5",.) in `i'

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "1" {

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "2" {

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "3" {

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "4" {

				local x = `x' + 1

				continue

			}

		}

		else {

			if substr(c_20_temp2[`i'],`x',1) == "5" {

				local x = `x' + 1

				continue

			}

		}

		else {

			continue, break

		}

	}

}

*create a temporary score variable to keep track of their highest score through each iteration of scoring

gen spell_score_temp2 = 1

*create a program that will loop through all possible combinations of dropping letters to find the highest score they can be given

*they are scored based on number of letters in the correct order (ODNUM), 1 point for each letter

program score

	local temp = `1'

	replace spell_score_temp2 = 1 in `2'

	local previous = 1

	forvalues spot = 1(1) `=strlen("`temp'")' {

		if substr("`temp'",`spot',1) > substr("`temp'",`previous',1) {

			replace spell_score_temp2 = (spell_score_temp2 + 1) in `2'

			local previous = `spot'

		}

		if spell_score_temp2[`2'] > MUNDO_score[`2'] {

			replace MUNDO_score = spell_score_temp2[`2'] in `2'

		}

	}

	forvalues spot = 1(1) `=strlen("`1'")' {

		local temp = subinstr("`1'",substr("`1'",`spot',1),"",1)

		if strlen("`temp'") > 2 {

			score `temp' `2'

		}

	}

end

*PR has responses with extraneous characters, we will do our best to cut it down. May need to check later

if `country' == 0 {

	replace c_20_temp2 = substr(c_20_temp2, -6, .) if strlen(c_20_temp2) > 5

}

*run the program we created to score the response from each participant

quietly forvalues obs = 1(1) `=_N' {

	if c_20_temp2[`obs'] ~= "" {

		local name = c_20_temp2[`obs']

			score `name' `obs'

	}

}

*some observations have "no dijo nada" being scored as 3, we will correct that to 0

replace MUNDO_score = 0 if c_20 == "no dijo nada"



*drop the temporary variables we created

drop c_20_temp2

drop spell_score_temp2



*CSI-D Blessed Decline Score

gen CSID_blessed_decline_score = 0

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_1 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_2 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_3 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_bse_3 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_bse_3 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_bse_7 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_bse_7 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_11 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_11 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_15 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_15 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_16 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_16 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if (i_f_csid_17 == 1 & i_f_csid_17a == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_17 == 2 & i_f_csid_17a == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_19 == 1

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_19 == 2

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_22_1 == 1 & i_f_csid_22_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_22_1 == 2 & i_f_csid_22_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_22_1 == 3 & i_f_csid_22_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_23_1 == 1 & i_f_csid_23_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_23_1 == 2 & i_f_csid_23_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_23_1 == 3 & i_f_csid_23_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_24_1 == 1 & i_f_csid_24_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_24_1 == 2 & i_f_csid_24_2 == 0)

replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_24_1 == 3 & i_f_csid_24_2 == 0)



gen CSID_blessed_decline_denom = 21 //* shouldn't this be out of 19?

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_1 == . | i_f_csid_1 == .i | i_f_csid_1 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_2 == . | i_f_csid_2 == .i | i_f_csid_2 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_3 == . | i_f_csid_3 == .i | i_f_csid_3 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_bse_3 == . | i_f_bse_3 == .i | i_f_bse_3 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_bse_7 == . | i_f_bse_7 == .i | i_f_bse_7 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_11 == . | i_f_csid_11 == .i | i_f_csid_11 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_15 == . | i_f_csid_15 == .i | i_f_csid_15 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_16 == . | i_f_csid_16 == .i | i_f_csid_16 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_17 == . | i_f_csid_17 == .i | i_f_csid_17 == .v | i_f_csid_17a == 1)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_19 == . | i_f_csid_19 == .i | i_f_csid_19 == .v)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_22_1 == . | i_f_csid_22_1 == .i | i_f_csid_22_1 == .v | i_f_csid_22_2 == 1)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_23_1 == . | i_f_csid_23_1 == .i | i_f_csid_23_1 == .v | i_f_csid_23_2 == 1)

replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_24_1 == . | i_f_csid_24_1 == .i | i_f_csid_24_1 == .v | i_f_csid_24_2 == 1)

replace CSID_blessed_decline_score = round((CSID_blessed_decline_score * 21)/CSID_blessed_decline_denom)



*CSI-D Memory Score

gen CSID_memory_score = 0

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_bse_3 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_bse_3 == 2

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_15 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_15 == 2

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_16 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_16 == 2

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_bse_7 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_bse_7 == 2

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_13 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_13 == 2

replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_11 == 1

replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_11 == 2



gen CSID_memory_denom = 6

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_bse_3 == . | i_f_bse_3 == .i | i_f_bse_3 == .v)

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_15 == . | i_f_csid_15 == .i | i_f_csid_15 == .v)

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_16 == . | i_f_csid_16 == .i | i_f_csid_16 == .v)

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_bse_7 == . | i_f_bse_7 == .i | i_f_bse_7 == .v)

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_13 == . | i_f_csid_13 == .i | i_f_csid_13 == .v)

replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_11 == . | i_f_csid_11 == .i | i_f_csid_11 == .v)

replace CSID_memory_score = round((CSID_memory_score * 6)/CSID_memory_denom)



*NPI-Q Summary Score

gen NPIQ_summary_score = 0

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_1) if (i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9 & i_h_npi_1 ~= .i & i_h_npi_1 ~= .v & i_h_npi_1 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_2) if (i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9 & i_h_npi_2 ~= .i & i_h_npi_2 ~= .v & i_h_npi_2 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_3) if (i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9 & i_h_npi_3 ~= .i & i_h_npi_3 ~= .v & i_h_npi_3 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_4) if (i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9 & i_h_npi_4 ~= .i & i_h_npi_4 ~= .v & i_h_npi_4 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_5) if (i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9 & i_h_npi_5 ~= .i & i_h_npi_5 ~= .v & i_h_npi_5 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_6) if (i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9 & i_h_npi_6 ~= .i & i_h_npi_6 ~= .v & i_h_npi_6 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_7) if (i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9 & i_h_npi_7 ~= .i & i_h_npi_7 ~= .v & i_h_npi_7 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_8) if (i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9 & i_h_npi_8 ~= .i & i_h_npi_8 ~= .v & i_h_npi_8 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_9) if (i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9 & i_h_npi_9 ~= .i & i_h_npi_9 ~= .v & i_h_npi_9 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_10) if (i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9 & i_h_npi_10 ~= .i & i_h_npi_10 ~= .v & i_h_npi_10 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_11) if (i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9 & i_h_npi_11 ~= .i & i_h_npi_11 ~= .v & i_h_npi_11 ~= .)

replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_12) if (i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9 & i_h_npi_12 ~= .i & i_h_npi_12 ~= .v & i_h_npi_12 ~= .)



gen NPIQ_denom = 12

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_1 == 8 | i_h_npi_1 == 9 | i_h_npi_1 == .i | i_h_npi_1 == .v | i_h_npi_1 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_2 == 8 | i_h_npi_2 == 9 | i_h_npi_2 == .i | i_h_npi_2 == .v | i_h_npi_2 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_3 == 8 | i_h_npi_3 == 9 | i_h_npi_3 == .i | i_h_npi_3 == .v | i_h_npi_3 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_4 == 8 | i_h_npi_4 == 9 | i_h_npi_4 == .i | i_h_npi_4 == .v | i_h_npi_4 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_5 == 8 | i_h_npi_5 == 9 | i_h_npi_5 == .i | i_h_npi_5 == .v | i_h_npi_5 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_6 == 8 | i_h_npi_6 == 9 | i_h_npi_6 == .i | i_h_npi_6 == .v | i_h_npi_6 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_7 == 8 | i_h_npi_7 == 9 | i_h_npi_7 == .i | i_h_npi_7 == .v | i_h_npi_7 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_8 == 8 | i_h_npi_8 == 9 | i_h_npi_8 == .i | i_h_npi_8 == .v | i_h_npi_8 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_9 == 8 | i_h_npi_9 == 9 | i_h_npi_9 == .i | i_h_npi_9 == .v | i_h_npi_9 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_10 == 8 | i_h_npi_10 == 9 | i_h_npi_10 == .i | i_h_npi_10 == .v | i_h_npi_10 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_11 == 8 | i_h_npi_11 == 9 | i_h_npi_11 == .i | i_h_npi_11 == .v | i_h_npi_11 == .)

replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_12 == 8 | i_h_npi_12 == 9 | i_h_npi_12 == .i | i_h_npi_12 == .v | i_h_npi_12 == .)

replace NPIQ_summary_score = round((NPIQ_summary_score * 12)/NPIQ_denom)



*MMSE - immediate recall

gen MMSE_immediate_recall = 0

replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_11 == 1

replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_12 == 1

replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_13 == 1



*MMSE - delayed recall

gen MMSE_delayed_recall = 0

replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_21 == 1

replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_22 == 1

replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_23 == 1



*MMSE - Object naming

gen MMSE_object_naming = 0

replace MMSE_object_naming = (MMSE_object_naming + 1) if c_24 == 1

replace MMSE_object_naming = (MMSE_object_naming + 1) if c_25 == 1



*MMSE - 3 step paper folding task

gen MMSE_paper_folding_task = 0

replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_27 == 1

replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_28 == 1

replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_29 == 1

/*

*Change c_30, c_31, c_20 to "Could not (Illiterate)" if any of them are marked illiterate

replace c_30 = 5 if (c_31 == 5 | c_20 == "5")

replace c_31 = 5 if (c_30 == 5 | c_20 == "5")

replace c_20 = "5" if (c_30 == 5 | c_31 == 5)

*/



*MMSE denominator (only non-missings)

gen MMSE_denominator = 30 //*not sure how to impute serial7s, since it seems odd to give them full points if they just get the first right and stop

replace MMSE_denominator = (MMSE_denominator - 1) if (c_1 == .i | c_1 == .v | c_1 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_2_all == .i | c_2_all == .v | c_2_all == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_3 == .i | c_3 == .v | c_3 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_4 == .i | c_4 == .v | c_4 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_5 == .i | c_5 == .v | c_5 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_6 == .i | c_6 == .v | c_6 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_7_all == .i | c_7_all == .v | c_7_all == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_8 == .i | c_8 == .v | c_8 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_9 == .i | c_9 == .v | c_9 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_10 == .i | c_10 == .v | c_10 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_11 == .i | c_11 == .v | c_11 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_12 == .i | c_12 == .v | c_12 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_13 == .i | c_13 == .v | c_13 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_21 == .i | c_21 == .v | c_21 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_22 == .i | c_22 == .v | c_22 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_23 == .i | c_23 == .v | c_23 == .)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_24 == .i | c_24 == .v | c_24 == . | c_24 == 6 | c_24 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_25 == .i | c_25 == .v | c_25 == . | c_25 == 6 | c_25 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_26 == .i | c_26 == .v | c_26 == . | c_26 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_27 == .i | c_27 == .v | c_27 == . | c_27 == 6 | c_27 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_28 == .i | c_28 == .v | c_28 == . | c_28 == 6 | c_28 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_29 == .i | c_29 == .v | c_29 == . | c_29 == 6 | c_29 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_30 == .i | c_30 == .v | c_30 == . | c_30 == 5 | c_30 == 6 | c_30 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if (c_31 == .i | c_31 == .v | c_31 == . | c_31 == 5 | c_31 == 6 | c_31 == 7)

replace MMSE_denominator = (MMSE_denominator - 1) if cropped_pent_uploaded == "missing"

replace MMSE_denominator = (MMSE_denominator - 5) if (c_20 == "5" | c_20 == "7" | c_20 == ".i" | c_20 == ".v" | c_20 == "")



*Create mini-mental status exam (MMSE) score (questions 1-32)

gen c_MMSEscore_raw2 = 0

*13 points total, 1 point each (questions 1-13)

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_1 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_2_all == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_3 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_4 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_5 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_6 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_7_all == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_8 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_9 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_10 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_11 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_12 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_13 == 1

*5 points - spelling MUNDO backward (question 20)

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + MUNDO_score)

*4 ponts total, 1 point each (questions 21-23, 26)

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_21 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_22 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_23 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_26 == 1

*7 points total, 1 point each (questions 24-25, 27-31)

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_24 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_25 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_27 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_28 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_29 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_30 == 1

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if c_31 == 1

*1 point (question cs_32 in cognitive scoring)

replace c_MMSEscore_raw2 = (c_MMSEscore_raw2 + 1) if cropped_pent_uploaded == "2"





*rename Ty's pentagon scoring (cropped_pent_uploaded) to cs_32

drop cs_32

rename cropped_pent_uploaded cs_32







keep pid i_globalrecordid s_globalrecordid c_globalrecordid s_2_3 s_0 s_2_9 s_2_8c s_8_5a s_8_3 s_3_6 s_3_7 s_3_5 n_1new c_MMSEscore_raw2 i_b5 i_b3 i_b4 i_b7 i_b1 i_c4 i_lhas_54 i_c1 i_c2 i_g0 JORM_IQCODE_summ CSID_blessed_score c_80b c_80a ADL_summ IADL_summ walk_score s_depression_score1 TICS_CSID_score CSID_object_naming_score CSID_concept_nomination_score orientation_score comprehension_score immediate_word_recall_total T1_immediate_word_recall_score T2_immediate_word_recall_score T3_immediate_word_recall_score delayed_word_recall_score word_recognition_total_score serial7_score2 c_15 c_16 c_17 c_18 c_19 c_45 c_45_a MUNDO_score pent_pic s_2_12 s_2_13 i_e1 i_e2 i_e3 i_e4 i_e5 i_e6 i_e7 i_e8 i_e9 i_e10 i_e11 i_e12 i_e13 i_e14 i_e15 i_e16 i_f_csid_1 i_f_csid_2 i_f_csid_3 i_f_csid_4 i_f_csid_5 i_f_bse_3 i_f_bse_7 i_f_csid_6 i_f_csid_7 i_f_csid_8 i_f_csid_9 i_f_csid_10 i_f_csid_11 i_f_csid_12 i_f_csid_13 i_f_csid_14 i_f_csid_15 i_f_csid_16 i_f_csid_17 i_f_csid_17a i_f_csid_18 i_f_csid_19 i_f_csid_20 i_f_csid_21 i_f_csid_22_1 i_f_csid_22_2 i_f_csid_23_1 i_f_csid_23_2 i_f_csid_24_1 i_f_csid_24_2 i_f_csid_25 i_f_csid_26 i_f_csid_27 i_k_act_15 i_k_act_16 i_k_act_17 i_k_act_10 i_k_act_13 i_k_act_14 i_k_act_1 i_k_act_2 i_k_act_5 i_k_act_7 i_k_act_8 s_13_19 s_13_20 s_13_22 s_12_11 s_12_13 s_12_14 s_12_15 s_12_16 CSID_blessed_decline_score i_g_has_2 i_g_has_3_11 i_g_has_3_13 i_g_has_3_16 i_g_has_4 i_g_has_5_1 i_g_has_7_1 i_g_has_10 i_g_has_11 CSID_memory_score c_81 NPIQ_summary_score i_h_npi_1 i_h_npi_1_1 i_h_npi_2 i_h_npi_2_1 i_h_npi_3 i_h_npi_3_1 i_h_npi_4 i_h_npi_4_1 i_h_npi_5 i_h_npi_5_1 i_h_npi_6 i_h_npi_6_1 i_h_npi_7 i_h_npi_7_1 i_h_npi_8 i_h_npi_8_1 i_h_npi_9 i_h_npi_9_1 i_h_npi_10 i_h_npi_10_1 i_h_npi_11 i_h_npi_11_1 i_h_npi_12 i_h_npi_12_1 c_1 c_2_all c_3 c_4 c_5 c_6 c_7_all c_8 c_9 c_10 MMSE_immediate_recall MMSE_delayed_recall c_20 MMSE_object_naming c_26 c_30 MMSE_paper_folding_task c_31 c_48 c_49 c_50 c_51 c_52 c_53 c_54 c_55 c_56 c_58 c_59 c_60 c_61 c_62 c_70_all s_10_1a s_10_1b s_10_1c s_10_1d s_10_1e s_10_1f s_10_1g s_10_1h cs_32 MMSE_denominator



****************************************************************************************

*COUNTS NUMBER OF .i, .v , or . IN EACH OBERVATION UNDER NEW VARIABLE CALLED countmissing (did not code in if 7 was the code for a valid skip)

local i 1

gen countmissing = 0



quietly ds

local allvar `r(varlist)'



foreach v in `allvar' {

	local allvarR `v' `allvarR'

}



quietly forvalues i = 1(1) `=_N' {

	foreach v of local allvarR {

		capture confirm str var `v'

		if _rc == 0 {

			if (`v'[`i'] == ".i" | `v'[`i'] == ".v" | `v'[`i'] == "." | `v'[`i'] == "") {

				replace countmissing = countmissing[`i'] + 1 in `i'

			}

			else {

			}

		}

		else {

			if (`v'[`i'] == .i | `v'[`i'] == .v | `v'[`i'] == .) {

				replace countmissing = countmissing[`i'] + 1 in `i'

			}

			else{

			}

		}

	}

}

*******************************************************************************************

*counts how many missing (but not .v) there are (did not code in if 7 was the code for a valid skip)

local i 1

gen count_valid_missing = 0



quietly ds

local allvar2 `r(varlist)'





foreach v in `allvar2' {

	local allvar2R `v' `allvar2R'

	}





quietly forvalues i = 1(1) `=_N' {

	foreach v of local allvar2R {

		capture confirm str var `v'

		if _rc == 0 {

			if `v'[`i'] == ".v" {

				replace count_valid_missing = count_valid_missing[`i'] + 1 in `i'

			}

			else {

			}

		}

		else {

			if `v'[`i'] == .v {

				replace count_valid_missing = count_valid_missing[`i'] + 1 in `i'

			}

			else{

			}

		}

	}

}

gen count_invalid_missing = (countmissing - count_valid_missing)





************************************************************************************************

*add labels

label drop _all



label define DOTS .i "Missing" .v "Not applicable"

quietly ds, not(type string)

foreach v in `r(varlist)' {

	label values `v' DOTS

	}



label define S_0 0 "Man" 1 "Woman"

label define S_2_9 1 "Never married" 2 "Married/Consensual Union" 3 "Widowed" 4 "Divorced/Separated"

label define S_2_8C 88 "No response" 99 "Does not know" .m "Missing"

label define S_8_5A 1 "Employed" 2 "Looking for work" 3 "Not working" 8 "No response" .v "Never worked"

label define S_8_3 1 "Professional or executive" 2 "Office worker" 3 "Salesperson or retailer"  4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "No response" 99 "DOES NOT KNOW"

label define S_3_6 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define S_3_7 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define S_3_5 0 "City" 1 "Town" 2 "Countryside" 8 "No response" 9 "Does not know"

label define N_1NEW 0 "Lower class" 1 "Middle class" 2 "Upper class"

label define I_B5 1 "Spouse" 2 "Child" 3 "Son-in-law/daughter-in-law" 4 "Brother/sister" 5 "Other relative" 6 "Friend" 7 "Neighbor" 8 "Other" 88 "No response"

label define I_B4 1 "Female" 2 "Male" 3 "Other"

label define I_B7 0 "None" 1 "1 to 5" 2 "6 to 8" 3 "9 to 12" 4 "More than 12" 8 "No response" 9 "DOES NOT KNOW"

label define I_B1 1 "Yes" 2 "No" 3 "No"

label define I_C4 1 "One of the main direct caregivers." 2 "One of the main caretakers of 'organization'" 3 "Only slightly involved in providing or organizing care (others do it more)" 4 "Not involved in providing or arranging care."

label define I_LHAS_54 0 "Reasonable" 1 "Some doubts" 2 "Moderate doubts" 3 "Serious doubts" 4 "Without value"

label define I_C1 1 "Needs care most of the time" 2 "Needs occasional care" 3 "Does not need care" 8 "No response" 9 "Does not know"

label define I_C2 1 "Yes" 2 "No" 8 "No response" 9 "DOES NOT KNOW" .v "Yes"

label define I_C4 .v "Care not needed" , add

label define I_G0 8 "No response" 9 "DOes not know"

label define C_80B 1 "Yes" 2 "No"

label define C_80A 1 "Yes" 2 "No"

label define C_70_ALL 0 "Incorrect" 1 "Correct"

label define C_45 0 "Incorrect" 1 "Correct" 2 "Wants to start over"

label define S_2_12 0 "Every day" 1 "More than once a week" 2 "Once a week" 3 "Two or three times a month" 4 "Once or more times a year" 5 "Never" 8 "No response" 9 "Does not know" .v "Never (not religious)"

label define S_2_13 0 "No" 1 "Yes regularly" 2 "Yes occasionally" 8 "No response" 9 "Does not know"

label define I_E1 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E2 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E3 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E4 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E5 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E6 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E7 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E8 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E9 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E10 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E11 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E12 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E13 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E14 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E15 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_E16 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "No response" 9 "Does not know"

label define I_F_CSID_1 0 "No changes" 1 "Decreased activities and reduced ability to carry out activities"

label define I_F_CSID_2 0 "No changes" 1 "General deterioration"

label define I_F_CSID_3 0 "No" 1 "Yes"

label define I_F_CSID_4 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_5 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_BSE_3 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_BSE_7 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_6 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_7 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_8 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_9 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_10 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_11 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_12 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_13 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_14 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_15 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_16 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_17 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_17A 0 "No" 1 "Yes"

label define I_F_CSID_18 0 "No" 1 "Yes"

label define I_F_CSID_19 0 "Shows no difficulty" 1 "Some difficulty" 2 "Cannot handle money"

label define I_F_CSID_20 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_21 0 "Never" 1 "Yes sometimes" 2 "Yes on a regular basis"

label define I_F_CSID_22_1 0 "Eats cleanly and with proper utensils" 1 "Gets dirty when eating. Only uses the spoon" 2 "Simple solids like cookies" 3 "Must be fed"

label define I_F_CSID_22_2 0 "No" 1 "Yes"

label define I_F_CSID_23_1 0 "Dressed on their own" 1 "Occasionally misses a button etc." 2 "Wrong sequence or often forgets items" 3 "Unable to dress"

label define I_F_CSID_23_2 0 "No" 1 "Yes"

label define I_F_CSID_24_1 0 "No problems" 1 "Occasionally wets the bed" 2 "Frequently wets the bed" 3 "Double incontinence"

label define I_F_CSID_24_2 0 "No" 1 "Yes"

label define I_F_CSID_25 0 "No" 1 "Yes"

label define I_F_CSID_26 0 "No" 1 "Yes"

label define I_F_CSID_27 0 "No" 1 "Yes"

label define I_K_ACT_15 1 "Daily" 2 "Several times per week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_16 1 "Daily" 2 "Several times a week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_17 1 "Alone" 2 "Accompanied" 8 "No response" 9 "Does not know"

label define I_K_ACT_10 1 "Yes" 2 "No" 6 "xxx does not usually cook" 8 "No response" 9 "Does not know"

label define I_K_ACT_13 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define I_K_ACT_14 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define I_K_ACT_1 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_2 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_5 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_7 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 8 "No response" 9 "Does not know"

label define I_K_ACT_8 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 8 "No response" 9 "Does not know"

label define S_13_19 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_13_20 88 "No response" 99 "Does not know"

label define S_13_22 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_12_11 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_12_13 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_12_14 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_12_15 1 "Yes" 2 "No" 8 "No response" 9 "Does not know"

label define S_12_16 1 "Totally lifted them" 2 "Partially raised them" 3 "Cannot lift them"

label define I_G_HAS_2 1 "Rapid onset of organic features over 1-3 days" 2 "Rapid onset of more than 3 days but less than 3 weeks" 3 "Gradual onset over a longer period of time" 8 "No response" 9 "Does not know"

label define I_G_HAS_3_11 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_G_HAS_3_13 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_G_HAS_3_16 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_G_HAS_4 0 "Does not vary" 1 "Fluctuating pattern with several days or weeks of improvement" 8 "No response" 9 "Does not know"

label define I_G_HAS_5_1 0 "Did not become normal" 1 "Condition describes as return to normal or near normal" 8 "No response" 9 "Does not know"

label define I_G_HAS_7_1 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_G_HAS_10 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_G_HAS_11 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define C_81 1 "Excellent" 2 "Very good" 3 "Good" 4 "Regular" 5 "Poor" 6 "Blind"

label define I_H_NPI_1 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_1_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_2 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_2_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_3 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_3_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_4 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_4_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_5 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_5_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_6 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_6_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_7 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_7_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_8 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_8_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_9 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_9_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_10 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_10_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_11 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_11_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define I_H_NPI_12 0 "No" 1 "Yes" 8 "No response" 9 "Does not know"

label define I_H_NPI_12_1 1 "Slight (noticeable but no significant changes)" 2 "Moderate (significant but no dramatic changes)" 3 "Severe (very marked and prominent dramatic change)"

label define C_1 0 "Incorrect" 1 "Correct"

label define C_2_ALL 0 "Incorrect" 1 "Correct"

label define C_3 0 "Incorrect" 1 "Correct"

label define C_4 0 "Incorrect" 1 "Correct"

label define C_5 0 "Incorrect" 1 "Correct"

label define C_6 0 "Incorrect" 1 "Correct"

label define C_7_ALL 0 "Incorrect" 1 "Correct"

label define C_8 0 "Incorrect" 1 "Correct"

label define C_9 0 "Incorrect" 1 "Correct"

label define C_10 0 "Incorrect" 1 "Correct"

label define C_26 0 "Incorrect" 1 "Correct" 7 "Refused"

label define C_30 0 "Incorrect" 1 "Correct" 5 "Could not (Illiterate)" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_31 0 "Incorrect" 1 "Correct" 5 "Could not (Illiterate)" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_45 7 "Refused" , add

label define C_45_A .v "Refused" , add

label define C_48 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_49 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_50 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_51 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_52 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_53 0 "Incorrect" 1 "Correct" 7 "Refused"

label define C_54 0 "Incorrect" 1 "Correct" 7 "Refused"

label define C_55 0 "Incorrect" 1 "Correct" 7 "Refused"

label define C_56 0 "Incorrect" 1 "Correct" 7 "Refused"

label define C_58 1 "Correct" 2 "Incorrect" 8 "Unconfirmed" 9 "Unconfirmed"

label define C_59 1 "Correct" 2 "Incorrect" 8 "Unconfirmed" 9 "Unconfirmed"

label define C_60 1 "Correct" 2 "Incorrect" 8 "Unconfirmed" 9 "Unconfirmed"

label define C_61 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define C_62 0 "Incorrect" 1 "Correct" 6 "Could not (Physical limitation)" 7 "Refused"

label define S_10_1A 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1B 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1C 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1D 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1E 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1F 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1G 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"

label define S_10_1H 1 "Yes true" 5 "No not true" 8 "No response" 9 "Does not know"







*change all .i to "missing" and all .v to "not applicable",    special cases will need to overwrite this

quietly label dir

foreach lab in `r(names)' {

	capture label define `lab' .i "Missing", add

	capture label define `lab' .v "Not applicable", add

}









label values s_0 S_0

label values s_2_9 S_2_9

label values s_2_8c S_2_8C

label values s_8_5a S_8_5A

label values s_8_3 S_8_3

label values s_3_6 S_3_6

label values s_3_7 S_3_7

label values s_3_5 S_3_5

label values n_1new N_1NEW

label values i_b5 I_B5

label values i_b4 I_B4

label values i_b7 I_B7

label values i_b1 I_B1

label values i_c4 I_C4

label values i_lhas_54 I_LHAS_54

label values i_c1 I_C1

label values i_c2 I_C2

label values i_c4 I_C4

label values i_g0 I_G0

label values c_80b C_80B

label values c_80a C_80A

label values c_70_all C_70_ALL

label values c_45 C_45

label values s_2_12 S_2_12

label values s_2_13 S_2_13

label values i_e1 I_E1

label values i_e2 I_E2

label values i_e3 I_E3

label values i_e4 I_E4

label values i_e5 I_E5

label values i_e6 I_E6

label values i_e7 I_E7

label values i_e8 I_E8

label values i_e9 I_E9

label values i_e10 I_E10

label values i_e11 I_E11

label values i_e12 I_E12

label values i_e13 I_E13

label values i_e14 I_E14

label values i_e15 I_E15

label values i_e16 I_E16

label values i_f_csid_1 I_F_CSID_1

label values i_f_csid_2 I_F_CSID_2

label values i_f_csid_3 I_F_CSID_3

label values i_f_csid_4 I_F_CSID_4

label values i_f_csid_5 I_F_CSID_5

label values i_f_bse_3 I_F_BSE_3

label values i_f_bse_7 I_F_BSE_7

label values i_f_csid_6 I_F_CSID_6

label values i_f_csid_7 I_F_CSID_7

label values i_f_csid_8 I_F_CSID_8

label values i_f_csid_9 I_F_CSID_9

label values i_f_csid_10 I_F_CSID_10

label values i_f_csid_11 I_F_CSID_11

label values i_f_csid_12 I_F_CSID_12

label values i_f_csid_13 I_F_CSID_13

label values i_f_csid_14 I_F_CSID_14

label values i_f_csid_15 I_F_CSID_15

label values i_f_csid_16 I_F_CSID_16

label values i_f_csid_17 I_F_CSID_17

label values i_f_csid_17a I_F_CSID_17A

label values i_f_csid_18 I_F_CSID_18

label values i_f_csid_19 I_F_CSID_19

label values i_f_csid_20 I_F_CSID_20

label values i_f_csid_21 I_F_CSID_21

label values i_f_csid_22_1 I_F_CSID_22_1

label values i_f_csid_22_2 I_F_CSID_22_2

label values i_f_csid_23_1 I_F_CSID_23_1

label values i_f_csid_23_2 I_F_CSID_23_2

label values i_f_csid_24_1 I_F_CSID_24_1

label values i_f_csid_24_2 I_F_CSID_24_2

label values i_f_csid_25 I_F_CSID_25

label values i_f_csid_26 I_F_CSID_26

label values i_f_csid_27 I_F_CSID_27

label values i_k_act_15 I_K_ACT_15

label values i_k_act_16 I_K_ACT_16

label values i_k_act_17 I_K_ACT_17

label values i_k_act_10 I_K_ACT_10

label values i_k_act_13 I_K_ACT_13

label values i_k_act_14 I_K_ACT_14

label values i_k_act_1 I_K_ACT_1

label values i_k_act_2 I_K_ACT_2

label values i_k_act_5 I_K_ACT_5

label values i_k_act_7 I_K_ACT_7

label values i_k_act_8 I_K_ACT_8

label values s_13_19 S_13_19

label values s_13_20 S_13_20

label values s_13_22 S_13_22

label values s_12_11 S_12_11

label values s_12_13 S_12_13

label values s_12_14 S_12_14

label values s_12_15 S_12_15

label values s_12_16 S_12_16

label values i_g_has_2 I_G_HAS_2

label values i_g_has_3_11 I_G_HAS_3_11

label values i_g_has_3_13 I_G_HAS_3_13

label values i_g_has_3_16 I_G_HAS_3_16

label values i_g_has_4 I_G_HAS_4

label values i_g_has_5_1 I_G_HAS_5_1

label values i_g_has_7_1 I_G_HAS_7_1

label values i_g_has_10 I_G_HAS_10

label values i_g_has_11 I_G_HAS_11

label values c_81 C_81

label values i_h_npi_1 I_H_NPI_1

label values i_h_npi_1_1 I_H_NPI_1_1

label values i_h_npi_2 I_H_NPI_2

label values i_h_npi_2_1 I_H_NPI_2_1

label values i_h_npi_3 I_H_NPI_3

label values i_h_npi_3_1 I_H_NPI_3_1

label values i_h_npi_4 I_H_NPI_4

label values i_h_npi_4_1 I_H_NPI_4_1

label values i_h_npi_5 I_H_NPI_5

label values i_h_npi_5_1 I_H_NPI_5_1

label values i_h_npi_6 I_H_NPI_6

label values i_h_npi_6_1 I_H_NPI_6_1

label values i_h_npi_7 I_H_NPI_7

label values i_h_npi_7_1 I_H_NPI_7_1

label values i_h_npi_8 I_H_NPI_8

label values i_h_npi_8_1 I_H_NPI_8_1

label values i_h_npi_9 I_H_NPI_9

label values i_h_npi_9_1 I_H_NPI_9_1

label values i_h_npi_10 I_H_NPI_10

label values i_h_npi_10_1 I_H_NPI_10_1

label values i_h_npi_11 I_H_NPI_11

label values i_h_npi_11_1 I_H_NPI_11_1

label values i_h_npi_12 I_H_NPI_12

label values i_h_npi_12_1 I_H_NPI_12_1

label values c_1 C_1

label values c_2_all C_2_ALL

label values c_3 C_3

label values c_4 C_4

label values c_5 C_5

label values c_6 C_6

label values c_7_all C_7_ALL

label values c_8 C_8

label values c_9 C_9

label values c_10 C_10

label values c_26 C_26

label values c_30 C_30

label values c_31 C_31

label values c_45 C_45

label values c_45_a C_45_A

label values c_48 C_48

label values c_49 C_49

label values c_50 C_50

label values c_51 C_51

label values c_52 C_52

label values c_53 C_53

label values c_54 C_54

label values c_55 C_55

label values c_56 C_56

label values c_58 C_58

label values c_59 C_59

label values c_60 C_60

label values c_61 C_61

label values c_62 C_62

label values s_10_1a S_10_1A

label values s_10_1b S_10_1B

label values s_10_1c S_10_1C

label values s_10_1d S_10_1D

label values s_10_1e S_10_1E

label values s_10_1f S_10_1F

label values s_10_1g S_10_1G

label values s_10_1h S_10_1H



*replace invalid missings (did not answer, .i) with a score of .i

replace MUNDO_score = . if c_20 == ".i" | c_20 == ".v" | c_20 == "." | c_20 == "5" | c_20 == "7"



*change c_20: 5,7 to illiterate and refused

*not sure what to do for MUNDO_score, right now both changed to .v

replace c_20 = "Illiterate" if c_20 == "5" 

replace c_20 = "Refused" if c_20 == "7" 



*relabel serial7 to refused if first response is "777"

replace serial7_score2 = .v if serial7_score2 == 0 & c_15 == 777

label define C_15 777 "." .i "."

label define C_16 777 "." .i "."

label define C_17 777 "." .i "."

label define C_18 777 "." .i "."

label define C_19 777 "." .i "."

label define SERIAL7_SCORE2 .v "Refused"



label values c_15 C_15

label values c_16 C_16

label values c_17 C_17

label values c_18 C_18

label values c_19 C_19

label values serial7_score2 SERIAL7_SCORE2



*merge in 1066 variables

if `country' == 0 {

    merge m:m pid using "`path'/PR_out/1066.dta", keepusing(dem1066_score relscore cogscore recall dem1066)

}

else if `country' == 1 {

    merge m:m pid using "`path'/DR_out/1066.dta", keepusing(dem1066_score relscore cogscore recall dem1066)

}

else if `country' == 2 {

    merge m:m pid using "`path'/CUBA_out/1066.dta", keepusing(dem1066_score relscore cogscore recall dem1066)

}

drop _merge



*replace Ty's 0/1/2 score with 0/1 score (above, mmse score is using 2 as a correct)

replace cs_32 = "0" if cs_32 == "1"

replace cs_32 = "1" if cs_32 == "2"



save `trans_folder'ConsensusVariables.dta, replace



exit

