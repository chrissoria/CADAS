* Infor_english_labels.do
* Apply English labels to Informant Interview variables
* Called from Infor_Read.do when language == "E"

****************************************
****************************************
* VALUE LABELS (label define + label values)
****************************************

label define I_A2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_a2 I_A2
label define I_A3 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_a3 I_A3
label define I_A4 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_a4 I_A4
label define I_B1 .a"." 1 "a member of (xxx)’s household?" 2 "a non-resident child of (xxx)?" 3 "someone else?", replace
capture label values i_b1 I_B1
label define I_B4 .a"." 1 "Female" 2 "Male" 3 "Other", replace
capture label values i_b4 I_B4
label define I_B5 .a"." 1 "Spouse" 2 "Child" 3 "Son-in-law/daughter-in-law" 4 "Brother/sister" 5 "Other relative" 6 "Friend" 7 "Neighbor" 8 "Other" 88 "Does not respond", replace
capture label values i_b5 I_B5
label define I_C1 .a"." 1 "Needs care most of the time" 2 "Needs occasional care" 3 "Doesn't need care, takes care of themselves" 8 "Does not respond"9 "Does not know", replace
capture label values i_c1 I_C1
label define I_C2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c2 I_C2
label define I_C3 .a"." 1 "One or more family members" 2 "One or more friends or neighbors, unpaid	" 3 "One or more paid caregivers" 4 "Does not receive direct care" 8 "Does not respond"9 "Does not know", replace
capture label values i_c3 I_C3
label define I_C4 .a"." 1 "One of the main direct caregivers" 2 "One of the main caretakers of 'organization'" 3 "Only slightly involved in providing or organizing care (others do it more)" 4 "Not involved in providing or arranging care", replace
capture label values i_c4 I_C4
label define I_C5 .a"." 1 "Yes, I have stopped working" 2 "Yes, I have decreased work hours" 3 "No" 8 "Does not respond", replace
capture label values i_c5 I_C5
label define I_C9 .a"." 1 "Yes" 2 "No" 8 "Does not respond", replace
capture label values i_c9 I_C9
label define I_C11 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c11 I_C11
label define I_C23 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c23 I_C23
label define I_C25 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c25 I_C25
label define I_C26A .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c26a I_C26A
label define I_C27A .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know", replace
capture label values i_c27a I_C27A
label define I_D2 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes " 3 "Frequentlye" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d2 I_D2
label define I_D3 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d3 I_D3
label define I_D5 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d5 I_D5
label define I_D6 .a"."0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d6 I_D6
label define I_D9 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d9 I_D9
label define I_D10 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d10 I_D10
label define I_D11 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d11 I_D11
label define I_D12 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d12 I_D12
label define I_D17 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d17 I_D17
label define I_D19 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d19 I_D19
label define I_D20 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d20 I_D20
label define I_D21 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond", replace
capture label values i_d21 I_D21
label define I_E1 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e1 I_E1
label define I_E2 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e2 I_E2
label define I_E3 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e3 I_E3
label define I_E4 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e4 I_E4
label define I_E5 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e5 I_E5
label define I_E6 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e6 I_E6
label define I_E7 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e7 I_E7
label define I_E8 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e8 I_E8
label define I_E9 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e9 I_E9
label define I_E10 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e10 I_E10
label define I_E11 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e11 I_E11
label define I_E12 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e12 I_E12
label define I_E13 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e13 I_E13
label define I_E14 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e14 I_E14
label define I_E15 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e15 I_E15
label define I_E16 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know", replace
capture label values i_e16 I_E16
label define I_F_CSID_1 .a"." 0 "No changes" 1 "Decreased activities and reduced ability to carry out activities", replace
capture label values i_f_csid_1 I_F_CSID_1
label define I_F_CSID_2 .a"." 0 "No changes" 1 "General deterioration", replace
capture label values i_f_csid_2 I_F_CSID_2
label define I_F_CSID_3 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_3 I_F_CSID_3
label define I_F_CSID_4 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_4 I_F_CSID_4
label define I_F_CSID_5 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_5 I_F_CSID_5
label define I_F_BSE_3 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_bse_3 I_F_BSE_3
label define I_F_BSE_7 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_bse_7 I_F_BSE_7
label define I_F_CSID_6 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_6 I_F_CSID_6
label define I_F_CSID_7 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_7 I_F_CSID_7
label define I_F_CSID_8 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_8 I_F_CSID_8
label define I_F_CSID_9 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_9 I_F_CSID_9
label define I_F_CSID_10 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_10 I_F_CSID_10
label define I_F_CSID_11 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_11 I_F_CSID_11
label define I_F_CSID_12 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_12 I_F_CSID_12
label define I_F_CSID_13 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_13 I_F_CSID_13
label define I_F_CSID_14 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_14 I_F_CSID_14
label define I_F_CSID_15 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_15 I_F_CSID_15
label define I_F_CSID_16 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_16 I_F_CSID_16
label define I_F_CSID_17 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_17 I_F_CSID_17
label define I_F_CSID_17A .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_17a I_F_CSID_17A
label define I_F_CSID_18 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_18 I_F_CSID_18
label define I_F_CSID_19 .a"." 0 "Shows no difficulty" 1 "Some difficulty" 2 "Can’t handle money", replace
capture label values i_f_csid_19 I_F_CSID_19
label define I_F_CSID_20 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_20 I_F_CSID_20
label define I_F_CSID_21 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis", replace
capture label values i_f_csid_21 I_F_CSID_21
label define I_F_CSID_22_1 .a"." 0 "Eats cleanly and with proper utensils" 1 "Gets dirty when eating. Only uses the spoon" 2 "Simple solids, like cookies" 3 "Must be fed", replace
capture label values i_f_csid_22_1 I_F_CSID_22_1
label define I_F_CSID_22_2 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_22_2 I_F_CSID_22_2
label define I_F_CSID_23_1 .a"." 0 "Dressed on their own" 1 "Occasionally misses a button, etc." 2 "Wrong sequence, often forgets items" 3 "Unable to dress", replace
capture label values i_f_csid_23_1 I_F_CSID_23_1
label define I_F_CSID_23_2 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_23_2 I_F_CSID_23_2
label define I_F_CSID_24_1 .a"." 0 "No problems" 1 "Occasionally wets the bed" 2 "Frequently wets the bed" 3 "Double incontinence", replace
capture label values i_f_csid_24_1 I_F_CSID_24_1
label define I_F_CSID_24_2 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_24_2 I_F_CSID_24_2
label define I_F_CSID_25 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_25 I_F_CSID_25
label define I_F_CSID_26 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_26 I_F_CSID_26
label define I_F_CSID_27 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_27 I_F_CSID_27
label define I_F_CSID_28 .a"." 0 "No" 1 "Yes", replace
capture label values i_f_csid_28 I_F_CSID_28
label define I_G1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g1 I_G1
label define I_G1_2 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g1_2 I_G1_2
label define I_G1_3 .a"." 0 "Not helpful" 1 "A little helpful" 2 "Very helpful" 8 "Does not respond"9 "Does not know", replace
capture label values i_g1_3 I_G1_3
label define I_G1_4 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g1_4 I_G1_4
label define I_G1_5 .a"." 0 "Not helpful" 1 "A little helpful" 2 "Very helpful" 8 "Does not respond"9 "Does not know", replace
capture label values i_g1_5 I_G1_5
label define I_G_HAS_2 .a"." 1 "Rapid onset of organic features over 1-3 days" 2 "Rapid onset of more than 3 days but less than 3 weeks" 3 "Gradual onset over a longer period of time" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_2 I_G_HAS_2
label define I_G_HAS_3_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_1 I_G_HAS_3_1
label define I_G_HAS_3_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_11 I_G_HAS_3_11
label define I_G_HAS_3_13 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_13 I_G_HAS_3_13
label define I_G_HAS_3_14 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_14 I_G_HAS_3_14
label define I_G_HAS_3_16 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_16 I_G_HAS_3_16
label define I_G_HAS_3_22 .a"." 1 "In general, described as deterioration" 2 "In general, described as improvement" 3 "Described as no changes, or few changes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_3_22 I_G_HAS_3_22
label define I_G_HAS_4 .a"." 0 "Does not vary" 1 "Fluctuating pattern with several days or weeks of improvement" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_4 I_G_HAS_4
label define I_G_HAS_5_1 .a"." 0 "Did not become normal" 1 "Condition described as return to normal or near normal" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_5_1 I_G_HAS_5_1
label define I_G_HAS_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_6 I_G_HAS_6
label define I_G_HAS_7_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_7_1 I_G_HAS_7_1
label define I_G_HAS_10 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_10 I_G_HAS_10
label define I_G_HAS_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_11 I_G_HAS_11
label define I_G_HAS_12 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_12 I_G_HAS_12
label define I_G_HAS_13 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_13 I_G_HAS_13
label define I_G_HAS_14_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_14_1 I_G_HAS_14_1
label define I_G_HAS_15 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_15 I_G_HAS_15
label define I_G_HAS_17 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_17 I_G_HAS_17
label define I_G_HAS_18 .a"." 0 "Only happened recently" 1 "One of the first things" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_18 I_G_HAS_18
label define I_G_HAS_47 .a"." 0 "No" 1 "Yes, probably" 2 "Yes, definitely" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_47 I_G_HAS_47
label define I_G_HAS_48 .a"." 0 "No" 1 "Yes, probably" 2 "Yes, definitelye" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_48 I_G_HAS_48
label define I_G_HAS_49 .a"." 0 "No" 1 "Yes, from a few minutes to an hour" 2 "Yes, more than an hour" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_49 I_G_HAS_49
label define I_G_HAS_50 .a"." 0 "No	such changes" 1 "Serious condition affecting the head and causing permanent changes to personality/intellect" 8 "Does not respond"9 "Does not know", replace
capture label values i_g_has_50 I_G_HAS_50
label define I_G_HAS_52 .a"." 0 "No" 1 "Yes", replace
capture label values i_g_has_52 I_G_HAS_52
label define I_H_NPI_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know", replace
capture label values i_h_npi_1 I_H_NPI_1
label define I_H_NPI_1_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_1_1 I_H_NPI_1_1
label define I_H_NPI_1_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (a lot of discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_1_2 I_H_NPI_1_2
label define I_H_NPI_2 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_2 I_H_NPI_2
label define I_H_NPI_2_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_2_1 I_H_NPI_2_1
label define I_H_NPI_2_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_2_2 I_H_NPI_2_2
label define I_H_NPI_3 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_3 I_H_NPI_3
label define I_H_NPI_3_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_3_1 I_H_NPI_3_1
label define I_H_NPI_3_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_3_2 I_H_NPI_3_2
label define I_H_NPI_4 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_4 I_H_NPI_4
label define I_H_NPI_4_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_4_1 I_H_NPI_4_1
label define I_H_NPI_4_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_4_2 I_H_NPI_4_2
label define I_H_NPI_5 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_5 I_H_NPI_5
label define I_H_NPI_5_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_5_1 I_H_NPI_5_1
label define I_H_NPI_5_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_5_2 I_H_NPI_5_2
label define I_H_NPI_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_6 I_H_NPI_6
label define I_H_NPI_6_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_6_1 I_H_NPI_6_1
label define I_H_NPI_6_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_6_2 I_H_NPI_6_2
label define I_H_NPI_7 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_7 I_H_NPI_7
label define I_H_NPI_7_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_7_1 I_H_NPI_7_1
label define I_H_NPI_7_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_7_2 I_H_NPI_7_2
label define I_H_NPI_8 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_8 I_H_NPI_8
label define I_H_NPI_8_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_8_1 I_H_NPI_8_1
label define I_H_NPI_8_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_8_2 I_H_NPI_8_2
label define I_H_NPI_9 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_9 I_H_NPI_9
label define I_H_NPI_9_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_9_1 I_H_NPI_9_1
label define I_H_NPI_9_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_9_2 I_H_NPI_9_2
label define I_H_NPI_10 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_10 I_H_NPI_10
label define I_H_NPI_10_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_10_1 I_H_NPI_10_1
label define I_H_NPI_10_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_10_2 I_H_NPI_10_2
label define I_H_NPI_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_11 I_H_NPI_11
label define I_H_NPI_11_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_11_1 I_H_NPI_11_1
label define I_H_NPI_11_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_11_2 I_H_NPI_11_2
label define I_H_NPI_12 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_h_npi_12 I_H_NPI_12
label define I_H_NPI_12_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)", replace
capture label values i_h_npi_12_1 I_H_NPI_12_1
label define I_H_NPI_12_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)", replace
capture label values i_h_npi_12_2 I_H_NPI_12_2
label define I_J1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_j1 I_J1
label define I_J2 .a"." 1 "Less than five years ago" 2 "Between 5 and 10 years ago" 3 "10 years ago or more" 8 "Does not respond"9 "Does not know", replace
capture label values i_j2 I_J2
label define I_J3 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know", replace
capture label values i_j3 I_J3
label define I_K_ACT_1 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_1 I_K_ACT_1
label define I_K_ACT_2 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_2 I_K_ACT_2
label define I_K_ACT_5 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_5 I_K_ACT_5
label define I_K_ACT_7 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_7 I_K_ACT_7
label define I_K_ACT_8 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_8 I_K_ACT_8
label define I_K_ACT_10 .a"." 1 "Yes" 2 "No" 6 "xxx doesn’t usually cook" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_10 I_K_ACT_10
label define I_K_ACT_13 .a"." 1 "Yes" 2 "No" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_13 I_K_ACT_13
label define I_K_ACT_14 .a"." 1 "Yes" 2 "No" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_14 I_K_ACT_14
label define I_K_ACT_15 .a"." 1 "Daily" 2 "Several times per week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_15 I_K_ACT_15
label define I_K_ACT_16 .a"." 1 "Daily" 2 "Several times a week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_16 I_K_ACT_16
label define I_K_ACT_17 .a"." 1 "Alone" 2 "Accompanied" 9 "Does not know"8 "Does not respond", replace
capture label values i_k_act_17 I_K_ACT_17
label define I_LHAS_54 .a"." 0 "Reasonable" 1 "Some doubts" 2 "Moderate doubts" 3 "Serious doubts" 4 "Worthless", replace
capture label values i_lhas_54 I_LHAS_54
label define I_B7 .a "." 0 "None" 1 "1 to 5" 2 "6 to 8" 3 "9 to 12" 4 "More than 12" 8 "Does not respond" 9 "Does not know", replace
capture label values i_b7 I_B7
label define I_B7_ .a "." 0 "None" 1 "1 to 5" 2 "6 to 8" 3 "9 to 12" 4 "More than 12" 8 "Does not respond" 9 "Does not know", replace
capture label values i_b7_ I_B7_
capture label values i_b7 I_B7_
label define I_C7_1 .a "." 1 "1 - profesional ejecutivo" 2 "2 - oficinista" 3 "3 - vendedor, minorista" 4 "4 - agricultor independiente" 5 "5 - trabajador agricola" 6 "6 - trabajador domestico" 7 "7 - otros servicios" 8 "8 - trabajador especializado" 9 "9 - trabajador no especializado" 10 "10 - trabajos informales" 13 "13- otros" 88 "88 - no responde" 99 "99 - no sabe", replace
capture label values i_c7_1 I_C7_1
label define I_C7_1_ .a "." 1 "Professional, executive" 2 "Clerk" 3 "Seller, retailer" 4 "Independent farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled worker" 9 "Unskilled worker" 10 "Informal jobs" 13 "Others" 88 "Does not respond" 99 "Does not know", replace
capture label values i_c7_1_ I_C7_1_
capture label values i_c7_1 I_C7_1_
label define I_C8A .a "." 1 "1 - todo el tiempo enfocado exclusivamente en su (xxx)" 2 "2 - la mayor parte del tiempo enfocado en su (xxx)" 3 "3 - mitad y mitad" 4 "4 - la mayor parte del tiempo haciendo otras tareas u ocio" 8 "8 - no responde" 9 "9 - no sabe", replace
capture label values i_c8a I_C8A
label define I_C8A_ .a "." 1 "All the time focused exclusively on their (xxx)" 2 "Most of the time focused on their (xxx)" 3 "Half and Half" 4 "Most of the time doing other tasks or leisure" 8 "Does not respond" 9 "Does not know", replace
capture label values i_c8a_ I_C8A_
capture label values i_c8a I_C8A_

