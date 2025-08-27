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
    use using "`path'/PR_out/Household"
}
else if `country' == 1 {
    use using "`path'/DR_out/Household"
}
else if `country' == 2 {
    use using "`path'/CUBA_out/Household"
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
    insheet using "../PR_out/Household"
}
else if `country' == 1 {
    use using "../DR_out/Household"
}
else if `country' == 2 {
    insheet using "../CUBA_out/Household"
}
}

label drop _all

capture label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values h_country country_label

capture confirm numeric variable H_3_1
if !_rc{
     tostring H_3_1, replace
}

capture label define H_3_1 .a"." 1 "Own" 2 "Rent" 3 "Other" 

capture confirm numeric variable H_3_3A_P
if !_rc{
     tostring H_3_3A_P, replace
}

capture capture label define H_3_3A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"

capture confirm numeric variable H_3_3A_D
if !_rc{
     tostring H_3_3A_D, replace
}

capture capture label define H_3_3A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"

capture confirm numeric variable H_3_3A_C
if !_rc{
     tostring H_3_3A_C, replace
}

capture capture label define H_3_3A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"

capture confirm numeric variable H_3_3B_P
if !_rc{
     tostring H_3_3B_P, replace
}

capture capture label define H_3_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_3B_D
if !_rc{
     tostring H_3_3B_D, replace
}

capture capture label define H_3_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_3B_C
if !_rc{
     tostring H_3_3B_C, replace
}

capture capture label define H_3_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_3C_P
if !_rc{
     tostring H_3_3C_P, replace
}

capture capture label define H_3_3C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_3C_D
if !_rc{
     tostring H_3_3C_D, replace
}

capture capture label define H_3_3C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_3C_C
if !_rc{
     tostring H_3_3C_C, replace
}

capture capture label define H_3_3C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5A_P
if !_rc{
     tostring H_3_5A_P, replace
}

capture label define H_3_5A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5A_D
if !_rc{
     tostring H_3_5A_D, replace
}

capture label define H_3_5A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5A_C
if !_rc{
     tostring H_3_5A_C, replace
}

capture label define H_3_5A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5B_P
if !_rc{
     tostring H_3_5B_P, replace
}

capture label define H_3_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5B_D
if !_rc{
     tostring H_3_5B_D, replace
}

capture label define H_3_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5B_C
if !_rc{
     tostring H_3_5B_C, replace
}

capture label define H_3_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5C_P
if !_rc{
     tostring H_3_5C_P, replace
}

capture label define H_3_5C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5C_D
if !_rc{
     tostring H_3_5C_D, replace
}

capture label define H_3_5C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_5C_C
if !_rc{
     tostring H_3_5C_C, replace
}

capture label define H_3_5C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7A_P
if !_rc{
     tostring H_3_7A_P, replace
}

capture label define H_3_7A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7A_D
if !_rc{
     tostring H_3_7A_D, replace
}

capture label define H_3_7A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7A_C
if !_rc{
     tostring H_3_7A_C, replace
}

capture label define H_3_7A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7B_P
if !_rc{
     tostring H_3_7B_P, replace
}

capture label define H_3_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7B_D
if !_rc{
     tostring H_3_7B_D, replace
}

capture label define H_3_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7B_C
if !_rc{
     tostring H_3_7B_C, replace
}

capture label define H_3_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7C_P
if !_rc{
     tostring H_3_7C_P, replace
}

capture label define H_3_7C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7C_D
if !_rc{
     tostring H_3_7C_D, replace
}

capture label define H_3_7C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_7C_C
if !_rc{
     tostring H_3_7C_C, replace
}

capture label define H_3_7C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_8
if !_rc{
     tostring H_3_8, replace
}

capture label define H_3_8 .a"." 1 "Concrete" 2 "Tile" 3 "Wood" 4 "Tin" 5 "Other" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable N10ENESTAVIVIENDATIENEN
if !_rc{
     tostring N10ENESTAVIVIENDATIENEN, replace
}

capture label define N10ENESTAVIVIENDATIENEN .a"." 1 "Piped water inside the home?" 2 "Piped water outside the home but within the property?" 3 "Other piped water?" 4 "Non-piped water (well, river, other)?" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_11
if !_rc{
     tostring H_3_11, replace
}

capture label define H_3_11 .a"." 1 "Have a water connection?" 2 "Filled with a water bucket?" 3 "Not filled with water? (latrine)" 4 "Does not have" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_12
if !_rc{
     tostring H_3_12, replace
}

capture label define H_3_12 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable S_3_13
if !_rc{
     tostring S_3_13, replace
}

capture label define S_3_13 .a"." 1 "Gas" 2 "Wood or coal" 3 "Electricity" 4 "Other" 8 "Does not respond"9 "Does not know"

*changing s to h here


capture confirm numeric variable H_3_14_1
if !_rc{
     tostring H_3_14_1, replace
}

capture label define H_3_14_1 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_2
if !_rc{
     tostring H_3_14_2, replace
}

capture label define H_3_14_2 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_3
if !_rc{
     tostring H_3_14_3, replace
}

capture label define H_3_14_3 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_4
if !_rc{
     tostring H_3_14_4, replace
}

capture label define H_3_14_4 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_5
if !_rc{
     tostring H_3_14_5, replace
}

capture label define H_3_14_5 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_6
if !_rc{
     tostring H_3_14_6, replace
}

capture label define H_3_14_6 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_7
if !_rc{
     tostring H_3_14_7, replace
}

capture label define H_3_14_7 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_8
if !_rc{
     tostring H_3_14_8, replace
}

capture label define H_3_14_8 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_9
if !_rc{
     tostring H_3_14_9, replace
}

capture label define H_3_14_9 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_10
if !_rc{
     tostring H_3_14_10, replace
}

capture label define H_3_14_10 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_11
if !_rc{
     tostring H_3_14_11, replace
}

capture label define H_3_14_11 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_14_12
if !_rc{
     tostring H_3_14_12, replace
}

capture label define H_3_14_12 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17A_P
if !_rc{
     tostring H_3_17A_P, replace
}

capture label define H_3_17A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17A_D
if !_rc{
     tostring H_3_17A_D, replace
}

capture label define H_3_17A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17A_C
if !_rc{
     tostring H_3_17A_C, replace
}

capture label define H_3_17A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17B_P
if !_rc{
     tostring H_3_17B_P, replace
}

capture label define H_3_17B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17B_D
if !_rc{
     tostring H_3_17B_D, replace
}

capture label define H_3_17B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17B_C
if !_rc{
     tostring H_3_17B_C, replace
}

capture label define H_3_17B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17C_P
if !_rc{
     tostring H_3_17C_P, replace
}

capture label define H_3_17C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17C_D
if !_rc{
     tostring H_3_17C_D, replace
}

capture label define H_3_17C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_17C_C
if !_rc{
     tostring H_3_17C_C, replace
}

capture label define H_3_17C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_18
if !_rc{
     tostring H_3_18, replace
}

capture label define H_3_18 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20A_P
if !_rc{
     tostring H_3_20A_P, replace
}

capture label define H_3_20A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20A_D
if !_rc{
     tostring H_3_20A_D, replace
}

capture label define H_3_20A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20A_C
if !_rc{
     tostring H_3_20A_C, replace
}

capture label define H_3_20A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20B_P
if !_rc{
     tostring H_3_20B_P, replace
}

capture label define H_3_20B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20B_D
if !_rc{
     tostring H_3_20B_D, replace
}

capture label define H_3_20B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20B_C
if !_rc{
     tostring H_3_20B_C, replace
}

capture label define H_3_20B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20C_P
if !_rc{
     tostring H_3_20C_P, replace
}

capture label define H_3_20C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20C_D
if !_rc{
     tostring H_3_20C_D, replace
}

capture label define H_3_20C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_20C_C
if !_rc{
     tostring H_3_20C_C, replace
}

capture label define H_3_20C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_21
if !_rc{
     tostring H_3_21, replace
}

capture label define H_3_21 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23A_P
if !_rc{
     tostring H_3_23A_P, replace
}

capture label define H_3_23A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23A_D
if !_rc{
     tostring H_3_23A_D, replace
}

capture label define H_3_23A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23A_C
if !_rc{
     tostring H_3_23A_C, replace
}

capture label define H_3_23A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23B_P
if !_rc{
     tostring H_3_23B_P, replace
}

capture label define H_3_23B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23B_D
if !_rc{
     tostring H_3_23B_D, replace
}

capture label define H_3_23B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23B_C
if !_rc{
     tostring H_3_23B_C, replace
}

capture label define H_3_23B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23C_P
if !_rc{
     tostring H_3_23C_P, replace
}

