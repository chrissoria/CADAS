clear all 
set more off
capture log close

*note Oct 19th an update was sent out to break out pictures for 72 and 79

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
    use "../Cog.dta"
}
else if `country' == 1 {
    use "../Cog.dta"
}
else if `country' == 2 {
    use "../Cog.dta"
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
    use using "../PR_out/Cog.dta"
}
else if `country' == 1 {
    use using "../DR_out/Cog.dta"
}
else if `country' == 2 {
    use using "../CUBA_out/Cog.dta"
}
}

label drop _all


capture confirm numeric variable C_0
if !_rc{
     tostring C_0, replace
}

label define C_0 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_1
if !_rc{
     tostring C_1, replace
}

label define C_1 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_2_P_C
if !_rc{
     tostring C_2_P_C, replace
}

label define C_2_P_C .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_2_D
if !_rc{
     tostring C_2_D, replace
}

label define C_2_D .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_3
if !_rc{
     tostring C_3, replace
}

label define C_3 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_4
if !_rc{
     tostring C_4, replace
}

label define C_4 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_5
if !_rc{
     tostring C_5, replace
}

label define C_5 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_6
if !_rc{
     tostring C_6, replace
}

label define C_6 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_7_D_C
if !_rc{
     tostring C_7_D_C, replace
}

label define C_7_D_C .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_7_P
if !_rc{
     tostring C_7_P, replace
}

label define C_7_P .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_8
if !_rc{
     tostring C_8, replace
}

label define C_8 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_9
if !_rc{
     tostring C_9, replace
}

label define C_9 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_10
if !_rc{
     tostring C_10, replace
}

label define C_10 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_11
if !_rc{
     tostring C_11, replace
}

label define C_11 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_12
if !_rc{
     tostring C_12, replace
}

label define C_12 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_13
if !_rc{
     tostring C_13, replace
}

label define C_13 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_21
if !_rc{
     tostring C_21, replace
}

label define C_21 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_22
if !_rc{
     tostring C_22, replace
}

label define C_22 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_23
if !_rc{
     tostring C_23, replace
}

label define C_23 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_24
if !_rc{
     tostring C_24, replace
}

label define C_24 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_25
if !_rc{
     tostring C_25, replace
}

label define C_25 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_26
if !_rc{
     tostring C_26, replace
}

label define C_26 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_27
if !_rc{
     tostring C_27, replace
}

label define C_27 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_28
if !_rc{
     tostring C_28, replace
}

label define C_28 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_29
if !_rc{
     tostring C_29, replace
}

label define C_29 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_30
if !_rc{
     tostring C_30, replace
}

label define C_30 .a"." 1 "correct"0 "incorrect"5 "could not (illiterate)"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_31
if !_rc{
     tostring C_31, replace
}

label define C_31 .a"." 0 "0" 1 "1" 5 "could not (illiterate)"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_32
if !_rc{
     tostring C_32, replace
}

label define C_32 .a"." 1 "yes" 6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable G_1
if !_rc{
     tostring G_1, replace
}

label define G_1 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_40
if !_rc{
     tostring C_40, replace
}

label define C_40 .a"." 0 "no" 1 "yes" 777 "refused"



capture confirm numeric variable C_43
if !_rc{
     tostring C_43, replace
}

label define C_43 .a"." 0 "no" 1 "yes" 666 "could not (physical limitation)"777 "refused"



capture confirm numeric variable C_45
if !_rc{
     tostring C_45, replace
}

label define C_45 .a"." 1 "correct"0 "incorrect"2 "wants to start over" 7 "refused"



capture confirm numeric variable C_46
if !_rc{
     tostring C_46, replace
}

label define C_46 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_48
if !_rc{
     tostring C_48, replace
}

label define C_48 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_49
if !_rc{
     tostring C_49, replace
}

label define C_49 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_50
if !_rc{
     tostring C_50, replace
}

label define C_50 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_51
if !_rc{
     tostring C_51, replace
}

label define C_51 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_52
if !_rc{
     tostring C_52, replace
}

label define C_52 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_53
if !_rc{
     tostring C_53, replace
}

label define C_53 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_54
if !_rc{
     tostring C_54, replace
}

label define C_54 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_55
if !_rc{
     tostring C_55, replace
}

label define C_55 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_56
if !_rc{
     tostring C_56, replace
}

label define C_56 .a"." 1 "correct"0 "incorrect"7 "refused"



capture confirm numeric variable C_58
if !_rc{
     tostring C_58, replace
}

label define C_58 .a"." 1 "answered" 2 "did not answer" 