****************************************

* VARIABLE LABELS (label variable)
****************************************

* Identifier variables
capture label variable i_interid "Interviewer number:"
capture label variable i_clustid "Cluster number:"
capture label variable i_houseid "House number:"
capture label variable i_particid "Participant number:"
capture label variable i_country "Country"
capture label variable i_houseid2 "HOUSE NUMBER:"
capture label variable i_conglid2 "CLUSTER NUMBER:"
capture label variable i_particid2 "PARTICIPANT NUMBER"
capture label variable i_deviceid1 "Device ID:"

* Section A: Verification Questions
capture label variable i_a2 "A2. To the question 'What are the names of the two most important streets near your house?' xxx responded _________ [read the response you noted on paper in cognitive]. Is this correct?"
capture label variable i_a3 "A3. To the question 'Where is the nearest store or bodega?' xxx responded _________ [read the response you noted in cognitive]. Is this correct?"
capture label variable i_a4 "A4. To the question 'What is your address?' xxx responded _________ [read the response you noted in cognitive]. Is this correct?"

* Section B: Informant Demographics
capture label variable i_b1 "B1. Are you:"
capture label variable i_b3 "B3. How old are you?"
capture label variable i_b4 "B4. Your gender?"
capture label variable i_b5 "B5. What is your relationship to (xxx)?"
capture label variable i_b7 "B7. How many years of education have you completed?"