capture label define H_3_23C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23C_D
if !_rc{
     tostring H_3_23C_D, replace
}

capture label define H_3_23C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_23C_C
if !_rc{
     tostring H_3_23C_C, replace
}

capture label define H_3_23C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_24
if !_rc{
     tostring H_3_24, replace
}

capture label define H_3_24 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26A_P
if !_rc{
     tostring H_3_26A_P, replace
}

capture label define H_3_26A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26A_D
if !_rc{
     tostring H_3_26A_D, replace
}

capture label define H_3_26A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26A_C
if !_rc{
     tostring H_3_26A_C, replace
}

capture label define H_3_26A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26B_P
if !_rc{
     tostring H_3_26B_P, replace
}

capture label define H_3_26B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26B_D
if !_rc{
     tostring H_3_26B_D, replace
}

capture label define H_3_26B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26B_C
if !_rc{
     tostring H_3_26B_C, replace
}

capture label define H_3_26B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26C_P
if !_rc{
     tostring H_3_26C_P, replace
}

capture label define H_3_26C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26C_D
if !_rc{
     tostring H_3_26C_D, replace
}

capture label define H_3_26C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_26C_C
if !_rc{
     tostring H_3_26C_C, replace
}

capture label define H_3_26C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28A_P
if !_rc{
     tostring H_3_28A_P, replace
}

capture label define H_3_28A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28A_D
if !_rc{
     tostring H_3_28A_D, replace
}

capture label define H_3_28A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28A_C
if !_rc{
     tostring H_3_28A_C, replace
}

capture label define H_3_28A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28B_P
if !_rc{
     tostring H_3_28B_P, replace
}

capture label define H_3_28B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28B_D
if !_rc{
     tostring H_3_28B_D, replace
}

capture label define H_3_28B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28B_C
if !_rc{
     tostring H_3_28B_C, replace
}

capture label define H_3_28B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28C_P
if !_rc{
     tostring H_3_28C_P, replace
}

capture label define H_3_28C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28C_D
if !_rc{
     tostring H_3_28C_D, replace
}

capture label define H_3_28C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_28C_C
if !_rc{
     tostring H_3_28C_C, replace
}

capture label define H_3_28C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_29
if !_rc{
     tostring H_3_29, replace
}

capture label define H_3_29 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31A_P
if !_rc{
     tostring H_3_31A_P, replace
}

capture label define H_3_31A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31A_D
if !_rc{
     tostring H_3_31A_D, replace
}

capture label define H_3_31A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31A_C
if !_rc{
     tostring H_3_31A_C, replace
}

capture label define H_3_31A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31B_P
if !_rc{
     tostring H_3_31B_P, replace
}

capture label define H_3_31B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31B_D
if !_rc{
     tostring H_3_31B_D, replace
}

capture label define H_3_31B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31B_C
if !_rc{
     tostring H_3_31B_C, replace
}

capture label define H_3_31B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31C_P
if !_rc{
     tostring H_3_31C_P, replace
}

capture label define H_3_31C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31C_D
if !_rc{
     tostring H_3_31C_D, replace
}

capture label define H_3_31C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_31C_C
if !_rc{
     tostring H_3_31C_C, replace
}

capture label define H_3_31C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33A_P
if !_rc{
     tostring H_3_33A_P, replace
}

capture label define H_3_33A_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33A_D
if !_rc{
     tostring H_3_33A_D, replace
}

capture label define H_3_33A_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33A_C
if !_rc{
     tostring H_3_33A_C, replace
}

capture label define H_3_33A_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33B_P
if !_rc{
     tostring H_3_33B_P, replace
}

capture label define H_3_33B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33B_D
if !_rc{
     tostring H_3_33B_D, replace
}

capture label define H_3_33B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33B_C
if !_rc{
     tostring H_3_33B_C, replace
}

capture label define H_3_33B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33C_P
if !_rc{
     tostring H_3_33C_P, replace
}

capture label define H_3_33C_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33C_D
if !_rc{
     tostring H_3_33C_D, replace
}

capture label define H_3_33C_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_33C_C
if !_rc{
     tostring H_3_33C_C, replace
}

capture label define H_3_33C_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_3_34
if !_rc{
     tostring H_3_34, replace
}

capture label define H_3_34 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1
if !_rc{
     tostring H_4_1, replace
}

capture label define H_4_1 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B_P
if !_rc{
     tostring H_4_1B_P, replace
}

capture label define H_4_1B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B_D
if !_rc{
     tostring H_4_1B_D, replace
}

capture label define H_4_1B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B_C
if !_rc{
     tostring H_4_1B_C, replace
}

capture label define H_4_1B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B2_P
if !_rc{
     tostring H_4_1B2_P, replace
}

capture label define H_4_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B2_D
if !_rc{
     tostring H_4_1B2_D, replace
}

capture label define H_4_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B2_C
if !_rc{
     tostring H_4_1B2_C, replace
}

capture label define H_4_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B3_P
if !_rc{
     tostring H_4_1B3_P, replace
}

capture label define H_4_1B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B3_D
if !_rc{
     tostring H_4_1B3_D, replace
}

capture label define H_4_1B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_1B3_C
if !_rc{
     tostring H_4_1B3_C, replace
}

capture label define H_4_1B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2
if !_rc{
     tostring H_4_2, replace
}

capture label define H_4_2 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B_P
if !_rc{
     tostring H_4_2B_P, replace
}

capture label define H_4_2B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B_D
if !_rc{
     tostring H_4_2B_D, replace
}

capture label define H_4_2B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B_C
if !_rc{
     tostring H_4_2B_C, replace
}

capture label define H_4_2B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B2_P
if !_rc{
     tostring H_4_2B2_P, replace
}

capture label define H_4_2B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B2_D
if !_rc{
     tostring H_4_2B2_D, replace
}

capture label define H_4_2B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B2_C
if !_rc{
     tostring H_4_2B2_C, replace
}

capture label define H_4_2B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B3_P
if !_rc{
     tostring H_4_2B3_P, replace
}

capture label define H_4_2B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B3_D
if !_rc{
     tostring H_4_2B3_D, replace
}

capture label define H_4_2B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_2B3_C
if !_rc{
     tostring H_4_2B3_C, replace
}

capture label define H_4_2B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3
if !_rc{
     tostring H_4_3, replace
}

capture label define H_4_3 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B_P
if !_rc{
     tostring H_4_3B_P, replace
}

capture label define H_4_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B_D
if !_rc{
     tostring H_4_3B_D, replace
}

capture label define H_4_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B_C
if !_rc{
     tostring H_4_3B_C, replace
}

capture label define H_4_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B2_P
if !_rc{
     tostring H_4_3B2_P, replace
}

capture label define H_4_3B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B2_D
if !_rc{
     tostring H_4_3B2_D, replace
}

capture label define H_4_3B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B2_C
if !_rc{
     tostring H_4_3B2_C, replace
}

capture label define H_4_3B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B3_P
if !_rc{
     tostring H_4_3B3_P, replace
}

capture label define H_4_3B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B3_D
if !_rc{
     tostring H_4_3B3_D, replace
}

capture label define H_4_3B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_3B3_C
if !_rc{
     tostring H_4_3B3_C, replace
}

capture label define H_4_3B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4
if !_rc{
     tostring H_4_4, replace
}

capture label define H_4_4 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B_P
if !_rc{
     tostring H_4_4B_P, replace
}

capture label define H_4_4B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B_D
if !_rc{
     tostring H_4_4B_D, replace
}

capture label define H_4_4B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B_C
if !_rc{
     tostring H_4_4B_C, replace
}

capture label define H_4_4B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B2_P
if !_rc{
     tostring H_4_4B2_P, replace
}

capture label define H_4_4B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B2_D
if !_rc{
     tostring H_4_4B2_D, replace
}

capture label define H_4_4B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B2_C
if !_rc{
     tostring H_4_4B2_C, replace
}

capture label define H_4_4B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B3_P
if !_rc{
     tostring H_4_4B3_P, replace
}

capture label define H_4_4B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B3_D
if !_rc{
     tostring H_4_4B3_D, replace
}

capture label define H_4_4B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_4B3_C
if !_rc{
     tostring H_4_4B3_C, replace
}

capture label define H_4_4B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5
if !_rc{
     tostring H_4_5, replace
}

capture label define H_4_5 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B_P
if !_rc{
     tostring H_4_5B_P, replace
}

capture label define H_4_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B_D
if !_rc{
     tostring H_4_5B_D, replace
}

capture label define H_4_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B_C
if !_rc{
     tostring H_4_5B_C, replace
}

capture label define H_4_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B2_P
if !_rc{
     tostring H_4_5B2_P, replace
}

