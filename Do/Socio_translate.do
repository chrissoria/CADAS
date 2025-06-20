clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

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
    use using "../PR_out/Socio"
}
else if `country' == 1 {
    use using "../DR_out/Socio"
}
else if `country' == 2 {
    use using "../CUBA_out/Socio"
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
    use using "../PR_out/Socio"
}
else if `country' == 1 {
    use using "../DR_out/Socio"
}
else if `country' == 2 {
    use using "../CUBA_out/Socio"
}
}

label drop _all

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values s_country country_label


label define S_2_9a .a"." 0 "0 - Has not completed any education" 1 "1 - Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "2 - Primary" 3 "3 - Intermediate" 4 "4 - Secondary " 5 "5 - Tertiary education (e.g. associate degree or technical degree)" 6 "6 - University education or higher" 8 "8 - Does not respond" 9 "9 - Does not know"

label define S_3_11 .a"." 1 "1 - Professional, executive" 2 "2 - Office worker" 3 "3 - Salesperson, retailer" 4 "4 - Independent Farmer" 5 "5 - Farm worker" 6 "6 - Domestic worker" 7 "7 - Other services" 8 "8 - Skilled Worker" 9 "9 - Unskilled worker" 10 "10 - Informal work" 11 "11 - Other" 12 "12 - Did not work" 13 "13 - Did not have a father or guardian" 88 "88 - Does not respond" 99 "99 - Does not know"

*review this
label define S_6_7 .a"." 1 "01 - you were sick?" 2 "02 - you missed your family?" 3 "03 - it was difficult to stay abroad?" 4 "04 - it was expensive to stay abroad?" 5 "05 - you did not earn enough there?" 6 "06 - you had problems related to migration?" 7 "07 - you had family problems here?" 8 "08 - Other" 88 "88 - Does not respond" 99 "99 - Does not know"

label define S_1_1_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_1_1_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_1_1_C .a"." 1 "BLACK" 3 "WHITE" 6 "MULATO / MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_9 .a"." 1 "Never married" 2 "Married/Consensual Union" 3 "Widowed" 4 "Divorced/Separated" 

label define S_2_11 .a"." 0 "Agnostic/Atheist" 1 "Roman Catholic" 2 "Evangelical / Pentecostal" 3 "Other Christian" 4 "Santeria" 5 "Jewish" 6 "Other" 7 "None" 8 "Does not respond"9 "Does not know"

label define S_2_12 .a"." 0 "Every day" 1 "More than once a week" 2 "Once a week" 3 "Two or three times a month" 4 "Once or more times a year " 5 "Never" 8 "Does not respond"9 "Does not know"

label define S_2_13 .a"." 0 "No" 1 "Yes, regularly" 2 "Yes, occasionally" 8 "Does not respond"9 "Does not know"

label define S_2_14_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_14_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_14_C .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_15_P .a"." 1 "BLACK" 2 "MULATO, MIXED OR TRIGUEÑO (WHITE OR BLACK)" 3 "WHITE" 4 "MESTIZO (INDIAN WITH WHITE)" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_15_D .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "INDIAN" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_2_15_C .a"." 1 "BLACK" 2 "MULATO" 3 "WHITE" 4 "MESTIZO" 5 "OTHER" 8 "Does not respond"9 "Does not know"

label define S_3_1_P .a"." 1 "Puerto Rico" 2 "United States" 4 "Other country" 

label define S_3_1_D .a"." 1 "Dominican Republic" 2 "United States" 3 "Haiti" 4 "Other country" 

label define S_3_1_C .a"." 1 "Cuba" 4 "Other country" 

label define S_3_2 .a"." 0 "City" 1 "Town" 2 "Countryside" 

label define S_3_4 .a"." 0 "City" 1 "Town" 2 "Countryside" 8 "Does not respond" 9 "Does not know"

label define S_3_5 .a"." 0 "City" 1 "Town" 2 "Countryside" 8 "Does not respond" 9 "Does not know"

label define S_3_6 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_7 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_8 .a"." 1 "Much better" 2 "Better" 3 "Average" 4 "Worse" 5 "Much worse" 8 "Does not respond"9 "Does not know" 10 "Did not go to school" 

label define S_3_9 .a"." 1 "Much better" 2 "Better" 3 "Average" 4 "Worse" 5 "Much worse" 8 "Does not respond"9 "Does not know" 10 "Did not go to school" 

label define S_3_12_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_12_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_12_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_12_6 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_12_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_13 .a"." 1 "Better" 2 "More or less the same" 3 "Worse" 8 "Does not respond"9 "Does not know"

label define S_3_17 .a"." 1 "No" 2 "Yes" 8 "Does not respond"9 "Does not know"

label define S_3_19_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year" 

label define S_4_1 .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond"9 "Does not know"

label define S_4_2 .a"." 1 "No" 2 "Yes" 8 "Does not respond"9 "Does not know"

label define S_4_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_4_11 .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond"9 "Does not know"

label define S_4_12 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_4_18 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_4_21 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_4_22 .a"." 0 "Spouse" 1 "Mother" 2 "Father" 3 "Mother-in-law" 4 "Father-in-law" 5 "Daughter" 6 "Son" 7 "Granddaughter" 8 "Grandson" 9 "Friend" 10 "Otra relative" 11 "Otra person" 88 "Does not respond"99 "Does not know"

label define S_4_23_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year" 

label define S_4_26 .a"." 2 "No" 1 "Yes" 3 "I don’t have any" 8 "Does not respond"9 "Does not know"

label define S_4_27_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year" 

label define S_4_27A .a"." 1 "Less than 2 hours per week?" 2 "2 to 4 hours per week?" 3 "more than 4 hours per week?" 8 "Does not respond"9 "Does not know"

label define S_4_28 .a"." 2 "No" 1 "Yes" 3"I don’t have any" 8 "Does not respond"9 "Does not know"

label define S_4_29_2 .a"." 1 "Day" 2 "Week" 3 "Month" 4 "Year" 

label define S_4_29A .a"." 1 "Less than 2 hours per week?" 2 "2 to 4 hours per week?" 3 "more than 4 hours per week?" 8 "Does not respond"9 "Does not know"

label define S_5_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_5_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"

label define S_6_1 .a"." 2 "No" 1 "Yes" 7 "Born in the United States" 8 "Does not respond"9 "Does not know"

label define S_6_3 .a"." 2 "No" 1 "Yes" 7 "Born in another country" 8 "Does not respond"9 "Does not know"

label define S_6_5_P .a"." 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other"

label define S_6_5_D .a"." 1 "Haiti" 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other" 

label define S_6_5_C .a"." 2 "A country in Latin America" 3 "Canada" 4 "Spain" 5 "Another European country" 6 "Other" 

label define S_7_0 .a"." 1 "Very satisfied" 2 "Somewhat satisfied" 3 "Somewhat dissatisfied" 4 "Very dissatisfied" 8 "Does not respond"9 "Does not know"

label define S_7_1 .a"." 1 "No" 0 "Yes" 8 "Does not respond"9 "Does not know"

label define S_7_2A .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"

label define S_7_2B .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_2C
if !_rc{
     tostring S_7_2C, replace
}

label define S_7_2C .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_4A
if !_rc{
     tostring S_7_4A, replace
}

label define S_7_4A .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_4B
if !_rc{
     tostring S_7_4B, replace
}

label define S_7_4B .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_4C
if !_rc{
     tostring S_7_4C, replace
}

label define S_7_4C .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_5A
if !_rc{
     tostring S_7_5A, replace
}

label define S_7_5A .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_5B
if !_rc{
     tostring S_7_5B, replace
}

label define S_7_5B .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_5C
if !_rc{
     tostring S_7_5C, replace
}

label define S_7_5C .a"." 1 "Almost never" 2 "Some-times" 3 "Frequently" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_7_6A
if !_rc{
     tostring S_7_6A, replace
}

label define S_7_6A .a"." 1 "Almost every day" 2 "At least once a week" 3 "Several times a month" 4 "Several times a year" 5 "Less than once a year" 6 "Never" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_7_6B
if !_rc{
     tostring S_7_6B, replace
}

label define S_7_6B .a"." 1 "Always or almost always" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_8_1
if !_rc{
     tostring S_8_1, replace
}

label define S_8_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_3
if !_rc{
     tostring S_8_3, replace
}

label define S_8_3 .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_8_4
if !_rc{
     tostring S_8_4, replace
}

label define S_8_4 .a"." 1 "manager or boss?" 2 "self-employed?" 3 "cooperative worker?" 4 "worker with a fixed wage, salary or daily pay?" 5 "pieceworker, commission worker" 6 "unpaid family worker?" 7 "non-family worker without pay?" 8 "Other" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_8_5A
if !_rc{
     tostring S_8_5A, replace
}

label define S_8_5A .a"." 1 "Work" 2 "Look for work" 3 "Don’t work" 8 "Does not respond"



capture confirm numeric variable S_8_5D
if !_rc{
     tostring S_8_5D, replace
}

label define S_8_5D .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_8_7
if !_rc{
     tostring S_8_7, replace
}

label define S_8_7 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_10
if !_rc{
     tostring S_8_10, replace
}

label define S_8_10 .a"." 1 "Always or almost" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_11
if !_rc{
     tostring S_8_11, replace
}

label define S_8_11 .a"." 1 "Always or almost" 2 "Most of the time" 3 "Some-times" 4 "Almost never" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_12
if !_rc{
     tostring S_8_12, replace
}

label define S_8_12 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_13
if !_rc{
     tostring S_8_13, replace
}