* Section C: Caregiving
capture label variable i_c1 "C1. The older person"
capture label variable i_c2 "C2. Can the older person be alone for an hour or more (during the day)?"
capture label variable i_c3 "C3. Direct care is provided mainly by:"
capture label variable i_c4 "C4. You are: (code the value below that best applies)"
capture label variable i_c5 "C5. Have you stopped working or reduced your work hours to care for your (xxx)?"
capture label variable i_c6 "C6. How long ago did you stop working? Code the response in months NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c7 "C7. How many hours per week have you reduced your work? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c7_1 "C7.1. What is/was your job?"
capture label variable i_c8 "C8. In a typical week, how many hours do you spend caring for your (xxx)? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c8a "C8A. During these hours caring for your (xxx), what proportion of time is focused exclusively on your (xxx) and what proportion is doing other tasks or leisure at the same time?"
capture label variable i_c9 "C9. In a typical week, do you receive any payment for caring for your (xxx)?"
capture label variable i_c10 "C10. In a typical week, how much do you receive in payment for caring for your (xxx)? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c11 "C11. Do any others regularly care for your (xxx)?"
capture label variable i_c12 "C12. In total in a typical week, how many hours per week do these others care for your (xxx)? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c23 "C23. In a typical week, do any of them receive payment for caring for your (xxx)?"
capture label variable i_c24 "C24. In total in a typical week, how much do they receive for caring for your (xxx)? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c25 "C25. In addition to receiving care at home, does your (xxx) regularly attend any Adult Day Center?"
capture label variable i_c26 "C26. How many hours per week does (xxx) attend the Adult Day Center? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c26a "C26.A. Were these hours already counted above?"
capture label variable i_c27 "C27. How much is paid approximately per week for your (xxx) to attend the Adult Day Center? NO RESPONSE=888 DON'T KNOW=999"
capture label variable i_c27a "C27.A. Were these payments already counted above?"