capture confirm numeric variable C_59
if !_rc{
     tostring C_59, replace
}

label define C_59 .a"." 1 "answered" 2 "did not answer" 



capture confirm numeric variable C_60
if !_rc{
     tostring C_60, replace
}

label define C_60 .a"." 1 "answered" 2 "did not answer" 



capture confirm numeric variable C_61
if !_rc{
     tostring C_61, replace
}

label define C_61 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_62
if !_rc{
     tostring C_62, replace
}

label define C_62 .a"." 1 "correct"0 "incorrect"6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_65
if !_rc{
     tostring C_65, replace
}

label define C_65 .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable G_2
if !_rc{
     tostring G_2, replace
}

label define G_2 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_66A
if !_rc{
     tostring C_66A, replace
}

label define C_66A .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_66B
if !_rc{
     tostring C_66B, replace
}

label define C_66B .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_66C
if !_rc{
     tostring C_66C, replace
}

label define C_66C .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_66D
if !_rc{
     tostring C_66D, replace
}

label define C_66D .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_66E
if !_rc{
     tostring C_66E, replace
}

label define C_66E .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_66F
if !_rc{
     tostring C_66F, replace
}

label define C_66F .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_01
if !_rc{
     tostring C_67_01, replace
}

label define C_67_01 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_02
if !_rc{
     tostring C_67_02, replace
}

label define C_67_02 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_03
if !_rc{
     tostring C_67_03, replace
}

label define C_67_03 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_04
if !_rc{
     tostring C_67_04, replace
}

label define C_67_04 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_05
if !_rc{
     tostring C_67_05, replace
}

label define C_67_05 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_06
if !_rc{
     tostring C_67_06, replace
}

label define C_67_06 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_07
if !_rc{
     tostring C_67_07, replace
}

label define C_67_07 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_08
if !_rc{
     tostring C_67_08, replace
}

label define C_67_08 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_09
if !_rc{
     tostring C_67_09, replace
}

label define C_67_09 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_10
if !_rc{
     tostring C_67_10, replace
}

label define C_67_10 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_11
if !_rc{
     tostring C_67_11, replace
}

label define C_67_11 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_12
if !_rc{
     tostring C_67_12, replace
}

label define C_67_12 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_13_C
if !_rc{
     tostring C_67_13_C, replace
}

label define C_67_13_C .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_13_D
if !_rc{
     tostring C_67_13_D, replace
}

label define C_67_13_D .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_13_P
if !_rc{
     tostring C_67_13_P, replace
}

label define C_67_13_P .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_14
if !_rc{
     tostring C_67_14, replace
}

label define C_67_14 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_15
if !_rc{
     tostring C_67_15, replace
}

label define C_67_15 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_16
if !_rc{
     tostring C_67_16, replace
}

label define C_67_16 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_17
if !_rc{
     tostring C_67_17, replace
}

label define C_67_17 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_18
if !_rc{
     tostring C_67_18, replace
}

label define C_67_18 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_19
if !_rc{
     tostring C_67_19, replace
}

label define C_67_19 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_20
if !_rc{
     tostring C_67_20, replace
}

label define C_67_20 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_21
if !_rc{
     tostring C_67_21, replace
}

label define C_67_21 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_22
if !_rc{
     tostring C_67_22, replace
}

label define C_67_22 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_23
if !_rc{
     tostring C_67_23, replace
}

label define C_67_23 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_24
if !_rc{
     tostring C_67_24, replace
}

label define C_67_24 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_67_25
if !_rc{
     tostring C_67_25, replace
}

label define C_67_25 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_68_01
if !_rc{
     tostring C_68_01, replace
}

label define C_68_01 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_02
if !_rc{
     tostring C_68_02, replace
}

label define C_68_02 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_03
if !_rc{
     tostring C_68_03, replace
}

label define C_68_03 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_04
if !_rc{
     tostring C_68_04, replace
}

label define C_68_04 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_05
if !_rc{
     tostring C_68_05, replace
}

label define C_68_05 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_06
if !_rc{
     tostring C_68_06, replace
}

label define C_68_06 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_07
if !_rc{
     tostring C_68_07, replace
}

label define C_68_07 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_08
if !_rc{
     tostring C_68_08, replace
}

label define C_68_08 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_09
if !_rc{
     tostring C_68_09, replace
}

label define C_68_09 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_10
if !_rc{
     tostring C_68_10, replace
}

label define C_68_10 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_11
if !_rc{
     tostring C_68_11, replace
}

label define C_68_11 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_12
if !_rc{
     tostring C_68_12, replace
}