label define S_8_13 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_141
if !_rc{
     tostring S_8_141, replace
}

label define S_8_141 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know"


label var s_8_14 "S_8_14"


capture confirm numeric variable S_8_15
if !_rc{
     tostring S_8_15, replace
}

label define S_8_15 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 5 "Not applicable" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_8_16
if !_rc{
     tostring S_8_16, replace
}

label define S_8_16 .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_9_1
if !_rc{
     tostring S_9_1, replace
}

label define S_9_1 .a"." 1 "Excellent" 2 "Very good" 3 "Good" 4 "Regular" 5 "Poor" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_3
if !_rc{
     tostring S_9_3, replace
}

label define S_9_3 .a"." 0 "Does not have that health problem" 1 "Has that problem, but it does not interfere" 2 "Has that problem, and it interferes a little" 3 "Has that problem, and it interferes a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_4
if !_rc{
     tostring S_9_4, replace
}

label define S_9_4 .a"." 0 "Does not have that health problem" 1 "Has that problem, but it does not interfere" 2 "Has that problem, and it interferes a little" 3 "Has that problem, and it interferes a lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_5
if !_rc{
     tostring S_9_5, replace
}

label define S_9_5 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_7
if !_rc{
     tostring S_9_7, replace
}

label define S_9_7 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_8
if !_rc{
     tostring S_9_8, replace
}

label define S_9_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_11
if !_rc{
     tostring S_9_11, replace
}

label define S_9_11 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_13
if !_rc{
     tostring S_9_13, replace
}

label define S_9_13 .a"." 1 "Less than 6 months" 2 "Between 6 and 11 months" 3 "Between 1 and 2 years" 4 "More than 2 years" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_14
if !_rc{
     tostring S_9_14, replace
}

label define S_9_14 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_15
if !_rc{
     tostring S_9_15, replace
}

label define S_9_15 .a"." 1 "0-5 years ago" 2 "5-10 years ago" 3 "10 or more years ago" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_16
if !_rc{
     tostring S_9_16, replace
}

label define S_9_16 .a"." 1 "Heart attack" 2 "Angina" 3 "Cardiac arrest" 4 "Valve disease" 5 "Other" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_17
if !_rc{
     tostring S_9_17, replace
}

label define S_9_17 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_18
if !_rc{
     tostring S_9_18, replace
}

label define S_9_18 .a"." 0 "Nobody" 1 "General practitioner" 2 "Specialist" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_19
if !_rc{
     tostring S_9_19, replace
}

label define S_9_19 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_20
if !_rc{
     tostring S_9_20, replace
}

label define S_9_20 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_23
if !_rc{
     tostring S_9_23, replace
}

label define S_9_23 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_24
if !_rc{
     tostring S_9_24, replace
}

label define S_9_24 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_26
if !_rc{
     tostring S_9_26, replace
}

label define S_9_26 .a"." 0 "Diet only" 1 "Oral hypoglycemic agents (no insulin)" 2 "Insulin" 3 "No treatment" 88 "Does not respond"99 "Does not know"



capture confirm numeric variable S_9_28
if !_rc{
     tostring S_9_28, replace
}

label define S_9_28 .a"." 0 "Never" 1 "Less than once a month" 2 "Once a month" 3 "Several times a month" 4 "Once per week" 5 "Several times per week" 6 "Every day" 7 "Several times per day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_29
if !_rc{
     tostring S_9_29, replace
}

label define S_9_29 .a"." 1 "Once every three months" 2 "Once every six months" 3 "Once a year" 4 "Less than once a year" 5 "Does not have" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_30
if !_rc{
     tostring S_9_30, replace
}

label define S_9_30 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_32
if !_rc{
     tostring S_9_32, replace
}

label define S_9_32 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_33
if !_rc{
     tostring S_9_33, replace
}

label define S_9_33 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_35
if !_rc{
     tostring S_9_35, replace
}

label define S_9_35 .a"." 1 "Less than 6 months" 2 "Between 6 and 11 months" 3 "Between 1 and 2 years" 4 "More than 2 years" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_37
if !_rc{
     tostring S_9_37, replace
}

label define S_9_37 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_39
if !_rc{
     tostring S_9_39, replace
}

label define S_9_39 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_40
if !_rc{
     tostring S_9_40, replace
}

label define S_9_40 .a"." 1 "Yes, a few (up to 4)" 2 "Yes, quite a lot (more than 4 and less than half)" 3 "Yes, most (half or more)" 4 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_41
if !_rc{
     tostring S_9_41, replace
}

label define S_9_41 .a"." 0 "No" 1 "Yes, rarely" 2 "Yes, frequently" 3 "Yes, very frequently" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_42
if !_rc{
     tostring S_9_42, replace
}

label define S_9_42 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_44
if !_rc{
     tostring S_9_44, replace
}

label define S_9_44 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_46
if !_rc{
     tostring S_9_46, replace
}

label define S_9_46 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_47
if !_rc{
     tostring S_9_47, replace
}

label define S_9_47 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_49
if !_rc{
     tostring S_9_49, replace
}

label define S_9_49 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_50
if !_rc{
     tostring S_9_50, replace
}

label define S_9_50 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_51
if !_rc{
     tostring S_9_51, replace
}

label define S_9_51 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_52
if !_rc{
     tostring S_9_52, replace
}

label define S_9_52 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_53
if !_rc{
     tostring S_9_53, replace
}

label define S_9_53 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_54
if !_rc{
     tostring S_9_54, replace
}

label define S_9_54 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_55
if !_rc{
     tostring S_9_55, replace
}

label define S_9_55 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_56
if !_rc{
     tostring S_9_56, replace
}

label define S_9_56 .a"." 1 "< 1 year" 2 "1 year to less than" 3 "3 to less than 5 years" 4 "5 years or more" 5 "Never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_58
if !_rc{
     tostring S_9_58, replace
}

label define S_9_58 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_61A
if !_rc{
     tostring S_9_61A, replace
}

label define S_9_61A .a"." 1 "Less than 45 years old?" 2 "More or less 50 years old?" 3 "Over 55 years old?" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_62
if !_rc{
     tostring S_9_62, replace
}

label define S_9_62 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_63
if !_rc{
     tostring S_9_63, replace
}

label define S_9_63 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_64_1
if !_rc{
     tostring S_9_64_1, replace
}

label define S_9_64_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_64_2
if !_rc{
     tostring S_9_64_2, replace
}

label define S_9_64_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_64_3
if !_rc{
     tostring S_9_64_3, replace
}

label define S_9_64_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_64_4
if !_rc{
     tostring S_9_64_4, replace
}

label define S_9_64_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_9_66
if !_rc{
     tostring S_9_66, replace
}

label define S_9_66 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1A
if !_rc{
     tostring S_10_1A, replace
}

label define S_10_1A .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1B
if !_rc{
     tostring S_10_1B, replace
}

label define S_10_1B .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1C
if !_rc{
     tostring S_10_1C, replace
}

label define S_10_1C .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1D
if !_rc{
     tostring S_10_1D, replace
}

label define S_10_1D .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1E
if !_rc{
     tostring S_10_1E, replace
}

label define S_10_1E .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1F
if !_rc{
     tostring S_10_1F, replace
}

label define S_10_1F .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1G
if !_rc{
     tostring S_10_1G, replace
}

label define S_10_1G .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_1H
if !_rc{
     tostring S_10_1H, replace
}

label define S_10_1H .a"." 5 "No, not true" 1 "Yes, true" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_2
if !_rc{
     tostring S_10_2, replace
}

label define S_10_2 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_3
if !_rc{
     tostring S_10_3, replace
}

label define S_10_3 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_4
if !_rc{
     tostring S_10_4, replace
}

label define S_10_4 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_5
if !_rc{
     tostring S_10_5, replace
}

label define S_10_5 .a"." 1 "Most nights" 2 "Some nights" 3 "Almost never or never" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_1
if !_rc{
     tostring S_10_6_1, replace
}

label define S_10_6_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_1A
if !_rc{
     tostring S_10_6_1A, replace
}

label define S_10_6_1A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_2
if !_rc{
     tostring S_10_6_2, replace
}

label define S_10_6_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_2A
if !_rc{
     tostring S_10_6_2A, replace
}

label define S_10_6_2A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_3
if !_rc{
     tostring S_10_6_3, replace
}

label define S_10_6_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"7 "Not applicable (does not work)" 



capture confirm numeric variable S_10_6_3A
if !_rc{
     tostring S_10_6_3A, replace
}

label define S_10_6_3A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_4
if !_rc{
     tostring S_10_6_4, replace
}

label define S_10_6_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_6_4A
if !_rc{
     tostring S_10_6_4A, replace
}

label define S_10_6_4A .a"." 1 "More than a year" 2 "Less than a year" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_7_1
if !_rc{
     tostring S_10_7_1, replace
}

label define S_10_7_1 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 7 "Not applicable" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_10_7_2
if !_rc{
     tostring S_10_7_2, replace
}

label define S_10_7_2 .a"." 1 "Strongly disagree" 2 "Disagree" 3 "Agree" 4 "Strongly agree" 7 "Not applicable" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_11_1
if !_rc{
     tostring S_11_1, replace
}

label define S_11_1 .a"." 1 "Never" 2 "2-3 times in the last month" 3 "About once a week" 4 "2-3 days per week" 5 "Every day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_11_2
if !_rc{
     tostring S_11_2, replace
}

label define S_11_2 .a"." 1 "Mild pain" 2 "Moderate pain" 3 "Severe pain" 4 "Very severe pain" 5 "Excruciating pain" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_11_3
if !_rc{
     tostring S_11_3, replace
}