* Section D: Caregiver Burden (Zarit)
capture label variable i_d2 "D2. Do you feel that because of time spent with your (xxx), you don't have enough time for yourself?"
capture label variable i_d3 "D3. Do you feel stressed between caring for your (xxx) and trying to meet responsibilities for your family and work?"
capture label variable i_d5 "D5. Do you feel angry when you are around your (xxx)?"
capture label variable i_d6 "D6. Do you feel that your (xxx) currently negatively affects your relationship with other family members or friends?"
capture label variable i_d9 "D9. Do you feel stressed when you are around your (xxx)?"
capture label variable i_d10 "D10. Do you feel that your health has suffered because of caring for your (xxx)?"
capture label variable i_d11 "D11. Do you feel that you don't have enough privacy because of your (xxx)?"
capture label variable i_d12 "D12. Do you feel that your social life has suffered because of your (xxx)?"
capture label variable i_d17 "D17. Do you feel that you have lost control of your life since your (xxx) became ill?"
capture label variable i_d19 "D19. Do you feel uncertain about what to do with your (xxx)?"
capture label variable i_d20 "D20. Do you feel that you should be doing more for your (xxx)?"
capture label variable i_d21 "D21. Do you feel that you could be doing a better job caring for your (xxx)?"

* Section E: IQCODE (Jorm) - Cognitive Decline
capture label variable i_e1 "E1. Ability to remember things about family and friends (where they live, what they do, when their birthday is...)"
capture label variable i_e2 "E2. Remembering things that happened in the last few months (news, family events)."
capture label variable i_e3 "E3. Remembering what was said in a conversation a few days ago"
capture label variable i_e4 "E4. Remembering own address or telephone number"
capture label variable i_e5 "E5. Remembering the date (e.g., day and month)"
capture label variable i_e6 "E6. Knowing the exact location of cupboards in the house and where things are kept"
capture label variable i_e7 "E7. Ability to find things that have been put in unusual places."
capture label variable i_e8 "E8. Knowing how to operate household appliances (telephone, car, washing machine, razor, etc.)"
capture label variable i_e9 "E9. Ability to learn to operate a new appliance (washing machine, radio, hair dryer, etc.)"
capture label variable i_e10 "E10. Learning new things (in general)"
capture label variable i_e11 "E11. Following a story in a book, newspaper, television, or radio"
capture label variable i_e12 "E12. Making decisions on everyday matters (what clothes to wear, what food to prepare) and on longer-term matters (where to go on vacation or invest money)"
capture label variable i_e13 "E13. Handling financial matters (collecting pension, paying rent or taxes, dealing with bank)"
capture label variable i_e14 "E14. Handling money for shopping (how much money to give, calculating change)"
capture label variable i_e15 "E15. Handling other everyday arithmetic problems (time between visits from relatives, how much food to buy and prepare, especially if there are guests)"
capture label variable i_e16 "E16. Do you think their intelligence (in general) to understand and reason about what happens around them?"