label define C_68_12 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_13
if !_rc{
     tostring C_68_13, replace
}

label define C_68_13 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_14
if !_rc{
     tostring C_68_14, replace
}

label define C_68_14 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_15
if !_rc{
     tostring C_68_15, replace
}

label define C_68_15 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_16
if !_rc{
     tostring C_68_16, replace
}

label define C_68_16 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_17
if !_rc{
     tostring C_68_17, replace
}

label define C_68_17 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_18
if !_rc{
     tostring C_68_18, replace
}

label define C_68_18 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_19
if !_rc{
     tostring C_68_19, replace
}

label define C_68_19 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_68_20
if !_rc{
     tostring C_68_20, replace
}

label define C_68_20 .a"." 1 "yes" 2 "no" 



capture confirm numeric variable C_69_C
if !_rc{
     tostring C_69_C, replace
}

label define C_69_C .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_69_D
if !_rc{
     tostring C_69_D, replace
}

label define C_69_D .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_69_P
if !_rc{
     tostring C_69_P, replace
}

label define C_69_P .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_70_D_C
if !_rc{
     tostring C_70_D_C, replace
}

label define C_70_D_C .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_70_P
if !_rc{
     tostring C_70_P, replace
}

label define C_70_P .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_71_C
if !_rc{
     tostring C_71_C, replace
}

label define C_71_C .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_71_P
if !_rc{
     tostring C_71_P, replace
}

label define C_71_P .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_71_D
if !_rc{
     tostring C_71_D, replace
}

label define C_71_D .a"." 1 "correct"0 "incorrect"



capture confirm numeric variable C_72_1
if !_rc{
     tostring C_72_1, replace
}

label define C_72_1 .a"." 1 "yes" 6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_72_2
if !_rc{
     tostring C_72_2, replace
}

label define C_72_2 .a"." 1 "yes" 6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_72_3
if !_rc{
     tostring C_72_3, replace
}

label define C_72_3 .a"." 1 "yes" 6 "could not (physical limitation)"7 "refused"



capture confirm numeric variable C_72_4
if !_rc{
     tostring C_72_4, replace
}

label define C_72_4 .a"." 1 "yes" 6 "could not (physical limitation)"7 "refused"


/*

capture confirm numeric variable G_3
if !_rc{
     tostring G_3, replace
}

label define G_3 .a"." 1 "yes" 2 "no" 

*/


capture confirm numeric variable C_77A
if !_rc{
     tostring C_77A, replace
}

label define C_77A .a"." 0 "sí exacta" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_77B
if !_rc{
     tostring C_77B, replace
}

label define C_77B .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_77C
if !_rc{
     tostring C_77C, replace
}

label define C_77C .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_77D
if !_rc{
     tostring C_77D, replace
}

label define C_77D .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_77E
if !_rc{
     tostring C_77E, replace
}

label define C_77E .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_77F
if !_rc{
     tostring C_77F, replace
}

label define C_77F .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_01
if !_rc{
     tostring C_78_01, replace
}

label define C_78_01 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_02
if !_rc{
     tostring C_78_02, replace
}

label define C_78_02 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_03
if !_rc{
     tostring C_78_03, replace
}

label define C_78_03 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_04
if !_rc{
     tostring C_78_04, replace
}

label define C_78_04 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_05
if !_rc{
     tostring C_78_05, replace
}

label define C_78_05 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_06
if !_rc{
     tostring C_78_06, replace
}

label define C_78_06 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_07
if !_rc{
     tostring C_78_07, replace
}

label define C_78_07 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_08
if !_rc{
     tostring C_78_08, replace
}

label define C_78_08 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_09
if !_rc{
     tostring C_78_09, replace
}

label define C_78_09 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_10
if !_rc{
     tostring C_78_10, replace
}

label define C_78_10 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_11
if !_rc{
     tostring C_78_11, replace
}

label define C_78_11 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_12
if !_rc{
     tostring C_78_12, replace
}

label define C_78_12 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_13
if !_rc{
     tostring C_78_13, replace
}

label define C_78_13 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_14
if !_rc{
     tostring C_78_14, replace
}

label define C_78_14 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_15
if !_rc{
     tostring C_78_15, replace
}

label define C_78_15 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_16
if !_rc{
     tostring C_78_16, replace
}

label define C_78_16 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_17
if !_rc{
     tostring C_78_17, replace
}

label define C_78_17 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_18
if !_rc{
     tostring C_78_18, replace
}

label define C_78_18 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_19
if !_rc{
     tostring C_78_19, replace
}