label define S_11_3 .a"." 1 "Not at all" 2 "Not much" 3 "Moderately" 4 "A lot" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_1A
if !_rc{
     tostring S_12_1A, replace
}

label define S_12_1A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_1B
if !_rc{
     tostring S_12_1B, replace
}

label define S_12_1B .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_1C
if !_rc{
     tostring S_12_1C, replace
}

label define S_12_1C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_2A
if !_rc{
     tostring S_12_2A, replace
}

label define S_12_2A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_2C
if !_rc{
     tostring S_12_2C, replace
}

label define S_12_2C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_3A
if !_rc{
     tostring S_12_3A, replace
}

label define S_12_3A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_3C
if !_rc{
     tostring S_12_3C, replace
}

label define S_12_3C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_4A
if !_rc{
     tostring S_12_4A, replace
}

label define S_12_4A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_4B
if !_rc{
     tostring S_12_4B, replace
}

label define S_12_4B .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_4C
if !_rc{
     tostring S_12_4C, replace
}

label define S_12_4C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_5A
if !_rc{
     tostring S_12_5A, replace
}

label define S_12_5A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_5C
if !_rc{
     tostring S_12_5C, replace
}

label define S_12_5C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_6A
if !_rc{
     tostring S_12_6A, replace
}

label define S_12_6A .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_6C
if !_rc{
     tostring S_12_6C, replace
}

label define S_12_6C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_7
if !_rc{
     tostring S_12_7, replace
}

label define S_12_7 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_8
if !_rc{
     tostring S_12_8, replace
}

label define S_12_8 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_9
if !_rc{
     tostring S_12_9, replace
}

label define S_12_9 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_10
if !_rc{
     tostring S_12_10, replace
}

label define S_12_10 .a"." 2 "No" 1 "Yes" 6 "I cannot do this" 7 "I don’t do this" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_11
if !_rc{
     tostring S_12_11, replace
}

label define S_12_11 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_13
if !_rc{
     tostring S_12_13, replace
}

label define S_12_13 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_14
if !_rc{
     tostring S_12_14, replace
}

label define S_12_14 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_15
if !_rc{
     tostring S_12_15, replace
}

label define S_12_15 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_12_16
if !_rc{
     tostring S_12_16, replace
}

label define S_12_16 .a"." 1 "Totally lifted them" 2 "Partially raised them" 3 "Cannot lift them" 4 "Did not agree to take the test" 



capture confirm numeric variable S_13_1_P_C
if !_rc{
     tostring S_13_1_P_C, replace
}

label define S_13_1_P_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_1_D
if !_rc{
     tostring S_13_1_D, replace
}

label define S_13_1_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_3_P_C
if !_rc{
     tostring S_13_3_P_C, replace
}

label define S_13_3_P_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_3_D
if !_rc{
     tostring S_13_3_D, replace
}

label define S_13_3_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_5
if !_rc{
     tostring S_13_5, replace
}

label define S_13_5 .a"." 1 "Daily" 2 "Not every day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_8
if !_rc{
     tostring S_13_8, replace
}

label define S_13_8 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_9
if !_rc{
     tostring S_13_9, replace
}

label define S_13_9 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_12
if !_rc{
     tostring S_13_12, replace
}

label define S_13_12 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_13
if !_rc{
     tostring S_13_13, replace
}

label define S_13_13 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_14
if !_rc{
     tostring S_13_14, replace
}

label define S_13_14 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_15
if !_rc{
     tostring S_13_15, replace
}

label define S_13_15 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_16
if !_rc{
     tostring S_13_16, replace
}

label define S_13_16 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_17
if !_rc{
     tostring S_13_17, replace
}

label define S_13_17 .a"." 0 "Never" 1 "Some days" 2 "Most days" 3 "Once a day" 4 "More than once a day" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_18
if !_rc{
     tostring S_13_18, replace
}

label define S_13_18 .a"." 1 "Physically very active" 2 "Physically quite active" 3 "Physically not very active" 4 "Not physically active" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_19
if !_rc{
     tostring S_13_19, replace
}

label define S_13_19 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_22
if !_rc{
     tostring S_13_22, replace
}

label define S_13_22 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_30_D_C
if !_rc{
     tostring S_13_30_D_C, replace
}

label define S_13_30_D_C .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_13_30_P
if !_rc{
     tostring S_13_30_P, replace
}

label define S_13_30_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_1_P_D
if !_rc{
     tostring S_14_1_P_D, replace
}

label define S_14_1_P_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_3
if !_rc{
     tostring S_14_3, replace
}

label define S_14_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_17
if !_rc{
     tostring S_14_17, replace
}

label define S_14_17 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_1
if !_rc{
     tostring S_14_18_1, replace
}

label define S_14_18_1 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_2
if !_rc{
     tostring S_14_18_2, replace
}

label define S_14_18_2 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_3
if !_rc{
     tostring S_14_18_3, replace
}

label define S_14_18_3 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_4
if !_rc{
     tostring S_14_18_4, replace
}

label define S_14_18_4 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_5
if !_rc{
     tostring S_14_18_5, replace
}

label define S_14_18_5 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_18_6
if !_rc{
     tostring S_14_18_6, replace
}

label define S_14_18_6 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_23
if !_rc{
     tostring S_14_23, replace
}

label define S_14_23 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_30B1_P
if !_rc{
     tostring S_14_30B1_P, replace
}

label define S_14_30B1_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_30B1_D
if !_rc{
     tostring S_14_30B1_D, replace
}

label define S_14_30B1_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"


*cuba versions manually inserted

capture program drop s_14_30b_cuba
program define s_14_30b_cuba
    capture rename s_14_30b1_c S_14_30B1_C
    capture confirm numeric variable S_14_30B1_C
    if !_rc {
        capture tostring S_14_30B1_C, replace
    }
    label define S_14_30B1_C_lbl .a "." 2 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know"
    capture encode S_14_30B1_C, gen(s_14_30b1_c) label(S_14_30B1_C_lbl)

    capture rename s_14_30b2_c S_14_30B2_C
    capture confirm numeric variable S_14_30B2_C
    if !_rc {
        capture tostring S_14_30B2_C, replace
    }
    label define S_14_30B2_C_lbl .a "." 2 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know"
    capture encode S_14_30B2_C, gen(s_14_30b2_c) label(S_14_30B2_C_lbl)

    capture rename s_14_30b3_c S_14_30B3_C
    capture confirm numeric variable S_14_30B3_C
    if !_rc {
        capture tostring S_14_30B3_C, replace
    }
    label define S_14_30B3_C_lbl .a "." 2 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know"
    capture encode S_14_30B3_C, gen(s_14_30b3_c) label(S_14_30B3_C_lbl)
end

capture confirm variable s_14_30b1_c
capture confirm variable s_14_30b2_c
capture confirm variable s_14_30b3_c
if !_rc {
    s_14_30b_cuba
}



capture confirm numeric variable S_14_30B2_P
if !_rc{
     tostring S_14_30B2_P, replace
}

label define S_14_30B2_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_30B2_D
if !_rc{
     tostring S_14_30B2_D, replace
}

label define S_14_30B2_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_30B3_P
if !_rc{
     tostring S_14_30B3_P, replace
}

label define S_14_30B3_P .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_30B3_D
if !_rc{
     tostring S_14_30B3_D, replace
}

label define S_14_30B3_D .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"





capture confirm numeric variable S_14_31
if !_rc{
     tostring S_14_31, replace
}

label define S_14_31 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_32
if !_rc{
     tostring S_14_32, replace
}

label define S_14_32 .a"." 1 "1" 2 "2" 3 "3" 4 "4 or more" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_14_33
if !_rc{
     tostring S_14_33, replace
}

label define S_14_33 .a"." 2 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_15_1
if !_rc{
     tostring S_15_1, replace
}

label define S_15_1 .a"." 0 "Only the participant" 1 "Participant and proxy" 2 "Only the proxy" 



capture confirm numeric variable S_15_2
if !_rc{
     tostring S_15_2, replace
}

label define S_15_2 .a"." 1 "Spouse" 2 "Son/daughter" 3 "Son-in-law/daughter-in-law" 4 "Sibling" 5 "Other relative" 6 "Friend" 7 "Neighbor" 8 "Other" 



capture confirm numeric variable S_15_3
if !_rc{
     tostring S_15_3, replace
}

label define S_15_3 .a"." 0 "Reasonable (the interviewee responded appropriately to more or less all the questions)" 1 "Some doubts" 2 "Moderate doubts" 3 "Serious doubts (the interviewer considered that the interviewee was unable or did not cooperate in responding appropriately to most questions)" 4 "No value (the questions were answered randomly)" 

*addressing checkboxes below



label define S_7_7a 0 "false" 1 "true"




label define S_7_7b 0 "false" 1 "true"




label define S_7_7c 0 "false" 1 "true"




label define S_7_7d 0 "false" 1 "true"




label define S_7_7e 0 "false" 1 "true"




label define S_7_7f 0 "false" 1 "true"




label define S_7_7g 0 "false" 1 "true"




label define S_7_7h 0 "false" 1 "true"




label define S_7_7i 0 "false" 1 "true"




label define S_7_7j 0 "false" 1 "true"




label define S_7_7k 0 "false" 1 "true"




*we are deleting this duplicate
label define S_8_5b2 0 "false" 1 "true"




label define S_8_5b1 0 "false" 1 "true"




label define S_8_5b3 0 "false" 1 "true"

