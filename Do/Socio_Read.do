clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

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
    insheet using "../PR_in/Socio_Child.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Socio_Child.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Socio_Child.csv", comma names clear
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

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
    insheet using "../PR_in/Socio_Child.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Socio_Child.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Socio_Child.csv", comma names clear
}
}
capture drop v1

if `country' == 2 {
	set varabbrev off
	drop s_2_8a s_2_8b s_9_21 s_9_43 s_9_45 s_14_2_p s_14_2_d
	set varabbrev on
}

*converting from numeric to string



generate S_1_1_P = cond(s_1_1_p ==  0, "negro(a)", cond(s_1_1_p ==  1, "mulato(a) mezclado(a) o trigueño (blanco o negro)", cond(s_1_1_p ==  2, "blanco(a)", cond(s_1_1_p ==  3, "mestizo(a) (indio con blanco)", cond(s_1_1_p ==  4, "otra", cond(s_1_1_p ==  5, "no responde", cond(s_1_1_p ==  6, "no sabe", "")))))))

drop s_1_1_p

generate S_1_1_D = cond(s_1_1_d ==  0, "negro(a)", cond(s_1_1_d ==  1, "mulato(a)", cond(s_1_1_d ==  2, "blanco(a)", cond(s_1_1_d ==  3, "indio(a)", cond(s_1_1_d ==  4, "otra", cond(s_1_1_d ==  5, "no responde", cond(s_1_1_d ==  6, "no sabe", "")))))))

drop s_1_1_d

generate S_1_1_C = cond(s_1_1_c ==  0, "negro(a)", cond(s_1_1_c ==  1, "blanco(a)", cond(s_1_1_c ==  2, "mulato(a) / mestizo(a)", cond(s_1_1_c ==  3, "otra", cond(s_1_1_c ==  4, "no responde", cond(s_1_1_c ==  5, "no sabe", ""))))))

drop s_1_1_c

generate S_2_9 = cond(s_2_9 ==  0, "nunca se ha casado", cond(s_2_9 ==  1, "casado/union consensual", cond(s_2_9 ==  2, "viudo", cond(s_2_9 ==  3, "divorciado/separado", ""))))

drop s_2_9

generate S_2_11 = cond(s_2_11 ==  0, "agnóstico/ateo", cond(s_2_11 ==  1, "católico romano", cond(s_2_11 ==  2, "evangélico / pentecostal", cond(s_2_11 ==  3, "otro cristiano", cond(s_2_11 ==  4, "santería", cond(s_2_11 ==  5, "judío", cond(s_2_11 ==  6, "otro", cond(s_2_11 ==  7, "ninguna", cond(s_2_11 ==  8, "no responde", cond(s_2_11 ==  9, "no sabe", ""))))))))))

drop s_2_11

generate S_2_12 = cond(s_2_12 ==  0, "cada día", cond(s_2_12 ==  1, "más que una vez a la semana", cond(s_2_12 ==  2, "una vez a la semana", cond(s_2_12 ==  3, "dos o tres veces al mes", cond(s_2_12 ==  4, "uno o más veces al año", cond(s_2_12 ==  5, "nunca", cond(s_2_12 ==  6, "no responde", cond(s_2_12 ==  7, "no sabe", ""))))))))

drop s_2_12

generate S_2_13 = cond(s_2_13 ==  0, "no", cond(s_2_13 ==  1, "sí regularmente", cond(s_2_13 ==  2, "sí ocasionalmente", cond(s_2_13 ==  3, "no responde", cond(s_2_13 ==  4, "no sabe", "")))))

drop s_2_13

generate S_2_14_P = cond(s_2_14_p ==  0, "negro(a)", cond(s_2_14_p ==  1, "mulato(a) mezclado(a) o trigueño (blanco o negro)", cond(s_2_14_p ==  2, "blanco(a)", cond(s_2_14_p ==  3, "mestizo(a) (indio con blanco)", cond(s_2_14_p ==  4, "otra", cond(s_2_14_p ==  5, "no responde", cond(s_2_14_p ==  6, "no sabe", "")))))))

drop s_2_14_p

generate S_2_14_D = cond(s_2_14_d ==  0, "negro(a)", cond(s_2_14_d ==  1, "mulato(a)", cond(s_2_14_d ==  2, "blanco(a)", cond(s_2_14_d ==  3, "indio(a)", cond(s_2_14_d ==  4, "otra", cond(s_2_14_d ==  5, "no responde", cond(s_2_14_d ==  6, "no sabe", "")))))))

drop s_2_14_d

generate S_2_14_C = cond(s_2_14_c ==  0, "negro(a)", cond(s_2_14_c ==  1, "mulato(a)", cond(s_2_14_c ==  2, "blanco(a)", cond(s_2_14_c ==  3, "mestizo(a)", cond(s_2_14_c ==  4, "otra", cond(s_2_14_c ==  5, "no responde", cond(s_2_14_c ==  6, "no sabe", "")))))))

drop s_2_14_c

generate S_2_15_P = cond(s_2_15_p ==  0, "negro(a)", cond(s_2_15_p ==  1, "mulato(a) mezclado(a) o trigueño (blanco o negro)", cond(s_2_15_p ==  2, "blanco(a)", cond(s_2_15_p ==  3, "mestizo(a) (indio con blanco)", cond(s_2_15_p ==  4, "otra", cond(s_2_15_p ==  5, "no responde", cond(s_2_15_p ==  6, "no sabe", "")))))))

drop s_2_15_p

generate S_2_15_D = cond(s_2_15_d ==  0, "negro(a)", cond(s_2_15_d ==  1, "mulato(a)", cond(s_2_15_d ==  2, "blanco(a)", cond(s_2_15_d ==  3, "indio(a)", cond(s_2_15_d ==  4, "otra", cond(s_2_15_d ==  5, "no responde", cond(s_2_15_d ==  6, "no sabe", "")))))))

drop s_2_15_d

generate S_2_15_C = cond(s_2_15_c ==  0, "negro(a)", cond(s_2_15_c ==  1, "mulato(a)", cond(s_2_15_c ==  2, "blanco(a)", cond(s_2_15_c ==  3, "mestizo(a)", cond(s_2_15_c ==  4, "otra", cond(s_2_15_c ==  5, "no responde", cond(s_2_15_c ==  6, "no sabe", "")))))))

drop s_2_15_c

generate S_3_1_P = cond(s_3_1_p ==  0, "puerto rico", cond(s_3_1_p ==  1, "estados unidos", cond(s_3_1_p ==  2, "otro pais", "")))

drop s_3_1_p

generate S_3_1_D = cond(s_3_1_d ==  0, "república dominicana", cond(s_3_1_d ==  1, "estados unidos", cond(s_3_1_d ==  2, "haiti", cond(s_3_1_d ==  3, "otro pais", ""))))

drop s_3_1_d

generate S_3_1_C = cond(s_3_1_c ==  0, "cuba", cond(s_3_1_c ==  1, "otro pais", ""))

drop s_3_1_c

generate S_3_2 = cond(s_3_2 ==  0, "ciudad", cond(s_3_2 ==  1, "pueblo", cond(s_3_2 ==  2, "campo", "")))

drop s_3_2

generate S_3_4 = cond(s_3_4 ==  0, "ciudad", cond(s_3_4 ==  1, "pueblo", cond(s_3_4 ==  2, "campo", "")))

drop s_3_4

generate S_3_5 = cond(s_3_5 ==  0, "ciudad", cond(s_3_5 ==  1, "pueblo", cond(s_3_5 ==  2, "campo", "")))

drop s_3_5

generate S_3_6 = cond(s_3_6 ==  0, "no", cond(s_3_6 ==  1, "si", cond(s_3_6 ==  2, "no responde", cond(s_3_6 ==  3, "no sabe", ""))))

drop s_3_6

generate S_3_7 = cond(s_3_7 ==  0, "no", cond(s_3_7 ==  1, "si", cond(s_3_7 ==  2, "no responde", cond(s_3_7 ==  3, "no sabe", ""))))

drop s_3_7

generate S_3_8 = cond(s_3_8 ==  0, "mucho mejor", cond(s_3_8 ==  1, "mejor", cond(s_3_8 ==  2, "promedio", cond(s_3_8 ==  3, "peor", cond(s_3_8 ==  4, "mucho peor", cond(s_3_8 ==  5, "no responde", cond(s_3_8 ==  6, "no sabe", cond(s_3_8 ==  7, "no fue a la escuela", ""))))))))

drop s_3_8

generate S_3_9 = cond(s_3_9 ==  0, "mucho mejor", cond(s_3_9 ==  1, "mejor", cond(s_3_9 ==  2, "promedio", cond(s_3_9 ==  3, "peor", cond(s_3_9 ==  4, "mucho peor", cond(s_3_9 ==  5, "no responde", cond(s_3_9 ==  6, "no sabe", cond(s_3_9 ==  7, "no fue a la escuela", ""))))))))

drop s_3_9

generate S_3_12_1 = cond(s_3_12_1 ==  0, "no", cond(s_3_12_1 ==  1, "si", cond(s_3_12_1 ==  2, "no responde", cond(s_3_12_1 ==  3, "no sabe", ""))))

drop s_3_12_1

generate S_3_12_2 = cond(s_3_12_2 ==  0, "no", cond(s_3_12_2 ==  1, "si", cond(s_3_12_2 ==  2, "no responde", cond(s_3_12_2 ==  3, "no sabe", ""))))

drop s_3_12_2

generate S_3_12_3 = cond(s_3_12_3 ==  0, "no", cond(s_3_12_3 ==  1, "si", cond(s_3_12_3 ==  2, "no responde", cond(s_3_12_3 ==  3, "no sabe", ""))))

drop s_3_12_3

generate S_3_12_6 = cond(s_3_12_6 ==  0, "no", cond(s_3_12_6 ==  1, "si", cond(s_3_12_6 ==  2, "no responde", cond(s_3_12_6 ==  3, "no sabe", ""))))

drop s_3_12_6

generate S_3_12_8 = cond(s_3_12_8 ==  0, "no", cond(s_3_12_8 ==  1, "si", cond(s_3_12_8 ==  2, "no responde", cond(s_3_12_8 ==  3, "no sabe", ""))))

drop s_3_12_8

generate S_3_13 = cond(s_3_13 ==  0, "mejor", cond(s_3_13 ==  1, "mas o menos igual", cond(s_3_13 ==  2, "peor", cond(s_3_13 ==  3, "no responde", cond(s_3_13 ==  4, "no sabe", "")))))

drop s_3_13

generate S_3_17 = cond(s_3_17 ==  0, "no", cond(s_3_17 ==  1, "si", cond(s_3_17 ==  2, "no responde", cond(s_3_17 ==  3, "no sabe", ""))))

drop s_3_17

generate S_3_19_2 = cond(s_3_19_2 ==  0, "dias", cond(s_3_19_2 ==  1, "semanas", cond(s_3_19_2 ==  2, "meses", cond(s_3_19_2 ==  3, "años", ""))))

drop s_3_19_2

generate S_4_1 = cond(s_4_1 ==  0, "no ha completado ninguna educación", cond(s_4_1 ==  1, "pre-primaria (jardín de infantes guarderia maternal pre-escolar)", cond(s_4_1 ==  2, "primaria", cond(s_4_1 ==  3, "intermedio", cond(s_4_1 ==  4, "secundaria", cond(s_4_1 ==  5, "terciaria (ej grado asociado o carrera técnica)", cond(s_4_1 ==  6, "universitaria o superior", cond(s_4_1 ==  7, "no responde", cond(s_4_1 ==  8, "no sabe", "")))))))))

drop s_4_1

generate S_4_2 = cond(s_4_2 ==  0, "no", cond(s_4_2 ==  1, "si", cond(s_4_2 ==  2, "no responde", cond(s_4_2 ==  3, "no sabe", ""))))

drop s_4_2

generate S_4_8 = cond(s_4_8 ==  0, "no", cond(s_4_8 ==  1, "si", cond(s_4_8 ==  2, "no responde", cond(s_4_8 ==  3, "no sabe", ""))))

drop s_4_8

generate S_4_11 = cond(s_4_11 ==  0, "no ha completado ninguna educación", cond(s_4_11 ==  1, "pre-primaria (jardín de infantes guarderia maternal pre-escolar)", cond(s_4_11 ==  2, "primaria", cond(s_4_11 ==  3, "intermedio", cond(s_4_11 ==  4, "secundaria", cond(s_4_11 ==  5, "terciaria (ej grado asociado o carrera técnica)", cond(s_4_11 ==  6, "universitaria o superior", cond(s_4_11 ==  7, "no responde", cond(s_4_11 ==  8, "no sabe", "")))))))))

drop s_4_11

generate S_4_12 = cond(s_4_12 ==  0, "no", cond(s_4_12 ==  1, "si", cond(s_4_12 ==  2, "no responde", cond(s_4_12 ==  3, "no sabe", ""))))

drop s_4_12

generate S_4_18 = cond(s_4_18 ==  0, "no", cond(s_4_18 ==  1, "si", cond(s_4_18 ==  2, "no responde", cond(s_4_18 ==  3, "no sabe", ""))))

drop s_4_18

generate S_4_21 = cond(s_4_21 ==  0, "no", cond(s_4_21 ==  1, "si", cond(s_4_21 ==  2, "no responde", cond(s_4_21 ==  3, "no sabe", ""))))

drop s_4_21

generate S_4_22 = cond(s_4_22 ==  0, "esposo/a", cond(s_4_22 ==  1, "madre", cond(s_4_22 ==  2, "padre", cond(s_4_22 ==  3, "suegra", cond(s_4_22 ==  4, "suegro", cond(s_4_22 ==  5, "hija", cond(s_4_22 ==  6, "hijo", cond(s_4_22 ==  7, "nieta", cond(s_4_22 ==  8, "nieto", cond(s_4_22 ==  9, "amigo/a", cond(s_4_22 ==  10, "otra familiar", cond(s_4_22 ==  11, "otra persona", cond(s_4_22 ==  12, "no responde", cond(s_4_22 ==  13, "no sabe", ""))))))))))))))

drop s_4_22

generate S_4_23_2 = cond(s_4_23_2 ==  0, "dia", cond(s_4_23_2 ==  1, "semana", cond(s_4_23_2 ==  2, "mes", cond(s_4_23_2 ==  3, "año", ""))))

drop s_4_23_2

generate S_4_26 = cond(s_4_26 ==  0, "no", cond(s_4_26 ==  1, "si", cond(s_4_26 ==  2, "no tengo ningunos", cond(s_4_26 ==  3, "no responde", cond(s_4_26 ==  4, "no sabe", "")))))

drop s_4_26

generate S_4_27_2 = cond(s_4_27_2 ==  0, "día", cond(s_4_27_2 ==  1, "semana", cond(s_4_27_2 ==  2, "mes", cond(s_4_27_2 ==  3, "año", ""))))

drop s_4_27_2

generate S_4_27A = cond(s_4_27a ==  0, "menos de 2 horas por semana?", cond(s_4_27a ==  1, "de 2 a 4 horas por semana?", cond(s_4_27a ==  2, "más de 4 horas por semana?", cond(s_4_27a ==  3, "no responde", cond(s_4_27a ==  4, "no sabe", "")))))

drop s_4_27a

generate S_4_28 = cond(s_4_28 ==  0, "no", cond(s_4_28 ==  1, "si", cond(s_4_28 ==  2, "no responde", cond(s_4_28 ==  3, "no sabe", ""))))

drop s_4_28

generate S_4_29_2 = cond(s_4_29_2 ==  0, "día", cond(s_4_29_2 ==  1, "semana", cond(s_4_29_2 ==  2, "mes", cond(s_4_29_2 ==  3, "año", ""))))

drop s_4_29_2

generate S_4_29A = cond(s_4_29a ==  0, "menos de 2 horas por semana", cond(s_4_29a ==  1, "de 2 a 4 horas por semana", cond(s_4_29a ==  2, "más de 4 horas por semana", cond(s_4_29a ==  3, "no responde", cond(s_4_29a ==  4, "no sabe", "")))))

drop s_4_29a

generate S_5_1 = cond(s_5_1 ==  0, "no", cond(s_5_1 ==  1, "si", cond(s_5_1 ==  2, "no responde", cond(s_5_1 ==  3, "no sabe", ""))))

drop s_5_1

generate S_5_2 = cond(s_5_2 ==  0, "no", cond(s_5_2 ==  1, "si", cond(s_5_2 ==  2, "no responde", cond(s_5_2 ==  3, "no sabe", ""))))

drop s_5_2

generate S_6_1 = cond(s_6_1 ==  0, "no", cond(s_6_1 ==  1, "si", cond(s_6_1 ==  2, "nació en estados unidos", cond(s_6_1 ==  3, "no responde", cond(s_6_1 ==  4, "no sabe", "")))))

drop s_6_1

generate S_6_3 = cond(s_6_3 ==  0, "no", cond(s_6_3 ==  1, "si", cond(s_6_3 ==  2, "nació en otro pais", cond(s_6_3 ==  3, "no responde", cond(s_6_3 ==  4, "no sabe", "")))))

drop s_6_3

generate S_6_5_P = cond(s_6_5_p ==  0, "puerto rico", cond(s_6_5_p ==  1, "un país en américa latina", cond(s_6_5_p ==  2, "canadá", cond(s_6_5_p ==  3, "españa", cond(s_6_5_p ==  4, "otro país europeo", cond(s_6_5_p ==  5, "otro", ""))))))

drop s_6_5_p

generate S_6_5_D = cond(s_6_5_d ==  0, "haití", cond(s_6_5_d ==  1, "un país en américa latina", cond(s_6_5_d ==  2, "canadá", cond(s_6_5_d ==  3, "españa", cond(s_6_5_d ==  4, "otro país europeo", cond(s_6_5_d ==  5, "otro", ""))))))

drop s_6_5_d

generate S_6_5_C = cond(s_6_5_c ==  0, "cuba", cond(s_6_5_c ==  1, "un país en américa latina", cond(s_6_5_c ==  2, "canadá", cond(s_6_5_c ==  3, "españa", cond(s_6_5_c ==  4, "otro país europeo", cond(s_6_5_c ==  5, "otro", ""))))))

drop s_6_5_c

generate S_7_0 = cond(s_7_0 ==  0, "muy satisfecho", cond(s_7_0 ==  1, "algo satisfecho", cond(s_7_0 ==  2, "algo insatisfecho", cond(s_7_0 ==  3, "muy insatisfecho", cond(s_7_0 ==  4, "no responde", cond(s_7_0 ==  5, "no sabe", ""))))))

drop s_7_0

generate S_7_1 = cond(s_7_1 ==  0, "no", cond(s_7_1 ==  1, "si", cond(s_7_1 ==  2, "no responde", cond(s_7_1 ==  3, "no sabe", ""))))

drop s_7_1

generate S_7_2A = cond(s_7_2a ==  0, "nunca", cond(s_7_2a ==  1, "menos de una vez por mes", cond(s_7_2a ==  2, "una vez por mes", cond(s_7_2a ==  3, "varias veces al mes", cond(s_7_2a ==  4, "una vez por semana", cond(s_7_2a ==  5, "varias veces a la semana", cond(s_7_2a ==  6, "cada día", cond(s_7_2a ==  7, "varias veces al día", cond(s_7_2a ==  8, "no responde", cond(s_7_2a ==  9, "no sabe", ""))))))))))

drop s_7_2a

generate S_7_2B = cond(s_7_2b ==  0, "nunca", cond(s_7_2b ==  1, "menos de una vez por mes", cond(s_7_2b ==  2, "una vez por mes", cond(s_7_2b ==  3, "varias veces al mes", cond(s_7_2b ==  4, "una vez por semana", cond(s_7_2b ==  5, "varias veces a la semana", cond(s_7_2b ==  6, "cada día", cond(s_7_2b ==  7, "varias veces al día", cond(s_7_2b ==  8, "no responde", cond(s_7_2b ==  9, "no sabe", ""))))))))))

drop s_7_2b

generate S_7_2C = cond(s_7_2c ==  0, "nunca", cond(s_7_2c ==  1, "menos de una vez por mes", cond(s_7_2c ==  2, "una vez por mes", cond(s_7_2c ==  3, "varias veces al mes", cond(s_7_2c ==  4, "una vez por semana", cond(s_7_2c ==  5, "varias veces a la semana", cond(s_7_2c ==  6, "cada día", cond(s_7_2c ==  7, "varias veces al día", cond(s_7_2c ==  8, "no responde", cond(s_7_2c ==  9, "no sabe", ""))))))))))

drop s_7_2c

generate S_7_4A = cond(s_7_4a ==  0, "nunca", cond(s_7_4a ==  1, "menos de una vez por mes", cond(s_7_4a ==  2, "una vez por mes", cond(s_7_4a ==  3, "varias veces al mes", cond(s_7_4a ==  4, "una vez por semana", cond(s_7_4a ==  5, "varias veces a la semana", cond(s_7_4a ==  6, "cada día", cond(s_7_4a ==  7, "varias veces al día", cond(s_7_4a ==  8, "no responde", cond(s_7_4a ==  9, "no sabe", ""))))))))))

drop s_7_4a

generate S_7_4B = cond(s_7_4b ==  0, "nunca", cond(s_7_4b ==  1, "menos de una vez por mes", cond(s_7_4b ==  2, "una vez por mes", cond(s_7_4b ==  3, "varias veces al mes", cond(s_7_4b ==  4, "una vez por semana", cond(s_7_4b ==  5, "varias veces a la semana", cond(s_7_4b ==  6, "cada día", cond(s_7_4b ==  7, "varias veces al día", cond(s_7_4b ==  8, "no responde", cond(s_7_4b ==  9, "no sabe", ""))))))))))

drop s_7_4b

generate S_7_4C = cond(s_7_4c ==  0, "nunca", cond(s_7_4c ==  1, "menos de una vez por mes", cond(s_7_4c ==  2, "una vez por mes", cond(s_7_4c ==  3, "varias veces al mes", cond(s_7_4c ==  4, "una vez por semana", cond(s_7_4c ==  5, "varias veces a la semana", cond(s_7_4c ==  6, "cada día", cond(s_7_4c ==  7, "varias veces al día", cond(s_7_4c ==  8, "no responde", cond(s_7_4c ==  9, "no sabe", ""))))))))))

drop s_7_4c

generate S_7_5A = cond(s_7_5a ==  0, "casi nunca", cond(s_7_5a ==  1, "a veces", cond(s_7_5a ==  2, "frecuentemente", cond(s_7_5a ==  3, "no responde", cond(s_7_5a ==  4, "no sabe", "")))))

drop s_7_5a

generate S_7_5B = cond(s_7_5b ==  0, "casi nunca", cond(s_7_5b ==  1, "a veces", cond(s_7_5b ==  2, "frecuentemente", cond(s_7_5b ==  3, "no responde", cond(s_7_5b ==  4, "no sabe", "")))))

drop s_7_5b

generate S_7_5C = cond(s_7_5c ==  0, "casi nunca", cond(s_7_5c ==  1, "a veces", cond(s_7_5c ==  2, "frecuentemente", cond(s_7_5c ==  3, "no responde", cond(s_7_5c ==  4, "no sabe", "")))))

drop s_7_5c

generate S_7_6A = cond(s_7_6a ==  0, "casi cada dia", cond(s_7_6a ==  1, "al menos una ves a la semana", cond(s_7_6a ==  2, "algunas veces al mes", cond(s_7_6a ==  3, "algunas veces al año", cond(s_7_6a ==  4, "menos que una vez al año", cond(s_7_6a ==  5, "nunca", cond(s_7_6a ==  6, "no responde", cond(s_7_6a ==  7, "no sabe", ""))))))))

drop s_7_6a

generate S_7_6B = cond(s_7_6b ==  0, "siempre o casi siempre", cond(s_7_6b ==  1, "la major parte del tiempo", cond(s_7_6b ==  2, "a veces", cond(s_7_6b ==  3, "casi nunca", cond(s_7_6b ==  4, "nunca", cond(s_7_6b ==  5, "no responde", cond(s_7_6b ==  6, "no sabe", "")))))))

drop s_7_6b

generate S_8_1 = cond(s_8_1 ==  0, "no", cond(s_8_1 ==  1, "si", cond(s_8_1 ==  2, "no responde", cond(s_8_1 ==  3, "no sabe", ""))))

drop s_8_1

if `country' == 0 {
*data from PR is coming in different for this variable
*replace s_8_3 = "7" if s_8_3 == "7 - Otros servicios"
*replace s_8_3 = "1" if s_8_3 == "1 - Profesional, ejecutivo "
*replace s_8_3 = "9" if s_8_3 == "9 - Trabajador no especializado"

*destring s_8_3, replace

*replace s_8_5d = "10" if s_8_5d == "10 - Trabajos informales"
*destring s_8_5d, replace

*replace s_8_16 = "1" if s_8_16 == "1 - Profesional, ejecutivo "
*replace s_8_16 = "9" if s_8_16 == "9 - Trabajador no especializado"
*destring s_8_16, replace
}

generate S_8_3 = cond(s_8_3 ==  0, "profesional ejecutivo", cond(s_8_3 ==  1, "oficinista", cond(s_8_3 ==  2, "vendedor minorista", cond(s_8_3 ==  3, "agricultor independiente", cond(s_8_3 ==  4, "trabajador agrícola", cond(s_8_3 ==  5, "trabajador domestico", cond(s_8_3 ==  6, "otros servicios", cond(s_8_3 ==  7, "trabajador especializado", cond(s_8_3 ==  8, "trabajador no especializado", cond(s_8_3 ==  9, "trabajos informales", cond(s_8_3 ==  10, "otros", cond(s_8_3 ==  11, "no responde", cond(s_8_3 ==  12, "no sabe", "")))))))))))))

drop s_8_3

generate S_8_4 = cond(s_8_4 ==  0, "director o jefe", cond(s_8_4 ==  1, "trabajador por su cuenta", cond(s_8_4 ==  2, "trabajador cooperativista", cond(s_8_4 ==  3, "trabajador a sueldo fijo salario o jornal", cond(s_8_4 ==  4, "trabajador a destajo comisión", cond(s_8_4 ==  5, "trabajador familiar sin pago", cond(s_8_4 ==  6, "trabajador no familiar sin pago", cond(s_8_4 ==  7, "otro", cond(s_8_4 ==  8, "no responde", cond(s_8_4 ==  9, "no sabe", ""))))))))))

drop s_8_4

generate S_8_5A = cond(s_8_5a ==  0, "trabaja", cond(s_8_5a ==  1, "busca trabajo", cond(s_8_5a ==  2, "no trabaja", cond(s_8_5a ==  3, "no responde", ""))))

drop s_8_5a

generate S_8_5D = cond(s_8_5d ==  0, "profesional ejecutivo", cond(s_8_5d ==  1, "oficinista", cond(s_8_5d ==  2, "vendedor minorista", cond(s_8_5d ==  3, "agricultor independiente", cond(s_8_5d ==  4, "trabajador agrícola", cond(s_8_5d ==  5, "trabajador domestico", cond(s_8_5d ==  6, "otros servicios", cond(s_8_5d ==  7, "trabajador especializado", cond(s_8_5d ==  8, "trabajador no especializado", cond(s_8_5d ==  9, "trabajos informales", cond(s_8_5d ==  10, "otros", cond(s_8_5d ==  11, "no responde", cond(s_8_5d ==  12, "no sabe", "")))))))))))))

drop s_8_5d

generate S_8_7 = cond(s_8_7 ==  0, "no", cond(s_8_7 ==  1, "si", cond(s_8_7 ==  2, "no responde", cond(s_8_7 ==  3, "no sabe", ""))))

drop s_8_7

generate S_8_10 = cond(s_8_10 ==  0, "siempre o casi siempre", cond(s_8_10 ==  1, "la mayor parte del tiempo", cond(s_8_10 ==  2, "a veces", cond(s_8_10 ==  3, "casi nunca", cond(s_8_10 ==  4, "nunca", cond(s_8_10 ==  5, "no responde", cond(s_8_10 ==  6, "no sabe", "")))))))

drop s_8_10

generate S_8_11 = cond(s_8_11 ==  0, "siempre o casi siempre", cond(s_8_11 ==  1, "la mayor parte del tiempo", cond(s_8_11 ==  2, "a veces", cond(s_8_11 ==  3, "casi nunca", cond(s_8_11 ==  4, "nunca", cond(s_8_11 ==  5, "no responde", cond(s_8_11 ==  6, "no sabe", "")))))))

drop s_8_11

generate S_8_12 = cond(s_8_12 ==  0, "muy en desacuerdo", cond(s_8_12 ==  1, "desacuerdo", cond(s_8_12 ==  2, "acuerdo", cond(s_8_12 ==  3, "muy en acuerdo", cond(s_8_12 ==  4, "no se aplica", cond(s_8_12 ==  5, "no responde", cond(s_8_12 ==  6, "no sabe", "")))))))

drop s_8_12

generate S_8_13 = cond(s_8_13 ==  0, "muy en desacuerdo", cond(s_8_13 ==  1, "desacuerdo", cond(s_8_13 ==  2, "acuerdo", cond(s_8_13 ==  3, "muy en acuerdo", cond(s_8_13 ==  4, "no se aplica", cond(s_8_13 ==  5, "no responde", cond(s_8_13 ==  6, "no sabe", "")))))))

drop s_8_13

generate S_8_141 = cond(s_8_141 ==  0, "muy en desacuerdo", cond(s_8_141 ==  1, "desacuerdo", cond(s_8_141 ==  2, "acuerdo", cond(s_8_141 ==  3, "muy en acuerdo", cond(s_8_141 ==  4, "no se aplica", cond(s_8_141 ==  5, "no responde", cond(s_8_141 ==  6, "no sabe", "")))))))

drop s_8_141

generate S_8_15 = cond(s_8_15 ==  0, "muy en desacuerdo", cond(s_8_15 ==  1, "desacuerdo", cond(s_8_15 ==  2, "acuerdo", cond(s_8_15 ==  3, "muy en acuerdo", cond(s_8_15 ==  4, "no se aplica", cond(s_8_15 ==  5, "no responde", cond(s_8_15 ==  6, "no sabe", "")))))))

drop s_8_15

generate S_8_16 = cond(s_8_16 ==  0, "profesional ejecutivo", cond(s_8_16 ==  1, "oficinista", cond(s_8_16 ==  2, "vendedor minorista", cond(s_8_16 ==  3, "agricultor independiente", cond(s_8_16 ==  4, "trabajador agrícola", cond(s_8_16 ==  5, "trabajador domestico", cond(s_8_16 ==  6, "otros servicios", cond(s_8_16 ==  7, "trabajador especializado", cond(s_8_16 ==  8, "trabajador no especializado", cond(s_8_16 ==  9, "trabajos informales", cond(s_8_16 ==  10, "otros", cond(s_8_16 ==  11, "no responde", cond(s_8_16 ==  12, "no sabe", "")))))))))))))

drop s_8_16

generate S_9_1 = cond(s_9_1 ==  0, "excelente", cond(s_9_1 ==  1, "muy buena", cond(s_9_1 ==  2, "buena", cond(s_9_1 ==  3, "regular", cond(s_9_1 ==  4, "mala", cond(s_9_1 ==  5, "no responde", cond(s_9_1 ==  6, "no sabe", "")))))))

drop s_9_1

generate S_9_3 = cond(s_9_3 ==  0, "no tiene ese problema de salud", cond(s_9_3 ==  1, "tiene ese problema pero no interfiere", cond(s_9_3 ==  2, "tiene ese problema e interfiere un poco", cond(s_9_3 ==  3, "tiene ese problema e interfiere mucho", cond(s_9_3 ==  4, "no responde", cond(s_9_3 ==  5, "no sabe", ""))))))

drop s_9_3

generate S_9_4 = cond(s_9_4 ==  0, "no tiene ese problema de salud", cond(s_9_4 ==  1, "tiene ese problema pero no interfiere", cond(s_9_4 ==  2, "tiene ese problema e interfiere un poco", cond(s_9_4 ==  3, "tiene ese problema e interfiere mucho", cond(s_9_4 ==  4, "no responde", cond(s_9_4 ==  5, "no sabe", ""))))))

drop s_9_4

generate S_9_5 = cond(s_9_5 ==  0, "no", cond(s_9_5 ==  1, "si", cond(s_9_5 ==  2, "no responde", cond(s_9_5 ==  3, "no sabe", ""))))

drop s_9_5

generate S_9_7 = cond(s_9_7 ==  0, "no", cond(s_9_7 ==  1, "si", cond(s_9_7 ==  2, "no responde", cond(s_9_7 ==  3, "no sabe", ""))))

drop s_9_7

generate S_9_8 = cond(s_9_8 ==  0, "no", cond(s_9_8 ==  1, "si", cond(s_9_8 ==  2, "no responde", cond(s_9_8 ==  3, "no sabe", ""))))

drop s_9_8

generate S_9_11 = cond(s_9_11 ==  0, "no", cond(s_9_11 ==  1, "si", cond(s_9_11 ==  2, "no responde", cond(s_9_11 ==  3, "no sabe", ""))))

drop s_9_11

generate S_9_13 = cond(s_9_13 ==  0, "menos que 6 meses", cond(s_9_13 ==  1, "de 6 a 11 meses", cond(s_9_13 ==  2, "de 1 a 2 años", cond(s_9_13 ==  3, "mas que 2 años", cond(s_9_13 ==  4, "nunca", cond(s_9_13 ==  5, "no responde", cond(s_9_13 ==  6, "no sabe", "")))))))

drop s_9_13

generate S_9_14 = cond(s_9_14 ==  0, "no", cond(s_9_14 ==  1, "si", cond(s_9_14 ==  2, "no responde", cond(s_9_14 ==  3, "no sabe", ""))))

drop s_9_14

generate S_9_15 = cond(s_9_15 ==  0, "hace 0-5 años", cond(s_9_15 ==  1, "hace 5-10 años", cond(s_9_15 ==  2, "hace 10 o más años", cond(s_9_15 ==  3, "no responde", cond(s_9_15 ==  4, "no sabe", "")))))

drop s_9_15

generate S_9_16 = cond(s_9_16 ==  0, "infarto", cond(s_9_16 ==  1, "angina", cond(s_9_16 ==  2, "paro cardíaco", cond(s_9_16 ==  3, "enfermedad valvular", cond(s_9_16 ==  4, "otro", cond(s_9_16 ==  5, "no responde", cond(s_9_16 ==  6, "no sabe", "")))))))

drop s_9_16

generate S_9_17 = cond(s_9_17 ==  0, "no", cond(s_9_17 ==  1, "si", cond(s_9_17 ==  2, "no responde", cond(s_9_17 ==  3, "no sabe", ""))))

drop s_9_17

generate S_9_18 = cond(s_9_18 ==  0, "nadie", cond(s_9_18 ==  1, "médico general", cond(s_9_18 ==  2, "especialista", cond(s_9_18 ==  3, "no responde", cond(s_9_18 ==  4, "no sabe", "")))))

drop s_9_18

generate S_9_19 = cond(s_9_19 ==  0, "no", cond(s_9_19 ==  1, "si", cond(s_9_19 ==  2, "no responde", cond(s_9_19 ==  3, "no sabe", ""))))

drop s_9_19

generate S_9_20 = cond(s_9_20 ==  0, "no", cond(s_9_20 ==  1, "si", cond(s_9_20 ==  2, "no responde", cond(s_9_20 ==  3, "no sabe", ""))))

drop s_9_20

generate S_9_23 = cond(s_9_23 ==  0, "no", cond(s_9_23 ==  1, "si", cond(s_9_23 ==  2, "no responde", cond(s_9_23 ==  3, "no sabe", ""))))

drop s_9_23

generate S_9_24 = cond(s_9_24 ==  0, "no", cond(s_9_24 ==  1, "si", cond(s_9_24 ==  2, "no responde", cond(s_9_24 ==  3, "no sabe", ""))))

drop s_9_24