* Section F: CSID - Cognitive Screening
capture label variable i_f_csid_1 "F.CSID.1 Have you seen any change in their daily activities? Please describe"
capture label variable i_f_csid_2 "F.CSID.2 Has there been a general decline in their mental functioning? Please describe."
capture label variable i_f_csid_3 "F.CSID.3 We all have some difficulty remembering things as we age, but has this been a particularly important problem for your (relative)?"
capture label variable i_f_csid_4 "F.CSID.4 Does s/he forget where s/he has put things? If yes - How often?"
capture label variable i_f_csid_5 "F.CSID.5 Does s/he forget where things are usually kept? If yes - How often?"
capture label variable i_f_bse_3 "F.BSE.3 Does s/he have difficulty remembering short lists of objects (for example, shopping list)?"
capture label variable i_f_bse_7 "F.BSE.7 Does s/he have difficulty remembering recent events (example, recent outings/events, visits to friends or family)?"
capture label variable i_f_csid_6 "F.CSID.6 Does s/he forget the names of friends? If yes - How often?"
capture label variable i_f_csid_7 "F.CSID.7 Does s/he forget the names of family members? If yes - How often?"
capture label variable score1 "Score1"
capture label variable i_f_csid_8 "F.CSID.8 Does s/he forget what s/he wanted to say in the middle of a conversation? If yes - How often?"
capture label variable i_f_csid_9 "F.CSID.9 When speaking, does s/he have difficulty saying the correct words? If yes - How often?"
capture label variable i_f_csid_10 "F.CSID.10 Does s/he use incorrect words? If yes - How often?"
capture label variable i_f_csid_11 "F.CSID.11 Does s/he tend to talk about things that happened long ago instead of present things? If yes - How often?"
capture label variable i_f_csid_12 "F.CSID.12 Does s/he forget when was the last time s/he saw you? If yes - How often?"
capture label variable i_f_csid_13 "F.CSID.13 Does s/he forget what happened yesterday? If yes - How often?"
capture label variable i_f_csid_14 "F.CSID.14 Does s/he forget where s/he is? If yes - How often?"
capture label variable i_f_csid_15 "F.CSID.15 Does s/he get lost in the community? If yes - How often?"
capture label variable i_f_csid_16 "F.CSID.16 Does s/he get lost in their own house, for example: looking for the bathroom? If yes - How often?"
capture label variable i_f_csid_17 "F.CSID.17 Does s/he have difficulty performing household tasks that s/he used to do? Such as preparing food or boiling tea?"
capture label variable i_f_csid_17a "F.CSID.17a Does the interviewer think the problem is primarily due to physical impairments?"
capture label variable i_f_csid_18 "F.CSID.18 Has there been loss of any special skill from a hobby that s/he used to be able to do?"
capture label variable score2 "Score2"
capture label variable i_f_csid_19 "F.CSID.19 Has there been a change in their ability to handle money?"
capture label variable i_f_csid_20 "F.CSID.20 Does s/he have difficulty adjusting to changes in daily routine? If yes - How often?"
capture label variable i_f_csid_21 "F.CSID.21 Have you noticed changes in their ability to think and reason?"
capture label variable i_f_csid_22_1 "F.CSID.22.1 Does s/he have difficulty feeding themselves?"
capture label variable i_f_csid_22_2 "F.CSID.22.2 Does the interviewer think these problems are primarily due to physical disability?"
capture label variable i_f_csid_23_1 "F.CSID.23.1 Does s/he have difficulty dressing?"
capture label variable i_f_csid_23_2 "F.CSID.23.2 Does the interviewer think the problem is primarily due to physical disability?"
capture label variable i_f_csid_24_1 "F.CSID.24.1 Does s/he have difficulty using the toilet? Is s/he incontinent of urine or feces?"
capture label variable i_f_csid_24_2 "F.CSID.24.2 Does the interviewer think the problem is primarily due to physical disability?"
capture label variable i_f_csid_25 "F.CSID.25 Does s/he confuse you (or another family member) with another person?"
capture label variable score3 "Score3"
capture label variable i_f_csid_26 "F.CSID.26 Recently, has s/he had difficulty making decisions on everyday things?"
capture label variable i_f_csid_27 "F.CSID.27 Does their thinking seem confused at times?"
capture label variable score4 "Score4"
capture label variable totalscore "Total Score:"
capture label variable i_f_csid_28 "F.CSID.28 INTERVIEWER CODE - IS THE TOTAL CSID SCORE 2.5 OR LESS?"