*this will be changed to 2 to align with word




label define S_8_5b4 0 "false" 1 "true"

*This will be changed to 3 to align with word



label define S_8_5b5 0 "false" 1 "true"

*this will be changed to 4 to align with word



label define S_8_5b6 0 "false" 1 "true"

*this will be changed to 5 to align with word



label define S_8_5b7 0 "false" 1 "true"

*this will be changed to 6 to align with word



label define S_8_5b8 0 "false" 1 "true"

*this will be changed to 7 t align with word



label define S_8_5b9 0 "false" 1 "true"

*this will be changed t 8 to align with word



label define S_8_5b10 0 "false" 1 "true"

*this will be changed to 9 to align with word



label define S_9_38a 0 "false" 1 "true"




label define S_9_38g 0 "false" 1 "true"




label define S_9_38b 0 "false" 1 "true"




label define S_9_38f 0 "false" 1 "true"




label define S_9_38c 0 "false" 1 "true"




label define S_9_38d 0 "false" 1 "true"




label define S_9_38j 0 "false" 1 "true"




label define S_9_38e 0 "false" 1 "true"




label define S_9_38k 0 "false" 1 "true"




label define S_9_38h 0 "false" 1 "true"




label define S_9_38l 0 "false" 1 "true"




label define S_9_38i 0 "false" 1 "true"




label define S_14_2a_P 0 "false" 1 "true"




label define S_14_1b_P 0 "false" 1 "true"

*we renamed this because it was incorrect in the DD and tablet



label define S_14_2c_P 0 "false" 1 "true"




label define S_14_2d_P 0 "false" 1 "true"




label define S_14_2e_P 0 "false" 1 "true"




label define S_14_2f_P 0 "false" 1 "true"




label define S_14_2g_P 0 "false" 1 "true"




label define S_14_2h_P 0 "false" 1 "true"




label define S_14_2i_P 0 "false" 1 "true"




label define S_14_2j_P 0 "false" 1 "true"




label define S_14_2a_D 0 "false" 1 "true"




label define S_14_2b_D 0 "false" 1 "true"




label define S_14_2c_D 0 "false" 1 "true"




label define S_14_2d_D 0 "false" 1 "true"




label define S_14_2e_D 0 "false" 1 "true"




label define S_14_2f_D 0 "false" 1 "true"




label define S_14_2g_D 0 "false" 1 "true"



*dealing with comment legal fields

label define S_0 .a "." 0 "Man" 1 "Woman"

label values s_0 S_0


label define S_2_9a_ .a"." 0 "Has not completed any education" 1 "Pre-primary (kindergarten, nursery, maternal, pre-school)" 2 "Primary" 3 "Intermediate" 4 "Secondary" 5 "Tertiary education (e.g. associate degree or technical degree)" 6 "University education or higher" 8 "Does not respond" 9 "Does not know"

label values s_2_9a S_2_9a_


label define S_3_11_ .a"." 1 "Professional, executive" 2 "Office worker" 3 "Salesperson, retailer" 4 "Independent Farmer" 5 "Farm worker" 6 "Domestic worker" 7 "Other services" 8 "Skilled Worker" 9 "Unskilled worker" 10 "Informal work" 11 "Other" 12 "Did not work" 13 "Did not have a father or guardian" 88 "Does not respond" 99 "Does not know"

label values s_3_11 S_3_11_


label define S_6_7_ .a"." 1 "you were sick?" 2 "you missed your family?" 3 "it was difficult to stay abroad?" 4 "it was expensive to stay abroad?" 5 "you did not earn enough there?" 6 "you had problems related to migration?" 7 "you had family problems here?" 8 "OTHER" 88 "Does not respond" 99 "Does not know"

label values s_6_7 S_6_7_

*reorder

*order pid globalrecordid pid2 s_interid s_houseid s_particid s_clustid s_country s_houseid2 s_conglid2 s_particid2 s_0 s_deviceid1 s_1_1_p s_1_1_d s_1_1_c s_1_2 s_2_3 s_2_8c s_2_9 s_2_9a s_2_10 s_2_11 s_2_12 s_2_13 s_2_14_p s_2_14_d s_2_14_c s_2_15_p s_2_15_d s_2_15_c s_2_16 s_3_0 s_3_1_p s_3_1_d s_3_1_c s_3_2 s_3_3_p s_3_3_d s_3_3_c s_3_4 s_3_5 s_3_6 s_3_7 s_3_8 s_3_9 s_3_11 s_3_12_1 s_3_12_2 s_3_12_3 s_3_12_6 s_3_12_8 s_3_13 s_3_17 s_3_18 s_3_19_1 s_3_19_2 s_4_1 s_4_2 s_4_3 s_4_6 s_4_7 s_4_8 s_4_11 s_4_12 s_4_13 s_4_16 s_4_17 s_4_18 s_4_20 s_4_21 s_4_22 s_4_23_1 s_4_23_2 s_4_26 s_4_27_1 s_4_27_2 s_4_27a s_4_28 s_4_29_1 s_4_29_2 s_4_29a s_5_1 s_5_2 s_5_3 s_5_4 s_5_5 s_6_1 s_6_2 s_6_3 s_6_4 s_6_5_p s_6_5_d s_6_5_c s_6_6 s_6_7 s_7_0 s_7_1 s_7_2a s_7_2b s_7_2c s_7_3 s_7_4a s_7_4b s_7_4c s_7_5a s_7_5b s_7_5c s_7_6a s_7_6b s_7_7a s_7_7b s_7_7c s_7_7d s_7_7e s_7_7f s_7_7g s_7_7h s_7_7i s_7_7j s_7_7k s_8_1 s_8_2 s_8_3 s_8_3a s_8_4 s_8_5a s_8_5b2 s_8_5b1 s_8_5b4 s_8_5b3 s_8_5b5 s_8_5b6 s_8_5b7 s_8_5b8 s_8_5b9 s_8_5c s_8_5d s_8_7 s_8_8 s_8_9 s_8_10 s_8_11 s_8_12 s_8_13 s_8_14 s_8_15 s_8_16 s_9_1 s_9_3 s_9_4 s_9_5 s_9_6 s_9_7 s_9_8 s_9_9 s_9_11 s_9_13 s_9_14 s_9_15 s_9_16 s_9_17 s_9_18 s_9_19 s_9_20 s_9_21a s_9_21b s_9_22 s_9_23 s_9_24 s_9_25 s_9_26 s_9_28 s_9_29 s_9_30 s_9_31 s_9_32 s_9_33 s_9_35 s_9_36 s_9_37 s_9_38a s_9_38g s_9_38b s_9_38f s_9_38c s_9_38d s_9_38j s_9_38e s_9_38k s_9_38h s_9_38l s_9_38i s_9_39 s_9_40 s_9_41 s_9_42 s_9_43a s_9_44 s_9_45a s_9_46 s_9_47 s_9_48 s_9_49 s_9_50 s_9_51 s_9_52 s_9_53 s_9_54 s_9_55 s_9_56 s_9_57 s_9_58 s_9_59 s_9_60 s_9_61 s_9_61a s_9_62 s_9_63 s_9_64_1 s_9_64_2 s_9_64_3 s_9_64_4 s_9_65 s_9_66 s_10_1a s_10_1b s_10_1c s_10_1d s_10_1e s_10_1f s_10_1g s_10_1h s_10_2 s_10_3 s_10_4 s_10_5 s_10_6_1 s_10_6_1a s_10_6_2 s_10_6_2a s_10_6_3 s_10_6_3a s_10_6_4 s_10_6_4a s_10_7_1 s_10_7_2 s_11_1 s_11_2 s_11_3 s_12_1a s_12_1b s_12_1c s_12_2a s_12_2c s_12_3a s_12_3c s_12_4a s_12_4b s_12_4c s_12_5a s_12_5c s_12_6a s_12_6c s_12_7 s_12_8 s_12_9 s_12_10 s_12_11 s_12_13 s_12_14 s_12_15 s_12_16 s_13_1_p_c s_13_1_d s_13_2 s_13_3_p_c s_13_3_d s_13_4 s_13_5 s_13_6_p_c s_13_6_d s_13_7_p_c s_13_7_d s_13_8 s_13_9 s_13_10 s_13_11 s_13_12 s_13_13 s_13_14 s_13_15 s_13_16 s_13_17 s_13_18 s_13_19 s_13_20 s_13_22 s_13_23_p s_13_23_d_c s_13_24 s_13_25_d_c s_13_25_p s_13_26 s_13_27_d_c s_13_27_p s_13_28 s_13_29 s_13_30_d_c s_13_30_p s_14_1_p_d s_14_2a_p s_14_2b_p s_14_2c_p s_14_2d_p s_14_2e_p s_14_2f_p s_14_2g_p s_14_2h_p s_14_2i_p s_14_2j_p s_14_2a_d s_14_2b_d s_14_2c_d s_14_2d_d s_14_2e_d s_14_2f_d s_14_2g_d s_14_3 s_14_4 s_14_5 s_14_6 s_14_8 s_14_9 s_14_11 s_14_12 s_14_13 s_14_14 s_14_15 s_14_16 s_14_17 s_14_18_1 s_14_18_2 s_14_18_3 s_14_18_4 s_14_18_5 s_14_18_6 s_14_20 s_14_22 s_14_23 s_14_24 s_14_25 s_14_30a s_14_30b1_p s_14_30b1_d s_14_30b1_c s_14_30b2_p s_14_30b2_d s_14_30b2_c s_14_30b3_p s_14_30b3_d s_14_30b3_c s_14_31 s_14_32 s_14_33 s_15_1 s_15_2 s_15_3 s_deviceid2