generate S_9_26 = cond(s_9_26 ==  0, "sólo dieta", cond(s_9_26 ==  1, "hipoglicemiantes orales", cond(s_9_26 ==  2, "insulina", cond(s_9_26 ==  3, "ningún tratamiento", cond(s_9_26 ==  4, "no responde", cond(s_9_26 ==  5, "no sabe", ""))))))

drop s_9_26

generate S_9_28 = cond(s_9_28 ==  0, "nunca", cond(s_9_28 ==  1, "menos de una vez por mes", cond(s_9_28 ==  2, "una vez por mes", cond(s_9_28 ==  3, "varias veces al mes", cond(s_9_28 ==  4, "una vez por semana", cond(s_9_28 ==  5, "varias veces a la semana", cond(s_9_28 ==  6, "cada día", cond(s_9_28 ==  7, "varias veces al día", cond(s_9_28 ==  8, "no responde", cond(s_9_28 ==  9, "no sabe", ""))))))))))

drop s_9_28

generate S_9_29 = cond(s_9_29 ==  0, "una vez cada tres meses", cond(s_9_29 ==  1, "una vez cada seis meses", cond(s_9_29 ==  2, "una vez al año", cond(s_9_29 ==  3, "menos de una vez por año", cond(s_9_29 ==  4, "no tiene", cond(s_9_29 ==  5, "no responde", cond(s_9_29 ==  6, "no sabe", "")))))))

drop s_9_29

generate S_9_30 = cond(s_9_30 ==  0, "no", cond(s_9_30 ==  1, "si", cond(s_9_30 ==  2, "no responde", cond(s_9_30 ==  3, "no sabe", ""))))

drop s_9_30

generate S_9_32 = cond(s_9_32 ==  0, "no", cond(s_9_32 ==  1, "si", cond(s_9_32 ==  2, "no responde", cond(s_9_32 ==  3, "no sabe", ""))))

drop s_9_32

generate S_9_33 = cond(s_9_33 ==  0, "no", cond(s_9_33 ==  1, "si", cond(s_9_33 ==  2, "no responde", cond(s_9_33 ==  3, "no sabe", ""))))

drop s_9_33

generate S_9_35 = cond(s_9_35 ==  0, "menos que 6 meses", cond(s_9_35 ==  1, "de 6 a 11 meses", cond(s_9_35 ==  2, "de 1 a 2 años", cond(s_9_35 ==  3, "mas que 2 años", cond(s_9_35 ==  4, "nunca", cond(s_9_35 ==  5, "no responde", cond(s_9_35 ==  6, "no sabe", "")))))))

drop s_9_35

generate S_9_37 = cond(s_9_37 ==  0, "no", cond(s_9_37 ==  1, "si", cond(s_9_37 ==  2, "no responde", cond(s_9_37 ==  3, "no sabe", ""))))

drop s_9_37

generate S_9_39 = cond(s_9_39 ==  0, "no", cond(s_9_39 ==  1, "si", cond(s_9_39 ==  2, "no responde", cond(s_9_39 ==  3, "no sabe", ""))))

drop s_9_39

generate S_9_40 = cond(s_9_40 ==  0, "si unos pocos (hasta 4)", cond(s_9_40 ==  1, "si bastante (más de 4 y menos de la mitad)", cond(s_9_40 ==  2, "si la mayoría (la mitad o más)", cond(s_9_40 ==  3, "no", cond(s_9_40 ==  4, "no responde", cond(s_9_40 ==  5, "no sabe", ""))))))

drop s_9_40

generate S_9_41 = cond(s_9_41 ==  0, "no", cond(s_9_41 ==  1, "si raramente", cond(s_9_41 ==  2, "si frecuentemente", cond(s_9_41 ==  3, "si muy frecuentemente", cond(s_9_41 ==  4, "no responde", cond(s_9_41 ==  5, "no sabe", ""))))))

drop s_9_41

generate S_9_42 = cond(s_9_42 ==  0, "no", cond(s_9_42 ==  1, "si", cond(s_9_42 ==  2, "no responde", cond(s_9_42 ==  3, "no sabe", ""))))

drop s_9_42

generate S_9_44 = cond(s_9_44 ==  0, "no", cond(s_9_44 ==  1, "si", cond(s_9_44 ==  2, "no responde", cond(s_9_44 ==  3, "no sabe", ""))))

drop s_9_44

generate S_9_46 = cond(s_9_46 ==  0, "no", cond(s_9_46 ==  1, "si", cond(s_9_46 ==  2, "no responde", cond(s_9_46 ==  3, "no sabe", ""))))

drop s_9_46

generate S_9_47 = cond(s_9_47 ==  0, "no", cond(s_9_47 ==  1, "si", cond(s_9_47 ==  2, "no responde", cond(s_9_47 ==  3, "no sabe", ""))))

drop s_9_47

generate S_9_49 = cond(s_9_49 ==  0, "no", cond(s_9_49 ==  1, "si", cond(s_9_49 ==  2, "no responde", cond(s_9_49 ==  3, "no sabe", ""))))

drop s_9_49

generate S_9_50 = cond(s_9_50 ==  0, "no", cond(s_9_50 ==  1, "si", cond(s_9_50 ==  2, "no responde", cond(s_9_50 ==  3, "no sabe", ""))))

drop s_9_50

generate S_9_51 = cond(s_9_51 ==  0, "< 1 año", cond(s_9_51 ==  1, "1 a menos de 3 años", cond(s_9_51 ==  2, "3 a menos de 5 años", cond(s_9_51 ==  3, "5 años o mas", cond(s_9_51 ==  4, "nunca", cond(s_9_51 ==  5, "no responde", cond(s_9_51 ==  6, "no sabe", "")))))))

drop s_9_51

generate S_9_52 = cond(s_9_52 ==  0, "< 1 año", cond(s_9_52 ==  1, "1 a menos de 3 años", cond(s_9_52 ==  2, "3 a menos de 5 años", cond(s_9_52 ==  3, "5 años o mas", cond(s_9_52 ==  4, "nunca", cond(s_9_52 ==  5, "no responde", cond(s_9_52 ==  6, "no sabe", "")))))))

drop s_9_52

generate S_9_53 = cond(s_9_53 ==  0, "< 1 año", cond(s_9_53 ==  1, "1 a menos de 3 años", cond(s_9_53 ==  2, "3 a menos de 5 años", cond(s_9_53 ==  3, "5 años o mas", cond(s_9_53 ==  4, "nunca", cond(s_9_53 ==  5, "no responde", cond(s_9_53 ==  6, "no sabe", "")))))))

drop s_9_53

generate S_9_54 = cond(s_9_54 ==  0, "< 1 año", cond(s_9_54 ==  1, "1 a menos de 3 años", cond(s_9_54 ==  2, "3 a menos de 5 años", cond(s_9_54 ==  3, "5 años o mas", cond(s_9_54 ==  4, "nunca", cond(s_9_54 ==  5, "no responde", cond(s_9_54 ==  6, "no sabe", "")))))))

drop s_9_54

generate S_9_55 = cond(s_9_55 ==  0, "< 1 año", cond(s_9_55 ==  1, "1 a menos de 3 años", cond(s_9_55 ==  2, "3 a menos de 5 años", cond(s_9_55 ==  3, "5 años o mas", cond(s_9_55 ==  4, "nunca", cond(s_9_55 ==  5, "no responde", cond(s_9_55 ==  6, "no sabe", "")))))))

drop s_9_55

generate S_9_56 = cond(s_9_56 ==  0, "< 1 año", cond(s_9_56 ==  1, "1 a menos de 3 años", cond(s_9_56 ==  2, "3 a menos de 5 años", cond(s_9_56 ==  3, "5 años o mas", cond(s_9_56 ==  4, "nunca", cond(s_9_56 ==  5, "no responde", cond(s_9_56 ==  6, "no sabe", "")))))))

drop s_9_56

generate S_9_58 = cond(s_9_58 ==  0, "no", cond(s_9_58 ==  1, "si", cond(s_9_58 ==  2, "no responde", cond(s_9_58 ==  3, "no sabe", ""))))

drop s_9_58

generate S_9_61A = cond(s_9_61a ==  0, "menos de 45 años", cond(s_9_61a ==  1, "más o menos 50 años", cond(s_9_61a ==  2, "más de 55 años", cond(s_9_61a ==  3, "no responde", cond(s_9_61a ==  4, "no sabe", "")))))

drop s_9_61a

generate S_9_62 = cond(s_9_62 ==  0, "no", cond(s_9_62 ==  1, "si", cond(s_9_62 ==  2, "no responde", cond(s_9_62 ==  3, "no sabe", ""))))

drop s_9_62

generate S_9_63 = cond(s_9_63 ==  0, "no", cond(s_9_63 ==  1, "si", cond(s_9_63 ==  2, "no responde", cond(s_9_63 ==  3, "no sabe", ""))))

drop s_9_63

generate S_9_64_1 = cond(s_9_64_1 ==  0, "no", cond(s_9_64_1 ==  1, "si", cond(s_9_64_1 ==  2, "no responde", cond(s_9_64_1 ==  3, "no sabe", ""))))

drop s_9_64_1

generate S_9_64_2 = cond(s_9_64_2 ==  0, "no", cond(s_9_64_2 ==  1, "si", cond(s_9_64_2 ==  2, "no responde", cond(s_9_64_2 ==  3, "no sabe", ""))))

drop s_9_64_2

generate S_9_64_3 = cond(s_9_64_3 ==  0, "no", cond(s_9_64_3 ==  1, "si", cond(s_9_64_3 ==  2, "no responde", cond(s_9_64_3 ==  3, "no sabe", ""))))

drop s_9_64_3

generate S_9_64_4 = cond(s_9_64_4 ==  0, "no", cond(s_9_64_4 ==  1, "si", cond(s_9_64_4 ==  2, "no responde", cond(s_9_64_4 ==  3, "no sabe", ""))))

drop s_9_64_4

generate S_9_66 = cond(s_9_66 ==  0, "no", cond(s_9_66 ==  1, "si", cond(s_9_66 ==  2, "no responde", cond(s_9_66 ==  3, "no sabe", ""))))

drop s_9_66

generate S_10_1A = cond(s_10_1a ==  0, "no cierto", cond(s_10_1a ==  1, "si cierto", cond(s_10_1a ==  2, "no responde", cond(s_10_1a ==  3, "no sabe", ""))))

drop s_10_1a

generate S_10_1B = cond(s_10_1b ==  0, "no cierto", cond(s_10_1b ==  1, "si cierto", cond(s_10_1b ==  2, "no responde", cond(s_10_1b ==  3, "no sabe", ""))))

drop s_10_1b

generate S_10_1C = cond(s_10_1c ==  0, "no cierto", cond(s_10_1c ==  1, "si cierto", cond(s_10_1c ==  2, "no responde", cond(s_10_1c ==  3, "no sabe", ""))))

drop s_10_1c

generate S_10_1D = cond(s_10_1d ==  0, "no cierto", cond(s_10_1d ==  1, "si cierto", cond(s_10_1d ==  2, "no responde", cond(s_10_1d ==  3, "no sabe", ""))))

drop s_10_1d

generate S_10_1E = cond(s_10_1e ==  0, "no cierto", cond(s_10_1e ==  1, "si cierto", cond(s_10_1e ==  2, "no responde", cond(s_10_1e ==  3, "no sabe", ""))))

drop s_10_1e

generate S_10_1F = cond(s_10_1f ==  0, "no cierto", cond(s_10_1f ==  1, "si cierto", cond(s_10_1f ==  2, "no responde", cond(s_10_1f ==  3, "no sabe", ""))))

drop s_10_1f

generate S_10_1G = cond(s_10_1g ==  0, "no cierto", cond(s_10_1g ==  1, "si cierto", cond(s_10_1g ==  2, "no responde", cond(s_10_1g ==  3, "no sabe", ""))))

drop s_10_1g

generate S_10_1H = cond(s_10_1h ==  0, "no cierto", cond(s_10_1h ==  1, "si cierto", cond(s_10_1h ==  2, "no responde", cond(s_10_1h ==  3, "no sabe", ""))))

drop s_10_1h

generate S_10_2 = cond(s_10_2 ==  0, "la mayoría de las noches", cond(s_10_2 ==  1, "algunas noches", cond(s_10_2 ==  2, "casi nunca o nunca", cond(s_10_2 ==  3, "no responde", cond(s_10_2 ==  4, "no sabe", "")))))

drop s_10_2

generate S_10_3 = cond(s_10_3 ==  0, "la mayoría de las noches", cond(s_10_3 ==  1, "algunas noches", cond(s_10_3 ==  2, "casi nunca o nunca", cond(s_10_3 ==  3, "no responde", cond(s_10_3 ==  4, "no sabe", "")))))

drop s_10_3

generate S_10_4 = cond(s_10_4 ==  0, "la mayoría de las veces", cond(s_10_4 ==  1, "algunas veces", cond(s_10_4 ==  2, "casi nunca o nunca", cond(s_10_4 ==  3, "no responde", cond(s_10_4 ==  4, "no sabe", "")))))

drop s_10_4

generate S_10_5 = cond(s_10_5 ==  0, "la mayoría de las veces", cond(s_10_5 ==  1, "algunas veces", cond(s_10_5 ==  2, "casi nunca o nunca", cond(s_10_5 ==  3, "no responde", cond(s_10_5 ==  4, "no sabe", "")))))

drop s_10_5

generate S_10_6_1 = cond(s_10_6_1 ==  0, "no", cond(s_10_6_1 ==  1, "si", cond(s_10_6_1 ==  2, "no responde", cond(s_10_6_1 ==  3, "no sabe", ""))))

drop s_10_6_1

generate S_10_6_1A = cond(s_10_6_1a ==  0, "más de un año", cond(s_10_6_1a ==  1, "menos de un año", cond(s_10_6_1a ==  2, "no responde", cond(s_10_6_1a ==  3, "no sabe", ""))))

drop s_10_6_1a

generate S_10_6_2 = cond(s_10_6_2 ==  0, "no", cond(s_10_6_2 ==  1, "si", cond(s_10_6_2 ==  2, "no responde", cond(s_10_6_2 ==  3, "no sabe", ""))))

drop s_10_6_2

generate S_10_6_2A = cond(s_10_6_2a ==  0, "más de un año", cond(s_10_6_2a ==  1, "menos de un año", cond(s_10_6_2a ==  2, "no responde", cond(s_10_6_2a ==  3, "no sabe", ""))))

drop s_10_6_2a

generate S_10_6_3 = cond(s_10_6_3 ==  0, "no", cond(s_10_6_3 ==  1, "si", cond(s_10_6_3 ==  2, "no responde", cond(s_10_6_3 ==  3, "no sabe", cond(s_10_6_3 ==  4, "no se aplica (no trabaja)", "")))))

drop s_10_6_3

generate S_10_6_3A = cond(s_10_6_3a ==  0, "más de un año", cond(s_10_6_3a ==  1, "menos de un año", cond(s_10_6_3a ==  2, "no responde", cond(s_10_6_3a ==  3, "no sabe", ""))))

drop s_10_6_3a

generate S_10_6_4 = cond(s_10_6_4 ==  0, "no", cond(s_10_6_4 ==  1, "si", cond(s_10_6_4 ==  2, "no responde", cond(s_10_6_4 ==  3, "no sabe", ""))))

drop s_10_6_4

generate S_10_6_4A = cond(s_10_6_4a ==  0, "más de un año", cond(s_10_6_4a ==  1, "menos de un año", cond(s_10_6_4a ==  2, "no responde", cond(s_10_6_4a ==  3, "no sabe", ""))))

drop s_10_6_4a

generate S_10_7_1 = cond(s_10_7_1 ==  0, "muy en desacuerdo", cond(s_10_7_1 ==  1, "desacuerdo", cond(s_10_7_1 ==  2, "acuerdo", cond(s_10_7_1 ==  3, "muy en acuerdo", cond(s_10_7_1 ==  4, "no se aplica", cond(s_10_7_1 ==  5, "no responde", cond(s_10_7_1 ==  6, "no sabe", "")))))))

drop s_10_7_1

generate S_10_7_2 = cond(s_10_7_2 ==  0, "muy en desacuerdo", cond(s_10_7_2 ==  1, "desacuerdo", cond(s_10_7_2 ==  2, "acuerdo", cond(s_10_7_2 ==  3, "muy en acuerdo", cond(s_10_7_2 ==  4, "no se aplica", cond(s_10_7_2 ==  5, "no responde", cond(s_10_7_2 ==  6, "no sabe", "")))))))

drop s_10_7_2

generate S_11_1 = cond(s_11_1 ==  0, "nunca", cond(s_11_1 ==  1, "2-3 veces el mes pasado", cond(s_11_1 ==  2, "aproximadamente una vez a la semana", cond(s_11_1 ==  3, "2-3 días a la semana", cond(s_11_1 ==  4, "todos los días", cond(s_11_1 ==  5, "no responde", cond(s_11_1 ==  6, "no sabe", "")))))))

drop s_11_1

generate S_11_2 = cond(s_11_2 ==  0, "dolor leve", cond(s_11_2 ==  1, "dolor moderado", cond(s_11_2 ==  2, "dolor severo", cond(s_11_2 ==  3, "dolor muy severo", cond(s_11_2 ==  4, "dolor insoportable", cond(s_11_2 ==  5, "no responde", cond(s_11_2 ==  6, "no sabe", "")))))))

drop s_11_2

generate S_11_3 = cond(s_11_3 ==  0, "en lo absoluto", cond(s_11_3 ==  1, "no mucho", cond(s_11_3 ==  2, "moderadamente", cond(s_11_3 ==  3, "mucho", cond(s_11_3 ==  4, "no responde", cond(s_11_3 ==  5, "no sabe", ""))))))

drop s_11_3

generate S_12_1A = cond(s_12_1a ==  0, "no", cond(s_12_1a ==  1, "si", cond(s_12_1a ==  2, "no puede", cond(s_12_1a ==  3, "no lo hace", cond(s_12_1a ==  4, "no responde", cond(s_12_1a ==  5, "no sabe", ""))))))

drop s_12_1a

generate S_12_1B = cond(s_12_1b ==  0, "no", cond(s_12_1b ==  1, "si", cond(s_12_1b ==  2, "no responde", cond(s_12_1b ==  3, "no sabe", ""))))

drop s_12_1b

generate S_12_1C = cond(s_12_1c ==  0, "no", cond(s_12_1c ==  1, "si", cond(s_12_1c ==  2, "no responde", cond(s_12_1c ==  3, "no sabe", ""))))

drop s_12_1c

generate S_12_2A = cond(s_12_2a ==  0, "no", cond(s_12_2a ==  1, "si", cond(s_12_2a ==  2, "no puede", cond(s_12_2a ==  3, "no lo hace", cond(s_12_2a ==  4, "no responde", cond(s_12_2a ==  5, "no sabe", ""))))))

drop s_12_2a

generate S_12_2C = cond(s_12_2c ==  0, "no", cond(s_12_2c ==  1, "si", cond(s_12_2c ==  2, "no responde", cond(s_12_2c ==  3, "no sabe", ""))))

drop s_12_2c

generate S_12_3A = cond(s_12_3a ==  0, "no", cond(s_12_3a ==  1, "si", cond(s_12_3a ==  2, "no puede", cond(s_12_3a ==  3, "no lo hace", cond(s_12_3a ==  4, "no responde", cond(s_12_3a ==  5, "no sabe", ""))))))

drop s_12_3a

generate S_12_3C = cond(s_12_3c ==  0, "no", cond(s_12_3c ==  1, "si", cond(s_12_3c ==  2, "no responde", cond(s_12_3c ==  3, "no sabe", ""))))

drop s_12_3c

generate S_12_4A = cond(s_12_4a ==  0, "no", cond(s_12_4a ==  1, "si", cond(s_12_4a ==  2, "no puede", cond(s_12_4a ==  3, "no lo hace", cond(s_12_4a ==  4, "no responde", cond(s_12_4a ==  5, "no sabe", ""))))))

drop s_12_4a

generate S_12_4B = cond(s_12_4b ==  0, "no", cond(s_12_4b ==  1, "si", cond(s_12_4b ==  2, "no responde", cond(s_12_4b ==  3, "no sabe", ""))))

drop s_12_4b

generate S_12_4C = cond(s_12_4c ==  0, "no", cond(s_12_4c ==  1, "si", cond(s_12_4c ==  2, "no responde", cond(s_12_4c ==  3, "no sabe", ""))))

drop s_12_4c

generate S_12_5A = cond(s_12_5a ==  0, "no", cond(s_12_5a ==  1, "si", cond(s_12_5a ==  2, "no puede", cond(s_12_5a ==  3, "no lo hace", cond(s_12_5a ==  4, "no responde", cond(s_12_5a ==  5, "no sabe", ""))))))

drop s_12_5a

generate S_12_5C = cond(s_12_5c ==  0, "no", cond(s_12_5c ==  1, "si", cond(s_12_5c ==  2, "no responde", cond(s_12_5c ==  3, "no sabe", ""))))

drop s_12_5c

generate S_12_6A = cond(s_12_6a ==  0, "no", cond(s_12_6a ==  1, "si", cond(s_12_6a ==  2, "no puede", cond(s_12_6a ==  3, "no lo hace", cond(s_12_6a ==  4, "no responde", cond(s_12_6a ==  5, "no sabe", ""))))))

drop s_12_6a

generate S_12_6C = cond(s_12_6c ==  0, "no", cond(s_12_6c ==  1, "si", cond(s_12_6c ==  2, "no responde", cond(s_12_6c ==  3, "no sabe", ""))))

drop s_12_6c

generate S_12_7 = cond(s_12_7 ==  0, "no", cond(s_12_7 ==  1, "si", cond(s_12_7 ==  2, "no puede", cond(s_12_7 ==  3, "no lo hace", cond(s_12_7 ==  4, "no responde", cond(s_12_7 ==  5, "no sabe", ""))))))

drop s_12_7

generate S_12_8 = cond(s_12_8 ==  0, "no", cond(s_12_8 ==  1, "si", cond(s_12_8 ==  2, "no puede", cond(s_12_8 ==  3, "no lo hace", cond(s_12_8 ==  4, "no responde", cond(s_12_8 ==  5, "no sabe", ""))))))

drop s_12_8

generate S_12_9 = cond(s_12_9 ==  0, "no", cond(s_12_9 ==  1, "si", cond(s_12_9 ==  2, "no puede", cond(s_12_9 ==  3, "no lo hace", cond(s_12_9 ==  4, "no responde", cond(s_12_9 ==  5, "no sabe", ""))))))

drop s_12_9

generate S_12_10 = cond(s_12_10 ==  0, "no", cond(s_12_10 ==  1, "si", cond(s_12_10 ==  2, "no puede", cond(s_12_10 ==  3, "no lo hace", cond(s_12_10 ==  4, "no responde", cond(s_12_10 ==  5, "no sabe", ""))))))

drop s_12_10

generate S_12_11 = cond(s_12_11 ==  0, "no", cond(s_12_11 ==  1, "si", cond(s_12_11 ==  2, "no responde", cond(s_12_11 ==  3, "no sabe", ""))))

drop s_12_11

generate S_12_13 = cond(s_12_13 ==  0, "no", cond(s_12_13 ==  1, "si", cond(s_12_13 ==  2, "no responde", cond(s_12_13 ==  3, "no sabe", ""))))

drop s_12_13

generate S_12_14 = cond(s_12_14 ==  0, "no", cond(s_12_14 ==  1, "si", cond(s_12_14 ==  2, "no responde", cond(s_12_14 ==  3, "no sabe", ""))))

drop s_12_14

generate S_12_15 = cond(s_12_15 ==  0, "no", cond(s_12_15 ==  1, "si", cond(s_12_15 ==  2, "no responde", cond(s_12_15 ==  3, "no sabe", ""))))

drop s_12_15

generate S_12_16 = cond(s_12_16 ==  0, "los levantó totalmente", cond(s_12_16 ==  1, "los levantó parcialmente", cond(s_12_16 ==  2, "no puede levantarlos", cond(s_12_16 ==  3, "no aceptó realizar la prueba", ""))))

drop s_12_16

generate S_13_1_P_C = cond(s_13_1_p_c ==  0, "no", cond(s_13_1_p_c ==  1, "si", cond(s_13_1_p_c ==  2, "no responde", cond(s_13_1_p_c ==  3, "no sabe", ""))))

drop s_13_1_p_c

generate S_13_1_D = cond(s_13_1_d ==  0, "no", cond(s_13_1_d ==  1, "si", cond(s_13_1_d ==  2, "no responde", cond(s_13_1_d ==  3, "no sabe", ""))))

drop s_13_1_d

generate S_13_3_P_C = cond(s_13_3_p_c ==  0, "no", cond(s_13_3_p_c ==  1, "si", cond(s_13_3_p_c ==  2, "no responde", cond(s_13_3_p_c ==  3, "no sabe", ""))))

drop s_13_3_p_c

generate S_13_3_D = cond(s_13_3_d ==  0, "no", cond(s_13_3_d ==  1, "si", cond(s_13_3_d ==  2, "no responde", cond(s_13_3_d ==  3, "no sabe", ""))))

drop s_13_3_d

generate S_13_5 = cond(s_13_5 ==  0, "a diario", cond(s_13_5 ==  1, "no todos los dias", cond(s_13_5 ==  2, "no responde", cond(s_13_5 ==  3, "no sabe", ""))))

drop s_13_5

generate S_13_8 = cond(s_13_8 ==  0, "no", cond(s_13_8 ==  1, "si", cond(s_13_8 ==  2, "no responde", cond(s_13_8 ==  3, "no sabe", ""))))

drop s_13_8

generate S_13_9 = cond(s_13_9 ==  0, "no", cond(s_13_9 ==  1, "si", cond(s_13_9 ==  2, "no responde", cond(s_13_9 ==  3, "no sabe", ""))))

drop s_13_9

generate S_13_12 = cond(s_13_12 ==  0, "no", cond(s_13_12 ==  1, "si", cond(s_13_12 ==  2, "no responde", cond(s_13_12 ==  3, "no sabe", ""))))

drop s_13_12

generate S_13_13 = cond(s_13_13 ==  0, "nunca", cond(s_13_13 ==  1, "algunos días", cond(s_13_13 ==  2, "la mayoría de los días", cond(s_13_13 ==  3, "una vez al dia", cond(s_13_13 ==  4, "más que una vez al dia", cond(s_13_13 ==  5, "no responde", cond(s_13_13 ==  6, "no sabe", "")))))))

drop s_13_13

generate S_13_14 = cond(s_13_14 ==  0, "nunca", cond(s_13_14 ==  1, "algunos días", cond(s_13_14 ==  2, "la mayoría de los días", cond(s_13_14 ==  3, "una vez al dia", cond(s_13_14 ==  4, "más que una vez al dia", cond(s_13_14 ==  5, "no responde", cond(s_13_14 ==  6, "no sabe", "")))))))

drop s_13_14

generate S_13_15 = cond(s_13_15 ==  0, "nunca", cond(s_13_15 ==  1, "algunos días", cond(s_13_15 ==  2, "la mayoría de los días", cond(s_13_15 ==  3, "una vez al dia", cond(s_13_15 ==  4, "más que una vez al dia", cond(s_13_15 ==  5, "no responde", cond(s_13_15 ==  6, "no sabe", "")))))))

drop s_13_15

generate S_13_16 = cond(s_13_16 ==  0, "nunca", cond(s_13_16 ==  1, "algunos días", cond(s_13_16 ==  2, "la mayoría de los días", cond(s_13_16 ==  3, "una vez al dia", cond(s_13_16 ==  4, "más que una vez al dia", cond(s_13_16 ==  5, "no responde", cond(s_13_16 ==  6, "no sabe", "")))))))

drop s_13_16

generate S_13_17 = cond(s_13_17 ==  0, "nunca", cond(s_13_17 ==  1, "algunos días", cond(s_13_17 ==  2, "la mayoría de los días", cond(s_13_17 ==  3, "una vez al dia", cond(s_13_17 ==  4, "más que una vez al dia", cond(s_13_17 ==  5, "no responde", cond(s_13_17 ==  6, "no sabe", "")))))))

drop s_13_17

generate S_13_18 = cond(s_13_18 ==  0, "físicamente muy activo", cond(s_13_18 ==  1, "físicamente bastante activo", cond(s_13_18 ==  2, "físicamente no muy activo", cond(s_13_18 ==  3, "físicamente nada activo", cond(s_13_18 ==  4, "no responde", cond(s_13_18 ==  5, "no sabe", ""))))))

drop s_13_18

generate S_13_19 = cond(s_13_19 ==  0, "no", cond(s_13_19 ==  1, "si", cond(s_13_19 ==  2, "no responde", cond(s_13_19 ==  3, "no sabe", ""))))

drop s_13_19

generate S_13_22 = cond(s_13_22 ==  0, "no", cond(s_13_22 ==  1, "si", cond(s_13_22 ==  2, "no responde", cond(s_13_22 ==  3, "no sabe", ""))))

drop s_13_22

generate S_13_30_D_C = cond(s_13_30_d_c ==  0, "no", cond(s_13_30_d_c ==  1, "si", cond(s_13_30_d_c ==  2, "no responde", cond(s_13_30_d_c ==  3, "no sabe", ""))))

drop s_13_30_d_c

generate S_13_30_P = cond(s_13_30_p ==  0, "no", cond(s_13_30_p ==  1, "si", cond(s_13_30_p ==  2, "no responde", cond(s_13_30_p ==  3, "no sabe", ""))))

drop s_13_30_p

generate S_14_1_P_D = cond(s_14_1_p_d ==  0, "no", cond(s_14_1_p_d ==  1, "si", cond(s_14_1_p_d ==  2, "no responde", cond(s_14_1_p_d ==  3, "no sabe", ""))))

drop s_14_1_p_d

generate S_14_3 = cond(s_14_3 ==  0, "no", cond(s_14_3 ==  1, "si", cond(s_14_3 ==  2, "no responde", cond(s_14_3 ==  3, "no sabe", ""))))

drop s_14_3

generate S_14_17 = cond(s_14_17 ==  0, "no", cond(s_14_17 ==  1, "si", cond(s_14_17 ==  2, "no responde", cond(s_14_17 ==  3, "no sabe", ""))))

drop s_14_17

generate S_14_18_1 = cond(s_14_18_1 ==  0, "no", cond(s_14_18_1 ==  1, "si", cond(s_14_18_1 ==  2, "no responde", cond(s_14_18_1 ==  3, "no sabe", ""))))

drop s_14_18_1

generate S_14_18_2 = cond(s_14_18_2 ==  0, "no", cond(s_14_18_2 ==  1, "si", cond(s_14_18_2 ==  2, "no responde", cond(s_14_18_2 ==  3, "no sabe", ""))))

drop s_14_18_2

generate S_14_18_3 = cond(s_14_18_3 ==  0, "no", cond(s_14_18_3 ==  1, "si", cond(s_14_18_3 ==  2, "no responde", cond(s_14_18_3 ==  3, "no sabe", ""))))

drop s_14_18_3

generate S_14_18_4 = cond(s_14_18_4 ==  0, "no", cond(s_14_18_4 ==  1, "si", cond(s_14_18_4 ==  2, "no responde", cond(s_14_18_4 ==  3, "no sabe", ""))))

drop s_14_18_4

generate S_14_18_5 = cond(s_14_18_5 ==  0, "no", cond(s_14_18_5 ==  1, "si", cond(s_14_18_5 ==  2, "no responde", cond(s_14_18_5 ==  3, "no sabe", ""))))

drop s_14_18_5

generate S_14_18_6 = cond(s_14_18_6 ==  0, "no", cond(s_14_18_6 ==  1, "si", cond(s_14_18_6 ==  2, "no responde", cond(s_14_18_6 ==  3, "no sabe", ""))))

drop s_14_18_6

generate S_14_23 = cond(s_14_23 ==  0, "no", cond(s_14_23 ==  1, "si", cond(s_14_23 ==  2, "no responde", cond(s_14_23 ==  3, "no sabe", ""))))

drop s_14_23

generate S_14_30B1_P = cond(s_14_30b1_p ==  0, "no", cond(s_14_30b1_p ==  1, "si", cond(s_14_30b1_p ==  2, "no responde", cond(s_14_30b1_p ==  3, "no sabe", ""))))

drop s_14_30b1_p

generate S_14_30B1_D = cond(s_14_30b1_d ==  0, "no", cond(s_14_30b1_d ==  1, "si", cond(s_14_30b1_d ==  2, "no responde", cond(s_14_30b1_d ==  3, "no sabe", ""))))

drop s_14_30b1_d

generate S_14_30B2_P = cond(s_14_30b2_p ==  0, "no", cond(s_14_30b2_p ==  1, "si", cond(s_14_30b2_p ==  2, "no responde", cond(s_14_30b2_p ==  3, "no sabe", ""))))

drop s_14_30b2_p

generate S_14_30B2_D = cond(s_14_30b2_d ==  0, "no", cond(s_14_30b2_d ==  1, "si", cond(s_14_30b2_d ==  2, "no responde", cond(s_14_30b2_d ==  3, "no sabe", ""))))

drop s_14_30b2_d

generate S_14_30B3_P = cond(s_14_30b3_p ==  0, "no", cond(s_14_30b3_p ==  1, "si", cond(s_14_30b3_p ==  2, "no responde", cond(s_14_30b3_p ==  3, "no sabe", ""))))

drop s_14_30b3_p

generate S_14_30B3_D = cond(s_14_30b3_d ==  0, "no", cond(s_14_30b3_d ==  1, "si", cond(s_14_30b3_d ==  2, "no responde", cond(s_14_30b3_d ==  3, "no sabe", ""))))

drop s_14_30b3_d

generate S_14_30B1_C = cond(s_14_30b1_c ==  0, "no", cond(s_14_30b1_c ==  1, "si", cond(s_14_30b1_c ==  2, "no responde", cond(s_14_30b1_c ==  3, "no sabe", ""))))

drop s_14_30b1_c

generate S_14_30B2_C = cond(s_14_30b2_c ==  0, "no", cond(s_14_30b2_c ==  1, "si", cond(s_14_30b2_c ==  2, "no responde", cond(s_14_30b2_c ==  3, "no sabe", ""))))

drop s_14_30b2_c

generate S_14_30B3_C = cond(s_14_30b3_c ==  0, "no", cond(s_14_30b3_c ==  1, "si", cond(s_14_30b3_c ==  2, "no responde", cond(s_14_30b3_c ==  3, "no sabe", ""))))

drop s_14_30b3_c

generate S_14_31 = cond(s_14_31 ==  0, "no", cond(s_14_31 ==  1, "si", cond(s_14_31 ==  2, "no responde", cond(s_14_31 ==  3, "no sabe", ""))))

drop s_14_31

generate S_14_32 = cond(s_14_32 ==  0, "1", cond(s_14_32 ==  1, "2", cond(s_14_32 ==  2, "3", cond(s_14_32 ==  3, "4 o más", cond(s_14_32 ==  4, "no responde", cond(s_14_32 ==  5, "no sabe", ""))))))

drop s_14_32

generate S_14_33 = cond(s_14_33 ==  0, "no", cond(s_14_33 ==  1, "si", cond(s_14_33 ==  2, "no responde", cond(s_14_33 ==  3, "no sabe", ""))))

drop s_14_33

generate S_15_1 = cond(s_15_1 ==  0, "el participante solamente", cond(s_15_1 ==  1, "participante y proxy", cond(s_15_1 ==  2, "proxy solo", "")))

drop s_15_1

generate S_15_2 = cond(s_15_2 ==  0, "esposo (a)", cond(s_15_2 ==  1, "hijo/hija", cond(s_15_2 ==  2, "nuero/nuera", cond(s_15_2 ==  3, "hermano (a)", cond(s_15_2 ==  4, "otro parentesco", cond(s_15_2 ==  5, "amigo", cond(s_15_2 ==  6, "vecino(a)", cond(s_15_2 ==  7, "otro", ""))))))))

drop s_15_2