label define C_78_19 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_20
if !_rc{
     tostring C_78_20, replace
}

label define C_78_20 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_21
if !_rc{
     tostring C_78_21, replace
}

label define C_78_21 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_22
if !_rc{
     tostring C_78_22, replace
}

label define C_78_22 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_23
if !_rc{
     tostring C_78_23, replace
}

label define C_78_23 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_24
if !_rc{
     tostring C_78_24, replace
}

label define C_78_24 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_78_25
if !_rc{
     tostring C_78_25, replace
}

label define C_78_25 .a"." 0 "yes, exactly" 1 "yes, approximately" 2 "forgot the element"



capture confirm numeric variable C_79_1
if !_rc{
     tostring C_79_1, replace
}

label define C_79_1 .a"." 1 "yes" 6 "could not (physical limitation)"4 "could not remember the figure" 7 "refused"



capture confirm numeric variable C_79_2
if !_rc{
     tostring C_79_2, replace
}

label define C_79_2 .a"." 1 "yes" 6 "could not (physical limitation)"4 "could not remember the figure" 7 "refused"



capture confirm numeric variable C_79_3
if !_rc{
     tostring C_79_3, replace
}

label define C_79_3 .a"." 1 "yes" 6 "could not (physical limitation)"4 "could not remember the figure" 7 "refused"



capture confirm numeric variable C_79_4
if !_rc{
     tostring C_79_4, replace
}

label define C_79_4 .a"." 1 "yes" 6 "could not (physical limitation)"4 "could not remember the figure" 7 "refused"



capture confirm numeric variable C_80A
if !_rc{
     tostring C_80A, replace
}

label define C_80A .a"." 2 "no" 1 "yes" 



capture confirm numeric variable C_80B
if !_rc{
     tostring C_80B, replace
}

label define C_80B .a"." 2 "no" 1 "yes" 



capture confirm numeric variable C_80C
if !_rc{
     tostring C_80C, replace
}

label define C_80C .a"." 2 "no" 1 "yes" 



capture confirm numeric variable C_81
if !_rc{
     tostring C_81, replace
}

label define C_81 .a"." 1 "excellent" 2 "very good" 3 "good" 4 "regular" 5 "poor" 6 "blind" 



capture confirm numeric variable C_82
if !_rc{
     tostring C_82, replace
}

label define C_82 .a"." 1 "excellent" 2 "very good" 3 "good" 4 "regular" 5 "poor" 6 "deaf" 



label define C_33_A 0 "false" 7 "true"




label define C_33_1 0 "false" 1 "true"




label define C_33_2 0 "false" 1 "true"




label define C_33_3 0 "false" 1 "true"




label define C_33_4 0 "false" 1 "true"




label define C_33_5 0 "false" 1 "true"




label define C_33_6 0 "false" 1 "true"




label define C_33_7 0 "false" 1 "true"




label define C_33_8 0 "false" 1 "true"




label define C_33_9 0 "false" 1 "true"




label define C_33_10 0 "false" 1 "true"




label define C_34_A 0 "false" 7 "true"




label define C_34_1 0 "false" 1 "true"




label define C_34_2 0 "false" 1 "true"




label define C_34_3 0 "false" 1 "true"




label define C_34_4 0 "false" 1 "true"




label define C_34_5 0 "false" 1 "true"




label define C_34_6 0 "false" 1 "true"




label define C_34_7 0 "false" 1 "true"




label define C_34_8 0 "false" 1 "true"




label define C_34_9 0 "false" 1 "true"




label define C_34_10 0 "false" 1 "true"




label define C_35_A 0 "false" 7 "true"




label define C_35_1 0 "false" 1 "true"




label define C_35_2 0 "false" 1 "true"




label define C_35_3 0 "false" 1 "true"




label define C_35_4 0 "false" 1 "true"




label define C_35_5 0 "false" 1 "true"




label define C_35_6 0 "false" 1 "true"




label define C_35_7 0 "false" 1 "true"




label define C_35_8 0 "false" 1 "true"




label define C_35_9 0 "false" 1 "true"




label define C_35_10 0 "false" 1 "true"




label define C_63_A 0 "false" 7 "true"




label define C_63_1 0 "false" 1 "true"




label define C_63_2 0 "false" 1 "true"




label define C_63_3 0 "false" 1 "true"




label define C_63_4 0 "false" 1 "true"




label define C_63_5 0 "false" 1 "true"




label define C_63_6 0 "false" 1 "true"




label define C_63_7 0 "false" 1 "true"