sort s_clustid s_houseid

*convert missing comment legal and text values to string

capture confirm numeric variable s_particid2
if !_rc{
     tostring s_particid2, replace
}

capture confirm numeric variable s_deviceid1
if !_rc{
     tostring s_deviceid1, replace
}

capture confirm numeric variable s_1_2
if !_rc{
     tostring s_1_2, replace
}

capture confirm numeric variable s_2_16
if !_rc{
     tostring s_2_16, replace
}

capture confirm numeric variable s_3_3_p
if !_rc{
     tostring s_3_3_p, replace
}

capture confirm numeric variable s_3_3_d
if !_rc{
     tostring s_3_3_d, replace
}

capture confirm numeric variable s_3_3_c
if !_rc{
     tostring s_3_3_c, replace
}

capture confirm numeric variable s_8_3a
if !_rc{
     tostring s_8_3a, replace
}

capture confirm numeric variable s_9_21b
if !_rc{
     tostring s_9_21b, replace
}

capture confirm numeric variable s_deviceid2
if !_rc{
     tostring s_deviceid2, replace
}

*adding variable labels

label variable s_interid "Interviewer number:"

label variable s_houseid "House number:"

label variable s_particid "Participant number:"

label variable s_clustid "Cluster number:"

label variable s_country "Country:"

capture label variable s_houseid2 "House number:"

capture label variable s_conglid2 "Cluster number:"

capture label variable s_particid2 "Participant number:"

label variable s_0 "Are they man or woman?"

label variable s_deviceid1 "Device ID:"

label variable s_1_1_p "1.1 If you had to classify the participant in one of the following categories, in which category would you classify them? * Trigueño refers to the mixture of white and black. Mestizo refers to the mixture of Indian and white"

label variable s_1_1_d "1.1 If you had to classify the participant in one of the following categories, in which category would you classify them?"

label variable s_1_1_c "1.1 If you had to classify the participant in one of the following categories, in which category would you classify them?"

label variable s_1_2 "1.2 As you know, human beings have a wide variety of skin color. In the image, a skin color scale ranges from 1 (lightest color) to 11 (darkest color). Please observe the color of the participant's face and indicate which number represents the closest color on the COLOR CARD."

label variable s_2_3 "2.3 Age stated on official document: ____ [999 = There is no documentation]"

label variable s_2_8c "2.8c How many years of schooling have you completed (excluding pre-primary)? Years ____ Does not respond............88 Does not know.....................99"

label variable s_2_9 "2.9 Are you currently married?"

label variable s_2_9a "2.9a What is the highest degree or level of education that your spouse or ex-spouse has COMPLETED?"

label variable s_2_10 "2.10 How many children have you had [fathered / given birth to]? please do not count miscarriages or stillbirths or adopted or stepchildren for this question Does not respond............88 Does not know.....................99"

label variable s_2_11 "2.11 Are you a member of any religious group?"

label variable s_2_12 "2.12 Approximately, how often did you attend religious services in the past year?"

label variable s_2_13 "2.13 Do you attend meetings of community or social groups like clubs, lectures or the like?"

label variable s_2_14_p "2.14 If you had to classify yourself in one of the following categories, in which category would you classify yourself? Black, mulatto, trigueño, white, mestizo or another category? * Trigueño refers to the mixture of white and black. Mestizo refers to the mixture of Indian and white"

label variable s_2_14_d "2.14 If you had to classify yourself in one of the following categories, in which category would you classify yourself? Black, mulatto, white, Indian or another category?"

label variable s_2_14_c "2.14 If you had to classify yourself in one of the following categories, in which category would you classify yourself? Black, white, mulatto/mestizo or another category?"

label variable s_2_15_p "2.15 If you were walking down the street, in what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"

label variable s_2_15_d "2.15 If you were walking down the street, in what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"

label variable s_2_15_c "2.15 If you were walking down the street, in what category do you think other people who don't know you personally would automatically assume you are, based on your appearance?"

label variable s_2_16 "2.16 As you know, human beings have a wide variety of skin color. In the image, a skin color scale ranges from 1 (lightest color) to 11 (darkest color). Please note the color of the participant's face and indicate which number represents your color closest to the color of your face. SHOW COLOR CARD."

label variable s_3_0 "3.0 How long have you lived in this city/town/district? Code in years (1 year or less = 0)"

label variable s_3_1_p "3.1 Where were you born?"

label variable s_3_1_d "3.1 Where were you born?"

label variable s_3_1_c "3.1 Where were you born?"

label variable s_3_2 "3.2 The place you were born was:"

label variable s_3_3_p "3.3 In which municipality were you born?"

label variable s_3_3_d "3.3 In which province were you born?"

label variable s_3_3_c "3.3 In which province were you born?"

label variable s_3_4 "3.4 Where did you live most of the time between the ages of 20 and 60?"

label variable s_3_5 "3.5 Where have you lived most of the time since you turned 60?"

label variable s_3_6 "3.6 Can you read a newspaper?"

label variable s_3_7 "3.7 Can you write a letter if needed?"

label variable s_3_8 "3.8 How did you do in math compared to other children in your class?"

label variable s_3_9 "3.9 How did you do in reading and writing compared to other children in your class?"

label variable s_3_11 "3.11 (Before you were 10 years old), what type of work did your father or guardian do most of the time..."

label variable s_3_12_1 "3.12.1 Did your home have a toilet inside the home?"

label variable s_3_12_2 "3.12.2 Did your home have electricity?"

label variable s_3_12_3 "3.12.3 Did your family have economic problems that did not allow them to eat regularly, dress adequately or have the necessary medical care?"

label variable s_3_12_6 "3.12.6 Did you or a family member sleep in the same room that was used for cooking?"

label variable s_3_12_8 "3.12.8 Did any of your parents or guardians smoke?"

label variable s_3_13 "3.13 (Before you were 16 years old), compared to other children your age, how was your health condition?"

label variable s_3_17 "3.17 Have you ever experienced a natural disaster (e.g. earthquake, hurricane) that displaced you from your home during at least a week?"

label variable s_3_18 "3.18 How old were you when this last happened? REGISTER AGE Does not respond………………………888 Does not know ………………………………999"

label variable s_3_19_1 "NUMBER: Does not respond...........................88 Does not know ....................................99"

label variable s_3_19_2 "Indicate if it was years, months, weeks, or days"

label variable s_4_1 "4.1. What is the highest level of school your mother COMPLETED?"

label variable s_4_2 "4.2 [ONLY ASK IF NOT YET CLEAR] Is your mother currently living?"

label variable s_4_3 "4.3 How old is your mother? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_6 "4.6 How old was your mother when she died? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_7 "4.7 How old were you when your mother died? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_8 "4.8 Does or did your mother have or had dementia, senility, or any other serious memory impairment?"

label variable s_4_11 "4.11. What is the highest level of school your father COMPLETED?"

label variable s_4_12 "4.12  [ONLY ASK IF NOT YET CLEAR] Is your father currently living?"

label variable s_4_13 "4.13 How old is your father? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_16 "4.16 How old was your father when he died? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_17 "4.17 How old were you when your father died? Does not respond………………………888 Does not know ………………………………999"

label variable s_4_18 "4.18 Does or did your father have or had dementia, senility, or any other serious memory impairment?"

label variable s_4_20 "4.20 How many living brothers and sisters do you have? Does not respond……………………………….88 Does not know ………………………………………..99"

label variable s_4_21 "4.21 During the past year, did you spend at least one hour a week (a total of 50 hours or more) helping someone with basic activities such as dressing, eating, or bathing because of a health problem? Exclude help with household chores, errands, transportation."

label variable s_4_22 "4.22 Who received this support?"

label variable s_4_23_1 "4.23.1 How many hours did you yourself spend helping them? RECORD TOTAL HOURS: Does not respond............ 88 Does not know ...................... 99"

label variable s_4_23_2 "4.23.2 PER PERIOD"

label variable s_4_26 "4.26 In the last year, have you spent at least one hour a week helping your children/daughter-in-law/son-in-law/grandchildren? Please do not include help with basic activities already mentioned above."

label variable s_4_27_1 "4.27.1 In total, approximately, how many hours did you spend helping your children/daughter-in-law/son-in-law/grandchildren? RECORD TOTAL HOURS: Does not respond............ 88 Does not know ...................... 99"

label variable s_4_27_2 "4.27.2 PER PERIOD"

label variable s_4_27a "4.27a Would you say that they were..."

label variable s_4_28 "4.28 In the last year, have your children/daughter-in-law/son-in-law/grandchildren spent at least 1 hour a week helping you with housework, errands, transportation?"

label variable s_4_29_1 "4.29.1 In total, approximately, how many hours did these people spend helping you? RECORD TOTAL HOURS Does not respond............ 888 Does not know ...................... 999"

label variable s_4_29_2 "4.29.2 PER PERIOD"

label variable s_4_29a "4.29a Would you say that they were..."

label variable s_5_1 "5.1 In the last year, have you always had enough money to buy the food you need?"

label variable s_5_2 "5.2 After your 18th birthday, have you ever experienced severe financial hardship (such as trouble buying food)?"

label variable s_5_3 "5.3 For how long? Years |__|__| Less than a year ………0 Does not respond…………….88 Does not know………………….99"

label variable s_5_4 "5.4 Indicate on this ladder where you would place yourself. Number [ ]"

label variable s_5_5 "5.5 When you were born, where would you place your parents on this ladder? Number [ ]"