generate S_15_3 = cond(s_15_3 ==  0, "razonable (el entrevistado respondió de manera apropiada a más o menos a todas las preguntas)", cond(s_15_3 ==  1, "algunas dudas", cond(s_15_3 ==  2, "moderadas dudas", cond(s_15_3 ==  3, "graves dudas (el entrevistador consideró que el entrevistado fue incapaz o no cooperó en responder de manera apropiada a la mayoría de las preguntas)", cond(s_15_3 ==  4, "sin valor alguno (las preguntas fueron respondidas al azar)", "")))))

drop s_15_3

*now we encode all strings to numeric


if `country' == 0 {
    export delimited using "../PR_in/Sociodemographic_Child_String.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Sociodemographic_Child_String.csv", replace
}
else if `country' == 2 {
    export delimited using "../CUBA_in/Sociodemographic_Child_String.csv", replace
}

if `country' == 0 {
    insheet using "../PR_in/Sociodemographic_Child_String.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Sociodemographic_Child_String.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Sociodemographic_Child_String.csv", comma names clear
}
   
   ds, has(type string)

  local string_vars = r(varlist)

foreach var of local string_vars {

    gen `var'_trimmed = ustrlower(ustrtrim(`var'))

    replace `var' = `var'_trimmed

    drop `var'_trimmed

}

if `country' == 2 {
    replace s_country = 2
}
else if `country' == 1 {
    replace s_country = 1
}
else if `country' == 0 {
    replace s_country = 0
}

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values s_country country_label

gen s_country_str = string(s_country, "%12.0f")

replace s_clustid = s_clustid*10 if s_clustid < 1
replace s_clustid = s_conglid2 if s_clustid == .
gen s_clustid_str = string(s_clustid, "%12.0f")
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)

replace s_houseid = s_houseid*10 if s_houseid < 1
gen s_houseid_str = string(s_houseid, "%03.0f")
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)

replace s_particid = s_particid*10 if s_particid < 1
gen s_particid_str = string(s_particid, "%12.0f")
replace s_particid_str = cond(strlen(s_particid_str) == 1, "0" + s_particid_str, s_particid_str)

gen pid = s_country_str + s_clustid_str + s_houseid_str + s_particid_str
gen hhid = s_country_str + s_clustid_str + s_houseid_str
drop s_clustid_str s_houseid_str s_particid_str

*from second entry

gen s_clustid2_str = string(s_conglid2, "%12.0f")
replace s_clustid2_str = cond(strlen(s_clustid2_str) == 1, "0" + s_clustid2_str, s_clustid2_str)

gen s_houseid2_str = string(s_houseid2, "%03.0f")
replace s_houseid2_str = cond(strlen(s_houseid2_str) == 1, "00" + s_houseid2_str, s_houseid2_str)
replace s_houseid2_str = cond(strlen(s_houseid2_str) == 2, "0" + s_houseid2_str, s_houseid2_str)

gen s_particid2_str = string(s_particid2, "%12.0f")
replace s_particid2_str = cond(strlen(s_particid2_str) == 1, "0" + s_particid2_str, s_particid2_str)

gen pid2 = s_country_str + s_clustid2_str + s_houseid2_str + s_particid2_str
drop s_country_str s_clustid2_str s_houseid2_str s_particid2_str

*these were originally completely numeric

rename s_sex (S_SEX)

capture confirm numeric variable S_SEX
if !_rc{
     tostring S_SEX, replace
}

label define S_SEX .a"." 0 "0 - hombre" 1 "1 - mujer"

encode S_SEX, gen(s_0) label(S_SEX)

drop S_SEX

rename s_2_9a S_2_9a

capture confirm numeric variable S_2_9a
if !_rc{
     tostring S_2_9a, replace
}

label define S_2_9a .a"." 0 "0 - no ha completado ninguna educación" 1 "1 - educación pre-primaria (jardín de infantes, guarderia, maternal, pre-escolar)" 2 "2 - primaria" 3 "3 - intermedio" 4 "4 - secundaria" 5 "5 - educación terciaria (ej grado asociado o carrera técnica)" 6 "6 - educación universitaria o superior" 8 "8 - no responde" 9 "9 - no sabe"

encode S_2_9a, gen (s_2_9a) label(S_2_9a)

drop S_2_9a

rename s_3_11 (S_3_11)

capture confirm numeric variable S_3_11
if !_rc{
     tostring S_3_11, replace
}

label define S_3_11 .a"." 1 "1 - profesional, ejecutivo" 2 "2 - oficinista" 3 "3 - vendedor, minorista" 4 "4 - agricultor independiente" 5 "5 - trabajador agrícola" 6 "6 - trabajador domestico" 7 "7 - otros servicios" 8 "8 - trabajador especializado" 9 "9 - trabajador no especializado" 10 "10 - trabajos informales" 11 "11 - otros" 12 "12 - no trabajó" 13 "13 - no tenía padre o tutor" 88 "88 - no responde" 99 "99 - no sabe"

encode S_3_11, gen (s_3_11) label(S_3_11)

drop S_3_11

rename s_6_7 (S_6_7)

capture confirm numeric variable S_6_7
if !_rc{
     tostring S_6_7, replace
}

*review this
label define S_6_7 .a"." 1 "01 - usted estaba enfermo?" 2 "02 - usted extrañaba a su familia?" 3 "03 - le fue difícil permanecer en el extranjero?" 4 "04 - era muy caro quedarse en el extranjero?" 5 "05 - no ganaba suficiente allá?" 6 "06 - tuvo problemas relacionados con migración?" 7 "07 - tuvo problemas familiares aqui?" 8 "08 - otra" 88 "88 - no responde" 99 "99 - no sabe"

encode S_6_7, gen (s_6_7) label(S_6_7)

drop S_6_7

rename s_1_1_p (S_1_1_P)

capture confirm numeric variable S_1_1_P
if !_rc{
     tostring S_1_1_P, replace
}

label define S_1_1_P .a"." 1 "negro(a)" 2 "mulato(a) mezclado(a) o trigueño (blanco o negro)" 3 "blanco(a)" 4 "mestizo(a) (indio con blanco)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_1_1_P, gen(s_1_1_p) label (S_1_1_P)

rename s_1_1_d (S_1_1_D)

capture confirm numeric variable S_1_1_D
if !_rc{
     tostring S_1_1_D, replace
}

label define S_1_1_D .a"." 1 "negro(a)" 2 "mulato(a)" 3 "blanco(a)" 4 "indio(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_1_1_D, gen(s_1_1_d) label (S_1_1_D)

rename s_1_1_c (S_1_1_C)

capture confirm numeric variable S_1_1_C
if !_rc{
     tostring S_1_1_C, replace
}

label define S_1_1_C .a"." 1 "negro(a)" 3 "blanco(a)" 6 "mulato(a) / mestizo(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_1_1_C, gen(s_1_1_c) label (S_1_1_C)

rename s_2_9 (S_2_9)

capture confirm numeric variable S_2_9
if !_rc{
     tostring S_2_9, replace
}

label define S_2_9 .a"." 1 "nunca se ha casado" 2 "casado/union consensual" 3 "viudo" 4 "divorciado/separado" 

encode S_2_9, gen(s_2_9) label (S_2_9)

rename s_2_11 (S_2_11)

capture confirm numeric variable S_2_11
if !_rc{
     tostring S_2_11, replace
}

label define S_2_11 .a"." 0 "agnóstico/ateo" 1 "católico romano" 2 "evangélico / pentecostal" 3 "otro cristiano" 4 "santería" 5 "judío" 6 "otro" 7 "ninguna" 8 "no responde"9 "no sabe"

encode S_2_11, gen(s_2_11) label (S_2_11)

rename s_2_12 (S_2_12)

capture confirm numeric variable S_2_12
if !_rc{
     tostring S_2_12, replace
}

label define S_2_12 .a"." 0 "cada día" 1 "más que una vez a la semana" 2 "una vez a la semana" 3 "dos o tres veces al mes" 4 "uno o más veces al año" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_2_12, gen(s_2_12) label (S_2_12)

rename s_2_13 (S_2_13)

capture confirm numeric variable S_2_13
if !_rc{
     tostring S_2_13, replace
}

label define S_2_13 .a"." 0 "no" 1 "sí regularmente" 2 "sí ocasionalmente" 8 "no responde"9 "no sabe"

encode S_2_13, gen(s_2_13) label (S_2_13)

rename s_2_14_p (S_2_14_P)

capture confirm numeric variable S_2_14_P
if !_rc{
     tostring S_2_14_P, replace
}

label define S_2_14_P .a"." 1 "negro(a)" 2 "mulato(a) mezclado(a) o trigueño (blanco o negro)" 3 "blanco(a)" 4 "mestizo(a) (indio con blanco)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_14_P, gen(s_2_14_p) label (S_2_14_P)

rename s_2_14_d (S_2_14_D)

capture confirm numeric variable S_2_14_D
if !_rc{
     tostring S_2_14_D, replace
}

label define S_2_14_D .a"." 1 "negro(a)" 2 "mulato(a)" 3 "blanco(a)" 4 "indio(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_14_D, gen(s_2_14_d) label (S_2_14_D)

rename s_2_14_c (S_2_14_C)

capture confirm numeric variable S_2_14_C
if !_rc{
     tostring S_2_14_C, replace
}

label define S_2_14_C .a"." 1 "negro(a)" 2 "mulato(a)" 3 "blanco(a)" 4 "mestizo(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_14_C, gen(s_2_14_c) label (S_2_14_C)

rename s_2_15_p (S_2_15_P)

capture confirm numeric variable S_2_15_P
if !_rc{
     tostring S_2_15_P, replace
}

label define S_2_15_P .a"." 1 "negro(a)" 2 "mulato(a) mezclado(a) o trigueño (blanco o negro)" 3 "blanco(a)" 4 "mestizo(a) (indio con blanco)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_15_P, gen(s_2_15_p) label (S_2_15_P)

rename s_2_15_d (S_2_15_D)

capture confirm numeric variable S_2_15_D
if !_rc{
     tostring S_2_15_D, replace
}

label define S_2_15_D .a"." 1 "negro(a)" 2 "mulato(a)" 3 "blanco(a)" 4 "indio(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_15_D, gen(s_2_15_d) label (S_2_15_D)

rename s_2_15_c (S_2_15_C)

capture confirm numeric variable S_2_15_C
if !_rc{
     tostring S_2_15_C, replace
}

label define S_2_15_C .a"." 1 "negro(a)" 2 "mulato(a)" 3 "blanco(a)" 4 "mestizo(a)" 5 "otra" 8 "no responde"9 "no sabe"

encode S_2_15_C, gen(s_2_15_c) label (S_2_15_C)

rename s_3_1_p (S_3_1_P)

capture confirm numeric variable S_3_1_P
if !_rc{
     tostring S_3_1_P, replace
}

label define S_3_1_P .a"." 1 "puerto rico" 2 "estados unidos" 4 "otro pais" 

encode S_3_1_P, gen(s_3_1_p) label (S_3_1_P)

rename s_3_1_d (S_3_1_D)

capture confirm numeric variable S_3_1_D
if !_rc{
     tostring S_3_1_D, replace
}

label define S_3_1_D .a"." 1 "república dominicana" 2 "estados unidos" 3 "haiti" 4 "otro pais" 

encode S_3_1_D, gen(s_3_1_d) label (S_3_1_D)

rename s_3_1_c (S_3_1_C)

capture confirm numeric variable S_3_1_C
if !_rc{
     tostring S_3_1_C, replace
}

label define S_3_1_C .a"." 1 "cuba" 4 "otro pais" 

encode S_3_1_C, gen(s_3_1_c) label (S_3_1_C)

rename s_3_2 (S_3_2)

capture confirm numeric variable S_3_2
if !_rc{
     tostring S_3_2, replace
}

label define S_3_2 .a"." 0 "ciudad" 1 "pueblo" 2 "campo" 

encode S_3_2, gen(s_3_2) label (S_3_2)

rename s_3_4 (S_3_4)

capture confirm numeric variable S_3_4
if !_rc{
     tostring S_3_4, replace
}

label define S_3_4 .a"." 0 "ciudad" 1 "pueblo" 2 "campo" 8 "no responde" 9 "no sabe"

encode S_3_4, gen(s_3_4) label (S_3_4)

rename s_3_5 (S_3_5)

capture confirm numeric variable S_3_5
if !_rc{
     tostring S_3_5, replace
}

label define S_3_5 .a"." 0 "ciudad" 1 "pueblo" 2 "campo" 8 "no responde" 9 "no sabe"

encode S_3_5, gen(s_3_5) label (S_3_5)

rename s_3_6 (S_3_6)

capture confirm numeric variable S_3_6
if !_rc{
     tostring S_3_6, replace
}

label define S_3_6 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_6, gen(s_3_6) label (S_3_6)

rename s_3_7 (S_3_7)

capture confirm numeric variable S_3_7
if !_rc{
     tostring S_3_7, replace
}

label define S_3_7 .a"." 0 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_7, gen(s_3_7) label (S_3_7)

rename s_3_8 (S_3_8)

capture confirm numeric variable S_3_8
if !_rc{
     tostring S_3_8, replace
}

label define S_3_8 .a"." 1 "mucho mejor" 2 "mejor" 3 "promedio" 4 "peor" 5 "mucho peor" 8 "no responde"9 "no sabe" 10 "no fue a la escuela" 

encode S_3_8, gen(s_3_8) label (S_3_8)

rename s_3_9 (S_3_9)

capture confirm numeric variable S_3_9
if !_rc{
     tostring S_3_9, replace
}

label define S_3_9 .a"." 1 "mucho mejor" 2 "mejor" 3 "promedio" 4 "peor" 5 "mucho peor" 8 "no responde"9 "no sabe" 10 "no fue a la escuela" 

encode S_3_9, gen(s_3_9) label (S_3_9)

rename s_3_12_1 (S_3_12_1)

capture confirm numeric variable S_3_12_1
if !_rc{
     tostring S_3_12_1, replace
}

label define S_3_12_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_12_1, gen(s_3_12_1) label (S_3_12_1)

rename s_3_12_2 (S_3_12_2)

capture confirm numeric variable S_3_12_2
if !_rc{
     tostring S_3_12_2, replace
}

label define S_3_12_2 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_12_2, gen(s_3_12_2) label (S_3_12_2)

rename s_3_12_3 (S_3_12_3)

capture confirm numeric variable S_3_12_3
if !_rc{
     tostring S_3_12_3, replace
}

label define S_3_12_3 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_12_3, gen(s_3_12_3) label (S_3_12_3)

rename s_3_12_6 (S_3_12_6)

capture confirm numeric variable S_3_12_6
if !_rc{
     tostring S_3_12_6, replace
}

label define S_3_12_6 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_12_6, gen(s_3_12_6) label (S_3_12_6)

rename s_3_12_8 (S_3_12_8)

capture confirm numeric variable S_3_12_8
if !_rc{
     tostring S_3_12_8, replace
}

label define S_3_12_8 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_3_12_8, gen(s_3_12_8) label (S_3_12_8)

rename s_3_13 (S_3_13)

capture confirm numeric variable S_3_13
if !_rc{
     tostring S_3_13, replace
}

label define S_3_13 .a"." 1 "mejor" 2 "mas o menos igual" 3 "peor" 8 "no responde"9 "no sabe"

encode S_3_13, gen(s_3_13) label (S_3_13)

rename s_3_17 (S_3_17)

capture confirm numeric variable S_3_17
if !_rc{
     tostring S_3_17, replace
}

label define S_3_17 .a"." 1 "no" 2 "si" 8 "no responde"9 "no sabe"

encode S_3_17, gen(s_3_17) label (S_3_17)

rename s_3_19_2 (S_3_19_2)

capture confirm numeric variable S_3_19_2
if !_rc{
     tostring S_3_19_2, replace
}

label define S_3_19_2 .a"." 1 "dias" 2 "semanas" 3 "meses" 4 "años" 

encode S_3_19_2, gen(s_3_19_2) label (S_3_19_2)

rename s_4_1 (S_4_1)

capture confirm numeric variable S_4_1
if !_rc{
     tostring S_4_1, replace
}

label define S_4_1 .a"." 0 "no ha completado ninguna educación" 1 "pre-primaria (jardín de infantes guarderia maternal pre-escolar)" 2 "primaria" 3 "intermedio" 4 "secundaria" 5 "terciaria (ej grado asociado o carrera técnica)" 6 "universitaria o superior" 8 "no responde"9 "no sabe"

encode S_4_1, gen(s_4_1) label (S_4_1)

rename s_4_2 (S_4_2)

capture confirm numeric variable S_4_2
if !_rc{
     tostring S_4_2, replace
}

label define S_4_2 .a"." 1 "no" 2 "si" 8 "no responde"9 "no sabe"

encode S_4_2, gen(s_4_2) label (S_4_2)

rename s_4_8 (S_4_8)

capture confirm numeric variable S_4_8
if !_rc{
     tostring S_4_8, replace
}

label define S_4_8 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_4_8, gen(s_4_8) label (S_4_8)

rename s_4_11 (S_4_11)

capture confirm numeric variable S_4_11
if !_rc{
     tostring S_4_11, replace
}

label define S_4_11 .a"." 0 "no ha completado ninguna educación" 1 "pre-primaria (jardín de infantes guarderia maternal pre-escolar)" 2 "primaria" 3 "intermedio" 4 "secundaria" 5 "terciaria (ej grado asociado o carrera técnica)" 6 "universitaria o superior" 8 "no responde"9 "no sabe"

encode S_4_11, gen(s_4_11) label (S_4_11)

rename s_4_12 (S_4_12)

capture confirm numeric variable S_4_12
if !_rc{
     tostring S_4_12, replace
}

label define S_4_12 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_4_12, gen(s_4_12) label (S_4_12)

rename s_4_18 (S_4_18)

capture confirm numeric variable S_4_18
if !_rc{
     tostring S_4_18, replace
}

label define S_4_18 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_4_18, gen(s_4_18) label (S_4_18)

rename s_4_21 (S_4_21)

capture confirm numeric variable S_4_21
if !_rc{
     tostring S_4_21, replace
}

label define S_4_21 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_4_21, gen(s_4_21) label (S_4_21)

rename s_4_22 (S_4_22)

capture confirm numeric variable S_4_22
if !_rc{
     tostring S_4_22, replace
}

label define S_4_22 .a"." 0 "esposo/a" 1 "madre" 2 "padre" 3 "suegra" 4 "suegro" 5 "hija" 6 "hijo" 7 "nieta" 8 "nieto" 9 "amigo/a" 10 "otra familiar" 11 "otra persona" 88 "no responde"99 "no sabe"

encode S_4_22, gen(s_4_22) label (S_4_22)

rename s_4_23_2 (S_4_23_2)

capture confirm numeric variable S_4_23_2
if !_rc{
     tostring S_4_23_2, replace
}

label define S_4_23_2 .a"." 1 "dia" 2 "semana" 3 "mes" 4 "año" 

encode S_4_23_2, gen(s_4_23_2) label (S_4_23_2)

rename s_4_26 (S_4_26)

capture confirm numeric variable S_4_26
if !_rc{
     tostring S_4_26, replace
}

label define S_4_26 .a"." 2 "no" 1 "si" 3 "no tengo ningunos" 8 "no responde"9 "no sabe"

encode S_4_26, gen(s_4_26) label (S_4_26)

rename s_4_27_2 (S_4_27_2)

capture confirm numeric variable S_4_27_2
if !_rc{
     tostring S_4_27_2, replace
}

label define S_4_27_2 .a"." 1 "día" 2 "semana" 3 "mes" 4 "año" 

encode S_4_27_2, gen(s_4_27_2) label (S_4_27_2)

rename s_4_27a (S_4_27A)

capture confirm numeric variable S_4_27A
if !_rc{
     tostring S_4_27A, replace
}

label define S_4_27A .a"." 1 "menos de 2 horas por semana?" 2 "de 2 a 4 horas por semana?" 3 "más de 4 horas por semana?" 8 "no responde"9 "no sabe"

encode S_4_27A, gen(s_4_27a) label (S_4_27A)

rename s_4_28 (S_4_28)

capture confirm numeric variable S_4_28
if !_rc{
     tostring S_4_28, replace
}

label define S_4_28 .a"." 2 "no" 1 "si" 3"no tengo ningunos" 8 "no responde"9 "no sabe"

encode S_4_28, gen(s_4_28) label (S_4_28)

rename s_4_29_2 (S_4_29_2)

capture confirm numeric variable S_4_29_2
if !_rc{
     tostring S_4_29_2, replace
}

label define S_4_29_2 .a"." 1 "día" 2 "semana" 3 "mes" 4 "año" 

encode S_4_29_2, gen(s_4_29_2) label (S_4_29_2)

rename s_4_29a (S_4_29A)

capture confirm numeric variable S_4_29A
if !_rc{
     tostring S_4_29A, replace
}

label define S_4_29A .a"." 1 "menos de 2 horas por semana" 2 "de 2 a 4 horas por semana" 3 "más de 4 horas por semana" 8 "no responde"9 "no sabe"

encode S_4_29A, gen(s_4_29a) label (S_4_29A)

rename s_5_1 (S_5_1)

capture confirm numeric variable S_5_1
if !_rc{
     tostring S_5_1, replace
}

label define S_5_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_5_1, gen(s_5_1) label (S_5_1)

rename s_5_2 (S_5_2)

capture confirm numeric variable S_5_2
if !_rc{
     tostring S_5_2, replace
}

label define S_5_2 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_5_2, gen(s_5_2) label (S_5_2)

rename s_6_1 (S_6_1)

capture confirm numeric variable S_6_1
if !_rc{
     tostring S_6_1, replace
}

label define S_6_1 .a"." 2 "no" 1 "si" 7 "nació en estados unidos" 8 "no responde"9 "no sabe"

encode S_6_1, gen(s_6_1) label (S_6_1)

rename s_6_3 (S_6_3)

capture confirm numeric variable S_6_3
if !_rc{
     tostring S_6_3, replace
}

label define S_6_3 .a"." 2 "no" 1 "si" 7 "nació en otro pais" 8 "no responde"9 "no sabe"

encode S_6_3, gen(s_6_3) label (S_6_3)

rename s_6_5_p (S_6_5_P)

capture confirm numeric variable S_6_5_P
if !_rc{
     tostring S_6_5_P, replace
}

label define S_6_5_P .a"." 2 "un país en américa latina" 3 "canadá" 4 "españa" 5 "otro país europeo" 6 "otro"

encode S_6_5_P, gen(s_6_5_p) label (S_6_5_P)

rename s_6_5_d (S_6_5_D)

capture confirm numeric variable S_6_5_D
if !_rc{
     tostring S_6_5_D, replace
}

label define S_6_5_D .a"." 1 "haití" 2 "un país en américa latina" 3 "canadá" 4 "españa" 5 "otro país europeo" 6 "otro" 

encode S_6_5_D, gen(s_6_5_d) label (S_6_5_D)

rename s_6_5_c (S_6_5_C)

capture confirm numeric variable S_6_5_C
if !_rc{
     tostring S_6_5_C, replace
}

label define S_6_5_C .a"." .c"cuba" 2 "un país en américa latina" 3 "canadá" 4 "españa" 5 "otro país europeo" 6 "otro" 

encode S_6_5_C, gen(s_6_5_c) label (S_6_5_C)

rename s_7_0 (S_7_0)

capture confirm numeric variable S_7_0
if !_rc{
     tostring S_7_0, replace
}

label define S_7_0 .a"." 1 "muy satisfecho" 2 "algo satisfecho" 3 "algo insatisfecho" 4 "muy insatisfecho" 8 "no responde"9 "no sabe"

encode S_7_0, gen(s_7_0) label (S_7_0)

rename s_7_1 (S_7_1)

capture confirm numeric variable S_7_1
if !_rc{
     tostring S_7_1, replace
}

label define S_7_1 .a"." 1 "no" 0 "si" 8 "no responde"9 "no sabe"

encode S_7_1, gen(s_7_1) label (S_7_1)

rename s_7_2a (S_7_2A)

capture confirm numeric variable S_7_2A
if !_rc{
     tostring S_7_2A, replace
}

label define S_7_2A .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_2A, gen(s_7_2a) label (S_7_2A)

rename s_7_2b (S_7_2B)

capture confirm numeric variable S_7_2B
if !_rc{
     tostring S_7_2B, replace
}

label define S_7_2B .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_2B, gen(s_7_2b) label (S_7_2B)

rename s_7_2c (S_7_2C)

capture confirm numeric variable S_7_2C
if !_rc{
     tostring S_7_2C, replace
}

label define S_7_2C .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_2C, gen(s_7_2c) label (S_7_2C)

rename s_7_4a (S_7_4A)

capture confirm numeric variable S_7_4A
if !_rc{
     tostring S_7_4A, replace
}

label define S_7_4A .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_4A, gen(s_7_4a) label (S_7_4A)

rename s_7_4b (S_7_4B)

capture confirm numeric variable S_7_4B
if !_rc{
     tostring S_7_4B, replace
}

label define S_7_4B .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_4B, gen(s_7_4b) label (S_7_4B)

rename s_7_4c (S_7_4C)

capture confirm numeric variable S_7_4C
if !_rc{
     tostring S_7_4C, replace
}

label define S_7_4C .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_7_4C, gen(s_7_4c) label (S_7_4C)

rename s_7_5a (S_7_5A)

capture confirm numeric variable S_7_5A
if !_rc{
     tostring S_7_5A, replace
}

label define S_7_5A .a"." 1 "casi nunca" 2 "a veces" 3 "frecuentemente" 8 "no responde"9 "no sabe"

encode S_7_5A, gen(s_7_5a) label (S_7_5A)

rename s_7_5b (S_7_5B)

capture confirm numeric variable S_7_5B
if !_rc{
     tostring S_7_5B, replace
}

label define S_7_5B .a"." 1 "casi nunca" 2 "a veces" 3 "frecuentemente" 8 "no responde"9 "no sabe"

encode S_7_5B, gen(s_7_5b) label (S_7_5B)

rename s_7_5c (S_7_5C)

capture confirm numeric variable S_7_5C
if !_rc{
     tostring S_7_5C, replace
}

label define S_7_5C .a"." 1 "casi nunca" 2 "a veces" 3 "frecuentemente" 8 "no responde"9 "no sabe"

encode S_7_5C, gen(s_7_5c) label (S_7_5C)

rename s_7_6a (S_7_6A)

capture confirm numeric variable S_7_6A
if !_rc{
     tostring S_7_6A, replace
}

label define S_7_6A .a"." 1 "casi cada dia" 2 "al menos una ves a la semana" 3 "algunas veces al mes" 4 "algunas veces al año" 5 "menos que una vez al año" 6 "nunca" 88 "no responde"99 "no sabe"

encode S_7_6A, gen(s_7_6a) label (S_7_6A)

rename s_7_6b (S_7_6B)

capture confirm numeric variable S_7_6B
if !_rc{
     tostring S_7_6B, replace
}

label define S_7_6B .a"." 1 "siempre o casi siempre" 2 "la mayor parte del tiempo" 3 "a veces" 4 "casi nunca" 5 "nunca" 88 "no responde"99 "no sabe"

encode S_7_6B, gen(s_7_6b) label (S_7_6B)

rename s_8_1 (S_8_1)

capture confirm numeric variable S_8_1
if !_rc{
     tostring S_8_1, replace
}

label define S_8_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_8_1, gen(s_8_1) label (S_8_1)

rename s_8_3 (S_8_3)

capture confirm numeric variable S_8_3
if !_rc{
     tostring S_8_3, replace
}

label define S_8_3 .a"." 1 "profesional ejecutivo" 2 "oficinista" 3 "vendedor minorista" 4 "agricultor independiente" 5 "trabajador agrícola" 6 "trabajador domestico" 7 "otros servicios" 8 "trabajador especializado" 9 "trabajador no especializado" 10 "trabajos informales" 11 "otros" 88 "no responde"99 "no sabe"

encode S_8_3, gen(s_8_3) label (S_8_3)

rename s_8_4 (S_8_4)

capture confirm numeric variable S_8_4
if !_rc{
     tostring S_8_4, replace
}

label define S_8_4 .a"." 1 "director o jefe" 2 "trabajador por su cuenta" 3 "trabajador cooperativista" 4 "trabajador a sueldo fijo salario o jornal" 5 "trabajador a destajo comisión" 6 "trabajador familiar sin pago" 7 "trabajador no familiar sin pago" 8 "otro" 88 "no responde"99 "no sabe"

encode S_8_4, gen(s_8_4) label (S_8_4)

rename s_8_5a (S_8_5A)

capture confirm numeric variable S_8_5A
if !_rc{
     tostring S_8_5A, replace
}

label define S_8_5A .a"." 1 "trabaja" 2 "busca trabajo" 3 "no trabaja" 8 "no responde"

encode S_8_5A, gen(s_8_5a) label (S_8_5A)

rename s_8_5d (S_8_5D)

capture confirm numeric variable S_8_5D
if !_rc{
     tostring S_8_5D, replace
}

label define S_8_5D .a"." 1 "profesional ejecutivo" 2 "oficinista" 3 "vendedor minorista" 4 "agricultor independiente" 5 "trabajador agrícola" 6 "trabajador domestico" 7 "otros servicios" 8 "trabajador especializado" 9 "trabajador no especializado" 10 "trabajos informales" 11 "otros" 88 "no responde"99 "no sabe"

encode S_8_5D, gen(s_8_5d) label (S_8_5D)

rename s_8_7 (S_8_7)

capture confirm numeric variable S_8_7
if !_rc{
     tostring S_8_7, replace
}

label define S_8_7 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_8_7, gen(s_8_7) label (S_8_7)

rename s_8_10 (S_8_10)

capture confirm numeric variable S_8_10
if !_rc{
     tostring S_8_10, replace
}

label define S_8_10 .a"." 1 "siempre o casi siempre" 2 "la mayor parte del tiempo" 3 "a veces" 4 "casi nunca" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_8_10, gen(s_8_10) label (S_8_10)

rename s_8_11 (S_8_11)

capture confirm numeric variable S_8_11
if !_rc{
     tostring S_8_11, replace
}

label define S_8_11 .a"." 1 "siempre o casi siempre" 2 "la mayor parte del tiempo" 3 "a veces" 4 "casi nunca" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_8_11, gen(s_8_11) label (S_8_11)

rename s_8_12 (S_8_12)

capture confirm numeric variable S_8_12
if !_rc{
     tostring S_8_12, replace
}

label define S_8_12 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 5 "no se aplica" 8 "no responde"9 "no sabe"

encode S_8_12, gen(s_8_12) label (S_8_12)

rename s_8_13 (S_8_13)

capture confirm numeric variable S_8_13
if !_rc{
     tostring S_8_13, replace
}

label define S_8_13 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 5 "no se aplica" 8 "no responde"9 "no sabe"

encode S_8_13, gen(s_8_13) label (S_8_13)

rename s_8_141 (S_8_141)

capture confirm numeric variable S_8_141
if !_rc{
     tostring S_8_141, replace
}

label define S_8_141 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 5 "no se aplica" 8 "no responde"9 "no sabe"

encode S_8_141, gen(s_8_14) label (S_8_141)

label var s_8_14 "S_8_14"

rename s_8_15 (S_8_15)

capture confirm numeric variable S_8_15
if !_rc{
     tostring S_8_15, replace
}

label define S_8_15 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 5 "no se aplica" 8 "no responde"9 "no sabe"

encode S_8_15, gen(s_8_15) label (S_8_15)

rename s_8_16 (S_8_16)

capture confirm numeric variable S_8_16
if !_rc{
     tostring S_8_16, replace
}

label define S_8_16 .a"." 1 "profesional ejecutivo" 2 "oficinista" 3 "vendedor minorista" 4 "agricultor independiente" 5 "trabajador agrícola" 6 "trabajador domestico" 7 "otros servicios" 8 "trabajador especializado" 9 "trabajador no especializado" 10 "trabajos informales" 11 "otros" 88 "no responde"99 "no sabe"

encode S_8_16, gen(s_8_16) label (S_8_16)

rename s_9_1 (S_9_1)

capture confirm numeric variable S_9_1
if !_rc{
     tostring S_9_1, replace
}

label define S_9_1 .a"." 1 "excelente" 2 "muy buena" 3 "buena" 4 "regular" 5 "mala" 8 "no responde"9 "no sabe"

encode S_9_1, gen(s_9_1) label (S_9_1)

rename s_9_3 (S_9_3)

capture confirm numeric variable S_9_3
if !_rc{
     tostring S_9_3, replace
}

label define S_9_3 .a"." 0 "no tiene ese problema de salud" 1 "tiene ese problema pero no interfiere" 2 "tiene ese problema e interfiere un poco" 3 "tiene ese problema e interfiere mucho" 8 "no responde"9 "no sabe"

encode S_9_3, gen(s_9_3) label (S_9_3)

rename s_9_4 (S_9_4)

capture confirm numeric variable S_9_4
if !_rc{
     tostring S_9_4, replace
}

label define S_9_4 .a"." 0 "no tiene ese problema de salud" 1 "tiene ese problema pero no interfiere" 2 "tiene ese problema e interfiere un poco" 3 "tiene ese problema e interfiere mucho" 8 "no responde"9 "no sabe"

encode S_9_4, gen(s_9_4) label (S_9_4)

rename s_9_5 (S_9_5)

capture confirm numeric variable S_9_5
if !_rc{
     tostring S_9_5, replace
}

label define S_9_5 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_5, gen(s_9_5) label (S_9_5)

rename s_9_7 (S_9_7)

capture confirm numeric variable S_9_7
if !_rc{
     tostring S_9_7, replace
}

label define S_9_7 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_7, gen(s_9_7) label (S_9_7)

rename s_9_8 (S_9_8)

capture confirm numeric variable S_9_8
if !_rc{
     tostring S_9_8, replace
}

label define S_9_8 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_8, gen(s_9_8) label (S_9_8)

rename s_9_11 (S_9_11)

capture confirm numeric variable S_9_11
if !_rc{
     tostring S_9_11, replace
}

label define S_9_11 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_11, gen(s_9_11) label (S_9_11)

rename s_9_13 (S_9_13)

capture confirm numeric variable S_9_13
if !_rc{
     tostring S_9_13, replace
}

label define S_9_13 .a"." 1 "menos que 6 meses" 2 "de 6 a 11 meses" 3 "de 1 a 2 años" 4 "mas que 2 años" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_13, gen(s_9_13) label (S_9_13)

rename s_9_14 (S_9_14)

capture confirm numeric variable S_9_14
if !_rc{
     tostring S_9_14, replace
}

label define S_9_14 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_14, gen(s_9_14) label (S_9_14)

rename s_9_15 (S_9_15)

capture confirm numeric variable S_9_15
if !_rc{
     tostring S_9_15, replace
}

label define S_9_15 .a"." 1 "hace 0-5 años" 2 "hace 5-10 años" 3 "hace 10 o más años" 8 "no responde"9 "no sabe"

encode S_9_15, gen(s_9_15) label (S_9_15)

rename s_9_16 (S_9_16)

capture confirm numeric variable S_9_16
if !_rc{
     tostring S_9_16, replace
}

label define S_9_16 .a"." 1 "infarto" 2 "angina" 3 "paro cardíaco" 4 "enfermedad valvular" 5 "otro" 8 "no responde"9 "no sabe"

encode S_9_16, gen(s_9_16) label (S_9_16)

rename s_9_17 (S_9_17)

capture confirm numeric variable S_9_17
if !_rc{
     tostring S_9_17, replace
}

label define S_9_17 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_17, gen(s_9_17) label (S_9_17)

rename s_9_18 (S_9_18)

capture confirm numeric variable S_9_18
if !_rc{
     tostring S_9_18, replace
}

label define S_9_18 .a"." 0 "nadie" 1 "médico general" 2 "especialista" 8 "no responde"9 "no sabe"

encode S_9_18, gen(s_9_18) label (S_9_18)

rename s_9_19 (S_9_19)

capture confirm numeric variable S_9_19
if !_rc{
     tostring S_9_19, replace
}