label define C_63_8 0 "false" 1 "true"




label define C_63_9 0 "false" 1 "true"




label define C_63_10 0 "false" 1 "true"




label define C_66_A 0 "false" 7 "true"




label define C_67_A 0 "false" 7 "true"




label define C_68_A 0 "false" 7 "true"




label define C_77_A 0 "false" 7 "true"




label define C_78_A 0 "false" 7 "true"



*convert missing comment legal and text values to string

capture confirm numeric variable c_interid
if !_rc{
     tostring c_interid, replace
}

capture confirm numeric variable c_particid2
if !_rc{
     tostring c_particid2, replace
}

capture confirm numeric variable c_deviceid1
if !_rc{
     tostring c_deviceid1, replace
}

capture confirm numeric variable c_20
if !_rc{
     tostring c_20, replace
}

capture confirm numeric variable c_26_1
if !_rc{
     tostring c_26_1, replace
}

capture confirm numeric variable g_1_file
if !_rc{
     tostring g_1_file, replace
}

capture confirm numeric variable g_2_file
if !_rc{
     tostring g_2_file, replace
}

capture confirm numeric variable g_2_file2
if !_rc{
     tostring g_2_file2, replace
}

capture confirm numeric variable g_3_file
if !_rc{
     tostring g_3_file, replace
}

capture confirm numeric variable g_3_file2
if !_rc{
     tostring g_3_file2, replace
}

capture confirm numeric variable c_deviceid2
if !_rc{
     tostring c_deviceid2, replace
}

*variable labels

label variable c_interid "INTERVIEWER NUMBER"

label variable c_houseid "HOUSE NUMBER"

label variable c_clustid "CLUSTER NUMBER:"

label variable c_particid "PARTICIPANT NUMBER"

label variable c_country "Country"

label variable c_houseid2 "HOUSE NUMBER"

label variable c_conglid2 "CLUSTER NUMBER:"

label variable c_particid2 "PARTICIPANT NUMBER"

label variable c_deviceid1 "Device ID:"

label variable c_0 "0. I want you to remember my name. My name is xxxxxxx. Can you repeat it please?"

label variable c_1 "1. What year is it?"

label variable c_2_p_c "2. What season is it?"

label variable c_2_d "2. What season is it?"

label variable c_3 "3. What month is it?"

label variable c_4 "4. What date of the month is it? (±1 day)"

label variable c_5 "5. What day of the week is today?"

label variable c_6 "6. What country are we in?"

label variable c_7_d_c "7. What province are we in?"

label variable c_7_p "7. What municipality (or city/town) are we in?"

label variable c_8 "8. What city/town/neighborhood/housing development are we in?"

label variable c_9 "9. What building/place are we in?"

label variable c_10 "10. What room are we in?"

label variable c_11 "11. PR/DR: Apple / CU: Boat"

label variable c_12 "12. PR/DR: Peso / CU: House"

label variable c_13 "13. PR/DR: Table / CU: Fish "

label variable c_14 "14. Number of attempts."

label variable c_15 "15. How much is 100 minus 7?"

label variable c_16 "16. Subtraction #2"

label variable c_17 "17. Subtraction #3"

label variable c_18 "18. Subtraction #4"

label variable c_19 "19. Subtraction #5"

label variable c_20 "20. Write the letters in the order said by the interviewee. Refuses to answer .................7 Unable because they are illiterate........5"

label variable c_21 "21. PR/DR: Apple / CU: Boat"

label variable c_22 "22. PR/DR: Peso / CU: House"

label variable c_23 "23. PR/DR: Table / CU: Fish"

label variable c_24 "24. What is this? (Show a pencil or pen.)"

label variable c_25 "25. What is this? (Show a watch.)"

label variable c_26 "26. Did they repeat correctly?"

label variable c_26_1 "26.1 Number of attempts"

label variable c_27 "27. Took the paper with the right hand?"

label variable c_28 "28. Folded the paper in half?"

label variable c_29 "29. PR/DR: Placed the paper on the floor [or table] / CU: Placed the paper on their legs"

label variable c_30 "30. CLOSE YOUR EYES"

label variable c_31 "31. Please write a sentence. Give 1 point if the sentence is understood and contains a subject and a verb. Ignore grammatical or spelling errors."

label variable c_32 "32. Did they try to draw the figure?"

label variable pent_pic "TAKE A PHOTO OF THE PENTAGON DRAWING"

label variable c_33_a "Refused to answer?"

label variable c_33_1 "Butter"

label variable c_33_2 "Arm"

label variable c_33_3 "Letter"