capture label define H_4_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B2_D
if !_rc{
     tostring H_4_5B2_D, replace
}

capture label define H_4_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B2_C
if !_rc{
     tostring H_4_5B2_C, replace
}

capture label define H_4_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B3_P
if !_rc{
     tostring H_4_5B3_P, replace
}

capture label define H_4_5B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B3_D
if !_rc{
     tostring H_4_5B3_D, replace
}

capture label define H_4_5B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_5B3_C
if !_rc{
     tostring H_4_5B3_C, replace
}

capture label define H_4_5B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6
if !_rc{
     tostring H_4_6, replace
}

capture label define H_4_6 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B_P
if !_rc{
     tostring H_4_6B_P, replace
}

capture label define H_4_6B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B_D
if !_rc{
     tostring H_4_6B_D, replace
}

capture label define H_4_6B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B_C
if !_rc{
     tostring H_4_6B_C, replace
}

capture label define H_4_6B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B2_P
if !_rc{
     tostring H_4_6B2_P, replace
}

capture label define H_4_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B2_D
if !_rc{
     tostring H_4_6B2_D, replace
}

capture label define H_4_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B2_C
if !_rc{
     tostring H_4_6B2_C, replace
}

capture label define H_4_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B3_P
if !_rc{
     tostring H_4_6B3_P, replace
}

capture label define H_4_6B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B3_D
if !_rc{
     tostring H_4_6B3_D, replace
}

capture label define H_4_6B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_6B3_C
if !_rc{
     tostring H_4_6B3_C, replace
}

capture label define H_4_6B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7
if !_rc{
     tostring H_4_7, replace
}

capture label define H_4_7 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B_P
if !_rc{
     tostring H_4_7B_P, replace
}

capture label define H_4_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B_D
if !_rc{
     tostring H_4_7B_D, replace
}

capture label define H_4_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B_C
if !_rc{
     tostring H_4_7B_C, replace
}

capture label define H_4_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B2_P
if !_rc{
     tostring H_4_7B2_P, replace
}

capture label define H_4_7B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B2_D
if !_rc{
     tostring H_4_7B2_D, replace
}

capture label define H_4_7B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_7B2_C
if !_rc{
     tostring H_4_7B2_C, replace
}

capture label define H_4_7B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8
if !_rc{
     tostring H_4_8, replace
}

capture label define H_4_8 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B_P
if !_rc{
     tostring H_4_8B_P, replace
}

capture label define H_4_8B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B_D
if !_rc{
     tostring H_4_8B_D, replace
}

capture label define H_4_8B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B_C
if !_rc{
     tostring H_4_8B_C, replace
}

capture label define H_4_8B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B2_P
if !_rc{
     tostring H_4_8B2_P, replace
}

capture label define H_4_8B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B2_D
if !_rc{
     tostring H_4_8B2_D, replace
}

capture label define H_4_8B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_4_8B2_C
if !_rc{
     tostring H_4_8B2_C, replace
}

capture label define H_4_8B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5
if !_rc{
     tostring H_5, replace
}

capture label define H_5 .a"." 2 "Yes" 1 "No" 



capture confirm numeric variable H_5_1
if !_rc{
     tostring H_5_1, replace
}

capture label define H_5_1 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B_P
if !_rc{
     tostring H_5_1B_P, replace
}

capture label define H_5_1B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B_D
if !_rc{
     tostring H_5_1B_D, replace
}

capture label define H_5_1B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B_C
if !_rc{
     tostring H_5_1B_C, replace
}

capture label define H_5_1B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B2_P
if !_rc{
     tostring H_5_1B2_P, replace
}

capture label define H_5_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B2_D
if !_rc{
     tostring H_5_1B2_D, replace
}

capture label define H_5_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B2_C
if !_rc{
     tostring H_5_1B2_C, replace
}

capture label define H_5_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B3_P
if !_rc{
     tostring H_5_1B3_P, replace
}

capture label define H_5_1B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B3_D
if !_rc{
     tostring H_5_1B3_D, replace
}

capture label define H_5_1B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_1B3_C
if !_rc{
     tostring H_5_1B3_C, replace
}

capture label define H_5_1B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2
if !_rc{
     tostring H_5_2, replace
}

capture label define H_5_2 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B_P
if !_rc{
     tostring H_5_2B_P, replace
}

capture label define H_5_2B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B_D
if !_rc{
     tostring H_5_2B_D, replace
}

capture label define H_5_2B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B_C
if !_rc{
     tostring H_5_2B_C, replace
}

capture label define H_5_2B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B2_P
if !_rc{
     tostring H_5_2B2_P, replace
}

capture label define H_5_2B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B2_D
if !_rc{
     tostring H_5_2B2_D, replace
}

capture label define H_5_2B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B2_C
if !_rc{
     tostring H_5_2B2_C, replace
}

capture label define H_5_2B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B3_P
if !_rc{
     tostring H_5_2B3_P, replace
}

capture label define H_5_2B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B3_D
if !_rc{
     tostring H_5_2B3_D, replace
}

capture label define H_5_2B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_2B3_C
if !_rc{
     tostring H_5_2B3_C, replace
}

capture label define H_5_2B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3
if !_rc{
     tostring H_5_3, replace
}

capture label define H_5_3 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B_P
if !_rc{
     tostring H_5_3B_P, replace
}

capture label define H_5_3B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B_D
if !_rc{
     tostring H_5_3B_D, replace
}

capture label define H_5_3B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B_C
if !_rc{
     tostring H_5_3B_C, replace
}

capture label define H_5_3B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B2_P
if !_rc{
     tostring H_5_3B2_P, replace
}

capture label define H_5_3B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B2_D
if !_rc{
     tostring H_5_3B2_D, replace
}

capture label define H_5_3B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B2_C
if !_rc{
     tostring H_5_3B2_C, replace
}

capture label define H_5_3B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B3_P
if !_rc{
     tostring H_5_3B3_P, replace
}

capture label define H_5_3B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B3_D
if !_rc{
     tostring H_5_3B3_D, replace
}

capture label define H_5_3B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_3B3_C
if !_rc{
     tostring H_5_3B3_C, replace
}

capture label define H_5_3B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4
if !_rc{
     tostring H_5_4, replace
}

capture label define H_5_4 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B_P
if !_rc{
     tostring H_5_4B_P, replace
}

capture label define H_5_4B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B_D
if !_rc{
     tostring H_5_4B_D, replace
}

capture label define H_5_4B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B_C
if !_rc{
     tostring H_5_4B_C, replace
}

capture label define H_5_4B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B2_P
if !_rc{
     tostring H_5_4B2_P, replace
}

capture label define H_5_4B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B2_D
if !_rc{
     tostring H_5_4B2_D, replace
}

capture label define H_5_4B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B2_C
if !_rc{
     tostring H_5_4B2_C, replace
}

capture label define H_5_4B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B3_P
if !_rc{
     tostring H_5_4B3_P, replace
}

capture label define H_5_4B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B3_D
if !_rc{
     tostring H_5_4B3_D, replace
}

capture label define H_5_4B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_4B3_C
if !_rc{
     tostring H_5_4B3_C, replace
}

capture label define H_5_4B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5
if !_rc{
     tostring H_5_5, replace
}

capture label define H_5_5 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B_P
if !_rc{
     tostring H_5_5B_P, replace
}

capture label define H_5_5B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B_D
if !_rc{
     tostring H_5_5B_D, replace
}

capture label define H_5_5B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B_C
if !_rc{
     tostring H_5_5B_C, replace
}

capture label define H_5_5B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B2_P
if !_rc{
     tostring H_5_5B2_P, replace
}

capture label define H_5_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B2_D
if !_rc{
     tostring H_5_5B2_D, replace
}

capture label define H_5_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B2_C
if !_rc{
     tostring H_5_5B2_C, replace
}

capture label define H_5_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B3_P
if !_rc{
     tostring H_5_5B3_P, replace
}

capture label define H_5_5B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B3_D
if !_rc{
     tostring H_5_5B3_D, replace
}

capture label define H_5_5B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_5B3_C
if !_rc{
     tostring H_5_5B3_C, replace
}

capture label define H_5_5B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6
if !_rc{
     tostring H_5_6, replace
}

capture label define H_5_6 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B_P
if !_rc{
     tostring H_5_6B_P, replace
}

capture label define H_5_6B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B_D
if !_rc{
     tostring H_5_6B_D, replace
}

capture label define H_5_6B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B_C
if !_rc{
     tostring H_5_6B_C, replace
}

capture label define H_5_6B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B2_P
if !_rc{
     tostring H_5_6B2_P, replace
}

capture label define H_5_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B2_D
if !_rc{
     tostring H_5_6B2_D, replace
}

