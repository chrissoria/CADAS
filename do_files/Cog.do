clear all 
set more off
capture log close
log using Cognitive, text replace

 cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
 
   insheet using "../CUBA_in/Cog_Child.csv", comma names clear
   
   ds, has(type string)

  local string_vars = r(varlist)

foreach var of local string_vars {

    gen `var'_trimmed = ustrlower(ustrtrim(`var'))

    replace `var' = `var'_trimmed

    drop `var'_trimmed

}

gen c_country_str = string(c_country, "%12.0f")

gen c_clustid_str = string(c_clustid, "%12.0f")
replace c_clustid_str = cond(strlen(c_clustid_str) == 1, "0" + c_clustid_str, c_clustid_str)

gen c_houseid_str = string(c_houseid, "%03.0f")
replace c_houseid_str = cond(strlen(c_houseid_str) == 1, "00" + c_houseid_str, c_houseid_str)
replace c_houseid_str = cond(strlen(c_houseid_str) == 2, "0" + c_houseid_str, c_houseid_str)

gen c_particid_str = string(c_particid, "%12.0f")
replace c_particid_str = cond(strlen(c_particid_str) == 1, "0" + c_particid_str, c_particid_str)

gen pid = c_country_str + c_clustid_str + c_houseid_str + c_particid_str
gen hhid = c_country_str + c_clustid_str + c_houseid_str
drop c_country_str c_clustid_str c_houseid_str c_particid_str

rename c_0 (C_0)

capture confirm numeric variable C_0
if !_rc{
     tostring C_0, replace
}

label define C_0 .a"." 1 "correcto"0 "incorrecto"

encode C_0, gen(c_0) label (C_0)

rename c_1 (C_1)

capture confirm numeric variable C_1
if !_rc{
     tostring C_1, replace
}

label define C_1 .a"." 1 "correcto"0 "incorrecto"

encode C_1, gen(c_1) label (C_1)

rename c_2_p_c (C_2_P_C)

capture confirm numeric variable C_2_P_C
if !_rc{
     tostring C_2_P_C, replace
}

label define C_2_P_C .a"." 1 "correcto"0 "incorrecto"

encode C_2_P_C, gen(c_2_p_c) label (C_2_P_C)

rename c_2_d (C_2_D)

capture confirm numeric variable C_2_D
if !_rc{
     tostring C_2_D, replace
}

label define C_2_D .a"." 1 "correcto"0 "incorrecto"

encode C_2_D, gen(c_2_d) label (C_2_D)

rename c_3 (C_3)

capture confirm numeric variable C_3
if !_rc{
     tostring C_3, replace
}

label define C_3 .a"." 1 "correcto"0 "incorrecto"

encode C_3, gen(c_3) label (C_3)

rename c_4 (C_4)

capture confirm numeric variable C_4
if !_rc{
     tostring C_4, replace
}

label define C_4 .a"." 1 "correcto"0 "incorrecto"

encode C_4, gen(c_4) label (C_4)

rename c_5 (C_5)

capture confirm numeric variable C_5
if !_rc{
     tostring C_5, replace
}

label define C_5 .a"." 1 "correcto"0 "incorrecto"

encode C_5, gen(c_5) label (C_5)

rename c_6 (C_6)

capture confirm numeric variable C_6
if !_rc{
     tostring C_6, replace
}

label define C_6 .a"." 1 "correcto"0 "incorrecto"

encode C_6, gen(c_6) label (C_6)

rename c_7_d_c (C_7_D_C)

capture confirm numeric variable C_7_D_C
if !_rc{
     tostring C_7_D_C, replace
}

label define C_7_D_C .a"." 1 "correcto"0 "incorrecto"

encode C_7_D_C, gen(c_7_d_c) label (C_7_D_C)

rename c_7_p (C_7_P)

capture confirm numeric variable C_7_P
if !_rc{
     tostring C_7_P, replace
}

label define C_7_P .a"." 1 "correcto"0 "incorrecto"

encode C_7_P, gen(c_7_p) label (C_7_P)

rename c_8 (C_8)

capture confirm numeric variable C_8
if !_rc{
     tostring C_8, replace
}

label define C_8 .a"." 1 "correcto"0 "incorrecto"

encode C_8, gen(c_8) label (C_8)

rename c_9 (C_9)

capture confirm numeric variable C_9
if !_rc{
     tostring C_9, replace
}

label define C_9 .a"." 1 "correcto"0 "incorrecto"

encode C_9, gen(c_9) label (C_9)

rename c_10 (C_10)

capture confirm numeric variable C_10
if !_rc{
     tostring C_10, replace
}

label define C_10 .a"." 1 "correcto"0 "incorrecto"

encode C_10, gen(c_10) label (C_10)

rename c_11 (C_11)

capture confirm numeric variable C_11
if !_rc{
     tostring C_11, replace
}

label define C_11 .a"." 1 "correcto"0 "incorrecto"

encode C_11, gen(c_11) label (C_11)

rename c_12 (C_12)

capture confirm numeric variable C_12
if !_rc{
     tostring C_12, replace
}

label define C_12 .a"." 1 "correcto"0 "incorrecto"

encode C_12, gen(c_12) label (C_12)

rename c_13 (C_13)

capture confirm numeric variable C_13
if !_rc{
     tostring C_13, replace
}

label define C_13 .a"." 1 "correcto"0 "incorrecto"

encode C_13, gen(c_13) label (C_13)

rename c_21 (C_21)

capture confirm numeric variable C_21
if !_rc{
     tostring C_21, replace
}

label define C_21 .a"." 1 "correcto"0 "incorrecto"

encode C_21, gen(c_21) label (C_21)

rename c_22 (C_22)

capture confirm numeric variable C_22
if !_rc{
     tostring C_22, replace
}

label define C_22 .a"." 1 "correcto"0 "incorrecto"

encode C_22, gen(c_22) label (C_22)

rename c_23 (C_23)

capture confirm numeric variable C_23
if !_rc{
     tostring C_23, replace
}

label define C_23 .a"." 1 "correcto"0 "incorrecto"

encode C_23, gen(c_23) label (C_23)

rename c_24 (C_24)

capture confirm numeric variable C_24
if !_rc{
     tostring C_24, replace
}

label define C_24 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_24, gen(c_24) label (C_24)

rename c_25 (C_25)

capture confirm numeric variable C_25
if !_rc{
     tostring C_25, replace
}

label define C_25 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_25, gen(c_25) label (C_25)

rename c_26 (C_26)

capture confirm numeric variable C_26
if !_rc{
     tostring C_26, replace
}

label define C_26 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_26, gen(c_26) label (C_26)

rename c_27 (C_27)

capture confirm numeric variable C_27
if !_rc{
     tostring C_27, replace
}

label define C_27 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_27, gen(c_27) label (C_27)

rename c_28 (C_28)

capture confirm numeric variable C_28
if !_rc{
     tostring C_28, replace
}

label define C_28 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_28, gen(c_28) label (C_28)

rename c_29 (C_29)

capture confirm numeric variable C_29
if !_rc{
     tostring C_29, replace
}

label define C_29 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_29, gen(c_29) label (C_29)

rename c_30 (C_30)

capture confirm numeric variable C_30
if !_rc{
     tostring C_30, replace
}

label define C_30 .a"." 1 "correcto"0 "incorrecto"5 "no pudo (anafalbeto)"6 "no pudo (limitación física)"7 "rehúsa"

encode C_30, gen(c_30) label (C_30)

rename c_31 (C_31)

capture confirm numeric variable C_31
if !_rc{
     tostring C_31, replace
}

label define C_31 .a"." 0 "0" 1 "1" 5 "no pudo (anafalbeto)"6 "no pudo (limitación física)"7 "rehúsa"

encode C_31, gen(c_31) label (C_31)

rename c_32 (C_32)

capture confirm numeric variable C_32
if !_rc{
     tostring C_32, replace
}

label define C_32 .a"." 1 "si" 6 "no pudo (limitación física)"7 "rehúsa"

encode C_32, gen(c_32) label (C_32)

rename g_1 (G_1)

capture confirm numeric variable G_1
if !_rc{
     tostring G_1, replace
}

label define G_1 .a"." 1 "sí" 2 "no" 

encode G_1, gen(g_1) label (G_1)

rename c_40 (C_40)

capture confirm numeric variable C_40
if !_rc{
     tostring C_40, replace
}

label define C_40 .a"." 0 "no" 1 "si" 777 "rehúsa"

encode C_40, gen(c_40) label (C_40)

rename c_43 (C_43)

capture confirm numeric variable C_43
if !_rc{
     tostring C_43, replace
}

label define C_43 .a"." 0 "no" 1 "si" 666 "no pudo (limitación física)"777 "rehúsa"

encode C_43, gen(c_43) label (C_43)

rename c_45 (C_45)

capture confirm numeric variable C_45
if !_rc{
     tostring C_45, replace
}

label define C_45 .a"." 1 "correcto"0 "incorrecto"2 "quiere empezar de nuevo" 7 "rehúsa"

encode C_45, gen(c_45) label (C_45)

rename c_46 (C_46)

capture confirm numeric variable C_46
if !_rc{
     tostring C_46, replace
}

label define C_46 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_46, gen(c_46) label (C_46)

rename c_48 (C_48)

capture confirm numeric variable C_48
if !_rc{
     tostring C_48, replace
}

label define C_48 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_48, gen(c_48) label (C_48)

rename c_49 (C_49)

capture confirm numeric variable C_49
if !_rc{
     tostring C_49, replace
}

label define C_49 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_49, gen(c_49) label (C_49)

rename c_50 (C_50)

capture confirm numeric variable C_50
if !_rc{
     tostring C_50, replace
}

label define C_50 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_50, gen(c_50) label (C_50)

rename c_51 (C_51)

capture confirm numeric variable C_51
if !_rc{
     tostring C_51, replace
}

label define C_51 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_51, gen(c_51) label (C_51)

rename c_52 (C_52)

capture confirm numeric variable C_52
if !_rc{
     tostring C_52, replace
}

label define C_52 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_52, gen(c_52) label (C_52)

rename c_53 (C_53)

capture confirm numeric variable C_53
if !_rc{
     tostring C_53, replace
}

label define C_53 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_53, gen(c_53) label (C_53)

rename c_54 (C_54)

capture confirm numeric variable C_54
if !_rc{
     tostring C_54, replace
}

label define C_54 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_54, gen(c_54) label (C_54)

rename c_55 (C_55)

capture confirm numeric variable C_55
if !_rc{
     tostring C_55, replace
}

label define C_55 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_55, gen(c_55) label (C_55)

rename c_56 (C_56)

capture confirm numeric variable C_56
if !_rc{
     tostring C_56, replace
}

label define C_56 .a"." 1 "correcto"0 "incorrecto"7 "rehúsa"

encode C_56, gen(c_56) label (C_56)

rename c_58 (C_58)

capture confirm numeric variable C_58
if !_rc{
     tostring C_58, replace
}

label define C_58 .a"." 1 "sí respondió" 2 "no respondió" 

encode C_58, gen(c_58) label (C_58)

rename c_59 (C_59)

capture confirm numeric variable C_59
if !_rc{
     tostring C_59, replace
}

label define C_59 .a"." 1 "sí respondió" 2 "no respondió" 

encode C_59, gen(c_59) label (C_59)

rename c_60 (C_60)

capture confirm numeric variable C_60
if !_rc{
     tostring C_60, replace
}

label define C_60 .a"." 1 "sí respondió" 2 "no respondió" 

encode C_60, gen(c_60) label (C_60)

rename c_61 (C_61)

capture confirm numeric variable C_61
if !_rc{
     tostring C_61, replace
}

label define C_61 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_61, gen(c_61) label (C_61)

rename c_62 (C_62)

capture confirm numeric variable C_62
if !_rc{
     tostring C_62, replace
}

label define C_62 .a"." 1 "correcto"0 "incorrecto"6 "no pudo (limitación física)"7 "rehúsa"

encode C_62, gen(c_62) label (C_62)

rename c_65 (C_65)

capture confirm numeric variable C_65
if !_rc{
     tostring C_65, replace
}

label define C_65 .a"." 1 "correcto"0 "incorrecto"

encode C_65, gen(c_65) label (C_65)

rename g_2 (G_2)

capture confirm numeric variable G_2
if !_rc{
     tostring G_2, replace
}

label define G_2 .a"." 1 "sí" 2 "no" 

encode G_2, gen(g_2) label (G_2)

rename c_66a (C_66A)

capture confirm numeric variable C_66A
if !_rc{
     tostring C_66A, replace
}

label define C_66A .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66A, gen(c_66a) label (C_66A)

rename c_66b (C_66B)

capture confirm numeric variable C_66B
if !_rc{
     tostring C_66B, replace
}

label define C_66B .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66B, gen(c_66b) label (C_66B)

rename c_66c (C_66C)

capture confirm numeric variable C_66C
if !_rc{
     tostring C_66C, replace
}

label define C_66C .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66C, gen(c_66c) label (C_66C)

rename c_66d (C_66D)

capture confirm numeric variable C_66D
if !_rc{
     tostring C_66D, replace
}

label define C_66D .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66D, gen(c_66d) label (C_66D)

rename c_66e (C_66E)

capture confirm numeric variable C_66E
if !_rc{
     tostring C_66E, replace
}

label define C_66E .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66E, gen(c_66e) label (C_66E)

rename c_66f (C_66F)

capture confirm numeric variable C_66F
if !_rc{
     tostring C_66F, replace
}

label define C_66F .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_66F, gen(c_66f) label (C_66F)

rename c_67_01 (C_67_01)

capture confirm numeric variable C_67_01
if !_rc{
     tostring C_67_01, replace
}

label define C_67_01 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_01, gen(c_67_01) label (C_67_01)

rename c_67_02 (C_67_02)

capture confirm numeric variable C_67_02
if !_rc{
     tostring C_67_02, replace
}

label define C_67_02 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_02, gen(c_67_02) label (C_67_02)

rename c_67_03 (C_67_03)

capture confirm numeric variable C_67_03
if !_rc{
     tostring C_67_03, replace
}

label define C_67_03 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_03, gen(c_67_03) label (C_67_03)

rename c_67_04 (C_67_04)

capture confirm numeric variable C_67_04
if !_rc{
     tostring C_67_04, replace
}

label define C_67_04 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_04, gen(c_67_04) label (C_67_04)

rename c_67_05 (C_67_05)

capture confirm numeric variable C_67_05
if !_rc{
     tostring C_67_05, replace
}

label define C_67_05 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_05, gen(c_67_05) label (C_67_05)

rename c_67_06 (C_67_06)

capture confirm numeric variable C_67_06
if !_rc{
     tostring C_67_06, replace
}

label define C_67_06 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_06, gen(c_67_06) label (C_67_06)

rename c_67_07 (C_67_07)

capture confirm numeric variable C_67_07
if !_rc{
     tostring C_67_07, replace
}

label define C_67_07 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_07, gen(c_67_07) label (C_67_07)

rename c_67_08 (C_67_08)

capture confirm numeric variable C_67_08
if !_rc{
     tostring C_67_08, replace
}

label define C_67_08 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_08, gen(c_67_08) label (C_67_08)

rename c_67_09 (C_67_09)

capture confirm numeric variable C_67_09
if !_rc{
     tostring C_67_09, replace
}

label define C_67_09 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_09, gen(c_67_09) label (C_67_09)

rename c_67_10 (C_67_10)

capture confirm numeric variable C_67_10
if !_rc{
     tostring C_67_10, replace
}

label define C_67_10 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_10, gen(c_67_10) label (C_67_10)

rename c_67_11 (C_67_11)

capture confirm numeric variable C_67_11
if !_rc{
     tostring C_67_11, replace
}

label define C_67_11 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_11, gen(c_67_11) label (C_67_11)

rename c_67_12 (C_67_12)

capture confirm numeric variable C_67_12
if !_rc{
     tostring C_67_12, replace
}

label define C_67_12 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_12, gen(c_67_12) label (C_67_12)

rename c_67_13_c (C_67_13_C)

capture confirm numeric variable C_67_13_C
if !_rc{
     tostring C_67_13_C, replace
}

label define C_67_13_C .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_13_C, gen(c_67_13_c) label (C_67_13_C)

rename c_67_13_d (C_67_13_D)

capture confirm numeric variable C_67_13_D
if !_rc{
     tostring C_67_13_D, replace
}

label define C_67_13_D .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_13_D, gen(c_67_13_d) label (C_67_13_D)

rename c_67_13_p (C_67_13_P)

capture confirm numeric variable C_67_13_P
if !_rc{
     tostring C_67_13_P, replace
}

label define C_67_13_P .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_13_P, gen(c_67_13_p) label (C_67_13_P)

rename c_67_14 (C_67_14)

capture confirm numeric variable C_67_14
if !_rc{
     tostring C_67_14, replace
}

label define C_67_14 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_14, gen(c_67_14) label (C_67_14)

rename c_67_15 (C_67_15)

capture confirm numeric variable C_67_15
if !_rc{
     tostring C_67_15, replace
}

label define C_67_15 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_15, gen(c_67_15) label (C_67_15)

rename c_67_16 (C_67_16)

capture confirm numeric variable C_67_16
if !_rc{
     tostring C_67_16, replace
}

label define C_67_16 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_16, gen(c_67_16) label (C_67_16)

rename c_67_17 (C_67_17)

capture confirm numeric variable C_67_17
if !_rc{
     tostring C_67_17, replace
}

label define C_67_17 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_17, gen(c_67_17) label (C_67_17)

rename c_67_18 (C_67_18)

capture confirm numeric variable C_67_18
if !_rc{
     tostring C_67_18, replace
}

label define C_67_18 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_18, gen(c_67_18) label (C_67_18)

rename c_67_19 (C_67_19)

capture confirm numeric variable C_67_19
if !_rc{
     tostring C_67_19, replace
}

label define C_67_19 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_19, gen(c_67_19) label (C_67_19)

rename c_67_20 (C_67_20)

capture confirm numeric variable C_67_20
if !_rc{
     tostring C_67_20, replace
}

label define C_67_20 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_20, gen(c_67_20) label (C_67_20)

rename c_67_21 (C_67_21)

capture confirm numeric variable C_67_21
if !_rc{
     tostring C_67_21, replace
}

label define C_67_21 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_21, gen(c_67_21) label (C_67_21)

rename c_67_22 (C_67_22)

capture confirm numeric variable C_67_22
if !_rc{
     tostring C_67_22, replace
}

label define C_67_22 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_22, gen(c_67_22) label (C_67_22)

rename c_67_23 (C_67_23)

capture confirm numeric variable C_67_23
if !_rc{
     tostring C_67_23, replace
}

label define C_67_23 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_23, gen(c_67_23) label (C_67_23)

rename c_67_24 (C_67_24)

capture confirm numeric variable C_67_24
if !_rc{
     tostring C_67_24, replace
}

label define C_67_24 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_24, gen(c_67_24) label (C_67_24)

rename c_67_25 (C_67_25)

capture confirm numeric variable C_67_25
if !_rc{
     tostring C_67_25, replace
}

label define C_67_25 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_67_25, gen(c_67_25) label (C_67_25)

rename c_68_01 (C_68_01)

capture confirm numeric variable C_68_01
if !_rc{
     tostring C_68_01, replace
}

label define C_68_01 .a"." 1 "sí" 2 "no" 

encode C_68_01, gen(c_68_01) label (C_68_01)

rename c_68_02 (C_68_02)

capture confirm numeric variable C_68_02
if !_rc{
     tostring C_68_02, replace
}

label define C_68_02 .a"." 1 "sí" 2 "no" 

encode C_68_02, gen(c_68_02) label (C_68_02)

rename c_68_03 (C_68_03)

capture confirm numeric variable C_68_03
if !_rc{
     tostring C_68_03, replace
}

label define C_68_03 .a"." 1 "sí" 2 "no" 

encode C_68_03, gen(c_68_03) label (C_68_03)

rename c_68_04 (C_68_04)

capture confirm numeric variable C_68_04
if !_rc{
     tostring C_68_04, replace
}

label define C_68_04 .a"." 1 "sí" 2 "no" 

encode C_68_04, gen(c_68_04) label (C_68_04)

rename c_68_05 (C_68_05)

capture confirm numeric variable C_68_05
if !_rc{
     tostring C_68_05, replace
}

label define C_68_05 .a"." 1 "sí" 2 "no" 

encode C_68_05, gen(c_68_05) label (C_68_05)

rename c_68_06 (C_68_06)

capture confirm numeric variable C_68_06
if !_rc{
     tostring C_68_06, replace
}

label define C_68_06 .a"." 1 "sí" 2 "no" 

encode C_68_06, gen(c_68_06) label (C_68_06)

rename c_68_07 (C_68_07)

capture confirm numeric variable C_68_07
if !_rc{
     tostring C_68_07, replace
}

label define C_68_07 .a"." 1 "sí" 2 "no" 

encode C_68_07, gen(c_68_07) label (C_68_07)

rename c_68_08 (C_68_08)

capture confirm numeric variable C_68_08
if !_rc{
     tostring C_68_08, replace
}

label define C_68_08 .a"." 1 "sí" 2 "no" 

encode C_68_08, gen(c_68_08) label (C_68_08)

rename c_68_09 (C_68_09)

capture confirm numeric variable C_68_09
if !_rc{
     tostring C_68_09, replace
}

label define C_68_09 .a"." 1 "sí" 2 "no" 

encode C_68_09, gen(c_68_09) label (C_68_09)

rename c_68_10 (C_68_10)

capture confirm numeric variable C_68_10
if !_rc{
     tostring C_68_10, replace
}

label define C_68_10 .a"." 1 "sí" 2 "no" 

encode C_68_10, gen(c_68_10) label (C_68_10)

rename c_68_11 (C_68_11)

capture confirm numeric variable C_68_11
if !_rc{
     tostring C_68_11, replace
}

label define C_68_11 .a"." 1 "sí" 2 "no" 

encode C_68_11, gen(c_68_11) label (C_68_11)

rename c_68_12 (C_68_12)

capture confirm numeric variable C_68_12
if !_rc{
     tostring C_68_12, replace
}

label define C_68_12 .a"." 1 "sí" 2 "no" 

encode C_68_12, gen(c_68_12) label (C_68_12)

rename c_68_13 (C_68_13)

capture confirm numeric variable C_68_13
if !_rc{
     tostring C_68_13, replace
}

label define C_68_13 .a"." 1 "sí" 2 "no" 

encode C_68_13, gen(c_68_13) label (C_68_13)

rename c_68_14 (C_68_14)

capture confirm numeric variable C_68_14
if !_rc{
     tostring C_68_14, replace
}

label define C_68_14 .a"." 1 "sí" 2 "no" 

encode C_68_14, gen(c_68_14) label (C_68_14)

rename c_68_15 (C_68_15)

capture confirm numeric variable C_68_15
if !_rc{
     tostring C_68_15, replace
}

label define C_68_15 .a"." 1 "sí" 2 "no" 

encode C_68_15, gen(c_68_15) label (C_68_15)

rename c_68_16 (C_68_16)

capture confirm numeric variable C_68_16
if !_rc{
     tostring C_68_16, replace
}

label define C_68_16 .a"." 1 "sí" 2 "no" 

encode C_68_16, gen(c_68_16) label (C_68_16)

rename c_68_17 (C_68_17)

capture confirm numeric variable C_68_17
if !_rc{
     tostring C_68_17, replace
}

label define C_68_17 .a"." 1 "sí" 2 "no" 

encode C_68_17, gen(c_68_17) label (C_68_17)

rename c_68_18 (C_68_18)

capture confirm numeric variable C_68_18
if !_rc{
     tostring C_68_18, replace
}

label define C_68_18 .a"." 1 "sí" 2 "no" 

encode C_68_18, gen(c_68_18) label (C_68_18)

rename c_68_19 (C_68_19)

capture confirm numeric variable C_68_19
if !_rc{
     tostring C_68_19, replace
}

label define C_68_19 .a"." 1 "sí" 2 "no" 

encode C_68_19, gen(c_68_19) label (C_68_19)

rename c_68_20 (C_68_20)

capture confirm numeric variable C_68_20
if !_rc{
     tostring C_68_20, replace
}

label define C_68_20 .a"." 1 "sí" 2 "no" 

encode C_68_20, gen(c_68_20) label (C_68_20)

rename c_69_c (C_69_C)

capture confirm numeric variable C_69_C
if !_rc{
     tostring C_69_C, replace
}

label define C_69_C .a"." 1 "correcto"0 "incorrecto"

encode C_69_C, gen(c_69_c) label (C_69_C)

rename c_69_d (C_69_D)

capture confirm numeric variable C_69_D
if !_rc{
     tostring C_69_D, replace
}

label define C_69_D .a"." 1 "correcto"0 "incorrecto"

encode C_69_D, gen(c_69_d) label (C_69_D)

rename c_69_p (C_69_P)

capture confirm numeric variable C_69_P
if !_rc{
     tostring C_69_P, replace
}

label define C_69_P .a"." 1 "correcto"0 "incorrecto"

encode C_69_P, gen(c_69_p) label (C_69_P)

rename c_70_d_c (C_70_D_C)

capture confirm numeric variable C_70_D_C
if !_rc{
     tostring C_70_D_C, replace
}

label define C_70_D_C .a"." 1 "correcto"0 "incorrecto"

encode C_70_D_C, gen(c_70_d_c) label (C_70_D_C)

rename c_70_p (C_70_P)

capture confirm numeric variable C_70_P
if !_rc{
     tostring C_70_P, replace
}

label define C_70_P .a"." 1 "correcto"0 "incorrecto"

encode C_70_P, gen(c_70_p) label (C_70_P)

rename c_71_c (C_71_C)

capture confirm numeric variable C_71_C
if !_rc{
     tostring C_71_C, replace
}

label define C_71_C .a"." 1 "correcto"0 "incorrecto"

encode C_71_C, gen(c_71_c) label (C_71_C)

rename c_71_p (C_71_P)

capture confirm numeric variable C_71_P
if !_rc{
     tostring C_71_P, replace
}

label define C_71_P .a"." 1 "correcto"0 "incorrecto"

encode C_71_P, gen(c_71_p) label (C_71_P)

rename c_71_d (C_71_D)

capture confirm numeric variable C_71_D
if !_rc{
     tostring C_71_D, replace
}

label define C_71_D .a"." 1 "correcto"0 "incorrecto"

encode C_71_D, gen(c_71_d) label (C_71_D)

rename c_72_1 (C_72_1)

capture confirm numeric variable C_72_1
if !_rc{
     tostring C_72_1, replace
}

label define C_72_1 .a"." 1 "si" 6 "no pudo (limitación física)"7 "rehúsa"

encode C_72_1, gen(c_72_1) label (C_72_1)

rename c_72_2 (C_72_2)

capture confirm numeric variable C_72_2
if !_rc{
     tostring C_72_2, replace
}

label define C_72_2 .a"." 1 "si" 6 "no pudo (limitación física)"7 "rehúsa"

encode C_72_2, gen(c_72_2) label (C_72_2)

rename c_72_3 (C_72_3)

capture confirm numeric variable C_72_3
if !_rc{
     tostring C_72_3, replace
}

label define C_72_3 .a"." 1 "si" 6 "no pudo (limitación física)"7 "rehúsa"

encode C_72_3, gen(c_72_3) label (C_72_3)

rename c_72_4 (C_72_4)

capture confirm numeric variable C_72_4
if !_rc{
     tostring C_72_4, replace
}

label define C_72_4 .a"." 1 "si" 6 "no pudo (limitación física)"7 "rehúsa"

encode C_72_4, gen(c_72_4) label (C_72_4)

rename g_3 (G_3)

capture confirm numeric variable G_3
if !_rc{
     tostring G_3, replace
}

label define G_3 .a"." 1 "sí" 2 "no" 

encode G_3, gen(g_3) label (G_3)

rename c_77a (C_77A)

capture confirm numeric variable C_77A
if !_rc{
     tostring C_77A, replace
}

label define C_77A .a"." 0 "sí exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77A, gen(c_77a) label (C_77A)

rename c_77b (C_77B)

capture confirm numeric variable C_77B
if !_rc{
     tostring C_77B, replace
}

label define C_77B .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77B, gen(c_77b) label (C_77B)

rename c_77c (C_77C)

capture confirm numeric variable C_77C
if !_rc{
     tostring C_77C, replace
}

label define C_77C .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77C, gen(c_77c) label (C_77C)

rename c_77d (C_77D)

capture confirm numeric variable C_77D
if !_rc{
     tostring C_77D, replace
}

label define C_77D .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77D, gen(c_77d) label (C_77D)

rename c_77e (C_77E)

capture confirm numeric variable C_77E
if !_rc{
     tostring C_77E, replace
}

label define C_77E .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77E, gen(c_77e) label (C_77E)

rename c_77f (C_77F)

capture confirm numeric variable C_77F
if !_rc{
     tostring C_77F, replace
}

label define C_77F .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_77F, gen(c_77f) label (C_77F)

rename c_78_01 (C_78_01)

capture confirm numeric variable C_78_01
if !_rc{
     tostring C_78_01, replace
}

label define C_78_01 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_01, gen(c_78_01) label (C_78_01)

rename c_78_02 (C_78_02)

capture confirm numeric variable C_78_02
if !_rc{
     tostring C_78_02, replace
}

label define C_78_02 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_02, gen(c_78_02) label (C_78_02)

rename c_78_03 (C_78_03)

capture confirm numeric variable C_78_03
if !_rc{
     tostring C_78_03, replace
}

label define C_78_03 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_03, gen(c_78_03) label (C_78_03)

rename c_78_04 (C_78_04)

capture confirm numeric variable C_78_04
if !_rc{
     tostring C_78_04, replace
}

label define C_78_04 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_04, gen(c_78_04) label (C_78_04)

rename c_78_05 (C_78_05)

capture confirm numeric variable C_78_05
if !_rc{
     tostring C_78_05, replace
}

label define C_78_05 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_05, gen(c_78_05) label (C_78_05)

rename c_78_06 (C_78_06)

capture confirm numeric variable C_78_06
if !_rc{
     tostring C_78_06, replace
}

label define C_78_06 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_06, gen(c_78_06) label (C_78_06)

rename c_78_07 (C_78_07)

capture confirm numeric variable C_78_07
if !_rc{
     tostring C_78_07, replace
}

label define C_78_07 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_07, gen(c_78_07) label (C_78_07)

rename c_78_08 (C_78_08)

capture confirm numeric variable C_78_08
if !_rc{
     tostring C_78_08, replace
}

label define C_78_08 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_08, gen(c_78_08) label (C_78_08)

rename c_78_09 (C_78_09)

capture confirm numeric variable C_78_09
if !_rc{
     tostring C_78_09, replace
}

label define C_78_09 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_09, gen(c_78_09) label (C_78_09)

rename c_78_10 (C_78_10)

capture confirm numeric variable C_78_10
if !_rc{
     tostring C_78_10, replace
}

label define C_78_10 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_10, gen(c_78_10) label (C_78_10)

rename c_78_11 (C_78_11)

capture confirm numeric variable C_78_11
if !_rc{
     tostring C_78_11, replace
}

label define C_78_11 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_11, gen(c_78_11) label (C_78_11)

rename c_78_12 (C_78_12)

capture confirm numeric variable C_78_12
if !_rc{
     tostring C_78_12, replace
}

label define C_78_12 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_12, gen(c_78_12) label (C_78_12)

rename c_78_13 (C_78_13)

capture confirm numeric variable C_78_13
if !_rc{
     tostring C_78_13, replace
}

label define C_78_13 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_13, gen(c_78_13) label (C_78_13)

rename c_78_14 (C_78_14)

capture confirm numeric variable C_78_14
if !_rc{
     tostring C_78_14, replace
}

label define C_78_14 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_14, gen(c_78_14) label (C_78_14)

rename c_78_15 (C_78_15)

capture confirm numeric variable C_78_15
if !_rc{
     tostring C_78_15, replace
}

label define C_78_15 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_15, gen(c_78_15) label (C_78_15)

rename c_78_16 (C_78_16)

capture confirm numeric variable C_78_16
if !_rc{
     tostring C_78_16, replace
}

label define C_78_16 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_16, gen(c_78_16) label (C_78_16)

rename c_78_17 (C_78_17)

capture confirm numeric variable C_78_17
if !_rc{
     tostring C_78_17, replace
}

label define C_78_17 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_17, gen(c_78_17) label (C_78_17)

rename c_78_18 (C_78_18)

capture confirm numeric variable C_78_18
if !_rc{
     tostring C_78_18, replace
}

label define C_78_18 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_18, gen(c_78_18) label (C_78_18)

rename c_78_19 (C_78_19)

capture confirm numeric variable C_78_19
if !_rc{
     tostring C_78_19, replace
}

label define C_78_19 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_19, gen(c_78_19) label (C_78_19)

rename c_78_20 (C_78_20)

capture confirm numeric variable C_78_20
if !_rc{
     tostring C_78_20, replace
}

label define C_78_20 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_20, gen(c_78_20) label (C_78_20)

rename c_78_21 (C_78_21)

capture confirm numeric variable C_78_21
if !_rc{
     tostring C_78_21, replace
}

label define C_78_21 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_21, gen(c_78_21) label (C_78_21)

rename c_78_22 (C_78_22)

capture confirm numeric variable C_78_22
if !_rc{
     tostring C_78_22, replace
}

label define C_78_22 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_22, gen(c_78_22) label (C_78_22)

rename c_78_23 (C_78_23)

capture confirm numeric variable C_78_23
if !_rc{
     tostring C_78_23, replace
}

label define C_78_23 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_23, gen(c_78_23) label (C_78_23)

rename c_78_24 (C_78_24)

capture confirm numeric variable C_78_24
if !_rc{
     tostring C_78_24, replace
}

label define C_78_24 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_24, gen(c_78_24) label (C_78_24)

rename c_78_25 (C_78_25)

capture confirm numeric variable C_78_25
if !_rc{
     tostring C_78_25, replace
}

label define C_78_25 .a"." 0 "si exacta" 1 "sí aproximada" 2 "olvida el elemento" 

encode C_78_25, gen(c_78_25) label (C_78_25)

rename c_79_1 (C_79_1)

capture confirm numeric variable C_79_1
if !_rc{
     tostring C_79_1, replace
}

label define C_79_1 .a"." 1 "si" 6 "no pudo (limitación física)"4 "no pudo recordar la figura" 7 "rehúsa"

encode C_79_1, gen(c_79_1) label (C_79_1)

rename c_79_2 (C_79_2)

capture confirm numeric variable C_79_2
if !_rc{
     tostring C_79_2, replace
}

label define C_79_2 .a"." 1 "si" 6 "no pudo (limitación física)"4 "no pudo recordar la figura" 7 "rehúsa"

encode C_79_2, gen(c_79_2) label (C_79_2)

rename c_79_3 (C_79_3)

capture confirm numeric variable C_79_3
if !_rc{
     tostring C_79_3, replace
}

label define C_79_3 .a"." 1 "si" 6 "no pudo (limitación física)"4 "no pudo recordar la figura" 7 "rehúsa"

encode C_79_3, gen(c_79_3) label (C_79_3)

rename c_79_4 (C_79_4)

capture confirm numeric variable C_79_4
if !_rc{
     tostring C_79_4, replace
}

label define C_79_4 .a"." 1 "si" 6 "no pudo (limitación física)"4 "no pudo recordar la figura" 7 "rehúsa"

encode C_79_4, gen(c_79_4) label (C_79_4)

rename c_80a (C_80A)

capture confirm numeric variable C_80A
if !_rc{
     tostring C_80A, replace
}

label define C_80A .a"." 2 "no" 1 "si" 

encode C_80A, gen(c_80a) label (C_80A)

rename c_80b (C_80B)

capture confirm numeric variable C_80B
if !_rc{
     tostring C_80B, replace
}

label define C_80B .a"." 2 "no" 1 "si" 

encode C_80B, gen(c_80b) label (C_80B)

rename c_80c (C_80C)

capture confirm numeric variable C_80C
if !_rc{
     tostring C_80C, replace
}

label define C_80C .a"." 2 "no" 1 "si" 

encode C_80C, gen(c_80c) label (C_80C)

rename c_81 (C_81)

capture confirm numeric variable C_81
if !_rc{
     tostring C_81, replace
}

label define C_81 .a"." 1 "excelente" 2 "muy buena" 3 "buena" 4 "regular" 5 "mala" 6 "ciego" 

encode C_81, gen(c_81) label (C_81)

rename c_82 (C_82)

capture confirm numeric variable C_82
if !_rc{
     tostring C_82, replace
}

label define C_82 .a"." 1 "excelente" 2 "muy buena" 3 "buena" 4 "regular" 5 "mala" 6 "sordo" 

encode C_82, gen(c_82) label (C_82)

rename c_33_a (C_33_A)

label define C_33_A 0 "false" 7 "true"

encode C_33_A, gen (c_33_a) label (C_33_A)

drop C_33_A

rename c_33_1 (C_33_1)

label define C_33_1 0 "false" 1 "true"

encode C_33_1, gen (c_33_1) label (C_33_1)

drop C_33_1

rename c_33_2 (C_33_2)

label define C_33_2 0 "false" 1 "true"

encode C_33_2, gen (c_33_2) label (C_33_2)

drop C_33_2

rename c_33_3 (C_33_3)

label define C_33_3 0 "false" 1 "true"

encode C_33_3, gen (c_33_3) label (C_33_3)

drop C_33_3

rename c_33_4 (C_33_4)

label define C_33_4 0 "false" 1 "true"

encode C_33_4, gen (c_33_4) label (C_33_4)

drop C_33_4

rename c_33_5 (C_33_5)

label define C_33_5 0 "false" 1 "true"

encode C_33_5, gen (c_33_5) label (C_33_5)

drop C_33_5

rename c_33_6 (C_33_6)

label define C_33_6 0 "false" 1 "true"

encode C_33_6, gen (c_33_6) label (C_33_6)

drop C_33_6

rename c_33_7 (C_33_7)

label define C_33_7 0 "false" 1 "true"

encode C_33_7, gen (c_33_7) label (C_33_7)

drop C_33_7

rename c_33_8 (C_33_8)

label define C_33_8 0 "false" 1 "true"

encode C_33_8, gen (c_33_8) label (C_33_8)

drop C_33_8

rename c_33_9 (C_33_9)

label define C_33_9 0 "false" 1 "true"

encode C_33_9, gen (c_33_9) label (C_33_9)

drop C_33_9

rename c_33_10 (C_33_10)

label define C_33_10 0 "false" 1 "true"

encode C_33_10, gen (c_33_10) label (C_33_10)

drop C_33_10

rename c_34_a (C_34_A)

label define C_34_A 0 "false" 7 "true"

encode C_34_A, gen (c_34_a) label (C_34_A)

drop C_34_A

rename c_34_1 (C_34_1)

label define C_34_1 0 "false" 1 "true"

encode C_34_1, gen (c_34_1) label (C_34_1)

drop C_34_1

rename c_34_2 (C_34_2)

label define C_34_2 0 "false" 1 "true"

encode C_34_2, gen (c_34_2) label (C_34_2)

drop C_34_2

rename c_34_3 (C_34_3)

label define C_34_3 0 "false" 1 "true"

encode C_34_3, gen (c_34_3) label (C_34_3)

drop C_34_3

rename c_34_4 (C_34_4)

label define C_34_4 0 "false" 1 "true"

encode C_34_4, gen (c_34_4) label (C_34_4)

drop C_34_4

rename c_34_5 (C_34_5)

label define C_34_5 0 "false" 1 "true"

encode C_34_5, gen (c_34_5) label (C_34_5)

drop C_34_5

rename c_34_6 (C_34_6)

label define C_34_6 0 "false" 1 "true"

encode C_34_6, gen (c_34_6) label (C_34_6)

drop C_34_6

rename c_34_7 (C_34_7)

label define C_34_7 0 "false" 1 "true"

encode C_34_7, gen (c_34_7) label (C_34_7)

drop C_34_7

rename c_34_8 (C_34_8)

label define C_34_8 0 "false" 1 "true"

encode C_34_8, gen (c_34_8) label (C_34_8)

drop C_34_8

rename c_34_9 (C_34_9)

label define C_34_9 0 "false" 1 "true"

encode C_34_9, gen (c_34_9) label (C_34_9)

drop C_34_9

rename c_34_10 (C_34_10)

label define C_34_10 0 "false" 1 "true"

encode C_34_10, gen (c_34_10) label (C_34_10)

drop C_34_10

rename c_35_a (C_35_A)

label define C_35_A 0 "false" 7 "true"

encode C_35_A, gen (c_35_a) label (C_35_A)

drop C_35_A

rename c_35_1 (C_35_1)

label define C_35_1 0 "false" 1 "true"

encode C_35_1, gen (c_35_1) label (C_35_1)

drop C_35_1

rename c_35_2 (C_35_2)

label define C_35_2 0 "false" 1 "true"

encode C_35_2, gen (c_35_2) label (C_35_2)

drop C_35_2

rename c_35_3 (C_35_3)

label define C_35_3 0 "false" 1 "true"

encode C_35_3, gen (c_35_3) label (C_35_3)

drop C_35_3

rename c_35_4 (C_35_4)

label define C_35_4 0 "false" 1 "true"

encode C_35_4, gen (c_35_4) label (C_35_4)

drop C_35_4

rename c_35_5 (C_35_5)

label define C_35_5 0 "false" 1 "true"

encode C_35_5, gen (c_35_5) label (C_35_5)

drop C_35_5

rename c_35_6 (C_35_6)

label define C_35_6 0 "false" 1 "true"

encode C_35_6, gen (c_35_6) label (C_35_6)

drop C_35_6

rename c_35_7 (C_35_7)

label define C_35_7 0 "false" 1 "true"

encode C_35_7, gen (c_35_7) label (C_35_7)

drop C_35_7

rename c_35_8 (C_35_8)

label define C_35_8 0 "false" 1 "true"

encode C_35_8, gen (c_35_8) label (C_35_8)

drop C_35_8

rename c_35_9 (C_35_9)

label define C_35_9 0 "false" 1 "true"

encode C_35_9, gen (c_35_9) label (C_35_9)

drop C_35_9

rename c_35_10 (C_35_10)

label define C_35_10 0 "false" 1 "true"

encode C_35_10, gen (c_35_10) label (C_35_10)

drop C_35_10

rename c_63_a (C_63_A)

label define C_63_A 0 "false" 7 "true"

encode C_63_A, gen (c_63_a) label (C_63_A)

drop C_63_A

rename c_63_1 (C_63_1)

label define C_63_1 0 "false" 1 "true"

encode C_63_1, gen (c_63_1) label (C_63_1)

drop C_63_1

rename c_63_2 (C_63_2)

label define C_63_2 0 "false" 1 "true"

encode C_63_2, gen (c_63_2) label (C_63_2)

drop C_63_2

rename c_63_3 (C_63_3)

label define C_63_3 0 "false" 1 "true"

encode C_63_3, gen (c_63_3) label (C_63_3)

drop C_63_3

rename c_63_4 (C_63_4)

label define C_63_4 0 "false" 1 "true"

encode C_63_4, gen (c_63_4) label (C_63_4)

drop C_63_4

rename c_63_5 (C_63_5)

label define C_63_5 0 "false" 1 "true"

encode C_63_5, gen (c_63_5) label (C_63_5)

drop C_63_5

rename c_63_6 (C_63_6)

label define C_63_6 0 "false" 1 "true"

encode C_63_6, gen (c_63_6) label (C_63_6)

drop C_63_6

rename c_63_7 (C_63_7)

label define C_63_7 0 "false" 1 "true"

encode C_63_7, gen (c_63_7) label (C_63_7)

drop C_63_7

rename c_63_8 (C_63_8)

label define C_63_8 0 "false" 1 "true"

encode C_63_8, gen (c_63_8) label (C_63_8)

drop C_63_8

rename c_63_9 (C_63_9)

label define C_63_9 0 "false" 1 "true"

encode C_63_9, gen (c_63_9) label (C_63_9)

drop C_63_9

rename c_63_10 (C_63_10)

label define C_63_10 0 "false" 1 "true"

encode C_63_10, gen (c_63_10) label (C_63_10)

drop C_63_10

rename c_66_a (C_66_A)

label define C_66_A 0 "false" 7 "true"

encode C_66_A, gen (c_66_a) label (C_66_A)

drop C_66_A

rename c_67_a (C_67_A)

label define C_67_A 0 "false" 7 "true"

encode C_67_A, gen (c_67_a) label (C_67_A)

drop C_67_A

rename c_68_a (C_68_A)

label define C_68_A 0 "false" 7 "true"

encode C_68_A, gen (c_68_a) label (C_68_A)

drop C_68_A

rename c_77_a (C_77_A)

label define C_77_A 0 "false" 7 "true"

encode C_77_A, gen (c_77_a) label (C_77_A)

drop C_77_A

rename c_78_a (C_78_A)

label define C_78_A 0 "false" 7 "true"

encode C_78_A, gen (c_78_a) label (C_78_A)

drop C_78_A

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

*reorder

order c_interid c_houseid c_clustid c_particid c_country c_houseid2 c_conglid2 c_particid2 c_deviceid1 c_0 c_1 c_2_p_c c_2_d c_3 c_4 c_5 c_6 c_7_d_c c_7_p c_8 c_9 c_10 c_11 c_12 c_13 c_14 c_15 c_16 c_17 c_18 c_19 c_20 c_21 c_22 c_23 c_24 c_25 c_26 c_26_1 c_27 c_28 c_29 c_30 c_31 c_32 pent_pic c_33_a c_33_1 c_33_2 c_33_3 c_33_4 c_33_5 c_33_6 c_33_7 c_33_8 c_33_9 c_33_10 c_34_a c_34_1 c_34_2 c_34_3 c_34_4 c_34_5 c_34_6 c_34_7 c_34_8 c_34_9 c_34_10 c_35_a c_35_1 c_35_2 c_35_3 c_35_4 c_35_5 c_35_6 c_35_7 c_35_8 c_35_9 c_35_10 g_1 g_1_file c_40 anim_pic c_43 symb_pic c_45 c_45_a c_46 c_46_a c_48 c_49 c_50 c_51 c_52 c_53 c_54 c_55 c_56 c_58 c_59 c_60 c_61 c_62 c_63_a c_63_1 c_63_2 c_63_3 c_63_4 c_63_5 c_63_6 c_63_7 c_63_8 c_63_9 c_63_10 c_65 g_2 c_66_a g_2_file c_66a c_66b c_66c c_66d c_66e c_66f c_67_a g_2_file2 c_67_01 c_67_02 c_67_03 c_67_04 c_67_05 c_67_06 c_67_07 c_67_08 c_67_09 c_67_10 c_67_11 c_67_12 c_67_13_c c_67_13_d c_67_13_p c_67_14 c_67_15 c_67_16 c_67_17 c_67_18 c_67_19 c_67_20 c_67_21 c_67_22 c_67_23 c_67_24 c_67_25 c_68_a c_68_01 c_68_02 c_68_03 c_68_04 c_68_05 c_68_06 c_68_07 c_68_08 c_68_09 c_68_10 c_68_11 c_68_12 c_68_13 c_68_14 c_68_15 c_68_16 c_68_17 c_68_18 c_68_19 c_68_20 c_69_c c_69_d c_69_p c_70_d_c c_70_p c_71_c c_71_p c_71_d c_72_1 c_72_2 c_72_3 c_72_4 c_72_4_pic g_3 c_77_a g_3_file c_77a c_77b c_77c c_77d c_77e c_77f c_78_a g_3_file2 c_78_01 c_78_02 c_78_03 c_78_04 c_78_05 c_78_06 c_78_07 c_78_08 c_78_09 c_78_10 c_78_11 c_78_12 c_78_13 c_78_14 c_78_15 c_78_16 c_78_17 c_78_18 c_78_19 c_78_20 c_78_21 c_78_22 c_78_23 c_78_24 c_78_25 c_79_1 c_79_2 c_79_3 c_79_4 c_79_4_pic c_80a c_80b c_80c c_81 c_82 c_deviceid2

*variable labels

label variable c_interid "NUMERO DEL ENTREVISTADOR"

label variable c_houseid "NÚMERO DE LA CASA"

label variable c_clustid "NUMERO DEL CLUSTER:"

label variable c_particid "NUMERO DEL PARTICIPANTE"

label variable c_country "Pais"

label variable c_houseid2 "NÚMERO DE LA CASA"

label variable c_conglid2 "NUMERO DEL CLUSTER:"

label variable c_particid2 "NUMERO DEL PARTICIPANTE"

label variable c_deviceid1 "Device ID:"

label variable c_0 "0. Quiero que usted recuerde mi nombre. Mi nombre es XXXXX. Puede repetirlo, por favor?"

label variable c_1 "1. En qué año estamos?"

label variable c_2_p_c "2. En qué estación estamos?"

label variable c_2_d "2. En qué temporada estamos?"

label variable c_3 "3. En qué mes del año estamos?"

label variable c_4 "4. En qué fecha del mes estamos? (mas o menos 1 dia)"

label variable c_5 "5. Qué día de la semana es hoy?"

label variable c_6 "6. En qué pais estamos?"

label variable c_7_d_c "7. En qué provincia estamos?"

label variable c_7_p "7. En qué municipio estamos?"

label variable c_8 "8. En qué ciudad/pueblo/barrio/Urbanización estamos?"

label variable c_9 "9. “En qué lugar estamos?”"

label variable c_10 "10. “En qué habitación de esta lugar estamos?”"

label variable c_11 "11.Barco"

label variable c_12 "12. Casa"

label variable c_13 "13. Pescado"

label variable c_14 "14. Número de Intentos."

label variable c_15 "15. Resta 1"

label variable c_16 "16. Resta 2"

label variable c_17 "17. Resta 3"

label variable c_18 "18. Resta 4"

label variable c_19 "19. Resta 5"

label variable c_20 "20. Escriba las letras en el orden dicho por el entrevistado. Se rehúsa a contestar …..................7 No puede por ser analfabeto........5"

label variable c_21 "21. Barco"

label variable c_22 "22. Casa"

label variable c_23 "23. Pescado"

label variable c_24 "24.¿Qué es esto? (Muestre un lápiz o una pluma.)"

label variable c_25 "25. ¿Qué es esto? (Muestre un reloj.)"

label variable c_26 "26. Repitió correctamente?"

label variable c_26_1 "26.1 Número de Intentos"

label variable c_27 "27. Tomo el papel con la mano derecha?"

label variable c_28 "28. Doblo el papel a la mitad?"

label variable c_29 "29. Coloco el papel sobre sus piernas?"

label variable c_30 "30. CERRO LOS OJOS?"

label variable c_31 "31. Dé 1 punto si la oración se entiende y contiene un sujeto y un verbo. Ignore los errores de gramática u ortografía."

label variable c_32 "32. Intentó dibujar esta figura?"

label variable pent_pic "TOMA UNA FOTO AHORA DE LA HOJA DE ESTA RESPUESTA"

label variable c_33_a "Se rehúsa a contestar?"

label variable c_33_1 "Mantequilla"

label variable c_33_2 "Brazo"

label variable c_33_3 "Carta"

label variable c_33_4 "Reina"

label variable c_33_5 "Boleto"

label variable c_33_6 "Hierba"

label variable c_33_7 "Esquina"

label variable c_33_8 "Piedra"

label variable c_33_9 "Libro"

label variable c_33_10 "Palo"

label variable c_34_a "Se rehúsa a contestar?"

label variable c_34_1 "Mantequilla"

label variable c_34_2 "Brazo"

label variable c_34_3 "Carta"

label variable c_34_4 "Reina"

label variable c_34_5 "Boleto"

label variable c_34_6 "Hierba"

label variable c_34_7 "Esquina"

label variable c_34_8 "Piedra"

label variable c_34_9 "Libro"

label variable c_34_10 "Palo"

label variable c_35_a "Se rehúsa a contestar?"

label variable c_35_1 "Mantequilla"

label variable c_35_2 "Brazo"

label variable c_35_3 "Carta"

label variable c_35_4 "Reina"

label variable c_35_5 "Boleto"

label variable c_35_6 "Hierba"

label variable c_35_7 "Esquina"

label variable c_35_8 "Piedra"

label variable c_35_9 "Libro"

label variable c_35_10 "Palo"

label variable g_1 "G.1 ¿Está bien si grabamos esta actividad?"

label variable g_1_file "COMIENCE LA GRABACIÓN DE AUDIO AHORA"

label variable c_40 "40. ¿Intentó esta prueba de fluidez verbal?"

label variable anim_pic "TOMA UNA FOTO AHORA DE LA HOJA DE RESPUESTAS"

label variable c_43 "43. ¿Intentó esta prueba de reconocimiento visual?"

label variable symb_pic "TOMA UNA FOTO AHORA DE LA HOJA DE RESPUESTAS"

label variable c_45 "45. SI el entrevistado no tiene ningún error al contar desde 20 hasta 11 o desde 19 hasta 10, marca “correcto” y registra el tiempo. SI el entrevistado se detiene o comete un error y quiere volver a empezar, dile que puede realizar un segundo intento. Marca “quiere empezar de nuevo”. SI el entrevistado usó el minuto completo sin llegar a 11 o 10, o si comete algún error y no quiere hacer un segundo intento, marca “incorrecto” y anota “60” en el tiempo."

label variable c_45_a "45A. Tiempo (Si el entrevistado usó el minuto completo sin llegar a 11 o 10, o si comete algún error y no quiere hacer un segundo intento, marca 0= “incorrecto” y anota “60” en el tiempo.)"

label variable c_46 "46. SEGUNDO INTENTO (solo si quiere empezar de nuevo)"

label variable c_46_a "46A. Tiempo (ANOTA 60 SI EL CONTEO ES INCORRECTO)"

label variable c_48 "48.¿Cómo se llama esto? (El entrevistador muestra señala a una silla)"

label variable c_49 "49.¿Cómo se llama esto? (El entrevistador señala a sus zapatos)"

label variable c_50 "50.¿Cómo se llama esto? (El entrevistador muestra sus nudillos)"

label variable c_51 "51.¿Cómo se llama esto? (El entrevistador señala a sus codos)."

label variable c_52 "52.¿Cómo se llama esto? (El entrevistador señala a sus hombros)."

label variable c_53 "53.¿Qué es un puente?” Respuestas correctas: Construcción o elevado que sirve para caminar o cruzar sobre el agua,"

label variable c_54 "54.¿Que uso se le da a un martillo?” Respuestas correctas: llevar un clavo a través de algo, o resouestas similares que indiquen la function del martillo ."

label variable c_55 "55.¿Qué hace la gente en una iglesia o templo?” Respuestas correctas: rezar, o ir misa, casarse."

label variable c_56 "56.¿A dónde vamos a comprar medicinas/medicamentos?” Respuestas correctas: farmacia, quimico, etc"

label variable c_58 "58. ”Cuáles son los nombres de las dos calles más importantes cerca de su casa?”"

label variable c_59 "59. ”Donde está la tienda/bodega/colmado más cercano?”"

label variable c_60 "60. “Cuál es su dirección?”"

label variable c_61 "61. “Por favor mueva su cabeza, como si dijera sí”"

label variable c_62 "62. Por favor, apunte primero a la ventana y luego a la puerta"

label variable c_63_a "Se rehúsa a contestar?"

label variable c_63_1 "Mantequilla"

label variable c_63_2 "Brazo"

label variable c_63_3 "Carta"

label variable c_63_4 "Reina"

label variable c_63_5 "Boleto"

label variable c_63_6 "Hierba"

label variable c_63_7 "Esquina"

label variable c_63_8 "Piedra"

label variable c_63_9 "Libro"

label variable c_63_10 "Palo"

label variable c_65 "65. Se acuerda usted de mi nombre?, Cuál es?"

label variable g_2 "G.2. Está bien si grabamos esta actividad?"

label variable c_66_a "Se rehúsa a contestar?"

label variable g_2_file "COMIENCE LA GRABACIÓN DE AUDIO AHORA"

label variable c_66a "66.A. tres niños"

label variable c_66b "66.B. casa se incendió"

label variable c_66c "66.C. hombre valiente logró subirse"

label variable c_66d "66.D. sacó a los niños"

label variable c_66e "66.E. heridas pequeñas"

label variable c_66f "66.F. todos están bien"

label variable c_67_a "Se rehúsa a contestar?"

label variable g_2_file2 "COMIENCE LA GRABACIÓN DE AUDIO AHORA"

label variable c_67_01 "67.1 María"

label variable c_67_02 "67.2. Moreno"

label variable c_67_03 "67.3. del Norte"

label variable c_67_04 "67.4. Santo Domingo(DR)/ Habana(Cuba)/ San Juan (PR)"

label variable c_67_05 "67.5. trabajaba"

label variable c_67_06 "67.6. cocinera"

label variable c_67_07 "67.7. cafetería"

label variable c_67_08 "67.8. esquina"

label variable c_67_09 "67.9. reportó"

label variable c_67_10 "67.10. en la estación"

label variable c_67_11 "67.11. policía"

label variable c_67_12 "67.12. había sido asaltada"

label variable c_67_13_c "67.13. avenida Paseo"

label variable c_67_13_d "67.13. en la calle Duarte"

label variable c_67_13_p "67.13. avenida La Palma"

label variable c_67_14 "67.14. la noche anterior"

label variable c_67_15 "67.15. y le robaron"

label variable c_67_16 "67.16. 520 pesos"

label variable c_67_17 "67.17. tiene 4"

label variable c_67_18 "67.18. hijos pequeños"

label variable c_67_19 "67.19. la renta está vencida"

label variable c_67_20 "67.20. No han comido"

label variable c_67_21 "67.21. En dos dias"

label variable c_67_22 "67.22. La policia"

label variable c_67_23 "67.23. conmovida por la historia de la mujer"

label variable c_67_24 "67.24. organizó una colecta de dinero"

label variable c_67_25 "67.25. para ella"

label variable c_68_a "Se rehúsa a contestar?"

label variable c_68_01 "68.1. Plaza"

label variable c_68_02 "68.2. Café"

label variable c_68_03 "68.3. Mantequilla"

label variable c_68_04 "68.4. Peso"

label variable c_68_05 "68.5. Brazo"

label variable c_68_06 "68.6. Libro"

label variable c_68_07 "68.7. Cinco"

label variable c_68_08 "68.8. Carta"

label variable c_68_09 "68.9. Hotel"

label variable c_68_10 "68.10. Montaña"

label variable c_68_11 "68.11. Reina"

label variable c_68_12 "68.12. Esquina"

label variable c_68_13 "68.13. Zapatilla"

label variable c_68_14 "68.14. Palo"

label variable c_68_15 "68.15. Villa"

label variable c_68_16 "68.16. Cuerda"

label variable c_68_17 "68.17. Boleto"

label variable c_68_18 "68.18. Tropas"

label variable c_68_19 "68.19. Hierba"

label variable c_68_20 "68.20. Piedra"

label variable c_69_c "69. Puede decirme el nombre del Apóstol de Cuba que murió en Dos Ríos en 1895?"

label variable c_69_d "69. Puede decirme el nombre de los padres de la patria que proclamaron la independencia en el 1844?"

label variable c_69_p "69. “Puede decirme quién descubrio Puerto Rico para los europeos?”"

label variable c_70_d_c "70. Cual es el nombre del presidente?"

label variable c_70_p "70. Cual es el nombre del gobernador?"

label variable c_71_c "71. Cual es el nombre del presidente que sucedió a Fidel Castro?"

label variable c_71_p "71. Cual es el nombre del comisionado residente?"

label variable c_71_d "71. Cual es el nombre del vice-presidente?"

label variable c_72_1 "72.1 Intentó dibujar el círculo?"

label variable c_72_2 "72.2. Intentó dibujar el diamante?"

label variable c_72_3 "72.3. Intentó dibujar los dos rectángulos cruzados?"

label variable c_72_4 "72.4. Intentó dibujar el cubo?"

label variable c_72_4_pic "TOMA UNA FOTO PARA ESTAS RESPUESTAS"

label variable g_3 "G.3. “Está bien si grabamos esta actividad?”"

label variable c_77_a "Se rehúsa a contestar?"

label variable g_3_file "COMIENCE LA GRABACIÓN DE AUDIO AHORA"

label variable c_77a "77.A. tres niños"

label variable c_77b "77.B. casa se incendió"

label variable c_77c "77.C. hombre valiente logró subirse"

label variable c_77d "77.D. sacó a los niños"

label variable c_77e "77.E. heridas pequeñas"

label variable c_77f "77.F. todos están bien"

label variable c_78_a "Se rehúsa a contestar?"

label variable g_3_file2 "COMIENCE LA GRABACIÓN DE AUDIO AHORA"

label variable c_78_01 "78.1 María"

label variable c_78_02 "78.2. Moreno"

label variable c_78_03 "78.3. del Norte"

label variable c_78_04 "78.4. Santo Domingo(DR)/ Habana(Cuba)/ San Juan (PR)"

label variable c_78_05 "78.5. trabajaba"

label variable c_78_06 "78.6. cocinera"

label variable c_78_07 "78.7. cafetería"

label variable c_78_08 "78.8. esquina"

label variable c_78_09 "78.9. reportó"

label variable c_78_10 "78.10. en la estación"

label variable c_78_11 "78.11. policía"

label variable c_78_12 "78.12. había sido asaltada"

label variable c_78_13 "78.13. en la calle Duarte(DR)/ avenida Paseo(Cuba)/ avenida La Palma (PR)"

label variable c_78_14 "78.14. la noche anterior"

label variable c_78_15 "78.15. y le robaron"

label variable c_78_16 "78.16. 520 pesos"

label variable c_78_17 "78.17. tiene 4"

label variable c_78_18 "78.18. hijos pequeños"

label variable c_78_19 "78.19. la renta está vencida"

label variable c_78_20 "78.20. No han comido"

label variable c_78_21 "78.21. En dos dias"

label variable c_78_22 "78.22. La policia"

label variable c_78_23 "78.23. conmovida por la historia de la mujer"

label variable c_78_24 "78.24. organizó una colecta de dinero"

label variable c_78_25 "78.25. para ella"

label variable c_79_1 "79.1 Intentó dibujar el círculo?"

label variable c_79_2 "79.2. Intentó dibujar el diamante?"

label variable c_79_3 "79.3. Intentó dibujar los dos rectángulos cruzados?"

label variable c_79_4 "79.4. Intentó dibujar el cubo?"

label variable c_79_4_pic "TOMA UNA FOTO PARA ESTAS RESPUESTAS"

label variable c_80a "80a. ¿Tuvo el participante dificultad debido a su visión?"

label variable c_80b "80b. ¿Tuvo el participante dificultad debido a su audición?"

label variable c_80c "80c. ¿Tuvo el participante dificultad debido a discapacidad física?"

label variable c_81 "81. ¿Cómo es la visión del participante (con lentes, si normalmente los usa)?"

label variable c_82 "82. ¿Cómo es el alcance de oído/audición del participante (con aparato si normalmente lo usa)?"

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
 export excel using "Cognitive.xlsx", firstrow(variables) nolabel replace
 d
 sum
 list
 
 log close

clear all