label variable s_6_1 "6.1 Not counting vacations or short visits, have you ever worked or lived in the United States?"

label variable s_6_2 "6.2 In total, approximately, how many years have you lived in the United States? 12 months or less……………………….01 Does not respond……………………………….88 Does not know ………………………………………..99"

label variable s_6_3 "6.3 Not counting vacations or short visits, have you ever worked or lived in another foreign country besides the United States?"

label variable s_6_4 "6.4 In total, approximately, how many years have you lived in another foreign country besides the United States? 12 months or less............................01 Does not respond.....................................88 Does not know ...............................................99"

label variable s_6_5_p "6.5 In which foreign country have you spent the most time?"

label variable s_6_5_d "6.5 In which foreign country have you spent the most time?"

label variable s_6_5_c "6.5 In which foreign country have you spent the most time?"

label variable s_6_6 "6.6 Now think about the last time you went to work or live abroad, how old were you when you returned or arrived in this country? Does not respond……………. 888 Does not know …………………….. 999"

label variable s_6_7 "6.7 The last time you returned from abroad, which would you say was the main reason you returned…"

label variable s_7_0 "7.0 In general, how do you feel about your life?"

label variable s_7_1 "[ONLY ASK IF YET UNCLEAR] 7.1 Do you have children who do not live with you?"

label variable s_7_2a "7.2a Meet (include organized and casual meet-ups)"

label variable s_7_2b "7.2b Talk on the phone"

label variable s_7_2c "7.2c Communicate in writing on paper or online (email, WhatsApp, Skype, Facebook or other social media)"

label variable s_7_3 "7.3 With how many of your children would you say you have a close relationship? DOES NOT APPLY (no children).77 DOES NOT RESPOND...................... 88"

label variable s_7_4a "7.4a Meet (include organized and casual meet-ups)"

label variable s_7_4b "7.4b Talk on the phone"

label variable s_7_4c "7.4c Communicate in writing on paper or online (email, WhatsApp, Skype, Facebook or other social media)"

label variable s_7_5a "7.5a feel that you lack company?"

label variable s_7_5b "7.5b feel ignored by others?"

label variable s_7_5c "7.5c feel isolated, apart from others?"

label variable s_7_6a "7.6a You feel you are treated with less courtesy or respect than other people"

label variable s_7_6b "7.6b You feel you receive poorer service or treatment from doctors or hospitals than other people."

label variable s_7_7a "Your ancestry or national origin"

label variable s_7_7b "Your gender"

label variable s_7_7c "Your race"

label variable s_7_7d "Your religion"

label variable s_7_7e "Your weight"

label variable s_7_7f "A physical disability"

label variable s_7_7g "A mental disability/dementia"

label variable s_7_7h "An aspect of your physical appearance"

label variable s_7_7i "Your sexual orientation"

label variable s_7_7j "Your financial status"

label variable s_7_7k "Other"

label variable s_8_1 "8.1 [ONLY ASK IF NOT YET CLEAR] Have you ever had a job?"

label variable s_8_2 "8.2 About how much total time have you worked (did you work) receiving payment or profit during your lifetime? Register Number of years Does not respond.............................888 Does not know......................................999"

label variable s_8_3 "8.3 What was (has been) the job of longest duration …"

label variable s_8_3a "8.3a What was your primary occupation?"

label variable s_8_4 "8.4 In this job of longest duration, most of the time, you have been (were)…"

label variable s_8_5a "8.5a Currently, you:"

label variable s_8_5b2_delete "Dedicated to household chores"

label variable s_8_5b1 "Dedicated to household chores"
*check this again, test on tablet, may need changes in Spanish version of do files
label variable s_8_5b3 "Advanced age"
*check this again, test on tablet
label variable s_8_5b2 "Retired or on pension"

label variable s_8_5b4 "Sick or temporarily disabled"

label variable s_8_5b5 "Unable to work for the rest of their life"

label variable s_8_5b6 "Doesn’t have customers or can’t find work"

label variable s_8_5b7 "Need to participate in family caregiving"

label variable s_8_5b8 "Does not respond"

label variable s_8_5b9 "Does not know"

label variable s_8_5c "8.5c How many years ago did you leave your last job? Years ____ Does not respond……………..88 Does not know……………………..99"

label variable s_8_5d "8.5d What is your current work?"

label variable s_8_7 "8.7 Have you ever had a job that requires you to work frequently at night?"

label variable s_8_8 "8.8 In a typical week, how many night shifts would you work? Does not respond…………………. 8 Does not know………………………….. 9"

label variable s_8_9 "8.9 How many years were you in a job that required this night work? Does not respond…………………. 8 Does not know………………………….. 9"

label variable s_8_10 "8.10 Your work required a lot of concentration or attention."

label variable s_8_11 "8.11 My work was interesting and pleasant."

label variable s_8_12 "8.12 My job involved a lot of stress."

label variable s_8_13 "8.13 I really enjoyed going to work."

label variable s_8_14 "8.14 The job was physically demanding."

label variable s_8_15 "8.15 At work, I felt I had control over what happened in most situations."

label variable s_8_16 "8.16 What was (has been) the longest-held job of your spouse/ex-spouse? [the last spouse/ex-spouse if there have been more than one]"

label variable s_9_1 "9.1 Now I have some questions about your health, would you say that your health is..."

label variable s_9_3 "9.3 Vision problems If yes, how much does it interfere with your activities: not at all, a little or a lot?"

label variable s_9_4 "9.4 Hard of hearing or deafness If yes, how much does it interfere with your activities: not at all, a little or a lot?"

label variable s_9_5 "9.5 Have you ever been told that you had asthma?"

label variable s_9_6 "9.6 How old were you when they first told you? Register years of age Does not respond...................... 888 Does not know................................ 999"

label variable s_9_7 "9.7 Do you still have asthma?"

label variable s_9_8 "9.8 Have you ever been told that you had hypertension?"

label variable s_9_9 "9.9 How old were you when they first told you? Register years of age Does not respond...................... 888 Does not know................................ 999"

label variable s_9_11 "9.11 Are you taking medicine to control the hypertension?"

label variable s_9_13 "9.13 When was the last time you checked your blood pressure?"

label variable s_9_14 "9.14 Have you ever been told that you had a heart disorder?"

label variable s_9_15 "9.15 When was the first time?"

label variable s_9_16 "9.16 What did the doctor tell you it was?"

label variable s_9_17 "9.17 Have you ever had a brain stroke (ischemia) that required medical attention? What happened? (Assign only if there is a clear history of sudden onset unilateral paralysis, and/or loss of speech, and/or blindness lasting at least 2 days)"

label variable s_9_18 "9.18 Who diagnosed the stroke?"

label variable s_9_19 "9.19 Have you ever experienced sudden weakness of a limb, loss of speech, or partial blindness that improved rapidly, in less than a day? (Doctors sometimes call these attacks TIAs)"

label variable s_9_20 "9.20 Have you ever had a blow to the head, head injury or head trauma that was serious enough to require medical attention, to cause loss of consciousness or memory loss for a period of time?"

label variable s_9_21a "9.21a Number:"

label variable s_9_21b "9.21b Hours or minutes?"

label variable s_9_22 "9.22 How old were you at the time? If there were multiple incidents, please refer to the first incident. Register years of age Does not respond...................... 888 Does not know................................ 999"

label variable s_9_23 "9.23 Have you ever been told that you had diabetes?"

label variable s_9_24 "9.24 Was diabetes only present during pregnancy?"

label variable s_9_25 "9.25 At what age were you first told you had diabetes? Register years of age Does not respond...................... 888 Does not know................................ 999"

label variable s_9_26 "9.26 Do you need a special diet, do you take tablets or do you inject insulin?"

label variable s_9_28 "9.28 How often do you check your blood sugar level?"

label variable s_9_29 "9.29 How often do you have a medical check for your diabetes?"

label variable s_9_30 "9.30 Have you ever been told that you have high cholesterol/triglycerides/fats in your blood?"

label variable s_9_31 "9.31 At what age were you first told you had high cholesterol? If there were multiple incidents, please refer to the first incident. Register years of age Does not respond...................... 888 Does not know................................ 999"

label variable s_9_32 "9.32 Do you need a special diet for the cholesterol?"

label variable s_9_33 "9.33 Are you currently taking medications to control your cholesterol?"

label variable s_9_35 "9.35 When was the last time you checked your cholesterol?"

label variable s_9_36 "9.36 During the last year, how many times have you fallen for no apparent reason? Register number of falls Does not respond...................88 Does not know ...........................99"

label variable s_9_37 "9.37 Has a doctor ever told you that you have cancer or a malignant tumor, excluding small skin tumors?"

label variable s_9_38a "Stomach"

label variable s_9_38g "Prostate"

label variable s_9_38b "Other digestive"

label variable s_9_38f "Other respiratory"

label variable s_9_38c "Urinary system"

label variable s_9_38d "Leukemia"

label variable s_9_38j "Other"

label variable s_9_38e "Lung"

label variable s_9_38k "Does not respond"

label variable s_9_38h "Uterus / cervix"

label variable s_9_38l "Does not know"

label variable s_9_38i "Breast"

label variable s_9_39 "9.39 Have you ever received chemotherapy or radiotherapy?"

label variable s_9_40 "9.40 Are you missing any natural teeth or molars?"

label variable s_9_41 "9.41 Have you had urine accidents? Does your urine (pee) come out if you can't get to the bathroom quickly?"

label variable s_9_42 "9.42 Have you ever been told that you have Parkinson’s disease?"