capture label define H_5_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B2_C
if !_rc{
     tostring H_5_6B2_C, replace
}

capture label define H_5_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B3_P
if !_rc{
     tostring H_5_6B3_P, replace
}

capture label define H_5_6B3_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B3_D
if !_rc{
     tostring H_5_6B3_D, replace
}

capture label define H_5_6B3_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_6B3_C
if !_rc{
     tostring H_5_6B3_C, replace
}

capture label define H_5_6B3_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7
if !_rc{
     tostring H_5_7, replace
}

capture label define H_5_7 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B_P
if !_rc{
     tostring H_5_7B_P, replace
}

capture label define H_5_7B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B_D
if !_rc{
     tostring H_5_7B_D, replace
}

capture label define H_5_7B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B_C
if !_rc{
     tostring H_5_7B_C, replace
}

capture label define H_5_7B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B2_P
if !_rc{
     tostring H_5_7B2_P, replace
}

capture label define H_5_7B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B2_D
if !_rc{
     tostring H_5_7B2_D, replace
}

capture label define H_5_7B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_7B2_C
if !_rc{
     tostring H_5_7B2_C, replace
}

capture label define H_5_7B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8
if !_rc{
     tostring H_5_8, replace
}

capture label define H_5_8 .a"." 1 "Yes" 0 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B_P
if !_rc{
     tostring H_5_8B_P, replace
}

capture label define H_5_8B_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B_D
if !_rc{
     tostring H_5_8B_D, replace
}

capture label define H_5_8B_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B_C
if !_rc{
     tostring H_5_8B_C, replace
}

capture label define H_5_8B_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B2_P
if !_rc{
     tostring H_5_8B2_P, replace
}

capture label define H_5_8B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B2_D
if !_rc{
     tostring H_5_8B2_D, replace
}

capture label define H_5_8B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_5_8B2_C
if !_rc{
     tostring H_5_8B2_C, replace
}

capture label define H_5_8B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1
if !_rc{
     tostring H_6_1, replace
}

capture label define H_6_1 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B1_P
if !_rc{
     tostring H_6_1B1_P, replace
}

capture label define H_6_1B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B1_D
if !_rc{
     tostring H_6_1B1_D, replace
}

capture label define H_6_1B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B1_C
if !_rc{
     tostring H_6_1B1_C, replace
}

capture label define H_6_1B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B2_P
if !_rc{
     tostring H_6_1B2_P, replace
}

capture label define H_6_1B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B2_D
if !_rc{
     tostring H_6_1B2_D, replace
}

capture label define H_6_1B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_1B2_C
if !_rc{
     tostring H_6_1B2_C, replace
}

capture label define H_6_1B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_2
if !_rc{
     tostring H_6_2, replace
}

capture label define H_6_2 .a"." 1 "More than enough?" 2 "Enough?" 3 "Not enough?" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_3
if !_rc{
     tostring H_6_3, replace
}

capture label define H_6_3 .a"." 1 "More than enough?" 2 "Enough?" 3 "Not enough?" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_41_D
if !_rc{
     tostring H_6_41_D, replace
}

capture label define H_6_41_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_42_D
if !_rc{
     tostring H_6_42_D, replace
}

capture label define H_6_42_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_43_D
if !_rc{
     tostring H_6_43_D, replace
}

capture label define H_6_43_D .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_44_P
if !_rc{
     tostring H_6_44_P, replace
}

capture label define H_6_44_P .a"." 1 "Yes, and it is already included above" 2 "Yes, and it is NOT included above" 3 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5
if !_rc{
     tostring H_6_5, replace
}

capture label define H_6_5 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B1_P
if !_rc{
     tostring H_6_5B1_P, replace
}

capture label define H_6_5B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B1_D
if !_rc{
     tostring H_6_5B1_D, replace
}

capture label define H_6_5B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B1_C
if !_rc{
     tostring H_6_5B1_C, replace
}

capture label define H_6_5B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B2_P
if !_rc{
     tostring H_6_5B2_P, replace
}

capture label define H_6_5B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B2_D
if !_rc{
     tostring H_6_5B2_D, replace
}

capture label define H_6_5B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_5B2_C
if !_rc{
     tostring H_6_5B2_C, replace
}

capture label define H_6_5B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6
if !_rc{
     tostring H_6_6, replace
}

capture label define H_6_6 .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B1_P
if !_rc{
     tostring H_6_6B1_P, replace
}

capture label define H_6_6B1_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B1_D
if !_rc{
     tostring H_6_6B1_D, replace
}

capture label define H_6_6B1_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B1_C
if !_rc{
     tostring H_6_6B1_C, replace
}

capture label define H_6_6B1_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B2_P
if !_rc{
     tostring H_6_6B2_P, replace
}

capture label define H_6_6B2_P .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B2_D
if !_rc{
     tostring H_6_6B2_D, replace
}

capture label define H_6_6B2_D .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_6_6B2_C
if !_rc{
     tostring H_6_6B2_C, replace
}

capture label define H_6_6B2_C .a"." 1 "Yes" 2 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_7_1_P_C
if !_rc{
     tostring H_7_1_P_C, replace
}

capture label define H_7_1_P_C .a"." 1 "Independent-standing house" 2 "House which shares walls with another house" 3 "Apartment" 4 "Housing constructed in open spaces and alleys" 5 "Housing shared with business" 77 "Other" 99 "Does not know"



capture confirm numeric variable H_7_1_D
if !_rc{
     tostring H_7_1_D, replace
}

capture label define H_7_1_D .a"." 1 "Independent-standing house" 2 "House which shares walls with another house" 3 "Apartment" 4 "Housing constructed in open spaces and alleys" 5 "Housing shared with business" 6 "Provisional housing, originally intended for plantation workers or disaster survivors" 77 "Other" 99 "Does not know"



capture confirm numeric variable H_7_2_1
if !_rc{
     tostring H_7_2_1, replace
}

capture label define H_7_2_1 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_7_2_2
if !_rc{
     tostring H_7_2_2, replace
}

capture label define H_7_2_2 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_7_2_3
if !_rc{
     tostring H_7_2_3, replace
}

capture label define H_7_2_3 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_7_2_4
if !_rc{
     tostring H_7_2_4, replace
}

capture label define H_7_2_4 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable H_7_2_5
if !_rc{
     tostring H_7_2_5, replace
}

capture label define H_7_2_5 .a"." 2 "Yes" 1 "No" 8 "Does not respond"9 "Does not know"


*convert missing comment legal and text values to string

capture confirm numeric variable h_deviceid1
if !_rc{
     tostring h_deviceid1, replace
}

capture confirm numeric variable h_deviceid2
if !_rc{
     tostring h_deviceid2, replace
}

*reorder

