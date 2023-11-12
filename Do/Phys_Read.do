clear all 
set more off
capture log close

local country = 2

*Change the filepath name here to the folder containing the data and output folders
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
*local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
}

if `country' == 0 {
    insheet using "../PR_in/Phys_Child.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Phys_Child.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Phys_Child.csv", comma names clear
    
}

*converting numeric to string

generate P2_1 = cond(p2_1 ==  0, "no", cond(p2_1 ==  1, "si", ""))

drop p2_1

generate P6 = cond(p6 ==  0, "mirada hacia arriba normal", cond(p6 ==  1, "mirada hacia arriba limitada", cond(p6 ==  2, "no puede o casi no puede mirar hacia arriba", cond(p6 ==  3, "no hizo la prueba", ""))))

drop p6

generate P7_1 = cond(p7_1 ==  0, "1-4 golpes", cond(p7_1 ==  1, "5 golpes", cond(p7_1 ==  2, "6-9 golpes", cond(p7_1 ==  3, "10+ golpes", cond(p7_1 ==  4, "no intentó la prueba", "")))))

drop p7_1

generate P7_2 = cond(p7_2 ==  0, "no hace trompa (protruye los labios)", cond(p7_2 ==  1, "trompa presente", cond(p7_2 ==  2, "no pudo hacerlo", "")))

drop p7_2

generate P7_3 = cond(p7_3 ==  0, "no hay contracción facial", cond(p7_3 ==  1, "reflejo de contracción facial presente", cond(p7_3 ==  2, "no pudo hacerlo", "")))

drop p7_3

generate P8_1 = cond(p8_1 ==  0, "no hay temblor", cond(p8_1 ==  1, "lento", cond(p8_1 ==  2, "medio", cond(p8_1 ==  3, "rápido", cond(p8_1 ==  4, "no pudo hacerlo", "")))))

drop p8_1

generate P8_2 = cond(p8_2 ==  0, "no hay temblor", cond(p8_2 ==  1, "lento", cond(p8_2 ==  2, "medio", cond(p8_2 ==  3, "rápido", cond(p8_2 ==  4, "no pudo hacerlo", "")))))

drop p8_2

generate P8_3 = cond(p8_3 ==  0, "no hay temblor", cond(p8_3 ==  1, "lento", cond(p8_3 ==  2, "medio", cond(p8_3 ==  3, "rápido", cond(p8_3 ==  4, "no pudo hacerlo", "")))))

drop p8_3

generate P9_1 = cond(p9_1 ==  0, "no hay desviación", cond(p9_1 ==  1, "desviación presente por causas neurológicas", cond(p9_1 ==  2, "desviación presente por otras causas", cond(p9_1 ==  3, "no intentó la prueba", ""))))

drop p9_1

generate P9_2 = cond(p9_2 ==  0, "derecho", cond(p9_2 ==  1, "izquierdo", cond(p9_2 ==  2, "no pudo hacerlo", cond(p9_2 ==  3, "no intentó la prueba", ""))))

drop p9_2

generate P10_1_1_1 = cond(p10_1_1_1 ==  0, "tono normal", cond(p10_1_1_1 ==  1, "tono ligeramente aumentado", cond(p10_1_1_1 ==  2, "tono muy aumentado", cond(p10_1_1_1 ==  3, "no intentó la prueba", ""))))

drop p10_1_1_1

generate P10_1_1_2 = cond(p10_1_1_2 ==  0, "tono normal", cond(p10_1_1_2 ==  1, "tono ligeramente aumentado", cond(p10_1_1_2 ==  2, "tono muy aumentado", cond(p10_1_1_2 ==  3, "no intentó la prueba", ""))))

drop p10_1_1_2

generate P10_1_2_1 = cond(p10_1_2_1 ==  0, "tono normal", cond(p10_1_2_1 ==  1, "tono ligeramente aumentado", cond(p10_1_2_1 ==  2, "tono muy aumentado", cond(p10_1_2_1 ==  3, "no intentó la prueba", ""))))

drop p10_1_2_1

generate P10_1_2_2 = cond(p10_1_2_2 ==  0, "tono normal", cond(p10_1_2_2 ==  1, "tono ligeramente aumentado", cond(p10_1_2_2 ==  2, "tono muy aumentado", cond(p10_1_2_2 ==  3, "no intentó la prueba", ""))))

drop p10_1_2_2

generate P10_2_1_1 = cond(p10_2_1_1 ==  0, "tono normal", cond(p10_2_1_1 ==  1, "tono ligeramente aumentado", cond(p10_2_1_1 ==  2, "tono muy aumentado", cond(p10_2_1_1 ==  3, "no intentó la prueba", ""))))

drop p10_2_1_1

generate P10_2_1_2 = cond(p10_2_1_2 ==  0, "tono normal", cond(p10_2_1_2 ==  1, "tono ligeramente aumentado", cond(p10_2_1_2 ==  2, "tono muy aumentado", cond(p10_2_1_2 ==  3, "no intentó la prueba", ""))))

drop p10_2_1_2

generate P10_2_2_1 = cond(p10_2_2_1 ==  0, "tono normal", cond(p10_2_2_1 ==  1, "tono ligeramente aumentado", cond(p10_2_2_1 ==  2, "tono muy aumentado", cond(p10_2_2_1 ==  3, "no intentó la prueba", ""))))

drop p10_2_2_1

generate P10_2_2_2 = cond(p10_2_2_2 ==  0, "tono normal", cond(p10_2_2_2 ==  1, "tono ligeramente aumentado", cond(p10_2_2_2 ==  2, "tono muy aumentado", cond(p10_2_2_2 ==  3, "no intentó la prueba", ""))))

drop p10_2_2_2

generate P11_1 = cond(p11_1 ==  0, "derecha", cond(p11_1 ==  1, "izquierda", cond(p11_1 ==  2, "no responde", cond(p11_1 ==  3, "no sabe", ""))))

drop p11_1

generate P11_2_1 = cond(p11_2_1 ==  0, "no limitaciones", cond(p11_2_1 ==  1, "limitaciones (lentitud y/o torpeza)", cond(p11_2_1 ==  2, "no intentó la prueba", "")))

drop p11_2_1

generate P11_2_2 = cond(p11_2_2 ==  0, "no limitaciones", cond(p11_2_2 ==  1, "limitaciones (lentitud y/o torpeza)", cond(p11_2_2 ==  2, "no intentó la prueba", "")))

drop p11_2_2

generate P11_3_1_1 = cond(p11_3_1_1 ==  0, "velocidad normal", cond(p11_3_1_1 ==  1, "lento", cond(p11_3_1_1 ==  2, "no intentó la prueba", "")))

drop p11_3_1_1

generate P11_3_1_2 = cond(p11_3_1_2 ==  0, "velocidad normal", cond(p11_3_1_2 ==  1, "lento", cond(p11_3_1_2 ==  2, "no intentó la prueba", "")))

drop p11_3_1_2

generate P11_3_2_1 = cond(p11_3_2_1 ==  0, "coordinación normal", cond(p11_3_2_1 ==  1, "torpe descoordinado", cond(p11_3_2_1 ==  2, "no intentó la prueba", "")))

drop p11_3_2_1

generate P11_3_2_2 = cond(p11_3_2_2 ==  0, "coordinación normal", cond(p11_3_2_2 ==  1, "torpe descoordinado", cond(p11_3_2_2 ==  2, "no intentó la prueba", "")))

drop p11_3_2_2

generate P12_1 = cond(p12_1 ==  0, "dominante", cond(p12_1 ==  1, "no-dominante", cond(p12_1 ==  2, "no intentó la prueba", "")))

drop p12_1

generate P12_2_1 = cond(p12_2_1 ==  0, "requiere sólo una demostración", cond(p12_2_1 ==  1, "requiere 2-3 demostraciones", cond(p12_2_1 ==  2, "requiere 4-5 demostraciones", cond(p12_2_1 ==  3, "incapaz de aprender correctamente con 5 demostraciones", cond(p12_2_1 ==  4, "no intentó la prueba", "")))))

drop p12_2_1

generate P12_2_2 = cond(p12_2_2 ==  0, "5 secuencias correctas", cond(p12_2_2 ==  1, "5 secuencias realizadas con un error", cond(p12_2_2 ==  2, "5 secuencias después de una re-demostración", cond(p12_2_2 ==  3, "incapaz de completar 5 secuencias correctamente", cond(p12_2_2 ==  4, "no intentó la prueba", "")))))

drop p12_2_2

generate P12_3_1 = cond(p12_3_1 ==  0, "requiere sólo una demostración", cond(p12_3_1 ==  1, "requiere 2-3 demostraciones", cond(p12_3_1 ==  2, "requiere 4-5 demostraciones", cond(p12_3_1 ==  3, "incapaz de aprender correctamente luego de 5 demostraciones", cond(p12_3_1 ==  4, "no intentó la prueba", "")))))

drop p12_3_1

generate P12_3_2 = cond(p12_3_2 ==  0, "5 secuencias correctas", cond(p12_3_2 ==  1, "5 secuencias realizadas con un error", cond(p12_3_2 ==  2, "5 secuencias después de una re-demostración", cond(p12_3_2 ==  3, "incapaz de completar las 5 secuencias correctamente", cond(p12_3_2 ==  4, "no intentó la prueba", "")))))

drop p12_3_2

generate P13_1 = cond(p13_1 ==  0, "ausente", cond(p13_1 ==  1, "normal (+)", cond(p13_1 ==  2, "normal rápido (2+)", cond(p13_1 ==  3, "patológicamente rápido (3+)", cond(p13_1 ==  4, "no intentó la prueba", "")))))

drop p13_1

generate P13_2 = cond(p13_2 ==  0, "ausente", cond(p13_2 ==  1, "normal (+)", cond(p13_2 ==  2, "normal rápido (2+)", cond(p13_2 ==  3, "patológicamente rápido (3+)", cond(p13_2 ==  4, "no intentó la prueba", "")))))

drop p13_2

generate P13_3 = cond(p13_3 ==  0, "ausente", cond(p13_3 ==  1, "normal (+)", cond(p13_3 ==  2, "normal rápido (2+)", cond(p13_3 ==  3, "patológicamente rápido (3+)", cond(p13_3 ==  4, "no intentó la prueba", "")))))

drop p13_3

generate P13_4 = cond(p13_4 ==  0, "ausente", cond(p13_4 ==  1, "normal (+)", cond(p13_4 ==  2, "normal rápido (2+)", cond(p13_4 ==  3, "patológicamente rápido (3+)", cond(p13_4 ==  4, "no intentó la prueba", "")))))

drop p13_4

generate P13_5 = cond(p13_5 ==  0, "ausente", cond(p13_5 ==  1, "normal (+)", cond(p13_5 ==  2, "normal rápido (2+)", cond(p13_5 ==  3, "patológicamente rápido (3+)", cond(p13_5 ==  4, "no intentó la prueba", "")))))

drop p13_5

generate P2_3 = cond(p2_3 ==  0, "no", cond(p2_3 ==  1, "si", ""))

drop p2_3

generate P14_3_1 = cond(p14_3_1 ==  0, "balanceo de brazos normal", cond(p14_3_1 ==  1, "balanceo de brazos reducido", cond(p14_3_1 ==  2, "no balanceo de brazos", cond(p14_3_1 ==  3, "no intentó por incapacidad", cond(p14_3_1 ==  4, "no pudo por otra razon", "")))))

drop p14_3_1

generate P14_3_2 = cond(p14_3_2 ==  0, "balanceo de brazos normal", cond(p14_3_2 ==  1, "balanceo de brazos reducido", cond(p14_3_2 ==  2, "no balanceo de brazos", cond(p14_3_2 ==  3, "no intentó por incapacidad", cond(p14_3_2 ==  4, "no pudo por otra razon", "")))))

drop p14_3_2

generate P14_4 = cond(p14_4 ==  0, "marcha normal", cond(p14_4 ==  1, "inestable marcha de base ancha", cond(p14_4 ==  2, "muy instable marcha de base ancha", cond(p14_4 ==  3, "no intentó por incapacidad", cond(p14_4 ==  4, "no pudo por otra razon", "")))))

drop p14_4

generate P14_5 = cond(p14_5 ==  0, "velocidad normal", cond(p14_5 ==  1, "algo lentos", cond(p14_5 ==  2, "muy lentos", cond(p14_5 ==  3, "no intentó por incapacidad", cond(p14_5 ==  4, "no pudo por otra razon", "")))))

drop p14_5

generate P15_A = cond(p15_a ==  0, "no", cond(p15_a ==  1, "si", ""))

drop p15_a

generate P16_1 = cond(p16_1 ==  0, "no", cond(p16_1 ==  1, "si", ""))

drop p16_1

generate P16_2 = cond(p16_2 ==  0, "no", cond(p16_2 ==  1, "si", cond(p16_2 ==  2, "no responde", cond(p16_2 ==  3, "no sabe", ""))))

drop p16_2

generate P17_3 = cond(p17_3 ==  0, "no tiene problemas", cond(p17_3 ==  1, "algunos problemas", cond(p17_3 ==  2, "muchos problemas", cond(p17_3 ==  3, "no responde", cond(p17_3 ==  4, "no sabe", "")))))

drop p17_3

generate P19_1 = cond(p19_1 ==  0, "no pudo", cond(p19_1 ==  1, "pudo pero necesitó ayudarse con las manos", cond(p19_1 ==  2, "pudo sin ayuda de las manos", cond(p19_1 ==  3, "no intentó", ""))))

drop p19_1

generate P20 = cond(p20 ==  0, "en cama / confinado/a a la cama", cond(p20 ==  1, "confinado/a a la silla (movilidad limitada puede pasarse de la silla a la cama)", cond(p20 ==  2, "confinada/o a la casa (movilidad limitada se moviliza por la casa exclusivamente)", cond(p20 ==  3, "movilidad limitada fuera de la casa", cond(p20 ==  4, "movilidad total dentro y fuera de la casa", cond(p20 ==  5, "no sabe", ""))))))

drop p20

generate P21_1 = cond(p21_1 ==  0, "no", cond(p21_1 ==  1, "si", cond(p21_1 ==  2, "no responde", "")))

drop p21_1

generate P21_2 = cond(p21_2 ==  0, "excelente", cond(p21_2 ==  1, "muy buena", cond(p21_2 ==  2, "buena", cond(p21_2 ==  3, "regular", cond(p21_2 ==  4, "mala", cond(p21_2 ==  5, "ciego", cond(p21_2 ==  6, "no responde", cond(p21_2 ==  7, "no sabe", ""))))))))

drop p21_2

generate P22_1 = cond(p22_1 ==  0, "no", cond(p22_1 ==  1, "si", cond(p22_1 ==  2, "no responde", "")))

drop p22_1

generate P22_2 = cond(p22_2 ==  0, "excelente", cond(p22_2 ==  1, "muy buena", cond(p22_2 ==  2, "buena", cond(p22_2 ==  3, "regular", cond(p22_2 ==  4, "mala", cond(p22_2 ==  5, "sordo", cond(p22_2 ==  6, "no responde", cond(p22_2 ==  7, "no sabe", ""))))))))

drop p22_2



*now we encode

if `country' == 0 {
    export delimited using "../PR_in/Phys_Child_String.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Phys_Child_String.csv", replace
}
else if `country' == 2 {
    export delimited using "../CUBA_in/Phys_Child_String.csv", replace
}

if `country' == 0 {
    insheet using "../PR_in/Phys_Child_String.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Phys_Child_String.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Phys_Child_String.csv", comma names clear
}
   
   ds, has(type string)

  local string_vars = r(varlist)