* Section G: History and Onset
capture label variable i_g0 "G.0. Looking back, could you give an approximate date when you or someone else first noticed that your (xxx) had difficulties with memory, thinking, concentration, daily activities, or self-care? Code time since onset in months No Response=8 Don't Know=9"
capture label variable i_g1 "G.1 At any time, did you and/or the participant (the older person) seek help from a doctor or other health professional for any of these problems?"
capture label variable i_g1_1 "G.1.1. When? (time in months since consultation) No Response=8 Don't Know=9"
capture label variable i_g1_2 "G.1.2. Did the doctor/health professional give any advice?"
capture label variable i_g1_3 "G.1.3. Was it helpful?"
capture label variable i_g1_4 "G.1.4. Did the doctor/health professional prescribe any medicine?"
capture label variable i_g1_5 "G.1.5. Was it helpful?"
capture label variable i_g_has_2 "G.HAS2 Did these problems occur rapidly or gradually? (If rapid onset) - when was that?"
capture label variable i_g_has_3_1 "G.HAS3.1 Did s/he have difficulty remembering things?"
capture label variable i_g_has_3_11 "G.HAS.3.11 Did s/he see things that other people didn't see?"
capture label variable i_g_has_3_13 "G.HAS.3.13 Could it have started with some type of stroke? A stroke is a paralysis (weakness) of the face or extremities on one side of the body lasting at least 24 hours. (IF YES, ASK: Please describe.) (NB - MUST BE CLEAR HISTORY OF STROKE)"
capture label variable i_g_has_3_14 "G.HAS.3.14 Did s/he have problems finding the right word? (IF YES, ASK: Please describe.) NB - ONLY MAJOR AND PERSISTENT DIFFICULTY IN WORD FINDING, AND EXCLUDE DELIRIUM"
capture label variable i_g_has_3_16 "G.HAS.3.16 Could it have started with some type of epileptic seizure? (IF YES, ASK: Please describe.) NB - ONLY EPILEPTIC SEIZURES DIAGNOSED BY A DOCTOR"
capture label variable i_g_has_3_22 "G.HAS.3.22 How are things now compared to when the illness started? Have they worsened? Better or about the same?"
capture label variable i_g_has_4 "G.HAS.4 Has the present illness tended to vary much, from day to day, from week to week, worsening and perhaps improving for a time - with ups and downs? (IF YES, ASK: How much did it vary? How long did these periods last?)"
capture label variable i_g_has_5_1 "G.HAS.5.1 During the periods of improvement, did thinking, memory and concentration become normal or nearly normal?"
capture label variable i_g_has_6 "G.HAS.6 Would you say there has been a gradual deterioration of memory or...(list current cognitive impairments) over a period of more than 2 years?"
capture label variable i_g_has_7_1 "G.HAS.7.1 Has the present illness worsened suddenly at any time, within a period of 3 days and then remained so?"
capture label variable i_g_has_10 "G.HAS.10 Are there periods in 24 hours when s/he seems very changeable; alert one moment, drowsy and confused afterwards?"
capture label variable i_g_has_11 "G.HAS.11 Does s/he get confused at night, wander, talk nonsense?"
capture label variable i_g_has_12 "G.HAS.12 And during the day?"
capture label variable i_g_has_13 "G.HAS.13 Is the confusion worse at dusk or at night?"
capture label variable i_g_has_14_1 "G.HAS.14.1 How does s/he treat you (relatives, friends) now compared to before the illness began? Does s/he show lack of interest, concern, or affection compared to before?"
capture label variable i_g_has_15 "G.HAS.15 Has s/he been more irritable lately?"
capture label variable i_g_has_17 "G.HAS.17 Has there been a change in behavior, perhaps doing embarrassing things or things that might bother other people?"
capture label variable i_g_has_18 "G.HAS.18 Were these things among the first changes you noticed or have they only happened recently?"
capture label variable i_g_has_47 "G.HAS.47 Did your relative ever have an accident that caused damage to the head or brain?"
capture label variable i_g_has_48 "G.HAS.48 Did your relative ever have an illness or infection that caused serious damage to the head or brain?"
capture label variable i_g_has_49 "G.HAS.49 Was there a period of unconsciousness after the illness or accident?"
capture label variable i_g_has_50 "G.HAS.50 Did their behavior change in any way? (If yes - Describe how it changed, what was permanent)"
capture label variable i_g_has_52 "G.HAS.52 INTERVIEWER OBSERVATION: Is the participant's current intellectual state present from birth (is it due to a pathological cause that occurred in childhood)? ['No' is due to a mental illness that occurred in recent years.]"