capture order hhid hhid2 h_interid h_houseid h_clustid h_houseid2 h_conglid2 h_country h_deviceid1 h_3_1 h_3_2_p h_3_2_d h_3_2_c h_3_3a_p h_3_3a_d h_3_3a_c h_3_3b_p h_3_3b_d h_3_3b_c h_3_3c_p h_3_3c_d h_3_3c_c h_3_4_p h_3_4_d h_3_4_c h_3_5a_p h_3_5a_d h_3_5a_c h_3_5b_p h_3_5b_d h_3_5b_c h_3_5c_p h_3_5c_d h_3_5c_c h_3_6_p h_3_6_d h_3_6_c h_3_7a_p h_3_7a_d h_3_7a_c h_3_7b_p h_3_7b_d h_3_7b_c h_3_7c_p h_3_7c_d h_3_7c_c h_3_8 h_3_9 n10enestaviviendatienen h_3_11 h_3_12 h_3_13 h_3_14_1 h_3_14_2 h_3_14_3 h_3_14_4 h_3_14_5 h_3_14_6 h_3_14_7 h_3_14_8 h_3_14_9 h_3_14_10 h_3_14_11 h_3_14_12 h_3_15 h_3_16_p h_3_16_d h_3_16_c h_3_17a_p h_3_17a_d h_3_17a_c h_3_17b_p h_3_17b_d h_3_17b_c h_3_17c_p h_3_17c_d h_3_17c_c h_3_18 h_3_19_p h_3_19_d h_3_19_c h_3_20a_p h_3_20a_d h_3_20a_c h_3_20b_p h_3_20b_d h_3_20b_c h_3_20c_p h_3_20c_d h_3_20c_c h_3_21 h_3_22_p h_3_22_d h_3_22_c h_3_23a_p h_3_23a_d h_3_23a_c h_3_23b_p h_3_23b_d h_3_23b_c h_3_23c_p h_3_23c_d h_3_23c_c h_3_24 h_3_25_p h_3_25_d h_3_25_c h_3_26a_p h_3_26a_d h_3_26a_c h_3_26b_p h_3_26b_d h_3_26b_c h_3_26c_p h_3_26c_d h_3_26c_c h_3_27_p h_3_27_d h_3_27_c h_3_28a_p h_3_28a_d h_3_28a_c h_3_28b_p h_3_28b_d h_3_28b_c h_3_28c_p h_3_28c_d h_3_28c_c h_3_29 h_3_30_p h_3_30_d h_3_30_c h_3_31a_p h_3_31a_d h_3_31a_c h_3_31b_p h_3_31b_d h_3_31b_c h_3_31c_p h_3_31c_d h_3_31c_c h_3_32_p h_3_32_d h_3_32_c h_3_33a_p h_3_33a_d h_3_33a_c h_3_33b_p h_3_33b_d h_3_33b_c h_3_33c_p h_3_33c_d h_3_33c_c h_3_34 h_4 h_4_1 h_4_1a h_4_1b_p h_4_1b_d h_4_1b_c h_4_1b2_p h_4_1b2_d h_4_1b2_c h_4_1b3_p h_4_1b3_d h_4_1b3_c h_4_2 h_4_2a h_4_2b_p h_4_2b_d h_4_2b_c h_4_2b2_p h_4_2b2_d h_4_2b2_c h_4_2b3_p h_4_2b3_d h_4_2b3_c h_4_3 h_4_3a h_4_3b_p h_4_3b_d h_4_3b_c h_4_3b2_p h_4_3b2_d h_4_3b2_c h_4_3b3_p h_4_3b3_d h_4_3b3_c h_4_4 h_4_4a h_4_4b_p h_4_4b_d h_4_4b_c h_4_4b2_p h_4_4b2_d h_4_4b2_c h_4_4b3_p h_4_4b3_d h_4_4b3_c h_4_5 h_4_5a h_4_5b_p h_4_5b_d h_4_5b_c h_4_5b2_p h_4_5b2_d h_4_5b2_c h_4_5b3_p h_4_5b3_d h_4_5b3_c h_4_6 h_4_6a h_4_6b_p h_4_6b_d h_4_6b_c h_4_6b2_p h_4_6b2_d h_4_6b2_c h_4_6b3_p h_4_6b3_d h_4_6b3_c h_4_7 h_4_7a h_4_7b_p h_4_7b_d h_4_7b_c h_4_7b2_p h_4_7b2_d h_4_7b2_c h_4_8 h_4_8a h_4_8b_p h_4_8b_d h_4_8b_c h_4_8b2_p h_4_8b2_d h_4_8b2_c h_5 h_5_1 h_5_1a h_5_1b_p h_5_1b_d h_5_1b_c h_5_1b2_p h_5_1b2_d h_5_1b2_c h_5_1b3_p h_5_1b3_d h_5_1b3_c h_5_2 h_5_2a h_5_2b_p h_5_2b_d h_5_2b_c h_5_2b2_p h_5_2b2_d h_5_2b2_c h_5_2b3_p h_5_2b3_d h_5_2b3_c h_5_3 h_5_3a h_5_3b_p h_5_3b_d h_5_3b_c h_5_3b2_p h_5_3b2_d h_5_3b2_c h_5_3b3_p h_5_3b3_d h_5_3b3_c h_5_4 h_5_4a h_5_4b_p h_5_4b_d h_5_4b_c h_5_4b2_p h_5_4b2_d h_5_4b2_c h_5_4b3_p h_5_4b3_d h_5_4b3_c h_5_5 h_5_5a h_5_5b_p h_5_5b_d h_5_5b_c h_5_5b2_p h_5_5b2_d h_5_5b2_c h_5_5b3_p h_5_5b3_d h_5_5b3_c h_5_6 h_5_6a h_5_6b_p h_5_6b_d h_5_6b_c h_5_6b2_p h_5_6b2_d h_5_6b2_c h_5_6b3_p h_5_6b3_d h_5_6b3_c h_5_7 h_5_7a h_5_7b_p h_5_7b_d h_5_7b_c h_5_7b2_p h_5_7b2_d h_5_7b2_c h_5_8 h_5_8a h_5_8b_p h_5_8b_d h_5_8b_c h_5_8b2_p h_5_8b2_d h_5_8b2_c h_6_1 h_6_1a_p h_6_1a_d h_6_1a_c h_6_1b1_p h_6_1b1_d h_6_1b1_c h_6_1b2_p h_6_1b2_d h_6_1b2_c h_6_2 h_6_3 h_6_41_d h_6_42_d h_6_43_d h_6_44_p h_6_5 h_6_5a_p h_6_5a_d h_6_5a_c h_6_5b1_p h_6_5b1_d h_6_5b1_c h_6_5b2_p h_6_5b2_d h_6_5b2_c h_6_6 h_6_6a_p h_6_6a_d h_6_6a_c h_6_6b1_p h_6_6b1_d h_6_6b1_c h_6_6b2_p h_6_6b2_d h_6_6b2_c h_7_1_p_c h_7_1_d h_7_2_1 h_7_2_2 h_7_2_3 h_7_2_4 h_7_2_5 h_deviceid2

*variable labels

capture label variable h_interid "Interviewer #:"

capture label variable h_houseid "House #:"

capture label variable h_clustid "Cluster #:"

capture label variable h_houseid2 "House #:"

capture label variable h_conglid2 "Cluster #:"

capture label variable h_country "Country:"

capture label variable h_deviceid1 "Device ID:"

capture label variable h_3_1 "3.1 Does the family own or rent the house?"

capture label variable h_3_2_p "3.2 If you sold it today and paid what was owed on this property (counting land and housing), how much money would you get? |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_2_d "3.2 If you sold it today and paid what was owed on this property (counting land and housing), how much money would you get? |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_2_c "3.2 If you sold it today and paid what was owed on this property (counting land and housing), how much money would you get? |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_3a_p "3.3a more than $36 000?"

capture label variable h_3_3a_d "3.3a more than $500 000 pesos?"

capture label variable h_3_3a_c "3.3a more than 1 110 000 CUP?"

capture label variable h_3_3b_p "3.3b more than $18 500?"

capture label variable h_3_3b_d "3.3b more than $250 000 pesos?"

capture label variable h_3_3b_c "3.3b more than 550 000 CUP?"

capture label variable h_3_3c_p "3.3c more than $180 000?"

capture label variable h_3_3c_d "3.3c more than $2 500 000 pesos?"

capture label variable h_3_3c_c "3.3c more than 5 500 000 CUP?"

capture label variable h_3_4_p "3.4 If the house were to be rented to another person, how much would the monthly rent be? REGISTER QUANTITY |_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_4_d "3.4 If the house were to be rented to another person, how much would the monthly rent be? REGISTER QUANTITY |_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_4_c "3.4 If the house were to be rented to another person, how much would the monthly rent be? REGISTER QUANTITY |_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_5a_p "3.5a more than $1 200 per month?"

capture label variable h_3_5a_d "3.5a more than $15 000 pesos per month?"

capture label variable h_3_5a_c "3.5a more than 35 000 CUP"

capture label variable h_3_5b_p "3.5b more than $400 per month?"

capture label variable h_3_5b_d "3.5b more than $5 000 pesos per month?"

capture label variable h_3_5b_c "3.5b more than 12 500 CUP?"

capture label variable h_3_5c_p "3.5c more than $3 600?"

capture label variable h_3_5c_d "3.5c more than $50 000 pesos?"

capture label variable h_3_5c_c "3.5c more than 110,000 CUP"

capture label variable h_3_6_p "3.6 How much rent do you pay per month? REGISTER QUANTITY |_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_6_d "3.6 How much rent do you pay per month? REGISTER QUANTITY |_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_6_c "3.6 How much rent do you pay per month? REGISTER QUANTITY |_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_7a_p "3.7a more than $1 200 per month?"

capture label variable h_3_7a_d "3.7a more than $15 000 pesos per month?"

capture label variable h_3_7a_c "3.7a more than 35 000 CUP?"

capture label variable h_3_7b_p "3.7b more than $400 per month?"

capture label variable h_3_7b_d "3.7b more than $5 000 pesos per month?"

capture label variable h_3_7b_c "3.7b more than 12 500 CUP?"

capture label variable h_3_7c_p "3.7c more than $3 600 per month?"

capture label variable h_3_7c_d "3.7c more than $50 000 pesos per month?"

capture label variable h_3_7c_c "3.7c more than 110 000 CUP?"

capture label variable h_3_8 "3.8 What material makes up most of the roof of this house?"

capture label variable h_3_9 "3.9 How many bedrooms does it have?"

