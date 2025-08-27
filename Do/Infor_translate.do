clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out/translation_PR"
}
else if `country' == 1 {
    cd "`path'/DR_out/translation_DR"
}
else if `country' == 2 {
    cd "`path'/CUBA_out/translation_CUBA"
}

if `country' == 0 {
    use using "../Infor"
    replace i_country = 0
}
else if `country' == 1 {
    use using "../Infor"
    replace i_country = 1
}
else if `country' == 2 {
    use using "../Infor"
    replace i_country = 2
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translation_PR"
}
else if `country' == 1 {
    cd "`path'/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}

if `country' == 0 {
    use using "../PR_out/Infor"
	replace i_country = 0
}
else if `country' == 1 {
    use using "../DR_out/Infor"
	replace i_country = 1
}
else if `country' == 2 {
    use using "../CUBA_out/Infor"
	replace i_country = 2
}
}

label drop _all


capture confirm numeric variable I_A2
if !_rc{
     tostring I_A2, replace
}

label define I_A2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_A3
if !_rc{
     tostring I_A3, replace
}

label define I_A3 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_A4
if !_rc{
     tostring I_A4, replace
}

label define I_A4 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_B1
if !_rc{
     tostring I_B1, replace
}

label define I_B1 .a"." 1 "a member of (xxx)’s household?" 2 "a non-resident child of (xxx)?" 3 "someone else?" 



capture confirm numeric variable I_B4
if !_rc{
     tostring I_B4, replace
}

label define I_B4 .a"." 1 "Female" 2 "Male" 3 "Other" 



capture confirm numeric variable I_B5
if !_rc{
     tostring I_B5, replace
}

label define I_B5 .a"." 1 "Spouse" 2 "Child" 3 "Son-in-law/daughter-in-law" 4 "Brother/sister" 5 "Other relative" 6 "Friend" 7 "Neighbor" 8 "Other" 88 "Does not respond"



capture confirm numeric variable I_C1
if !_rc{
     tostring I_C1, replace
}

label define I_C1 .a"." 1 "Needs care most of the time" 2 "Needs occasional care" 3 "Doesn't need care, takes care of themselves" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C2
if !_rc{
     tostring I_C2, replace
}

label define I_C2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C3
if !_rc{
     tostring I_C3, replace
}

label define I_C3 .a"." 1 "One or more family members" 2 "One or more friends or neighbors, unpaid	" 3 "One or more paid caregivers" 4 "Does not receive direct care" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C4
if !_rc{
     tostring I_C4, replace
}

label define I_C4 .a"." 1 "One of the main direct caregivers" 2 "One of the main caretakers of 'organization'" 3 "Only slightly involved in providing or organizing care (others do it more)" 4 "Not involved in providing or arranging care" 



capture confirm numeric variable I_C5
if !_rc{
     tostring I_C5, replace
}

label define I_C5 .a"." 1 "Yes, I have stopped working" 2 "Yes, I have decreased work hours" 3 "No" 8 "Does not respond"



capture confirm numeric variable I_C9
if !_rc{
     tostring I_C9, replace
}

label define I_C9 .a"." 1 "Yes" 2 "No" 8 "Does not respond"



capture confirm numeric variable I_C11
if !_rc{
     tostring I_C11, replace
}

label define I_C11 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C23
if !_rc{
     tostring I_C23, replace
}

label define I_C23 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C25
if !_rc{
     tostring I_C25, replace
}

label define I_C25 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C26A
if !_rc{
     tostring I_C26A, replace
}

label define I_C26A .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_C27A
if !_rc{
     tostring I_C27A, replace
}

label define I_C27A .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_D2
if !_rc{
     tostring I_D2, replace
}

label define I_D2 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes " 3 "Frequentlye" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D3
if !_rc{
     tostring I_D3, replace
}

label define I_D3 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D5
if !_rc{
     tostring I_D5, replace
}

label define I_D5 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D6
if !_rc{
     tostring I_D6, replace
}

label define I_D6 .a"."0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D9
if !_rc{
     tostring I_D9, replace
}

label define I_D9 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D10
if !_rc{
     tostring I_D10, replace
}

label define I_D10 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D11
if !_rc{
     tostring I_D11, replace
}

label define I_D11 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D12
if !_rc{
     tostring I_D12, replace
}

label define I_D12 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D17
if !_rc{
     tostring I_D17, replace
}

label define I_D17 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D19
if !_rc{
     tostring I_D19, replace
}

label define I_D19 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D20
if !_rc{
     tostring I_D20, replace
}

label define I_D20 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_D21
if !_rc{
     tostring I_D21, replace
}

label define I_D21 .a"." 0 "Never" 1 "Rarely" 2 "Sometimes" 3 "Frequently" 4 "Almost always" 8 "Does not respond"



capture confirm numeric variable I_E1
if !_rc{
     tostring I_E1, replace
}

label define I_E1 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E2
if !_rc{
     tostring I_E2, replace
}

label define I_E2 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E3
if !_rc{
     tostring I_E3, replace
}

label define I_E3 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E4
if !_rc{
     tostring I_E4, replace
}

label define I_E4 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E5
if !_rc{
     tostring I_E5, replace
}

label define I_E5 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E6
if !_rc{
     tostring I_E6, replace
}

label define I_E6 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E7
if !_rc{
     tostring I_E7, replace
}

label define I_E7 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E8
if !_rc{
     tostring I_E8, replace
}

label define I_E8 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E9
if !_rc{
     tostring I_E9, replace
}

label define I_E9 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E10
if !_rc{
     tostring I_E10, replace
}

label define I_E10 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E11
if !_rc{
     tostring I_E11, replace
}

label define I_E11 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E12
if !_rc{
     tostring I_E12, replace
}

label define I_E12 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E13
if !_rc{
     tostring I_E13, replace
}

label define I_E13 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E14
if !_rc{
     tostring I_E14, replace
}

label define I_E14 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E15
if !_rc{
     tostring I_E15, replace
}

label define I_E15 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_E16
if !_rc{
     tostring I_E16, replace
}

label define I_E16 .a"." 1 "Has improved a lot" 2 "Has improved a little" 3 "Not much has changed" 4 "Has worsened a little" 5 "Has worsened a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_F_CSID_1
if !_rc{
     tostring I_F_CSID_1, replace
}

label define I_F_CSID_1 .a"." 0 "No changes" 1 "Decreased activities and reduced ability to carry out activities" 



capture confirm numeric variable I_F_CSID_2
if !_rc{
     tostring I_F_CSID_2, replace
}

label define I_F_CSID_2 .a"." 0 "No changes" 1 "General deterioration" 



capture confirm numeric variable I_F_CSID_3
if !_rc{
     tostring I_F_CSID_3, replace
}

label define I_F_CSID_3 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_4
if !_rc{
     tostring I_F_CSID_4, replace
}

label define I_F_CSID_4 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_5
if !_rc{
     tostring I_F_CSID_5, replace
}

label define I_F_CSID_5 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_BSE_3
if !_rc{
     tostring I_F_BSE_3, replace
}

label define I_F_BSE_3 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_BSE_7
if !_rc{
     tostring I_F_BSE_7, replace
}

label define I_F_BSE_7 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_6
if !_rc{
     tostring I_F_CSID_6, replace
}

label define I_F_CSID_6 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_7
if !_rc{
     tostring I_F_CSID_7, replace
}

label define I_F_CSID_7 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_8
if !_rc{
     tostring I_F_CSID_8, replace
}

label define I_F_CSID_8 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_9
if !_rc{
     tostring I_F_CSID_9, replace
}

label define I_F_CSID_9 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_10
if !_rc{
     tostring I_F_CSID_10, replace
}

label define I_F_CSID_10 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_11
if !_rc{
     tostring I_F_CSID_11, replace
}

label define I_F_CSID_11 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_12
if !_rc{
     tostring I_F_CSID_12, replace
}

label define I_F_CSID_12 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_13
if !_rc{
     tostring I_F_CSID_13, replace
}

label define I_F_CSID_13 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_14
if !_rc{
     tostring I_F_CSID_14, replace
}

label define I_F_CSID_14 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_15
if !_rc{
     tostring I_F_CSID_15, replace
}

label define I_F_CSID_15 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_16
if !_rc{
     tostring I_F_CSID_16, replace
}

label define I_F_CSID_16 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_17
if !_rc{
     tostring I_F_CSID_17, replace
}

label define I_F_CSID_17 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_17A
if !_rc{
     tostring I_F_CSID_17A, replace
}

label define I_F_CSID_17A .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_18
if !_rc{
     tostring I_F_CSID_18, replace
}

label define I_F_CSID_18 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_19
if !_rc{
     tostring I_F_CSID_19, replace
}

label define I_F_CSID_19 .a"." 0 "Shows no difficulty" 1 "Some difficulty" 2 "Can’t handle money" 



capture confirm numeric variable I_F_CSID_20
if !_rc{
     tostring I_F_CSID_20, replace
}

label define I_F_CSID_20 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_21
if !_rc{
     tostring I_F_CSID_21, replace
}

label define I_F_CSID_21 .a"." 0 "Never" 1 "Yes, sometimes" 2 "Yes, on a regular basis" 



capture confirm numeric variable I_F_CSID_22_1
if !_rc{
     tostring I_F_CSID_22_1, replace
}

label define I_F_CSID_22_1 .a"." 0 "Eats cleanly and with proper utensils" 1 "Gets dirty when eating. Only uses the spoon" 2 "Simple solids, like cookies" 3 "Must be fed" 



capture confirm numeric variable I_F_CSID_22_2
if !_rc{
     tostring I_F_CSID_22_2, replace
}

label define I_F_CSID_22_2 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_23_1
if !_rc{
     tostring I_F_CSID_23_1, replace
}

label define I_F_CSID_23_1 .a"." 0 "Dressed on their own" 1 "Occasionally misses a button, etc." 2 "Wrong sequence, often forgets items" 3 "Unable to dress" 



capture confirm numeric variable I_F_CSID_23_2
if !_rc{
     tostring I_F_CSID_23_2, replace
}

label define I_F_CSID_23_2 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_24_1
if !_rc{
     tostring I_F_CSID_24_1, replace
}

label define I_F_CSID_24_1 .a"." 0 "No problems" 1 "Occasionally wets the bed" 2 "Frequently wets the bed" 3 "Double incontinence" 



capture confirm numeric variable I_F_CSID_24_2
if !_rc{
     tostring I_F_CSID_24_2, replace
}

label define I_F_CSID_24_2 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_25
if !_rc{
     tostring I_F_CSID_25, replace
}

label define I_F_CSID_25 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_26
if !_rc{
     tostring I_F_CSID_26, replace
}

label define I_F_CSID_26 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_27
if !_rc{
     tostring I_F_CSID_27, replace
}

label define I_F_CSID_27 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_F_CSID_28
if !_rc{
     tostring I_F_CSID_28, replace
}

label define I_F_CSID_28 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_G1
if !_rc{
     tostring I_G1, replace
}

label define I_G1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G1_2
if !_rc{
     tostring I_G1_2, replace
}

label define I_G1_2 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G1_3
if !_rc{
     tostring I_G1_3, replace
}

label define I_G1_3 .a"." 0 "Not helpful" 1 "A little helpful" 2 "Very helpful" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G1_4
if !_rc{
     tostring I_G1_4, replace
}

label define I_G1_4 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G1_5
if !_rc{
     tostring I_G1_5, replace
}

label define I_G1_5 .a"." 0 "Not helpful" 1 "A little helpful" 2 "Very helpful" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_2
if !_rc{
     tostring I_G_HAS_2, replace
}

label define I_G_HAS_2 .a"." 1 "Rapid onset of organic features over 1-3 days" 2 "Rapid onset of more than 3 days but less than 3 weeks" 3 "Gradual onset over a longer period of time" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_1
if !_rc{
     tostring I_G_HAS_3_1, replace
}

label define I_G_HAS_3_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_11
if !_rc{
     tostring I_G_HAS_3_11, replace
}

label define I_G_HAS_3_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_13
if !_rc{
     tostring I_G_HAS_3_13, replace
}

label define I_G_HAS_3_13 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_14
if !_rc{
     tostring I_G_HAS_3_14, replace
}

label define I_G_HAS_3_14 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_16
if !_rc{
     tostring I_G_HAS_3_16, replace
}

label define I_G_HAS_3_16 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_3_22
if !_rc{
     tostring I_G_HAS_3_22, replace
}

label define I_G_HAS_3_22 .a"." 1 "In general, described as deterioration" 2 "In general, described as improvement" 3 "Described as no changes, or few changes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_4
if !_rc{
     tostring I_G_HAS_4, replace
}

label define I_G_HAS_4 .a"." 0 "Does not vary" 1 "Fluctuating pattern with several days or weeks of improvement" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_5_1
if !_rc{
     tostring I_G_HAS_5_1, replace
}

label define I_G_HAS_5_1 .a"." 0 "Did not become normal" 1 "Condition described as return to normal or near normal" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_6
if !_rc{
     tostring I_G_HAS_6, replace
}

label define I_G_HAS_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_7_1
if !_rc{
     tostring I_G_HAS_7_1, replace
}

label define I_G_HAS_7_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_10
if !_rc{
     tostring I_G_HAS_10, replace
}

label define I_G_HAS_10 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_11
if !_rc{
     tostring I_G_HAS_11, replace
}

label define I_G_HAS_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_12
if !_rc{
     tostring I_G_HAS_12, replace
}

label define I_G_HAS_12 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_13
if !_rc{
     tostring I_G_HAS_13, replace
}

label define I_G_HAS_13 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_14_1
if !_rc{
     tostring I_G_HAS_14_1, replace
}

label define I_G_HAS_14_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_15
if !_rc{
     tostring I_G_HAS_15, replace
}

label define I_G_HAS_15 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_17
if !_rc{
     tostring I_G_HAS_17, replace
}

label define I_G_HAS_17 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_18
if !_rc{
     tostring I_G_HAS_18, replace
}

label define I_G_HAS_18 .a"." 0 "Only happened recently" 1 "One of the first things" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_47
if !_rc{
     tostring I_G_HAS_47, replace
}

label define I_G_HAS_47 .a"." 0 "No" 1 "Yes, probably" 2 "Yes, definitely" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_48
if !_rc{
     tostring I_G_HAS_48, replace
}

label define I_G_HAS_48 .a"." 0 "No" 1 "Yes, probably" 2 "Yes, definitelye" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_49
if !_rc{
     tostring I_G_HAS_49, replace
}

label define I_G_HAS_49 .a"." 0 "No" 1 "Yes, from a few minutes to an hour" 2 "Yes, more than an hour" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_50
if !_rc{
     tostring I_G_HAS_50, replace
}

label define I_G_HAS_50 .a"." 0 "No	such changes" 1 "Serious condition affecting the head and causing permanent changes to personality/intellect" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_G_HAS_52
if !_rc{
     tostring I_G_HAS_52, replace
}

label define I_G_HAS_52 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable I_H_NPI_1
if !_rc{
     tostring I_H_NPI_1, replace
}

label define I_H_NPI_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know"



capture confirm numeric variable I_H_NPI_1_1
if !_rc{
     tostring I_H_NPI_1_1, replace
}

label define I_H_NPI_1_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_1_2
if !_rc{
     tostring I_H_NPI_1_2, replace
}

label define I_H_NPI_1_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (a lot of discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_2
if !_rc{
     tostring I_H_NPI_2, replace
}

label define I_H_NPI_2 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_2_1
if !_rc{
     tostring I_H_NPI_2_1, replace
}

label define I_H_NPI_2_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_2_2
if !_rc{
     tostring I_H_NPI_2_2, replace
}

label define I_H_NPI_2_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_3
if !_rc{
     tostring I_H_NPI_3, replace
}

label define I_H_NPI_3 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_3_1
if !_rc{
     tostring I_H_NPI_3_1, replace
}

label define I_H_NPI_3_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_3_2
if !_rc{
     tostring I_H_NPI_3_2, replace
}

label define I_H_NPI_3_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_4
if !_rc{
     tostring I_H_NPI_4, replace
}

label define I_H_NPI_4 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_4_1
if !_rc{
     tostring I_H_NPI_4_1, replace
}

label define I_H_NPI_4_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_4_2
if !_rc{
     tostring I_H_NPI_4_2, replace
}

label define I_H_NPI_4_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_5
if !_rc{
     tostring I_H_NPI_5, replace
}

label define I_H_NPI_5 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_5_1
if !_rc{
     tostring I_H_NPI_5_1, replace
}

label define I_H_NPI_5_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_5_2
if !_rc{
     tostring I_H_NPI_5_2, replace
}

label define I_H_NPI_5_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_6
if !_rc{
     tostring I_H_NPI_6, replace
}

label define I_H_NPI_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_6_1
if !_rc{
     tostring I_H_NPI_6_1, replace
}

label define I_H_NPI_6_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_6_2
if !_rc{
     tostring I_H_NPI_6_2, replace
}

label define I_H_NPI_6_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_7
if !_rc{
     tostring I_H_NPI_7, replace
}

label define I_H_NPI_7 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_7_1
if !_rc{
     tostring I_H_NPI_7_1, replace
}

label define I_H_NPI_7_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_7_2
if !_rc{
     tostring I_H_NPI_7_2, replace
}

label define I_H_NPI_7_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_8
if !_rc{
     tostring I_H_NPI_8, replace
}

label define I_H_NPI_8 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_8_1
if !_rc{
     tostring I_H_NPI_8_1, replace
}

label define I_H_NPI_8_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_8_2
if !_rc{
     tostring I_H_NPI_8_2, replace
}

label define I_H_NPI_8_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_9
if !_rc{
     tostring I_H_NPI_9, replace
}

label define I_H_NPI_9 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_9_1
if !_rc{
     tostring I_H_NPI_9_1, replace
}

label define I_H_NPI_9_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_9_2
if !_rc{
     tostring I_H_NPI_9_2, replace
}

label define I_H_NPI_9_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_10
if !_rc{
     tostring I_H_NPI_10, replace
}

label define I_H_NPI_10 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_10_1
if !_rc{
     tostring I_H_NPI_10_1, replace
}

label define I_H_NPI_10_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_10_2
if !_rc{
     tostring I_H_NPI_10_2, replace
}

label define I_H_NPI_10_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_11
if !_rc{
     tostring I_H_NPI_11, replace
}

label define I_H_NPI_11 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_11_1
if !_rc{
     tostring I_H_NPI_11_1, replace
}

label define I_H_NPI_11_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_11_2
if !_rc{
     tostring I_H_NPI_11_2, replace
}

label define I_H_NPI_11_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_H_NPI_12
if !_rc{
     tostring I_H_NPI_12, replace
}

label define I_H_NPI_12 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_H_NPI_12_1
if !_rc{
     tostring I_H_NPI_12_1, replace
}

label define I_H_NPI_12_1 .a"." 1 "Slight (noticeable, but not significant changes)" 2 "Moderate (significant, but not dramatic changes)" 3 "Severe (very marked and prominent, dramatic change)" 



capture confirm numeric variable I_H_NPI_12_2
if !_rc{
     tostring I_H_NPI_12_2, replace
}

label define I_H_NPI_12_2 .a"." 0 "Does not cause any discomfort" 1 "Minimal (slight discomfort, not a problem to handle)" 2 "Mild (not much discomfort, easy to handle)" 3 "Moderate (fairly uncomfortable, not always easy to handle)" 4 "Severe (much discomfort, difficult to handle)" 5 "Extreme or very severe (extreme discomfort, unable to handle)" 



capture confirm numeric variable I_J1
if !_rc{
     tostring I_J1, replace
}

label define I_J1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_J2
if !_rc{
     tostring I_J2, replace
}

label define I_J2 .a"." 1 "Less than five years ago" 2 "Between 5 and 10 years ago" 3 "10 years ago or more" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_J3
if !_rc{
     tostring I_J3, replace
}

label define I_J3 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable I_K_ACT_1
if !_rc{
     tostring I_K_ACT_1, replace
}

label define I_K_ACT_1 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_2
if !_rc{
     tostring I_K_ACT_2, replace
}

label define I_K_ACT_2 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_5
if !_rc{
     tostring I_K_ACT_5, replace
}

label define I_K_ACT_5 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_7
if !_rc{
     tostring I_K_ACT_7, replace
}

label define I_K_ACT_7 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_8
if !_rc{
     tostring I_K_ACT_8, replace
}

label define I_K_ACT_8 .a"." 1 "Zero" 2 "Half hour" 3 "One" 4 "Two to three" 5 "Four to six" 6 "Seven or more" 7 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_10
if !_rc{
     tostring I_K_ACT_10, replace
}

label define I_K_ACT_10 .a"." 1 "Yes" 2 "No" 6 "xxx doesn’t usually cook" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_13
if !_rc{
     tostring I_K_ACT_13, replace
}

label define I_K_ACT_13 .a"." 1 "Yes" 2 "No" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_14
if !_rc{
     tostring I_K_ACT_14, replace
}

label define I_K_ACT_14 .a"." 1 "Yes" 2 "No" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_15
if !_rc{
     tostring I_K_ACT_15, replace
}

label define I_K_ACT_15 .a"." 1 "Daily" 2 "Several times per week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_16
if !_rc{
     tostring I_K_ACT_16, replace
}

label define I_K_ACT_16 .a"." 1 "Daily" 2 "Several times a week" 3 "Once a week" 4 "Once a month" 5 "Rarely" 6 "Never" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_K_ACT_17
if !_rc{
     tostring I_K_ACT_17, replace
}

label define I_K_ACT_17 .a"." 1 "Alone" 2 "Accompanied" 9 "Does not know"8 "Does not respond"



capture confirm numeric variable I_LHAS_54
if !_rc{
     tostring I_LHAS_54, replace
}

label define I_LHAS_54 .a"." 0 "Reasonable" 1 "Some doubts" 2 "Moderate doubts" 3 "Serious doubts" 4 "Worthless" 



label define I_B7 .a "." 0 "None" 1 "1 to 5" 2 "6 to 8" 3 "9 to 12" 4 "More than 12" 8 "Does not respond" 9 "Does not know"



label define I_B7_ .a "." 0 "None" 1 "1 to 5" 2 "6 to 8" 3 "9 to 12" 4 "More than 12" 8 "Does not respond" 9 "Does not know"

label values i_b7 I_B7_


label define I_C7_1 .a "." 1 "1 - profesional ejecutivo" 2 "2 - oficinista" 3 "3 - vendedor, minorista" 4 "4 - agricultor independiente" 5 "5 - trabajador agricola" 6 "6 - trabajador domestico" 7 "7 - otros servicios" 8 "8 - trabajador especializado" 9 "9 - trabajador no especializado" 10 "10 - trabajos informales" 13 "13- otros" 88 "88 - no responde" 99 "99 - no sabe"


label define I_C7_1_ .a "." 1 "Professional, executive" 2 "Clerk" 3 "Seller, retailer" 4 "Independent farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled worker" 9 "Unskilled worker" 10 "Informal jobs" 13 "Others" 88 "Does not respond" 99 "Does not know"

label values i_c7_1 I_C7_1_



label define I_C8A .a "." 1 "1 - todo el tiempo enfocado exclusivamente en su (xxx)" 2 "2 - la mayor parte del tiempo enfocado en su (xxx)" 3 "3 - mitad y mitad" 4 "4 - la mayor parte del tiempo haciendo otras tareas u ocio" 8 "8 - no responde" 9 "9 - no sabe"


label define I_C8A_ .a "." 1 "All the time focused exclusively on their (xxx)" 2 "Most of the time focused on their (xxx)" 3 "Half and Half" 4 "Most of the time doing other tasks or leisure" 8 "Does not respond" 9 "Does not know"

label values i_c8a I_C8A_


*convert missing comment legal and text values to string

capture confirm numeric variable i_particid2
if !_rc{
     tostring i_particid2, replace
}

capture confirm numeric variable i_deviceid1
if !_rc{
     tostring i_deviceid1, replace
}

capture confirm numeric variable i_deviceid2
if !_rc{
     tostring i_deviceid2, replace
}

capture confirm numeric variable i_deviceid2
if !_rc{
     tostring i_deviceid2, replace
}

*reorder

*order pid globalrecordid pid2 i_interid i_clustid i_houseid i_particid i_country i_houseid2 i_conglid2 i_particid2 i_deviceid1 i_a2 i_a3 i_a4 i_b1 i_b3 i_b4 i_b5 i_b7 i_c1 i_c2 i_c3 i_c4 i_c5 i_c6 i_c7 i_c7_1 i_c8 i_c8a i_c9 i_c10 i_c11 i_c12 i_c23 i_c24 i_c25 i_c26 i_c26a i_c27 i_c27a i_d2 i_d3 i_d5 i_d6 i_d9 i_d10 i_d11 i_d12 i_d17 i_d19 i_d20 i_d21 i_e1 i_e2 i_e3 i_e4 i_e5 i_e6 i_e7 i_e8 i_e9 i_e10 i_e11 i_e12 i_e13 i_e14 i_e15 i_e16 i_f_csid_1 i_f_csid_2 i_f_csid_3 i_f_csid_4 i_f_csid_5 i_f_bse_3 i_f_bse_7 i_f_csid_6 i_f_csid_7 score1 i_f_csid_8 i_f_csid_9 i_f_csid_10 i_f_csid_11 i_f_csid_12 i_f_csid_13 i_f_csid_14 i_f_csid_15 i_f_csid_16 i_f_csid_17 i_f_csid_17a i_f_csid_18 score2 i_f_csid_19 i_f_csid_20 i_f_csid_21 i_f_csid_22_1 i_f_csid_22_2 i_f_csid_23_1 i_f_csid_23_2 i_f_csid_24_1 i_f_csid_24_2 i_f_csid_25 score3 i_f_csid_26 i_f_csid_27 score4 totalscore i_f_csid_28 i_g0 i_g1 i_g1_1 i_g1_2 i_g1_3 i_g1_4 i_g1_5 i_g_has_2 i_g_has_3_1 i_g_has_3_11 i_g_has_3_13 i_g_has_3_14 i_g_has_3_16 i_g_has_3_22 i_g_has_4 i_g_has_5_1 i_g_has_6 i_g_has_7_1 i_g_has_10 i_g_has_11 i_g_has_12 i_g_has_13 i_g_has_14_1 i_g_has_15 i_g_has_17 i_g_has_18 i_g_has_47 i_g_has_48 i_g_has_49 i_g_has_50 i_g_has_52 i_h_npi_1 i_h_npi_1_1 i_h_npi_1_2 i_h_npi_2 i_h_npi_2_1 i_h_npi_2_2 i_h_npi_3 i_h_npi_3_1 i_h_npi_3_2 i_h_npi_4 i_h_npi_4_1 i_h_npi_4_2 i_h_npi_5 i_h_npi_5_1 i_h_npi_5_2 i_h_npi_6 i_h_npi_6_1 i_h_npi_6_2 i_h_npi_7 i_h_npi_7_1 i_h_npi_7_2 i_h_npi_8 i_h_npi_8_1 i_h_npi_8_2 i_h_npi_9 i_h_npi_9_1 i_h_npi_9_2 i_h_npi_10 i_h_npi_10_1 i_h_npi_10_2 i_h_npi_11 i_h_npi_11_1 i_h_npi_11_2 i_h_npi_12 i_h_npi_12_1 i_h_npi_12_2 i_j1 i_j2 i_j3 i_k_act_1 i_k_act_2 i_k_act_5 i_k_act_7 i_k_act_8 i_k_act_10 i_k_act_13 i_k_act_14 i_k_act_15 i_k_act_16 i_k_act_17 i_lhas_54 i_deviceid2 i_deviceid2

sort i_clustid i_houseid

*variable labels

label variable i_interid "Interviewer #:"

label variable i_clustid "Cluster #:"

label variable i_houseid "House #:"

label variable i_particid "Participant #:"

label variable i_country "Country"

label variable i_houseid2 "House #:"

label variable i_conglid2 "Cluster #:"

label variable i_particid2 "Participant #:"

label variable i_deviceid1 "Device ID:"

label variable i_a2 "A2. To the question 'What are the names of the two most important streets near your house?' xxx answered _________ [read the answer that you wrote down in the cognitive]. Is this correct?"

label variable i_a3 "A3. To the question 'Where is the nearest store, shop or grocery store?' xxx answered _________ [read the answer that you wrote down in the cognitive]. Is this correct?"

label variable i_a4 "A4. To the question 'What is your address?' xxx answered _________ [read the answer that you wrote down in the cognitive]. Is this correct?"

label variable i_b1 "B1. Are you"

label variable i_b3 "B3. How old are you?"

label variable i_b4 "B4. What is your gender?"

label variable i_b5 "B5. What relationship do you have with (xxx)?"

label variable i_b7 "B7. How many years of education have you completed?"

label variable i_c1 "C1. The older adult"

label variable i_c2 "C2. Can the older adult be alone for an hour or more (during the day)?"

label variable i_c3 "C3. Direct care is provided primarily by:"

label variable i_c4 "C4. You are:(code the value below that best applies)"

label variable i_c5 "C5. Have you stopped working or reduced your work hours to take care of your (xxx)"

label variable i_c6 "C6. How long ago did you stop working? Code the answer in months DID NOT RESPOND.......................................... 888 DOES NOT KNOW...................................................... 999"

label variable i_c7 "C7. ¿How many hours per week has your work decreased? DID NOT RESPOND........................................... 888 NO SABE....................................................... 999"

label variable i_c7_1 "C7.1. What is/was your job?"

label variable i_c8 "C8. In a typical week, how many hours do you spend caring for your (xxx)? DID NOT RESPOND........................................... 888 NO SABE....................................................... 999"

label variable i_c8a "C8A. In these hours that you are taking care of your (xxx), what proportion of the time are you focused exclusively on your (xxx) and what proportion are you doing other tasks or leisure at the same time?"

label variable i_c9 "C9. In a typical week, do you receive any payment to care for your (xxx)?"

label variable i_c10 "C10. In a typical week, how much pay do you receive to care for your (xxx)? DID NOT RESPOND............................................ 888 NO SABE........................................................ 999"

label variable i_c11 "C11. Do any other people regularly take care of your (xxx)?"

label variable i_c12 "C12. In total in a typical week, how many hours per week do these other people care for your (xxx)? DID NOT RESPOND........................................... 888 NO SABE....................................................... 999"

label variable i_c23 "C23. In a typical week, do any of them get paid to take care of your (xxx)?"

label variable i_c24 "C24. In total in a typical week, how much do they receive to take care of your (xxx)? DID NOT RESPOND........................................... 888 NO SABE..................................................….. 999"

label variable i_c25 "C25. In addition to receiving care at home, does your (xxx) go to a Day Center for Older Adults on a regular basis?"

label variable i_c26 "C26. How many hours per week do they attend the Day Center for Older Adults? [ ] DID NOT RESPOND............................................ 888 NO SABE..................................................…... 999"

label variable i_c26a "C26.A. C26A. Are these hours already accounted for above?"

label variable i_c27 "C27. How much is paid per week approximately so that your (xxx) can attend the Day Center for Older Adults? [ ] DID NOT RESPOND..........................................888 NO SABE..................................................….999"

label variable i_c27a "C27.A. Are these payments already accounted for above?"

label variable i_d2 "D2. Do you feel that by spending time with your (xxx), you don't have enough time for yourself?"

label variable i_d3 "D3. Do you feel stressed between taking care of your (xxx), and trying to fulfill your family and work responsibilities?"

label variable i_d5 "D5. Do you feel angry (upset) when you are around your (xxx)?"

label variable i_d6 "D6. You feel that your (xxx) currently and negatively affects your relationship with other family members or with your friends?"

label variable i_d9 "D9. Do you feel stressed when you are around your (xxx)?"

label variable i_d10 "D10. Do you feel your health has suffered due to your involvement with your (xxx)’s care?"

label variable i_d11 "D11. Do you feel you don’t have enough privacy because of your (xxx)?"

label variable i_d12 "D12. Do you feel that your social life has suffered because of your (xxx)?"

label variable i_d17 "D17. Do you feel that you have lost control of your life since your (xxx) became ill"

label variable i_d19 "D19. Do you feel uncertain about what to do with your (xxx)?"

label variable i_d20 "D20. Do you feel like you could be doing more for your (xxx)?"

label variable i_d21 "D21. Do you feel you could be doing a better job taking care of your (xxx)?"

label variable i_e1 "E1. Remembering things about family and friends (e.g. where they live, how they earn a living, when their birthday is…)"

label variable i_e2 "E2. Remembering things that happened in recent months (news, family events)."

label variable i_e3 "E3. Remembering what was said in conversation a few days before"

label variable i_e4 "E4. Remembering their own address or telephone number"

label variable i_e5 "E5. Remembering the current date (e.g., day and month)"

label variable i_e6 "E6. Knowing the exact location of closets in their house and where things are stored"

label variable i_e7 "E7. Ability to find things placed in unusual places."

label variable i_e8 "E8. Knowing how to use household appliances (telephone, car, washing machine, razor, etc.)"

label variable i_e9 "E9. Learning to use a new appliance (washing machine, radio, hair dryer, etc.)"

label variable i_e10 "E10. Learning new things in general"

label variable i_e11 "E11. Following a story in a book, the newspaper, radio or television"

label variable i_e12 "E12. Making decisions on both everyday matters (what to wear, what food to make) and longer-term matters (where to go on vacation or how to invest money)"

label variable i_e13 "E13. Handling financial matters (collect pension, pay rent or taxes, deal with the bank)"

label variable i_e14 "E14. Managing money for shopping (how much to pay, calculate change)"

label variable i_e15 "E15. Managing other routine arithmetic problems (time between visits from family, how much food to buy and prepare, especially if there are guests)"

label variable i_e16 "E16. Using their intelligence (in general) to understand and make sense of what is happening around them"

label variable i_f_csid_1 "F.CSID.1 Have you seen any changes in their daily activities? Please describe"

label variable i_f_csid_2 "F.CSID.2 Has there been a general decline in their mental functioning? Please describe."

label variable i_f_csid_3 "F.CSID.3 We all have some difficulty remembering things as we age, but has this been a particularly big problem for your (relative)?"

label variable i_f_csid_4 "F.CSID.4 Do they forget where they put things? If yes, how often?"

label variable i_f_csid_5 "F.CSID.5 Do they forget where things are normally kept? If yes, how often?"

label variable i_f_bse_3 "F.BSE.3 Do they have difficulty remembering short lists of items (e.g. groceries list)? If yes, how often?"

label variable i_f_bse_7 "F.BSE.7 Do they have difficulty remembering recent events (e.g. recent outings/events, visits from family or friends)? If yes, how often?"

label variable i_f_csid_6 "F.CSID.6 Do they forget the name of friends?  If yes, how often?"

label variable i_f_csid_7 "F.CSID.7 Do they forget the name of family members?  If yes, how often?"

label variable score1 "Score1"

label variable i_f_csid_8 "F.CSID.8 Do they forget what they wanted to say in the middle of a conversation? If yes, how often?"

label variable i_f_csid_9 "F.CSID.9 When they speak, do they have difficulty saying the right words? If yes, how often?"

label variable i_f_csid_10 "F.CSID.10 Do they use incorrect words? If yes, how often?"

label variable i_f_csid_11 "F.CSID.11 Do they tend to talk about things that happened a long time ago instead of current things? If yes, how often?"

label variable i_f_csid_12 "F.CSID.12 Do they forget the last time you saw them? If yes, how often?"

label variable i_f_csid_13 "F.CSID.13 Do they forget what happened yesterday?  If yes, how often?"

label variable i_f_csid_14 "F.CSID.14 Do they forget where they are? If yes, how often?"

label variable i_f_csid_15 "F.CSID.15 Do they get lost in the community? If yes, how often?"

label variable i_f_csid_16 "F.CSID.16 Do they get lost in their own home, e.g. looking for the bathroom? If yes, how often?"

label variable i_f_csid_17 "F.CSID.17 Do they have difficulties doing chores around the house they used to do? Like preparing food or boiling tea?"

label variable i_f_csid_17a "F.CSID.17a  Does the interviewer think the problem is primarily due to physical impairments?"

label variable i_f_csid_18 "F.CSID.18 Has there been a loss of any special skill from a hobby they could do before?"

label variable score2 "SCore2"

label variable i_f_csid_19 "F.CSID.19 Has there been a change in their ability to handle money?"

label variable i_f_csid_20 "F.CSID.20 Do they have difficulty adjusting to changes in their daily routine? If yes, how often?"

label variable i_f_csid_21 "F.CSID.21 Have you noticed changes in their ability to think and reason?"

label variable i_f_csid_22_1 "F.CSID.22.1 Do they have difficulty feeding themelves?"

label variable i_f_csid_22_2 "F.CSID.22.2 Does the interviewer think the problem is primarily due to physical impairments?"

label variable i_f_csid_23_1 "F.CSID.23.1 Do they have difficulty getting dressed?"

label variable i_f_csid_23_2 "F.CSID.23.2 Does the interviewer think the problem is primarily due to physical impairments?"

label variable i_f_csid_24_1 "F.CSID.24.1 Do they have difficulty using the toilet? Do they urinate or defecate on themselves?"

label variable i_f_csid_24_2 "F.CSID.24.2 Does the interviewer think the problem is primarily due to physical impairments?"

label variable i_f_csid_25 "F.CSID.25 Do they confuse you (or other family member) with someone else?"

label variable score3 "SCore3"

label variable i_f_csid_26 "F.CSID.26 Recently, have they had difficulty in making decisions about everyday things?"

label variable i_f_csid_27 "F.CSID.27 Does their thinking seem confused at times?"

label variable score4 "SCore4"

label variable totalscore "Total Score:"

label variable i_f_csid_28 "F.CSID.28 INTERVIEWER CODE – IS THE TOTAL CSID SCORE 2.5 OR LESS?"

label variable i_g0 "G.0. Looking back, can you give an approximate date for when you or another person first noticed that your (xx) had difficulties with memory, thinking, concentration, daily activities or self-care? Code time since start in months Did not respond.......................8 Does not know.................................9"

label variable i_g1 "G.1 Did you and/or the participant (the older person) seek help from a doctor or other health professional for some of these problems?"

label variable i_g1_1 "G.1.1. When? (Time in months since query) Did not respond......................8 Does not know................................9"

label variable i_g1_2 "G.1.2. Did the doctor/health professional give any advice?"

label variable i_g1_3 "G.1.3. Was it helpful?"

label variable i_g1_4 "G.1.4. Did the doctor/health professional prescribe any medicine?"

label variable i_g1_5 "G.1.5. Was it helpful?"

label variable i_g_has_2 "G.HAS2 Did these problems start rapidly or gradually? (If the start was rapid) – when was this?"

label variable i_g_has_3_1 "G.HAS3.1 Did they have difficulty remembering things?"

label variable i_g_has_3_11 "G.HAS.3.11 Did they see things that other people did not see?"

label variable i_g_has_3_13 "G.HAS.3.13 Could it have started with some type of stroke? A stroke is s paralysis (weakness) of the face or limbs on one side of the body that lasts at least 24 hours. (IF YES, ASK: 'Please, describe.') (NB – MUST BE A CLEAR STROKE HISTORY)"

label variable i_g_has_3_14 "G.HAS.3.14 Did they have problems finding the right word?  (IF YES, ASK: 'Please, describe.') NB - ONLY MAJOR AND PERSISTENT DIFFICULTY IN WORD SEARCH, AND EXCLUDE DELIRIUM (Confusional Syndrome)"

label variable i_g_has_3_16 "G.HAS.3.16 Could it have started with a type of seizure? (IF YES, ASK: 'Please, describe.') NB - ONLY EPILEPTIC SEIZURES DIAGNOSED BY A DOCTOR"

label variable i_g_has_3_22 "G.HAS.3.22 How are things now compared to when the illness started? Have they worsened? Improved? Or more or less the same?"

label variable i_g_has_4 "G.HAS.4 Has the current illness tended to vary a lot, from day to day, week to week, getting worse and maybe better for a while - with ups and downs? (IF YES, ASK 'How much does it vary?' 'How long are these periods?')"

label variable i_g_has_5_1 "G.HAS.5.1 During periods of improvement, did thinking, memory, and concentration become normal or almost normal?"

label variable i_g_has_6 "G.HAS.6 Would you say there has been a gradual deterioration of memory or (list current cognitive impairments) over a period of more than 2 years?"

label variable i_g_has_7_1 "G.HAS.7.1 Has the current illness suddenly gotten worse at any time, within a 3-day period and then stayed that way?"

label variable i_g_has_10 "G.HAS.10 Are there periods of 24 hours when they seem very inconstant: alert one moment, numb and confused the next?"

label variable i_g_has_11 "G.HAS.11 Do they get confused at night, wander, talk nonsense?"

label variable i_g_has_12 "G.HAS.12 And during the day?"

label variable i_g_has_13 "G.HAS.13 Is the confusion worse in the evening or at nighttime?"

label variable i_g_has_14_1 "G. HAS.14.1 How do they treat you (relatives, friends) now compared to the period before the onset of the disease? For example: Do they show a lack of interest, concern or affection now compared to before?"

label variable i_g_has_15 "G.HAS.15 Have they been more irritable lately?"

label variable i_g_has_17 "G.HAS.17 Has there been a change in behavior, perhaps doing embarrassing things or things that could bother other people?"

label variable i_g_has_18 "G.HAS.18 Were these among the first changes you noticed or have they only happened recently?"

label variable i_g_has_47 "G.HAS.47 Has your family member ever had an accident that caused head or brain damage?"

label variable i_g_has_48 "G.HAS.48 Has your (xxx) ever had an illness or infection that caused serious head or brain damage?"

label variable i_g_has_49 "G.HAS.49 Was there a period of unconsciousness after the illness or accident? (IF YES, ASK 'How long was this period?')"

label variable i_g_has_50 "G.HAS.50 Has their behavior changed in any way? (IF YES, ask how it changed, what was permanent)"

label variable i_g_has_52 "G.HAS.52 INTERVIEWER OBSERVATION Is the current intellectual status of the participant present from time of birth (or due to a pathological cause from childhood)? ('No' is due to a mental illness that happened in the last few years.)"

label variable i_h_npi_1 "H.NPI.1 Does (xxx) believe that other people steal things from her/him, or that others plan to harm her/him in some way?"

label variable i_h_npi_1_1 "H.NPI.1.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_1_2 "H.NPI.1.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_2 "H.NPI.2 Does your (xxx) act like they hear voices? Do they talk to people who are not present?"

label variable i_h_npi_2_1 "H.NPI.2.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_2_2 "H.NPI.2.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_3 "H.NPI.3 Is your (xxx) stubborn, or resistant to others helping them?"

label variable i_h_npi_3_1 "H.NPI.3.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_3_2 "H.NPI.3.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_4 "H.NPI.4 Does your (xxx) act as if they were sad, discouraged or in low spirits? Do they cry?"

label variable i_h_npi_4_1 "H.NPI.4.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_4_2 "H.NPI.4.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_5 "H.NPI.5 Does your xxx get uncomfortable when they are apart from you? Do they show any signs of nervousness, such as shortness of breath, sighing, inability to relax, or do they feel excessively tense?"

label variable i_h_npi_5_1 "H.NPI.5.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_5_2 "H.NPI.5.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_6 "H.NPI.6 Does your (xxx) seem to be feeling too good, or act as if they were excessively happy?"

label variable i_h_npi_6_1 "H.NPI.6.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_6_2 "H.NPI.6.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_7 "H.NPI.7 Does your (xxx) seem less interested in their usual activities or in other people’s plans?"

label variable i_h_npi_7_1 "H.NPI.7.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_7_2 "H.NPI.7.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_8 "H.NPI.8 Does your (xxx) seem to act impulsively? For example, do they speak to strangers as if they were familiar people? Or say things that may hurt the feelings of others?"

label variable i_h_npi_8_1 "H.NPI.8.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_8_2 "H.NPI.8.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_9 "H.NPI.9 Do you notice your (xxx) acting impatient and moody? Do they have difficulty waiting for something or waiting for planned activities?"

label variable i_h_npi_9_1 "H.NPI.9.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_9_2 "H.NPI.9.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_10 "H.NPI.10 Do you notice that your xxx performs repetitive activities such as pacing around the house, touching buttons, tying up ropes or doing other things repetitively?"

label variable i_h_npi_10_1 "H.NPI.10.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_10_2 "H.NPI.10.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_11 "H.NPI.11 Does your (xxx) wake up during the night? Do they get up very early in the morning or take many naps during the day?"

label variable i_h_npi_11_1 "H.NPI.11.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_11_2 "H.NPI.11.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_h_npi_12 "H.NPI.12 Has your (xxx) lost or gained weight? Or has their taste changed for food that they liked before?"

label variable i_h_npi_12_1 "H.NPI.12.1 Rate the severity of the symptom (how it affects your xxx)."

label variable i_h_npi_12_2 "H.NPI.12.2 Rate the discomfort you experience from that symptom (how it affects you)."

label variable i_j1 "J1 Has your xxx ever been told by a doctor that they have dementia or Alzheimer's?"

label variable i_j2 "J2 When was (xxx) first told?"

label variable i_j3 "J3 Did they doctor prescribe any medicine to (xxx)?"

label variable i_k_act_1 "K.ACT.1 Thinking first about activities at home: On a typical day, how many hours a day do they watch television?"

label variable i_k_act_2 "K.ACT.2 On a typical day, how many hours do they read?"

label variable i_k_act_5 "K.ACT.5 On a typical day, how many hours do they spend on household chores, maintenance and yard?"

label variable i_k_act_7 "K.ACT.7 On a typical day, how many hours do they use the computer or internet (including smartphones for internet or like the computer)?"

label variable i_k_act_8 "K.ACT.8 On a typical day, how many hours do they nap?"

label variable i_k_act_10 "K.ACT.10 Cook food?"

label variable i_k_act_13 "K.ACT.13 Now we want to know more about activities outside the home. Can they move around on their own?"

label variable i_k_act_14 "K.ACT.14 Can they use public transport on their own?"

label variable i_k_act_15 "K.ACT.15 How often do they go to work or volunteer? Would you say daily, several times a week, once a week, once a month, rarely, or never?"

label variable i_k_act_16 "K.ACT.16 How often do they go to the shop, supermarket for food or for other things? Would you say daily, several times a week, once a week, once a month, rarely or never?"

label variable i_k_act_17 "K.ACT.17 Do they usually go alone or accompanied?"

label variable i_lhas_54 "L.HAS.54 GLOBAL CLASSIFACTION OF THE CLASIFICACIÓN GLOBAL OF THE TRUST IN THE DATA"

label variable i_deviceid2 "Device ID:"

save Infor.dta, replace
