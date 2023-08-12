clear all 
set more off
capture log close

local country = 2

if `country' == 0 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/PR_out"
}
else if `country' == 1 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"
}
else if `country' == 2 {
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/Infor_Child.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Infor_Child.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Infor_Child.csv", comma names clear
}
   
   ds, has(type string)

  local string_vars = r(varlist)

foreach var of local string_vars {

    gen `var'_trimmed = ustrlower(ustrtrim(`var'))

    replace `var' = `var'_trimmed

    drop `var'_trimmed

}

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values i_country country_label

gen i_country_str = string(i_country, "%12.0f")

gen i_clustid_str = string(i_clustid, "%12.0f")
replace i_clustid_str = cond(strlen(i_clustid_str) == 1, "0" + i_clustid_str, i_clustid_str)

gen i_houseid_str = string(i_houseid, "%03.0f")
replace i_houseid_str = cond(strlen(i_houseid_str) == 1, "00" + i_houseid_str, i_houseid_str)
replace i_houseid_str = cond(strlen(i_houseid_str) == 2, "0" + i_houseid_str, i_houseid_str)

gen i_particid_str = string(i_particid, "%12.0f")
replace i_particid_str = cond(strlen(i_particid_str) == 1, "0" + i_particid_str, i_particid_str)

gen pid = i_country_str + i_clustid_str + i_houseid_str + i_particid_str
gen hhid = i_country_str + i_clustid_str + i_houseid_str

drop i_country_str i_clustid_str i_houseid_str i_particid_str

rename i_a2 (I_A2)

capture confirm numeric variable I_A2
if !_rc{
     tostring I_A2, replace
}

label define I_A2 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_A2, gen(i_a2) label (I_A2)

rename i_a3 (I_A3)

capture confirm numeric variable I_A3
if !_rc{
     tostring I_A3, replace
}

label define I_A3 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_A3, gen(i_a3) label (I_A3)

rename i_a4 (I_A4)

capture confirm numeric variable I_A4
if !_rc{
     tostring I_A4, replace
}

label define I_A4 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_A4, gen(i_a4) label (I_A4)

rename i_b1 (I_B1)

capture confirm numeric variable I_B1
if !_rc{
     tostring I_B1, replace
}

label define I_B1 .a"." 1 "miembro del hogar de xxxx?" 2 "hijo no-residente de xxxx?" 3 "otro?" 

encode I_B1, gen(i_b1) label (I_B1)

rename i_b4 (I_B4)

capture confirm numeric variable I_B4
if !_rc{
     tostring I_B4, replace
}

label define I_B4 .a"." 1 "femenino" 2 "masculino" 3 "otro" 

encode I_B4, gen(i_b4) label (I_B4)

rename i_b5 (I_B5)

capture confirm numeric variable I_B5
if !_rc{
     tostring I_B5, replace
}

label define I_B5 .a"." 1 "esposo (a)" 2 "hijo/hija" 3 "nuero/nuera" 4 "hermano (a)" 5 "otro parentesco" 6 "amigo" 7 "vecino(a)" 8 "otro" 88 "no responde"

encode I_B5, gen(i_b5) label (I_B5)

rename i_c1 (I_C1)

capture confirm numeric variable I_C1
if !_rc{
     tostring I_C1, replace
}

label define I_C1 .a"." 1 "necesita cuidado la mayoría del tiempo" 2 "necesita cuidado ocasionalmente" 3 "no necesita cuidado se vale por sí mismo" 8 "no responde"9 "no sabe"

encode I_C1, gen(i_c1) label (I_C1)

rename i_c2 (I_C2)

capture confirm numeric variable I_C2
if !_rc{
     tostring I_C2, replace
}

label define I_C2 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C2, gen(i_c2) label (I_C2)

rename i_c3 (I_C3)

capture confirm numeric variable I_C3
if !_rc{
     tostring I_C3, replace
}

label define I_C3 .a"." 1 "uno ó más miembros de la familia" 2 "uno ó más amigos o vecinos no pagados" 3 "uno ó más cuidadores pagados" 4 "no recibe cuidado directo" 8 "no responde"9 "no sabe"

encode I_C3, gen(i_c3) label (I_C3)

rename i_c4 (I_C4)

capture confirm numeric variable I_C4
if !_rc{
     tostring I_C4, replace
}

label define I_C4 .a"." 1 "uno de los principales cuidadores directos." 2 "uno de los principales cuidadores de “organización”" 3 "solo ligeramente envuelto en proveer u organizar cuidado (otras personas lo hacen más)" 4 "no está envuelto en proveer u organizar cuidado" 

encode I_C4, gen(i_c4) label (I_C4)

rename i_c5 (I_C5)

capture confirm numeric variable I_C5
if !_rc{
     tostring I_C5, replace
}

label define I_C5 .a"." 1 "sí he dejado de trabajar" 2 "sí he disminuido horas de trabajo" 3 "no" 8 "no responde"

encode I_C5, gen(i_c5) label (I_C5)

rename i_c9 (I_C9)

capture confirm numeric variable I_C9
if !_rc{
     tostring I_C9, replace
}

label define I_C9 .a"." 1 "si" 2 "no" 8 "no responde"

encode I_C9, gen(i_c9) label (I_C9)

rename i_c11 (I_C11)

capture confirm numeric variable I_C11
if !_rc{
     tostring I_C11, replace
}

label define I_C11 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C11, gen(i_c11) label (I_C11)

rename i_c23 (I_C23)

capture confirm numeric variable I_C23
if !_rc{
     tostring I_C23, replace
}

label define I_C23 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C23, gen(i_c23) label (I_C23)

rename i_c25 (I_C25)

capture confirm numeric variable I_C25
if !_rc{
     tostring I_C25, replace
}

label define I_C25 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C25, gen(i_c25) label (I_C25)

rename i_c26a (I_C26A)

capture confirm numeric variable I_C26A
if !_rc{
     tostring I_C26A, replace
}

label define I_C26A .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C26A, gen(i_c26a) label (I_C26A)

rename i_c27a (I_C27A)

capture confirm numeric variable I_C27A
if !_rc{
     tostring I_C27A, replace
}

label define I_C27A .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode I_C27A, gen(i_c27a) label (I_C27A)

rename i_d2 (I_D2)

capture confirm numeric variable I_D2
if !_rc{
     tostring I_D2, replace
}

label define I_D2 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D2, gen(i_d2) label (I_D2)

rename i_d3 (I_D3)

capture confirm numeric variable I_D3
if !_rc{
     tostring I_D3, replace
}

label define I_D3 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D3, gen(i_d3) label (I_D3)

rename i_d5 (I_D5)

capture confirm numeric variable I_D5
if !_rc{
     tostring I_D5, replace
}

label define I_D5 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D5, gen(i_d5) label (I_D5)

rename i_d6 (I_D6)

capture confirm numeric variable I_D6
if !_rc{
     tostring I_D6, replace
}

label define I_D6 .a"."0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D6, gen(i_d6) label (I_D6)

rename i_d9 (I_D9)

capture confirm numeric variable I_D9
if !_rc{
     tostring I_D9, replace
}

label define I_D9 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D9, gen(i_d9) label (I_D9)

rename i_d10 (I_D10)

capture confirm numeric variable I_D10
if !_rc{
     tostring I_D10, replace
}

label define I_D10 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D10, gen(i_d10) label (I_D10)

rename i_d11 (I_D11)

capture confirm numeric variable I_D11
if !_rc{
     tostring I_D11, replace
}

label define I_D11 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D11, gen(i_d11) label (I_D11)

rename i_d12 (I_D12)

capture confirm numeric variable I_D12
if !_rc{
     tostring I_D12, replace
}

label define I_D12 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D12, gen(i_d12) label (I_D12)

rename i_d17 (I_D17)

capture confirm numeric variable I_D17
if !_rc{
     tostring I_D17, replace
}

label define I_D17 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D17, gen(i_d17) label (I_D17)

rename i_d19 (I_D19)

capture confirm numeric variable I_D19
if !_rc{
     tostring I_D19, replace
}

label define I_D19 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D19, gen(i_d19) label (I_D19)

rename i_d20 (I_D20)

capture confirm numeric variable I_D20
if !_rc{
     tostring I_D20, replace
}

label define I_D20 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D20, gen(i_d20) label (I_D20)

rename i_d21 (I_D21)

capture confirm numeric variable I_D21
if !_rc{
     tostring I_D21, replace
}

label define I_D21 .a"." 0 "nunca" 1 "raras veces" 2 "algunas veces" 3 "bastante frecuente" 4 "casi siempre" 8 "no responde"

encode I_D21, gen(i_d21) label (I_D21)

rename i_e1 (I_E1)

capture confirm numeric variable I_E1
if !_rc{
     tostring I_E1, replace
}

label define I_E1 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E1, gen(i_e1) label (I_E1)

rename i_e2 (I_E2)

capture confirm numeric variable I_E2
if !_rc{
     tostring I_E2, replace
}

label define I_E2 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E2, gen(i_e2) label (I_E2)

rename i_e3 (I_E3)

capture confirm numeric variable I_E3
if !_rc{
     tostring I_E3, replace
}

label define I_E3 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E3, gen(i_e3) label (I_E3)

rename i_e4 (I_E4)

capture confirm numeric variable I_E4
if !_rc{
     tostring I_E4, replace
}

label define I_E4 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E4, gen(i_e4) label (I_E4)

rename i_e5 (I_E5)

capture confirm numeric variable I_E5
if !_rc{
     tostring I_E5, replace
}

label define I_E5 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E5, gen(i_e5) label (I_E5)

rename i_e6 (I_E6)

capture confirm numeric variable I_E6
if !_rc{
     tostring I_E6, replace
}

label define I_E6 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E6, gen(i_e6) label (I_E6)

rename i_e7 (I_E7)

capture confirm numeric variable I_E7
if !_rc{
     tostring I_E7, replace
}

label define I_E7 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E7, gen(i_e7) label (I_E7)

rename i_e8 (I_E8)

capture confirm numeric variable I_E8
if !_rc{
     tostring I_E8, replace
}

label define I_E8 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E8, gen(i_e8) label (I_E8)

rename i_e9 (I_E9)

capture confirm numeric variable I_E9
if !_rc{
     tostring I_E9, replace
}

label define I_E9 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E9, gen(i_e9) label (I_E9)

rename i_e10 (I_E10)

capture confirm numeric variable I_E10
if !_rc{
     tostring I_E10, replace
}

label define I_E10 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E10, gen(i_e10) label (I_E10)

rename i_e11 (I_E11)

capture confirm numeric variable I_E11
if !_rc{
     tostring I_E11, replace
}

label define I_E11 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E11, gen(i_e11) label (I_E11)

rename i_e12 (I_E12)

capture confirm numeric variable I_E12
if !_rc{
     tostring I_E12, replace
}

label define I_E12 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E12, gen(i_e12) label (I_E12)

rename i_e13 (I_E13)

capture confirm numeric variable I_E13
if !_rc{
     tostring I_E13, replace
}

label define I_E13 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E13, gen(i_e13) label (I_E13)

rename i_e14 (I_E14)

capture confirm numeric variable I_E14
if !_rc{
     tostring I_E14, replace
}

label define I_E14 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E14, gen(i_e14) label (I_E14)

rename i_e15 (I_E15)

capture confirm numeric variable I_E15
if !_rc{
     tostring I_E15, replace
}

label define I_E15 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E15, gen(i_e15) label (I_E15)

rename i_e16 (I_E16)

capture confirm numeric variable I_E16
if !_rc{
     tostring I_E16, replace
}

label define I_E16 .a"." 1 "ha mejorado mucho" 2 "ha mejorado un poco" 3 "apenas ha cambiado" 4 "ha empeorado un poco" 5 "ha empeorado mucho" 8 "no responde"9 "no sabe"

encode I_E16, gen(i_e16) label (I_E16)

rename i_f_csid_1 (I_F_CSID_1)

capture confirm numeric variable I_F_CSID_1
if !_rc{
     tostring I_F_CSID_1, replace
}

label define I_F_CSID_1 .a"." 0 "no hay cambios" 1 "disminución de las actividades y reducida" 

encode I_F_CSID_1, gen(i_f_csid_1) label (I_F_CSID_1)

rename i_f_csid_2 (I_F_CSID_2)

capture confirm numeric variable I_F_CSID_2
if !_rc{
     tostring I_F_CSID_2, replace
}

label define I_F_CSID_2 .a"." 0 "no hay cambios" 1 "deterioro general" 

encode I_F_CSID_2, gen(i_f_csid_2) label (I_F_CSID_2)

rename i_f_csid_3 (I_F_CSID_3)

capture confirm numeric variable I_F_CSID_3
if !_rc{
     tostring I_F_CSID_3, replace
}

label define I_F_CSID_3 .a"." 0 "no" 1 "si" 

encode I_F_CSID_3, gen(i_f_csid_3) label (I_F_CSID_3)

rename i_f_csid_4 (I_F_CSID_4)

capture confirm numeric variable I_F_CSID_4
if !_rc{
     tostring I_F_CSID_4, replace
}

label define I_F_CSID_4 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_4, gen(i_f_csid_4) label (I_F_CSID_4)

rename i_f_csid_5 (I_F_CSID_5)

capture confirm numeric variable I_F_CSID_5
if !_rc{
     tostring I_F_CSID_5, replace
}

label define I_F_CSID_5 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_5, gen(i_f_csid_5) label (I_F_CSID_5)

rename i_f_bse_3 (I_F_BSE_3)

capture confirm numeric variable I_F_BSE_3
if !_rc{
     tostring I_F_BSE_3, replace
}

label define I_F_BSE_3 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_BSE_3, gen(i_f_bse_3) label (I_F_BSE_3)

rename i_f_bse_7 (I_F_BSE_7)

capture confirm numeric variable I_F_BSE_7
if !_rc{
     tostring I_F_BSE_7, replace
}

label define I_F_BSE_7 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_BSE_7, gen(i_f_bse_7) label (I_F_BSE_7)

rename i_f_csid_6 (I_F_CSID_6)

capture confirm numeric variable I_F_CSID_6
if !_rc{
     tostring I_F_CSID_6, replace
}

label define I_F_CSID_6 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_6, gen(i_f_csid_6) label (I_F_CSID_6)

rename i_f_csid_7 (I_F_CSID_7)

capture confirm numeric variable I_F_CSID_7
if !_rc{
     tostring I_F_CSID_7, replace
}

label define I_F_CSID_7 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_7, gen(i_f_csid_7) label (I_F_CSID_7)

rename i_f_csid_8 (I_F_CSID_8)

capture confirm numeric variable I_F_CSID_8
if !_rc{
     tostring I_F_CSID_8, replace
}

label define I_F_CSID_8 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_8, gen(i_f_csid_8) label (I_F_CSID_8)

rename i_f_csid_9 (I_F_CSID_9)

capture confirm numeric variable I_F_CSID_9
if !_rc{
     tostring I_F_CSID_9, replace
}

label define I_F_CSID_9 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_9, gen(i_f_csid_9) label (I_F_CSID_9)

rename i_f_csid_10 (I_F_CSID_10)

capture confirm numeric variable I_F_CSID_10
if !_rc{
     tostring I_F_CSID_10, replace
}

label define I_F_CSID_10 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_10, gen(i_f_csid_10) label (I_F_CSID_10)

rename i_f_csid_11 (I_F_CSID_11)

capture confirm numeric variable I_F_CSID_11
if !_rc{
     tostring I_F_CSID_11, replace
}

label define I_F_CSID_11 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_11, gen(i_f_csid_11) label (I_F_CSID_11)

rename i_f_csid_12 (I_F_CSID_12)

capture confirm numeric variable I_F_CSID_12
if !_rc{
     tostring I_F_CSID_12, replace
}

label define I_F_CSID_12 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_12, gen(i_f_csid_12) label (I_F_CSID_12)

rename i_f_csid_13 (I_F_CSID_13)

capture confirm numeric variable I_F_CSID_13
if !_rc{
     tostring I_F_CSID_13, replace
}

label define I_F_CSID_13 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_13, gen(i_f_csid_13) label (I_F_CSID_13)

rename i_f_csid_14 (I_F_CSID_14)

capture confirm numeric variable I_F_CSID_14
if !_rc{
     tostring I_F_CSID_14, replace
}

label define I_F_CSID_14 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_14, gen(i_f_csid_14) label (I_F_CSID_14)

rename i_f_csid_15 (I_F_CSID_15)

capture confirm numeric variable I_F_CSID_15
if !_rc{
     tostring I_F_CSID_15, replace
}

label define I_F_CSID_15 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_15, gen(i_f_csid_15) label (I_F_CSID_15)

rename i_f_csid_16 (I_F_CSID_16)

capture confirm numeric variable I_F_CSID_16
if !_rc{
     tostring I_F_CSID_16, replace
}

label define I_F_CSID_16 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_16, gen(i_f_csid_16) label (I_F_CSID_16)

rename i_f_csid_17 (I_F_CSID_17)

capture confirm numeric variable I_F_CSID_17
if !_rc{
     tostring I_F_CSID_17, replace
}

label define I_F_CSID_17 .a"." 0 "nunca" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_17, gen(i_f_csid_17) label (I_F_CSID_17)

rename i_f_csid_17a (I_F_CSID_17A)

capture confirm numeric variable I_F_CSID_17A
if !_rc{
     tostring I_F_CSID_17A, replace
}

label define I_F_CSID_17A .a"." 0 "no" 1 "si" 

encode I_F_CSID_17A, gen(i_f_csid_17a) label (I_F_CSID_17A)

rename i_f_csid_18 (I_F_CSID_18)

capture confirm numeric variable I_F_CSID_18
if !_rc{
     tostring I_F_CSID_18, replace
}

label define I_F_CSID_18 .a"." 0 "no" 1 "si" 

encode I_F_CSID_18, gen(i_f_csid_18) label (I_F_CSID_18)

rename i_f_csid_19 (I_F_CSID_19)

capture confirm numeric variable I_F_CSID_19
if !_rc{
     tostring I_F_CSID_19, replace
}

label define I_F_CSID_19 .a"." 0 "no muestra dificultad" 1 "alguna dificultad" 2 "no puede manejar el dinero" 

encode I_F_CSID_19, gen(i_f_csid_19) label (I_F_CSID_19)

rename i_f_csid_20 (I_F_CSID_20)

capture confirm numeric variable I_F_CSID_20
if !_rc{
     tostring I_F_CSID_20, replace
}

label define I_F_CSID_20 .a"." 0 "no" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_20, gen(i_f_csid_20) label (I_F_CSID_20)

rename i_f_csid_21 (I_F_CSID_21)

capture confirm numeric variable I_F_CSID_21
if !_rc{
     tostring I_F_CSID_21, replace
}

label define I_F_CSID_21 .a"." 0 "no" 1 "si algunas veces" 2 "si regularmente" 

encode I_F_CSID_21, gen(i_f_csid_21) label (I_F_CSID_21)

rename i_f_csid_22_1 (I_F_CSID_22_1)

capture confirm numeric variable I_F_CSID_22_1
if !_rc{
     tostring I_F_CSID_22_1, replace
}

label define I_F_CSID_22_1 .a"." 0 "come de manera limpia y con utensilios apropiados" 1 "se ensucia al comer. solo usa la cuchara" 2 "sólidos simples como galletitas" 3 "tiene que ser alimentada" 

encode I_F_CSID_22_1, gen(i_f_csid_22_1) label (I_F_CSID_22_1)

rename i_f_csid_22_2 (I_F_CSID_22_2)

capture confirm numeric variable I_F_CSID_22_2
if !_rc{
     tostring I_F_CSID_22_2, replace
}

label define I_F_CSID_22_2 .a"." 0 "no" 1 "si" 

encode I_F_CSID_22_2, gen(i_f_csid_22_2) label (I_F_CSID_22_2)

rename i_f_csid_23_1 (I_F_CSID_23_1)

capture confirm numeric variable I_F_CSID_23_1
if !_rc{
     tostring I_F_CSID_23_1, replace
}

label define I_F_CSID_23_1 .a"." 0 "se viste sola/o" 1 "ocasionalmente salta un botón etc" 2 "secuencia incorrecta a menudo olvida artículos" 3 "incapaz de vestirse" 

encode I_F_CSID_23_1, gen(i_f_csid_23_1) label (I_F_CSID_23_1)

rename i_f_csid_23_2 (I_F_CSID_23_2)

capture confirm numeric variable I_F_CSID_23_2
if !_rc{
     tostring I_F_CSID_23_2, replace
}

label define I_F_CSID_23_2 .a"." 0 "no" 1 "si" 

encode I_F_CSID_23_2, gen(i_f_csid_23_2) label (I_F_CSID_23_2)

rename i_f_csid_24_1 (I_F_CSID_24_1)

capture confirm numeric variable I_F_CSID_24_1
if !_rc{
     tostring I_F_CSID_24_1, replace
}

label define I_F_CSID_24_1 .a"." 0 "no tiene problemas" 1 "ocasionalmente moja la cama" 2 "frecuentemente moja la cama" 3 "incontinencia doble" 

encode I_F_CSID_24_1, gen(i_f_csid_24_1) label (I_F_CSID_24_1)

rename i_f_csid_24_2 (I_F_CSID_24_2)

capture confirm numeric variable I_F_CSID_24_2
if !_rc{
     tostring I_F_CSID_24_2, replace
}

label define I_F_CSID_24_2 .a"." 0 "no" 1 "si" 

encode I_F_CSID_24_2, gen(i_f_csid_24_2) label (I_F_CSID_24_2)

rename i_f_csid_25 (I_F_CSID_25)

capture confirm numeric variable I_F_CSID_25
if !_rc{
     tostring I_F_CSID_25, replace
}

label define I_F_CSID_25 .a"." 0 "no" 1 "si" 

encode I_F_CSID_25, gen(i_f_csid_25) label (I_F_CSID_25)

rename i_f_csid_26 (I_F_CSID_26)

capture confirm numeric variable I_F_CSID_26
if !_rc{
     tostring I_F_CSID_26, replace
}

label define I_F_CSID_26 .a"." 0 "no" 1 "si" 

encode I_F_CSID_26, gen(i_f_csid_26) label (I_F_CSID_26)

rename i_f_csid_27 (I_F_CSID_27)

capture confirm numeric variable I_F_CSID_27
if !_rc{
     tostring I_F_CSID_27, replace
}

label define I_F_CSID_27 .a"." 0 "no" 1 "si" 

encode I_F_CSID_27, gen(i_f_csid_27) label (I_F_CSID_27)

rename i_f_csid_28 (I_F_CSID_28)

capture confirm numeric variable I_F_CSID_28
if !_rc{
     tostring I_F_CSID_28, replace
}

label define I_F_CSID_28 .a"." 0 "no" 1 "si" 

encode I_F_CSID_28, gen(i_f_csid_28) label (I_F_CSID_28)

rename i_g1 (I_G1)

capture confirm numeric variable I_G1
if !_rc{
     tostring I_G1, replace
}

label define I_G1 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G1, gen(i_g1) label (I_G1)

rename i_g1_2 (I_G1_2)

capture confirm numeric variable I_G1_2
if !_rc{
     tostring I_G1_2, replace
}

label define I_G1_2 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G1_2, gen(i_g1_2) label (I_G1_2)

rename i_g1_3 (I_G1_3)

capture confirm numeric variable I_G1_3
if !_rc{
     tostring I_G1_3, replace
}

label define I_G1_3 .a"." 0 "ninguna ayuda" 1 "un poco de ayuda" 2 "de mucha ayuda" 8 "no responde"9 "no sabe"

encode I_G1_3, gen(i_g1_3) label (I_G1_3)

rename i_g1_4 (I_G1_4)

capture confirm numeric variable I_G1_4
if !_rc{
     tostring I_G1_4, replace
}

label define I_G1_4 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G1_4, gen(i_g1_4) label (I_G1_4)

rename i_g1_5 (I_G1_5)

capture confirm numeric variable I_G1_5
if !_rc{
     tostring I_G1_5, replace
}

label define I_G1_5 .a"." 0 "ninguna ayuda" 1 "un poco de ayuda" 2 "de mucha ayuda" 8 "no responde"9 "no sabe"

encode I_G1_5, gen(i_g1_5) label (I_G1_5)

rename i_g_has_2 (I_G_HAS_2)

capture confirm numeric variable I_G_HAS_2
if !_rc{
     tostring I_G_HAS_2, replace
}

label define I_G_HAS_2 .a"." 1 "comienzo rápido de aspectos orgánicos en 1-3 días" 2 "comienzo rápido en más de 3 días pero menos de 3 semanas" 3 "comienzo gradual en un período más largo" 8 "no responde"9 "no sabe"

encode I_G_HAS_2, gen(i_g_has_2) label (I_G_HAS_2)

rename i_g_has_3_1 (I_G_HAS_3_1)

capture confirm numeric variable I_G_HAS_3_1
if !_rc{
     tostring I_G_HAS_3_1, replace
}

label define I_G_HAS_3_1 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_1, gen(i_g_has_3_1) label (I_G_HAS_3_1)

rename i_g_has_3_11 (I_G_HAS_3_11)

capture confirm numeric variable I_G_HAS_3_11
if !_rc{
     tostring I_G_HAS_3_11, replace
}

label define I_G_HAS_3_11 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_11, gen(i_g_has_3_11) label (I_G_HAS_3_11)

rename i_g_has_3_13 (I_G_HAS_3_13)

capture confirm numeric variable I_G_HAS_3_13
if !_rc{
     tostring I_G_HAS_3_13, replace
}

label define I_G_HAS_3_13 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_13, gen(i_g_has_3_13) label (I_G_HAS_3_13)

rename i_g_has_3_14 (I_G_HAS_3_14)

capture confirm numeric variable I_G_HAS_3_14
if !_rc{
     tostring I_G_HAS_3_14, replace
}

label define I_G_HAS_3_14 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_14, gen(i_g_has_3_14) label (I_G_HAS_3_14)

rename i_g_has_3_16 (I_G_HAS_3_16)

capture confirm numeric variable I_G_HAS_3_16
if !_rc{
     tostring I_G_HAS_3_16, replace
}

label define I_G_HAS_3_16 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_16, gen(i_g_has_3_16) label (I_G_HAS_3_16)

rename i_g_has_3_22 (I_G_HAS_3_22)

capture confirm numeric variable I_G_HAS_3_22
if !_rc{
     tostring I_G_HAS_3_22, replace
}

label define I_G_HAS_3_22 .a"." 1 "en general expresa deterioro" 2 "en general expresa mejoría" 3 "expresa que no hay cambios" 8 "no responde"9 "no sabe"

encode I_G_HAS_3_22, gen(i_g_has_3_22) label (I_G_HAS_3_22)

rename i_g_has_4 (I_G_HAS_4)

capture confirm numeric variable I_G_HAS_4
if !_rc{
     tostring I_G_HAS_4, replace
}

label define I_G_HAS_4 .a"." 0 "no vario" 1 "un curso fluctuante con varios días o semanas de mejoría" 8 "no responde"9 "no sabe"

encode I_G_HAS_4, gen(i_g_has_4) label (I_G_HAS_4)

rename i_g_has_5_1 (I_G_HAS_5_1)

capture confirm numeric variable I_G_HAS_5_1
if !_rc{
     tostring I_G_HAS_5_1, replace
}

label define I_G_HAS_5_1 .a"." 0 "no retornaron a lo normal" 1 "condición descrita como retorno a lo normal o casi normal" 8 "no responde"9 "no sabe"

encode I_G_HAS_5_1, gen(i_g_has_5_1) label (I_G_HAS_5_1)

rename i_g_has_6 (I_G_HAS_6)

capture confirm numeric variable I_G_HAS_6
if !_rc{
     tostring I_G_HAS_6, replace
}

label define I_G_HAS_6 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_6, gen(i_g_has_6) label (I_G_HAS_6)

rename i_g_has_7_1 (I_G_HAS_7_1)

capture confirm numeric variable I_G_HAS_7_1
if !_rc{
     tostring I_G_HAS_7_1, replace
}

label define I_G_HAS_7_1 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_7_1, gen(i_g_has_7_1) label (I_G_HAS_7_1)

rename i_g_has_10 (I_G_HAS_10)

capture confirm numeric variable I_G_HAS_10
if !_rc{
     tostring I_G_HAS_10, replace
}

label define I_G_HAS_10 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_10, gen(i_g_has_10) label (I_G_HAS_10)

rename i_g_has_11 (I_G_HAS_11)

capture confirm numeric variable I_G_HAS_11
if !_rc{
     tostring I_G_HAS_11, replace
}

label define I_G_HAS_11 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_11, gen(i_g_has_11) label (I_G_HAS_11)

rename i_g_has_12 (I_G_HAS_12)

capture confirm numeric variable I_G_HAS_12
if !_rc{
     tostring I_G_HAS_12, replace
}

label define I_G_HAS_12 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_12, gen(i_g_has_12) label (I_G_HAS_12)

rename i_g_has_13 (I_G_HAS_13)

capture confirm numeric variable I_G_HAS_13
if !_rc{
     tostring I_G_HAS_13, replace
}

label define I_G_HAS_13 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_13, gen(i_g_has_13) label (I_G_HAS_13)

rename i_g_has_14_1 (I_G_HAS_14_1)

capture confirm numeric variable I_G_HAS_14_1
if !_rc{
     tostring I_G_HAS_14_1, replace
}

label define I_G_HAS_14_1 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_14_1, gen(i_g_has_14_1) label (I_G_HAS_14_1)

rename i_g_has_15 (I_G_HAS_15)

capture confirm numeric variable I_G_HAS_15
if !_rc{
     tostring I_G_HAS_15, replace
}

label define I_G_HAS_15 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_15, gen(i_g_has_15) label (I_G_HAS_15)

rename i_g_has_17 (I_G_HAS_17)

capture confirm numeric variable I_G_HAS_17
if !_rc{
     tostring I_G_HAS_17, replace
}

label define I_G_HAS_17 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_G_HAS_17, gen(i_g_has_17) label (I_G_HAS_17)

rename i_g_has_18 (I_G_HAS_18)

capture confirm numeric variable I_G_HAS_18
if !_rc{
     tostring I_G_HAS_18, replace
}

label define I_G_HAS_18 .a"." 0 "solo han sucedido recientemente" 1 "una de las primeras cosas" 8 "no responde"9 "no sabe"

encode I_G_HAS_18, gen(i_g_has_18) label (I_G_HAS_18)

rename i_g_has_47 (I_G_HAS_47)

capture confirm numeric variable I_G_HAS_47
if !_rc{
     tostring I_G_HAS_47, replace
}

label define I_G_HAS_47 .a"." 0 "no" 1 "si probablemente" 2 "si definitivamente" 8 "no responde"9 "no sabe"

encode I_G_HAS_47, gen(i_g_has_47) label (I_G_HAS_47)

rename i_g_has_48 (I_G_HAS_48)

capture confirm numeric variable I_G_HAS_48
if !_rc{
     tostring I_G_HAS_48, replace
}

label define I_G_HAS_48 .a"." 0 "no" 1 "si probablemente" 2 "si definitivamente" 8 "no responde"9 "no sabe"

encode I_G_HAS_48, gen(i_g_has_48) label (I_G_HAS_48)

rename i_g_has_49 (I_G_HAS_49)

capture confirm numeric variable I_G_HAS_49
if !_rc{
     tostring I_G_HAS_49, replace
}

label define I_G_HAS_49 .a"." 0 "no" 1 "de unos minutos a una hora" 2 "más de una hora" 8 "no responde"9 "no sabe"

encode I_G_HAS_49, gen(i_g_has_49) label (I_G_HAS_49)

rename i_g_has_50 (I_G_HAS_50)

capture confirm numeric variable I_G_HAS_50
if !_rc{
     tostring I_G_HAS_50, replace
}

label define I_G_HAS_50 .a"." 0 "no han ocurrido tales cambios" 1 "seria condición afectando la cabeza causando cambios" 8 "no responde"9 "no sabe"

encode I_G_HAS_50, gen(i_g_has_50) label (I_G_HAS_50)

rename i_g_has_52 (I_G_HAS_52)

capture confirm numeric variable I_G_HAS_52
if !_rc{
     tostring I_G_HAS_52, replace
}

label define I_G_HAS_52 .a"." 0 "no" 1 "si" 

encode I_G_HAS_52, gen(i_g_has_52) label (I_G_HAS_52)

rename i_h_npi_1 (I_H_NPI_1)

capture confirm numeric variable I_H_NPI_1
if !_rc{
     tostring I_H_NPI_1, replace
}

label define I_H_NPI_1 .a"." 0 "no" 1 "si" 8 "no reponde" 9 "no sabe"

encode I_H_NPI_1, gen(i_h_npi_1) label (I_H_NPI_1)

rename i_h_npi_1_1 (I_H_NPI_1_1)

capture confirm numeric variable I_H_NPI_1_1
if !_rc{
     tostring I_H_NPI_1_1, replace
}

label define I_H_NPI_1_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_1_1, gen(i_h_npi_1_1) label (I_H_NPI_1_1)

rename i_h_npi_1_2 (I_H_NPI_1_2)

capture confirm numeric variable I_H_NPI_1_2
if !_rc{
     tostring I_H_NPI_1_2, replace
}

label define I_H_NPI_1_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_1_2, gen(i_h_npi_1_2) label (I_H_NPI_1_2)

rename i_h_npi_2 (I_H_NPI_2)

capture confirm numeric variable I_H_NPI_2
if !_rc{
     tostring I_H_NPI_2, replace
}

label define I_H_NPI_2 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_2, gen(i_h_npi_2) label (I_H_NPI_2)

rename i_h_npi_2_1 (I_H_NPI_2_1)

capture confirm numeric variable I_H_NPI_2_1
if !_rc{
     tostring I_H_NPI_2_1, replace
}

label define I_H_NPI_2_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_2_1, gen(i_h_npi_2_1) label (I_H_NPI_2_1)

rename i_h_npi_2_2 (I_H_NPI_2_2)

capture confirm numeric variable I_H_NPI_2_2
if !_rc{
     tostring I_H_NPI_2_2, replace
}

label define I_H_NPI_2_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_2_2, gen(i_h_npi_2_2) label (I_H_NPI_2_2)

rename i_h_npi_3 (I_H_NPI_3)

capture confirm numeric variable I_H_NPI_3
if !_rc{
     tostring I_H_NPI_3, replace
}

label define I_H_NPI_3 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_3, gen(i_h_npi_3) label (I_H_NPI_3)

rename i_h_npi_3_1 (I_H_NPI_3_1)

capture confirm numeric variable I_H_NPI_3_1
if !_rc{
     tostring I_H_NPI_3_1, replace
}

label define I_H_NPI_3_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_3_1, gen(i_h_npi_3_1) label (I_H_NPI_3_1)

rename i_h_npi_3_2 (I_H_NPI_3_2)

capture confirm numeric variable I_H_NPI_3_2
if !_rc{
     tostring I_H_NPI_3_2, replace
}

label define I_H_NPI_3_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_3_2, gen(i_h_npi_3_2) label (I_H_NPI_3_2)

rename i_h_npi_4 (I_H_NPI_4)

capture confirm numeric variable I_H_NPI_4
if !_rc{
     tostring I_H_NPI_4, replace
}

label define I_H_NPI_4 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_4, gen(i_h_npi_4) label (I_H_NPI_4)

rename i_h_npi_4_1 (I_H_NPI_4_1)

capture confirm numeric variable I_H_NPI_4_1
if !_rc{
     tostring I_H_NPI_4_1, replace
}

label define I_H_NPI_4_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_4_1, gen(i_h_npi_4_1) label (I_H_NPI_4_1)

rename i_h_npi_4_2 (I_H_NPI_4_2)

capture confirm numeric variable I_H_NPI_4_2
if !_rc{
     tostring I_H_NPI_4_2, replace
}

label define I_H_NPI_4_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_4_2, gen(i_h_npi_4_2) label (I_H_NPI_4_2)

rename i_h_npi_5 (I_H_NPI_5)

capture confirm numeric variable I_H_NPI_5
if !_rc{
     tostring I_H_NPI_5, replace
}

label define I_H_NPI_5 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_5, gen(i_h_npi_5) label (I_H_NPI_5)

rename i_h_npi_5_1 (I_H_NPI_5_1)

capture confirm numeric variable I_H_NPI_5_1
if !_rc{
     tostring I_H_NPI_5_1, replace
}

label define I_H_NPI_5_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_5_1, gen(i_h_npi_5_1) label (I_H_NPI_5_1)

rename i_h_npi_5_2 (I_H_NPI_5_2)

capture confirm numeric variable I_H_NPI_5_2
if !_rc{
     tostring I_H_NPI_5_2, replace
}

label define I_H_NPI_5_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_5_2, gen(i_h_npi_5_2) label (I_H_NPI_5_2)

rename i_h_npi_6 (I_H_NPI_6)

capture confirm numeric variable I_H_NPI_6
if !_rc{
     tostring I_H_NPI_6, replace
}

label define I_H_NPI_6 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_6, gen(i_h_npi_6) label (I_H_NPI_6)

rename i_h_npi_6_1 (I_H_NPI_6_1)

capture confirm numeric variable I_H_NPI_6_1
if !_rc{
     tostring I_H_NPI_6_1, replace
}

label define I_H_NPI_6_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_6_1, gen(i_h_npi_6_1) label (I_H_NPI_6_1)

rename i_h_npi_6_2 (I_H_NPI_6_2)

capture confirm numeric variable I_H_NPI_6_2
if !_rc{
     tostring I_H_NPI_6_2, replace
}

label define I_H_NPI_6_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_6_2, gen(i_h_npi_6_2) label (I_H_NPI_6_2)

rename i_h_npi_7 (I_H_NPI_7)

capture confirm numeric variable I_H_NPI_7
if !_rc{
     tostring I_H_NPI_7, replace
}

label define I_H_NPI_7 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_7, gen(i_h_npi_7) label (I_H_NPI_7)

rename i_h_npi_7_1 (I_H_NPI_7_1)

capture confirm numeric variable I_H_NPI_7_1
if !_rc{
     tostring I_H_NPI_7_1, replace
}

label define I_H_NPI_7_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_7_1, gen(i_h_npi_7_1) label (I_H_NPI_7_1)

rename i_h_npi_7_2 (I_H_NPI_7_2)

capture confirm numeric variable I_H_NPI_7_2
if !_rc{
     tostring I_H_NPI_7_2, replace
}

label define I_H_NPI_7_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_7_2, gen(i_h_npi_7_2) label (I_H_NPI_7_2)

rename i_h_npi_8 (I_H_NPI_8)

capture confirm numeric variable I_H_NPI_8
if !_rc{
     tostring I_H_NPI_8, replace
}

label define I_H_NPI_8 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_8, gen(i_h_npi_8) label (I_H_NPI_8)

rename i_h_npi_8_1 (I_H_NPI_8_1)

capture confirm numeric variable I_H_NPI_8_1
if !_rc{
     tostring I_H_NPI_8_1, replace
}

label define I_H_NPI_8_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_8_1, gen(i_h_npi_8_1) label (I_H_NPI_8_1)

rename i_h_npi_8_2 (I_H_NPI_8_2)

capture confirm numeric variable I_H_NPI_8_2
if !_rc{
     tostring I_H_NPI_8_2, replace
}

label define I_H_NPI_8_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_8_2, gen(i_h_npi_8_2) label (I_H_NPI_8_2)

rename i_h_npi_9 (I_H_NPI_9)

capture confirm numeric variable I_H_NPI_9
if !_rc{
     tostring I_H_NPI_9, replace
}

label define I_H_NPI_9 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_9, gen(i_h_npi_9) label (I_H_NPI_9)

rename i_h_npi_9_1 (I_H_NPI_9_1)

capture confirm numeric variable I_H_NPI_9_1
if !_rc{
     tostring I_H_NPI_9_1, replace
}

label define I_H_NPI_9_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_9_1, gen(i_h_npi_9_1) label (I_H_NPI_9_1)

rename i_h_npi_9_2 (I_H_NPI_9_2)

capture confirm numeric variable I_H_NPI_9_2
if !_rc{
     tostring I_H_NPI_9_2, replace
}

label define I_H_NPI_9_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_9_2, gen(i_h_npi_9_2) label (I_H_NPI_9_2)

rename i_h_npi_10 (I_H_NPI_10)

capture confirm numeric variable I_H_NPI_10
if !_rc{
     tostring I_H_NPI_10, replace
}

label define I_H_NPI_10 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_10, gen(i_h_npi_10) label (I_H_NPI_10)

rename i_h_npi_10_1 (I_H_NPI_10_1)

capture confirm numeric variable I_H_NPI_10_1
if !_rc{
     tostring I_H_NPI_10_1, replace
}

label define I_H_NPI_10_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_10_1, gen(i_h_npi_10_1) label (I_H_NPI_10_1)

rename i_h_npi_10_2 (I_H_NPI_10_2)

capture confirm numeric variable I_H_NPI_10_2
if !_rc{
     tostring I_H_NPI_10_2, replace
}

label define I_H_NPI_10_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_10_2, gen(i_h_npi_10_2) label (I_H_NPI_10_2)

rename i_h_npi_11 (I_H_NPI_11)

capture confirm numeric variable I_H_NPI_11
if !_rc{
     tostring I_H_NPI_11, replace
}

label define I_H_NPI_11 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_11, gen(i_h_npi_11) label (I_H_NPI_11)

rename i_h_npi_11_1 (I_H_NPI_11_1)

capture confirm numeric variable I_H_NPI_11_1
if !_rc{
     tostring I_H_NPI_11_1, replace
}

label define I_H_NPI_11_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_11_1, gen(i_h_npi_11_1) label (I_H_NPI_11_1)

rename i_h_npi_11_2 (I_H_NPI_11_2)

capture confirm numeric variable I_H_NPI_11_2
if !_rc{
     tostring I_H_NPI_11_2, replace
}

label define I_H_NPI_11_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_11_2, gen(i_h_npi_11_2) label (I_H_NPI_11_2)

rename i_h_npi_12 (I_H_NPI_12)

capture confirm numeric variable I_H_NPI_12
if !_rc{
     tostring I_H_NPI_12, replace
}

label define I_H_NPI_12 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_H_NPI_12, gen(i_h_npi_12) label (I_H_NPI_12)

rename i_h_npi_12_1 (I_H_NPI_12_1)

capture confirm numeric variable I_H_NPI_12_1
if !_rc{
     tostring I_H_NPI_12_1, replace
}

label define I_H_NPI_12_1 .a"." 1 "ligero (notable pero no cambios significativos)" 2 "moderado (significativo pero no cambios dramáticos)" 3 "severo (muy marcado y prominente cambio dramático)" 

encode I_H_NPI_12_1, gen(i_h_npi_12_1) label (I_H_NPI_12_1)

rename i_h_npi_12_2 (I_H_NPI_12_2)

capture confirm numeric variable I_H_NPI_12_2
if !_rc{
     tostring I_H_NPI_12_2, replace
}

label define I_H_NPI_12_2 .a"." 0 "no produce ningún malestar" 1 "mínimo (malestar ligero no es un problema manejarlo)" 2 "ligero (no mucho malestar fácil de manejarlo)" 3 "moderado (bastante malestar no siempre fácil de manejar)" 4 "severo (mucho malestar difícil de manejar)" 5 "extremo ó muy severo (malestar extremo incapaz de manejarlo)" 

encode I_H_NPI_12_2, gen(i_h_npi_12_2) label (I_H_NPI_12_2)

rename i_j1 (I_J1)

capture confirm numeric variable I_J1
if !_rc{
     tostring I_J1, replace
}

label define I_J1 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_J1, gen(i_j1) label (I_J1)

rename i_j2 (I_J2)

capture confirm numeric variable I_J2
if !_rc{
     tostring I_J2, replace
}

label define I_J2 .a"." 1 "hace menos de 5 años" 2 "entre 5 y 10 años" 3 "10 años o más" 8 "no responde"9 "no sabe"

encode I_J2, gen(i_j2) label (I_J2)

rename i_j3 (I_J3)

capture confirm numeric variable I_J3
if !_rc{
     tostring I_J3, replace
}

label define I_J3 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode I_J3, gen(i_j3) label (I_J3)

rename i_k_act_1 (I_K_ACT_1)

capture confirm numeric variable I_K_ACT_1
if !_rc{
     tostring I_K_ACT_1, replace
}

label define I_K_ACT_1 .a"." 1 "cero" 2 "media hora" 3 "una" 4 "dos a tres" 5 "cuatro a seis" 6 "siete o más" 7 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_1, gen(i_k_act_1) label (I_K_ACT_1)

rename i_k_act_2 (I_K_ACT_2)

capture confirm numeric variable I_K_ACT_2
if !_rc{
     tostring I_K_ACT_2, replace
}

label define I_K_ACT_2 .a"." 1 "cero" 2 "media hora" 3 "una" 4 "dos a tres" 5 "cuatro a seis" 6 "siete o más" 7 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_2, gen(i_k_act_2) label (I_K_ACT_2)

rename i_k_act_5 (I_K_ACT_5)

capture confirm numeric variable I_K_ACT_5
if !_rc{
     tostring I_K_ACT_5, replace
}

label define I_K_ACT_5 .a"." 1 "cero" 2 "media hora" 3 "una" 4 "dos a tres" 5 "cuatro a seis" 6 "siete o más" 7 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_5, gen(i_k_act_5) label (I_K_ACT_5)

rename i_k_act_7 (I_K_ACT_7)

capture confirm numeric variable I_K_ACT_7
if !_rc{
     tostring I_K_ACT_7, replace
}

label define I_K_ACT_7 .a"." 1 "cero" 2 "media hora" 3 "una" 4 "dos a tres" 5 "cuatro a seis" 6 "siete o más" 7 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_7, gen(i_k_act_7) label (I_K_ACT_7)

rename i_k_act_8 (I_K_ACT_8)

capture confirm numeric variable I_K_ACT_8
if !_rc{
     tostring I_K_ACT_8, replace
}

label define I_K_ACT_8 .a"." 1 "cero" 2 "media hora" 3 "una" 4 "dos a tres" 5 "cuatro a seis" 6 "siete o más" 7 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_8, gen(i_k_act_8) label (I_K_ACT_8)

rename i_k_act_10 (I_K_ACT_10)

capture confirm numeric variable I_K_ACT_10
if !_rc{
     tostring I_K_ACT_10, replace
}

label define I_K_ACT_10 .a"." 1 "si" 2 "no" 6 "no es costumbre del xxx hacerlo" 9 "no sabe"8 "no responde"

encode I_K_ACT_10, gen(i_k_act_10) label (I_K_ACT_10)

rename i_k_act_13 (I_K_ACT_13)

capture confirm numeric variable I_K_ACT_13
if !_rc{
     tostring I_K_ACT_13, replace
}

label define I_K_ACT_13 .a"." 1 "si" 2 "no" 9 "no sabe"8 "no responde"

encode I_K_ACT_13, gen(i_k_act_13) label (I_K_ACT_13)

rename i_k_act_14 (I_K_ACT_14)

capture confirm numeric variable I_K_ACT_14
if !_rc{
     tostring I_K_ACT_14, replace
}

label define I_K_ACT_14 .a"." 1 "si" 2 "no" 9 "no sabe"8 "no responde"

encode I_K_ACT_14, gen(i_k_act_14) label (I_K_ACT_14)

rename i_k_act_15 (I_K_ACT_15)

capture confirm numeric variable I_K_ACT_15
if !_rc{
     tostring I_K_ACT_15, replace
}

label define I_K_ACT_15 .a"." 1 "diariamente" 2 "varias veces a la semana" 3 "una vez a la semana" 4 "una vez al mes" 5 "raramente" 6 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_15, gen(i_k_act_15) label (I_K_ACT_15)

rename i_k_act_16 (I_K_ACT_16)

capture confirm numeric variable I_K_ACT_16
if !_rc{
     tostring I_K_ACT_16, replace
}

label define I_K_ACT_16 .a"." 1 "diariamente" 2 "varias veces a la semana" 3 "una vez a la semana" 4 "una vez al mes" 5 "raramente" 6 "nunca" 9 "no sabe"8 "no responde"

encode I_K_ACT_16, gen(i_k_act_16) label (I_K_ACT_16)

rename i_k_act_17 (I_K_ACT_17)

capture confirm numeric variable I_K_ACT_17
if !_rc{
     tostring I_K_ACT_17, replace
}

label define I_K_ACT_17 .a"." 1 "solo" 2 "acompañado" 9 "no sabe"8 "no responde"

encode I_K_ACT_17, gen(i_k_act_17) label (I_K_ACT_17)

rename i_lhas_54 (I_LHAS_54)

capture confirm numeric variable I_LHAS_54
if !_rc{
     tostring I_LHAS_54, replace
}

label define I_LHAS_54 .a"." 0 "razonable" 1 "algunas dudas" 2 "dudas moderadas" 3 "dudas graves" 4 "sin valor" 

encode I_LHAS_54, gen(i_lhas_54) label (I_LHAS_54)




label define I_B7 .a "." 0 "ninguno" 1 "de 1 a 5" 2 "de 6 a 8" 3 "de 9 a 12" 4 "más que 12" 8 "no responde" 9 "no sabe"

label values i_b7 I_B7


label define I_C7_1 .a "." 1 "profesional ejecutivo" 2 "oficinista" 3 "vendedor minorista" 4 "agricultor independiente" 5 "trabajador agricola" 6 "trabajador domestico" 7 "otros servicios" 8 "trabajador especializado" 9 "trabajador no especializado" 10 "trabajos informales" 13 "otros" 88 "no responde" 99 "no sabe"

label values i_c7_1 I_C7_1


label define I_C8A .a "." 1 "todo el tiempo enfocado exclusivamente en su (xxx)" 2 "la mayor parte del tiempo enfocado en su (xxx)" 3 "mitad y mitad" 4 "la mayor parte del tiempo haciendo otras tareas u ocio" 8 "no responde" 9 "no sabe"

label values i_c8a I_C8A

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

order i_interid i_clustid i_houseid i_particid i_country i_houseid2 i_conglid2 i_particid2 i_deviceid1 i_a2 i_a3 i_a4 i_b1 i_b3 i_b4 i_b5 i_b7 i_c1 i_c2 i_c3 i_c4 i_c5 i_c6 i_c7 i_c7_1 i_c8 i_c8a i_c9 i_c10 i_c11 i_c12 i_c23 i_c24 i_c25 i_c26 i_c26a i_c27 i_c27a i_d2 i_d3 i_d5 i_d6 i_d9 i_d10 i_d11 i_d12 i_d17 i_d19 i_d20 i_d21 i_e1 i_e2 i_e3 i_e4 i_e5 i_e6 i_e7 i_e8 i_e9 i_e10 i_e11 i_e12 i_e13 i_e14 i_e15 i_e16 i_f_csid_1 i_f_csid_2 i_f_csid_3 i_f_csid_4 i_f_csid_5 i_f_bse_3 i_f_bse_7 i_f_csid_6 i_f_csid_7 score1 i_f_csid_8 i_f_csid_9 i_f_csid_10 i_f_csid_11 i_f_csid_12 i_f_csid_13 i_f_csid_14 i_f_csid_15 i_f_csid_16 i_f_csid_17 i_f_csid_17a i_f_csid_18 score2 i_f_csid_19 i_f_csid_20 i_f_csid_21 i_f_csid_22_1 i_f_csid_22_2 i_f_csid_23_1 i_f_csid_23_2 i_f_csid_24_1 i_f_csid_24_2 i_f_csid_25 score3 i_f_csid_26 i_f_csid_27 score4 totalscore i_f_csid_28 i_g0 i_g1 i_g1_1 i_g1_2 i_g1_3 i_g1_4 i_g1_5 i_g_has_2 i_g_has_3_1 i_g_has_3_11 i_g_has_3_13 i_g_has_3_14 i_g_has_3_16 i_g_has_3_22 i_g_has_4 i_g_has_5_1 i_g_has_6 i_g_has_7_1 i_g_has_10 i_g_has_11 i_g_has_12 i_g_has_13 i_g_has_14_1 i_g_has_15 i_g_has_17 i_g_has_18 i_g_has_47 i_g_has_48 i_g_has_49 i_g_has_50 i_g_has_52 i_h_npi_1 i_h_npi_1_1 i_h_npi_1_2 i_h_npi_2 i_h_npi_2_1 i_h_npi_2_2 i_h_npi_3 i_h_npi_3_1 i_h_npi_3_2 i_h_npi_4 i_h_npi_4_1 i_h_npi_4_2 i_h_npi_5 i_h_npi_5_1 i_h_npi_5_2 i_h_npi_6 i_h_npi_6_1 i_h_npi_6_2 i_h_npi_7 i_h_npi_7_1 i_h_npi_7_2 i_h_npi_8 i_h_npi_8_1 i_h_npi_8_2 i_h_npi_9 i_h_npi_9_1 i_h_npi_9_2 i_h_npi_10 i_h_npi_10_1 i_h_npi_10_2 i_h_npi_11 i_h_npi_11_1 i_h_npi_11_2 i_h_npi_12 i_h_npi_12_1 i_h_npi_12_2 i_j1 i_j2 i_j3 i_k_act_1 i_k_act_2 i_k_act_5 i_k_act_7 i_k_act_8 i_k_act_10 i_k_act_13 i_k_act_14 i_k_act_15 i_k_act_16 i_k_act_17 i_lhas_54 i_deviceid2 i_deviceid2

*variable labels

label variable i_interid "Número del entrevistador:"

label variable i_clustid "Número del cluster:"

label variable i_houseid "Número de la casa:"

label variable i_particid "Número del participante:"

label variable i_country "Pais"

label variable i_houseid2 "NÚMERO DE LA CASA:"

label variable i_conglid2 "NUMERO DEL CLUSTER:"

label variable i_particid2 "NUMERO DEL PARTICIPANTE"

label variable i_deviceid1 "Device ID:"

label variable i_a2 "A2. A la pregunta “Cuáles son los nombres de las dos calles más importantes cerca de su casa?” xxx respondió _________ [lea la respuesta que usted anoto en papel en el cognitivo]. Es correcto?"

label variable i_a3 "A3. A la pregunta “Donde está la tienda,,bodega, o colmado más cercana?” xxx respondió _________ [lea la respuesta que usted anoto en el cognitivo]. Es correcto?"

label variable i_a4 "A4. A la pregunta “Cuál es su dirección?” xxx respondió _________ [lea la respuesta que usted anoto en el cognitivo]. Es correcto?"

label variable i_b1 "B1. ¿Es usted:"

label variable i_b3 "B3. ¿Qué edad tiene?"

label variable i_b4 "B4. Su género?"

label variable i_b5 "B5. ¿Qué relación tienes con (xxx)?"

label variable i_b7 "B7. ¿Cuántos años de educación ha completado?"

label variable i_c1 "C1. La persona mayor"

label variable i_c2 "C2. ¿Puede estar solo/a la persona mayor por una hora o más (durante el día)?"

label variable i_c3 "C3. El cuidado directo es provisto principalmente por:"

label variable i_c4 "C4. Usted es: (codifique el valor de abajo que mejor se aplique)"

label variable i_c5 "C5. Has dejado de trabajar ó has disminuido sus horas de trabajo para cuidar de su (xxx)?"

label variable i_c6 "C6. ¿Qué tiempo hace que dejó de trabajar? Codifique la respuesta en meses NO RESPONDE.......................................... 888 NO SABE...................................................... 999"

label variable i_c7 "C7. ¿Cuantas horas por semana ha disminuido su trabajo? NO RESPONDE........................................... 888 NO SABE....................................................... 999"

label variable i_c7_1 "C7.1. ¿Cuál es/era su trabajo?"

label variable i_c8 "C8. En una semana típica, cuantas horas dedica Ud a cuidar de su (xxx)? NO RESPONDE........................................... 888 NO SABE....................................................... 999"

label variable i_c8a "C8A. En estas horas que esta cuidando a su (xxx), ¿Qué proporción del tiempo está enfocado exclusivamente en su (xxx) y qué proporción está haciendo otras tareas u ocio al mismo tiempo?"

label variable i_c9 "C9. En una semana típica, recibe Ud algún pago para cuidar de su (xxx)?"

label variable i_c10 "C10. ¿En una semana típica, cuanto recibe Ud en pago para cuidar de su (xxx)? NO RESPONDE............................................ 888 NO SABE........................................................ 999"

label variable i_c11 "C11. Algúnos otros cuidan regularmente de su (xxx)?"

label variable i_c12 "C12. En total en una semana típica, ¿cuántas horas a la semana estos otros cuidan de su (xxx)? NO RESPONDE........................................... 888 NO SABE....................................................... 999"

label variable i_c23 "C23. ¿En una semana típica, algunos de ellos recibe pago para cuidar de su (xxx)?"

label variable i_c24 "C24. ¿En total en una semana típica, cuanto reciben ellos para cuidar de su (xxx)? NO RESPONDE........................................... 888 NO SABE..................................................….. 999"

label variable i_c25 "C25. Además de recibir cuidados a casa, su (xxx) va regularmente a algún Centro de Dia para Ancianos?"

label variable i_c26 "C26. Cuantas horas por la semana asiste al Centro de Dia para Ancianos? [ ] NO RESPONDE............................................ 888 NO SABE..................................................…... 999"

label variable i_c26a "C26.A. ¿Estas horas ya fueron contadas arriba?"

label variable i_c27 "C27. Cuanto se paga aproximadamente por semana para que su (xxx) pueda asistir al Centro de Dia para Ancianos? [ ] NO RESPONDE..........................................888 NO SABE..................................................….999"

label variable i_c27a "C27.A. ¿Estos pagos ya fueron contados arriba?"

label variable i_d2 "D2. Siente que por pasar tiempo con su (xxx), no tiene suficiente tiempo para sí mismo?"

label variable i_d3 "D3. Se siente estresado (a) entre el cuidado de su (xxx), y tratar de cumplir con las responsabilidades de su familia y trabajo?"

label variable i_d5 "D5. Se siente con rabia (pique) cuando está al lado de su (xxx)?"

label variable i_d6 "D6. Siente que su (xxx) en el presente afecta negativamente su relación con otros miembros de la familia o con sus amigos?"

label variable i_d9 "D9. Se siente estresada/o cuando esta alrededor de tu (xxx)?"

label variable i_d10 "D10. Siente que su salud ha sufrido por el cuidado de su (xxx)?"

label variable i_d11 "D11. Sientes que no tiene suficiente privacidad debido a su (xxx)?"

label variable i_d12 "D12. Siente que su vida social ha sufrido por su (xxx)?"

label variable i_d17 "D17. Siente que ha perdido control de su vida desde que su (xxx) se enfermó?"

label variable i_d19 "D19. ¿Se siente insegura/o respecto a qué hacer con su (xxx)?"

label variable i_d20 "D20. ¿Siente que debería estar haciendo más por su (xxx)?"

label variable i_d21 "D21. ¿Siente que podría estar haciendo un mejor trabajo respecto al cuidado de su (xxx)?"

label variable i_e1 "E1. Capacidad para recordar las cosas de familiares y amigos (dónde viven, de qué viven, cuándo es su cumpleaños…)"

label variable i_e2 "E2. Recordar cosas sucedidas en los últimos meses (noticias, sucesos familiares)."

label variable i_e3 "E3. Recordar lo que se habló en una conversación mantenida unos días antes"

label variable i_e4 "E4. Recordar su propia dirección o su número de teléfono"

label variable i_e5 "E5. Recordar la fecha en que vive (e.g., día y mes)"

label variable i_e6 "E6. Conocer el sitio exacto de los armarios de su casa y dónde se guardan las cosas"

label variable i_e7 "E7. Capacidad para encontrar cosas que se han colocado en lugares inusuales."

label variable i_e8 "E8. Saber manejar los aparatos de la casa (teléfono, automóvil, lavadora, maquinilla de afeitar, etc.)"

label variable i_e9 "E9. Capacidad para aprender a manejar un aparato nuevo (lavadora, radio, secador de pelo, etc.)"

label variable i_e10 "E10. Aprender cosas nuevas (en general)"

label variable i_e11 "E11. Seguir una historia en un libro, la prensa, television , la radio o la televisión"

label variable i_e12 "E12. Tomar decisiones tanto en cuestiones cotidianas (qué traje ponerse, qué comida preparar) como en asuntos a más largo plazo (dónde ir de vacaciones o invertir dinero)"

label variable i_e13 "E13. Manejar asuntos financieros (cobrar la pensión, pagar la renta o los impuestos, tratar con el banco)"

label variable i_e14 "E14. Manejar dinero para la compra (cuánto dinero dar, calcular el cambio)"

label variable i_e15 "E15. Manejar otros problemas aritméticos cotidianos (tiempo entre visitas de parientes, cuánta comida comprar y preparar, especialmente si hay invitados)"

label variable i_e16 "E16. ¿Cree que su inteligencia (en general)para entender y razonar lo que sucede a su alrededor?"

label variable i_f_csid_1 "F.CSID.1 ¿Ha visto algún cambio en sus actividades diarias? Por favor describa"

label variable i_f_csid_2 "F.CSID.2 ¿Ha habido una disminución general en su funcionamiento mental? Por favor describa."

label variable i_f_csid_3 "F.CSID.3 Todos tenemos cierta dificultad en recordar cosas a medida que envejecemos, pero esto ¿Ha sido un problema particularmente importante para su (pariente)?"

label variable i_f_csid_4 "F.CSID.4 ¿Se olvida donde ha puesto las cosas? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_5 "F.CSID.5 ¿Se olvida donde normalmente se guardan las cosas? Si afirmativo - Que tan a menudo?"

label variable i_f_bse_3 "F.BSE.3 ¿Tiene dificultad para recordar listas cortas de objetos (por ejemplo la lista de compras)?"

label variable i_f_bse_7 "F.BSE.7 ¿Tiene dificultad para recordar eventos recientes (ejemplo, salidas/eventos recientes, visitas a amigos o familiares)?"

label variable i_f_csid_6 "F.CSID.6 ¿Olvida el nombre de amigos? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_7 "F.CSID.7 Olvida nombres de miembros de la familia? Si afirmativo - Que tan a menudo?"

label variable score1 "Score1"

label variable i_f_csid_8 "F.CSID.8 ¿Olvida lo que quería decir en el medio de una conversación? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_9 "F.CSID.9 ¿Cuando habla tiene dificultad diciendo las palabras correctas? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_10 "F.CSID.10 ¿Usa palabras incorrectas? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_11 "F.CSID.11 ¿Tiende a hablar de cosas que pasaron hace mucho tiempo en vez de cosas presentes? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_12 "F.CSID.12 ¿Se olvida cuando fue la última vez que la/lo vio? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_13 "F.CSID.13 ¿Olvida lo que pasó ayer? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_14 "F.CSID.14 ¿Se olvida donde ella/é) está? Si afirmativo -Que tan a menudo?"

label variable i_f_csid_15 "F.CSID.15 ¿Se pierde en la comunidad? Si afirmativo -Que tan a menudo?"

label variable i_f_csid_16 "F.CSID.16 ¿Se pierde en su propia casa, ejemplo: buscando el baño? Si afirmativo - Que tan a menudo?"

label variable i_f_csid_17 "F.CSID.17 ¿Tiene dificultad realizando las tareas de la casa que ella/el acostumbraba a hacer? Tal como preparar los alimentos o hervir el té?"

label variable i_f_csid_17a "F.CSID.17a ¿El entrevistador piensa que el problema es primariamente debido a deficiencias físicas?"

label variable i_f_csid_18 "F.CSID.18 ¿Ha habido pérdida de alguna habilidad especial de un pasatiempo que antes podía hacer?"

label variable score2 "SCore2"

label variable i_f_csid_19 "F.CSID.19 ¿Ha habido un cambio en su capacidad de manejar dinero?"

label variable i_f_csid_20 "F.CSID.20 ¿Tiene dificultad para ajustarse a cambios en su rutina diaria? Si afirmativo- Que tan a menudo?"

label variable i_f_csid_21 "F.CSID.21 ¿Ha notado cambios en su habilidad para pensar y razonar?"

label variable i_f_csid_22_1 "F.CSID.22.1 ¿Tiene dificultad para alimentarse por sí misma?"

label variable i_f_csid_22_2 "F.CSID.22.2 ¿El entrevistador piensa que estos problemas son primariamente debidos a discapacidad física?"

label variable i_f_csid_23_1 "F.CSID.23.1 ¿Tiene dificultad para vestirse?"

label variable i_f_csid_23_2 "F.CSID.23.2 ¿El entrevistador piensa que el problema es primariamente debido a discapacidad física?"

label variable i_f_csid_24_1 "F.CSID.24.1 ¿Tiene dificultad usando el sanitario? ¿Se orina o defeca?"

label variable i_f_csid_24_2 "F.CSID.24.2 ¿El entrevistador piensa que el problema es primariamente debido a discapacidad física?"

label variable i_f_csid_25 "F.CSID.25 ¿Lo confunde a usted (o a otro miembro de la familia) con otra persona?"

label variable score3 "SCore3"

label variable i_f_csid_26 "F.CSID.26 ¿Recientemente, ha tenido dificultad en tomar decisiones en las cosas diarias?"

label variable i_f_csid_27 "F.CSID.27 ¿Su pensamiento parece confuso en ocasiones?"

label variable score4 "SCore4"

label variable totalscore "Puntuaje Total:"

label variable i_f_csid_28 "F.CSID.28 CODIGO DEL ENTREVISTADOR - ES EL PUNTAJE TOTAL DEL CSID 2.5 O MENOS?"

label variable i_g0 "G.0. Haciendo memoria, ¿podría dar una fecha aproximada cuando usted o alguna otra persona notó por primera vez que su (xxx) tenía dificultades con memoria, pensamiento, concentracion, actividades diarias o cuidado de si propio? Codifique el tiempo desde el comienzo en meses No Responde.......................8 No Sabe.................................9"

label variable i_g1 "G.1 ¿En algún momento usted y/o el participante (la persona mayor), buscaron ayuda de un doctor o de otro profesional de la salud por algunos de estos problemas?"

label variable i_g1_1 "G.1.1. ¿Cuando? (tiempo en meses desde la consulta) No Responde......................8 No Sabe................................9"

label variable i_g1_2 "G.1.2. ¿Le dió el doctor/ profesional de la salud, algún consejo?"

label variable i_g1_3 "G.1.3. ¿Le sirvió de ayuda?"

label variable i_g1_4 "G.1.4. ¿Le recetó el doctor/profesional de la salud, alguna medicina?"

label variable i_g1_5 "G.1.5. ¿Le sirvió de ayuda?"

label variable i_g_has_2 "G.HAS2 ¿Estos problemas ocurrieron de manera rápida o gradual? (Si el comienzo fue rápido) - ¿cuándo fue eso?"

label variable i_g_has_3_1 "G.HAS3.1 ¿Tuvo dificultad al recordar cosas?"

label variable i_g_has_3_11 "G.HAS.3.11 ¿Vio cosas que otras personas no veían?"

label variable i_g_has_3_13 "G.HAS.3.13 ¿Pudo haber comenzado con algún tipo de accidente cerebrovascular (ACV)? Un ACV es una parálisis (debilidad) de la cara o extremidades de un lado del cuerpo que dura al menos 24 horas. (SI RESPONDE SI, PREGUNTA: Por favor, describa.) (NB - DEBE SER UNA HISTORIA CLARA DEL ACV)"

label variable i_g_has_3_14 "G.HAS.3.14 ¿Tuvo problemas para encontrar la palabra correcta? (SI RESPONDE SI, PREGUNTA: Por favor, describa.) NB - SÓLO DIFICULTAD MAYOR Y PERSISTENTE EN LA BÚSQUEDA DE PALABRAS, Y EXCLUYA EL DELIRIUM (Síndrome Confusional)"

label variable i_g_has_3_16 "G.HAS.3.16 ¿Pudo haber comenzado con algún tipo de ataque epiléptico? (SI RESPONDE SI, PREGUNTA: Por favor, describa.) NB - SÓLO ATAQUES EPILÉPTICOS DIAGNOSTICADOS POR UN MÉDICO"

label variable i_g_has_3_22 "G.HAS.3.22 ¿Cómo están las cosas ahora en comparación a cuando comenzó la enfermedad? Han empeorado? Mejor o más o menos igual?"

label variable i_g_has_4 "G.HAS.4 ¿La presente enfermedad ha tendido a variar mucho, de un día a otro, de una semana a otra, empeorando y quizás mejorando por un tiempo - con altas y bajas? (SI RESPONDE SI, PREGUNTA: ¿Cuánto vario? ¿Cuánto duraron estos periodos?)"

label variable i_g_has_5_1 "G.HAS.5.1 ¿Durante los periodos de mejoría, el pensamiento, la memoria y la concentración se volvieron normales o casi normales?"

label variable i_g_has_6 "G.HAS.6 ¿Usted diría que ha habido un deterioro gradual de la memoria o...(liste los deterioros cognitivos actuales) en un periodo de más de 2 años?"

label variable i_g_has_7_1 "G.HAS.7.1 ¿La presente enfermedad ha empeorado repentinamente en algún momento, dentro de un periodo de 3 días y entonces ha permanecido así?"

label variable i_g_has_10 "G.HAS.10 ¿Hay periodos en 24 horas cuando ella (el) parece muy cambiante; alerta en un momento, adormecida y confundida después?"

label variable i_g_has_11 "G.HAS.11 ¿Se confunde por la noche, vaga, habla cosas sin sentido?"

label variable i_g_has_12 "G.HAS.12 ¿Y durante el día?"

label variable i_g_has_13 "G.HAS.13 ¿La confusión es peor al anochecer o por la noche?"

label variable i_g_has_14_1 "G. HAS.14.1 ¿Cómo lo/la trata ella (el) a usted (a sus parientes, amigos) ahora en comparación con el periodo antes del comienzo de la enfermedad? ¿Muestra falta de interés, preocupación o afecto al comparar ahora con antes?"

label variable i_g_has_15 "G.HAS.15 ¿Ha estado más irritable últimamente?"

label variable i_g_has_17 "G.HAS.17 ¿Ha habido un cambio en la conducta, quizás haciendo cosas vergonzosas o cosas que podrian molestar a otras personas?"

label variable i_g_has_18 "G.HAS.18 ¿Estas cosas fueron de las primeros cambios que usted noto o solo han sucedido recientemente?"

label variable i_g_has_47 "G.HAS.47 ¿Tuvo alguna vez su familiar algun accidente que provoco un daño a la cabeza o al cerebro?"

label variable i_g_has_48 "G.HAS.48 ¿Tuvo su familiar alguna vez una enfermedad o infección que provoco un daño serio a la cabeza o al cerebro?"

label variable i_g_has_49 "G.HAS.49 ¿Hubo un periodo de inconsciencia después de la enfermedad o accidente?"

label variable i_g_has_50 "G.HAS.50 ¿Su comportamiento cambio de alguna forma? (Sí - Describa cómo cambió, qué fue permanente)"

label variable i_g_has_52 "G.HAS.52 OBSERVACION DEL ENTREVISTADOR El estado intelectual actual del participante está presente desde el nacimiento (es debido a una causa patológica ocurrida en la infancia)? [“No” es debido a una enfermedad mental ocurrida en los últimos anos.]"

label variable i_h_npi_1 "H.NPI.1 ¿Cree (xxx) que otras personas le roban cosas, o que otros planean hacerle daño de alguna manera?"

label variable i_h_npi_1_1 "H.NPI.1.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_1_2 "H.NPI.1.2 Valore el malestar que usted experimenta por ese síntoma (como le afecta a usted)."

label variable i_h_npi_2 "H.NPI.2 ¿Actúa su (xxx) como si escuchara voces? Habla él/ ella, con gente que no está presente?"

label variable i_h_npi_2_1 "H.NPI.2.1 Valore la severidad del síntoma (como afecta a su xxx)."

label variable i_h_npi_2_2 "H.NPI.2.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)."

label variable i_h_npi_3 "H.NPI.3 ¿Es su (xxx) testarudo, o se resiste a que otros lo ayuden?"

label variable i_h_npi_3_1 "H.NPI.3.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_3_2 "H.NPI.3.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)."

label variable i_h_npi_4 "H.NPI.4 ¿Actúa su (xxx) como si él/ella estuviera triste, desaminamos o con bajo espíritu? Llora?"

label variable i_h_npi_4_1 "H.NPI.4.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_4_2 "H.NPI.4.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_5 "H.NPI.5 ¿Su xxx se incomoda cuando está separado/a de usted? ¿Muestra algún signo de nerviosismo, como falta de aire, suspiros, incapacidad de relajarse, o se siente excesivamente tenso?"

label variable i_h_npi_5_1 "H.NPI.5.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_5_2 "H.NPI.5.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_6 "H.NPI.6 ¿Parece su (xxx) sentirse demasiado bien, o actuar como si estuviese excesivamente contento/a?"

label variable i_h_npi_6_1 "H.NPI.6.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_6_2 "H.NPI.6.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_7 "H.NPI.7 ¿Su (xxx) parece menos interesado(a) en sus actividades usuales o en los planes de otros?"

label variable i_h_npi_7_1 "H.NPI.7.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_7_2 "H.NPI.7.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_8 "H.NPI.8 ¿Su (xxx) parece actuar impulsivamente?, por ejemplo, ¿Le habla a extraños como si fueran personas conococidas? O ¿Dice cosas que pueden herir los sentimientos de los demás?"

label variable i_h_npi_8_1 "H.NPI.8.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_8_2 "H.NPI.8.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_9 "H.NPI.9 ¿Nota usted a su (xxx), impaciente y malhumorado? ¿Tiene dificultad en esperar por algo o esperar por actividades planeadas?"

label variable i_h_npi_9_1 "H.NPI.9.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_9_2 "H.NPI.9.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_10 "H.NPI.10 ¿Nota que su xxx realiza actividades repetitivas como paseando por la casa, agarrando botones, amarrando cuerdas o haciendo otras cosas de manera repetitiva?"

label variable i_h_npi_10_1 "H.NPI.10.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_10_2 "H.NPI.10.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_11 "H.NPI.11 ¿Se despierta su (xxx) durante la noche? ¿Se levanta muy temprano en la mañana, o toma muchas siestas durante el día?"

label variable i_h_npi_11_1 "H.NPI.11.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_11_2 "H.NPI.11.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_h_npi_12 "H.NPI.12 Su (xxxx) ha perdido o ganado peso? O ha cambiado el gusto por los alimentos que le gustaban antes?"

label variable i_h_npi_12_1 "H.NPI.12.1 Valore la severidad del síntoma (como afecta a su xxxx)."

label variable i_h_npi_12_2 "H.NPI.12.2 Valore el malestar que usted experimenta por ese síntoma (Como le afecta a usted)"

label variable i_j1 "J1 ¿Alguna vez un médico le ha dicho a su xxx que tiene demencia o Alzheimer?"

label variable i_j2 "J2 ¿Cuándo se lo dijeron a xxx por primera vez?"

label variable i_j3 "J3 ¿El médico le recetó /prescribió a xxx alguna medicina?"

label variable i_k_act_1 "K.ACT.1 Ahora queremos saber de las actividades de xxx. Pensando primero en actividades en su casa, en un día normal, ¿Cuantas horas ve televisión?"

label variable i_k_act_2 "K.ACT.2 En un día normal, ¿Cuantas horas al día lee?"

label variable i_k_act_5 "K.ACT.5 En un día normal, ¿Cuántas horas al día dedica a tareas del hogar, mantenimiento y jardín?"

label variable i_k_act_7 "K.ACT.7 En un día normal, ¿Cuántas horas al día usa el computador o internet (incluyendo teléfono inteligente para internet o como computador)?"

label variable i_k_act_8 "K.ACT.8 En un día normal, ¿Cuántas horas al día duerme siesta?"

label variable i_k_act_10 "K.ACT.10 ¿Cocina comida?"

label variable i_k_act_13 "K.ACT.13 Ahora queremos saber de las cosas fuera de casa, ¿Puede trasladarse por sí mismo?"

label variable i_k_act_14 "K.ACT.14 ¿Puede usar el transporte público por si mismo?"

label variable i_k_act_15 "K.ACT.15 ¿Qué tan seguido va al trabaja o hace trabajos voluntarios? ¿Diría que diariamente, varias veces a la semana, una vez a la semana, una vez al mes, raramente, o nunca?"

label variable i_k_act_16 "K.ACT.16 ¿Qué tan seguido va al supermercado por comida u otras cosas? ¿Diría que diariamente, varias veces a la semana, una vez a la semana, una vez al mes, raramente, o nunca?"

label variable i_k_act_17 "K.ACT.17 ¿Habitualmente va solo o acompañado?"

label variable i_lhas_54 "L.HAS.54 CLASIFICACIÓN GLOBAL DE LA CONFIANZA EN LOS DATOS"

label variable i_deviceid2 "Device ID:"

*missing values
   
replace i_c2 = .i if (i_c2 == . | i_c2 == .a) & i_c1 ~= 3

replace i_c3 = .i if (i_c3 == . | i_c3 == .a) & i_c1 ~= 3

replace i_c4 = .i if (i_c4 == . | i_c4 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c5 = .i if (i_c5 == . | i_c5 == .a) & (i_c4 == 1 | i_c4 == .i)
*c5 should not have been answered in line 11

replace i_c6 = .i if (i_c6 == . | i_c6 == .a) & (i_c5 == 1 | i_c5 == .i)

replace i_c7 = .i if (i_c7 == . | i_c7 == .a) & (i_c5 == 2 | i_c5 == .i)

replace i_c7_1 = .i if (i_c7_1 == . | i_c7_1 == .a) & (i_c5 == 1 | i_c5 == 2 | i_c5 == .i)

replace i_c8 = .i if (i_c8 == . | i_c8 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c8a = .i if (i_c8a == . | i_c8a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c9 = .i if (i_c9 == . | i_c9 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4)

replace i_c10 = .i if (i_c10 == . | i_c10 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c4 ~= 2 & i_c4 ~= 3 & i_c4 ~= 4 & i_c9 ~= 2 & i_c9 ~= 8)

replace i_c11 = .i if (i_c11 == . | i_c11 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c12 = .i if (i_c12 == . | i_c12 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9)

replace i_c23 = .i if (i_c23 == . | i_c23 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9)

replace i_c24 = .i if (i_c24 == . | i_c24 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c11 ~= 2 & i_c11 ~= 8 & i_c11 ~= 9 & i_c23 ~= 2 & i_c23 ~= 8 & i_c23 ~= 9)
*c24 should not have been answered in line 11, 16

replace i_c25 = .i if (i_c25 == . | i_c25 == .a) & (i_c1 ~= 3 & i_c3 ~= 4)

replace i_c26 = .i if (i_c26 == . | i_c26 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c26a = .i if (i_c26a == . | i_c26a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c27 = .i if (i_c27 == . | i_c27 == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_c27a = .i if (i_c27a == . | i_c27a == .a) & (i_c1 ~= 3 & i_c3 ~= 4 & i_c25 ~= 2 & i_c25 ~= 8 & i_c25 ~= 9)

replace i_d2 = .i if (i_d2 == . | i_d2 == .a) & i_c4 == 1

replace i_d3 = .i if (i_d3 == . | i_d3 == .a) & i_c4 == 1

replace i_d5 = .i if (i_d5 == . | i_d5 == .a) & i_c4 == 1

replace i_d6 = .i if (i_d6 == . | i_d6 == .a) & i_c4 == 1

replace i_d9 = .i if (i_d9 == . | i_d9 == .a) & i_c4 == 1

replace i_d10 = .i if (i_d10 == . | i_d10 == .a) & i_c4 == 1

replace i_d11 = .i if (i_d11 == . | i_d11 == .a) & i_c4 == 1

replace i_d12 = .i if (i_d12 == . | i_d12 == .a) & i_c4 == 1

replace i_d17 = .i if (i_d17 == . | i_d17 == .a) & i_c4 == 1

replace i_d19 = .i if (i_d19 == . | i_d19 == .a) & i_c4 == 1

replace i_d20 = .i if (i_d20 == . | i_d20 == .a) & i_c4 == 1

replace i_d21 = .i if (i_d21 == . | i_d21 == .a) & i_c4 == 1

replace i_f_csid_17a = .i if (i_f_csid_17a == . | i_f_csid_17a == .a) & i_f_csid_17 ~= 0

replace i_f_csid_22_2 = .i if (i_f_csid_22_2 == . | i_f_csid_22_2 == .a) & i_f_csid_22_1 ~= 0

replace i_f_csid_23_2 = .i if (i_f_csid_23_2 == . | i_f_csid_23_2 == .a) & i_f_csid_23_1 ~= 0

replace i_f_csid_24_2 = .i if (i_f_csid_24_2 == . | i_f_csid_24_2 == .a) & i_f_csid_24_1 ~= 0

*lines 6 and 9 did not skip to section H after answering si to f.csid.28

replace i_g0 = .i if (i_g0 == . | i_g0 == .a) & i_f_csid_28 ~= 1

replace i_g1 = .i if (i_g1 == . | i_g1 == .a) & i_f_csid_28 ~= 1

replace i_g1_1 = .i if (i_g1_1 == . | i_g1_1 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_2 = .i if (i_g1_2 == . | i_g1_2 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_3 = .i if (i_g1_3 == . | i_g1_3 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9 & i_g1_2 ~= 0 & i_g1_2 ~= 8 & i_g1_2 ~= 9)

replace i_g1_4 = .i if (i_g1_4 == . | i_g1_4 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9)

replace i_g1_5 = .i if (i_g1_5 == . | i_g1_5 == .a) & (i_f_csid_28 ~= 1 & i_g1 ~= 0 & i_g1 ~= 8 & i_g1 ~= 9 & i_g1_4 ~= 0 & i_g1_4 ~= 8 & i_g1_4 ~= 9)

replace i_g_has_2 = .i if (i_g_has_2 == . | i_g_has_2 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_1 = .i if (i_g_has_3_1 == . | i_g_has_3_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_11 = .i if (i_g_has_3_11 == . | i_g_has_3_11 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_13 = .i if (i_g_has_3_13 == . | i_g_has_3_13 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_14 = .i if (i_g_has_3_14 == . | i_g_has_3_14 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_16 = .i if (i_g_has_3_16 == . | i_g_has_3_16 == .a) & i_f_csid_28 ~= 1

replace i_g_has_3_22 = .i if (i_g_has_3_22 == . | i_g_has_3_22 == .a) & i_f_csid_28 ~= 1

replace i_g_has_4 = .i if (i_g_has_4 == . | i_g_has_4 == .a) & i_f_csid_28 ~= 1

replace i_g_has_5_1 = .i if (i_g_has_5_1 == . | i_g_has_5_1 == .a) & (i_f_csid_28 ~= 1 & i_g_has_4 ~= 0 & i_g_has_4 ~= 8 & i_g_has_4 ~= 9)

replace i_g_has_6 = .i if (i_g_has_6 == . | i_g_has_6 == .a) & i_f_csid_28 ~= 1

replace i_g_has_7_1 = .i if (i_g_has_7_1 == . | i_g_has_7_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_10 = .i if (i_g_has_10 == . | i_g_has_10 == .a) & i_f_csid_28 ~= 1

replace i_g_has_11 = .i if (i_g_has_11 == . | i_g_has_11 == .a) & i_f_csid_28 ~= 1

replace i_g_has_12 = .i if (i_g_has_12 == . | i_g_has_12 == .a) & i_f_csid_28 ~= 1

replace i_g_has_13 = .i if (i_g_has_13 == . | i_g_has_13 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_10 ~= 0 | i_g_has_11 ~= 0 | i_g_has_12 ~= 0))

replace i_g_has_14_1 = .i if (i_g_has_14_1 == . | i_g_has_14_1 == .a) & i_f_csid_28 ~= 1

replace i_g_has_15 = .i if (i_g_has_15 == . | i_g_has_15 == .a) & i_f_csid_28 ~= 1

replace i_g_has_17 = .i if (i_g_has_17 == . | i_g_has_17 == .a) & i_f_csid_28 ~= 1

replace i_g_has_18 = .i if (i_g_has_18 == . | i_g_has_18 == .a) & (i_f_csid_28 ~= 1 & i_g_has_17 ~= 0 & i_g_has_17 ~= 8 & i_g_has_17 ~= 9)

replace i_g_has_47 = .i if (i_g_has_47 == . | i_g_has_47 == .a) & i_f_csid_28 ~= 1

replace i_g_has_48 = .i if (i_g_has_48 == . | i_g_has_48 == .a) & i_f_csid_28 ~= 1

replace i_g_has_49 = .i if (i_g_has_49 == . | i_g_has_49 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_47 ~= 0 | i_g_has_48 ~= 0))

replace i_g_has_50 = .i if (i_g_has_50 == . | i_g_has_50 == .a) & (i_f_csid_28 ~= 1 & (i_g_has_47 ~= 0 | i_g_has_48 ~= 0))

replace i_g_has_52 = .i if (i_g_has_52 == . | i_g_has_52 == .a) & i_f_csid_28 ~= 1

replace i_h_npi_1_1 = .i if (i_h_npi_1_1 == . | i_h_npi_1_1 == .a) & (i_h_npi_1 ~= 0 & i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9)
*line 11 was not supposed to answer this question

replace i_h_npi_1_2 = .i if (i_h_npi_1_2 == . | i_h_npi_1_2 == .a) & (i_h_npi_1 ~= 0 & i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9)

replace i_h_npi_2_1 = .i if (i_h_npi_2_1 == . | i_h_npi_2_1 == .a) & (i_h_npi_2 ~= 0 & i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9)

replace i_h_npi_2_2 = .i if (i_h_npi_2_2 == . | i_h_npi_2_2 == .a) & (i_h_npi_2 ~= 0 & i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9)
*line 3 did not answer this

replace i_h_npi_3_1 = .i if (i_h_npi_3_1 == . | i_h_npi_3_1 == .a) & (i_h_npi_3 ~= 0 & i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9)

replace i_h_npi_3_2 = .i if (i_h_npi_3_2 == . | i_h_npi_3_2 == .a) & (i_h_npi_3 ~= 0 & i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9)
*line 9 and 13 did not answer this

replace i_h_npi_4_1 = .i if (i_h_npi_4_1 == . | i_h_npi_4_1 == .a) & (i_h_npi_4 ~= 0 & i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9)

replace i_h_npi_4_2 = .i if (i_h_npi_4_2 == . | i_h_npi_4_2 == .a) & (i_h_npi_4 ~= 0 & i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9)

replace i_h_npi_5_1 = .i if (i_h_npi_5_1 == . | i_h_npi_5_1 == .a) & (i_h_npi_5 ~= 0 & i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9)

replace i_h_npi_5_2 = .i if (i_h_npi_5_2 == . | i_h_npi_5_2 == .a) & (i_h_npi_5 ~= 0 & i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9)

replace i_h_npi_6_1 = .i if (i_h_npi_6_1 == . | i_h_npi_6_1 == .a) & (i_h_npi_6 ~= 0 & i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9)

replace i_h_npi_6_2 = .i if (i_h_npi_6_2 == . | i_h_npi_6_2 == .a) & (i_h_npi_6 ~= 0 & i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9)

replace i_h_npi_7_1 = .i if (i_h_npi_7_1 == . | i_h_npi_7_1 == .a) & (i_h_npi_7 ~= 0 & i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9)

replace i_h_npi_7_2 = .i if (i_h_npi_7_2 == . | i_h_npi_7_2 == .a) & (i_h_npi_7 ~= 0 & i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9)

replace i_h_npi_2_1 = .i if (i_h_npi_8_1 == . | i_h_npi_8_1 == .a) & (i_h_npi_8 ~= 0 & i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9)

replace i_h_npi_2_2 = .i if (i_h_npi_8_2 == . | i_h_npi_8_2 == .a) & (i_h_npi_8 ~= 0 & i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9)

replace i_h_npi_9_1 = .i if (i_h_npi_9_1 == . | i_h_npi_9_1 == .a) & (i_h_npi_9 ~= 0 & i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9)

replace i_h_npi_9_2 = .i if (i_h_npi_9_2 == . | i_h_npi_9_2 == .a) & (i_h_npi_9 ~= 0 & i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9)

replace i_h_npi_10_1 = .i if (i_h_npi_10_1 == . | i_h_npi_10_1 == .a) & (i_h_npi_10 ~= 0 & i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9)

replace i_h_npi_10_2 = .i if (i_h_npi_10_2 == . | i_h_npi_10_2 == .a) & (i_h_npi_10 ~= 0 & i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9)

replace i_h_npi_11_1 = .i if (i_h_npi_11_1 == . | i_h_npi_11_1 == .a) & (i_h_npi_11 ~= 0 & i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9)

replace i_h_npi_11_2 = .i if (i_h_npi_11_2 == . | i_h_npi_11_2 == .a) & (i_h_npi_11 ~= 0 & i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9)

replace i_h_npi_12_1 = .i if (i_h_npi_12_1 == . | i_h_npi_12_1 == .a) & (i_h_npi_12 ~= 0 & i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9)

replace i_h_npi_12_2 = .i if (i_h_npi_12_2 == . | i_h_npi_12_2 == .a) & (i_h_npi_12 ~= 0 & i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9)

replace i_j2 = .i if (i_j2 == . | i_j2 == .a) & (i_j1 ~= 0 & i_j1 ~= 8 & i_j1 ~= 9)

replace i_j3 = .i if (i_j3 == . | i_j3 == .a) & (i_j1 ~= 0 & i_j1 ~= 8 & i_j1 ~= 9)

replace i_k_act_17 = .i if (i_k_act_17 == . | i_k_act_17 == .a) & (i_k_act_16 ~= 6 & i_k_act_16 ~= 8 & i_k_act_16 ~= 9)






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




*change all remaining . to .i

replace i_interid = .i if (i_interid == . | i_interid == .a)
replace i_clustid = .i if (i_clustid == . | i_clustid == .a)
replace i_houseid = .i if (i_houseid == . | i_houseid == .a)
replace i_particid = .i if (i_particid == . | i_particid == .a)
replace i_country = .i if (i_country == . | i_country == .a)
replace i_houseid2 = .i if (i_houseid2 == . | i_houseid2 == .a)
replace i_conglid2 = .i if (i_conglid2 == . | i_conglid2 == .a)
replace i_particid2 = ".i" if i_particid2 == ""
replace i_deviceid1 = ".i" if i_deviceid1 == ""
replace i_a2 = .i if (i_a2 == . | i_a2 == .a)
replace i_a3 = .i if (i_a3 == . | i_a3 == .a)
replace i_a4 = .i if (i_a4 == . | i_a4 == .a)
replace i_b1 = .i if (i_b1 == . | i_b1 == .a)
replace i_b3 = .i if (i_b3 == . | i_b3 == .a)
replace i_b4 = .i if (i_b4 == . | i_b4 == .a)
replace i_b5 = .i if (i_b5 == . | i_b5 == .a)
replace i_b7 = .i if (i_b7 == . | i_b7 == .a)
replace i_c1 = .i if (i_c1 == . | i_c1 == .a)
replace i_c2 = .i if (i_c2 == . | i_c2 == .a)
replace i_c3 = .i if (i_c3 == . | i_c3 == .a)
replace i_c4 = .i if (i_c4 == . | i_c4 == .a)
replace i_c5 = .i if (i_c5 == . | i_c5 == .a)
replace i_c6 = .i if (i_c6 == . | i_c6 == .a)
replace i_c7 = .i if (i_c7 == . | i_c7 == .a)
replace i_c7_1 = .i if (i_c7_1 == . | i_c7_1 == .a)
replace i_c8 = .i if (i_c8 == . | i_c8 == .a)
replace i_c8a = .i if (i_c8a == . | i_c8a == .a)
replace i_c9 = .i if (i_c9 == . | i_c9 == .a)
replace i_c10 = .i if (i_c10 == . | i_c10 == .a)
replace i_c11 = .i if (i_c11 == . | i_c11 == .a)
replace i_c12 = .i if (i_c12 == . | i_c12 == .a)
replace i_c23 = .i if (i_c23 == . | i_c23 == .a)
replace i_c24 = .i if (i_c24 == . | i_c24 == .a)
replace i_c25 = .i if (i_c25 == . | i_c25 == .a)
replace i_c26 = .i if (i_c26 == . | i_c26 == .a)
replace i_c26a = .i if (i_c26a == . | i_c26a == .a)
replace i_c27 = .i if (i_c27 == . | i_c27 == .a)
replace i_c27a = .i if (i_c27a == . | i_c27a == .a)
replace i_d2 = .i if (i_d2 == . | i_d2 == .a)
replace i_d3 = .i if (i_d3 == . | i_d3 == .a)
replace i_d5 = .i if (i_d5 == . | i_d5 == .a)
replace i_d6 = .i if (i_d6 == . | i_d6 == .a)
replace i_d9 = .i if (i_d9 == . | i_d9 == .a)
replace i_d10 = .i if (i_d10 == . | i_d10 == .a)
replace i_d11 = .i if (i_d11 == . | i_d11 == .a)
replace i_d12 = .i if (i_d12 == . | i_d12 == .a)
replace i_d17 = .i if (i_d17 == . | i_d17 == .a)
replace i_d19 = .i if (i_d19 == . | i_d19 == .a)
replace i_d20 = .i if (i_d20 == . | i_d20 == .a)
replace i_d21 = .i if (i_d21 == . | i_d21 == .a)
replace i_e1 = .i if (i_e1 == . | i_e1 == .a)
replace i_e2 = .i if (i_e2 == . | i_e2 == .a)
replace i_e3 = .i if (i_e3 == . | i_e3 == .a)
replace i_e4 = .i if (i_e4 == . | i_e4 == .a)
replace i_e5 = .i if (i_e5 == . | i_e5 == .a)
replace i_e6 = .i if (i_e6 == . | i_e6 == .a)
replace i_e7 = .i if (i_e7 == . | i_e7 == .a)
replace i_e8 = .i if (i_e8 == . | i_e8 == .a)
replace i_e9 = .i if (i_e9 == . | i_e9 == .a)
replace i_e10 = .i if (i_e10 == . | i_e10 == .a)
replace i_e11 = .i if (i_e11 == . | i_e11 == .a)
replace i_e12 = .i if (i_e12 == . | i_e12 == .a)
replace i_e13 = .i if (i_e13 == . | i_e13 == .a)
replace i_e14 = .i if (i_e14 == . | i_e14 == .a)
replace i_e15 = .i if (i_e15 == . | i_e15 == .a)
replace i_e16 = .i if (i_e16 == . | i_e16 == .a)
replace i_f_csid_1 = .i if (i_f_csid_1 == . | i_f_csid_1 == .a)
replace i_f_csid_2 = .i if (i_f_csid_2 == . | i_f_csid_2 == .a)
replace i_f_csid_3 = .i if (i_f_csid_3 == . | i_f_csid_3 == .a)
replace i_f_csid_4 = .i if (i_f_csid_4 == . | i_f_csid_4 == .a)
replace i_f_csid_5 = .i if (i_f_csid_5 == . | i_f_csid_5 == .a)
replace i_f_bse_3 = .i if (i_f_bse_3 == . | i_f_bse_3 == .a)
replace i_f_bse_7 = .i if (i_f_bse_7 == . | i_f_bse_7 == .a)
replace i_f_csid_6 = .i if (i_f_csid_6 == . | i_f_csid_6 == .a)
replace i_f_csid_7 = .i if (i_f_csid_7 == . | i_f_csid_7 == .a)
replace score1 = .i if (score1 == . | score1 == .a)
replace i_f_csid_8 = .i if (i_f_csid_8 == . | i_f_csid_8 == .a)
replace i_f_csid_9 = .i if (i_f_csid_9 == . | i_f_csid_9 == .a)
replace i_f_csid_10 = .i if (i_f_csid_10 == . | i_f_csid_10 == .a)
replace i_f_csid_11 = .i if (i_f_csid_11 == . | i_f_csid_11 == .a)
replace i_f_csid_12 = .i if (i_f_csid_12 == . | i_f_csid_12 == .a)
replace i_f_csid_13 = .i if (i_f_csid_13 == . | i_f_csid_13 == .a)
replace i_f_csid_14 = .i if (i_f_csid_14 == . | i_f_csid_14 == .a)
replace i_f_csid_15 = .i if (i_f_csid_15 == . | i_f_csid_15 == .a)
replace i_f_csid_16 = .i if (i_f_csid_16 == . | i_f_csid_16 == .a)
replace i_f_csid_17 = .i if (i_f_csid_17 == . | i_f_csid_17 == .a)
replace i_f_csid_17a = .i if (i_f_csid_17a == . | i_f_csid_17a == .a)
replace i_f_csid_18 = .i if (i_f_csid_18 == . | i_f_csid_18 == .a)
replace score2 = .i if (score2 == . | score2 == .a)
replace i_f_csid_19 = .i if (i_f_csid_19 == . | i_f_csid_19 == .a)
replace i_f_csid_20 = .i if (i_f_csid_20 == . | i_f_csid_20 == .a)
replace i_f_csid_21 = .i if (i_f_csid_21 == . | i_f_csid_21 == .a)
replace i_f_csid_22_1 = .i if (i_f_csid_22_1 == . | i_f_csid_22_1 == .a)
replace i_f_csid_22_2 = .i if (i_f_csid_22_2 == . | i_f_csid_22_2 == .a)
replace i_f_csid_23_1 = .i if (i_f_csid_23_1 == . | i_f_csid_23_1 == .a)
replace i_f_csid_23_2 = .i if (i_f_csid_23_2 == . | i_f_csid_23_2 == .a)
replace i_f_csid_24_1 = .i if (i_f_csid_24_1 == . | i_f_csid_24_1 == .a)
replace i_f_csid_24_2 = .i if (i_f_csid_24_2 == . | i_f_csid_24_2 == .a)
replace i_f_csid_25 = .i if (i_f_csid_25 == . | i_f_csid_25 == .a)
replace score3 = .i if (score3 == . | score3 == .a)
replace i_f_csid_26 = .i if (i_f_csid_26 == . | i_f_csid_26 == .a)
replace i_f_csid_27 = .i if (i_f_csid_27 == . | i_f_csid_27 == .a)
replace score4 = .i if (score4 == . | score4 == .a)
replace totalscore = .i if (totalscore == . | totalscore == .a)
replace i_f_csid_28 = .i if (i_f_csid_28 == . | i_f_csid_28 == .a)
replace i_g0 = .i if (i_g0 == . | i_g0 == .a)
replace i_g1 = .i if (i_g1 == . | i_g1 == .a)
replace i_g1_1 = .i if (i_g1_1 == . | i_g1_1 == .a)
replace i_g1_2 = .i if (i_g1_2 == . | i_g1_2 == .a)
replace i_g1_3 = .i if (i_g1_3 == . | i_g1_3 == .a)
replace i_g1_4 = .i if (i_g1_4 == . | i_g1_4 == .a)
replace i_g1_5 = .i if (i_g1_5 == . | i_g1_5 == .a)
replace i_g_has_2 = .i if (i_g_has_2 == . | i_g_has_2 == .a)
replace i_g_has_3_1 = .i if (i_g_has_3_1 == . | i_g_has_3_1 == .a)
replace i_g_has_3_11 = .i if (i_g_has_3_11 == . | i_g_has_3_11 == .a)
replace i_g_has_3_13 = .i if (i_g_has_3_13 == . | i_g_has_3_13 == .a)
replace i_g_has_3_14 = .i if (i_g_has_3_14 == . | i_g_has_3_14 == .a)
replace i_g_has_3_16 = .i if (i_g_has_3_16 == . | i_g_has_3_16 == .a)
replace i_g_has_3_22 = .i if (i_g_has_3_22 == . | i_g_has_3_22 == .a)
replace i_g_has_4 = .i if (i_g_has_4 == . | i_g_has_4 == .a)
replace i_g_has_5_1 = .i if (i_g_has_5_1 == . | i_g_has_5_1 == .a)
replace i_g_has_6 = .i if (i_g_has_6 == . | i_g_has_6 == .a)
replace i_g_has_7_1 = .i if (i_g_has_7_1 == . | i_g_has_7_1 == .a)
replace i_g_has_10 = .i if (i_g_has_10 == . | i_g_has_10 == .a)
replace i_g_has_11 = .i if (i_g_has_11 == . | i_g_has_11 == .a)
replace i_g_has_12 = .i if (i_g_has_12 == . | i_g_has_12 == .a)
replace i_g_has_13 = .i if (i_g_has_13 == . | i_g_has_13 == .a)
replace i_g_has_14_1 = .i if (i_g_has_14_1 == . | i_g_has_14_1 == .a)
replace i_g_has_15 = .i if (i_g_has_15 == . | i_g_has_15 == .a)
replace i_g_has_17 = .i if (i_g_has_17 == . | i_g_has_17 == .a)
replace i_g_has_18 = .i if (i_g_has_18 == . | i_g_has_18 == .a)
replace i_g_has_47 = .i if (i_g_has_47 == . | i_g_has_47 == .a)
replace i_g_has_48 = .i if (i_g_has_48 == . | i_g_has_48 == .a)
replace i_g_has_49 = .i if (i_g_has_49 == . | i_g_has_49 == .a)
replace i_g_has_50 = .i if (i_g_has_50 == . | i_g_has_50 == .a)
replace i_g_has_52 = .i if (i_g_has_52 == . | i_g_has_52 == .a)
replace i_h_npi_1 = .i if (i_h_npi_1 == . | i_h_npi_1 == .a)
replace i_h_npi_1_1 = .i if (i_h_npi_1_1 == . | i_h_npi_1_1 == .a)
replace i_h_npi_1_2 = .i if (i_h_npi_1_2 == . | i_h_npi_1_2 == .a)
replace i_h_npi_2 = .i if (i_h_npi_2 == . | i_h_npi_2 == .a)
replace i_h_npi_2_1 = .i if (i_h_npi_2_1 == . | i_h_npi_2_1 == .a)
replace i_h_npi_2_2 = .i if (i_h_npi_2_2 == . | i_h_npi_2_2 == .a)
replace i_h_npi_3 = .i if (i_h_npi_3 == . | i_h_npi_3 == .a)
replace i_h_npi_3_1 = .i if (i_h_npi_3_1 == . | i_h_npi_3_1 == .a)
replace i_h_npi_3_2 = .i if (i_h_npi_3_2 == . | i_h_npi_3_2 == .a)
replace i_h_npi_4 = .i if (i_h_npi_4 == . | i_h_npi_4 == .a)
replace i_h_npi_4_1 = .i if (i_h_npi_4_1 == . | i_h_npi_4_1 == .a)
replace i_h_npi_4_2 = .i if (i_h_npi_4_2 == . | i_h_npi_4_2 == .a)
replace i_h_npi_5 = .i if (i_h_npi_5 == . | i_h_npi_5 == .a)
replace i_h_npi_5_1 = .i if (i_h_npi_5_1 == . | i_h_npi_5_1 == .a)
replace i_h_npi_5_2 = .i if (i_h_npi_5_2 == . | i_h_npi_5_2 == .a)
replace i_h_npi_6 = .i if (i_h_npi_6 == . | i_h_npi_6 == .a)
replace i_h_npi_6_1 = .i if (i_h_npi_6_1 == . | i_h_npi_6_1 == .a)
replace i_h_npi_6_2 = .i if (i_h_npi_6_2 == . | i_h_npi_6_2 == .a)
replace i_h_npi_7 = .i if (i_h_npi_7 == . | i_h_npi_7 == .a)
replace i_h_npi_7_1 = .i if (i_h_npi_7_1 == . | i_h_npi_7_1 == .a)
replace i_h_npi_7_2 = .i if (i_h_npi_7_2 == . | i_h_npi_7_2 == .a)
replace i_h_npi_8 = .i if (i_h_npi_8 == . | i_h_npi_8 == .a)
replace i_h_npi_8_1 = .i if (i_h_npi_8_1 == . | i_h_npi_8_1 == .a)
replace i_h_npi_8_2 = .i if (i_h_npi_8_2 == . | i_h_npi_8_2 == .a)
replace i_h_npi_9 = .i if (i_h_npi_9 == . | i_h_npi_9 == .a)
replace i_h_npi_9_1 = .i if (i_h_npi_9_1 == . | i_h_npi_9_1 == .a)
replace i_h_npi_9_2 = .i if (i_h_npi_9_2 == . | i_h_npi_9_2 == .a)
replace i_h_npi_10 = .i if (i_h_npi_10 == . | i_h_npi_10 == .a)
replace i_h_npi_10_1 = .i if (i_h_npi_10_1 == . | i_h_npi_10_1 == .a)
replace i_h_npi_10_2 = .i if (i_h_npi_10_2 == . | i_h_npi_10_2 == .a)
replace i_h_npi_11 = .i if (i_h_npi_11 == . | i_h_npi_11 == .a)
replace i_h_npi_11_1 = .i if (i_h_npi_11_1 == . | i_h_npi_11_1 == .a)
replace i_h_npi_11_2 = .i if (i_h_npi_11_2 == . | i_h_npi_11_2 == .a)
replace i_h_npi_12 = .i if (i_h_npi_12 == . | i_h_npi_12 == .a)
replace i_h_npi_12_1 = .i if (i_h_npi_12_1 == . | i_h_npi_12_1 == .a)
replace i_h_npi_12_2 = .i if (i_h_npi_12_2 == . | i_h_npi_12_2 == .a)
replace i_j1 = .i if (i_j1 == . | i_j1 == .a)
replace i_j2 = .i if (i_j2 == . | i_j2 == .a)
replace i_j3 = .i if (i_j3 == . | i_j3 == .a)
replace i_k_act_1 = .i if (i_k_act_1 == . | i_k_act_1 == .a)
replace i_k_act_2 = .i if (i_k_act_2 == . | i_k_act_2 == .a)
replace i_k_act_5 = .i if (i_k_act_5 == . | i_k_act_5 == .a)
replace i_k_act_7 = .i if (i_k_act_7 == . | i_k_act_7 == .a)
replace i_k_act_8 = .i if (i_k_act_8 == . | i_k_act_8 == .a)
replace i_k_act_10 = .i if (i_k_act_10 == . | i_k_act_10 == .a)
replace i_k_act_13 = .i if (i_k_act_13 == . | i_k_act_13 == .a)
replace i_k_act_14 = .i if (i_k_act_14 == . | i_k_act_14 == .a)
replace i_k_act_15 = .i if (i_k_act_15 == . | i_k_act_15 == .a)
replace i_k_act_16 = .i if (i_k_act_16 == . | i_k_act_16 == .a)
replace i_k_act_17 = .i if (i_k_act_17 == . | i_k_act_17 == .a)
replace i_lhas_54 = .i if (i_lhas_54 == . | i_lhas_54 == .a)
replace i_deviceid2 = ".i" if i_deviceid2 == ""




*drop all uppercase variables

drop I_*





*COUNTS NUMBER OF .i IN EACH OBSERVATION UNDER NEW VARIABLE CALLED i_countmissing
local i 1
gen i_countmissing = 0

quietly ds hhid pid i_time2 i_time1 i_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey i_deviceid2, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace i_countmissing = i_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace i_countmissing = i_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}




*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED i_last
local i 1
gen i_last = "AllAnswered"

quietly ds i_countmissing hhid pid i_last i_time2 i_time1 i_date fkey lastsavetime lastsavelogonname firstsavetime firstsavelogonname globalrecordid recstatus uniquekey i_deviceid2, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if (`v'[`i'] == ".i" | `v'[`i'] == ".v") {
				continue
			}
			else {
				replace i_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace i_last = "`v'" in `i'
				continue, break
			}
		}
	}
}




gen i_TotalTime = (Clock(i_time2, "MDYhms") - Clock(i_time1, "MDYhms"))/1000/60



capture log close
log using InforMissingCodebook, text replace

codebook

   save InforMissing, replace


log close

 save Infor.dta, replace
clear all