label define S_9_19 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_19, gen(s_9_19) label (S_9_19)

rename s_9_20 (S_9_20)

capture confirm numeric variable S_9_20
if !_rc{
     tostring S_9_20, replace
}

label define S_9_20 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_20, gen(s_9_20) label (S_9_20)

rename s_9_23 (S_9_23)

capture confirm numeric variable S_9_23
if !_rc{
     tostring S_9_23, replace
}

label define S_9_23 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_23, gen(s_9_23) label (S_9_23)

rename s_9_24 (S_9_24)

capture confirm numeric variable S_9_24
if !_rc{
     tostring S_9_24, replace
}

label define S_9_24 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_24, gen(s_9_24) label (S_9_24)

rename s_9_26 (S_9_26)

capture confirm numeric variable S_9_26
if !_rc{
     tostring S_9_26, replace
}

label define S_9_26 .a"." 0 "sólo dieta" 1 "hipoglicemiantes orales" 2 "insulina" 3 "ningún tratamiento" 88 "no responde"99 "no sabe"

encode S_9_26, gen(s_9_26) label (S_9_26)

rename s_9_28 (S_9_28)

capture confirm numeric variable S_9_28
if !_rc{
     tostring S_9_28, replace
}

label define S_9_28 .a"." 0 "nunca" 1 "menos de una vez por mes" 2 "una vez por mes" 3 "varias veces al mes" 4 "una vez por semana" 5 "varias veces a la semana" 6 "cada día" 7 "varias veces al día" 8 "no responde"9 "no sabe"

encode S_9_28, gen(s_9_28) label (S_9_28)

rename s_9_29 (S_9_29)

capture confirm numeric variable S_9_29
if !_rc{
     tostring S_9_29, replace
}

label define S_9_29 .a"." 1 "una vez cada tres meses" 2 "una vez cada seis meses" 3 "una vez al año" 4 "menos de una vez por año" 5 "no tiene" 8 "no responde"9 "no sabe"

encode S_9_29, gen(s_9_29) label (S_9_29)

rename s_9_30 (S_9_30)

capture confirm numeric variable S_9_30
if !_rc{
     tostring S_9_30, replace
}

label define S_9_30 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_30, gen(s_9_30) label (S_9_30)

rename s_9_32 (S_9_32)

capture confirm numeric variable S_9_32
if !_rc{
     tostring S_9_32, replace
}

label define S_9_32 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_32, gen(s_9_32) label (S_9_32)

rename s_9_33 (S_9_33)

capture confirm numeric variable S_9_33
if !_rc{
     tostring S_9_33, replace
}

label define S_9_33 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_33, gen(s_9_33) label (S_9_33)

rename s_9_35 (S_9_35)

capture confirm numeric variable S_9_35
if !_rc{
     tostring S_9_35, replace
}

label define S_9_35 .a"." 1 "menos que 6 meses" 2 "de 6 a 11 meses" 3 "de 1 a 2 años" 4 "mas que 2 años" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_35, gen(s_9_35) label (S_9_35)

rename s_9_37 (S_9_37)

capture confirm numeric variable S_9_37
if !_rc{
     tostring S_9_37, replace
}

label define S_9_37 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_37, gen(s_9_37) label (S_9_37)

rename s_9_39 (S_9_39)

capture confirm numeric variable S_9_39
if !_rc{
     tostring S_9_39, replace
}

label define S_9_39 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_39, gen(s_9_39) label (S_9_39)

rename s_9_40 (S_9_40)

capture confirm numeric variable S_9_40
if !_rc{
     tostring S_9_40, replace
}

label define S_9_40 .a"." 1 "si unos pocos (hasta 4)" 2 "si bastante (más de 4 y menos de la mitad)" 3 "si la mayoría (la mitad o más)" 4 "no" 8 "no responde"9 "no sabe"

encode S_9_40, gen(s_9_40) label (S_9_40)

rename s_9_41 (S_9_41)

capture confirm numeric variable S_9_41
if !_rc{
     tostring S_9_41, replace
}

label define S_9_41 .a"." 0 "no" 1 "si raramente" 2 "si frecuentemente" 3 "si muy frecuentemente" 8 "no responde"9 "no sabe"

encode S_9_41, gen(s_9_41) label (S_9_41)

rename s_9_42 (S_9_42)

capture confirm numeric variable S_9_42
if !_rc{
     tostring S_9_42, replace
}

label define S_9_42 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_42, gen(s_9_42) label (S_9_42)

rename s_9_44 (S_9_44)

capture confirm numeric variable S_9_44
if !_rc{
     tostring S_9_44, replace
}

label define S_9_44 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_44, gen(s_9_44) label (S_9_44)

rename s_9_46 (S_9_46)

capture confirm numeric variable S_9_46
if !_rc{
     tostring S_9_46, replace
}

label define S_9_46 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_46, gen(s_9_46) label (S_9_46)

rename s_9_47 (S_9_47)

capture confirm numeric variable S_9_47
if !_rc{
     tostring S_9_47, replace
}

label define S_9_47 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_47, gen(s_9_47) label (S_9_47)

rename s_9_49 (S_9_49)

capture confirm numeric variable S_9_49
if !_rc{
     tostring S_9_49, replace
}

label define S_9_49 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_49, gen(s_9_49) label (S_9_49)

rename s_9_50 (S_9_50)

capture confirm numeric variable S_9_50
if !_rc{
     tostring S_9_50, replace
}

label define S_9_50 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_50, gen(s_9_50) label (S_9_50)

rename s_9_51 (S_9_51)

capture confirm numeric variable S_9_51
if !_rc{
     tostring S_9_51, replace
}

label define S_9_51 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_51, gen(s_9_51) label (S_9_51)

rename s_9_52 (S_9_52)

capture confirm numeric variable S_9_52
if !_rc{
     tostring S_9_52, replace
}

label define S_9_52 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_52, gen(s_9_52) label (S_9_52)

rename s_9_53 (S_9_53)

capture confirm numeric variable S_9_53
if !_rc{
     tostring S_9_53, replace
}

label define S_9_53 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_53, gen(s_9_53) label (S_9_53)

rename s_9_54 (S_9_54)

capture confirm numeric variable S_9_54
if !_rc{
     tostring S_9_54, replace
}

label define S_9_54 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_54, gen(s_9_54) label (S_9_54)

rename s_9_55 (S_9_55)

capture confirm numeric variable S_9_55
if !_rc{
     tostring S_9_55, replace
}

label define S_9_55 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_55, gen(s_9_55) label (S_9_55)

rename s_9_56 (S_9_56)

capture confirm numeric variable S_9_56
if !_rc{
     tostring S_9_56, replace
}

label define S_9_56 .a"." 1 "< 1 año" 2 "1 a menos de 3 años" 3 "3 a menos de 5 años" 4 "5 años o mas" 5 "nunca" 8 "no responde"9 "no sabe"

encode S_9_56, gen(s_9_56) label (S_9_56)

rename s_9_58 (S_9_58)

capture confirm numeric variable S_9_58
if !_rc{
     tostring S_9_58, replace
}

label define S_9_58 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_58, gen(s_9_58) label (S_9_58)

rename s_9_61a (S_9_61A)

capture confirm numeric variable S_9_61A
if !_rc{
     tostring S_9_61A, replace
}

label define S_9_61A .a"." 1 "menos de 45 años" 2 "más o menos 50 años" 3 "más de 55 años" 8 "no responde"9 "no sabe"

encode S_9_61A, gen(s_9_61a) label (S_9_61A)

rename s_9_62 (S_9_62)

capture confirm numeric variable S_9_62
if !_rc{
     tostring S_9_62, replace
}

label define S_9_62 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_62, gen(s_9_62) label (S_9_62)

rename s_9_63 (S_9_63)

capture confirm numeric variable S_9_63
if !_rc{
     tostring S_9_63, replace
}

label define S_9_63 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_63, gen(s_9_63) label (S_9_63)

rename s_9_64_1 (S_9_64_1)

capture confirm numeric variable S_9_64_1
if !_rc{
     tostring S_9_64_1, replace
}

label define S_9_64_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_64_1, gen(s_9_64_1) label (S_9_64_1)

rename s_9_64_2 (S_9_64_2)

capture confirm numeric variable S_9_64_2
if !_rc{
     tostring S_9_64_2, replace
}

label define S_9_64_2 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_64_2, gen(s_9_64_2) label (S_9_64_2)

rename s_9_64_3 (S_9_64_3)

capture confirm numeric variable S_9_64_3
if !_rc{
     tostring S_9_64_3, replace
}

label define S_9_64_3 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_64_3, gen(s_9_64_3) label (S_9_64_3)

rename s_9_64_4 (S_9_64_4)

capture confirm numeric variable S_9_64_4
if !_rc{
     tostring S_9_64_4, replace
}

label define S_9_64_4 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_64_4, gen(s_9_64_4) label (S_9_64_4)

rename s_9_66 (S_9_66)

capture confirm numeric variable S_9_66
if !_rc{
     tostring S_9_66, replace
}

label define S_9_66 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_9_66, gen(s_9_66) label (S_9_66)

rename s_10_1a (S_10_1A)

capture confirm numeric variable S_10_1A
if !_rc{
     tostring S_10_1A, replace
}

label define S_10_1A .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1A, gen(s_10_1a) label (S_10_1A)

rename s_10_1b (S_10_1B)

capture confirm numeric variable S_10_1B
if !_rc{
     tostring S_10_1B, replace
}

label define S_10_1B .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1B, gen(s_10_1b) label (S_10_1B)

rename s_10_1c (S_10_1C)

capture confirm numeric variable S_10_1C
if !_rc{
     tostring S_10_1C, replace
}

label define S_10_1C .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1C, gen(s_10_1c) label (S_10_1C)

rename s_10_1d (S_10_1D)

capture confirm numeric variable S_10_1D
if !_rc{
     tostring S_10_1D, replace
}

label define S_10_1D .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1D, gen(s_10_1d) label (S_10_1D)

rename s_10_1e (S_10_1E)

capture confirm numeric variable S_10_1E
if !_rc{
     tostring S_10_1E, replace
}

label define S_10_1E .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1E, gen(s_10_1e) label (S_10_1E)

rename s_10_1f (S_10_1F)

capture confirm numeric variable S_10_1F
if !_rc{
     tostring S_10_1F, replace
}

label define S_10_1F .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1F, gen(s_10_1f) label (S_10_1F)

rename s_10_1g (S_10_1G)

capture confirm numeric variable S_10_1G
if !_rc{
     tostring S_10_1G, replace
}

label define S_10_1G .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1G, gen(s_10_1g) label (S_10_1G)

rename s_10_1h (S_10_1H)

capture confirm numeric variable S_10_1H
if !_rc{
     tostring S_10_1H, replace
}

label define S_10_1H .a"." 5 "no cierto" 1 "si cierto" 8 "no responde"9 "no sabe"

encode S_10_1H, gen(s_10_1h) label (S_10_1H)

rename s_10_2 (S_10_2)

capture confirm numeric variable S_10_2
if !_rc{
     tostring S_10_2, replace
}

label define S_10_2 .a"." 1 "la mayoría de las noches" 2 "algunas noches" 3 "casi nunca o nunca" 8 "no responde"9 "no sabe"

encode S_10_2, gen(s_10_2) label (S_10_2)

rename s_10_3 (S_10_3)

capture confirm numeric variable S_10_3
if !_rc{
     tostring S_10_3, replace
}

label define S_10_3 .a"." 1 "la mayoría de las noches" 2 "algunas noches" 3 "casi nunca o nunca" 8 "no responde"9 "no sabe"

encode S_10_3, gen(s_10_3) label (S_10_3)

rename s_10_4 (S_10_4)

capture confirm numeric variable S_10_4
if !_rc{
     tostring S_10_4, replace
}

label define S_10_4 .a"." 1 "la mayoría de las veces" 2 "algunas veces" 3 "casi nunca o nunca" 8 "no responde"9 "no sabe"

encode S_10_4, gen(s_10_4) label (S_10_4)

rename s_10_5 (S_10_5)

capture confirm numeric variable S_10_5
if !_rc{
     tostring S_10_5, replace
}

label define S_10_5 .a"." 1 "la mayoría de las veces" 2 "algunas veces" 3 "casi nunca o nunca" 8 "no responde"9 "no sabe"

encode S_10_5, gen(s_10_5) label (S_10_5)

rename s_10_6_1 (S_10_6_1)

capture confirm numeric variable S_10_6_1
if !_rc{
     tostring S_10_6_1, replace
}

label define S_10_6_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_10_6_1, gen(s_10_6_1) label (S_10_6_1)

rename s_10_6_1a (S_10_6_1A)

capture confirm numeric variable S_10_6_1A
if !_rc{
     tostring S_10_6_1A, replace
}

label define S_10_6_1A .a"." 1 "más de un año" 2 "menos de un año" 8 "no responde"9 "no sabe"

encode S_10_6_1A, gen(s_10_6_1a) label (S_10_6_1A)

rename s_10_6_2 (S_10_6_2)

capture confirm numeric variable S_10_6_2
if !_rc{
     tostring S_10_6_2, replace
}

label define S_10_6_2 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_10_6_2, gen(s_10_6_2) label (S_10_6_2)

rename s_10_6_2a (S_10_6_2A)

capture confirm numeric variable S_10_6_2A
if !_rc{
     tostring S_10_6_2A, replace
}

label define S_10_6_2A .a"." 1 "más de un año" 2 "menos de un año" 8 "no responde"9 "no sabe"

encode S_10_6_2A, gen(s_10_6_2a) label (S_10_6_2A)

rename s_10_6_3 (S_10_6_3)

capture confirm numeric variable S_10_6_3
if !_rc{
     tostring S_10_6_3, replace
}

label define S_10_6_3 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"7 "no se aplica (no trabaja)" 

encode S_10_6_3, gen(s_10_6_3) label (S_10_6_3)

rename s_10_6_3a (S_10_6_3A)

capture confirm numeric variable S_10_6_3A
if !_rc{
     tostring S_10_6_3A, replace
}

label define S_10_6_3A .a"." 1 "más de un año" 2 "menos de un año" 8 "no responde"9 "no sabe"

encode S_10_6_3A, gen(s_10_6_3a) label (S_10_6_3A)

rename s_10_6_4 (S_10_6_4)

capture confirm numeric variable S_10_6_4
if !_rc{
     tostring S_10_6_4, replace
}

label define S_10_6_4 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_10_6_4, gen(s_10_6_4) label (S_10_6_4)

rename s_10_6_4a (S_10_6_4A)

capture confirm numeric variable S_10_6_4A
if !_rc{
     tostring S_10_6_4A, replace
}

label define S_10_6_4A .a"." 1 "más de un año" 2 "menos de un año" 8 "no responde"9 "no sabe"

encode S_10_6_4A, gen(s_10_6_4a) label (S_10_6_4A)

rename s_10_7_1 (S_10_7_1)

capture confirm numeric variable S_10_7_1
if !_rc{
     tostring S_10_7_1, replace
}

label define S_10_7_1 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 7 "no se aplica" 8 "no responde"9 "no sabe"

encode S_10_7_1, gen(s_10_7_1) label (S_10_7_1)

rename s_10_7_2 (S_10_7_2)

capture confirm numeric variable S_10_7_2
if !_rc{
     tostring S_10_7_2, replace
}

label define S_10_7_2 .a"." 1 "muy en desacuerdo" 2 "desacuerdo" 3 "acuerdo" 4 "muy en acuerdo" 7 "no se aplica" 8 "no responde"9 "no sabe"

encode S_10_7_2, gen(s_10_7_2) label (S_10_7_2)

rename s_11_1 (S_11_1)

capture confirm numeric variable S_11_1
if !_rc{
     tostring S_11_1, replace
}

label define S_11_1 .a"." 1 "nunca" 2 "2-3 veces el mes pasado" 3 "aproximadamente una vez a la semana" 4 "2-3 días a la semana" 5 "todos los días" 8 "no responde"9 "no sabe"

encode S_11_1, gen(s_11_1) label (S_11_1)

rename s_11_2 (S_11_2)

capture confirm numeric variable S_11_2
if !_rc{
     tostring S_11_2, replace
}

label define S_11_2 .a"." 1 "dolor leve" 2 "dolor moderado" 3 "dolor severo" 4 "dolor muy severo" 5 "dolor insoportable" 8 "no responde"9 "no sabe"

encode S_11_2, gen(s_11_2) label (S_11_2)

rename s_11_3 (S_11_3)

capture confirm numeric variable S_11_3
if !_rc{
     tostring S_11_3, replace
}

label define S_11_3 .a"." 1 "en lo absoluto" 2 "no mucho" 3 "moderadamente" 4 "mucho" 8 "no responde"9 "no sabe"

encode S_11_3, gen(s_11_3) label (S_11_3)

rename s_12_1a (S_12_1A)

capture confirm numeric variable S_12_1A
if !_rc{
     tostring S_12_1A, replace
}

label define S_12_1A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_1A, gen(s_12_1a) label (S_12_1A)

rename s_12_1b (S_12_1B)

capture confirm numeric variable S_12_1B
if !_rc{
     tostring S_12_1B, replace
}

label define S_12_1B .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_1B, gen(s_12_1b) label (S_12_1B)

rename s_12_1c (S_12_1C)

capture confirm numeric variable S_12_1C
if !_rc{
     tostring S_12_1C, replace
}

label define S_12_1C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_1C, gen(s_12_1c) label (S_12_1C)

rename s_12_2a (S_12_2A)

capture confirm numeric variable S_12_2A
if !_rc{
     tostring S_12_2A, replace
}

label define S_12_2A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_2A, gen(s_12_2a) label (S_12_2A)

rename s_12_2c (S_12_2C)

capture confirm numeric variable S_12_2C
if !_rc{
     tostring S_12_2C, replace
}

label define S_12_2C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_2C, gen(s_12_2c) label (S_12_2C)

rename s_12_3a (S_12_3A)

capture confirm numeric variable S_12_3A
if !_rc{
     tostring S_12_3A, replace
}

label define S_12_3A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_3A, gen(s_12_3a) label (S_12_3A)

rename s_12_3c (S_12_3C)

capture confirm numeric variable S_12_3C
if !_rc{
     tostring S_12_3C, replace
}

label define S_12_3C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_3C, gen(s_12_3c) label (S_12_3C)

rename s_12_4a (S_12_4A)

capture confirm numeric variable S_12_4A
if !_rc{
     tostring S_12_4A, replace
}

label define S_12_4A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_4A, gen(s_12_4a) label (S_12_4A)

rename s_12_4b (S_12_4B)

capture confirm numeric variable S_12_4B
if !_rc{
     tostring S_12_4B, replace
}

label define S_12_4B .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_4B, gen(s_12_4b) label (S_12_4B)

rename s_12_4c (S_12_4C)

capture confirm numeric variable S_12_4C
if !_rc{
     tostring S_12_4C, replace
}

label define S_12_4C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_4C, gen(s_12_4c) label (S_12_4C)

rename s_12_5a (S_12_5A)

capture confirm numeric variable S_12_5A
if !_rc{
     tostring S_12_5A, replace
}

label define S_12_5A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_5A, gen(s_12_5a) label (S_12_5A)

rename s_12_5c (S_12_5C)

capture confirm numeric variable S_12_5C
if !_rc{
     tostring S_12_5C, replace
}

label define S_12_5C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_5C, gen(s_12_5c) label (S_12_5C)

rename s_12_6a (S_12_6A)

capture confirm numeric variable S_12_6A
if !_rc{
     tostring S_12_6A, replace
}

label define S_12_6A .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_6A, gen(s_12_6a) label (S_12_6A)

rename s_12_6c (S_12_6C)

capture confirm numeric variable S_12_6C
if !_rc{
     tostring S_12_6C, replace
}

label define S_12_6C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_6C, gen(s_12_6c) label (S_12_6C)

rename s_12_7 (S_12_7)

capture confirm numeric variable S_12_7
if !_rc{
     tostring S_12_7, replace
}

label define S_12_7 .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_7, gen(s_12_7) label (S_12_7)

rename s_12_8 (S_12_8)

capture confirm numeric variable S_12_8
if !_rc{
     tostring S_12_8, replace
}

label define S_12_8 .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_8, gen(s_12_8) label (S_12_8)

rename s_12_9 (S_12_9)

capture confirm numeric variable S_12_9
if !_rc{
     tostring S_12_9, replace
}

label define S_12_9 .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_9, gen(s_12_9) label (S_12_9)

rename s_12_10 (S_12_10)

capture confirm numeric variable S_12_10
if !_rc{
     tostring S_12_10, replace
}

label define S_12_10 .a"." 2 "no" 1 "si" 6 "no puede" 7 "no lo hace" 8 "no responde"9 "no sabe"

encode S_12_10, gen(s_12_10) label (S_12_10)

rename s_12_11 (S_12_11)

capture confirm numeric variable S_12_11
if !_rc{
     tostring S_12_11, replace
}

label define S_12_11 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_11, gen(s_12_11) label (S_12_11)

rename s_12_13 (S_12_13)

capture confirm numeric variable S_12_13
if !_rc{
     tostring S_12_13, replace
}

label define S_12_13 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_13, gen(s_12_13) label (S_12_13)

rename s_12_14 (S_12_14)

capture confirm numeric variable S_12_14
if !_rc{
     tostring S_12_14, replace
}

label define S_12_14 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_14, gen(s_12_14) label (S_12_14)

rename s_12_15 (S_12_15)

capture confirm numeric variable S_12_15
if !_rc{
     tostring S_12_15, replace
}

label define S_12_15 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_12_15, gen(s_12_15) label (S_12_15)

rename s_12_16 (S_12_16)

capture confirm numeric variable S_12_16
if !_rc{
     tostring S_12_16, replace
}

label define S_12_16 .a"." 1 "los levantó totalmente" 2 "los levantó parcialmente" 3 "no puede levantarlos" 4 "no aceptó realizar la prueba" 

encode S_12_16, gen(s_12_16) label (S_12_16)

rename s_13_1_p_c (S_13_1_P_C)

capture confirm numeric variable S_13_1_P_C
if !_rc{
     tostring S_13_1_P_C, replace
}

label define S_13_1_P_C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_1_P_C, gen(s_13_1_p_c) label (S_13_1_P_C)

rename s_13_1_d (S_13_1_D)

capture confirm numeric variable S_13_1_D
if !_rc{
     tostring S_13_1_D, replace
}

label define S_13_1_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_1_D, gen(s_13_1_d) label (S_13_1_D)

rename s_13_3_p_c (S_13_3_P_C)

capture confirm numeric variable S_13_3_P_C
if !_rc{
     tostring S_13_3_P_C, replace
}

label define S_13_3_P_C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_3_P_C, gen(s_13_3_p_c) label (S_13_3_P_C)

rename s_13_3_d (S_13_3_D)

capture confirm numeric variable S_13_3_D
if !_rc{
     tostring S_13_3_D, replace
}

label define S_13_3_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_3_D, gen(s_13_3_d) label (S_13_3_D)

rename s_13_5 (S_13_5)

capture confirm numeric variable S_13_5
if !_rc{
     tostring S_13_5, replace
}

label define S_13_5 .a"." 1 "a diario" 2 "no todos los dias" 8 "no responde"9 "no sabe"

encode S_13_5, gen(s_13_5) label (S_13_5)

rename s_13_8 (S_13_8)

capture confirm numeric variable S_13_8
if !_rc{
     tostring S_13_8, replace
}

label define S_13_8 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_8, gen(s_13_8) label (S_13_8)

rename s_13_9 (S_13_9)

capture confirm numeric variable S_13_9
if !_rc{
     tostring S_13_9, replace
}

label define S_13_9 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_9, gen(s_13_9) label (S_13_9)

rename s_13_12 (S_13_12)

capture confirm numeric variable S_13_12
if !_rc{
     tostring S_13_12, replace
}

label define S_13_12 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_12, gen(s_13_12) label (S_13_12)

rename s_13_13 (S_13_13)

capture confirm numeric variable S_13_13
if !_rc{
     tostring S_13_13, replace
}

label define S_13_13 .a"." 0 "nunca" 1 "algunos días" 2 "la mayoría de los días" 3 "una vez al dia" 4 "más que una vez al dia" 8 "no responde"9 "no sabe"

encode S_13_13, gen(s_13_13) label (S_13_13)

rename s_13_14 (S_13_14)

capture confirm numeric variable S_13_14
if !_rc{
     tostring S_13_14, replace
}

label define S_13_14 .a"." 0 "nunca" 1 "algunos días" 2 "la mayoría de los días" 3 "una vez al dia" 4 "más que una vez al dia" 8 "no responde"9 "no sabe"

encode S_13_14, gen(s_13_14) label (S_13_14)

rename s_13_15 (S_13_15)

capture confirm numeric variable S_13_15
if !_rc{
     tostring S_13_15, replace
}

label define S_13_15 .a"." 0 "nunca" 1 "algunos días" 2 "la mayoría de los días" 3 "una vez al dia" 4 "más que una vez al dia" 8 "no responde"9 "no sabe"

encode S_13_15, gen(s_13_15) label (S_13_15)

rename s_13_16 (S_13_16)

capture confirm numeric variable S_13_16
if !_rc{
     tostring S_13_16, replace
}

label define S_13_16 .a"." 0 "nunca" 1 "algunos días" 2 "la mayoría de los días" 3 "una vez al dia" 4 "más que una vez al dia" 8 "no responde"9 "no sabe"

encode S_13_16, gen(s_13_16) label (S_13_16)

rename s_13_17 (S_13_17)

capture confirm numeric variable S_13_17
if !_rc{
     tostring S_13_17, replace
}

label define S_13_17 .a"." 0 "nunca" 1 "algunos días" 2 "la mayoría de los días" 3 "una vez al dia" 4 "más que una vez al dia" 8 "no responde"9 "no sabe"

encode S_13_17, gen(s_13_17) label (S_13_17)

rename s_13_18 (S_13_18)

capture confirm numeric variable S_13_18
if !_rc{
     tostring S_13_18, replace
}

label define S_13_18 .a"." 1 "físicamente muy activo" 2 "físicamente bastante activo" 3 "físicamente no muy activo" 4 "físicamente nada activo" 8 "no responde"9 "no sabe"

encode S_13_18, gen(s_13_18) label (S_13_18)

rename s_13_19 (S_13_19)

capture confirm numeric variable S_13_19
if !_rc{
     tostring S_13_19, replace
}

label define S_13_19 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_19, gen(s_13_19) label (S_13_19)

rename s_13_22 (S_13_22)

capture confirm numeric variable S_13_22
if !_rc{
     tostring S_13_22, replace
}

label define S_13_22 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_22, gen(s_13_22) label (S_13_22)

rename s_13_30_d_c (S_13_30_D_C)

capture confirm numeric variable S_13_30_D_C
if !_rc{
     tostring S_13_30_D_C, replace
}

label define S_13_30_D_C .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_30_D_C, gen(s_13_30_d_c) label (S_13_30_D_C)

rename s_13_30_p (S_13_30_P)

capture confirm numeric variable S_13_30_P
if !_rc{
     tostring S_13_30_P, replace
}

label define S_13_30_P .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_13_30_P, gen(s_13_30_p) label (S_13_30_P)

rename s_14_1_p_d (S_14_1_P_D)

capture confirm numeric variable S_14_1_P_D
if !_rc{
     tostring S_14_1_P_D, replace
}

label define S_14_1_P_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_1_P_D, gen(s_14_1_p_d) label (S_14_1_P_D)

rename s_14_3 (S_14_3)

capture confirm numeric variable S_14_3
if !_rc{
     tostring S_14_3, replace
}

label define S_14_3 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_3, gen(s_14_3) label (S_14_3)

rename s_14_17 (S_14_17)

capture confirm numeric variable S_14_17
if !_rc{
     tostring S_14_17, replace
}

label define S_14_17 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_17, gen(s_14_17) label (S_14_17)

rename s_14_18_1 (S_14_18_1)

capture confirm numeric variable S_14_18_1
if !_rc{
     tostring S_14_18_1, replace
}

label define S_14_18_1 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_1, gen(s_14_18_1) label (S_14_18_1)

rename s_14_18_2 (S_14_18_2)

capture confirm numeric variable S_14_18_2
if !_rc{
     tostring S_14_18_2, replace
}

label define S_14_18_2 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_2, gen(s_14_18_2) label (S_14_18_2)

rename s_14_18_3 (S_14_18_3)

capture confirm numeric variable S_14_18_3
if !_rc{
     tostring S_14_18_3, replace
}

label define S_14_18_3 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_3, gen(s_14_18_3) label (S_14_18_3)

rename s_14_18_4 (S_14_18_4)

capture confirm numeric variable S_14_18_4
if !_rc{
     tostring S_14_18_4, replace
}

label define S_14_18_4 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_4, gen(s_14_18_4) label (S_14_18_4)

rename s_14_18_5 (S_14_18_5)

capture confirm numeric variable S_14_18_5
if !_rc{
     tostring S_14_18_5, replace
}

label define S_14_18_5 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_5, gen(s_14_18_5) label (S_14_18_5)

rename s_14_18_6 (S_14_18_6)

capture confirm numeric variable S_14_18_6
if !_rc{
     tostring S_14_18_6, replace
}

label define S_14_18_6 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_18_6, gen(s_14_18_6) label (S_14_18_6)

rename s_14_23 (S_14_23)

capture confirm numeric variable S_14_23
if !_rc{
     tostring S_14_23, replace
}

label define S_14_23 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_23, gen(s_14_23) label (S_14_23)

rename s_14_30b1_p (S_14_30B1_P)

capture confirm numeric variable S_14_30B1_P
if !_rc{
     tostring S_14_30B1_P, replace
}

label define S_14_30B1_P .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B1_P, gen(s_14_30b1_p) label (S_14_30B1_P)

rename s_14_30b1_d (S_14_30B1_D)

capture confirm numeric variable S_14_30B1_D
if !_rc{
     tostring S_14_30B1_D, replace
}

label define S_14_30B1_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B1_D, gen(s_14_30b1_d) label (S_14_30B1_D)

*cuba versions manually inserted

capture program drop s_14_30b_cuba
program define s_14_30b_cuba
    capture rename s_14_30b1_c S_14_30B1_C
    capture confirm numeric variable S_14_30B1_C
    if !_rc {
        capture tostring S_14_30B1_C, replace
    }
    label define S_14_30B1_C_lbl .a "." 2 "no" 1 "si" 8 "no responde" 9 "no sabe"
    capture encode S_14_30B1_C, gen(s_14_30b1_c) label(S_14_30B1_C_lbl)

    capture rename s_14_30b2_c S_14_30B2_C
    capture confirm numeric variable S_14_30B2_C
    if !_rc {
        capture tostring S_14_30B2_C, replace
    }
    label define S_14_30B2_C_lbl .a "." 2 "no" 1 "si" 8 "no responde" 9 "no sabe"
    capture encode S_14_30B2_C, gen(s_14_30b2_c) label(S_14_30B2_C_lbl)

    capture rename s_14_30b3_c S_14_30B3_C
    capture confirm numeric variable S_14_30B3_C
    if !_rc {
        capture tostring S_14_30B3_C, replace
    }
    label define S_14_30B3_C_lbl .a "." 2 "no" 1 "si" 8 "no responde" 9 "no sabe"
    capture encode S_14_30B3_C, gen(s_14_30b3_c) label(S_14_30B3_C_lbl)
end

capture confirm variable s_14_30b1_c
capture confirm variable s_14_30b2_c
capture confirm variable s_14_30b3_c
if !_rc {
    s_14_30b_cuba
}


rename s_14_30b2_p (S_14_30B2_P)

capture confirm numeric variable S_14_30B2_P
if !_rc{
     tostring S_14_30B2_P, replace
}

label define S_14_30B2_P .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B2_P, gen(s_14_30b2_p) label (S_14_30B2_P)

rename s_14_30b2_d (S_14_30B2_D)

capture confirm numeric variable S_14_30B2_D
if !_rc{
     tostring S_14_30B2_D, replace
}

label define S_14_30B2_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B2_D, gen(s_14_30b2_d) label (S_14_30B2_D)

rename s_14_30b3_p (S_14_30B3_P)

capture confirm numeric variable S_14_30B3_P
if !_rc{
     tostring S_14_30B3_P, replace
}

label define S_14_30B3_P .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B3_P, gen(s_14_30b3_p) label (S_14_30B3_P)

rename s_14_30b3_d (S_14_30B3_D)

capture confirm numeric variable S_14_30B3_D
if !_rc{
     tostring S_14_30B3_D, replace
}

label define S_14_30B3_D .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_30B3_D, gen(s_14_30b3_d) label (S_14_30B3_D)



rename s_14_31 (S_14_31)

capture confirm numeric variable S_14_31
if !_rc{
     tostring S_14_31, replace
}

label define S_14_31 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_31, gen(s_14_31) label (S_14_31)

rename s_14_32 (S_14_32)

capture confirm numeric variable S_14_32
if !_rc{
     tostring S_14_32, replace
}

label define S_14_32 .a"." 1 "1" 2 "2" 3 "3" 4 "4 o más" 8 "no responde"9 "no sabe"

encode S_14_32, gen(s_14_32) label (S_14_32)

rename s_14_33 (S_14_33)

capture confirm numeric variable S_14_33
if !_rc{
     tostring S_14_33, replace
}

label define S_14_33 .a"." 2 "no" 1 "si" 8 "no responde"9 "no sabe"

encode S_14_33, gen(s_14_33) label (S_14_33)

rename s_15_1 (S_15_1)

capture confirm numeric variable S_15_1
if !_rc{
     tostring S_15_1, replace
}

label define S_15_1 .a"." 0 "el participante solamente" 1 "participante y proxy" 2 "proxy solo" 

encode S_15_1, gen(s_15_1) label (S_15_1)

rename s_15_2 (S_15_2)

capture confirm numeric variable S_15_2
if !_rc{
     tostring S_15_2, replace
}

label define S_15_2 .a"." 1 "esposo (a)" 2 "hijo/hija" 3 "nuero/nuera" 4 "hermano (a)" 5 "otro parentesco" 6 "amigo" 7 "vecino(a)" 8 "otro" 

encode S_15_2, gen(s_15_2) label (S_15_2)

rename s_15_3 (S_15_3)

capture confirm numeric variable S_15_3
if !_rc{
     tostring S_15_3, replace
}

label define S_15_3 .a"." 0 "razonable (el entrevistado respondió de manera apropiada a más o menos a todas las preguntas)" 1 "algunas dudas" 2 "moderadas dudas" 3 "graves dudas (el entrevistador consideró que el entrevistado fue incapaz o no cooperó en responder de manera apropiada a la mayoría de las preguntas)" 4 "sin valor alguno (las preguntas fueron respondidas al azar)" 

*addressing checkboxes below

encode S_15_3, gen(s_15_3) label (S_15_3)

rename s_7_7a (S_7_7a)

label define S_7_7a 0 "false" 1 "true"

encode S_7_7a, gen (s_7_7a) label (S_7_7a)

drop S_7_7a

rename s_7_7b (S_7_7b)

label define S_7_7b 0 "false" 1 "true"

encode S_7_7b, gen (s_7_7b) label (S_7_7b)

drop S_7_7b

rename s_7_7c (S_7_7c)

label define S_7_7c 0 "false" 1 "true"

encode S_7_7c, gen (s_7_7c) label (S_7_7c)

drop S_7_7c

rename s_7_7d (S_7_7d)

label define S_7_7d 0 "false" 1 "true"

encode S_7_7d, gen (s_7_7d) label (S_7_7d)

drop S_7_7d

rename s_7_7e (S_7_7e)

label define S_7_7e 0 "false" 1 "true"

encode S_7_7e, gen (s_7_7e) label (S_7_7e)

drop S_7_7e

rename s_7_7f (S_7_7f)

label define S_7_7f 0 "false" 1 "true"

encode S_7_7f, gen (s_7_7f) label (S_7_7f)

drop S_7_7f

rename s_7_7g (S_7_7g)