label variable c_33_4 "Queen"

label variable c_33_5 "Ticket"

label variable c_33_6 "Grass"

label variable c_33_7 "Corner"

label variable c_33_8 "Rock"

label variable c_33_9 "Book"

label variable c_33_10 "Stick"

label variable c_34_a "Refused to answer?"

label variable c_34_1 "Butter"

label variable c_34_2 "Arm"

label variable c_34_3 "Letter"

label variable c_34_4 "Queen"

label variable c_34_5 "Ticket"

label variable c_34_6 "Grass"

label variable c_34_7 "Corner"

label variable c_34_8 "Rock"

label variable c_34_9 "Book"

label variable c_34_10 "Stick"

label variable c_35_a "Refused to answer?"

label variable c_35_1 "Butter"

label variable c_35_2 "Arm"

label variable c_35_3 "Letter"

label variable c_35_4 "Queen"

label variable c_35_5 "Ticket"

label variable c_35_6 "Grass"

label variable c_35_7 "Corner"

label variable c_35_8 "Rock"

label variable c_35_9 "Book"

label variable c_35_10 "Stick"

label variable g_1 "G.1 Is it okay if we record this activity?"

label variable g_1_file "START AUDIO RECORDING NOW"

label variable c_40 "40. Did they try this verbal fluency task? "

label variable anim_pic "TAKE A PHOTO OF THE ANIMAL DRAWING SHEET NOW"

label variable c_43 "43. Did they try this verbal fluency task? "

label variable symb_pic "TAKE A PHOTO OF THE SYMBOL SHEET NOW"

label variable c_45 "45. Start the stopwatch when the interviewee says the first number and stop the time once they reach the number 11 if the first number they said was 20, or once they reach the number 10 if the first number they said was 19. If the interviewee does not make any errors when counting from 20 to 11 or from 19 to 10, mark “correct” and record the time. If the respondent stops or makes a mistake and wants to start over, tell them they can try again. Mark “wants to start over”. If the respondent used the full minute without reaching 11 or 10, or if they make a mistake and don't want to make a second try, mark “wrong” and write “60” in time."

label variable c_45_a "45A. If the respondent used the full minute without reaching 11 or 10, or if they make a mistake and don't want to make a second try, mark 0 = “wrong” and write “60” in time."

label variable c_46 "46. SECOND ATTEMPT (only if you want to start over)"

label variable c_46_a "46A. TIME (SCORE 60 IF THE COUNT IS INCORRECT)"

label variable c_48 "48. What is this called? (The interviewer points to a chair)"

label variable c_49 "49. What is this called? (The interviewer points to their shoes)"

label variable c_50 "50. What is this called? (The interviewer shows their knuckles)"

label variable c_51 "51. What is this called? (The interviewer points to their elbows.)"

label variable c_52 "52. What is this called? (The interviewer points to their shoulders.)"

label variable c_53 "53. What is a bridge? Correct answers: Construction or elevation used to walk or cross over water."

label variable c_54 "54. What can you do with a hammer? Correct answers: to drive a nail through something, or similar answers that indicate the function of the hammer."

label variable c_55 "55. What do people do in a church or temple? Correct answers: pray, or go to mass, get married."

label variable c_56 "56. Where do we go to buy medicines? Correct answers: pharmacy, chemist, etc."

label variable c_58 "58. What are the names of the two most important streets near your house?"

label variable c_59 "59. Where is the nearest store/bodega/grocery store?"

label variable c_60 "60. What is your address?"

label variable c_61 "61. Please nod your head, as if to say yes."

label variable c_62 "62. Please point first at the window and then at the door."

label variable c_63_a "Refused to answer?"

label variable c_63_1 "Butter"

label variable c_63_2 "Arm"

label variable c_63_3 "Letter"

label variable c_63_4 "Queen"

label variable c_63_5 "Ticket"

label variable c_63_6 "Grass"

label variable c_63_7 "Corner"

label variable c_63_8 "Rock"

label variable c_63_9 "Book"

label variable c_63_10 "Stick"

label variable c_65 "65. Do you remember my name? What is it?"

label variable g_2 "G.2. Is it okay if we record this activity?"

label variable c_66_a "Refused to answer?"

label variable g_2_file "START AUDIO RECORDING NOW"

label variable c_66a "66.A. Three children"

label variable c_66b "66.B. House caught fire"

label variable c_66c "66.C. Brave man managed to climb"

label variable c_66d "66.D. Pull the children out"

label variable c_66e "66.E. Small cuts"

label variable c_66f "66.F. Everyone is fine"