* Section H: NPI (Neuropsychiatric Inventory)
capture label variable i_h_npi_1 "H.NPI.1 Does (xxx) believe that others are stealing from them, or that others are planning to harm them in some way?"
capture label variable i_h_npi_1_1 "H.NPI.1.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_1_2 "H.NPI.1.2 Rate the distress you experience from this symptom (how it affects you)."
capture label variable i_h_npi_2 "H.NPI.2 Does your (xxx) act as if s/he hears voices? Does s/he talk to people who are not present?"
capture label variable i_h_npi_2_1 "H.NPI.2.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_2_2 "H.NPI.2.2 Rate the distress you experience from this symptom (how it affects you)."
capture label variable i_h_npi_3 "H.NPI.3 Is your (xxx) stubborn, or does s/he resist help from others?"
capture label variable i_h_npi_3_1 "H.NPI.3.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_3_2 "H.NPI.3.2 Rate the distress you experience from this symptom (how it affects you)."
capture label variable i_h_npi_4 "H.NPI.4 Does your (xxx) act as if s/he is sad, discouraged, or in low spirits? Does s/he cry?"
capture label variable i_h_npi_4_1 "H.NPI.4.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_4_2 "H.NPI.4.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_5 "H.NPI.5 Does your xxx become upset when separated from you? Does s/he show signs of nervousness, such as shortness of breath, sighing, inability to relax, or feeling excessively tense?"
capture label variable i_h_npi_5_1 "H.NPI.5.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_5_2 "H.NPI.5.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_6 "H.NPI.6 Does your (xxx) seem to feel too good, or act as if excessively happy?"
capture label variable i_h_npi_6_1 "H.NPI.6.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_6_2 "H.NPI.6.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_7 "H.NPI.7 Does your (xxx) seem less interested in their usual activities or in others' plans?"
capture label variable i_h_npi_7_1 "H.NPI.7.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_7_2 "H.NPI.7.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_8 "H.NPI.8 Does your (xxx) seem to act impulsively?, for example, talking to strangers as if they were known people? Or saying things that could hurt others' feelings?"
capture label variable i_h_npi_8_1 "H.NPI.8.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_8_2 "H.NPI.8.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_9 "H.NPI.9 Is your (xxx) impatient and cranky? Does s/he have difficulty coping with delays or waiting for planned activities?"
capture label variable i_h_npi_9_1 "H.NPI.9.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_9_2 "H.NPI.9.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_10 "H.NPI.10 Does your (xxx) do or say things repetitively (like pacing around the house, or opening closets and drawers)?"
capture label variable i_h_npi_10_1 "H.NPI.10.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_10_2 "H.NPI.10.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_11 "H.NPI.11 Does your (xxx) have difficulty falling asleep, staying up at night and/or wandering at night, getting up too early or sleeping excessively during the day?"
capture label variable i_h_npi_11_1 "H.NPI.11.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_11_2 "H.NPI.11.2 Rate the distress you experience from this symptom (how it affects you)"
capture label variable i_h_npi_12 "H.NPI.12 Has your (xxx) lost or gained weight, or had a change in the type of food s/he prefers?"
capture label variable i_h_npi_12_1 "H.NPI.12.1 Rate the severity of the symptom (how it affects your xxx)."
capture label variable i_h_npi_12_2 "H.NPI.12.2 Rate the distress you experience from this symptom (how it affects you)"