label define S_7_7g 0 "false" 1 "true"

encode S_7_7g, gen (s_7_7g) label (S_7_7g)

drop S_7_7g

rename s_7_7h (S_7_7h)

label define S_7_7h 0 "false" 1 "true"

encode S_7_7h, gen (s_7_7h) label (S_7_7h)

drop S_7_7h

rename s_7_7i (S_7_7i)

label define S_7_7i 0 "false" 1 "true"

encode S_7_7i, gen (s_7_7i) label (S_7_7i)

drop S_7_7i

rename s_7_7j (S_7_7j)

label define S_7_7j 0 "false" 1 "true"

encode S_7_7j, gen (s_7_7j) label (S_7_7j)

drop S_7_7j

rename s_7_7k (S_7_7k)

label define S_7_7k 0 "false" 1 "true"

encode S_7_7k, gen (s_7_7k) label (S_7_7k)

drop S_7_7k

rename s_8_5b2 (S_8_5b2)

*we are deleting this duplicate
label define S_8_5b2 0 "false" 1 "true"

encode S_8_5b2, gen (s_8_5b2_delete) label (S_8_5b2)

drop S_8_5b2

rename s_8_5b1 (S_8_5b1)

label define S_8_5b1 0 "false" 1 "true"

encode S_8_5b1, gen (s_8_5b1) label (S_8_5b1)

drop S_8_5b1

rename s_8_5b3 (S_8_5b3)

label define S_8_5b3 0 "false" 1 "true"

*this will be changed to 2 to align with word
encode S_8_5b3, gen (s_8_5b2) label (S_8_5b3)

drop S_8_5b3


rename s_8_5b4 (S_8_5b4)

label define S_8_5b4 0 "false" 1 "true"

*This will be changed to 3 to align with word
encode S_8_5b4, gen (s_8_5b3) label (S_8_5b4)

drop S_8_5b4

rename s_8_5b5 (S_8_5b5)

label define S_8_5b5 0 "false" 1 "true"

*this will be changed to 4 to align with word
encode S_8_5b5, gen (s_8_5b4) label (S_8_5b5)

drop S_8_5b5

rename s_8_5b6 (S_8_5b6)

label define S_8_5b6 0 "false" 1 "true"

*this will be changed to 5 to align with word
encode S_8_5b6, gen (s_8_5b5) label (S_8_5b6)

drop S_8_5b6

rename s_8_5b7 (S_8_5b7)

label define S_8_5b7 0 "false" 1 "true"

*this will be changed to 6 to align with word
encode S_8_5b7, gen (s_8_5b6) label (S_8_5b7)

drop S_8_5b7

rename s_8_5b8 (S_8_5b8)

label define S_8_5b8 0 "false" 1 "true"

*this will be changed to 7 t align with word
encode S_8_5b8, gen (s_8_5b7) label (S_8_5b8)

drop S_8_5b8

rename s_8_5b9 (S_8_5b9)

label define S_8_5b9 0 "false" 1 "true"

*this will be changed t 8 to align with word
encode S_8_5b9, gen (s_8_5b8) label (S_8_5b9)

drop S_8_5b9

rename s_8_5b10 (S_8_5b10)

label define S_8_5b10 0 "false" 1 "true"

*this will be changed to 9 to align with word
encode S_8_5b10, gen (s_8_5b9) label (S_8_5b10)

drop S_8_5b10

rename s_9_38a (S_9_38a)

label define S_9_38a 0 "false" 1 "true"

encode S_9_38a, gen (s_9_38a) label (S_9_38a)

drop S_9_38a

rename s_9_38g (S_9_38g)

label define S_9_38g 0 "false" 1 "true"

encode S_9_38g, gen (s_9_38g) label (S_9_38g)

drop S_9_38g

rename s_9_38b (S_9_38b)

label define S_9_38b 0 "false" 1 "true"

encode S_9_38b, gen (s_9_38b) label (S_9_38b)

drop S_9_38b

rename s_9_38f (S_9_38f)

label define S_9_38f 0 "false" 1 "true"

encode S_9_38f, gen (s_9_38f) label (S_9_38f)

drop S_9_38f

rename s_9_38c (S_9_38c)

label define S_9_38c 0 "false" 1 "true"

encode S_9_38c, gen (s_9_38c) label (S_9_38c)

drop S_9_38c

rename s_9_38d (S_9_38d)

label define S_9_38d 0 "false" 1 "true"

encode S_9_38d, gen (s_9_38d) label (S_9_38d)

drop S_9_38d

rename s_9_38j (S_9_38j)

label define S_9_38j 0 "false" 1 "true"

encode S_9_38j, gen (s_9_38j) label (S_9_38j)

drop S_9_38j

rename s_9_38e (S_9_38e)

label define S_9_38e 0 "false" 1 "true"

encode S_9_38e, gen (s_9_38e) label (S_9_38e)

drop S_9_38e

rename s_9_38k (S_9_38k)

label define S_9_38k 0 "false" 1 "true"

encode S_9_38k, gen (s_9_38k) label (S_9_38k)

drop S_9_38k

rename s_9_38h (S_9_38h)

label define S_9_38h 0 "false" 1 "true"

encode S_9_38h, gen (s_9_38h) label (S_9_38h)

drop S_9_38h

rename s_9_38l (S_9_38l)

label define S_9_38l 0 "false" 1 "true"

encode S_9_38l, gen (s_9_38l) label (S_9_38l)

drop S_9_38l

rename s_9_38i (S_9_38i)

label define S_9_38i 0 "false" 1 "true"

encode S_9_38i, gen (s_9_38i) label (S_9_38i)

drop S_9_38i

rename s_14_2a_p (S_14_2a_P)

label define S_14_2a_P 0 "false" 1 "true"

encode S_14_2a_P, gen (s_14_2a_p) label (S_14_2a_P)

drop S_14_2a_P

rename s_14_1b_p (S_14_1b_P)

label define S_14_1b_P 0 "false" 1 "true"

encode S_14_1b_P, gen (s_14_2b_p) label (S_14_1b_P) 
*we renamed this because it was incorrect in the DD and tablet

drop S_14_1b_P

rename s_14_2c_p (S_14_2c_P)

label define S_14_2c_P 0 "false" 1 "true"

encode S_14_2c_P, gen (s_14_2c_p) label (S_14_2c_P)

drop S_14_2c_P

rename s_14_2d_p (S_14_2d_P)

label define S_14_2d_P 0 "false" 1 "true"

encode S_14_2d_P, gen (s_14_2d_p) label (S_14_2d_P)

drop S_14_2d_P

rename s_14_2e_p (S_14_2e_P)

label define S_14_2e_P 0 "false" 1 "true"

encode S_14_2e_P, gen (s_14_2e_p) label (S_14_2e_P)

drop S_14_2e_P

rename s_14_2f_p (S_14_2f_P)

label define S_14_2f_P 0 "false" 1 "true"

encode S_14_2f_P, gen (s_14_2f_p) label (S_14_2f_P)

drop S_14_2f_P

rename s_14_2g_p (S_14_2g_P)

label define S_14_2g_P 0 "false" 1 "true"

encode S_14_2g_P, gen (s_14_2g_p) label (S_14_2g_P)

drop S_14_2g_P

rename s_14_2h_p (S_14_2h_P)

label define S_14_2h_P 0 "false" 1 "true"

encode S_14_2h_P, gen (s_14_2h_p) label (S_14_2h_P)

drop S_14_2h_P

rename s_14_2i_p (S_14_2i_P)

label define S_14_2i_P 0 "false" 1 "true"

encode S_14_2i_P, gen (s_14_2i_p) label (S_14_2i_P)

drop S_14_2i_P

rename s_14_2j_p (S_14_2j_P)

label define S_14_2j_P 0 "false" 1 "true"

encode S_14_2j_P, gen (s_14_2j_p) label (S_14_2j_P)

drop S_14_2j_P

rename s_14_2a_d (S_14_2a_D)

label define S_14_2a_D 0 "false" 1 "true"

encode S_14_2a_D, gen (s_14_2a_d) label (S_14_2a_D)

drop S_14_2a_D

rename s_14_2b_d (S_14_2b_D)

label define S_14_2b_D 0 "false" 1 "true"

encode S_14_2b_D, gen (s_14_2b_d) label (S_14_2b_D)

drop S_14_2b_D

rename s_14_2c_d (S_14_2c_D)

label define S_14_2c_D 0 "false" 1 "true"

encode S_14_2c_D, gen (s_14_2c_d) label (S_14_2c_D)

drop S_14_2c_D

rename s_14_2d_d (S_14_2d_D)

label define S_14_2d_D 0 "false" 1 "true"

encode S_14_2d_D, gen (s_14_2d_d) label (S_14_2d_D)

drop S_14_2d_D

rename s_14_2e_d (S_14_2e_D)

label define S_14_2e_D 0 "false" 1 "true"

encode S_14_2e_D, gen (s_14_2e_d) label (S_14_2e_D)

drop S_14_2e_D

rename s_14_2f_d (S_14_2f_D)

label define S_14_2f_D 0 "false" 1 "true"

encode S_14_2f_D, gen (s_14_2f_d) label (S_14_2f_D)

drop S_14_2f_D

rename s_14_2g_d (S_14_2g_D)

label define S_14_2g_D 0 "false" 1 "true"

encode S_14_2g_D, gen (s_14_2g_d) label (S_14_2g_D)

drop S_14_2g_D

*dealing with comment legal fields

label define S_0 .a "." 0 "hombre" 1 "mujer"

label values s_0 S_0


label define S_2_9a_ .a"." 0 "No ha completado ninguna educación" 1 "educación pre-primaria (jardín de infantes, guarderia, maternal, pre-escolar)" 2 "primaria" 3 "intermedio" 4 "secundaria" 5 "educación terciaria (ej grado asociado o carrera técnica)" 6 "educación universitaria o superior" 8 "no responde" 9 "no sabe"

label values s_2_9a S_2_9a_


label define S_3_11_ .a"." 1 "profesional ejecutivo" 2 "oficinista" 3 "vendedor minorista" 4 "agricultor independiente" 5 "trabajador agrícola" 6 "trabajador domestico" 7 "otros servicios" 8 "trabajador especializado" 9 "trabajador no especializado" 10 "trabajos informales" 11 "otros" 12 "no trabajó" 13 "no tenía padre o tutor" 88 "no responde" 99 "no sabe"

label values s_3_11 S_3_11_


label define S_6_7_ .a"." 1 "usted estaba enfermo?" 2 "usted extranaba a su familia?" 3 "le fue dificil permanecer en el extranjero?" 4 "era muy caro quedarse en el extranjero?" 5 "no ganaba suficiente allá?" 6 "tuvo problemas relacionados con migración?" 7 "tuvo problemas familiares aqui?" 8 "otra" 88 "no responde" 99 "no sabe"

label values s_6_7 S_6_7_

*reorder

order pid globalrecordid pid2 s_interid s_houseid s_particid s_clustid s_country s_houseid2 s_conglid2 s_particid2 s_0 s_deviceid1 s_1_1_p s_1_1_d s_1_1_c s_1_2 s_2_3 s_2_8c s_2_9 s_2_9a s_2_10 s_2_11 s_2_12 s_2_13 s_2_14_p s_2_14_d s_2_14_c s_2_15_p s_2_15_d s_2_15_c s_2_16 s_3_0 s_3_1_p s_3_1_d s_3_1_c s_3_2 s_3_3_p s_3_3_d s_3_3_c s_3_4 s_3_5 s_3_6 s_3_7 s_3_8 s_3_9 s_3_11 s_3_12_1 s_3_12_2 s_3_12_3 s_3_12_6 s_3_12_8 s_3_13 s_3_17 s_3_18 s_3_19_1 s_3_19_2 s_4_1 s_4_2 s_4_3 s_4_6 s_4_7 s_4_8 s_4_11 s_4_12 s_4_13 s_4_16 s_4_17 s_4_18 s_4_20 s_4_21 s_4_22 s_4_23_1 s_4_23_2 s_4_26 s_4_27_1 s_4_27_2 s_4_27a s_4_28 s_4_29_1 s_4_29_2 s_4_29a s_5_1 s_5_2 s_5_3 s_5_4 s_5_5 s_6_1 s_6_2 s_6_3 s_6_4 s_6_5_p s_6_5_d s_6_5_c s_6_6 s_6_7 s_7_0 s_7_1 s_7_2a s_7_2b s_7_2c s_7_3 s_7_4a s_7_4b s_7_4c s_7_5a s_7_5b s_7_5c s_7_6a s_7_6b s_7_7a s_7_7b s_7_7c s_7_7d s_7_7e s_7_7f s_7_7g s_7_7h s_7_7i s_7_7j s_7_7k s_8_1 s_8_2 s_8_3 s_8_3a s_8_4 s_8_5a s_8_5b2 s_8_5b1 s_8_5b4 s_8_5b3 s_8_5b5 s_8_5b6 s_8_5b7 s_8_5b8 s_8_5b9 s_8_5c s_8_5d s_8_7 s_8_8 s_8_9 s_8_10 s_8_11 s_8_12 s_8_13 s_8_14 s_8_15 s_8_16 s_9_1 s_9_3 s_9_4 s_9_5 s_9_6 s_9_7 s_9_8 s_9_9 s_9_11 s_9_13 s_9_14 s_9_15 s_9_16 s_9_17 s_9_18 s_9_19 s_9_20 s_9_21a s_9_21b s_9_22 s_9_23 s_9_24 s_9_25 s_9_26 s_9_28 s_9_29 s_9_30 s_9_31 s_9_32 s_9_33 s_9_35 s_9_36 s_9_37 s_9_38a s_9_38g s_9_38b s_9_38f s_9_38c s_9_38d s_9_38j s_9_38e s_9_38k s_9_38h s_9_38l s_9_38i s_9_39 s_9_40 s_9_41 s_9_42 s_9_43a s_9_44 s_9_45a s_9_46 s_9_47 s_9_48 s_9_49 s_9_50 s_9_51 s_9_52 s_9_53 s_9_54 s_9_55 s_9_56 s_9_57 s_9_58 s_9_59 s_9_60 s_9_61 s_9_61a s_9_62 s_9_63 s_9_64_1 s_9_64_2 s_9_64_3 s_9_64_4 s_9_65 s_9_66 s_10_1a s_10_1b s_10_1c s_10_1d s_10_1e s_10_1f s_10_1g s_10_1h s_10_2 s_10_3 s_10_4 s_10_5 s_10_6_1 s_10_6_1a s_10_6_2 s_10_6_2a s_10_6_3 s_10_6_3a s_10_6_4 s_10_6_4a s_10_7_1 s_10_7_2 s_11_1 s_11_2 s_11_3 s_12_1a s_12_1b s_12_1c s_12_2a s_12_2c s_12_3a s_12_3c s_12_4a s_12_4b s_12_4c s_12_5a s_12_5c s_12_6a s_12_6c s_12_7 s_12_8 s_12_9 s_12_10 s_12_11 s_12_13 s_12_14 s_12_15 s_12_16 s_13_1_p_c s_13_1_d s_13_2 s_13_3_p_c s_13_3_d s_13_4 s_13_5 s_13_6_p_c s_13_6_d s_13_7_p_c s_13_7_d s_13_8 s_13_9 s_13_10 s_13_11 s_13_12 s_13_13 s_13_14 s_13_15 s_13_16 s_13_17 s_13_18 s_13_19 s_13_20 s_13_22 s_13_23_p s_13_23_d_c s_13_24 s_13_25_d_c s_13_25_p s_13_26 s_13_27_d_c s_13_27_p s_13_28 s_13_29 s_13_30_d_c s_13_30_p s_14_1_p_d s_14_2a_p s_14_2b_p s_14_2c_p s_14_2d_p s_14_2e_p s_14_2f_p s_14_2g_p s_14_2h_p s_14_2i_p s_14_2j_p s_14_2a_d s_14_2b_d s_14_2c_d s_14_2d_d s_14_2e_d s_14_2f_d s_14_2g_d s_14_3 s_14_4 s_14_5 s_14_6 s_14_8 s_14_9 s_14_11 s_14_12 s_14_13 s_14_14 s_14_15 s_14_16 s_14_17 s_14_18_1 s_14_18_2 s_14_18_3 s_14_18_4 s_14_18_5 s_14_18_6 s_14_20 s_14_22 s_14_23 s_14_24 s_14_25 s_14_30a s_14_30b1_p s_14_30b1_d s_14_30b1_c s_14_30b2_p s_14_30b2_d s_14_30b2_c s_14_30b3_p s_14_30b3_d s_14_30b3_c s_14_31 s_14_32 s_14_33 s_15_1 s_15_2 s_15_3 s_deviceid2

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

label variable s_interid "Número del entrevistador:"

label variable s_houseid "Número de la casa:"

label variable s_particid "Número del participante:"

label variable s_clustid "Número del conglomerado:"

label variable s_country "Pais"

label variable s_houseid2 "NÚMERO DE LA CASA"

label variable s_conglid2 "NUMERO DEL CLUSTER:"

label variable s_particid2 "NUMERO DEL PARTICIPANTE"

label variable s_0 "¿Es hombre o mujer?"

label variable s_deviceid1 "Device ID:"

label variable s_1_1_p "1.1 De tener que clasificar al participante en una de las siguientes categorías, ¿en qué categoría le clasificaría? * Trigueño se refiere a la mezcla de blanco y negro. Mestizo se refiere a la mezcla de indio y blanco"

label variable s_1_1_d "1.1 De tener que clasificar al participante en una de las siguientes categorías, ¿en qué categoría le clasificaría?"

label variable s_1_1_c "1.1 De tener que clasificar al participante en una de las siguientes categorías, ¿en qué categoría le clasificaría?"

label variable s_1_2 "1.2 Como usted sabe, los seres humanos muestran una gran variedad de color de piel. En la imagen aparece una escala de color de piel que varía entre 1 (el color más claro) y 11 (el color más oscuro). Por favor observa el color de la cara del participante e indique qué número representa su color más cercano según la TARJETA DE COLORES."

label variable s_2_3 "2.3 Edad que dice el documento oficial: ____ [999 = No hay documentación]"

label variable s_2_8c "2.8c ¿Cuántos años de educación ha completado (excluyendo pre-primaria)? Años ____ No responde............88 No sabe.....................99"

label variable s_2_9 "2.9 ¿Está casado actualmente?"

label variable s_2_9a "2.9a ¿Cuál es el título o nivel escolar más alto que su esposo/a o ex-esposo/a ha completado?"

label variable s_2_10 "2.10 ¿Cuántos hijos has tenido [engendrado / dar a luz]? Por favor no cuente abortos espontáneos o nacimientos muertos o adoptados o hijastros para esta pregunta No responde............88 No sabe.....................99"

label variable s_2_11 "2.11 ¿Es miembro de algún grupo religioso?"

label variable s_2_12 "2.12 ¿Aproximadamente, con qué frecuencia asistió a servicios religiosos durante el año pasado?"

label variable s_2_13 "2.13 ¿Asiste a reuniones de grupos comunitarios o sociales tales como clubes, conferencias o similares?"

label variable s_2_14_p "2.14 De tener que clasificarse en una de las siguientes categorías, ¿en qué categoría se clasificaría usted? ¿Negro(a),mulato(a), trigueño(a), blanco(a), mestizo(a) u otra categoría? * Trigueño se refiere a la mezcla de blanco y negro. Mestizo se refiere a la mezcla de indio y blanco"

label variable s_2_14_d "2.14 De tener que clasificarse en una de las siguientes categorías, ¿en qué categoría se clasificaría usted? ¿Negro(a), mulato(a), blanco(a), indio(a) u otra categoría?"

label variable s_2_14_c "2.14 De tener que clasificarse en una de las siguientes categorías, ¿en qué categoría se clasificaría usted? ¿Negro(a), mulato(a), blanco(a), mestizo(a) u otra categoría?"

label variable s_2_15_p "2.15 Si estuviera caminando por la calle, ¿en qué categoría cree que otra gente que no lo conoce personalmente asumirían automáticamente que es usted, según su apariencia?"

label variable s_2_15_d "2.15 Si estuviera caminando por la calle, ¿en qué categoría cree que otra gente que no lo conoce personalmente asumirían automáticamente que es usted, según su apariencia?"

label variable s_2_15_c "2.15 Si estuviera caminando por la calle, ¿en qué categoría cree que otra gente que no lo conoce personalmente asumirían automáticamente que es usted, según su apariencia?"

label variable s_2_16 "2.16 Como usted sabe, los seres humanos muestran una gran variedad de color de piel. En la imagen aparece una escala de color de piel que varía entre 1 (el color más claro) y 11 (el color más oscuro). Por favor indique qué número representa su color más cercano el color de su cara. MUESTRA TARJETA DE COLORES"

label variable s_3_0 "3.0 ¿Qué tiempo usted ha vivido en esta ciudad/pueblo/distrito? codifique en años (1 año o menos = 0)"

label variable s_3_1_p "3.1 ¿Dónde nació?"

label variable s_3_1_d "3.1 ¿Dónde nació?"

label variable s_3_1_c "3.1 ¿Dónde nació?"

label variable s_3_2 "3.2 ¿Dónde nació?"

label variable s_3_3_p "3.3 ¿En qué municipio nació?"

label variable s_3_3_d "3.3 ¿En qué provincia nació?"

label variable s_3_3_c "3.3 ¿En qué provincia nació?"

label variable s_3_4 "3.4 ¿Dónde vivió la mayor parte del tiempo entre las edades de 20 y 60?"

label variable s_3_5 "3.5 ¿Dónde ha vivido la mayor parte del tiempo desde que cumplió los 60?"

label variable s_3_6 "3.6 ¿Puede leer un periódico?"

label variable s_3_7 "3.7 ¿Podría escribir una carta si lo necesitase?"

label variable s_3_8 "3.8 ¿Cómo le fue en matemáticas en comparación con otros niños de su clase?"

label variable s_3_9 "3.9 ¿Qué tan bien le fue en lectura y escritura en comparación con otros niños de su clase?"

label variable s_3_11 "3.11 (Antes de cumplir 10 años), ¿qué tipo de trabajo realizó su padre o tutor la mayor parte del tiempo…"

label variable s_3_12_1 "3.12.1 ¿Su vivienda tenía el sanitario dentro de la vivienda?"

label variable s_3_12_2 "3.12.2 ¿Su vivienda tenía electricidad?"

label variable s_3_12_3 "3.12.3 ¿Tuvo su familia problemas económicos que no le permitieran comer regularmente, vestirse adecuadamente, o tener el cuidado médico necesario?"

label variable s_3_12_6 "3.12.6 ¿Usted o algún miembro de su familia dormía en el mismo cuarto que se usaba para cocinar?"

label variable s_3_12_8 "3.12.8 ¿Alguno de sus padres o tutores fumaba?"

label variable s_3_13 "3.13 (Antes de cumplir 16 años), ¿comparado con otros niños de su edad, ¿cómo era su condición de salud?"

label variable s_3_17 "3.17 ¿Ha experimentado alguna vez un desastre natural (por ejemplo, un terremoto, un huracán) que lo haya desplazado de su hogar durante al menos una semana?"

label variable s_3_18 "3.18 ¿Qué edad tenía usted cuando sucedió esto por última vez? REGISTRA EDAD NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_3_19_1 "NÚMERO: NO RESPONDE...........................88 NO SABE ....................................99"

label variable s_3_19_2 "Indique si fue año, mes, semana, o dia"

label variable s_4_1 "4.1. ¿Cuál es el título o nivel escolar más alto que su madre completo?"

label variable s_4_2 "4.2 [SOLO PREGUNTA SI AUN NO ES CLARO] ¿Vive actualmente su madre"

label variable s_4_3 "4.3 ¿Qué edad tiene su madre? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_6 "4.6 ¿Qué edad tenía su madre cuando murió? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_7 "4.7 ¿Qué edad tenía usted cuando su madre murió? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_8 "4.8 ¿Su madre tiene o tuvo demencia, senilidad o cualquier otro deterioro grave de la memoria?"

label variable s_4_11 "4.11. ¿Cuál es el título o nivel escolar más alto que su padre completo?"

label variable s_4_12 "4.12 [SOLO PREGUNTA SI AUN NO ES CLARO] ¿Vive actualmente su padre?"

label variable s_4_13 "4.13 ¿Qué edad tiene su padre? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_16 "4.16 ¿Qué edad tenía su padre cuando murió? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_17 "4.17 ¿Qué edad tenía Usted cuando su padre murió? NO RESPONDE………………………888 NO SABE ………………………………999"

label variable s_4_18 "4.18 ¿Su padre tiene o tuvo demencia, senilidad o cualquier otro deterioro grave de la memoria?"

label variable s_4_20 "4.20 ¿Cuántos hermanos y hermanas vivos tiene Usted? NO RESPONDE……………………………….88 NO SABE ………………………………………..99"

label variable s_4_21 "4.21 Durante el último año, ¿generalmente pasó usted por lo menos una hora a la semana ayudando a alguien con actividades básicas como vestirse, comer, o bañarse debido a un problema de salud? Excluya ayuda con actividades del hogar, mandados, transporte."

label variable s_4_22 "4.22 ¿Quién recibió ese apoyo?"

label variable s_4_23_1 "4.23.1 NÚMERO DE HORAS: NO RESPONDE............ 88 NO SABE ...................... 99"

label variable s_4_23_2 "4.23.2 POR PERIODO"

label variable s_4_26 "4.26 En el último año, ¿usted ha pasado por lo menos una hora a la semana ayudando a sus hijos/nuera/yerno/nietos? Por favor, no incluya la ayuda con actividades básicas ya mencionada antes."

label variable s_4_27_1 "4.27.1 NÚMERO DE HORAS: NO RESPONDE............ 88 NO SABE ...................... 99"

label variable s_4_27_2 "4.27.2 POR PERIODO"

label variable s_4_27a "4.27a ¿Diría usted que fueron…"

label variable s_4_28 "4.28 En el último año, ¿le han dedicado sus hijos/nuera/yerno/nietos por lo menos 1 hora a la semana para ayudarle a usted con quehaceres del hogar, mandados, transporte?"

label variable s_4_29_1 "4.29.1 NÚMERO DE HORAS NO RESPONDE............ 888 NO SABE ...................... 999"

label variable s_4_29_2 "4.29.2 POR PERIODO"

label variable s_4_29a "4.29a ¿Diría usted que fueron…"

label variable s_5_1 "5.1 En el último año, ¿siempre ha tenido suficiente dinero para comprar la comida que necesita?"

label variable s_5_2 "5.2 Después de cumplir 18 años, ¿alguna vez ha experimentado dificultades económicas severas (como problemas para comprar alimentos)?"

label variable s_5_3 "5.3 ¿Por cuantos años? Años |__|__| Menos de un año ………0 No responde…………….88 No sabe………………….99"

label variable s_5_4 "5.4 Indicar en el peldaño de la escalera donde se colocaría a usted mismo. Número [ ]"

label variable s_5_5 "5.5 Cuando nació, ¿dónde colocaría a sus padres en esta escalera? Número [ ]"

label variable s_6_1 "6.1 Sin contar vacaciones o visitas cortas, ¿alguna vez ha trabajado o vivido usted en los Estados Unidos?"

label variable s_6_2 "6.2 En total, aproximadamente, ¿por cuántos años ha vivido usted en Estados Unidos? 12 MESES O MENOS……………………….01 NO RESPONDE……………………………….88 NO SABE ………………………………………..99"

label variable s_6_3 "6.3 Sin contar vacaciones o visitas cortas, ¿alguna vez ha vivido usted en otro país, que no sea los Estados Unidos?"

label variable s_6_4 "6.4 En total, aproximadamente, ¿por cuántos años ha trabajado o vivido usted en el extranjero que no sea Estados Unidos? 12 MESES O MENOS............................01 NO RESPONDE.....................................88 NO SABE ...............................................99"

label variable s_6_5_p "6.5 ¿En qué país ha pasado más tiempo?"

label variable s_6_5_d "6.5 ¿En qué país ha pasado más tiempo?"

label variable s_6_5_c "6.5 ¿En qué país ha pasado más tiempo?"

label variable s_6_6 "6.6 Ahora piense acerca de la última vez que trabajó o vivió en el extranjero, ¿qué edad tenía usted cuando regresó o llegó a este país? NO RESPONDE……………. 888 NO SABE …………………….. 999"

label variable s_6_7 "6.7 ¿En esa última vez que vino del extranjero, cuál diría usted que fue la razón principal por la que vino…"

label variable s_7_0 "7.0 En general ¿Cómo se siente con su vida?"

label variable s_7_1 "[SOLO PREGUNTA SI AUN NO ES CLARO] 7.1 Tiene hijos que no conviven con usted?"

label variable s_7_2a "7.2a Reunirse (incluir reuniones organizadas y casuales)"

label variable s_7_2b "7.2b Hablar por teléfono"

label variable s_7_2c "7.2c Comunicar por escrito en papel o internet (correo electrónico, WhatsApp, Skype, Facebook u otro redes social)"

label variable s_7_3 "7.3 ¿Con cuántos de sus hijos diría usted que tiene una relación cercana? NO APLICA (no tiene hijos).77 NO RESPONDE...................... 88"

label variable s_7_4a "7.4a Reunirse (incluir reuniones organizadas y casuales)"

label variable s_7_4b "7.4b Hablar por teléfono"

label variable s_7_4c "7.4c Comunicar por escrito en papel o internet (correo electrónico, WhatsApp, Skype, Facebook u otro redes social)"

label variable s_7_5a "7.5a siente que le falta compañía?"

label variable s_7_5b "7.5b se siente ignorado por los demás?"

label variable s_7_5c "7.5c se siente aislado, apartado de los demás?"

label variable s_7_6a "7.6a Usted es tratado con menos cortesía o respeto que otras personas"

label variable s_7_6b "7.6b Recibe un servicio o tratamiento más pobre que otras personas de médicos u hospitales."

label variable s_7_7a "Su ascendencia u origen nacional"

label variable s_7_7b "Su género"

label variable s_7_7c "Su raza"

label variable s_7_7d "Su religión"

label variable s_7_7e "Su peso"

label variable s_7_7f "Una discapacidad física"

label variable s_7_7g "Una discapacidad mental / demencia"

label variable s_7_7h "Un aspecto de su apariencia física"

label variable s_7_7i "Su orientación sexual"

label variable s_7_7j "Su estatus financiero"

label variable s_7_7k "Otro"

label variable s_8_1 "8.1 [SOLO PREGUNTA SI AUN NO ES CLARO] ¿Alguna vez ha tenido un empleo?"

label variable s_8_2 "8.2 ¿Cómo cuánto tiempo en total ha trabajado (trabajo) recibiendo pago o ganancia a lo largo de su vida? Registra años No responde.............................888 No sabe......................................999"

label variable s_8_3 "8.3 ¿Cual fue (ha sido) el trabajo de mayor duración …"

label variable s_8_3a "8.3a Cual fue su ocupación principal?"

label variable s_8_4 "8.4 En ese trabajo de mayor duración, la mayor parte del tiempo ¿usted ha sido (era)..."

label variable s_8_5a "8.5a Actualmente usted:"

label variable s_8_5b2_delete "Se dedica a los quehaceres del hogar"

label variable s_8_5b1 "Se dedica a los quehaceres del hogar"

label variable s_8_5b3 "Edad avanzada"

label variable s_8_5b2 "Está pensionado(a) o jubilado(a)"

label variable s_8_5b4 "Está enfermo(a) o con incapacidad temporal"

label variable s_8_5b5 "Está incapacitado(a) para trabajar por el resto de su vida "

label variable s_8_5b6 "No tiene clientes/no encuentra trabajo"

label variable s_8_5b7 "Necesidad de proporcionar cuidado familiar"

label variable s_8_5b8 "No Responde"

label variable s_8_5b9 "No Sabe"

label variable s_8_5c "8.5c ¿Hace cuántos años dejó usted el último trabajo que tuvo? Años ____ No responde……………..88 No sabe……………………..99"

label variable s_8_5d "8.5d ¿Cual es su trabajo ahora:"

label variable s_8_7 "8.7 ¿Alguna vez ha tenido un trabajo que requiera que trabaje con frecuencia durante la noche?"

label variable s_8_8 "8.8 En una semana típica, ¿cuántos turnos de noche trabajaría? No responde…………………. 8 No sabe………………………….. 9"

label variable s_8_9 "8.9 ¿Durante cuántos años estuvo en un trabajo que requirió este trabajo nocturno? No responde…………………. 8 No sabe………………………….. 9"

label variable s_8_10 "8.10 El trabajo de usted requirió mucha concentración o atención."

label variable s_8_11 "8.11 El trabajo de usted fue interesante y agradable."

label variable s_8_12 "8.12 El trabajo de usted implicaba mucho estrés."

label variable s_8_13 "8.13 Realmente disfrutaba ir a trabajar."

label variable s_8_14 "8.14 El trabajo era físicamente exigente."

label variable s_8_15 "8.15 En el trabajo, sentía que tenía control sobre lo que sucedía en la mayoría de las situaciones."

label variable s_8_16 "8.16 ¿Cuál fue (ha sido) el trabajo de mayor duración de su esposo/exesposo [el último si hay mas que uno/a exesposos]"

label variable s_9_1 "9.1 Ahora tengo algunas preguntas sobre su salud, ¿diría usted que su salud es..."

label variable s_9_3 "9.3 Problemas de la visión Si afirmativo, cuánto interfiere en sus actividades; para nada, un poco a mucho?"

label variable s_9_4 "9.4 Dificultad auditiva o sordera Si afirmativo, cuánto interfiere con sus actividades; para nada, un poco o mucho?"

label variable s_9_5 "9.5 ¿Le han dicho alguna vez que tenía asma?"

label variable s_9_6 "9.6 ¿Cuántos años tenía cuando se lo dijeron por primera vez? Registra años de edad No responde...................... 888 No sabe................................ 999"

label variable s_9_7 "9.7 ¿Aún sufre de asma?"

label variable s_9_8 "9.8 ¿Le han dicho alguna vez que tenía hipertensión?"

label variable s_9_9 "9.9 ¿Cuántos años tenia cuando se lo dijeron por primera vez? Registra años de edad o Registra año No responde...................... 888 No sabe................................ 999"

label variable s_9_11 "9.11 ¿Está Ud tomando medicamentos para controlar su hipertensión?"

label variable s_9_13 "9.13 ¿Cuándo fue la última vez que usted se midió la presión arterial?"

label variable s_9_14 "9.14 ¿Le ha dicho un médico alguna vez que tenía un trastorno cardíaco?"

label variable s_9_15 "9.15 ¿Cuándo fue la primera vez?"

label variable s_9_16 "9.16 ¿Qué le dijo el doctor que era?"

label variable s_9_17 "9.17 ¿Ha tenido alguna vez una apoplejía (isquemia) cerebral que necesitase atención médica? ¿Qué sucedió?(Asignar sólo si hay historia clara de aparición súbita de parálisis unilateral, y/o pérdida del habla, y/o ceguera que durase al menos 2 días)"

label variable s_9_18 "9.18 ¿Quién diagnosticó este ataque isquémico cerebral?"

label variable s_9_19 "9.19 ¿Ha experimentado alguna vez debilidad repentina de un miembro, pérdida del habla o ceguera parcial que mejoró rápidamente, en menos de un día? (Los médicos les llaman algunas veces ATI a estos ataques)"

label variable s_9_20 "9.20 ¿Ha tenido alguna vez un golpe en la cabeza, una lesión en la cabeza o un traumatismo en la cabeza que fue lo suficientemente grave como para requerir atención médica, para causar pérdida del conocimiento o pérdida de la memoria durante un período de tiempo?"

label variable s_9_21a "9.21a Numero:"

label variable s_9_21b "9.21b Horas o minutos?"

label variable s_9_22 "9.22 ¿Qué edad tenía en ese momento? Si había incidentes múltiples, por favor refiere el primero incidente. Registra años de edad No responde...................... 888 No sabe................................ 999"

label variable s_9_23 "9.23 ¿Le han dicho alguna vez que tenía diabetes?"