label variable c_67_a "Refused to answer?"

label variable g_2_file2 "START AUDIO RECORDING NOW"

label variable c_67_01 "67.1 María"

label variable c_67_02 "67.2. Moreno"

label variable c_67_03 "67.3. from Northern"

label variable c_67_04 "67.4. Santo Domingo(DR)/ Habana(Cuba)/ San Juan (PR)"

label variable c_67_05 "67.5. Worked"

label variable c_67_06 "67.6. Cook"

label variable c_67_07 "67.7. Cafeteria"

label variable c_67_08 "67.8. Corner"

label variable c_67_09 "67.9. Reported"

label variable c_67_10 "67.10. to the station"

label variable c_67_11 "67.11. Police"

label variable c_67_12 "67.12. Had been robbed"

label variable c_67_13_c "67.13. in avenida Paseo"

label variable c_67_13_d "67.13. in calle Duarte"

label variable c_67_13_p "67.13. in avenida La Palma"

label variable c_67_14 "67.14. The night before"

label variable c_67_15 "67.15. And were stolen"

label variable c_67_16 "67.16. 520 pesos"

label variable c_67_17 "67.17. has 4"

label variable c_67_18 "67.18. Young children"

label variable c_67_19 "67.19. The rent is due"

label variable c_67_20 "67.20. Haven’t eaten"

label variable c_67_21 "67.21. In two days"

label variable c_67_22 "67.22. The police"

label variable c_67_23 "67.23. Moved by the woman’s story"

label variable c_67_24 "67.24. Organized a collection of money"

label variable c_67_25 "67.25. For her"

label variable c_68_a "Refused to answer?"

label variable c_68_01 "68.1. Plaza"

label variable c_68_02 "68.2. Coffee"

label variable c_68_03 "68.3. Butter"

label variable c_68_04 "68.4. Peso"

label variable c_68_05 "68.5. Arm"

label variable c_68_06 "68.6. Book"

label variable c_68_07 "68.7. Five"

label variable c_68_08 "68.8. Card"

label variable c_68_09 "68.9. Hotel"

label variable c_68_10 "68.10. Mountain"

label variable c_68_11 "68.11. Queen"

label variable c_68_12 "68.12. Corner"

label variable c_68_13 "68.13. Slipper"

label variable c_68_14 "68.14. Stick"

label variable c_68_15 "68.15. Villa"

label variable c_68_16 "68.16. Rope"

label variable c_68_17 "68.17. Ticket"

label variable c_68_18 "68.18. Troops"

label variable c_68_19 "68.19. Grass"

label variable c_68_20 "68.20. Rock"

label variable c_69_c "69. Can you tell me the name of the Apostle of Cuba who died in Dos Ríos in 1895?"

label variable c_69_d "69. Can you tell me the name of the fathers of the homeland that they proclaimed independence in 1844?"

label variable c_69_p "69. Can you tell me who discovered Puerto Rico for the Europeans?"

label variable c_70_d_c "70. What is the name of the president?"

label variable c_70_p "70. What is the name of the governor?"

label variable c_71_c "71. What is the name of the president who succeeded Fidel Castro?"

label variable c_71_p "71. What is the name of the resident commissioner?"

label variable c_71_d "71. What is the name of the vice-president?"

label variable c_72_1 "72.1 Did they try to draw the circle?"

label variable c_72_2 "72.2. Did they try to draw the diamond?"

label variable c_72_3 "72.3. Did they try to draw the two crossed rectangles?"

label variable c_72_4 "72.4. Did they try to draw the cube?"

capture label variable c_72_1_pic "TAKE A PHOTO OF THE CIRCLE DRAWING"

capture label variable c_72_2_pic "TAKE A PHOTO OF THE DIAMOND DRAWING"

capture label variable c_72_3_pic "TAKE A PHOTO OF THE DRAWING OF CROSSED RECTANGLES"

label variable c_72_4_pic "TAKE A PHOTO OF THE CUBE DRAWING"

/*
label variable g_3 "G.3. "Está bien si grabamos esta actividad?""
*/

label variable c_77_a "Refused to answer?"

label variable g_3_file "START AUDIO RECORDING NOW"

label variable c_77a "77.A. Three children"

label variable c_77b "77.B. House caught fire"

label variable c_77c "77.C. Brave man managed to climb"

label variable c_77d "77.D. pull the children out"

label variable c_77e "77.E. small cuts"

label variable c_77f "77.F. Everyone is fine"

label variable c_78_a "Refused to answer?"