foreach var of local string_vars {

    gen `var'_trimmed = ustrlower(ustrtrim(`var'))

    replace `var' = `var'_trimmed

    drop `var'_trimmed

}

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values p_country country_label

gen p_country_str = string(p_country, "%12.0f")

gen p_clustid_str = string(p_clustid, "%12.0f")
replace p_clustid_str = cond(strlen(p_clustid_str) == 1, "0" + p_clustid_str, p_clustid_str)

gen p_houseid_str = string(p_houseid, "%03.0f")
replace p_houseid_str = cond(strlen(p_houseid_str) == 1, "00" + p_houseid_str, p_houseid_str)
replace p_houseid_str = cond(strlen(p_houseid_str) == 2, "0" + p_houseid_str, p_houseid_str)

gen p_particid_str = string(p_particid, "%12.0f")
replace p_particid_str = cond(strlen(p_particid_str) == 1, "0" + p_particid_str, p_particid_str)

gen pid = p_country_str + p_clustid_str + p_houseid_str + p_particid_str
gen hhid = p_country_str + p_clustid_str + p_houseid_str
drop p_clustid_str p_houseid_str p_particid_str

*second entry

gen p_clustid2_str = string(p_conglid2, "%12.0f")
replace p_clustid2_str = cond(strlen(p_clustid2_str) == 1, "0" + p_clustid2_str, p_clustid2_str)

gen p_houseid2_str = string(p_houseid2, "%03.0f")
replace p_houseid2_str = cond(strlen(p_houseid2_str) == 1, "00" + p_houseid2_str, p_houseid2_str)
replace p_houseid2_str = cond(strlen(p_houseid2_str) == 2, "0" + p_houseid2_str, p_houseid2_str)

gen p_particid2_str = string(p_particid2, "%12.0f")
replace p_particid2_str = cond(strlen(p_particid2_str) == 1, "0" + p_particid2_str, p_particid2_str)

gen pid2 = p_country_str + p_clustid2_str + p_houseid2_str + p_particid2_str
drop p_country_str p_clustid2_str p_houseid2_str p_particid2_str

rename p2_1 (P2_1)

capture confirm numeric variable P2_1
if !_rc{
     tostring P2_1, replace
}

label define P2_1 .a"." 0 "no" 1 "si" 

encode P2_1, gen(p2_1) label (P2_1)

rename p6 (P6)

capture confirm numeric variable P6
if !_rc{
     tostring P6, replace
}

label define P6 .a"." 0 "mirada hacia arriba normal" 1 "mirada hacia arriba limitada" 2 "no puede o casi no puede mirar hacia arriba" 6 "no hizo la prueba" 

encode P6, gen(p6) label (P6)

rename p7_1 (P7_1)

capture confirm numeric variable P7_1
if !_rc{
     tostring P7_1, replace
}

label define P7_1 .a"." 0 "1-4 golpes" 1 "5 golpes" 2 "6-9 golpes" 3 "10+ golpes" 6 "no intentó la prueba" 

encode P7_1, gen(p7_1) label (P7_1)

rename p7_2 (P7_2)

capture confirm numeric variable P7_2
if !_rc{
     tostring P7_2, replace
}

label define P7_2 .a"." 0 "no hace trompa (protruye los labios)" 1 "trompa presente" 6 "no pudo hacerlo" 

encode P7_2, gen(p7_2) label (P7_2)

rename p7_3 (P7_3)

capture confirm numeric variable P7_3
if !_rc{
     tostring P7_3, replace
}

label define P7_3 .a"." 0 "no hay contracción facial" 1 "reflejo de contracción facial presente" 6 "no pudo hacerlo" 

encode P7_3, gen(p7_3) label (P7_3)

rename p8_1 (P8_1)

capture confirm numeric variable P8_1
if !_rc{
     tostring P8_1, replace
}

label define P8_1 .a"." 0 "no hay temblor" 1 "lento" 2 "medio" 3 "rápido" 6 "no pudo hacerlo" 

encode P8_1, gen(p8_1) label (P8_1)

rename p8_2 (P8_2)

capture confirm numeric variable P8_2
if !_rc{
     tostring P8_2, replace
}

label define P8_2 .a"." 0 "no hay temblor" 1 "lento" 2 "medio" 3 "rápido" 6 "no pudo hacerlo" 

encode P8_2, gen(p8_2) label (P8_2)

rename p8_3 (P8_3)

capture confirm numeric variable P8_3
if !_rc{
     tostring P8_3, replace
}

label define P8_3 .a"." 0 "no hay temblor" 1 "lento" 2 "medio" 3 "rápido" 6 "no pudo hacerlo" 

encode P8_3, gen(p8_3) label (P8_3)

rename p9_1 (P9_1)

capture confirm numeric variable P9_1
if !_rc{
     tostring P9_1, replace
}

label define P9_1 .a"." 0 "no hay desviación" 1 "desviación presente por causas neurológicas" 2 "desviación presente por otras causas" 6 "no intentó la prueba" 

encode P9_1, gen(p9_1) label (P9_1)

rename p9_2 (P9_2)

capture confirm numeric variable P9_2
if !_rc{
     tostring P9_2, replace
}

label define P9_2 .a"." 0 "derecho" 1 "izquierdo" 6 "no pudo hacerlo" 7 "no intentó la prueba" 

encode P9_2, gen(p9_2) label (P9_2)

rename p10_1_1_1 (P10_1_1_1)

capture confirm numeric variable P10_1_1_1
if !_rc{
     tostring P10_1_1_1, replace
}

label define P10_1_1_1 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba" 

encode P10_1_1_1, gen(p10_1_1_1) label (P10_1_1_1)

rename p10_1_1_2 (P10_1_1_2)

capture confirm numeric variable P10_1_1_2
if !_rc{
     tostring P10_1_1_2, replace
}

label define P10_1_1_2 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba" 

encode P10_1_1_2, gen(p10_1_1_2) label (P10_1_1_2)

rename p10_1_2_1 (P10_1_2_1)

capture confirm numeric variable P10_1_2_1
if !_rc{
     tostring P10_1_2_1, replace
}

label define P10_1_2_1 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba"  

encode P10_1_2_1, gen(p10_1_2_1) label (P10_1_2_1)

rename p10_1_2_2 (P10_1_2_2)

capture confirm numeric variable P10_1_2_2
if !_rc{
     tostring P10_1_2_2, replace
}

label define P10_1_2_2 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba" 

encode P10_1_2_2, gen(p10_1_2_2) label (P10_1_2_2)

rename p10_2_1_1 (P10_2_1_1)

capture confirm numeric variable P10_2_1_1
if !_rc{
     tostring P10_2_1_1, replace
}

label define P10_2_1_1 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba"  

encode P10_2_1_1, gen(p10_2_1_1) label (P10_2_1_1)

rename p10_2_1_2 (P10_2_1_2)

capture confirm numeric variable P10_2_1_2
if !_rc{
     tostring P10_2_1_2, replace
}

label define P10_2_1_2 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba" 

encode P10_2_1_2, gen(p10_2_1_2) label (P10_2_1_2)

rename p10_2_2_1 (P10_2_2_1)

capture confirm numeric variable P10_2_2_1
if !_rc{
     tostring P10_2_2_1, replace
}

label define P10_2_2_1 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba"  

encode P10_2_2_1, gen(p10_2_2_1) label (P10_2_2_1)

rename p10_2_2_2 (P10_2_2_2)

capture confirm numeric variable P10_2_2_2
if !_rc{
     tostring P10_2_2_2, replace
}

label define P10_2_2_2 .a"." 0 "tono normal" 1 "tono ligeramente aumentado" 2 "tono muy aumentado" 6 "no intentó la prueba" 

encode P10_2_2_2, gen(p10_2_2_2) label (P10_2_2_2)

rename p11_1 (P11_1)

capture confirm numeric variable P11_1
if !_rc{
     tostring P11_1, replace
}

label define P11_1 .a"." 0 "derecha" 1 "izquierda" 8 "no responde"9 "no sabe"

encode P11_1, gen(p11_1) label (P11_1)

rename p11_2_1 (P11_2_1)

capture confirm numeric variable P11_2_1
if !_rc{
     tostring P11_2_1, replace
}

label define P11_2_1 .a"." 0 "no limitaciones" 1 "limitaciones (lentitud y/o torpeza)" 6 "no intentó la prueba" 

encode P11_2_1, gen(p11_2_1) label (P11_2_1)

rename p11_2_2 (P11_2_2)

capture confirm numeric variable P11_2_2
if !_rc{
     tostring P11_2_2, replace
}

label define P11_2_2 .a"." 0 "no limitaciones" 1 "limitaciones (lentitud y/o torpeza)" 6 "no intentó la prueba" 

encode P11_2_2, gen(p11_2_2) label (P11_2_2)

rename p11_3_1_1 (P11_3_1_1)

capture confirm numeric variable P11_3_1_1
if !_rc{
     tostring P11_3_1_1, replace
}

label define P11_3_1_1 .a"." 0 "velocidad normal" 1 "lento" 6 "no intentó la prueba" 

encode P11_3_1_1, gen(p11_3_1_1) label (P11_3_1_1)

rename p11_3_1_2 (P11_3_1_2)

capture confirm numeric variable P11_3_1_2
if !_rc{
     tostring P11_3_1_2, replace
}

label define P11_3_1_2 .a"." 0 "velocidad normal" 1 "lento" 6 "no intentó la prueba" 

encode P11_3_1_2, gen(p11_3_1_2) label (P11_3_1_2)

rename p11_3_2_1 (P11_3_2_1)

capture confirm numeric variable P11_3_2_1
if !_rc{
     tostring P11_3_2_1, replace
}

label define P11_3_2_1 .a"." 0 "coordinación normal" 1 "torpe descoordinado" 6 "no intentó la prueba" 

encode P11_3_2_1, gen(p11_3_2_1) label (P11_3_2_1)

rename p11_3_2_2 (P11_3_2_2)

capture confirm numeric variable P11_3_2_2
if !_rc{
     tostring P11_3_2_2, replace
}

label define P11_3_2_2 .a"." 0 "coordinación normal" 1 "torpe descoordinado" 6 "no intentó la prueba" 

encode P11_3_2_2, gen(p11_3_2_2) label (P11_3_2_2)

rename p12_1 (P12_1)

capture confirm numeric variable P12_1
if !_rc{
     tostring P12_1, replace
}

label define P12_1 .a"." 0 "dominante" 1 "no-dominante" 6 "no intentó la prueba" 

encode P12_1, gen(p12_1) label (P12_1)

rename p12_2_1 (P12_2_1)

capture confirm numeric variable P12_2_1
if !_rc{
     tostring P12_2_1, replace
}

label define P12_2_1 .a"." 0 "requiere sólo una demostración" 1 "requiere 2-3 demostraciones" 2 "requiere 4-5 demostraciones" 3 "incapaz de aprender correctamente con 5 demostraciones" 6 "no intentó la prueba" 

encode P12_2_1, gen(p12_2_1) label (P12_2_1)

rename p12_2_2 (P12_2_2)

capture confirm numeric variable P12_2_2
if !_rc{
     tostring P12_2_2, replace
}

label define P12_2_2 .a"." 0 "5 secuencias correctas" 1 "5 secuencias realizadas con un error" 2 "5 secuencias después de una re-demostración" 3 "incapaz de completar 5 secuencias correctamente" 6 "no intentó la prueba" 

encode P12_2_2, gen(p12_2_2) label (P12_2_2)

rename p12_3_1 (P12_3_1)

capture confirm numeric variable P12_3_1
if !_rc{
     tostring P12_3_1, replace
}

label define P12_3_1 .a"." 0 "requiere sólo una demostración" 1 "requiere 2-3 demostraciones" 2 "requiere 4-5 demostraciones" 3 "incapaz de aprender correctamente luego de 5 demostraciones" 6 "no intentó la prueba" 

encode P12_3_1, gen(p12_3_1) label (P12_3_1)

rename p12_3_2 (P12_3_2)

capture confirm numeric variable P12_3_2
if !_rc{
     tostring P12_3_2, replace
}

label define P12_3_2 .a"." 0 "5 secuencias correctas" 1 "5 secuencias realizadas con un error" 2 "5 secuencias después de una re-demostración" 3 "incapaz de completar las 5 secuencias correctamente" 6 "no intentó la prueba" 

encode P12_3_2, gen(p12_3_2) label (P12_3_2)

rename p13_1 (P13_1)

capture confirm numeric variable P13_1
if !_rc{
     tostring P13_1, replace
}

label define P13_1 .a"." 0 "ausente" 1 "normal (+)" 2 "normal rápido (2+)" 3 "patológicamente rápido (3+)" 6 "no intentó la prueba" 

encode P13_1, gen(p13_1) label (P13_1)

rename p13_2 (P13_2)

capture confirm numeric variable P13_2
if !_rc{
     tostring P13_2, replace
}

label define P13_2 .a"." 0 "ausente" 1 "normal (+)" 2 "normal rápido (2+)" 3 "patológicamente rápido (3+)" 6 "no intentó la prueba" 

encode P13_2, gen(p13_2) label (P13_2)

rename p13_3 (P13_3)

capture confirm numeric variable P13_3
if !_rc{
     tostring P13_3, replace
}

label define P13_3 .a"." 0 "ausente" 1 "normal (+)" 2 "normal rápido (2+)" 3 "patológicamente rápido (3+)" 6 "no intentó la prueba" 

encode P13_3, gen(p13_3) label (P13_3)

rename p13_4 (P13_4)

capture confirm numeric variable P13_4
if !_rc{
     tostring P13_4, replace
}

label define P13_4 .a"." 0 "ausente" 1 "normal (+)" 2 "normal rápido (2+)" 3 "patológicamente rápido (3+)" 6 "no intentó la prueba" 

encode P13_4, gen(p13_4) label (P13_4)

rename p13_5 (P13_5)

capture confirm numeric variable P13_5
if !_rc{
     tostring P13_5, replace
}

label define P13_5 .a"." 0 "ausente" 1 "normal (+)" 2 "normal rápido (2+)" 3 "patológicamente rápido (3+)" 6 "no intentó la prueba" 

encode P13_5, gen(p13_5) label (P13_5)

rename p2_3 (P2_3)

capture confirm numeric variable P2_3
if !_rc{
     tostring P2_3, replace
}

label define P2_3 .a"." 0 "no" 1 "si" 

encode P2_3, gen(p2_3) label (P2_3)

rename p14_3_1 (P14_3_1)

capture confirm numeric variable P14_3_1
if !_rc{
     tostring P14_3_1, replace
}

label define P14_3_1 .a"." 0 "balanceo de brazos normal" 1 "balanceo de brazos reducido" 2 "no balanceo de brazos" 6 "no intentó por incapacidad" 7 "no pudo por otra razon" 

encode P14_3_1, gen(p14_3_1) label (P14_3_1)

rename p14_3_2 (P14_3_2)

capture confirm numeric variable P14_3_2
if !_rc{
     tostring P14_3_2, replace
}

label define P14_3_2 .a"." 0 "balanceo de brazos normal" 1 "balanceo de brazos reducido" 2 "no balanceo de brazos" 6 "no intentó por incapacidad" 7 "no pudo por otra razon" 

encode P14_3_2, gen(p14_3_2) label (P14_3_2)

rename p14_4 (P14_4)

capture confirm numeric variable P14_4
if !_rc{
     tostring P14_4, replace
}

label define P14_4 .a"." 0 "marcha normal" 1 "inestable marcha de base ancha" 2 "muy instable marcha de base ancha" 6 "no intentó por incapacidad" 7 "no pudo por otra razon" 

encode P14_4, gen(p14_4) label (P14_4)

rename p14_5 (P14_5)

capture confirm numeric variable P14_5
if !_rc{
     tostring P14_5, replace
}

label define P14_5 .a"." 0 "velocidad normal" 1 "algo lentos" 2 "muy lentos" 6 "no intentó por incapacidad" 7 "no pudo por otra razon" 

encode P14_5, gen(p14_5) label (P14_5)

rename p15_a (P15_A)

capture confirm numeric variable P15_A
if !_rc{
     tostring P15_A, replace
}

label define P15_A .a"." 0 "no" 1 "si" 

encode P15_A, gen(p15_a) label (P15_A)

rename p16_1 (P16_1)

capture confirm numeric variable P16_1
if !_rc{
     tostring P16_1, replace
}

label define P16_1 .a"." 0 "no" 1 "si" 

encode P16_1, gen(p16_1) label (P16_1)

rename p16_2 (P16_2)

capture confirm numeric variable P16_2
if !_rc{
     tostring P16_2, replace
}

label define P16_2 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode P16_2, gen(p16_2) label (P16_2)

rename p17_3 (P17_3)

capture confirm numeric variable P17_3
if !_rc{
     tostring P17_3, replace
}

label define P17_3 .a"." 0 "no tiene problemas" 1 "algunos problemas" 2 "muchos problemas" 8 "no responde"9 "no sabe"

encode P17_3, gen(p17_3) label (P17_3)

rename p19_1 (P19_1)

capture confirm numeric variable P19_1
if !_rc{
     tostring P19_1, replace
}

label define P19_1 .a"." 1 "no pudo" 2 "pudo pero necesitó ayudarse con las manos" 3 "pudo sin ayuda de las manos" 6 "no intentó" 

encode P19_1, gen(p19_1) label (P19_1)

rename p20 (P20)

capture confirm numeric variable P20
if !_rc{
     tostring P20, replace
}

label define P20 .a"." 0 "en cama / confinado/a a la cama" 1 "confinado/a a la silla (movilidad limitada puede pasarse de la silla a la cama)" 2 "confinada/o a la casa (movilidad limitada se moviliza por la casa exclusivamente)" 3 "movilidad limitada fuera de la casa" 4 "movilidad total dentro y fuera de la casa" 9 "no sabe"

encode P20, gen(p20) label (P20)

rename p21_1 (P21_1)

capture confirm numeric variable P21_1
if !_rc{
     tostring P21_1, replace
}

label define P21_1 .a"." 0 "no" 1 "si" 8 "no responde"

encode P21_1, gen(p21_1) label (P21_1)

rename p21_2 (P21_2)

capture confirm numeric variable P21_2
if !_rc{
     tostring P21_2, replace
}

label define P21_2 .a"." 1 "excelente" 2 "muy buena" 3 "buena" 4 "regular" 5 "mala" 6 "ciego" 8 "no responde"9 "no sabe"

encode P21_2, gen(p21_2) label (P21_2)

rename p22_1 (P22_1)

capture confirm numeric variable P22_1
if !_rc{
     tostring P22_1, replace
}

label define P22_1 .a"." 0 "no" 1 "si" 8 "no responde"

encode P22_1, gen(p22_1) label (P22_1)

rename p22_2 (P22_2)

capture confirm numeric variable P22_2
if !_rc{
     tostring P22_2, replace
}

label define P22_2 .a"." 1 "excelente" 2 "muy buena" 3 "buena" 4 "regular" 5 "mala" 6 "sordo" 8 "no responde"9 "no sabe"

encode P22_2, gen(p22_2) label (P22_2)

*reorder

order pid pid2 p_deviceid1 p_interid p_clustid p_houseid p_particid p_country p_houseid2 p_conglid2 p_particid2 p2_1 p2_2_1 p2_2_2 p3_d_c p3_p p4_d_c p4_p p5_1_d_c p5_1_p p5_2_d_c p5_2_p p6 p7_1 p7_2 p7_3 p8_1 p8_2 p8_3 p9_1 p9_2 p10_1_1_1 p10_1_1_2 p10_1_2_1 p10_1_2_2 p10_2_1_1 p10_2_1_2 p10_2_2_1 p10_2_2_2 p11_1 p11_2_1 p11_2_2 p11_3_1_1 p11_3_1_2 p11_3_2_1 p11_3_2_2 p12_1 p12_2_1 p12_2_2 p12_3_1 p12_3_2 p13_1 p13_2 p13_3 p13_4 p13_5 p2_3 p2_3_1 p2_3_2 p14_1 p14_2 p14_3_1 p14_3_2 p14_4 p14_5 p15_a p15_1_1 p15_1_2 p15_1_3 p15_2_1 p15_2_2 p15_2_3 p16_1 p16_2 p17_1 p17_2 p17_3 p18_d_c p18_p p19_1 p19_2 p20 p21_1 p21_2 p22_1 p22_2 p_deviceid2 p_deviceid2

*convert missing comment legal and text values to string

capture confirm numeric variable p_deviceid1
if !_rc{
     tostring p_deviceid1, replace
}

capture confirm numeric variable p_particid2
if !_rc{
     tostring p_particid2, replace
}

capture confirm numeric variable p_deviceid2
if !_rc{
     tostring p_deviceid2, replace
}

*add variable labels

label variable p_deviceid1 "Device ID:"

label variable p_interid "Número del entrevistador:"

label variable p_clustid "Número del cluster:"

label variable p_houseid "Número de la casa:"

label variable p_particid "Número del participante:"

label variable p_country "Pais"

label variable p_houseid2 "NÚMERO DE LA CASA"

label variable p_conglid2 "NUMERO DEL CLUSTER:"

label variable p_particid2 "NUMERO DEL PARTICIPANTE"

label variable p2_1 "2.1 ¿Pudo realizar la medición de presión sanguínea?"

label variable p2_2_1 "Sistólica (rango habitual es > 80 o < 200)"

label variable p2_2_2 "Diastólica (rango habitual es >50 o <200)"

label variable p3_d_c "Circunferencia craneana (Centimetros) (rango habitual es >49 o <63)"

label variable p3_p "Circunferencia craneana (Pulgadas) (rango habitual es >19 o <25)"

label variable p4_d_c "Circunferencia de la cintura (Centímetros) (rango habitual es >56 o <129)"

label variable p4_p "Circunferencia de la cintura (Pulgadas) (rango habitual es >21 o <50)"

label variable p5_1_d_c "Altura de la rodilla (Centímetros) (rango habitual es >49 o <59)"

label variable p5_1_p "Altura de la rodilla (Pulgadas) (rango habitual es >19 o <23)"

label variable p5_2_d_c "Estatura (Centímetros) (rango habitual es >131 o <189)"

label variable p5_2_p "Estatura (Pulgadas) (rango habitual es >51 o <74)"

label variable p6 "“Por favor, no mueva su cabeza, solo siga mi dedo con sus ojos”"

label variable p7_1 "7.1 REFLEJO GLABELAR Golpee ligeramente la frente de los participantes por encima del caballete de la nariz. Repita el golpe hasta que el paciente deje de parpadear. Cuente el número de golpes necesarios."

label variable p7_2 "7.2 REFLEJO DE TROMPA Golpee ligeramente los labios del participante con la punta del dedo índice."

label variable p7_3 "7.3 REFLEJO PALMOMENTONIANO Rasque el lateral del dedo meñique de la palma de la mano del participante con una llave mientras observa la barbilla y la boca para ver si hay signos de movimientos."

label variable p8_1 "8.1 CABEZA"

label variable p8_2 "8.2 EXTREMIDAD SUPERIOR DERECHA"

label variable p8_3 "8.3 EXTREMIDAD SUPERIOR IZQUIERDA"

label variable p9_1 "9.1 DESVIACION PRESENTE"

label variable p9_2 "9.2 Lado desviado"

label variable p10_1_1_1 "10.1.1.1 Superiores - Izquierda"

label variable p10_1_1_2 "10.1.1.2 Superiores - Derecha"

label variable p10_1_2_1 "10.1.2.1. Inferiores - Izquierda"

label variable p10_1_2_2 "10.1.2.2. Inferiores - Derecha"

label variable p10_2_1_1 "10.2.1.1 Superiores - Izquierda"

label variable p10_2_1_2 "10.2.1.2. Superiores - Derecha"

label variable p10_2_2_1 "10.2.2.1 Inferiores - Izquierda"

label variable p10_2_2_2 "10.2.2.2 Inferiores - Derecha"

label variable p11_1 "¿Qué mano usa para escribir? (Usted podría usar otra pregunta que sea culturalmente más apropiada para averiguar la dominancia si el participante es iletrado)"

label variable p11_2_1 "11.2.1 DEDOS DE MANO DERECHA"

label variable p11_2_2 "11.2.2 DEDOS DE MANO IZQUIERDA"

label variable p11_3_1_1 "11.3.1.1. Velocidad de movimientos alternantes en la derecha"

label variable p11_3_1_2 "11.3.1.2. Velocidad de movimientos alternantes en la izquierda"

label variable p11_3_2_1 "11.3.2.1. Movimientos alternantes en la derecha"

label variable p11_3_2_2 "11.3.2.2. Movimientos alternantes en la izquierda"

label variable p12_1 "12.1. CUÁL MANO USÓ PARA PALMA-PUÑO LADO"

label variable p12_2_1 "12.2.1. Aprendizaje - PUÑO-PALMA-LADO"

label variable p12_2_2 "12.2.2 Secuencia: - PUÑO-PALMA-LADO."

label variable p12_3_1 "12.3.1. APRENDIZAJE - COORDINACIÓN RECÍPROCA"

label variable p12_3_2 "12.3.2 SECUENCIAS – COORDINACIÓN RECÍPROCA"

label variable p13_1 "13.1 Sacudida (salto) del bicep derecho"

label variable p13_2 "13.2 Sacudida (salto) bicep izquierdo"

label variable p13_3 "13.3 Sacudida (salto) de mandíbula"

label variable p13_4 "13.4 Sacudida (salto) rodilla derecha"

label variable p13_5 "13.5 Sacudida (salto) rodilla izquierda"

label variable p2_3 "2.3 ¿Pudo realizar la medición de presión sanguinea?"

label variable p2_3_1 "PRESIÓN SISTÓLICA (rango habitual: >80 o <200)"

label variable p2_3_2 "PRESIÓN DIASTÓLICA (rango habitual: >50 o <200)"

label variable p14_1 "14.1 Número de pasos dados (usted necesita contarlos): ## 66 NO PUDO HACERLO POR INCAPACIDAD 77 NO PUDO HACERO POR OTRA RAZON"

label variable p14_2 "14.2 Tiempo que le tomó hacerlo (usted necesita tomar el tiempo usando un reloj apropiado): ## 66 NO PUDO HACERLO POR INCAPACIDAD 77 NO PUDO HACERO POR OTRA RAZON"

label variable p14_3_1 "14.3.1 Balanceo del brazo, derecho"

label variable p14_3_2 "14.3.2 Balanceo del brazo, izquierdo"

label variable p14_4 "14.4 Ataxia (inestabilidad)"

label variable p14_5 "14.5 Bradiquinesia (lentitud de movimientos)"

label variable p15_a "15.A ¿Pudo realizar la prueba de fuerza de prensión manual?"

label variable p15_1_1 "15.1.1. 1a PRUEBA"

label variable p15_1_2 "15.1.2. 2a PRUEBA"

label variable p15_1_3 "15.1.3. 3a PRUEBA"

label variable p15_2_1 "15.2.1. 1a PRUEBA"

label variable p15_2_2 "15.2.2. 2a PRUEBA"

label variable p15_2_3 "15.2.3. 3a PRUEBA"

label variable p16_1 "16.1 ¿Tiene dentaduras postizas (planchas)?"

label variable p16_2 "16.2 OBSERVACION: ¿TENÍA PUESTAS DENTADURAS POSTIZAS (PLANCHAS) AL MOMENTO DEL EXAMEN?"

label variable p17_1 "17.1 MANDÍBULA SUPERIOR"

label variable p17_2 "17.2 MANDÍBULA INFERIOR"

label variable p17_3 "17.3 ¿Tiene problemas para masticar?"

label variable p18_d_c "PESO (KILOS)"

label variable p18_p "PESO (LIBRAS)"

label variable p19_1 "19.1 OBSERVACIÓN"

label variable p19_2 "19.2 OBSERVACIÓN Número de repeticiones realizadas en 30 segundos NO INTENTÓ............66"

label variable p20 "20. ENTREVISTADOR: seleccione el número que mejor describa la movilidad del participante como resultado de todo lo que haya podido observar durante la entrevista"

label variable p21_1 "21.1 Normalmente usa usted lentes?"

label variable p21_2 "21.2 ¿Cómo es su visión (con lentes, si normalmente los usa)?"

label variable p22_1 "22.1 ¿Normalmente usa usted audífono o aparato auditivo?"

label variable p22_2 "22.2 ¿Cómo es su alcance de oído/audición (con aparato si normalmente lo usa)?"

label variable p_deviceid2 "Device ID:"

label variable p_deviceid2 "Device ID:"

*missing values 
   

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




*drop all uppercase variables

drop P*




*COUNTS NUMBER OF .i IN EACH OBSERVATION UNDER NEW VARIABLE CALLED p_countmissing
local i 1
gen p_countmissing = 0

quietly ds p_countmissing hhid pid p_time1 p_date fkey globalrecordid v1 p_deviceid2, not
capture quietly ds p_date_end p_time_end_1 p_time_end, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace p_countmissing = p_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace p_countmissing = p_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}




*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED p_last
local i 1
gen p_last = "AllAnswered"

quietly ds p_last p_countmissing hhid pid p_time1 p_date fkey globalrecordid v1 p_deviceid2, not
capture quietly ds p_date_end p_time_end_1 p_time_end
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
				replace p_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace p_last = "`v'" in `i'
				continue, break
			}
		}
	}
}



capture gen p_TotalTime = (Clock(p_time_end, "MDYhms") - Clock(p_time1, "MDYhms"))/1000/60



capture log close
log using logs/PhysMissingCodebook, text replace

codebook

log close

 save Phys.dta, replace
clear all