* Section J: Dementia/Alzheimer Diagnosis
capture label variable i_j1 "J1. Has a doctor ever told your (xxx) that they have dementia or Alzheimer's?"
capture label variable i_j2 "J2. When was (xxx) first told?"
capture label variable i_j3 "J3. Did the doctor prescribe any medication for (xxx)?"

* Section K: HCAP Activities
capture label variable i_k_act_1 "K.ACT.1 On a normal day, how many hours a day does (xxx) read?"
capture label variable i_k_act_2 "K.ACT.2 On a normal day, how many hours a day does (xxx) read?"
capture label variable i_k_act_5 "K.ACT.5 On a normal day, how many hours does (xxx) spend on household chores?"
capture label variable i_k_act_7 "K.ACT.7 On a normal day, how many hours does (xxx) use the computer or internet?"
capture label variable i_k_act_8 "K.ACT.8 On a normal day, how many hours a day does (xxx) nap?"
capture label variable i_k_act_10 "K.ACT.10 Does (xxx) cook food?"
capture label variable i_k_act_13 "K.ACT.13 Can (xxx) get around the neighborhood by themselves?"
capture label variable i_k_act_14 "K.ACT.14 Can (xxx) use public transportation by themselves?"
capture label variable i_k_act_15 "K.ACT.15 How often does (xxx) go to work or do volunteer work?"
capture label variable i_k_act_16 "K.ACT.16 How often does (xxx) go to the supermarket for food or other things?"
capture label variable i_k_act_17 "K.ACT.17 Does (xxx) usually go alone or accompanied?"

* Section L: Global Data Confidence Rating
capture label variable i_lhas_54 "L.HAS.54 Global data confidence rating"