label variable s_9_24 "9.24 ¿La diabetes solo estuvo presente durante el embarazo?"

label variable s_9_25 "9.25 ¿A qué edad le dijeron por primera vez que tenía diabetes? Si había incidentes múltiples, por favor refiere el peor incidente. Registra años de edad No responde...................... 888 No sabe................................ 999"

label variable s_9_26 "9.26 ¿Necesita una dieta especial, toma tabletas o se inyecta insulina?"

label variable s_9_28 "9.28 ¿Con que frecuencia se mide usted mismo el nivel de azúcar en la sangre?"

label variable s_9_29 "9.29 ¿Cada cuánto tiempo visita un médico para su diabetes?"

label variable s_9_30 "9.30 Le han dicho alguna vez que tiene el colesterol/ triglicéridos/ las grasas en su sangre, altas, elevadas?"

label variable s_9_31 "9.31 ¿Qué edad tenía en ese momento? Si había incidentes múltiples, por favor refiere el primero incidente. Registra años de edad No responde...................... 888 No sabe................................ 999"

label variable s_9_32 "9.32 Necesita usted una dieta especial para el colesterol?"

label variable s_9_33 "9.33 ¿Está tomando actualmente medicamentos para controlar su colesterol?"

label variable s_9_35 "9.35 ¿Hace cuánto tiempo se midió el colesterol por última vez?"

label variable s_9_36 "9.36 Durante el último año, ¿cuántas veces se ha caído sin razón aparente? Registra el número de caídas No responde...................88 No sabe ...........................99"

label variable s_9_37 "9.37 ¿Alguna vez un médico le dijo que tiene cáncer o tumor maligno, excluyendo pequeños tumores en la piel?"

label variable s_9_38a "Estómago"

label variable s_9_38g "Próstata"

label variable s_9_38b "Otros digestivos"

label variable s_9_38f "Otros respiratorios"

label variable s_9_38c "Sistema urinario"

label variable s_9_38d "Leucemia"

label variable s_9_38j "Otro"

label variable s_9_38e "Pulmón"

label variable s_9_38k "No Responde"

label variable s_9_38h "Útero / cervix"

label variable s_9_38l "No Sabe"

label variable s_9_38i "Mama"

label variable s_9_39 "9.39 ¿Alguna vez ha recibido quimioterapia o radioterapia?"

label variable s_9_40 "9.40 ¿Le faltan algunos dientes o muelas naturales?"

label variable s_9_41 "9.41 Ha tenido usted accidentes de orina? Se le sale la orina, (los pipis) si no puede usted llegar rápido al baño?"

label variable s_9_42 "9.42 ¿Le han dicho alguna vez que tenia enfermedad de Parkinson?"

label variable s_9_43a "9.43a ¿Cuántos años tenia cuando se lo dijeron por primera vez? No responde...................... 888 No sabe................................ 999"

label variable s_9_44 "9.44 ¿Alguna vez un médico le ha dicho que tiene demencia o Alzheimer?"

label variable s_9_45a "9.45a ¿Cuántos años tenia cuando se lo dijeron por primera vez? No responde...................... 888 No sabe................................ 999"

label variable s_9_46 "9.46 ¿El médico le recetó /prescribió alguna medicina?"

label variable s_9_47 "9.47 ¿Ha habido momentos en su vida antes del año pasado en los que padeció síntomas de tristeza, sentimientos vacíos, deprimido, o ha perdido interés en la mayoría de las cosas como el trabajo, pasatiempos, u otras cosas que duraron al menos dos semanas?"

label variable s_9_48 "9.48 ¿Qué edad tenía cuando esto sucedió por primera vez? No responde...................... 888 No sabe................................ 999"

label variable s_9_49 "9.49 ¿Recibió tratamiento de un médico de familia o psiquiatra?"

label variable s_9_50 "9.50 ¿Lo ingresaron en un hospital o sala de psiquiatría?"

label variable s_9_51 "9.51 ¿Examen de audición"

label variable s_9_52 "9.52 ¿Examen de la vista?"

label variable s_9_53 "9.53 ¿Mamografía o radiografía de los senos"

label variable s_9_54 "9.54 ¿Prueba de cáncer de cuello uterino o cérvix (papanicolau)?"

label variable s_9_55 "9.55 ¿Prueba, en sangre, para la próstata?"

label variable s_9_56 "9.56 Prueba rectal, para la próstata?"

label variable s_9_57 "9.57 ¿Qué edad tenía usted cuando empezó su primera menstruación o regla? No responde...................... 88 No sabe................................ 99"

label variable s_9_58 "9.58 [SOLO PREGUNTA SI AUN NO ES CLARO] ¿Ha dado a luz un bebé?"

label variable s_9_59 "9.59 ¿Qué edad tenía usted cuando dio a luz por primera vez (primer bebé)? No responde...................... 88 No sabe................................ 99"

label variable s_9_60 "9.60 ¿Cuántas veces usted ha dado a luz? No responde...................... 88 No sabe................................ 99"

label variable s_9_61 "9.61 ¿Qué edad tenía usted cuando terminó de pasar por su menopausia, es decir, su última menstruación o regla? TODAVÍA MENSTRÚA.........97 No responde......................88 No sabe................................99"

label variable s_9_61a "9.61a ¿Tenía usted..."

label variable s_9_62 "9.62 ¿Le han hecho una histerectomía, es decir una cirugía para quitarle la matriz (útero) y ovarios, o la matriz (útero) solamente?"

label variable s_9_63 "9.63 ¿Ha usado algún anticonceptivo o ha sido esterilizada?"

label variable s_9_64_1 "9.64.1 Píldoras o pastillas"

label variable s_9_64_2 "9.64.2 Inyecciones"

label variable s_9_64_3 "9.64.3 Esterilización"

label variable s_9_64_4 "9.64.4 Otros"

label variable s_9_65 "9.65 ¿A qué edad comenzó a utilizar el primero de los métodos que haya usado? Registra años de edad No responde...................... 88 No sabe................................ 99"

label variable s_9_66 "9.66 ¿Alguna vez ha utilizado hormonas femeninas (estrógenos) en forma de pastillas, parches o crema por 3 años o más para tratar la menopausia?"

label variable s_10_1a "10.1a Se sintió deprimido. ¿Diría si cierto, o no cierto?"

label variable s_10_1b "10.1b Sintió que todo lo que hizo fue un esfuerzo. ¿Diría si o no cierto?"

label variable s_10_1c "10.1c Su sueño fue inquieto. ¿Diría si o no cierto?"

label variable s_10_1d "10.1d Era usted feliz. ¿Diría si o no cierto?"

label variable s_10_1e "10.1e Se sintió solo. ¿Diría si o no cierto?"

label variable s_10_1f "10.1f Disfrutó la vida. ¿Diría si o no cierto?"

label variable s_10_1g "10.1g Se sintió triste. ¿Diría si o no cierto?"

label variable s_10_1h "10.1h No tenía ganas de hacer nada. ¿Diría si o no cierto?"

label variable s_10_2 "10.2 ¿Con qué frecuencia tiene dificultad para quedarse dormido(a)? ¿diría que…"

label variable s_10_3 "10.3 ¿Con qué frecuencia se despierta durante la noche después de que se quedó dormido? ¿diría que..."

label variable s_10_4 "10.4 ¿Con qué frecuencia se despierta temprano y no puede dormirse nuevamente? ¿diría que..."

label variable s_10_5 "10.5 ¿Con qué frecuencia se siente descansado(a) cuando se despierta en las mañanas?"

label variable s_10_6_1 "10.6.1 Su salud: ¿Esto le hace sentir estresada/o o ansiosa/o?"

label variable s_10_6_1a "10.6.1a ¿Cuánto tiempo ha sentido este estrés o ansiedad?"

label variable s_10_6_2 "10.6.2 Su situación financiera: ¿Esto le hace sentir estresada/o o ansiosa/o?"

label variable s_10_6_2a "10.6.2a ¿Cuánto tiempo ha sentido este estrés o ansiedad?"

label variable s_10_6_3 "10.6.3 Problemas de trabajo: ¿Esto le hace sentir estresada/o o ansiosa/o?"

label variable s_10_6_3a "10.6.3a ¿Cuánto tiempo ha sentido este estrés o ansiedad?"

label variable s_10_6_4 "10.6.4 Relaciones familiares: ¿Esto le hace sentir estresada/o o ansiosa/o?"

label variable s_10_6_4a "10.6.4a ¿Cuánto tiempo ha sentido este estrés o ansiedad?"

label variable s_10_7_1 "10.7.1 Una fuente importante de estrés en mi vida han sido mis hijos."

label variable s_10_7_2 "10.7.2 Pensando en retrospectiva, a menudo me sentía agobiado por la responsabilidad de ser padre."

label variable s_11_1 "11.1 En el mes pasado, ¿con qué frecuencia algún estado de salud le ha causado dolor?"

label variable s_11_2 "11.2 En general, ¿cómo clasificaría la severidad del dolor en el último mes? ¿Diría que es un"

label variable s_11_3 "11.3 Cuando el dolor es más intenso, ¿en qué medida restringe las cosas que hace?"

label variable s_12_1a "12.1a Debido a un problema de salud ¿usted tiene dificultad para caminar de un lado a otro de un cuarto?"

label variable s_12_1b "12.1.b ¿Usa usted equipo o aparatos, tales como bastón, andador ortopédico o silla de ruedas para caminar de un lado a otro de un cuarto?"

label variable s_12_1c "12.1.c ¿Alguien le ayuda a usted para caminar de un lado a otro de un cuarto?"

label variable s_12_2a "12.2a Debido a un problema de salud ¿usted tiene dificultad para bañarse en una ducha?"

label variable s_12_2c "12.2.c ¿Alguien le ayuda a usted para bañarse en una ducha?"

label variable s_12_3a "12.3a Debido a un problema de salud ¿usted tiene dificultad al comer, por ejemplo para cortar su comida?"

label variable s_12_3c "12.3.c ¿Alguien le ayuda a usted al comer, por ejemplo para cortar su comida?"

label variable s_12_4a "12.4a Debido a un problema de salud ¿usted tiene dificultad al acostarse y levantarse de la cama?"

label variable s_12_4b "12.4.b ¿Usa usted equipo o aparatos, tales como bastón, andador ortopédico o silla de ruedas...al acostarse y levantarse de la cama?"

label variable s_12_4c "12.4.c ¿Alguien le ayuda a usted..al acostarse y levantarse de la cama?"

label variable s_12_5a "12.5a Debido a un problema de salud ¿usted tiene dificultad al usar el sanitario, incluyendo subirse y bajarse o ponerse en cuclillas?"

label variable s_12_5c "12.5c ¿Alguien le ayuda a usted al usar el sanitario, incluyendo subirse y bajarse o ponerse en cuclillas?"

label variable s_12_6a "12.6a Debido a un problema de salud ¿usted tiene dificultad cortarse las uñas de los pies?"

label variable s_12_6c "12.6c ¿Alguien le ayuda a usted cortarse las uñas de los pies?"

label variable s_12_7 "12.7 Debido a un problema de salud ¿usted tiene dificultad...en preparar una comida caliente?"

label variable s_12_8 "12.8 Debido a un problema de salud ¿usted tiene dificultad...en hacer compras de alimentos/mandado?"

label variable s_12_9 "12.9 Debido a un problema de salud ¿usted tiene dificultad...en tomar sus medicamentos (si toma alguno o tuviera que tomar alguno)?"

label variable s_12_10 "12.10 Debido a un problema de salud ¿usted tiene dificultad...para manejar su dinero?"

label variable s_12_11 "12.11 ¿Puede usted caminar?"

label variable s_12_13 "12.13 ¿Tiene dificultad para caminar varias cuadras?"

label variable s_12_14 "12.14 ¿Tiene dificultad para subir por las escaleras varios pisos sin descansar?"

label variable s_12_15 "12.15 ¿Tiene dificultad para empujar o halar un objeto grande como un sillón?"

label variable s_12_16 "12.16 Por favor levante y estire sus brazos por encima de sus hombros."

label variable s_13_1_p_c "13.1 ¿Alguna vez ha fumado cigarrillos/cigarros?"

label variable s_13_1_d "13.1 ¿Alguna vez ha fumado cigarros/puros?"

label variable s_13_2 "13.2 ¿Cuántos años tenía cuando comenzó a fumar? Registra edad No responde...................... 888 No sabe................................ 999"

label variable s_13_3_p_c "13.3 ¿Fuma cigarrillos/cigarros actualmente?"

label variable s_13_3_d "13.3 ¿Fuma cigarros/puros actualmente?"

label variable s_13_4 "13.4 [Si ya no fuma] ¿Qué edad tenía cuando dejó de fumar? Registra años de edad o Registra año No responde...................... 888 No sabe................................ 999"

label variable s_13_5 "13.5 ¿Qué tan a menudo fuma usted?"

label variable s_13_6_p_c "13.6 ¿Cuántos cigarrillos/cigarros fuma usted normalmente al día? CIGARILLOS/DÍA..............................|_|_| 87 Y MÁS CIGARILLOS/DÍA..................... 87 NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_6_d "13.6 ¿Cuántos cigarros/puros fuma usted normalmente al día? CIGARILLOS/DÍA..............................|_|_| 87 Y MÁS CIGARILLOS/DÍA..................... 87 NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_7_p_c "13.7 Cuando más fumaba usted, ¿cuántos cigarrillos/cigarros se fumaba en un día? CIGARILLOS/DÍA..............................|_|_| 87 Y MÁS CIGARILLOS/DÍA..................... 87 NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_7_d "13.7 Cuando más fumaba usted, ¿cuántos cigarros/puros se fumaba en un día? CIGARILLOS/DÍA..............................|_|_| 87 Y MÁS CIGARILLOS/DÍA..................... 87 NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_8 "13.8 ¿En toda su vida, ha tomado Ud. al menos 12 vasos o copas de bebidas alcohólicas de cualquier tipo?"

label variable s_13_9 "13.9 ¿Actualmente toma bebidas alcohólicas de cualquier tipo?"

label variable s_13_10 "13.10 ¿Cuántas bebidas alcohólicas toma Ud usualmente? (Instrucciones al entrevistador: 1 botella de ron = 16 bebidas; 1 botella de vino = 7 bebidas) REGISTRA NÚMERO DE BEBIDAS.........|_|_| NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_11 "13.11 Durante el periodo cuando Ud. bebía más alcohol, ¿cuántas bebidas alcohólicas tomaba Ud. en una semana promedio? (Instrucciones al entrevistador: 1 botella de ron = 16 bebidas; 1 botella de vino = 7 bebidas) REGISTRA NÚMERO DE BEBIDAS.........|_|_| NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_12 "13.12 ¿Ha habido un período de varios años en el cual habría dicho que era un bebedor empedernido?"

label variable s_13_13 "13.13 ¿Con qué frecuencia come carne?"

label variable s_13_14 "13.14 ¿Con qué frecuencia come pescado?"

label variable s_13_15 "13.15 ¿Con qué frecuencia come fruta?"

label variable s_13_16 "13.16 ¿Con qué frecuencia come verdura?"

label variable s_13_17 "13.17 ¿Con qué frecuencia toma refresco (por ejemplo – Coca Cola, Fanta, etc)?"

label variable s_13_18 "13.18 Considerando tanto el trabajo como el ocio, ¿diría que es"

label variable s_13_19 "13.19 ¿Ha realizado caminatas de medio kilómetro o más en el último mes? (Que normalmente sería caminata CONTINUA durante al menos 10-15 minutos)"

label variable s_13_20 "13.20 En el último mes, ¿cuántas veces hizo caminatas de medio kilómetro o más? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_22 "13.22 En promedio durante el último año, ¿ha hecho ejercicio o trabajo físico pesado tres veces por semana o más? INCLUYE VARIAS ACTIVIDADES COMO DEPORTES, LABORES CASERAS PESADAS, U OTRO TRABAJO FÍSICO"

label variable s_13_23_p "13.23 ¿Qual es su peso actual? REGISTRA PESO en libras NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_23_d_c "13.23 ¿Qual es su peso actual? Registra peso en kg (si se responde en libras, divida por 2.2) NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_24 "13.24 ¿De acuerdo a estas imágenes, como cree que luce usted actualmente? MUESTRA TARJETA IMAGEN CORPORAL NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_25_d_c "13.25 ¿Cual era su peso a la edad de 25 años? Registra peso en kg (si se responde en libras, divida por 2.2) NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_25_p "13.25 ¿Cual era su peso a la edad de 25 años? REGISTRA PESO en libras NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_26 "13.26 ¿De acuerdo a estas imágenes, como cree que lucía usted en esa época? MUESTRA TARJETA REGISTRA NÚMERO.............................|_|_| NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_27_d_c "13.27 ¿Cuándo fue o ha sido su peso máximo durante su vida (si es mujer, no incluya embarazos)? No aplica si necesita proxy Registra peso en kg (si se responde en libras, divida por 2.2) NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_27_p "13.27 ¿Cuándo fue o ha sido su peso máximo durante su vida (si es mujer, no incluya embarazos)? REGISTRA PESO en libras NO RESPONDE...................................... 888 NO SABE................................................. 999"

label variable s_13_28 "13.28 ¿De acuerdo a estas imágenes, como cree que lucía usted en esa época? MUESTRA TARJETA 'B' NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_29 "13.29 ¿Qué edad tenía cuando alcanzo ese peso maximo? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_13_30_d_c "13.30 ¿En los últimos 6 meses, ha perdido más de 5 kilogramos de peso sin proponérselo?"

label variable s_13_30_p "13.30 ¿En los últimos 6 meses, ha perdido más de 10 libras de peso sin proponérselo?"

label variable s_14_1_p_d "14.1 ¿Tiene usted plan médico?"

label variable s_14_2a_p "Tarjeta del Gobierno, Mi salud o Vital"

label variable s_14_2b_p "Medicare parte A"

label variable s_14_2c_p "Medicare parte B"

label variable s_14_2d_p "Medicare parte D"

label variable s_14_2e_p "Un plan complementario de Medicare"

label variable s_14_2f_p "Un plan advantage de Medicare"

label variable s_14_2g_p "Un plan privado individual de salud"

label variable s_14_2h_p "Otro"

label variable s_14_2i_p "No responde"

label variable s_14_2j_p "No sabe"

label variable s_14_2a_d "SENASA"

label variable s_14_2b_d "SENASA – SUBSIDIADO"

label variable s_14_2c_d "Un plan privado individual de salud"

label variable s_14_2d_d "Un plan privado a través de algún empleador"

label variable s_14_2e_d "Otro"

label variable s_14_2f_d "No responde"

label variable s_14_2g_d "No sabe"

label variable s_14_3 "14.3 ¿En los últimos tres meses ha visitado o consultado un médico general, quiere decir médico primario o médico de familia?"

label variable s_14_4 "14.4 Número total de consultas en los últimos tres meses REGISTRA NÚMERO............................|_|_|_|_| NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_5 "14.5 Típicamente, en cada consulta a su doctor normal, ¿cuánto tiempo emplea en viajar (minutos)? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_6 "14.6 Típicamente, en cada consulta a su doctor normal, ¿cuánto dinero emplea en viajar? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_8 "14.8 Típicamente, en cada consulta a so doctor normal, ¿cuánto tiempo total de esperar a la consulta (minutos)?  NO RESPONDE……………………………….. 888 NO SABE…………………………………………. 999"

label variable s_14_9 "14.9 Típicamente, en cada consulta, ¿cuánto paga? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud] NO RESPONDE……………………………….. 888 NO SABE…………………………………………. 999"

label variable s_14_11 "14.11 En el último año, ¿cómo cuántas veces ha visitado o consultado con un doctor o personal médico? (No incluye estancias hospitalarias) NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_12 "14.12 Incluyendo todas las visitas a doctor o personal médico, ¿cómo cuánto se pagó para estas consultas en el último año? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud. NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_13 "14.13 En el último año, ¿cómo cuántas veces le tuvieron que hacer procedimientos quirúrgicos sin internarse en el hospital? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_14 "14.14 Incluyendo todos los procedimientos quirúrgicos sin internarse en el hospital, ¿cómo cuánto se pagó para estas consultas? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud. No incluya las costos ya mencionados en 14.12.]"

label variable s_14_15 "14.15 En el último año, ¿cómo cuántas veces ha consultado usted a un dentista? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_16 "14.16 Incluyendo todas las consultas con un dentista, ¿cómo cuánto se pagó para estas consultas? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud] NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_17 "14.17 En el último año, ¿pensó alguna vez que tenía un problema serio de salud, pero no fue al doctor?"

label variable s_14_18_1 "14.18.1 Creyó que no le ayudaría a mejorarse"

label variable s_14_18_2 "14.18.2 Creyó que se tardaría mucho en llegar"

label variable s_14_18_3 "14.18.3 No tenía dinero"

label variable s_14_18_4 "14.18.4 No quiso molestar a alguien para que lo llevara"

label variable s_14_18_5 "14.18.5 Le dio miedo saber lo que el doctor iba a encontrarle"

label variable s_14_18_6 "14.18.6 Le dio miedo el COVID"

label variable s_14_20 "14.20 Incluyendo todas las veces en el último año, ¿como cuántas noches ha estado internado en un hospital? NINGUN....................................................00 NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_22 "14.22 Incluyendo todas las veces, ¿cómo cuánto pagó por estas hospitalizaciones? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud] NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_23 "14.23 Además de los hospitales, otras instalaciones atienden a las personas cuando están enfermas y/o en recuperación. ¿Ha pasado usted otra estancia residencial en el último año?"

label variable s_14_24 "14.24 Incluyendo todas las veces en el último año, ¿Cómo cuántas noches ha estado internado en esta residencia? NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_25 "14.25 Incluyendo todas las veces, ¿cómo cuánto se pagó? [Usted o su familia, sin incluir las cantidades pagadas por el seguro de salud] NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_30a "14.30a ¿Aproximadamente, cuánto se gastó en total en medicamentos y remedios en el último mes? [Pagado por usted o su familia, sin incluir las cantidades pagadas por el seguro] NO RESPONDE...................................... 88 NO SABE................................................. 99"

label variable s_14_30b1_p "14.30b.1 ¿Diría usted que estos gastos fueron en total Más de $100?"

label variable s_14_30b1_d "14.30b.1 ¿Diría usted que estos gastos fueron en total mas de 5000 pesos?"

label variable s_14_30b1_c "14.30b.1 ¿Diría usted que estos gastos fueron en total Más de 1250 CUP?"

label variable s_14_30b2_p "14.30b2 ¿Diría usted que estos gastos fueron en total Más de $50?"

label variable s_14_30b2_d "14.30b2 ¿Diría usted que estos gastos fueron en total mas de 2500 pesos?"

label variable s_14_30b2_c "14.30b2 ¿Diría usted que estos gastos fueron en total Más de 125 CUP?"

label variable s_14_30b3_p "14.30b3 ¿Diría usted que estos gastos fueron en total Más de $200?"

label variable s_14_30b3_d "14.30b3 ¿Diría usted que estos gastos fueron en total mas de 10,000 pesos?"

label variable s_14_30b3_c "14.30b3 ¿Diría usted que estos gastos fueron en total Más de 4500 CUP?"

label variable s_14_31 "14.31 ¿Se ha vacunado contra el COVID?"

label variable s_14_32 "14.32 ¿Cuántos dosis ha recibido?"

label variable s_14_33 "14.33 ¿Ha tenido el COVID alguna vez?"

label variable s_15_1 "15.1 Esta entrevista de factores de riesgos sociodemográficos fue conducida con:"

label variable s_15_2 "15.2 ¿Qué relación tiene el proxy con (xxx)?"

label variable s_15_3 "15.3 Confianza general en los datos"

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

*missing values code below
   
replace s_2_9a = .i if (s_2_9a == . | s_2_9a == .a) & s_2_9 ~= 1

replace s_2_12 = .i if (s_2_12 == . | s_2_12 == .a) & (s_2_11 ~=7 & s_2_11 ~= 8 & s_2_11 ~= 9)

replace s_3_3_c = ".i" if (s_3_3_c == "" | s_3_3_c == ".")& (s_3_1_c ~= 4 & s_country == 2)

replace s_3_3_p = ".i" if (s_3_3_p == "" | s_3_3_p == "." )& ((s_3_1_p ~= 2 & s_3_1_p ~= 4) & s_country == 0)

replace s_3_3_d = ".i" if (s_3_3_d == "" | s_3_3_d == "." )& ((s_3_1_d ~= 2 & s_3_1_d ~= 3 & s_3_1_d ~= 4) & s_country == 1)

replace s_3_18 = .i if (s_3_18 == . | s_3_18 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)

replace s_3_19_1 = .i if (s_3_19_1 == . | s_3_19_1 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)

replace s_3_19_2 = .i if (s_3_19_2 == . | s_3_19_2 == .a) & (s_3_17 ~= 1 & s_3_17 ~= 8 & s_3_17 ~= 9)