capture label variable n10enestaviviendatienen "3.10 In this dwelling, is there..."


capture label variable h_3_11 "3.11 Does the toilet you use..."

capture label variable h_3_12 "3.12 Is the toilet used only by residents of this dwelling?"

capture label variable h_3_13 "3.13 The fuel that is used most to cook is..."

capture label variable h_3_14_1 "3.14.1 Television"

capture label variable h_3_14_2 "3.14.2 Refrigerator and/or Freezer"

capture label variable h_3_14_3 "3.14.3 Electricity"

capture label variable h_3_14_4 "3.14.4 Home telephone / landline"

capture label variable h_3_14_5 "3.14.5 Household member who has a cell phone"

capture label variable h_3_14_6 "3.14.6 Shower or bath with running water"

capture label variable h_3_14_7 "3.14.7 Radio"

capture label variable h_3_14_8 "3.14.8 Sewing machine"

capture label variable h_3_14_9 "3.14.9 Computer"

capture label variable h_3_14_10 "3.14.10 Internet"

capture label variable h_3_14_11 "3.14.11 Air conditioning"

capture label variable h_3_14_12 "3.14.12 Electric fan"

capture label variable h_3_15 "3.15 How many motor vehicles (cars, vans, trucks, etc.) do family members own?"

capture label variable h_3_16_p "3.16 If all these vehicles were sold today, how much would you get? |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_16_d "3.16 If all these vehicles were sold today, how much would you get? |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_16_c "3.16 If all these vehicles were sold today, how much would you get? |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_17a_p "3.17a more than $36 000?"

capture label variable h_3_17a_d "3.17a more than $500 000 pesos?"

capture label variable h_3_17a_c "3.17a more than 1 110 000 CUP?"

capture label variable h_3_17b_p "3.17b more than $18 500?"

capture label variable h_3_17b_d "3.17b more than $250 000 pesos?"

capture label variable h_3_17b_c "3.17b more than 550 000 CUP?"

capture label variable h_3_17c_p "3.17c more than $100 000?"

capture label variable h_3_17c_d "3.17c more than $1 400 000 pesos?"

capture label variable h_3_17c_c "3.17b more than 5 500 000 CUP"

capture label variable h_3_18 "Do you (and/or your spouse or other older adult in this household) own any other house, apartment or any real estate property like land and/or lots?"

capture label variable h_3_19_p "3.19 If you sold them today and paid what was owed on these properties, how much would you get? |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_19_d "3.19 If you sold them today and paid what was owed on these properties, how much would you get? |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_19_c "3.19 If you sold them today and paid what was owed on these properties, how much would you get? |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_20a_p "3.20a more than $36 000?"

capture label variable h_3_20a_d "3.20a more than $500 000 pesos?"

capture label variable h_3_20a_c "3.20a more than 1 110 000 CUP"

capture label variable h_3_20b_p "3.20b more than $18 500?"

capture label variable h_3_20b_d "3.20b more than $250 000 pesos?"

capture label variable h_3_20b_c "3.20b more than 550 000 CUP"

capture label variable h_3_20c_p "3.20c more than $180 000?"

capture label variable h_3_20c_d "3.20c more than $2 500 000 pesos?"

capture label variable h_3_20c_c "3.20c more than 5 500 000 CUP"

capture label variable h_3_21 "3.21 Do you (and/or your spouse or other older adult in this household) own any business, farmland, or animal husbandry?"

capture label variable h_3_22_p "3.22 If you sold them today (and paid what you owe on these properties), about how much would you get? [Include value of business, animals, etc. but exclude property value already estimated before] |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_22_d "3.22 If you sold them today (and paid what you owe on these properties), about how much would you get? [Include value of business, animals, etc. but exclude property value already estimated before] |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_22_c "3.22 If you sold them today (and paid what you owe on these properties), about how much would you get? [Include value of business, animals, etc. but exclude property value already estimated before] |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_23a_p "3.23a more than $30 000?"

capture label variable h_3_23a_d "3.23a more than $400 000 pesos?"

capture label variable h_3_23a_c "3.23a more than 150 000 CUP?"

capture label variable h_3_23b_p "3.23b more than $10 000?"

capture label variable h_3_23b_d "3.23b more than $140 000 pesos?"

capture label variable h_3_23b_c "3.23b more than 75 000 CUP?"

capture label variable h_3_23c_p "3.23c more than $100 000?"

capture label variable h_3_23c_d "3.23c more than $1 400 000 pesos?"

capture label variable h_3_23c_c "3.23c more than 550 000 CUP?"

capture label variable h_3_24 "3.24 Do you (and/or your spouse or another older adult in this household) have checking accounts, savings accounts, fixed-term investments, loans made to third parties, stocks, bonds, etc.?"

capture label variable h_3_25_p "3.25 Adding up all these accounts, how much is their value? |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_25_d "3.25 Adding up all these accounts, how much is their value? |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_25_c "3.25 Adding up all these accounts, how much is their value? |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_26a_p "3.26a more than $5 000?"

capture label variable h_3_26a_d "3.26a more than $70 000 pesos?"

capture label variable h_3_26a_c "3.26a more than 150 000 CUP?"

capture label variable h_3_26b_p "3.26b more than $2 500?"

capture label variable h_3_26b_d "3.26b more than $32 000 pesos?"

capture label variable h_3_26b_c "3.26b more than 75 000 CUP?"

capture label variable h_3_26c_p "3.26c more than $18 000?"

capture label variable h_3_26c_d "3.26c more than $240 000 pesos?"

capture label variable h_3_26c_c "3.26c more than 550 000 CUP?"

capture label variable h_3_27_p "3.27 In the event of a family emergency for which you had to sell all other assets that you have not mentioned to me, how much would you get? REGISTER QUANTITY |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_27_d "3.27 In the event of a family emergency for which you had to sell all other assets that you have not mentioned to me, how much would you get? REGISTER QUANTITY |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_27_c "3.27 In the event of a family emergency for which you had to sell all other assets that you have not mentioned to me, how much would you get? REGISTER QUANTITY |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_28a_p "3.28a more than $36 000?"

capture label variable h_3_28a_d "3.28a more than $500 000 pesos?"

capture label variable h_3_28a_c "3.28a more than 1 110 000 CUP?"

capture label variable h_3_28b_p "3.28b more than $18 500?"

capture label variable h_3_28b_d "3.28b more than $250 000 pesos?"

capture label variable h_3_28b_c "3.28b more than 550 000 CUP?"

capture label variable h_3_28c_p "3.28c more than $100 000?"

capture label variable h_3_28c_d "3.28c more than $ 1400 000 pesos?"

capture label variable h_3_28c_c "3.28c more than 3 000 000 CUP?"

capture label variable h_3_29 "3.29 Do you (and/or your spouse or other older adult in this household) have debts that we haven't asked about, such as credit cards, medical debt, life insurance loans, loans from relatives, and so on?"

capture label variable h_3_30_p "3.30 Taking all these together, how much do you owe? |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_30_d "3.30 Taking all these together, how much do you owe? |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_30_c "3.30 Taking all these together, how much do you owe? |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_31a_p "3.31a more than $5 000?"

capture label variable h_3_31a_d "3.31a more than $70 000 pesos?"

capture label variable h_3_31a_c "3.31a more than 150 000 CUP?"

capture label variable h_3_31b_p "3.31b more than $2 500?"

capture label variable h_3_31b_d "3.31b more than $32 000 pesos?"

capture label variable h_3_31b_c "3.31b more than 75 000 CUP?"

capture label variable h_3_31c_p "3.31c more than $18 000?"

capture label variable h_3_31c_d "3.31c more than $ 240 000 pesos?"

capture label variable h_3_31c_c "3.31c more than 550 000 CUP?"

capture label variable h_3_32_p "3.32 In total, about how much do you spend per month on the household? Exclude what is produced at home for self-consumption. |_|_|_|_|_|_| $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_32_d "3.32 In total, about how much do you spend per month on the household? Exclude what is produced at home for self-consumption. |_|_|_|_|_|_| pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_32_c "3.32 In total, about how much do you spend per month on the household? Exclude what is produced at home for self-consumption. |_|_|_|_|_|_| CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_3_33a_p "3.33a more than $1 600?"

capture label variable h_3_33a_d "3.33a more than $20 000 pesos?"

capture label variable h_3_33a_c "3.33a more than 47 500 CUP?"

capture label variable h_3_33b_p "3.33b more than $800?"

capture label variable h_3_33b_d "3.33b more than $11 000 pesos?"

capture label variable h_3_33b_c "3.33b more than 25 000 CUP?"

capture label variable h_3_33c_p "3.33c more than $2 400?"

capture label variable h_3_33c_d "3.33c more than $ 32 000 pesos?"