label variable s_9_43a "9.43a At what age were you first told? Does not respond...................... 888 Does not know................................ 999"

label variable s_9_44 "9.44 Has a doctor ever told you that you have dementia or Alzheimer’s?"

label variable s_9_45a "9.45a At what age were you first told? Does not respond...................... 888 Does not know................................ 999"

label variable s_9_46 "9.46 Did the doctor prescribe/prescribe any medicine?"

label variable s_9_47 "9.47 Have there been times in your life before the past year when you experienced symptoms of sadness, empty feelings, depressed, or lost interest in most things like work, hobbies, or other things that lasted at least two weeks?"

label variable s_9_48 "9.48 How old were you when this first happened? Does not respond...................... 888 Does not know................................ 999"

label variable s_9_49 "9.49 Did you receive treatment from a family doctor or psychiatrist?"

label variable s_9_50 "9.50 Were you admitted to a hospital or psychiatric ward?"

label variable s_9_51 "9.51 Hearing test?"

label variable s_9_52 "9.52 Vision exam?"

label variable s_9_53 "9.53 Mammogram or x-ray of the breasts"

label variable s_9_54 "9.54 Uterine or cervical cancer screening (pap screening)?"

label variable s_9_55 "9.55 Blood test, for prostate?"

label variable s_9_56 "9.56 Rectal exam, for prostate?"

label variable s_9_57 "9.57 How old were you when your first menstruation or period began? Does not respond...................... 88 Does not know................................ 99"

label variable s_9_58 "9.58 [ONLY ASK IF NOT YET CLEAR] Have you ever given birth to a baby?"

label variable s_9_59 "9.59 How old were you when you gave birth for the first time (first baby)? Does not respond...................... 88 Does not know................................ 99"

label variable s_9_60 "9.60 How many times have you given birth? Does not respond...................... 88 Does not know................................ 99"

label variable s_9_61 "9.61 How old were you when you finished going through your menopause, that is, your last menstruation or period? STILL MENSTRUATING.........97 Does not respond......................88 Does not know................................99"

label variable s_9_61a "9.61a Were you..."

label variable s_9_62 "9.62 Have you had a hysterectomy, a surgery to remove the uterus and ovaries or only the uterus?"

label variable s_9_63 "9.63 Have you ever used contraceptives or been sterilized?"

label variable s_9_64_1 "9.64.1 Pills"

label variable s_9_64_2 "9.64.2 Injections"

label variable s_9_64_3 "9.64.3 Sterilization"

label variable s_9_64_4 "9.64.4 Other"

label variable s_9_65 "9.65 At what age did you start using the first of the methods you used? Register years of age Does not respond...................... 88 Does not know................................ 99"

label variable s_9_66 "9.66 Have you ever used female hormones (estrogens) in the form of pills, patches or cream for 3 years or more to treat menopause?"

label variable s_10_1a "10.1a You felt depressed. Would you say yes or no?"

label variable s_10_1b "10.1b You felt that everything you did was an effort. Would you say yes or no?"

label variable s_10_1c "10.1c Your sleep was restless. Would you say yes or no?"

label variable s_10_1d "10.1d You were happy. Would you say yes or no?"

label variable s_10_1e "10.1e You felt alone. Would you say yes or no?"

label variable s_10_1f "10.1f You enjoyed life. Would you say yes or no?"

label variable s_10_1g "10.1g You felt sad. Would you say yes or no?"

label variable s_10_1h "10.1h You did not want to do anything. Would you say yes or no?"

label variable s_10_2 "10.2 How often do you have difficulty falling asleep? You would say…"

label variable s_10_3 "10.3 How often do you wake up at night after falling asleep? You would say…"

label variable s_10_4 "10.4 How often do you wake up early and can't fall asleep again? You would say…"

label variable s_10_5 "10.5 How often do you feel rested when you wake up in the mornings?"

label variable s_10_6_1 "10.6.1 Your health: Does this make you feel stressed or anxious?"

label variable s_10_6_1a "10.6.1a How long have you felt this stress or anxiety?"

label variable s_10_6_2 "10.6.2 Your financial situation: Does this make you feel stressed or anxious?"

label variable s_10_6_2a "10.6.2a How long have you felt this stress or anxiety?"

label variable s_10_6_3 "10.6.3 Work problems: Does this make you feel stressed or anxious?"

label variable s_10_6_3a "10.6.3a How long have you felt this stress or anxiety?"

label variable s_10_6_4 "10.6.4 Family relationships: Does this make you feel stressed or anxious?"

label variable s_10_6_4a "10.6.4a How long have you felt this stress or anxiety?"

label variable s_10_7_1 "10.7.1 A major source of stress in my life has been my children."

label variable s_10_7_2 "10.7.2 Looking back, I often felt overwhelmed by the responsibility of being a parent."

label variable s_11_1 "11.1 In the last month, how often has a health condition caused you pain?"

label variable s_11_2 "11.2 In general, how would you classify the pain severity in the last month? Would you say it is"

label variable s_11_3 "11.3 When the pain is most intense, to what extent does it restrict what you do?"

label variable s_12_1a "12.1a Due to a health problem, do you have difficulty walking from one side of a room to the other?"

label variable s_12_1b "12.1.b Do you use any equipment or appliances, such as a cane, orthopedic walker, or wheelchair walking from one side of a room to the other?"

label variable s_12_1c "12.1.c Does someone help you walk from one side of a room to the other?"

label variable s_12_2a "12.2a Due to a health problem, do you have difficulty bathing in a shower?"

label variable s_12_2c "12.2.c Does someone help you bathe in the shower?"

label variable s_12_3a "12.3a Due to a health problem, do you have difficulty eating, for example cutting your food?"

label variable s_12_3c "12.3.c Does someone help you eat, for example cutting your food?"

label variable s_12_4a "12.4a Due to a health problem, do you have difficulty getting into and getting out of bed?"

label variable s_12_4b "12.4.b Do you use any equipment or appliances, such as a cane, orthopedic walker, or wheelchair getting into and getting out of bed?"

label variable s_12_4c "12.4.c Does someone help you get into and get out of bed?"

label variable s_12_5a "12.5a Due to a health problem, do you have difficulty using the toilet, including getting on and off or squatting?"

label variable s_12_5c "12.5c Does someone help you use the toilet, including getting on and off or squatting?"

label variable s_12_6a "12.6a Due to a health problem, do you have difficulty cutting your toenails?"

label variable s_12_6c "12.6c Does someone help you cut your toenails?"

label variable s_12_7 "12.7 Due to a health problem, do you have difficulty preparing a hot meal?"

label variable s_12_8 "12.8 Due to a health problem, do you have difficulty shopping for foods/errands?"

label variable s_12_9 "12.9 Due to a health problem, do you have difficulty taking your medications (if you take any or were to take any)?"

label variable s_12_10 "12.10 Due to a health problem, do you have difficulty handling your money?"

label variable s_12_11 "12.11 Can you walk?"

label variable s_12_13 "12.13 Is it difficult for you to walk several blocks?"

label variable s_12_14 "12.14 Do you have difficulty climbing several flights of stairs without resting?"

label variable s_12_15 "12.15 Do you have difficulty pushing or pulling a large object such as a chair?"

label variable s_12_16 "12.16 Please raise and stretch your arms above your shoulders."

label variable s_13_1_p_c "13.1 Have you ever smoked cigarettes/cigars"

label variable s_13_1_d "13.1 Have you ever smoked cigarettes/cigars?"

label variable s_13_2 "13.2 How old were you when you started smoking? Register Age Does not respond...................... 888 Does not know................................ 999"

label variable s_13_3_p_c "13.3 Do you currently smoke cigarettes/cigars?"

label variable s_13_3_d "13.3 Do you currently smoke cigarettes/cigars?"

label variable s_13_4 "13.4 [If you no longer smoke] How old were you when you stopped smoking? Register Age or Year you quit smoking Does not respond...................... 888 Does not know................................ 999"

label variable s_13_5 "13.5 How often do you smoke?"

label variable s_13_6_p_c "13.6 How many cigarettes/cigars do you normally smoke per day? Cigarettes/day..............................|_|_| 87 and more cigarettes/day..................... 87 Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_6_d "13.6 How many cigarettes/cigars do you normally smoke per day? Cigarettes/day..............................|_|_| 87 and more cigarettes/day..................... 87 Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_7_p_c "13.7 When you smoked the most, how many cigarettes/cigars did you smoke in a day? Cigarettes/day..............................|_|_| 87 and more cigarettes/day..................... 87 Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_7_d "13.7 When you smoked the most, how many cigarettes/cigars did you smoke in a day? Cigarettes/day..............................|_|_| 87 and more cigarettes/day..................... 87 Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_8 "13.8 In your entire life, have you had at least 12 alcoholic beverages of any kind?"

label variable s_13_9 "13.9 Do you currently drink alcoholic beverages of any kind?"

label variable s_13_10 "13.10 How many alcoholic beverages do you usually drink in a week? (Instructions to Interviewer: 1 bottle of rum 750ml = 16 drinks; 1 bottle of wine = 7 drinks) Record Number of drinks.........|_|_| Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_11 "13.11 During the period when you drank the most alcohol, how many alcoholic drinks did you have in an average week? (Instructions to Interviewer: 1 bottle of rum 750ml = 16 drinks; 1 bottle of wine = 7 drinks) Record Average.........|_|_| Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_12 "13.12 Has there been a period of several years when you would have said you were a heavy drinker?"

label variable s_13_13 "13.13 How often do you eat meat?"

label variable s_13_14 "13.14 How often do you eat fish?"