label variable g_3_file2 "START AUDIO RECORDING NOW"

label variable c_78_01 "78.1 María"

label variable c_78_02 "78.2. Moreno"

label variable c_78_03 "78.3. from Northern"

label variable c_78_04 "78.4. Santo Domingo(DR)/ Habana(Cuba)/ San Juan (PR)"

label variable c_78_05 "78.5. Worked"

label variable c_78_06 "78.6. Cook"

label variable c_78_07 "78.7. Cafeteria"

label variable c_78_08 "78.8. Corner"

label variable c_78_09 "78.9. Reported"

label variable c_78_10 "78.10. to the station"

label variable c_78_11 "78.11. Police"

label variable c_78_12 "78.12. Had been robbed"

label variable c_78_13 "78.13. in calle Duarte (DR) / avenida Paseo (Cuba) / avenida La Palma (PR)"

label variable c_78_14 "78.14. The night before"

label variable c_78_15 "78.15. And were stolen"

label variable c_78_16 "78.16. 520 pesos"

label variable c_78_17 "78.17. has 4"

label variable c_78_18 "78.18. Young children"

label variable c_78_19 "78.19. The rent is due"

label variable c_78_20 "78.20. Haven’t eaten"

label variable c_78_21 "78.21. In two days"

label variable c_78_22 "78.22. The police"

label variable c_78_23 "78.23. Moved by the woman’s story"

label variable c_78_24 "78.24. Organized a collection of money"

label variable c_78_25 "78.25. For her"

label variable c_79_1 "79.1 Did they try to draw the circle?"

label variable c_79_2 "79.2. Did they try to draw the diamond?"

label variable c_79_3 "79.3. Did they try to draw the two crossed rectangles?"

label variable c_79_4 "79.4. Did they try to draw the cube?"

capture label variable c_79_1_pic "TAKE A PHOTO OF THE CIRCLE DRAWING"

capture label variable c_79_2_pic "TAKE A PHOTO OF THE DIAMOND DRAWING"

capture label variable c_79_3_pic "TAKE A PHOTO OF THE DRAWING OF CROSSED RECTANGLES"

label variable c_79_4_pic "TAKE A PHOTO OF THE CUBE DRAWING"

label variable c_80a "80a. Did the participant have difficulty due to their vision?"

label variable c_80b "80b. Did the participant have difficulty due to their hearing?"

label variable c_80c "80c. Did the participant have difficulty due to their physical disability?"

label variable c_81 "81. How is the participant's vision (with glasses, if they normally wear them)?"

label variable c_82 "82. How is the participant's ear/hearing range (with device if normally used)?"

label variable c_deviceid2 "Device ID:"

label define checkbox_label 0 "unchecked" 1 "checked", replace

label values c_33_a checkbox_label

label values c_33_1 checkbox_label

label values c_33_2 checkbox_label

label values c_33_3 checkbox_label

label values c_33_4 checkbox_label

label values c_33_5 checkbox_label

label values c_33_6 checkbox_label

label values c_33_7 checkbox_label

label values c_33_8 checkbox_label

label values c_33_9 checkbox_label

label values c_33_10 checkbox_label

label values c_34_a checkbox_label

label values c_34_1 checkbox_label

label values c_34_2 checkbox_label

label values c_34_3 checkbox_label

label values c_34_4 checkbox_label

label values c_34_5 checkbox_label

label values c_34_6 checkbox_label

label values c_34_7 checkbox_label

label values c_34_8 checkbox_label

label values c_34_9 checkbox_label

label values c_34_10 checkbox_label

label values c_35_a checkbox_label

label values c_35_1 checkbox_label

label values c_35_2 checkbox_label

label values c_35_3 checkbox_label

label values c_35_4 checkbox_label

label values c_35_5 checkbox_label

label values c_35_6 checkbox_label

label values c_35_7 checkbox_label

label values c_35_8 checkbox_label

label values c_35_9 checkbox_label

label values c_35_10 checkbox_label

label values c_63_a checkbox_label

label values c_63_1 checkbox_label

label values c_63_2 checkbox_label

label values c_63_3 checkbox_label

label values c_63_4 checkbox_label

label values c_63_5 checkbox_label

label values c_63_6 checkbox_label

label values c_63_7 checkbox_label

label values c_63_8 checkbox_label

label values c_63_9 checkbox_label

label values c_63_10 checkbox_label

label values c_66_a checkbox_label

label values c_67_a checkbox_label

label values c_68_a checkbox_label

label values c_77_a checkbox_label

label values c_78_a checkbox_label

save Cog.dta, replace