capture label variable h_3_33c_c "3.33c more than 75 000 CUP?"

capture label variable h_3_34 "3.34 Do you or anyone else in the household make clothes, raise animals, or grow food to be eaten at home?"

capture label variable h_4 "4. Enter the Participant Code for the Participant whose income you are asking about in this section:"

capture label variable h_4_1 "4.1 Do they receive any income for paid work?"

capture label variable h_4_1a "4.1.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_1b_p "4.1.B more than $1 600?"

capture label variable h_4_1b_d "4.1.B more than $20 000 pesos?"

capture label variable h_4_1b_c "4.1.B more than 47 500 CUP?"

capture label variable h_4_1b2_p "4.1.B.2 more than $400 per month?"

capture label variable h_4_1b2_d "4.1.B.2 more than $5 000 pesos?"

capture label variable h_4_1b2_c "4.1.B.2 more than 12 500 CUP?"

capture label variable h_4_1b3_p "4.1.B.3 more than $3 000?"

capture label variable h_4_1b3_d "4.1.B.3 more than $40 000 pesos?"

capture label variable h_4_1b3_c "4.1.B.3 more than 90 000 CUP?"

capture label variable h_4_2 "4.2 Do they receive any government pension?"

capture label variable h_4_2a "4.2.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_2b_p "4.2.B more than $400?"

capture label variable h_4_2b_d "4.2.B more than $5 000 pesos?"

capture label variable h_4_2b_c "4.2.B more than 12 000 CUP?"

capture label variable h_4_2b2_p "4.2.B.2 more than $200?"

capture label variable h_4_2b2_d "4.2.B.2 more than $2 500 pesos?"

capture label variable h_4_2b2_c "4.2.B.2 more than 6 250 CUP?"

capture label variable h_4_2b3_p "4.2.B.3 more than $1400?"

capture label variable h_4_2b3_d "4.2.B.3 more than $20 000 pesos?"

capture label variable h_4_2b3_c "4.2.B.3 more than 42 500 CUP?"

capture label variable h_4_3 "4.3 Do they receive any employer pension?"

capture label variable h_4_3a "4.3.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_3b_p "4.3.B more than $400?"

capture label variable h_4_3b_d "4.3.B more than $5 000 pesos?"

capture label variable h_4_3b_c "4.3.B more than 12 000 CUP?"

capture label variable h_4_3b2_p "4.3.B.2 more than $200?"

capture label variable h_4_3b2_d "4.3.B.2 more than $2 500 pesos?"

capture label variable h_4_3b2_c "4.3.B.2 more than 6 250 CUP?"

capture label variable h_4_3b3_p "4.3.B.3 more than $1400?"

capture label variable h_4_3b3_d "4.3.B.3 more than $20 000 pesos?"

capture label variable h_4_3b3_c "4.3.B.3 more than 42 500 CUP?"

capture label variable h_4_4 "4.4 Do they receive any pension or disability benefit?"

capture label variable h_4_4a "4.4.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_4b_p "4.4B more than $400?"

capture label variable h_4_4b_d "4.4.B more than $5 000 pesos?"

capture label variable h_4_4b_c "4.4.B more than 12 000 CUP?"

capture label variable h_4_4b2_p "4.4.B.2 more than $200?"

capture label variable h_4_4b2_d "4.4.B.2 more than $2 500 pesos?"

capture label variable h_4_4b2_c "4.4.B.2 more than 6 250 CUP?"

capture label variable h_4_4b3_p "4.4.B.3 more than $1400?"

capture label variable h_4_4b3_d "4.4.B.3 more than $20 000 pesos?"

capture label variable h_4_4b3_c "4.4.B.3 more than 42 500 CUP?"

capture label variable h_4_5 "4.5 Do they receive any income from land or rented property?"

capture label variable h_4_5a "4.5.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_5b_p "4.5.B more than $1 200?"

capture label variable h_4_5b_d "4.5.B more than $15 000 pesos?"

capture label variable h_4_5b_c "4.5.B more than 35 000 CUP?"

capture label variable h_4_5b2_p "4.5.B.2 more than $400?"

capture label variable h_4_5b2_d "4.5.B.2 more than $5 000 pesos?"

capture label variable h_4_5b2_c "4.5.B.2 more than 12 500 CUP?"

capture label variable h_4_5b3_p "4.5.B.3 more than $3 600?"

capture label variable h_4_5b3_d "4.5.B.3 more than $50 000 pesos?"

capture label variable h_4_5b3_c "4.5.B.3 more than 110 000 CUP?"

capture label variable h_4_6 "4.6 Do they receive any earnings from another business (income minus expenses)?"

capture label variable h_4_6a "4.6.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_6b_p "4.6.B more than $4 000?"

capture label variable h_4_6b_d "4.6.B more than $50 000 pesos?"

capture label variable h_4_6b_c "4.6.B more than 120 000 CUP?"

capture label variable h_4_6b2_p "4.6.B.2 more than $1 600?"

capture label variable h_4_6b2_d "4.6.B.2 more than $20 000 pesos?"

capture label variable h_4_6b2_c "4.6.B.2 more than 47 500 CUP?"

capture label variable h_4_6b3_p "4.6.B.3 more than $12 000?"

capture label variable h_4_6b3_d "4.6.B.3 more than $150 000 pesos?"

capture label variable h_4_6b3_c "4.6.B.3 more than 350 000 CUP?"

capture label variable h_4_7 "4.7 Do they regularly receive money from their grandchildren or children?"

capture label variable h_4_7a "4.7.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_7b_p "4.7.B more than $50?"

capture label variable h_4_7b_d "4.7.B more than $700 pesos?"

capture label variable h_4_7b_c "4.7.B more than 1 250 CUP?"

capture label variable h_4_7b2_p "4.7.B.2 more than $100?"

capture label variable h_4_7b2_d "4.7.B.2 more than $1 500 pesos?"

capture label variable h_4_7b2_c "4.7.B.2 more than 2 500 CUP?"

capture label variable h_4_8 "4.8 Do they receive other regular income?"

capture label variable h_4_8a "4.8.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_4_8b_p "4.8.B more than $50?"

capture label variable h_4_8b_d "4.8.B more than $700 pesos?"

capture label variable h_4_8b_c "4.8.B more than 1 250 CUP?"

capture label variable h_4_8b2_p "4.8.B.2 more than $100?"

capture label variable h_4_8b2_d "4..B.2 more than $1 500 pesos?"

capture label variable h_4_8b2_c "4.8.B.2 more than 2 500 CUP?"

capture label variable h_5 "5. Does the participant have a co-resident spouse/partner, or are there other Participants in the household?"

capture label variable h_5_1 "5.1 Do they receive any income for paid work?"

capture label variable h_5_1a "5.1.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_1b_p "5.1.B more than $1 600?"

capture label variable h_5_1b_d "5.1.B more than $20 000 pesos?"

capture label variable h_5_1b_c "5.1.B more than 47 500 CUP?"

capture label variable h_5_1b2_p "5.1.B.2 more than $400 per month?"

capture label variable h_5_1b2_d "5.1.B.2 more than $5 000 pesos?"

capture label variable h_5_1b2_c "5.1.B.2 more than 12 500 CUP?"

capture label variable h_5_1b3_p "5.1.B.3 more than $3 000?"

capture label variable h_5_1b3_d "5.1.B.3 more than $40 000 pesos?"

capture label variable h_5_1b3_c "5.1.B.3 more than 90 000 CUP?"

capture label variable h_5_2 "5.2 Do they receive any government pension?"

capture label variable h_5_2a "5.2.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_2b_p "5.2.B more than $400?"

capture label variable h_5_2b_d "5.2.B more than $5 000 pesos?"

capture label variable h_5_2b_c "5.2.B more than 12 000 CUP?"

capture label variable h_5_2b2_p "5.2.B.2 more than $200?"

capture label variable h_5_2b2_d "5.2.B.2 more than $2 500 pesos?"

capture label variable h_5_2b2_c "5.2.B.2 more than 6 250 CUP?"

capture label variable h_5_2b3_p "5.2.B.3 more than $1400?"

capture label variable h_5_2b3_d "5.2.B.3 more than $20 000 pesos?"

capture label variable h_5_2b3_c "5.2.B.3 more than 42 500 CUP?"

capture label variable h_5_3 "5.3 Do they receive any employer pension?"

capture label variable h_5_3a "5.3.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_3b_p "5.3.B more than $400?"

capture label variable h_5_3b_d "5.3.B more than $5 000 pesos?"

capture label variable h_5_3b_c "5.3.B more than 12 000 CUP?"

capture label variable h_5_3b2_p "5.3.B.2 more than $200?"