label variable s_13_15 "13.15 How often do you eat fruit?"

label variable s_13_16 "13.16 How often do you eat vegetables?"

label variable s_13_17 "13.17 How often do you have soda (for example – Coca Cola, Fanta, etc.)?"

label variable s_13_18 "13.18 Considering both work and leisure, would you say you are"

label variable s_13_19 "13.19 Have you gone for walks of half a kilometer or more in the last month? (Which would usually by CONTINUOUS walking for at least 10-15 minutes)"

label variable s_13_20 "13.20 In the last month, how many times have you gone for walks of half a kilometer or more? (Which would usually be CONTINUOUS walking for at least 10-15 minutes) Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_22 "13.22 On average during the last year, have you done exercise or heavy physical work three times a week or more? Include various activities like sports, heavy housework or other physical labor"

label variable s_13_23_p "13.23 What is your current weight? Record weight in pounds Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_23_d_c "13.23 What is your current weight? Record weight in kilograms (if respond in pounds, divide by 2.2) Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_24 "13.24 According to these images, what do you think you look like today? SHOW BODY IMAGE CARD RECORD NUMBER Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_25_d_c "13.25 What was your weight at the age of 25? Record weight in kilograms (if respond in pounds, divide by 2.2) Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_25_p "13.25 What was your weight at the age of 25? Record weight in pounds Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_26 "13.26 According to these images, what do you think you looked like at that time? SHOW BODY IMAGE CARD RECORD NUMBER.............................|_|_| Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_27_d_c "13.27 What was your maximum weight during your life (if female, do not include pregnancies)? Record weight in kilograms (if respond in pounds, divide by 2.2) Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_27_p "13.27 What was your maximum weight during your life (if female, do not include pregnancies)? Record weight in pounds Does not respond...................................... 888 Does not know................................................. 999"

label variable s_13_28 "13.28 According to these images, how do you think you looked at that time? SHOW BODY IMAGE CARD RECORD NUMBER Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_29 "13.29 How old were you when you reached that maximum weight? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_13_30_d_c "13.30 In the last 6 months, have you lost more than 5 kilograms of weight without trying?"

label variable s_13_30_p "13.30 In the last 6 months, have you lost more than 10 pounds of weight without trying?"

label variable s_14_1_p_d "14.1 Do you have a health plan?"

label variable s_14_2a_p "Government card, Mi salud o Vital"

label variable s_14_2b_p "Medicare Part A"

label variable s_14_2c_p "Medicare part B"

label variable s_14_2d_p "Medicare part D"

label variable s_14_2e_p "A Medicare Supplement plan"

label variable s_14_2f_p "A Medicare Advantage plan"

label variable s_14_2g_p "A private individual health plan"

label variable s_14_2h_p "Other"

label variable s_14_2i_p "Does not respond"

label variable s_14_2j_p "Does not know"

label variable s_14_2a_d "SENASA"

label variable s_14_2b_d "SENASA – subsidized"

label variable s_14_2c_d "A private individual health plan"

label variable s_14_2d_d "A private plan through an employer"

label variable s_14_2e_d "Other"

label variable s_14_2f_d "Does not respond"

label variable s_14_2g_d "Does not know"

label variable s_14_3 "14.3 In the last three months have you visited or consulted a general doctor, like primary care or family doctor?"

label variable s_14_4 "14.4 Total number of consults in last three months REGISTER NUMBER............................|_|_|_|_| Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_5 "14.5 Typically, in each consultation with your regular doctor, how much time is spent traveling (minutes)? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_6 "14.6 Typically, in each consultation with your regular doctor, how much money is spent traveling? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_8 "14.8 Typically, in each consultation with your regular doctor, how much time is spent waiting for consult (minutes)?  Does not respond……………………………….. 888 Does not know…………………………………………. 999"

label variable s_14_9 "14.9 Typically, in each consultation with your regular doctor, how much is paid? [You or your family, not including costs paid for by health insurance] Does not respond……………………………….. 888 Does not know…………………………………………. 999"

label variable s_14_11 "14.11 In the last year, about how many times have you visited or consulted with a doctor or health professional? (Does not include hospital stays) Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_12 "14.12 Including all visits to the doctor or health professionals, how much was paid for these visits in the last year? [You or your family, not including costs paid for by health insurance] Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_13 "14.13 In the last year, about how many times did you have to have surgical procedures done without being admitted to the hospital? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_14 "14.14 Including all the surgical procedures without being admitted to the hospital, how much did you pay for these consultations? [You or your family, not including costs paid for by health insurance. Do not include costs already mentioned in 14.12]"

label variable s_14_15 "14.15 In the last year, how many times have you seen a dentist? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_16 "14.16 Including all visits with a dentist, how much was paid for these visits in the last year? [You or your family, not including costs paid for by health insurance] Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_17 "14.17 In the last year, did you ever think you had a serious health problem but didn't go to the doctor?"

label variable s_14_18_1 "14.18.1 Thought it would not help you get better"

label variable s_14_18_2 "14.18.2 Thought it would take a long time to get there"

label variable s_14_18_3 "14.18.3 Did not have money"

label variable s_14_18_4 "14.18.4 Did not want to bother someone to take them"

label variable s_14_18_5 "14.18.5 Afraid of what doctor would find"

label variable s_14_18_6 "14.18.6 Afraid of COVID"

label variable s_14_20 "14.20 Including all the times in the last year, how many nights have you spent in a hospital? Number of nights....................................................00 Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_22 "14.22 Including all the times in the last year, how much was paid for these hospital stays? [You or your family, does not include costs paid by health insurance] Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_23 "14.23 In addition to hospitals, other facilities care for people when they are sick and/or recovering. Have you had another residential stay in the last year?"

label variable s_14_24 "14.24 Including all the times in the last year, how many nights have you spent in this facility? Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_25 "14.25 Including all the times in the last year, how much was paid for these stays? [You or your family, does not include costs paid by health insurance] Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_30a "14.30a Approximately how much was spent in total on these medicines and remedies in the last month? [Payment made by you or your family, not including costs paid by health insurance. Only count the medicines destined for your own use (not that of other family members)] Does not respond...................................... 88 Does not know................................................. 99"

label variable s_14_30b1_p "14.30b.1 Would you say that total costs were more than $100?"

label variable s_14_30b1_d "14.30b.1 Would you say that total costs were more than 5000 pesos?"

label variable S_14_30B1_C "14.30b.1 Would you say that total costs were more than 1250 CUP?"

label variable s_14_30b2_p "14.30b2 Would you say that total costs were more than $50?"

label variable s_14_30b2_d "14.30b2 Would you say that total costs were more than 2500 pesos?"

label variable S_14_30B2_C "14.30b2 Would you say that total costs were more than 125 CUP?"

label variable s_14_30b3_p "14.30b3 Would you say that total costs were more than $200?"

label variable s_14_30b3_d "14.30b3 Would you say that total costs were more than 10,000 pesos?"

label variable S_14_30B3_C "14.30b3 Would you say that total costs were more than 4500 CUP?"

label variable s_14_31 "14.31 Have you been vaccinated against COVID?"

label variable s_14_32 "14.32 How many doses have you received?"

label variable s_14_33 "14.33 Have you ever had COVID?"

label variable s_15_1 "15.1 This sociodemographic risk factor interview was conducted with:"

label variable s_15_2 "15.2 What relationship does the proxy have with (xxx)?"

label variable s_15_3 "15.3 General confidence in data"

label variable s_deviceid2 "Device ID:"

*here we are renaming all checkboxes to checked/unchecked

label define checkbox_label 0 "unchecked" 1 "checked", replace

label values s_7_7a checkbox_label

label values s_7_7b checkbox_label

label values s_7_7c checkbox_label

label values s_7_7d checkbox_label

label values s_7_7e checkbox_label

label values s_7_7f checkbox_label

label values s_7_7g checkbox_label

label values s_7_7h checkbox_label

label values s_7_7i checkbox_label

label values s_7_7j checkbox_label

label values s_7_7k checkbox_label

label values s_8_5b2 checkbox_label

label values s_8_5b1 checkbox_label

label values s_8_5b4 checkbox_label

label values s_8_5b3 checkbox_label

label values s_8_5b5 checkbox_label

label values s_8_5b6 checkbox_label

label values s_8_5b7 checkbox_label

label values s_8_5b8 checkbox_label

label values s_8_5b9 checkbox_label

label values s_9_38a checkbox_label

label values s_9_38g checkbox_label

label values s_9_38b checkbox_label

label values s_9_38f checkbox_label

label values s_9_38c checkbox_label

label values s_9_38d checkbox_label

label values s_9_38j checkbox_label

label values s_9_38e checkbox_label

label values s_9_38k checkbox_label

label values s_9_38h checkbox_label

label values s_9_38l checkbox_label

label values s_9_38i checkbox_label

label values s_14_2a_p checkbox_label

label values s_14_2b_p checkbox_label

label values s_14_2c_p checkbox_label

label values s_14_2d_p checkbox_label

label values s_14_2e_p checkbox_label

label values s_14_2f_p checkbox_label

label values s_14_2g_p checkbox_label

label values s_14_2h_p checkbox_label

label values s_14_2i_p checkbox_label

label values s_14_2j_p checkbox_label

label values s_14_2a_d checkbox_label

label values s_14_2b_d checkbox_label

label values s_14_2c_d checkbox_label

label values s_14_2d_d checkbox_label

label values s_14_2e_d checkbox_label

label values s_14_2f_d checkbox_label

label values s_14_2g_d checkbox_label

save Socio.dta, replace