replace s_4_3 = .i if (s_4_3 == . | s_4_3 == .a) & (s_4_2 ~= 1 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_6 = .i if (s_4_6 == . | s_4_6 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_7 = .i if (s_4_7 == . | s_4_7 == .a) & (s_4_2 ~= 2 & s_4_2 ~= 8 & s_4_2 ~= 9)

replace s_4_13 = .i if (s_4_13 == . | s_4_13 == .a) & (s_4_12 ~= 2 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_16 = .i if (s_4_16 == . | s_4_16 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_17 = .i if (s_4_17 == . | s_4_17 == .a) & (s_4_12 ~= 1 & s_4_12 ~= 8 & s_4_12 ~= 9)

replace s_4_22 = .i if (s_4_22 == . | s_4_22 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_1 = .i if (s_4_23_1 == . | s_4_23_1 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_23_2 = .i if (s_4_23_2 == . | s_4_23_2 == .a) & (s_4_21 ~= 2 & s_4_21 ~= 8 & s_4_21 ~= 9)

replace s_4_27_1 = .i if (s_4_27_1 == . | s_4_27_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_27_2 = .i if (s_4_27_2 == . | s_4_27_2 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & s_4_27_1 ~= 88 & s_4_27_1 ~= 99)

replace s_4_27a = .i if (s_4_27a == . | s_4_27a == .a) & (s_4_26 ~= 2 & s_4_26 ~= 3 & s_4_26 ~= 8 & s_4_26 ~= 9 & (s_4_27_1 == 88 | s_4_27_1 == 99 | s_4_27_1 == .i))

replace s_4_29_1 = .i if (s_4_29_1 == . | s_4_29_1 == .a) & (s_4_26 ~= 2 & s_4_26 ~= 8 & s_4_26 ~= 9)

replace s_4_29_2 = .i if (s_4_29_2 == . | s_4_29_2 == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & s_4_29_1 ~= 88 & s_4_29_1 ~= 99)

replace s_4_29a = .i if (s_4_29a == . | s_4_29a == .a) & (s_4_28 ~= 2 & s_4_28 ~= 8 & s_4_28 ~= 9 & (s_4_29_1 == 88 | s_4_29_1 == 99 | s_4_29_1 == .i))

replace s_5_3 = .i if (s_5_3 == . | s_5_3 == .a) & (s_5_2 ~= 2 & s_5_2 ~= 8 & s_5_2 ~= 9)

replace s_6_2 = .i if (s_6_2 == . | s_6_2 == .a) & (s_6_1 ~= 2 & s_6_1 ~= 8 & s_6_1 ~= 9)

replace s_6_4 = .i if (s_6_4 == . | s_6_4 == .a) & (s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9)

replace s_6_5_p = .i if (s_6_5_p == . | s_6_5_p == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 0)

replace s_6_5_d = .i if (s_6_5_d == . | s_6_5_d == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 1)

replace s_6_5_c = .i if (s_6_5_c == . | s_6_5_c == .a) & ((s_6_3 ~= 2 & s_6_3 ~= 8 & s_6_3 ~= 9) & s_country == 2)

replace s_6_6 = .i if (s_6_6 == . | s_6_6 == .a) & (s_6_1 == 1 | s_6_1 == 7 | s_6_3 == 1 | s_6_3 == 7)

replace s_6_7 = .i if (s_6_7 == . | s_6_7 == .a) & (s_6_1 == 1 | s_6_1 == 7 | s_6_3 == 1 | s_6_3 == 7)

replace s_7_2a = .i if (s_7_2a == . | s_7_2a == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2b = .i if (s_7_2b == . | s_7_2b == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_2c = .i if (s_7_2c == . | s_7_2c == .a) & (s_7_1 ~= 1 & s_7_1 ~= 8 & s_7_1 ~= 9)

replace s_7_7a = .i if (s_7_7a == . | s_7_7a == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7b = .i if (s_7_7b == . | s_7_7b == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7c = .i if (s_7_7c == . | s_7_7c == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7d = .i if (s_7_7d == . | s_7_7d == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7e = .i if (s_7_7e == . | s_7_7e == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7f = .i if (s_7_7f == . | s_7_7f == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7g = .i if (s_7_7g == . | s_7_7g == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7h = .i if (s_7_7h == . | s_7_7h == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7i = .i if (s_7_7i == . | s_7_7i == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7j = .i if (s_7_7j == . | s_7_7j == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_7_7k = .i if (s_7_7k == . | s_7_7k == .a) & (s_7_6a < 6 | s_7_6b < 5)

replace s_8_2 = .i if (s_8_2 == . | s_8_2 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3 = .i if (s_8_3 == . | s_8_3 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_3a = ".i" if (s_8_3a == "" | s_8_3a == ".") & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_4 = .i if (s_8_4 == . | s_8_4 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_5a = .i if (s_8_5a == . | s_8_5a == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_5b1 = .i if (s_8_5b1 == . | s_8_5b1 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b2 = .i if (s_8_5b2 == . | s_8_5b2 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b3 = .i if (s_8_5b3 == . | s_8_5b3 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b4 = .i if (s_8_5b4 == . | s_8_5b4 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b5 = .i if (s_8_5b5 == . | s_8_5b5 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b6 = .i if (s_8_5b6 == . | s_8_5b6 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b7 = .i if (s_8_5b7 == . | s_8_5b7 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b8 = .i if (s_8_5b8 == . | s_8_5b8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5b9 = .i if (s_8_5b9 == . | s_8_5b9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

capture replace s_8_5b10 = .i if (s_8_5b10 == . | s_8_5b10 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 2 & s_8_5a ~= 8))

replace s_8_5c = .i if (s_8_5c == . | s_8_5c == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 1 & s_8_5a ~= 8))

replace s_8_5d = .i if (s_8_5d == . | s_8_5d == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_5a ~= 2 & s_8_5a ~= 3 & s_8_5a ~= 8))

replace s_8_7 = .i if (s_8_7 == . | s_8_7 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_8 = .i if (s_8_8 == . | s_8_8 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_9 = .i if (s_8_9 == . | s_8_9 == .a) & ((s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9) & (s_8_7 ~= 2 & s_8_7 ~= 8 & s_8_7 ~= 9))

replace s_8_10 = .i if (s_8_10 == . | s_8_10 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_11 = .i if (s_8_11 == . | s_8_11 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_12 = .i if (s_8_12 == . | s_8_12 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_13 = .i if (s_8_13 == . | s_8_13 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_14 = .i if (s_8_14 == . | s_8_14 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_15 = .i if (s_8_15 == . | s_8_15 == .a) & (s_8_1 ~= 2 & s_8_1 ~= 8 & s_8_1 ~= 9)

replace s_8_16 = .i if (s_8_16 == . | s_8_16 == .a) & (s_2_9 ~= 1)

replace s_9_6 = .i if (s_9_6 == . | s_9_6 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_7 = .i if (s_9_7 == . | s_9_7 == .a) & (s_9_5 ~= 2 & s_9_5 ~= 8 & s_9_5 ~= 9)

replace s_9_9 = .i if (s_9_9 == . | s_9_9 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_11 = .i if (s_9_11 == . | s_9_11 == .a) & (s_9_8 ~= 2 & s_9_8 ~= 8 & s_9_8 ~= 9)

replace s_9_15 = .i if (s_9_15 == . | s_9_15 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_16 = .i if (s_9_16 == . | s_9_16 == .a) & (s_9_14 ~= 2 & s_9_14 ~= 8 & s_9_14 ~= 9)

replace s_9_18 = .i if (s_9_18 == . | s_9_18 == .a) & (s_9_17 ~= 2 & s_9_17 ~= 8 & s_9_17 ~= 9)

replace s_9_21a = .i if (s_9_21a == . | s_9_21a == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_21b = ".i" if (s_9_21b == "" | s_9_21b == ".") & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_22 = .i if (s_9_22 == . | s_9_22 == .a) & (s_9_20 ~= 2 & s_9_20 ~= 8 & s_9_20 ~= 9)

replace s_9_24 = .i if (s_9_24 == . | s_9_24 == .a) & (s_0 ~= 0 & s_9_23 ~= 2 & s_9_23 ~= 8 & s_9_23 ~= 9)

replace s_9_25 = .i if (s_9_25 == . | s_9_25 == .a) & (s_9_24 ~= 1 & s_9_23 ~= 2 & s_9_23 ~= 8 & s_9_23 ~= 9)

replace s_9_26 = .i if (s_9_26 == . | s_9_26 == .a) & (s_9_24 ~= 1 & s_9_23 ~= 2 & s_9_23 ~= 8 & s_9_23 ~= 9)

replace s_9_28 = .i if (s_9_28 == . | s_9_28 == .a) & (s_9_24 ~= 1 & s_9_23 ~= 2 & s_9_23 ~= 8 & s_9_23 ~= 9)

replace s_9_29 = .i if (s_9_29 == . | s_9_29 == .a) & (s_9_24 ~= 1 & s_9_23 ~= 2 & s_9_23 ~= 8 & s_9_23 ~= 9)

replace s_9_31 = .i if (s_9_31 == . | s_9_31 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_32 = .i if (s_9_32 == . | s_9_32 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_33 = .i if (s_9_33 == . | s_9_33 == .a) & (s_9_30 ~= 2 & s_9_30 ~= 8 & s_9_30 ~= 9)

replace s_9_38a = .i if (s_9_38a == . | s_9_38a == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38b = .i if (s_9_38b == . | s_9_38b == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38c = .i if (s_9_38c == . | s_9_38c == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38d = .i if (s_9_38d == . | s_9_38d == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38e = .i if (s_9_38e == . | s_9_38e == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38f = .i if (s_9_38f == . | s_9_38f == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38g = .i if (s_9_38g == . | s_9_38g == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38h = .i if (s_9_38h == . | s_9_38h == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38i = .i if (s_9_38i == . | s_9_38i == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38j = .i if (s_9_38j == . | s_9_38j == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38k = .i if (s_9_38k == . | s_9_38k == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_38l = .i if (s_9_38l == . | s_9_38l == .a) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_39 = .i if (s_9_39 == . | s_9_39 == .a ) & (s_9_37 ~= 2 & s_9_37 ~= 8 & s_9_37 ~= 9)

replace s_9_43a = .i if (s_9_43a == . | s_9_43a == .a) & (s_9_42 ~= 2 & s_9_42 ~= 8 & s_9_42 ~= 9)

replace s_9_45a = .i if (s_9_45a == . | s_9_45a == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_46 = .i if (s_9_46 == . | s_9_46 == .a) & (s_9_44 ~= 2 & s_9_44 ~= 8 & s_9_44 ~= 9)

replace s_9_48 = .i if (s_9_48 == . | s_9_48 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_49 = .i if (s_9_49 == . | s_9_49 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_50 = .i if (s_9_50 == . | s_9_50 == .a) & (s_9_47 ~= 2 & s_9_47 ~= 8 & s_9_47 ~= 9)

replace s_9_53 = .i if (s_9_53 == . | s_9_53 == .a) & (s_0 ~= 0)

replace s_9_54 = .i if (s_9_54 == . | s_9_54 == .a) & (s_0 ~= 0)

replace s_9_55 = .i if (s_9_55 == . | s_9_55 == .a) & (s_0 ~= 1)

replace s_9_56 = .i if (s_9_56 == . | s_9_56 == .a) & (s_0 ~= 1)

replace s_9_57 = .i if (s_9_57 == . | s_9_57 == .a) & (s_0 ~= 0)

replace s_9_58 = .i if (s_9_58 == . | s_9_58 == .a) & (s_0 ~= 0)

replace s_9_59 = .i if (s_9_59 == . | s_9_59 == .a) & (s_0 ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_60 = .i if (s_9_60 == . | s_9_60 == .a) & (s_0 ~= 0 & (s_9_58 ~= 2 & s_9_58 ~= 8 & s_9_58 ~= 9))

replace s_9_61 = .i if (s_9_61 == . | s_9_61 == .a) & (s_0 ~= 0)

replace s_9_61a = .i if (s_9_61a == . | s_9_61a == .a) & (s_0 ~= 0 & (s_9_61 == 88 | s_9_61 == 99 | s_9_61 == .i))

replace s_9_62 = .i if (s_9_62 == . | s_9_62 == .a) & (s_0 ~= 0 & s_9_61 ~= 97)

replace s_9_63 = .i if (s_9_63 == . | s_9_63 == .a) & (s_0 ~= 0)

replace s_9_64_1 = .i if (s_9_64_1 == . | s_9_64_1 == .a) & (s_0 ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_2 = .i if (s_9_64_2 == . | s_9_64_2 == .a) & (s_0 ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_3 = .i if (s_9_64_3 == . | s_9_64_3 == .a) & (s_0 ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_64_4 = .i if (s_9_64_4 == . | s_9_64_4 == .a) & (s_0 ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_65 = .i if (s_9_65 == . | s_9_65 == .a) & (s_0 ~= 0 & s_9_63 ~= 2 & s_9_63 ~= 8 & s_9_63 ~= 9)

replace s_9_66 = .i if (s_9_66 == . | s_9_66 == .a) & (s_0 ~= 0)


*10.1 not answered by anyone



replace s_10_6_1a = .i if (s_10_6_1a == . | s_10_6_1a == .a) & (s_10_6_1 ~= 2 & s_10_6_1 ~= 8 & s_10_6_1 ~= 9)

replace s_10_6_2a = .i if (s_10_6_2a == . | s_10_6_2a == .a) & (s_10_6_2 ~= 2 & s_10_6_2 ~= 8 & s_10_6_2 ~= 9)

replace s_10_6_3a = .i if (s_10_6_3a == . | s_10_6_3a == .a) & (s_10_6_3 ~= 2 & s_10_6_3 ~= 8 & s_10_6_3 ~= 9 & s_10_6_3 ~= 7)

replace s_10_6_4a = .i if (s_10_6_4a == . | s_10_6_4a == .a) & (s_10_6_4 ~= 2 & s_10_6_4 ~= 8 & s_10_6_4 ~= 9)

replace s_11_2 = .i if (s_11_2 == . | s_11_2 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_11_3 = .i if (s_11_3 == . | s_11_3 == .a) & (s_11_1 ~= 1 & s_11_1 ~= 8 & s_11_1 ~= 9)

replace s_12_1b = .i if (s_12_1b == . | s_12_1b == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_1c = .i if (s_12_1c == . | s_12_1c == .a) & (s_12_1a ~= 2 & s_12_1a ~= 6 & s_12_1a ~= 7 & s_12_1a ~= 8 & s_12_1a ~= 9)

replace s_12_2c = .i if (s_12_2c == . | s_12_2c == .a) & (s_12_2a ~= 2 & s_12_2a ~= 6 & s_12_2a ~= 7 & s_12_2a ~= 8 & s_12_2a ~= 9)

replace s_12_3c = .i if (s_12_3c == . | s_12_3c == .a) & (s_12_3a ~= 2 & s_12_3a ~= 6 & s_12_3a ~= 7 & s_12_3a ~= 8 & s_12_3a ~= 9)

replace s_12_4b = .i if (s_12_4b == . | s_12_4b == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_4c = .i if (s_12_4c == . | s_12_4c == .a) & (s_12_4a ~= 2 & s_12_4a ~= 6 & s_12_4a ~= 7 & s_12_4a ~= 8 & s_12_4a ~= 9)

replace s_12_5c = .i if (s_12_5c == . | s_12_5c == .a) & (s_12_5a ~= 2 & s_12_5a ~= 6 & s_12_5a ~= 7 & s_12_5a ~= 8 & s_12_5a ~= 9)

replace s_12_6c = .i if (s_12_6c == . | s_12_6c == .a) & (s_12_6a ~= 2 & s_12_6a ~= 6 & s_12_6a ~= 7 & s_12_6a ~= 8 & s_12_6a ~= 9)

replace s_12_13 = .i if (s_12_13 == . | s_12_13 == .a) & (s_12_11 ~= 2)

replace s_12_14 = .i if (s_12_14 == . | s_12_14 == .a) & (s_12_11 ~= 2)

replace s_12_15 = .i if (s_12_15 == . | s_12_15 == .a) & (s_12_11 ~= 2)

replace s_13_1_p_c = .i if (s_13_1_p_c == . | s_13_1_p_c == .a) & (s_country ~= 1)

replace s_13_1_d = .i if (s_13_1_d == . | s_13_1_d == .a) & (s_country ~= 0 & s_country ~= 2)

replace s_13_2 = .i if (s_13_2 == . | s_13_2 == .a) & (s_13_1_p_c == 1 | s_13_1_d == 1 | (s_13_1_p_c == .i & s_13_1_d == .i))

replace s_13_3_p_c = .i if (s_13_3_p_c == . | s_13_3_p_c == .a) & ((s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9) & s_country ~= 1)

replace s_13_3_d = .i if (s_13_3_d == . | s_13_3_d == .a) & ((s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9) & s_country == 1)

replace s_13_4 = .i if (s_13_4 == . | s_13_4 == .a) & (s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9 & s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9 & s_13_3_p_c ~= 1 & s_13_3_d ~= 1)

replace s_13_5 = .i if (s_13_5 == . | s_13_5 == .a) & (s_13_3_p_c == 1 | s_13_3_d == 1 | (s_13_3_p_c == .i & s_13_3_d == .i))
*come back to s_13_5

replace s_13_6_p_c = .i if (s_13_6_p_c == . | s_13_6_p_c == .a) & ((s_13_5 == 1 | s_13_5 == .i) & s_country ~= 1)

replace s_13_6_d = .i if (s_13_6_d == . | s_13_6_d == .a) & ((s_13_5 == 1 | s_13_5 == .i) & s_country == 1)

*come back to s_13_6

replace s_13_7_p_c = .i if (s_13_7_p_c == . | s_13_7_p_c == .a) & ((s_13_1_p_c ~= 2 & s_13_1_p_c ~= 8 & s_13_1_p_c ~= 9) & s_country ~= 1)

replace s_13_7_d = .i if (s_13_7_d == . | s_13_7_d == .a) & ((s_13_1_d ~= 2 & s_13_1_d ~= 8 & s_13_1_d ~= 9) & s_country == 1)

*s_13_1 through s_13_7 are weird since they depend on which country

replace s_13_9 = .i if (s_13_9 == . | s_13_9 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_10 = .i if (s_13_10 == . | s_13_10 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9 & s_13_9 ~= 2 & s_13_9 ~= 8 & s_13_9 ~= 9)

replace s_13_11 = .i if (s_13_11 == . | s_13_11 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_12 = .i if (s_13_12 == . | s_13_12 == .a) & (s_13_8 ~= 2 & s_13_8 ~= 8 & s_13_8 ~= 9)

replace s_13_20 = .i if (s_13_20 == . | s_13_20 == .a) & (s_13_19 ~= 2 & s_13_19 ~= 8 & s_13_19 ~= 9)

replace s_14_1_p_d = .i if (s_14_1_p_d == . | s_14_1_p_d == .a) & (s_country ~= 2)

replace s_14_2a_p = .i if (s_14_2a_p == . | s_14_2a_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2b_p = .i if (s_14_2b_p == . | s_14_2b_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_p = .i if (s_14_2c_p == . | s_14_2c_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_p = .i if (s_14_2d_p == . | s_14_2d_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_p = .i if (s_14_2e_p == . | s_14_2e_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_p = .i if (s_14_2f_p == . | s_14_2f_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_p = .i if (s_14_2g_p == . | s_14_2g_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2h_p = .i if (s_14_2h_p == . | s_14_2h_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2i_p = .i if (s_14_2i_p == . | s_14_2i_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2j_p = .i if (s_14_2j_p == . | s_14_2j_p == .a) & (s_country == 0 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2a_d = .i if (s_14_2a_d == . | s_14_2a_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2b_d = .i if (s_14_2b_d == . | s_14_2b_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2c_d = .i if (s_14_2c_d == . | s_14_2c_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2d_d = .i if (s_14_2d_d == . | s_14_2d_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2e_d = .i if (s_14_2e_d == . | s_14_2e_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2f_d = .i if (s_14_2f_d == . | s_14_2f_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

replace s_14_2g_d = .i if (s_14_2g_d == . | s_14_2g_d == .a) & (s_country == 1 & s_14_1_p_d ~= 2 & s_14_1_p_d ~= 8 & s_14_1_p_d ~= 9)

*i think s_14_1b_p is mislabeled in do file and data dictionary, should be s_14_2b_p




replace s_14_4 = .i if (s_14_4 == . | s_14_4 == .a) & (s_14_3 ~= 2 & s_14_3 ~= 8 & s_14_3 ~= 9)

replace s_14_12 = .i if (s_14_12 == . | s_14_12 == .a) & (s_14_11 ~= 00 & s_14_11 ~= 88 & s_14_11 ~= 99)

replace s_14_14 = .i if (s_14_14 == . | s_14_14 == .a) & (s_14_13 ~= 00 & s_14_13 ~= 88 & s_14_13 ~= 99)

replace s_14_16 = .i if (s_14_16 == . | s_14_16 == .a) & (s_14_15 ~= 0 & s_14_15 ~= 88 & s_14_15 ~= 99)
*ninguna is 0 in 14.15 instead of 00 (14.11 and 14.13 have 00)
*line 11, 17 and 22 should not have answered this

replace s_14_18_1 = .i if (s_14_18_1 == . | s_14_18_1 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_2 = .i if (s_14_18_2 == . | s_14_18_2 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_3 = .i if (s_14_18_3 == . | s_14_18_3 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_4 = .i if (s_14_18_4 == . | s_14_18_4 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_5 = .i if (s_14_18_5 == . | s_14_18_5 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_18_6 = .i if (s_14_18_6 == . | s_14_18_6 == .a) & (s_14_17 ~= 2 & s_14_17 ~= 8 & s_14_17 ~= 9)

replace s_14_22 = .i if (s_14_22 == . | s_14_22 == .a) & (s_14_20 ~= 00 & s_14_20 ~= 88 & s_14_20 ~= 99)

replace s_14_24 = .i if (s_14_24 == . | s_14_24 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_25 = .i if (s_14_25 == . | s_14_25 == .a) & (s_14_23 ~= 2 & s_14_23 ~= 8 & s_14_23 ~= 9)

replace s_14_30b1_p = .i if (s_14_30b1_p == . | s_14_30b1_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 0)

replace s_14_30b1_d = .i if (s_14_30b1_d == . | s_14_30b1_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 1)

replace s_14_30b1_c = .i if (s_14_30b1_c == . | s_14_30b1_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & s_country  == 2)

replace s_14_30b2_p = .i if (s_14_30b2_p == . | s_14_30b2_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 2 | s_14_30b1_p == .i))

replace s_14_30b2_d = .i if (s_14_30b2_d == . | s_14_30b2_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 2 | s_14_30b1_d == .i))

replace s_14_30b2_c = .i if (s_14_30b2_c == . | s_14_30b2_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 2 | s_14_30b1_c == .i))

replace s_14_30b3_p = .i if (s_14_30b3_p == . | s_14_30b3_p == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 0) & (s_14_30b1_p == 1 | s_14_30b1_p == .i))

replace s_14_30b3_d = .i if (s_14_30b3_d == . | s_14_30b3_d == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 1) & (s_14_30b1_d == 1 | s_14_30b1_d == .i))

replace s_14_30b3_c = .i if (s_14_30b3_c == . | s_14_30b3_c == .a) & ((s_14_30a == 88 | s_14_30a == 99 | s_14_30a == .) & (s_country  == 2) & (s_14_30b1_c == 1 | s_14_30b1_c == .i))

replace s_14_32 = .i if (s_14_32 == . | s_14_32 == .a) & (s_14_31 ~= 2 & s_14_31 ~= 8 & s_14_31 ~= 9)

replace s_15_2 = .i if (s_15_2 == . | s_15_2 == .a) & s_15_1 ~= 0




*country based valid skips

replace s_1_1_p = .v if (s_1_1_p == . | s_1_1_p == .a) & s_country ~= 0
replace s_1_1_d = .v if (s_1_1_d == . | s_1_1_d == .a) & s_country ~= 1
replace s_1_1_c = .v if (s_1_1_c == . | s_1_1_c == .a) & s_country ~= 2
replace s_2_14_p = .v if (s_2_14_p == . | s_2_14_p == .a) & s_country ~= 0
replace s_2_14_d = .v if (s_2_14_d == . | s_2_14_d == .a) & s_country ~= 1
replace s_2_14_c = .v if (s_2_14_c == . | s_2_14_c == .a) & s_country ~= 2
replace s_2_15_p = .v if (s_2_15_p == . | s_2_15_p == .a) & s_country ~= 0
replace s_2_15_d = .v if (s_2_15_d == . | s_2_15_d == .a) & s_country ~= 1
replace s_2_15_c = .v if (s_2_15_c == . | s_2_15_c == .a) & s_country ~= 2
replace s_3_1_p = .v if (s_3_1_p == . | s_3_1_p == .a) & s_country ~= 0
replace s_3_1_d = .v if (s_3_1_d == . | s_3_1_d == .a) & s_country ~= 1
replace s_3_1_c = .v if (s_3_1_c == . | s_3_1_c == .a) & s_country ~= 2
replace s_3_3_p = ".v" if (s_3_3_p == "" | s_3_3_p == ".") & s_country ~= 0
replace s_3_3_d = ".v" if (s_3_3_d == "" | s_3_3_d == ".") & s_country ~= 1
replace s_3_3_c = ".v" if (s_3_3_c == "" | s_3_3_c == ".") & s_country ~= 2
replace s_6_5_p = .v if (s_6_5_p == . | s_6_5_p == .a) & s_country ~= 0
replace s_6_5_d = .v if (s_6_5_d == . | s_6_5_d == .a) & s_country ~= 1
replace s_6_5_c = .v if (s_6_5_c == . | s_6_5_c == .a) & s_country ~= 2
replace s_13_1_p_c = .v if (s_13_1_p_c == . | s_13_1_p_c == .a) & s_country == 1
replace s_13_1_d = .v if (s_13_1_d == . | s_13_1_d == .a) & s_country ~= 1
replace s_13_3_p_c = .v if (s_13_3_p_c == . | s_13_3_p_c == .a) & s_country == 1
replace s_13_3_d = .v if (s_13_3_d == . | s_13_3_d == .a) & s_country ~= 1
replace s_13_6_p_c = .v if (s_13_6_p_c == . | s_13_6_p_c == .a) & s_country == 1
replace s_13_6_d = .v if (s_13_6_d == . | s_13_6_d == .a) & s_country ~= 1
replace s_13_7_p_c = .v if (s_13_7_p_c == . | s_13_7_p_c == .a) & s_country == 1
replace s_13_7_d = .v if (s_13_7_d == . | s_13_7_d == .a) & s_country ~= 1
replace s_13_23_p = .v if (s_13_23_p == . | s_13_23_p == .a) & s_country ~= 0
replace s_13_23_d_c = .v if (s_13_23_d_c == . | s_13_23_d_c == .a) & s_country == 0
replace s_13_25_d_c = .v if (s_13_25_d_c == . | s_13_25_d_c == .a) & s_country == 0
replace s_13_25_p = .v if (s_13_25_p == . | s_13_25_p == .a) & s_country ~= 0
replace s_13_27_d_c = .v if (s_13_27_d_c == . | s_13_27_d_c == .a) & s_country == 0
replace s_13_27_p = .v if (s_13_27_p == . | s_13_27_p == .a) & s_country ~= 0
replace s_13_30_d_c = .v if (s_13_30_d_c == . | s_13_30_d_c == .a) & s_country == 0
replace s_13_30_p = .v if (s_13_30_p == . | s_13_30_p == .a) & s_country ~= 0
replace s_14_1_p_d = .v if (s_14_1_p_d == . | s_14_1_p_d == .a) & s_country == 2
replace s_14_2a_p = .v if (s_14_2a_p == 0 | s_14_2a_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2b_p = .v if (s_14_2b_p == 0 | s_14_2b_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2c_p = .v if (s_14_2c_p == 0 | s_14_2c_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2d_p = .v if (s_14_2d_p == 0 | s_14_2d_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2e_p = .v if (s_14_2e_p == 0 | s_14_2e_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2f_p = .v if (s_14_2f_p == 0 | s_14_2f_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2g_p = .v if (s_14_2g_p == 0 | s_14_2g_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2h_p = .v if (s_14_2h_p == 0 | s_14_2h_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2i_p = .v if (s_14_2i_p == 0 | s_14_2i_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2j_p = .v if (s_14_2j_p == 0 | s_14_2j_p == .a) & (s_country ~= 0 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2a_d = .v if (s_14_2a_d == 0 | s_14_2a_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2b_d = .v if (s_14_2b_d == 0 | s_14_2b_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2c_d = .v if (s_14_2c_d == 0 | s_14_2c_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2d_d = .v if (s_14_2d_d == 0 | s_14_2d_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2e_d = .v if (s_14_2e_d == 0 | s_14_2e_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2f_d = .v if (s_14_2f_d == 0 | s_14_2f_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_2g_d = .v if (s_14_2g_d == 0 | s_14_2g_d == .a) & (s_country ~= 1 | s_14_1_p_d == 2 | s_14_1_p_d == 8 | s_14_1_p_d == 9)
replace s_14_30b1_p = .v if (s_14_30b1_p == . | s_14_30b1_p == .a) & s_country ~= 0
replace s_14_30b1_d = .v if (s_14_30b1_d == . | s_14_30b1_d == .a) & s_country ~= 1
replace s_14_30b1_c = .v if (s_14_30b1_c == . | s_14_30b1_c == .a) & s_country ~= 2
replace s_14_30b2_p = .v if (s_14_30b2_p == . | s_14_30b2_p == .a) & s_country ~= 0
replace s_14_30b2_d = .v if (s_14_30b2_d == . | s_14_30b2_d == .a) & s_country ~= 1
replace s_14_30b2_c = .v if (s_14_30b2_c == . | s_14_30b2_c == .a) & s_country ~= 2
replace s_14_30b3_p = .v if (s_14_30b3_p == . | s_14_30b3_p == .a) & s_country ~= 0
replace s_14_30b3_d = .v if (s_14_30b3_d == . | s_14_30b3_d == .a) & s_country ~= 1
replace s_14_30b3_c = .v if (s_14_30b3_c == . | s_14_30b3_c == .a) & s_country ~= 2




*if a skippable question is missing but not invalid, then it is valid

replace s_2_9a = .v if (s_2_9a == . | s_2_9a == .a)
replace s_2_12 = .v if (s_2_12 == . | s_2_12 == .a)
replace s_3_3_c = ".v" if (s_3_3_c == "" | s_3_3_c == ".")
replace s_3_3_p = ".v" if (s_3_3_p == "" | s_3_3_p == ".")
replace s_3_3_d = ".v" if (s_3_3_d == "" | s_3_3_d == ".")
replace s_3_18 = .v if (s_3_18 == . | s_3_18 == .a)
replace s_3_19_1 = .v if (s_3_19_1 == . | s_3_19_1 == .a)
replace s_3_19_2 = .v if (s_3_19_2 == . | s_3_19_2 == .a)
replace s_4_3 = .v if (s_4_3 == . | s_4_3 == .a)
replace s_4_6 = .v if (s_4_6 == . | s_4_6 == .a)
replace s_4_7 = .v if (s_4_7 == . | s_4_7 == .a)
replace s_4_13 = .v if (s_4_13 == . | s_4_13 == .a)
replace s_4_16 = .v if (s_4_16 == . | s_4_16 == .a)
replace s_4_17 = .v if (s_4_17 == . | s_4_17 == .a)
replace s_4_22 = .v if (s_4_22 == . | s_4_22 == .a)
replace s_4_23_1 = .v if (s_4_23_1 == . | s_4_23_1 == .a)
replace s_4_23_2 = .v if (s_4_23_2 == . | s_4_23_2 == .a)
replace s_4_27_1 = .v if (s_4_27_1 == . | s_4_27_1 == .a)
replace s_4_27_2 = .v if (s_4_27_2 == . | s_4_27_2 == .a)
replace s_4_27a = .v if (s_4_27a == . | s_4_27a == .a)
replace s_4_29_1 = .v if (s_4_29_1 == . | s_4_29_1 == .a)
replace s_4_29_2 = .v if (s_4_29_2 == . | s_4_29_2 == .a)
replace s_4_29a = .v if (s_4_29a == . | s_4_29a == .a)
replace s_5_3 = .v if (s_5_3 == . | s_5_3 == .a)
replace s_6_2 = .v if (s_6_2 == . | s_6_2 == .a)
replace s_6_4 = .v if (s_6_4 == . | s_6_4 == .a)
replace s_6_5_p = .v if (s_6_5_p == . | s_6_5_p == .a)
replace s_6_5_d = .v if (s_6_5_d == . | s_6_5_d == .a)
replace s_6_5_c = .v if (s_6_5_c == . | s_6_5_c == .a)
replace s_6_6 = .v if (s_6_6 == . | s_6_6 == .a)
replace s_6_7 = .v if (s_6_7 == . | s_6_7 == .a)
replace s_7_2a = .v if (s_7_2a == . | s_7_2a == .a)
replace s_7_2b = .v if (s_7_2b == . | s_7_2b == .a)
replace s_7_2c = .v if (s_7_2c == . | s_7_2c == .a)
replace s_7_7a = .v if (s_7_7a == 0 | s_7_7a == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7b = .v if (s_7_7b == 0 | s_7_7b == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7c = .v if (s_7_7c == 0 | s_7_7c == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7d = .v if (s_7_7d == 0 | s_7_7d == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7e = .v if (s_7_7e == 0 | s_7_7e == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7f = .v if (s_7_7f == 0 | s_7_7f == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7g = .v if (s_7_7g == 0 | s_7_7g == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7h = .v if (s_7_7h == 0 | s_7_7h == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7i = .v if (s_7_7i == 0 | s_7_7i == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7j = .v if (s_7_7j == 0 | s_7_7j == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_7_7k = .v if (s_7_7k == 0 | s_7_7k == .a) & ((s_7_6a == 6 | s_7_6a == 88 | s_7_6a == 99) & (s_7_6b == 5 | s_7_6b == 88 | s_7_6b == 99))
replace s_8_2 = .v if (s_8_2 == . | s_8_2 == .a)
replace s_8_3 = .v if (s_8_3 == . | s_8_3 == .a)
replace s_8_3a = ".v" if (s_8_3a == "" | s_8_3a == ".")
replace s_8_4 = .v if (s_8_4 == . | s_8_4 == .a)
replace s_8_5a = .v if (s_8_5a == . | s_8_5a == .a)
replace s_8_5b1 = .v if (s_8_5b1 == 0 | s_8_5b1 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b2 = .v if (s_8_5b2 == 0 | s_8_5b2 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b3 = .v if (s_8_5b3 == 0 | s_8_5b3 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b4 = .v if (s_8_5b4 == 0 | s_8_5b4 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b5 = .v if (s_8_5b5 == 0 | s_8_5b5 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b6 = .v if (s_8_5b6 == 0 | s_8_5b6 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b7 = .v if (s_8_5b7 == 0 | s_8_5b7 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b8 = .v if (s_8_5b8 == 0 | s_8_5b8 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5b9 = .v if (s_8_5b9 == 0 | s_8_5b9 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
capture replace s_8_5b10 = .v if (s_8_5b10 == 0 | s_8_5b10 == .a) & ((s_8_1 == 2 | s_8_1 == 8 | s_8_1 == 9) & (s_8_5a == 1 | s_8_5a == 2 | s_8_5a == 8))
replace s_8_5c = .v if (s_8_5c == . | s_8_5c == .a)
replace s_8_5d = .v if (s_8_5d == . | s_8_5d == .a)
replace s_8_7 = .v if (s_8_7 == . | s_8_7 == .a)
replace s_8_8 = .v if (s_8_8 == . | s_8_8 == .a)
replace s_8_9 = .v if (s_8_9 == . | s_8_9 == .a)
replace s_8_10 = .v if (s_8_10 == . | s_8_10 == .a)
replace s_8_11 = .v if (s_8_11 == . | s_8_11 == .a)
replace s_8_12 = .v if (s_8_12 == . | s_8_12 == .a)
replace s_8_13 = .v if (s_8_13 == . | s_8_13 == .a)
replace s_8_14 = .v if (s_8_14 == . | s_8_14 == .a)
replace s_8_15 = .v if (s_8_15 == . | s_8_15 == .a)
replace s_8_16 = .v if (s_8_16 == . | s_8_16 == .a)
replace s_9_6 = .v if (s_9_6 == . | s_9_6 == .a)
replace s_9_7 = .v if (s_9_7 == . | s_9_7 == .a)
replace s_9_9 = .v if (s_9_9 == . | s_9_9 == .a)
replace s_9_11 = .v if (s_9_11 == . | s_9_11 == .a)
replace s_9_15 = .v if (s_9_15 == . | s_9_15 == .a)
replace s_9_16 = .v if (s_9_16 == . | s_9_16 == .a)
replace s_9_18 = .v if (s_9_18 == . | s_9_18 == .a)
replace s_9_21a = .v if (s_9_21a == . | s_9_21a == .a)
replace s_9_21b = ".v" if (s_9_21b == "" | s_9_21b == ".")
replace s_9_22 = .v if (s_9_22 == . | s_9_22 == .a)
replace s_9_24 = .v if (s_9_24 == . | s_9_24 == .a)
replace s_9_25 = .v if (s_9_25 == . | s_9_25 == .a)
replace s_9_26 = .v if (s_9_26 == . | s_9_26 == .a)
replace s_9_28 = .v if (s_9_28 == . | s_9_28 == .a)
replace s_9_29 = .v if (s_9_29 == . | s_9_29 == .a)
replace s_9_31 = .v if (s_9_31 == . | s_9_31 == .a)
replace s_9_32 = .v if (s_9_32 == . | s_9_32 == .a)
replace s_9_33 = .v if (s_9_33 == . | s_9_33 == .a)
replace s_9_38a = .v if (s_9_38a == 0 | s_9_38a == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38b = .v if (s_9_38b == 0 | s_9_38b == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38c = .v if (s_9_38c == 0 | s_9_38c == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38d = .v if (s_9_38d == 0 | s_9_38d == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38e = .v if (s_9_38e == 0 | s_9_38e == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38f = .v if (s_9_38f == 0 | s_9_38f == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38g = .v if (s_9_38g == 0 | s_9_38g == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38h = .v if (s_9_38h == 0 | s_9_38h == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38i = .v if (s_9_38i == 0 | s_9_38i == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38j = .v if (s_9_38j == 0 | s_9_38j == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38k = .v if (s_9_38k == 0 | s_9_38k == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_38l = .v if (s_9_38l == 0 | s_9_38l == .a) & (s_9_37 == 2 | s_9_37 == 8 | s_9_37 == 9)
replace s_9_39 = .v if (s_9_39 == . | s_9_39 == .a)
replace s_9_43a = .v if (s_9_43a == . | s_9_43a == .a)
replace s_9_45a = .v if (s_9_45a == . | s_9_45a == .a)
replace s_9_46 = .v if (s_9_46 == . | s_9_46 == .a)
replace s_9_48 = .v if (s_9_48 == . | s_9_48 == .a)
replace s_9_49 = .v if (s_9_49 == . | s_9_49 == .a)
replace s_9_50 = .v if (s_9_50 == . | s_9_50 == .a)
replace s_9_53 = .v if (s_9_53 == . | s_9_53 == .a)
replace s_9_54 = .v if (s_9_54 == . | s_9_54 == .a)
replace s_9_55 = .v if (s_9_55 == . | s_9_55 == .a)
replace s_9_56 = .v if (s_9_56 == . | s_9_56 == .a)
replace s_9_57 = .v if (s_9_57 == . | s_9_57 == .a)
replace s_9_58 = .v if (s_9_58 == . | s_9_58 == .a)
replace s_9_59 = .v if (s_9_59 == . | s_9_59 == .a)
replace s_9_60 = .v if (s_9_60 == . | s_9_60 == .a)
replace s_9_61 = .v if (s_9_61 == . | s_9_61 == .a)
replace s_9_61a = .v if (s_9_61a == . | s_9_61a == .a)
replace s_9_62 = .v if (s_9_62 == . | s_9_62 == .a)
replace s_9_63 = .v if (s_9_63 == . | s_9_63 == .a)
replace s_9_64_1 = .v if (s_9_64_1 == . | s_9_64_1 == .a)
replace s_9_64_2 = .v if (s_9_64_2 == . | s_9_64_2 == .a)
replace s_9_64_3 = .v if (s_9_64_3 == . | s_9_64_3 == .a)
replace s_9_64_4 = .v if (s_9_64_4 == . | s_9_64_4 == .a)
replace s_9_65 = .v if (s_9_65 == . | s_9_65 == .a)
replace s_9_66 = .v if (s_9_66 == . | s_9_66 == .a)
replace s_10_6_1a = .v if (s_10_6_1a == . | s_10_6_1a == .a)
replace s_10_6_2a = .v if (s_10_6_2a == . | s_10_6_2a == .a)
replace s_10_6_3a = .v if (s_10_6_3a == . | s_10_6_3a == .a)
replace s_10_6_4a = .v if (s_10_6_4a == . | s_10_6_4a == .a)
replace s_11_2 = .v if (s_11_2 == . | s_11_2 == .a)
replace s_11_3 = .v if (s_11_3 == . | s_11_3 == .a)
replace s_12_1b = .v if (s_12_1b == . | s_12_1b == .a)
replace s_12_1c = .v if (s_12_1c == . | s_12_1c == .a)
replace s_12_2c = .v if (s_12_2c == . | s_12_2c == .a)
replace s_12_3c = .v if (s_12_3c == . | s_12_3c == .a)
replace s_12_4b = .v if (s_12_4b == . | s_12_4b == .a)
replace s_12_4c = .v if (s_12_4c == . | s_12_4c == .a)
replace s_12_5c = .v if (s_12_5c == . | s_12_5c == .a)
replace s_12_6c = .v if (s_12_6c == . | s_12_6c == .a)
replace s_12_13 = .v if (s_12_13 == . | s_12_13 == .a)
replace s_12_14 = .v if (s_12_14 == . | s_12_14 == .a)
replace s_12_15 = .v if (s_12_15 == . | s_12_15 == .a)
replace s_13_1_p_c = .v if (s_13_1_p_c == . | s_13_1_p_c == .a)
replace s_13_1_d = .v if (s_13_1_d == . | s_13_1_d == .a)
replace s_13_2 = .v if (s_13_2 == . | s_13_2 == .a)
replace s_13_3_p_c = .v if (s_13_3_p_c == . | s_13_3_p_c == .a)
replace s_13_3_d = .v if (s_13_3_d == . | s_13_3_d == .a)
replace s_13_4 = .v if (s_13_4 == . | s_13_4 == .a)
replace s_13_5 = .v if (s_13_5 == . | s_13_5 == .a)
replace s_13_6_p_c = .v if (s_13_6_p_c == . | s_13_6_p_c == .a)
replace s_13_6_d = .v if (s_13_6_d == . | s_13_6_d == .a)
replace s_13_7_p_c = .v if (s_13_7_p_c == . | s_13_7_p_c == .a)
replace s_13_7_d = .v if (s_13_7_d == . | s_13_7_d == .a)
replace s_13_9 = .v if (s_13_9 == . | s_13_9 == .a)
replace s_13_10 = .v if (s_13_10 == . | s_13_10 == .a)
replace s_13_11 = .v if (s_13_11 == . | s_13_11 == .a)
replace s_13_12 = .v if (s_13_12 == . | s_13_12 == .a)
replace s_13_20 = .v if (s_13_20 == . | s_13_20 == .a)
replace s_14_1_p_d = .v if (s_14_1_p_d == . | s_14_1_p_d == .a)
replace s_14_2a_p = .v if (s_14_2a_p == . | s_14_2a_p == .a)
replace s_14_2b_p = .v if (s_14_2b_p == . | s_14_2b_p == .a)
replace s_14_2c_p = .v if (s_14_2c_p == . | s_14_2c_p == .a)
replace s_14_2d_p = .v if (s_14_2d_p == . | s_14_2d_p == .a)
replace s_14_2e_p = .v if (s_14_2e_p == . | s_14_2e_p == .a)
replace s_14_2f_p = .v if (s_14_2f_p == . | s_14_2f_p == .a)
replace s_14_2g_p = .v if (s_14_2g_p == . | s_14_2g_p == .a)
replace s_14_2h_p = .v if (s_14_2h_p == . | s_14_2h_p == .a)
replace s_14_2i_p = .v if (s_14_2i_p == . | s_14_2i_p == .a)
replace s_14_2j_p = .v if (s_14_2j_p == . | s_14_2j_p == .a)
replace s_14_2a_d = .v if (s_14_2a_d == . | s_14_2a_d == .a)
replace s_14_2b_d = .v if (s_14_2b_d == . | s_14_2b_d == .a)
replace s_14_2c_d = .v if (s_14_2c_d == . | s_14_2c_d == .a)
replace s_14_2d_d = .v if (s_14_2d_d == . | s_14_2d_d == .a)
replace s_14_2e_d = .v if (s_14_2e_d == . | s_14_2e_d == .a)
replace s_14_2f_d = .v if (s_14_2f_d == . | s_14_2f_d == .a)
replace s_14_2g_d = .v if (s_14_2g_d == . | s_14_2g_d == .a)
replace s_14_4 = .v if (s_14_4 == . | s_14_4 == .a)
replace s_14_12 = .v if (s_14_12 == . | s_14_12 == .a)
replace s_14_14 = .v if (s_14_14 == . | s_14_14 == .a)
replace s_14_16 = .v if (s_14_16 == . | s_14_16 == .a)
replace s_14_18_1 = .v if (s_14_18_1 == . | s_14_18_1 == .a)
replace s_14_18_2 = .v if (s_14_18_2 == . | s_14_18_2 == .a)
replace s_14_18_3 = .v if (s_14_18_3 == . | s_14_18_3 == .a)
replace s_14_18_4 = .v if (s_14_18_4 == . | s_14_18_4 == .a)
replace s_14_18_5 = .v if (s_14_18_5 == . | s_14_18_5 == .a)
replace s_14_18_6 = .v if (s_14_18_6 == . | s_14_18_6 == .a)
replace s_14_22 = .v if (s_14_22 == . | s_14_22 == .a)
replace s_14_24 = .v if (s_14_24 == . | s_14_24 == .a)
replace s_14_25 = .v if (s_14_25 == . | s_14_25 == .a)
replace s_14_30b1_p = .v if (s_14_30b1_p == . | s_14_30b1_p == .a)
replace s_14_30b1_d = .v if (s_14_30b1_d == . | s_14_30b1_d == .a)
replace s_14_30b1_c = .v if (s_14_30b1_c == . | s_14_30b1_c == .a)
replace s_14_30b2_p = .v if (s_14_30b2_p == . | s_14_30b2_p == .a)
replace s_14_30b2_d = .v if (s_14_30b2_d == . | s_14_30b2_d == .a)
replace s_14_30b2_c = .v if (s_14_30b2_c == . | s_14_30b2_c == .a)
replace s_14_30b3_p = .v if (s_14_30b3_p == . | s_14_30b3_p == .a)
replace s_14_30b3_d = .v if (s_14_30b3_d == . | s_14_30b3_d == .a)
replace s_14_30b3_c = .v if (s_14_30b3_c == . | s_14_30b3_c == .a)
replace s_14_32 = .v if (s_14_32 == . | s_14_32 == .a)
replace s_15_2 = .v if (s_15_2 == . | s_15_2 == .a)



*all remaining . are converted to .i

replace s_interid = .i if (s_interid == . | s_interid == .a)
replace s_houseid = .i if (s_houseid == . | s_houseid == .a)
replace s_particid = .i if (s_particid == . | s_particid == .a)
replace s_clustid = .i if (s_clustid == . | s_clustid == .a)
replace s_country = .i if (s_country == . | s_country == .a)
replace s_houseid2 = .i if (s_houseid2 == . | s_houseid2 == .a)
replace s_conglid2 = .i if (s_conglid2 == . | s_conglid2 == .a)
replace s_particid2 = ".i" if s_particid2 == ""
replace s_0 = .i if (s_0 == . | s_0 == .a)
replace s_deviceid1 = ".i" if s_deviceid1 == ""
replace s_1_1_p = .i if (s_1_1_p == . | s_1_1_p == .a)
replace s_1_1_d = .i if (s_1_1_d == . | s_1_1_d == .a)
replace s_1_1_c = .i if (s_1_1_c == . | s_1_1_c == .a)
replace s_1_2 = ".i" if (s_1_2 == "" | s_1_2 == ".")
replace s_2_3 = .i if (s_2_3 == . | s_2_3 == .a)
replace s_2_8c = .i if (s_2_8c == . | s_2_8c == .a)
replace s_2_9 = .i if (s_2_9 == . | s_2_9 == .a)
replace s_2_9a = .i if (s_2_9a == . | s_2_9a == .a)
replace s_2_10 = .i if (s_2_10 == . | s_2_10 == .a)
replace s_2_11 = .i if (s_2_11 == . | s_2_11 == .a)
replace s_2_12 = .i if (s_2_12 == . | s_2_12 == .a)
replace s_2_13 = .i if (s_2_13 == . | s_2_13 == .a)
replace s_2_14_p = .i if (s_2_14_p == . | s_2_14_p == .a)
replace s_2_14_d = .i if (s_2_14_d == . | s_2_14_d == .a)
replace s_2_14_c = .i if (s_2_14_c == . | s_2_14_c == .a)
replace s_2_15_p = .i if (s_2_15_p == . | s_2_15_p == .a)
replace s_2_15_d = .i if (s_2_15_d == . | s_2_15_d == .a)
replace s_2_15_c = .i if (s_2_15_c == . | s_2_15_c == .a)
replace s_2_16 = ".i" if (s_2_16 == "" | s_2_16 == ".")
replace s_3_0 = .i if (s_3_0 == . | s_3_0 == .a)
replace s_3_1_p = .i if (s_3_1_p == . | s_3_1_p == .a)
replace s_3_1_d = .i if (s_3_1_d == . | s_3_1_d == .a)
replace s_3_1_c = .i if (s_3_1_c == . | s_3_1_c == .a)
replace s_3_2 = .i if (s_3_2 == . | s_3_2 == .a)
replace s_3_3_p = ".i" if (s_3_3_p == "" | s_3_3_p == ".")
replace s_3_3_d = ".i" if (s_3_3_d == "" | s_3_3_d == ".")
replace s_3_3_c = ".i" if (s_3_3_c == "" | s_3_3_c == ".")
replace s_3_4 = .i if (s_3_4 == . | s_3_4 == .a)
replace s_3_5 = .i if (s_3_5 == . | s_3_5 == .a)
replace s_3_6 = .i if (s_3_6 == . | s_3_6 == .a)
replace s_3_7 = .i if (s_3_7 == . | s_3_7 == .a)
replace s_3_8 = .i if (s_3_8 == . | s_3_8 == .a)
replace s_3_9 = .i if (s_3_9 == . | s_3_9 == .a)
replace s_3_11 = .i if (s_3_11 == . | s_3_11 == .a)
replace s_3_12_1 = .i if (s_3_12_1 == . | s_3_12_1 == .a)
replace s_3_12_2 = .i if (s_3_12_2 == . | s_3_12_2 == .a)
replace s_3_12_3 = .i if (s_3_12_3 == . | s_3_12_3 == .a)
replace s_3_12_6 = .i if (s_3_12_6 == . | s_3_12_6 == .a)
replace s_3_12_8 = .i if (s_3_12_8 == . | s_3_12_8 == .a)
replace s_3_13 = .i if (s_3_13 == . | s_3_13 == .a)
replace s_3_17 = .i if (s_3_17 == . | s_3_17 == .a)
replace s_3_18 = .i if (s_3_18 == . | s_3_18 == .a)
replace s_3_19_1 = .i if (s_3_19_1 == . | s_3_19_1 == .a)
replace s_3_19_2 = .i if (s_3_19_2 == . | s_3_19_2 == .a)
replace s_4_1 = .i if (s_4_1 == . | s_4_1 == .a)
replace s_4_2 = .i if (s_4_2 == . | s_4_2 == .a)
replace s_4_3 = .i if (s_4_3 == . | s_4_3 == .a)
replace s_4_6 = .i if (s_4_6 == . | s_4_6 == .a)
replace s_4_7 = .i if (s_4_7 == . | s_4_7 == .a)
replace s_4_8 = .i if (s_4_8 == . | s_4_8 == .a)
replace s_4_11 = .i if (s_4_11 == . | s_4_11 == .a)
replace s_4_12 = .i if (s_4_12 == . | s_4_12 == .a)
replace s_4_13 = .i if (s_4_13 == . | s_4_13 == .a)
replace s_4_16 = .i if (s_4_16 == . | s_4_16 == .a)
replace s_4_17 = .i if (s_4_17 == . | s_4_17 == .a)
replace s_4_18 = .i if (s_4_18 == . | s_4_18 == .a)
replace s_4_20 = .i if (s_4_20 == . | s_4_20 == .a)
replace s_4_21 = .i if (s_4_21 == . | s_4_21 == .a)
replace s_4_22 = .i if (s_4_22 == . | s_4_22 == .a)
replace s_4_23_1 = .i if (s_4_23_1 == . | s_4_23_1 == .a)
replace s_4_23_2 = .i if (s_4_23_2 == . | s_4_23_2 == .a)
replace s_4_26 = .i if (s_4_26 == . | s_4_26 == .a)
replace s_4_27_1 = .i if (s_4_27_1 == . | s_4_27_1 == .a)
replace s_4_27_2 = .i if (s_4_27_2 == . | s_4_27_2 == .a)
replace s_4_27a = .i if (s_4_27a == . | s_4_27a == .a)
replace s_4_28 = .i if (s_4_28 == . | s_4_28 == .a)
replace s_4_29_1 = .i if (s_4_29_1 == . | s_4_29_1 == .a)
replace s_4_29_2 = .i if (s_4_29_2 == . | s_4_29_2 == .a)
replace s_4_29a = .i if (s_4_29a == . | s_4_29a == .a)
replace s_5_1 = .i if (s_5_1 == . | s_5_1 == .a)
replace s_5_2 = .i if (s_5_2 == . | s_5_2 == .a)
replace s_5_3 = .i if (s_5_3 == . | s_5_3 == .a)
replace s_5_4 = .i if (s_5_4 == . | s_5_4 == .a)
replace s_5_5 = .i if (s_5_5 == . | s_5_5 == .a)
replace s_6_1 = .i if (s_6_1 == . | s_6_1 == .a)
replace s_6_2 = .i if (s_6_2 == . | s_6_2 == .a)
replace s_6_3 = .i if (s_6_3 == . | s_6_3 == .a)
replace s_6_4 = .i if (s_6_4 == . | s_6_4 == .a)
replace s_6_5_p = .i if (s_6_5_p == . | s_6_5_p == .a)
replace s_6_5_d = .i if (s_6_5_d == . | s_6_5_d == .a)
replace s_6_5_c = .i if (s_6_5_c == . | s_6_5_c == .a)
replace s_6_6 = .i if (s_6_6 == . | s_6_6 == .a)
replace s_6_7 = .i if (s_6_7 == . | s_6_7 == .a)
replace s_7_0 = .i if (s_7_0 == . | s_7_0 == .a)
replace s_7_1 = .i if (s_7_1 == . | s_7_1 == .a)
replace s_7_2a = .i if (s_7_2a == . | s_7_2a == .a)
replace s_7_2b = .i if (s_7_2b == . | s_7_2b == .a)
replace s_7_2c = .i if (s_7_2c == . | s_7_2c == .a)
replace s_7_3 = .i if (s_7_3 == . | s_7_3 == .a)
replace s_7_4a = .i if (s_7_4a == . | s_7_4a == .a)
replace s_7_4b = .i if (s_7_4b == . | s_7_4b == .a)
replace s_7_4c = .i if (s_7_4c == . | s_7_4c == .a)
replace s_7_5a = .i if (s_7_5a == . | s_7_5a == .a)
replace s_7_5b = .i if (s_7_5b == . | s_7_5b == .a)
replace s_7_5c = .i if (s_7_5c == . | s_7_5c == .a)
replace s_7_6a = .i if (s_7_6a == . | s_7_6a == .a)
replace s_7_6b = .i if (s_7_6b == . | s_7_6b == .a)
replace s_7_7a = .i if (s_7_7a == . | s_7_7a == .a)
replace s_7_7b = .i if (s_7_7b == . | s_7_7b == .a)
replace s_7_7c = .i if (s_7_7c == . | s_7_7c == .a)
replace s_7_7d = .i if (s_7_7d == . | s_7_7d == .a)
replace s_7_7e = .i if (s_7_7e == . | s_7_7e == .a)
replace s_7_7f = .i if (s_7_7f == . | s_7_7f == .a)
replace s_7_7g = .i if (s_7_7g == . | s_7_7g == .a)
replace s_7_7h = .i if (s_7_7h == . | s_7_7h == .a)
replace s_7_7i = .i if (s_7_7i == . | s_7_7i == .a)
replace s_7_7j = .i if (s_7_7j == . | s_7_7j == .a)
replace s_7_7k = .i if (s_7_7k == . | s_7_7k == .a)
replace s_8_1 = .i if (s_8_1 == . | s_8_1 == .a)
replace s_8_2 = .i if (s_8_2 == . | s_8_2 == .a)
replace s_8_3 = .i if (s_8_3 == . | s_8_3 == .a)
replace s_8_3a = ".i" if (s_8_3a == "" | s_8_3a == ".")
replace s_8_4 = .i if (s_8_4 == . | s_8_4 == .a)
replace s_8_5a = .i if (s_8_5a == . | s_8_5a == .a)
replace s_8_5b2 = .i if (s_8_5b2 == . | s_8_5b2 == .a)
replace s_8_5b1 = .i if (s_8_5b1 == . | s_8_5b1 == .a)
replace s_8_5b4 = .i if (s_8_5b4 == . | s_8_5b4 == .a)
replace s_8_5b3 = .i if (s_8_5b3 == . | s_8_5b3 == .a)
replace s_8_5b5 = .i if (s_8_5b5 == . | s_8_5b5 == .a)
replace s_8_5b6 = .i if (s_8_5b6 == . | s_8_5b6 == .a)
replace s_8_5b7 = .i if (s_8_5b7 == . | s_8_5b7 == .a)
replace s_8_5b8 = .i if (s_8_5b8 == . | s_8_5b8 == .a)
replace s_8_5b9 = .i if (s_8_5b9 == . | s_8_5b9 == .a)
capture replace s_8_5b10 = .i if (s_8_5b10 == . | s_8_5b10 == .a)
replace s_8_5c = .i if (s_8_5c == . | s_8_5c == .a)
replace s_8_5d = .i if (s_8_5d == . | s_8_5d == .a)
replace s_8_7 = .i if (s_8_7 == . | s_8_7 == .a)
replace s_8_8 = .i if (s_8_8 == . | s_8_8 == .a)
replace s_8_9 = .i if (s_8_9 == . | s_8_9 == .a)
replace s_8_10 = .i if (s_8_10 == . | s_8_10 == .a)
replace s_8_11 = .i if (s_8_11 == . | s_8_11 == .a)
replace s_8_12 = .i if (s_8_12 == . | s_8_12 == .a)
replace s_8_13 = .i if (s_8_13 == . | s_8_13 == .a)
replace s_8_14 = .i if (s_8_14 == . | s_8_14 == .a)
replace s_8_15 = .i if (s_8_15 == . | s_8_15 == .a)
replace s_8_16 = .i if (s_8_16 == . | s_8_16 == .a)
replace s_9_1 = .i if (s_9_1 == . | s_9_1 == .a)
replace s_9_3 = .i if (s_9_3 == . | s_9_3 == .a)
replace s_9_4 = .i if (s_9_4 == . | s_9_4 == .a)
replace s_9_5 = .i if (s_9_5 == . | s_9_5 == .a)
replace s_9_6 = .i if (s_9_6 == . | s_9_6 == .a)
replace s_9_7 = .i if (s_9_7 == . | s_9_7 == .a)
replace s_9_8 = .i if (s_9_8 == . | s_9_8 == .a)
replace s_9_9 = .i if (s_9_9 == . | s_9_9 == .a)
replace s_9_11 = .i if (s_9_11 == . | s_9_11 == .a)
replace s_9_13 = .i if (s_9_13 == . | s_9_13 == .a)
replace s_9_14 = .i if (s_9_14 == . | s_9_14 == .a)
replace s_9_15 = .i if (s_9_15 == . | s_9_15 == .a)
replace s_9_16 = .i if (s_9_16 == . | s_9_16 == .a)
replace s_9_17 = .i if (s_9_17 == . | s_9_17 == .a)
replace s_9_18 = .i if (s_9_18 == . | s_9_18 == .a)
replace s_9_19 = .i if (s_9_19 == . | s_9_19 == .a)
replace s_9_20 = .i if (s_9_20 == . | s_9_20 == .a)
replace s_9_21a = .i if (s_9_21a == . | s_9_21a == .a)
replace s_9_21b = ".i" if (s_9_21b == "" | s_9_21b == ".")
replace s_9_22 = .i if (s_9_22 == . | s_9_22 == .a)
replace s_9_23 = .i if (s_9_23 == . | s_9_23 == .a)
replace s_9_24 = .i if (s_9_24 == . | s_9_24 == .a)
replace s_9_25 = .i if (s_9_25 == . | s_9_25 == .a)
replace s_9_26 = .i if (s_9_26 == . | s_9_26 == .a)
replace s_9_28 = .i if (s_9_28 == . | s_9_28 == .a)
replace s_9_29 = .i if (s_9_29 == . | s_9_29 == .a)
replace s_9_30 = .i if (s_9_30 == . | s_9_30 == .a)
replace s_9_31 = .i if (s_9_31 == . | s_9_31 == .a)
replace s_9_32 = .i if (s_9_32 == . | s_9_32 == .a)
replace s_9_33 = .i if (s_9_33 == . | s_9_33 == .a)
replace s_9_35 = .i if (s_9_35 == . | s_9_35 == .a)
replace s_9_36 = .i if (s_9_36 == . | s_9_36 == .a)
replace s_9_37 = .i if (s_9_37 == . | s_9_37 == .a)
replace s_9_38a = .i if (s_9_38a == . | s_9_38a == .a)
replace s_9_38g = .i if (s_9_38g == . | s_9_38g == .a)
replace s_9_38b = .i if (s_9_38b == . | s_9_38b == .a)
replace s_9_38f = .i if (s_9_38f == . | s_9_38f == .a)
replace s_9_38c = .i if (s_9_38c == . | s_9_38c == .a)
replace s_9_38d = .i if (s_9_38d == . | s_9_38d == .a)
replace s_9_38j = .i if (s_9_38j == . | s_9_38j == .a)
replace s_9_38e = .i if (s_9_38e == . | s_9_38e == .a)
replace s_9_38k = .i if (s_9_38k == . | s_9_38k == .a)
replace s_9_38h = .i if (s_9_38h == . | s_9_38h == .a)
replace s_9_38l = .i if (s_9_38l == . | s_9_38l == .a)
replace s_9_38i = .i if (s_9_38i == . | s_9_38i == .a)
replace s_9_39 = .i if (s_9_39 == . | s_9_39 == .a)
replace s_9_40 = .i if (s_9_40 == . | s_9_40 == .a)
replace s_9_41 = .i if (s_9_41 == . | s_9_41 == .a)
replace s_9_42 = .i if (s_9_42 == . | s_9_42 == .a)
replace s_9_43a = .i if (s_9_43a == . | s_9_43a == .a)
replace s_9_44 = .i if (s_9_44 == . | s_9_44 == .a)
replace s_9_45a = .i if (s_9_45a == . | s_9_45a == .a)
replace s_9_46 = .i if (s_9_46 == . | s_9_46 == .a)
replace s_9_47 = .i if (s_9_47 == . | s_9_47 == .a)
replace s_9_48 = .i if (s_9_48 == . | s_9_48 == .a)
replace s_9_49 = .i if (s_9_49 == . | s_9_49 == .a)
replace s_9_50 = .i if (s_9_50 == . | s_9_50 == .a)
replace s_9_51 = .i if (s_9_51 == . | s_9_51 == .a)
replace s_9_52 = .i if (s_9_52 == . | s_9_52 == .a)
replace s_9_53 = .i if (s_9_53 == . | s_9_53 == .a)
replace s_9_54 = .i if (s_9_54 == . | s_9_54 == .a)
replace s_9_55 = .i if (s_9_55 == . | s_9_55 == .a)
replace s_9_56 = .i if (s_9_56 == . | s_9_56 == .a)
replace s_9_57 = .i if (s_9_57 == . | s_9_57 == .a)
replace s_9_58 = .i if (s_9_58 == . | s_9_58 == .a)
replace s_9_59 = .i if (s_9_59 == . | s_9_59 == .a)
replace s_9_60 = .i if (s_9_60 == . | s_9_60 == .a)
replace s_9_61 = .i if (s_9_61 == . | s_9_61 == .a)
replace s_9_61a = .i if (s_9_61a == . | s_9_61a == .a)
replace s_9_62 = .i if (s_9_62 == . | s_9_62 == .a)
replace s_9_63 = .i if (s_9_63 == . | s_9_63 == .a)
replace s_9_64_1 = .i if (s_9_64_1 == . | s_9_64_1 == .a)
replace s_9_64_2 = .i if (s_9_64_2 == . | s_9_64_2 == .a)
replace s_9_64_3 = .i if (s_9_64_3 == . | s_9_64_3 == .a)
replace s_9_64_4 = .i if (s_9_64_4 == . | s_9_64_4 == .a)
replace s_9_65 = .i if (s_9_65 == . | s_9_65 == .a)
replace s_9_66 = .i if (s_9_66 == . | s_9_66 == .a)
replace s_10_1a = .i if (s_10_1a == . | s_10_1a == .a)
replace s_10_1b = .i if (s_10_1b == . | s_10_1b == .a)
replace s_10_1c = .i if (s_10_1c == . | s_10_1c == .a)
replace s_10_1d = .i if (s_10_1d == . | s_10_1d == .a)
replace s_10_1e = .i if (s_10_1e == . | s_10_1e == .a)
replace s_10_1f = .i if (s_10_1f == . | s_10_1f == .a)
replace s_10_1g = .i if (s_10_1g == . | s_10_1g == .a)
replace s_10_1h = .i if (s_10_1h == . | s_10_1h == .a)
replace s_10_2 = .i if (s_10_2 == . | s_10_2 == .a)
replace s_10_3 = .i if (s_10_3 == . | s_10_3 == .a)
replace s_10_4 = .i if (s_10_4 == . | s_10_4 == .a)
replace s_10_5 = .i if (s_10_5 == . | s_10_5 == .a)
replace s_10_6_1 = .i if (s_10_6_1 == . | s_10_6_1 == .a)
replace s_10_6_1a = .i if (s_10_6_1a == . | s_10_6_1a == .a)
replace s_10_6_2 = .i if (s_10_6_2 == . | s_10_6_2 == .a)
replace s_10_6_2a = .i if (s_10_6_2a == . | s_10_6_2a == .a)
replace s_10_6_3 = .i if (s_10_6_3 == . | s_10_6_3 == .a)
replace s_10_6_3a = .i if (s_10_6_3a == . | s_10_6_3a == .a)
replace s_10_6_4 = .i if (s_10_6_4 == . | s_10_6_4 == .a)
replace s_10_6_4a = .i if (s_10_6_4a == . | s_10_6_4a == .a)
replace s_10_7_1 = .i if (s_10_7_1 == . | s_10_7_1 == .a)
replace s_10_7_2 = .i if (s_10_7_2 == . | s_10_7_2 == .a)
replace s_11_1 = .i if (s_11_1 == . | s_11_1 == .a)
replace s_11_2 = .i if (s_11_2 == . | s_11_2 == .a)
replace s_11_3 = .i if (s_11_3 == . | s_11_3 == .a)
replace s_12_1a = .i if (s_12_1a == . | s_12_1a == .a)
replace s_12_1b = .i if (s_12_1b == . | s_12_1b == .a)
replace s_12_1c = .i if (s_12_1c == . | s_12_1c == .a)
replace s_12_2a = .i if (s_12_2a == . | s_12_2a == .a)
replace s_12_2c = .i if (s_12_2c == . | s_12_2c == .a)
replace s_12_3a = .i if (s_12_3a == . | s_12_3a == .a)
replace s_12_3c = .i if (s_12_3c == . | s_12_3c == .a)
replace s_12_4a = .i if (s_12_4a == . | s_12_4a == .a)
replace s_12_4b = .i if (s_12_4b == . | s_12_4b == .a)
replace s_12_4c = .i if (s_12_4c == . | s_12_4c == .a)
replace s_12_5a = .i if (s_12_5a == . | s_12_5a == .a)
replace s_12_5c = .i if (s_12_5c == . | s_12_5c == .a)
replace s_12_6a = .i if (s_12_6a == . | s_12_6a == .a)
replace s_12_6c = .i if (s_12_6c == . | s_12_6c == .a)
replace s_12_7 = .i if (s_12_7 == . | s_12_7 == .a)
replace s_12_8 = .i if (s_12_8 == . | s_12_8 == .a)
replace s_12_9 = .i if (s_12_9 == . | s_12_9 == .a)
replace s_12_10 = .i if (s_12_10 == . | s_12_10 == .a)
replace s_12_11 = .i if (s_12_11 == . | s_12_11 == .a)
replace s_12_13 = .i if (s_12_13 == . | s_12_13 == .a)
replace s_12_14 = .i if (s_12_14 == . | s_12_14 == .a)
replace s_12_15 = .i if (s_12_15 == . | s_12_15 == .a)
replace s_12_16 = .i if (s_12_16 == . | s_12_16 == .a)
replace s_13_1_p_c = .i if (s_13_1_p_c == . | s_13_1_p_c == .a)
replace s_13_1_d = .i if (s_13_1_d == . | s_13_1_d == .a)
replace s_13_2 = .i if (s_13_2 == . | s_13_2 == .a)
replace s_13_3_p_c = .i if (s_13_3_p_c == . | s_13_3_p_c == .a)
replace s_13_3_d = .i if (s_13_3_d == . | s_13_3_d == .a)
replace s_13_4 = .i if (s_13_4 == . | s_13_4 == .a)
replace s_13_5 = .i if (s_13_5 == . | s_13_5 == .a)
replace s_13_6_p_c = .i if (s_13_6_p_c == . | s_13_6_p_c == .a)
replace s_13_6_d = .i if (s_13_6_d == . | s_13_6_d == .a)
replace s_13_7_p_c = .i if (s_13_7_p_c == . | s_13_7_p_c == .a)
replace s_13_7_d = .i if (s_13_7_d == . | s_13_7_d == .a)
replace s_13_8 = .i if (s_13_8 == . | s_13_8 == .a)
replace s_13_9 = .i if (s_13_9 == . | s_13_9 == .a)
replace s_13_10 = .i if (s_13_10 == . | s_13_10 == .a)
replace s_13_11 = .i if (s_13_11 == . | s_13_11 == .a)
replace s_13_12 = .i if (s_13_12 == . | s_13_12 == .a)
replace s_13_13 = .i if (s_13_13 == . | s_13_13 == .a)
replace s_13_14 = .i if (s_13_14 == . | s_13_14 == .a)
replace s_13_15 = .i if (s_13_15 == . | s_13_15 == .a)
replace s_13_16 = .i if (s_13_16 == . | s_13_16 == .a)
replace s_13_17 = .i if (s_13_17 == . | s_13_17 == .a)
replace s_13_18 = .i if (s_13_18 == . | s_13_18 == .a)
replace s_13_19 = .i if (s_13_19 == . | s_13_19 == .a)
replace s_13_20 = .i if (s_13_20 == . | s_13_20 == .a)
replace s_13_22 = .i if (s_13_22 == . | s_13_22 == .a)
replace s_13_23_p = .i if (s_13_23_p == . | s_13_23_p == .a)
replace s_13_23_d_c = .i if (s_13_23_d_c == . | s_13_23_d_c == .a)
replace s_13_24 = .i if (s_13_24 == . | s_13_24 == .a)
replace s_13_25_d_c = .i if (s_13_25_d_c == . | s_13_25_d_c == .a)
replace s_13_25_p = .i if (s_13_25_p == . | s_13_25_p == .a)
replace s_13_26 = .i if (s_13_26 == . | s_13_26 == .a)
replace s_13_27_d_c = .i if (s_13_27_d_c == . | s_13_27_d_c == .a)
replace s_13_27_p = .i if (s_13_27_p == . | s_13_27_p == .a)
replace s_13_28 = .i if (s_13_28 == . | s_13_28 == .a)
replace s_13_29 = .i if (s_13_29 == . | s_13_29 == .a)
replace s_13_30_d_c = .i if (s_13_30_d_c == . | s_13_30_d_c == .a)
replace s_13_30_p = .i if (s_13_30_p == . | s_13_30_p == .a)
replace s_14_1_p_d = .i if (s_14_1_p_d == . | s_14_1_p_d == .a)
replace s_14_2a_p = .i if (s_14_2a_p == . | s_14_2a_p == .a)
replace s_14_2b_p = .i if (s_14_2b_p == . | s_14_2b_p == .a)
replace s_14_2c_p = .i if (s_14_2c_p == . | s_14_2c_p == .a)
replace s_14_2d_p = .i if (s_14_2d_p == . | s_14_2d_p == .a)
replace s_14_2e_p = .i if (s_14_2e_p == . | s_14_2e_p == .a)
replace s_14_2f_p = .i if (s_14_2f_p == . | s_14_2f_p == .a)
replace s_14_2g_p = .i if (s_14_2g_p == . | s_14_2g_p == .a)
replace s_14_2h_p = .i if (s_14_2h_p == . | s_14_2h_p == .a)
replace s_14_2i_p = .i if (s_14_2i_p == . | s_14_2i_p == .a)
replace s_14_2j_p = .i if (s_14_2j_p == . | s_14_2j_p == .a)
replace s_14_2a_d = .i if (s_14_2a_d == . | s_14_2a_d == .a)
replace s_14_2b_d = .i if (s_14_2b_d == . | s_14_2b_d == .a)
replace s_14_2c_d = .i if (s_14_2c_d == . | s_14_2c_d == .a)
replace s_14_2d_d = .i if (s_14_2d_d == . | s_14_2d_d == .a)
replace s_14_2e_d = .i if (s_14_2e_d == . | s_14_2e_d == .a)
replace s_14_2f_d = .i if (s_14_2f_d == . | s_14_2f_d == .a)
replace s_14_2g_d = .i if (s_14_2g_d == . | s_14_2g_d == .a)
replace s_14_3 = .i if (s_14_3 == . | s_14_3 == .a)
replace s_14_4 = .i if (s_14_4 == . | s_14_4 == .a)
replace s_14_5 = .i if (s_14_5 == . | s_14_5 == .a)
replace s_14_6 = .i if (s_14_6 == . | s_14_6 == .a)
replace s_14_8 = .i if (s_14_8 == . | s_14_8 == .a)
replace s_14_9 = .i if (s_14_9 == . | s_14_9 == .a)
replace s_14_11 = .i if (s_14_11 == . | s_14_11 == .a)
replace s_14_12 = .i if (s_14_12 == . | s_14_12 == .a)
replace s_14_13 = .i if (s_14_13 == . | s_14_13 == .a)
replace s_14_14 = .i if (s_14_14 == . | s_14_14 == .a)
replace s_14_15 = .i if (s_14_15 == . | s_14_15 == .a)
replace s_14_16 = .i if (s_14_16 == . | s_14_16 == .a)
replace s_14_17 = .i if (s_14_17 == . | s_14_17 == .a)
replace s_14_18_1 = .i if (s_14_18_1 == . | s_14_18_1 == .a)
replace s_14_18_2 = .i if (s_14_18_2 == . | s_14_18_2 == .a)
replace s_14_18_3 = .i if (s_14_18_3 == . | s_14_18_3 == .a)
replace s_14_18_4 = .i if (s_14_18_4 == . | s_14_18_4 == .a)
replace s_14_18_5 = .i if (s_14_18_5 == . | s_14_18_5 == .a)
replace s_14_18_6 = .i if (s_14_18_6 == . | s_14_18_6 == .a)
replace s_14_20 = .i if (s_14_20 == . | s_14_20 == .a)
replace s_14_22 = .i if (s_14_22 == . | s_14_22 == .a)
replace s_14_23 = .i if (s_14_23 == . | s_14_23 == .a)
replace s_14_24 = .i if (s_14_24 == . | s_14_24 == .a)
replace s_14_25 = .i if (s_14_25 == . | s_14_25 == .a)
replace s_14_30a = .i if (s_14_30a == . | s_14_30a == .a)
replace s_14_30b1_p = .i if (s_14_30b1_p == . | s_14_30b1_p == .a)
replace s_14_30b1_d = .i if (s_14_30b1_d == . | s_14_30b1_d == .a)
replace s_14_30b1_c = .i if (s_14_30b1_c == . | s_14_30b1_c == .a)
replace s_14_30b2_p = .i if (s_14_30b2_p == . | s_14_30b2_p == .a)
replace s_14_30b2_d = .i if (s_14_30b2_d == . | s_14_30b2_d == .a)
replace s_14_30b2_c = .i if (s_14_30b2_c == . | s_14_30b2_c == .a)
replace s_14_30b3_p = .i if (s_14_30b3_p == . | s_14_30b3_p == .a)
replace s_14_30b3_d = .i if (s_14_30b3_d == . | s_14_30b3_d == .a)
replace s_14_30b3_c = .i if (s_14_30b3_c == . | s_14_30b3_c == .a)
replace s_14_31 = .i if (s_14_31 == . | s_14_31 == .a)
replace s_14_32 = .i if (s_14_32 == . | s_14_32 == .a)
replace s_14_33 = .i if (s_14_33 == . | s_14_33 == .a)
replace s_15_1 = .i if (s_15_1 == . | s_15_1 == .a)
replace s_15_2 = .i if (s_15_2 == . | s_15_2 == .a)
replace s_15_3 = .i if (s_15_3 == . | s_15_3 == .a)
replace s_deviceid2 = ".i" if s_deviceid2 == ""




*drop all uppercase variables

drop S_*




*COUNTS NUMBER OF .i IN EACH OBSERVATION UNDER NEW VARIABLE CALLED s_countmissing
local i 1
gen s_countmissing = 0

quietly ds s_8_5b2_delete hhid pid s_date_end s_time_end_1 s_time_end s_77l s_time1 s_date fkey globalrecordid s_deviceid2, not
*deleting s_77l for now until Ty can confirm why
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace s_countmissing = s_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace s_countmissing = s_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}




*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED s_last
local i 1
gen s_last = "AllAnswered"

quietly ds s_last s_countmissing s_8_5b2_delete hhid pid s_time2 s_date_end s_time_end_1 s_time_end s_77l s_time1 s_date fkey globalrecordid s_deviceid2, not
*s_77l deleted for now
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
				replace s_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace s_last = "`v'" in `i'
				continue, break
			}
		}
	}
}



gen s_temptime1 = substr(s_time1, 1, strpos(s_time1, ":") + 2)
gen s_temptime2 = substr(s_time_end, 1, strpos(s_time_end, ":") + 2)
gen s_TotalTimeTemp = (Clock(s_temptime2, "hm") - Clock(s_temptime1, "hm"))/1000/60

gen s_tempdate = s_date_end
replace s_tempdate = subinstr(s_tempdate, "ene", "January",.)
replace s_tempdate = subinstr(s_tempdate, "feb", "February",.)

replace s_tempdate = subinstr(s_tempdate, "abr", "April",.)

replace s_tempdate = subinstr(s_tempdate, "ago", "August",.)
replace s_tempdate = subinstr(s_tempdate, "sept", "September",.)
replace s_tempdate = subinstr(s_tempdate, "oct", "October",.)
replace s_tempdate = subinstr(s_tempdate, "nov", "November",.)
replace s_tempdate = subinstr(s_tempdate, "dic", "December",.)

gen s_total_days = (date(s_date_end, "MDY") - date(s_date, "YMD"))
gen s_total_days2 = (date(s_tempdate, "DMY") - date(s_date, "YMD"))

gen s_TotalTime = 0

quietly forvalues obs = 1(1) `=_N' {
if s_total_days[`obs'] ~= . {
	replace s_TotalTime = s_TotalTimeTemp + s_total_days * (24*60) in `obs'
	}

else if s_total_days2[`obs'] ~= . {
	replace s_TotalTime = s_TotalTimeTemp + s_total_days2 * (24*60) in `obs'
	}
else {
	replace s_TotalTime = s_TotalTimeTemp in `obs'
	}
}

drop s_temptime1 s_temptime2 s_TotalTimeTemp s_tempdate s_total_days s_total_days2


*depression score from s.10.1
gen s_depression_score = 0
replace s_depression_score = (s_depression_score + 1) if s_10_1a == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1b == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1c == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1d == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1e == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1f == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1g == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1h == 1



capture log close
log using logs/SocioMissingCodebook, text replace

codebook

log close

save Socio.dta, replace
 
 * Get the list of variable names
unab varlist : _all

* Convert variables with value labels into string variables
foreach var of varlist `varlist' {
    if "`: value label `var''" != "" {
        tostring `var', replace
    }
}

clear all

if `country' == 0 {
    insheet using "../PR_in/Socio_Parent.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Socio_Parent.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Socio_Parent.csv", comma names clear
}


keep globalrecordid s_clustid1 s_houseid1 s_particid1
rename globalrecordid fkey
rename s_clustid1 s_parent_clustid
rename s_houseid1 s_parent_houseid
rename s_particid1 s_parent_particid

merge 1:1 fkey using Socio 

drop if _merge == 1
drop _merge

drop pid2

gen s_country_str = string(s_country, "%12.0f")

gen s_clustid_str = string(s_parent_clustid, "%12.0f")
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)

gen s_houseid_str = string(s_parent_houseid, "%03.0f")
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)

gen s_particid_str = string(s_parent_particid, "%12.0f")
replace s_particid_str = cond(strlen(s_particid_str) == 1, "0" + s_particid_str, s_particid_str)

gen pid_parent = s_country_str + s_clustid_str + s_houseid_str + s_particid_str

sort s_parent_clustid s_parent_houseid

* checking to see if ID's on first page match the second
gen pid_nonmatch = 1 if (pid != pid_parent & s_parent_clustid != .)

order pid_parent pid pid_nonmatch globalrecordid

drop s_clustid_str s_houseid_str s_particid_str s_country_str s_houseid2 s_conglid2 s_particid2

replace s_clustid = s_parent_clustid if s_clustid == .i

save Socio.dta, replace