capture label variable h_5_3b2_d "5.3.B.2 more than $2 500 pesos?"

capture label variable h_5_3b2_c "5.3.B.2 more than 6 250 CUP?"

capture label variable h_5_3b3_p "5.3.B.3 more than $1400?"

capture label variable h_5_3b3_d "5.3.B.3 more than $20 000 pesos?"

capture label variable h_5_3b3_c "5.3.B.3 more than 42 500 CUP?"

capture label variable h_5_4 "5.4 Do they receive any pension or disability benefit?"

capture label variable h_5_4a "5.4.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_4b_p "5.4B more than $400?"

capture label variable h_5_4b_d "5.4.B more than $5 000 pesos?"

capture label variable h_5_4b_c "5.4.B more than 12 000 CUP?"

capture label variable h_5_4b2_p "5.4.B.2 more than $200?"

capture label variable h_5_4b2_d "5.4.B.2 more than $2 500 pesos?"

capture label variable h_5_4b2_c "5.4.B.2 more than 6 250 CUP?"

capture label variable h_5_4b3_p "5.4.B.3 more than $1400?"

capture label variable h_5_4b3_d "5.4.B.3 more than $20 000 pesos?"

capture label variable h_5_4b3_c "5.4.B.3 more than 42 500 CUP?"

capture label variable h_5_5 "5.5 Do they receive any income from land or rented property?"

capture label variable h_5_5a "5.5.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_5b_p "5.5.B more than $1 200?"

capture label variable h_5_5b_d "5.5.B more than $15 000 pesos?"

capture label variable h_5_5b_c "5.5.B more than 35 000 CUP?"

capture label variable h_5_5b2_p "5.5.B.2 more than $400?"

capture label variable h_5_5b2_d "5.5.B.2 more than $5 000 pesos?"

capture label variable h_5_5b2_c "5.5.B.2 more than 12 500 CUP?"

capture label variable h_5_5b3_p "5.5.B.3 more than $3 600?"

capture label variable h_5_5b3_d "5.5.B.3 more than $50 000 pesos?"

capture label variable h_5_5b3_c "5.5.B.3 more than 110 000 CUP?"

capture label variable h_5_6 "5.6 Do they receive any earnings from another business (income minus expenses)?"

capture label variable h_5_6a "5.6.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_6b_p "5.6.B more than $4 000?"

capture label variable h_5_6b_d "5.6.B more than $50 000 pesos?"

capture label variable h_5_6b_c "5.6.B more than 120 000 CUP?"

capture label variable h_5_6b2_p "5.6.B.2 more than $1 600?"

capture label variable h_5_6b2_d "5.6.B.2 more than $20 000 pesos?"

capture label variable h_5_6b2_c "5.6.B.2 more than 47 500 CUP?"

capture label variable h_5_6b3_p "5.6.B.3 more than $12 000?"

capture label variable h_5_6b3_d "5.6.B.3 more than $150 000 pesos?"

capture label variable h_5_6b3_c "5.6.B.3 more than 350 000 CUP?"

capture label variable h_5_7 "5.7 Do they regularly receive money from their grandchildren or children?"

capture label variable h_5_7a "5.7.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_7b_p "5.7.B more than $50?"

capture label variable h_5_7b_d "5.7.B more than $700 pesos?"

capture label variable h_5_7b_c "5.7.B more than 1 250 CUP?"

capture label variable h_5_7b2_p "5.7.B.2 more than $100?"

capture label variable h_5_7b2_d "5.7.B.2 more than $1 500 pesos?"

capture label variable h_5_7b2_c "5.7.B.2 more than 2 500 CUP?"

capture label variable h_5_8 "5.8 Do they receive other regular income?"

capture label variable h_5_8a "5.8.A About how much do they receive each month? DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_5_8b_p "5.8.B more than $50?"

capture label variable h_5_8b_d "5.8.B more than $700 pesos?"

capture label variable h_5_8b_c "5.8.B more than 1 250 CUP?"

capture label variable h_5_8b2_p "5.8.B.2 more than $100?"

capture label variable h_5_8b2_d "5.B.2 more than $1 500 pesos?"

capture label variable h_5_8b2_c "5.8.B.2 more than 2 500 CUP?"

capture label variable h_6_1 "6.1 In the last year, has any participant or your spouse received help in money or goods from children and/or grandchildren who do not live in this household? (Do not include the previously mentioned monthly help)?"

capture label variable h_6_1a_p "6.1a Approximately, how much was that aid in the last year? (Do not include the previously mentioned monthly help) QUANTITY $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_1a_d "6.1a Approximately, how much was that aid in the last year? (Do not include the previously mentioned monthly help) QUANTITY pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_1a_c "6.1a Approximately, how much was that aid in the last year? (Do not include the previously mentioned monthly help) QUANTITY CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_1b1_p "6.1b1 more than $250?"

capture label variable h_6_1b1_d "6.1b1 more than 15 000 pesos?"

capture label variable h_6_1b1_c "6.1b1 more than 35 000 CUP?"

capture label variable h_6_1b2_p "6.1b2 more than $500?"

capture label variable h_6_1b2_d "6.1b2 more than 30 000 pesos?"

capture label variable h_6_1b2_c "6.1b2 more than 70 000 CUP?"

capture label variable h_6_2 "6.2 The help in money or goods that you receive from your children/daughters-in-law/sons-in-law/grandchildren (and those of your spouse). Do you think it's..."

capture label variable h_6_3 "6.3 The help with household chores, care, errands and transportation that you receive from your children/daughter-in-law/son-in-law/grandchildren (and those of your spouse). Do you think it is..."

capture label variable h_6_41_d "6.4.1  Do you (and/or spouse or other older adult) receive the solidarity card (to buy food in supermarkets)?"

capture label variable h_6_42_d "6.4.2 Do you (and/or spouse or other older adult) receive a voucher called “bono-gas” [gas voucher]?"

capture label variable h_6_43_d "6.4.3 Do you (and/or spouse or other older adult) receive a voucher called “bono-luz” [electricity voucher]?"

capture label variable h_6_44_p "6.4.4 Do you (and/or spouse or other older adult) receive a voucher called “la Carta de Pan” (to buy food)?"

capture label variable h_6_5 "6.5 In the last year, have you (or your spouse or another older adult) given help in money or goods to your children and/or grandchildren?"

capture label variable h_6_5a_p "6.5a Approximately, how much was that help in the past year? QUANTITY $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_5a_d "6.5a Approximately, how much was that help in the past year? QUANTITY pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_5a_c "6.5a Approximately, how much was that help in the past year? QUANTITY CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_5b1_p "6.5b1 more than $500?"

capture label variable h_6_5b1_d "6.5b1 more than $7 000 pesos?"

capture label variable h_6_5b1_c "6.5b1 more than 15 000 CUP?"

capture label variable h_6_5b2_p "6.5b2 more than $1 000?"

capture label variable h_6_5b2_d "6.5b2 more than $15 000 pesos?"

capture label variable h_6_5b2_c "6.5b2 more than 30 000 CUP?"

capture label variable h_6_6 "6.6 In the last year, have you (or your spouse or another older adult) given economic help to your parents and/or parent-in-laws who do not live in this household?"

capture label variable h_6_6a_p "6.6a Approximately, how much was that help in the past year? QUANTITY $ DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_6a_d "6.6a Approximately, how much was that help in the past year? QUANTITY pesos DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_6a_c "6.6a Approximately, how much was that help in the past year? QUANTITY CUP DOES NOT RESPOND............ 88 DOES NOT KNOW ...................... 99"

capture label variable h_6_6b1_p "6.6b1 more than $500?"

capture label variable h_6_6b1_d "6.6b1 more than $7 000 pesos?"

capture label variable h_6_6b1_c "6.6b1 more than 15 000 CUP?"

capture label variable h_6_6b2_p "6.6b2 more than $1 000?"

capture label variable h_6_6b2_d "6.6b2 more than $15 000 pesos?"

capture label variable h_6_6b2_c "6.6b2 more than 30 000 CUP?"

capture label variable h_7_1_p_c "7.1 The dwelling is..."

capture label variable h_7_1_d "7.1 The dwelling is..."

capture label variable h_7_2_1 "7.2.1 on a paved street?"

capture label variable h_7_2_2 "7.2.2 on a street?"

capture label variable h_7_2_3 "7.2.3 on a path or sidewalk?"

capture label variable h_7_2_4 "7.2.4 next to farmland?"

capture label variable h_7_2_5 "7.2.5 less than 500 meters (like three blocks) from a large road, with more than two lanes in each direction?"

capture label variable h_deviceid2 "Device ID:"

save Household.dta, replace
