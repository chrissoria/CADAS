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
    insheet using "../PR_in/Household_Child.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Household_Child.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Household_Child.csv", comma names clear
}

*converting numeric to strings

generate H_3_1 = cond(h_3_1 ==  0, "propietario", cond(h_3_1 ==  1, "alquilada", cond(h_3_1 ==  2, "otro", "")))

drop h_3_1

generate H_3_3A_P = cond(h_3_3a_p ==  0, "si", cond(h_3_3a_p ==  1, "no", cond(h_3_3a_p ==  2, "no responde", cond(h_3_3a_p ==  3, "no sabe", ""))))

drop h_3_3a_p

generate H_3_3A_D = cond(h_3_3a_d ==  0, "si", cond(h_3_3a_d ==  1, "no", cond(h_3_3a_d ==  2, "no responde", cond(h_3_3a_d ==  3, "no sabe", ""))))

drop h_3_3a_d

generate H_3_3A_C = cond(h_3_3a_c ==  0, "si", cond(h_3_3a_c ==  1, "no", cond(h_3_3a_c ==  2, "no responde", cond(h_3_3a_c ==  3, "no sabe", ""))))

drop h_3_3a_c

generate H_3_3B_P = cond(h_3_3b_p ==  0, "si", cond(h_3_3b_p ==  1, "no", cond(h_3_3b_p ==  2, "no responde", cond(h_3_3b_p ==  3, "no sabe", ""))))

drop h_3_3b_p

generate H_3_3B_D = cond(h_3_3b_d ==  0, "si", cond(h_3_3b_d ==  1, "no", cond(h_3_3b_d ==  2, "no responde", cond(h_3_3b_d ==  3, "no sabe", ""))))

drop h_3_3b_d

generate H_3_3B_C = cond(h_3_3b_c ==  0, "si", cond(h_3_3b_c ==  1, "no", cond(h_3_3b_c ==  2, "no responde", cond(h_3_3b_c ==  3, "no sabe", ""))))

drop h_3_3b_c

generate H_3_3C_P = cond(h_3_3c_p ==  0, "si", cond(h_3_3c_p ==  1, "no", cond(h_3_3c_p ==  2, "no responde", cond(h_3_3c_p ==  3, "no sabe", ""))))

drop h_3_3c_p

generate H_3_3C_D = cond(h_3_3c_d ==  0, "si", cond(h_3_3c_d ==  1, "no", cond(h_3_3c_d ==  2, "no responde", cond(h_3_3c_d ==  3, "no sabe", ""))))

drop h_3_3c_d

generate H_3_3C_C = cond(h_3_3c_c ==  0, "si", cond(h_3_3c_c ==  1, "no", cond(h_3_3c_c ==  2, "no responde", cond(h_3_3c_c ==  3, "no sabe", ""))))

drop h_3_3c_c

generate H_3_5A_P = cond(h_3_5a_p ==  0, "si", cond(h_3_5a_p ==  1, "no", cond(h_3_5a_p ==  2, "no responde", cond(h_3_5a_p ==  3, "no sabe", ""))))

drop h_3_5a_p

generate H_3_5A_D = cond(h_3_5a_d ==  0, "si", cond(h_3_5a_d ==  1, "no", cond(h_3_5a_d ==  2, "no responde", cond(h_3_5a_d ==  3, "no sabe", ""))))

drop h_3_5a_d

generate H_3_5A_C = cond(h_3_5a_c ==  0, "si", cond(h_3_5a_c ==  1, "no", cond(h_3_5a_c ==  2, "no responde", cond(h_3_5a_c ==  3, "no sabe", ""))))

drop h_3_5a_c

generate H_3_5B_P = cond(h_3_5b_p ==  0, "si", cond(h_3_5b_p ==  1, "no", cond(h_3_5b_p ==  2, "no responde", cond(h_3_5b_p ==  3, "no sabe", ""))))

drop h_3_5b_p

generate H_3_5B_D = cond(h_3_5b_d ==  0, "si", cond(h_3_5b_d ==  1, "no", cond(h_3_5b_d ==  2, "no responde", cond(h_3_5b_d ==  3, "no sabe", ""))))

drop h_3_5b_d

generate H_3_5B_C = cond(h_3_5b_c ==  0, "si", cond(h_3_5b_c ==  1, "no", cond(h_3_5b_c ==  2, "no responde", cond(h_3_5b_c ==  3, "no sabe", ""))))

drop h_3_5b_c

generate H_3_5C_P = cond(h_3_5c_p ==  0, "si", cond(h_3_5c_p ==  1, "no", cond(h_3_5c_p ==  2, "no responde", cond(h_3_5c_p ==  3, "no sabe", ""))))

drop h_3_5c_p

generate H_3_5C_D = cond(h_3_5c_d ==  0, "si", cond(h_3_5c_d ==  1, "no", cond(h_3_5c_d ==  2, "no responde", cond(h_3_5c_d ==  3, "no sabe", ""))))

drop h_3_5c_d

generate H_3_5C_C = cond(h_3_5c_c ==  0, "si", cond(h_3_5c_c ==  1, "no", cond(h_3_5c_c ==  2, "no responde", cond(h_3_5c_c ==  3, "no sabe", ""))))

drop h_3_5c_c

generate H_3_7A_P = cond(h_3_7a_p ==  0, "si", cond(h_3_7a_p ==  1, "no", cond(h_3_7a_p ==  2, "no responde", cond(h_3_7a_p ==  3, "no sabe", ""))))

drop h_3_7a_p

generate H_3_7A_D = cond(h_3_7a_d ==  0, "si", cond(h_3_7a_d ==  1, "no", cond(h_3_7a_d ==  2, "no responde", cond(h_3_7a_d ==  3, "no sabe", ""))))

drop h_3_7a_d

generate H_3_7A_C = cond(h_3_7a_c ==  0, "si", cond(h_3_7a_c ==  1, "no", cond(h_3_7a_c ==  2, "no responde", cond(h_3_7a_c ==  3, "no sabe", ""))))

drop h_3_7a_c

generate H_3_7B_P = cond(h_3_7b_p ==  0, "si", cond(h_3_7b_p ==  1, "no", cond(h_3_7b_p ==  2, "no responde", cond(h_3_7b_p ==  3, "no sabe", ""))))

drop h_3_7b_p

generate H_3_7B_D = cond(h_3_7b_d ==  0, "si", cond(h_3_7b_d ==  1, "no", cond(h_3_7b_d ==  2, "no responde", cond(h_3_7b_d ==  3, "no sabe", ""))))

drop h_3_7b_d

generate H_3_7B_C = cond(h_3_7b_c ==  0, "si", cond(h_3_7b_c ==  1, "no", cond(h_3_7b_c ==  2, "no responde", cond(h_3_7b_c ==  3, "no sabe", ""))))

drop h_3_7b_c

generate H_3_7C_P = cond(h_3_7c_p ==  0, "si", cond(h_3_7c_p ==  1, "no", cond(h_3_7c_p ==  2, "no responde", cond(h_3_7c_p ==  3, "no sabe", ""))))

drop h_3_7c_p

generate H_3_7C_D = cond(h_3_7c_d ==  0, "si", cond(h_3_7c_d ==  1, "no", cond(h_3_7c_d ==  2, "no responde", cond(h_3_7c_d ==  3, "no sabe", ""))))

drop h_3_7c_d

generate H_3_7C_C = cond(h_3_7c_c ==  0, "si", cond(h_3_7c_c ==  1, "no", cond(h_3_7c_c ==  2, "no responde", cond(h_3_7c_c ==  3, "no sabe", ""))))

drop h_3_7c_c

generate H_3_8 = cond(h_3_8 ==  0, "concreto", cond(h_3_8 ==  1, "tejas", cond(h_3_8 ==  2, "madera", cond(h_3_8 ==  3, "zinc", cond(h_3_8 ==  4, "otro", cond(h_3_8 ==  5, "no responde", cond(h_3_8 ==  6, "no sabe", "")))))))

drop h_3_8

generate N10ENESTAVIVIENDATIENEN = cond(n10enestaviviendatienen ==  0, "agua de tuberia dentro de la vivienda?", cond(n10enestaviviendatienen ==  1, "agua de tuberia fuera de la vivienda pero dentro del terreno?", cond(n10enestaviviendatienen ==  2, "otra agua de tuberia?", cond(n10enestaviviendatienen ==  3, "otra no de tuberia (pipa pozo río otro)?", cond(n10enestaviviendatienen ==  4, "no responde", cond(n10enestaviviendatienen ==  5, "no sabe", ""))))))

drop n10enestaviviendatienen

generate H_3_11 = cond(h_3_11 ==  0, "tiene conexión de agua?", cond(h_3_11 ==  1, "le echan agua con cubeta?", cond(h_3_11 ==  2, "no se le echa agua? (letrina)", cond(h_3_11 ==  3, "no tiene", cond(h_3_11 ==  4, "no responde", cond(h_3_11 ==  5, "no sabe", ""))))))

drop h_3_11

generate H_3_12 = cond(h_3_12 ==  0, "si", cond(h_3_12 ==  1, "no", cond(h_3_12 ==  2, "no responde", cond(h_3_12 ==  3, "no sabe", ""))))

drop h_3_12

generate S_3_13 = cond(s_3_13 ==  0, "gas?", cond(s_3_13 ==  1, "leña o carbón?", cond(s_3_13 ==  2, "electricidad", cond(s_3_13 ==  3, "otro", cond(s_3_13 ==  4, "no responde", cond(s_3_13 ==  5, "no sabe", ""))))))

drop s_3_13

generate H_3_14_1 = cond(h_3_14_1 ==  0, "si", cond(h_3_14_1 ==  1, "no", cond(h_3_14_1 ==  2, "no responde", cond(h_3_14_1 ==  3, "no sabe", ""))))

drop h_3_14_1

generate H_3_14_2 = cond(h_3_14_2 ==  0, "si", cond(h_3_14_2 ==  1, "no", cond(h_3_14_2 ==  2, "no responde", cond(h_3_14_2 ==  3, "no sabe", ""))))

drop h_3_14_2

generate H_3_14_3 = cond(h_3_14_3 ==  0, "si", cond(h_3_14_3 ==  1, "no", cond(h_3_14_3 ==  2, "no responde", cond(h_3_14_3 ==  3, "no sabe", ""))))

drop h_3_14_3

generate H_3_14_4 = cond(h_3_14_4 ==  0, "si", cond(h_3_14_4 ==  1, "no", cond(h_3_14_4 ==  2, "no responde", cond(h_3_14_4 ==  3, "no sabe", ""))))

drop h_3_14_4

generate H_3_14_5 = cond(h_3_14_5 ==  0, "si", cond(h_3_14_5 ==  1, "no", cond(h_3_14_5 ==  2, "no responde", cond(h_3_14_5 ==  3, "no sabe", ""))))

drop h_3_14_5

generate H_3_14_6 = cond(h_3_14_6 ==  0, "si", cond(h_3_14_6 ==  1, "no", cond(h_3_14_6 ==  2, "no responde", cond(h_3_14_6 ==  3, "no sabe", ""))))

drop h_3_14_6

generate H_3_14_7 = cond(h_3_14_7 ==  0, "si", cond(h_3_14_7 ==  1, "no", cond(h_3_14_7 ==  2, "no responde", cond(h_3_14_7 ==  3, "no sabe", ""))))

drop h_3_14_7

generate H_3_14_8 = cond(h_3_14_8 ==  0, "si", cond(h_3_14_8 ==  1, "no", cond(h_3_14_8 ==  2, "no responde", cond(h_3_14_8 ==  3, "no sabe", ""))))

drop h_3_14_8

generate H_3_14_9 = cond(h_3_14_9 ==  0, "si", cond(h_3_14_9 ==  1, "no", cond(h_3_14_9 ==  2, "no responde", cond(h_3_14_9 ==  3, "no sabe", ""))))

drop h_3_14_9

generate H_3_14_10 = cond(h_3_14_10 ==  0, "si", cond(h_3_14_10 ==  1, "no", cond(h_3_14_10 ==  2, "no responde", cond(h_3_14_10 ==  3, "no sabe", ""))))

drop h_3_14_10

generate H_3_14_11 = cond(h_3_14_11 ==  0, "si", cond(h_3_14_11 ==  1, "no", cond(h_3_14_11 ==  2, "no responde", cond(h_3_14_11 ==  3, "no sabe", ""))))

drop h_3_14_11

generate H_3_14_12 = cond(h_3_14_12 ==  0, "si", cond(h_3_14_12 ==  1, "no", cond(h_3_14_12 ==  2, "no responde", cond(h_3_14_12 ==  3, "no sabe", ""))))

drop h_3_14_12

generate H_3_17A_P = cond(h_3_17a_p ==  0, "si", cond(h_3_17a_p ==  1, "no", cond(h_3_17a_p ==  2, "no responde", cond(h_3_17a_p ==  3, "no sabe", ""))))

drop h_3_17a_p

generate H_3_17A_D = cond(h_3_17a_d ==  0, "si", cond(h_3_17a_d ==  1, "no", cond(h_3_17a_d ==  2, "no responde", cond(h_3_17a_d ==  3, "no sabe", ""))))

drop h_3_17a_d

generate H_3_17A_C = cond(h_3_17a_c ==  0, "si", cond(h_3_17a_c ==  1, "no", cond(h_3_17a_c ==  2, "no responde", cond(h_3_17a_c ==  3, "no sabe", ""))))

drop h_3_17a_c

generate H_3_17B_P = cond(h_3_17b_p ==  0, "si", cond(h_3_17b_p ==  1, "no", cond(h_3_17b_p ==  2, "no responde", cond(h_3_17b_p ==  3, "no sabe", ""))))

drop h_3_17b_p

generate H_3_17B_D = cond(h_3_17b_d ==  0, "si", cond(h_3_17b_d ==  1, "no", cond(h_3_17b_d ==  2, "no responde", cond(h_3_17b_d ==  3, "no sabe", ""))))

drop h_3_17b_d

generate H_3_17B_C = cond(h_3_17b_c ==  0, "si", cond(h_3_17b_c ==  1, "no", cond(h_3_17b_c ==  2, "no responde", cond(h_3_17b_c ==  3, "no sabe", ""))))

drop h_3_17b_c

generate H_3_17C_P = cond(h_3_17c_p ==  0, "si", cond(h_3_17c_p ==  1, "no", cond(h_3_17c_p ==  2, "no responde", cond(h_3_17c_p ==  3, "no sabe", ""))))

drop h_3_17c_p

generate H_3_17C_D = cond(h_3_17c_d ==  0, "si", cond(h_3_17c_d ==  1, "no", cond(h_3_17c_d ==  2, "no responde", cond(h_3_17c_d ==  3, "no sabe", ""))))

drop h_3_17c_d

generate H_3_17C_C = cond(h_3_17c_c ==  0, "si", cond(h_3_17c_c ==  1, "no", cond(h_3_17c_c ==  2, "no responde", cond(h_3_17c_c ==  3, "no sabe", ""))))

drop h_3_17c_c

generate H_3_18 = cond(h_3_18 ==  0, "si", cond(h_3_18 ==  1, "no", cond(h_3_18 ==  2, "no responde", cond(h_3_18 ==  3, "no sabe", ""))))

drop h_3_18

generate H_3_20A_P = cond(h_3_20a_p ==  0, "si", cond(h_3_20a_p ==  1, "no", cond(h_3_20a_p ==  2, "no responde", cond(h_3_20a_p ==  3, "no sabe", ""))))

drop h_3_20a_p

generate H_3_20A_D = cond(h_3_20a_d ==  0, "si", cond(h_3_20a_d ==  1, "no", cond(h_3_20a_d ==  2, "no responde", cond(h_3_20a_d ==  3, "no sabe", ""))))

drop h_3_20a_d

generate H_3_20A_C = cond(h_3_20a_c ==  0, "si", cond(h_3_20a_c ==  1, "no", cond(h_3_20a_c ==  2, "no responde", cond(h_3_20a_c ==  3, "no sabe", ""))))

drop h_3_20a_c

generate H_3_20B_P = cond(h_3_20b_p ==  0, "si", cond(h_3_20b_p ==  1, "no", cond(h_3_20b_p ==  2, "no responde", cond(h_3_20b_p ==  3, "no sabe", ""))))

drop h_3_20b_p

generate H_3_20B_D = cond(h_3_20b_d ==  0, "si", cond(h_3_20b_d ==  1, "no", cond(h_3_20b_d ==  2, "no responde", cond(h_3_20b_d ==  3, "no sabe", ""))))

drop h_3_20b_d

generate H_3_20B_C = cond(h_3_20b_c ==  0, "si", cond(h_3_20b_c ==  1, "no", cond(h_3_20b_c ==  2, "no responde", cond(h_3_20b_c ==  3, "no sabe", ""))))

drop h_3_20b_c

generate H_3_20C_P = cond(h_3_20c_p ==  0, "si", cond(h_3_20c_p ==  1, "no", cond(h_3_20c_p ==  2, "no responde", cond(h_3_20c_p ==  3, "no sabe", ""))))

drop h_3_20c_p

generate H_3_20C_D = cond(h_3_20c_d ==  0, "si", cond(h_3_20c_d ==  1, "no", cond(h_3_20c_d ==  2, "no responde", cond(h_3_20c_d ==  3, "no sabe", ""))))

drop h_3_20c_d

generate H_3_20C_C = cond(h_3_20c_c ==  0, "si", cond(h_3_20c_c ==  1, "no", cond(h_3_20c_c ==  2, "no responde", cond(h_3_20c_c ==  3, "no sabe", ""))))

drop h_3_20c_c

generate H_3_21 = cond(h_3_21 ==  0, "si", cond(h_3_21 ==  1, "no", cond(h_3_21 ==  2, "no responde", cond(h_3_21 ==  3, "no sabe", ""))))

drop h_3_21

generate H_3_23A_P = cond(h_3_23a_p ==  0, "si", cond(h_3_23a_p ==  1, "no", cond(h_3_23a_p ==  2, "no responde", cond(h_3_23a_p ==  3, "no sabe", ""))))

drop h_3_23a_p

generate H_3_23A_D = cond(h_3_23a_d ==  0, "si", cond(h_3_23a_d ==  1, "no", cond(h_3_23a_d ==  2, "no responde", cond(h_3_23a_d ==  3, "no sabe", ""))))

drop h_3_23a_d

generate H_3_23A_C = cond(h_3_23a_c ==  0, "si", cond(h_3_23a_c ==  1, "no", cond(h_3_23a_c ==  2, "no responde", cond(h_3_23a_c ==  3, "no sabe", ""))))

drop h_3_23a_c

generate H_3_23B_P = cond(h_3_23b_p ==  0, "si", cond(h_3_23b_p ==  1, "no", cond(h_3_23b_p ==  2, "no responde", cond(h_3_23b_p ==  3, "no sabe", ""))))

drop h_3_23b_p

generate H_3_23B_D = cond(h_3_23b_d ==  0, "si", cond(h_3_23b_d ==  1, "no", cond(h_3_23b_d ==  2, "no responde", cond(h_3_23b_d ==  3, "no sabe", ""))))

drop h_3_23b_d

generate H_3_23B_C = cond(h_3_23b_c ==  0, "si", cond(h_3_23b_c ==  1, "no", cond(h_3_23b_c ==  2, "no responde", cond(h_3_23b_c ==  3, "no sabe", ""))))

drop h_3_23b_c

generate H_3_23C_P = cond(h_3_23c_p ==  0, "si", cond(h_3_23c_p ==  1, "no", cond(h_3_23c_p ==  2, "no responde", cond(h_3_23c_p ==  3, "no sabe", ""))))

drop h_3_23c_p

generate H_3_23C_D = cond(h_3_23c_d ==  0, "si", cond(h_3_23c_d ==  1, "no", cond(h_3_23c_d ==  2, "no responde", cond(h_3_23c_d ==  3, "no sabe", ""))))

drop h_3_23c_d

generate H_3_23C_C = cond(h_3_23c_c ==  0, "si", cond(h_3_23c_c ==  1, "no", cond(h_3_23c_c ==  2, "no responde", cond(h_3_23c_c ==  3, "no sabe", ""))))

drop h_3_23c_c

generate H_3_24 = cond(h_3_24 ==  0, "si", cond(h_3_24 ==  1, "no", cond(h_3_24 ==  2, "no responde", cond(h_3_24 ==  3, "no sabe", ""))))

drop h_3_24

generate H_3_26A_P = cond(h_3_26a_p ==  0, "si", cond(h_3_26a_p ==  1, "no", cond(h_3_26a_p ==  2, "no responde", cond(h_3_26a_p ==  3, "no sabe", ""))))

drop h_3_26a_p

generate H_3_26A_D = cond(h_3_26a_d ==  0, "si", cond(h_3_26a_d ==  1, "no", cond(h_3_26a_d ==  2, "no responde", cond(h_3_26a_d ==  3, "no sabe", ""))))

drop h_3_26a_d

generate H_3_26A_C = cond(h_3_26a_c ==  0, "si", cond(h_3_26a_c ==  1, "no", cond(h_3_26a_c ==  2, "no responde", cond(h_3_26a_c ==  3, "no sabe", ""))))

drop h_3_26a_c

generate H_3_26B_P = cond(h_3_26b_p ==  0, "si", cond(h_3_26b_p ==  1, "no", cond(h_3_26b_p ==  2, "no responde", cond(h_3_26b_p ==  3, "no sabe", ""))))

drop h_3_26b_p

generate H_3_26B_D = cond(h_3_26b_d ==  0, "si", cond(h_3_26b_d ==  1, "no", cond(h_3_26b_d ==  2, "no responde", cond(h_3_26b_d ==  3, "no sabe", ""))))

drop h_3_26b_d

generate H_3_26B_C = cond(h_3_26b_c ==  0, "si", cond(h_3_26b_c ==  1, "no", cond(h_3_26b_c ==  2, "no responde", cond(h_3_26b_c ==  3, "no sabe", ""))))

drop h_3_26b_c

generate H_3_26C_P = cond(h_3_26c_p ==  0, "si", cond(h_3_26c_p ==  1, "no", cond(h_3_26c_p ==  2, "no responde", cond(h_3_26c_p ==  3, "no sabe", ""))))

drop h_3_26c_p

generate H_3_26C_D = cond(h_3_26c_d ==  0, "si", cond(h_3_26c_d ==  1, "no", cond(h_3_26c_d ==  2, "no responde", cond(h_3_26c_d ==  3, "no sabe", ""))))

drop h_3_26c_d

generate H_3_26C_C = cond(h_3_26c_c ==  0, "si", cond(h_3_26c_c ==  1, "no", cond(h_3_26c_c ==  2, "no responde", cond(h_3_26c_c ==  3, "no sabe", ""))))

drop h_3_26c_c

generate H_3_28A_P = cond(h_3_28a_p ==  0, "si", cond(h_3_28a_p ==  1, "no", cond(h_3_28a_p ==  2, "no responde", cond(h_3_28a_p ==  3, "no sabe", ""))))

drop h_3_28a_p

generate H_3_28A_D = cond(h_3_28a_d ==  0, "si", cond(h_3_28a_d ==  1, "no", cond(h_3_28a_d ==  2, "no responde", cond(h_3_28a_d ==  3, "no sabe", ""))))

drop h_3_28a_d

generate H_3_28A_C = cond(h_3_28a_c ==  0, "si", cond(h_3_28a_c ==  1, "no", cond(h_3_28a_c ==  2, "no responde", cond(h_3_28a_c ==  3, "no sabe", ""))))

drop h_3_28a_c

generate H_3_28B_P = cond(h_3_28b_p ==  0, "si", cond(h_3_28b_p ==  1, "no", cond(h_3_28b_p ==  2, "no responde", cond(h_3_28b_p ==  3, "no sabe", ""))))

drop h_3_28b_p

generate H_3_28B_D = cond(h_3_28b_d ==  0, "si", cond(h_3_28b_d ==  1, "no", cond(h_3_28b_d ==  2, "no responde", cond(h_3_28b_d ==  3, "no sabe", ""))))

drop h_3_28b_d

generate H_3_28B_C = cond(h_3_28b_c ==  0, "si", cond(h_3_28b_c ==  1, "no", cond(h_3_28b_c ==  2, "no responde", cond(h_3_28b_c ==  3, "no sabe", ""))))

drop h_3_28b_c

generate H_3_28C_P = cond(h_3_28c_p ==  0, "si", cond(h_3_28c_p ==  1, "no", cond(h_3_28c_p ==  2, "no responde", cond(h_3_28c_p ==  3, "no sabe", ""))))

drop h_3_28c_p

generate H_3_28C_D = cond(h_3_28c_d ==  0, "si", cond(h_3_28c_d ==  1, "no", cond(h_3_28c_d ==  2, "no responde", cond(h_3_28c_d ==  3, "no sabe", ""))))

drop h_3_28c_d

generate H_3_28C_C = cond(h_3_28c_c ==  0, "si", cond(h_3_28c_c ==  1, "no", cond(h_3_28c_c ==  2, "no responde", cond(h_3_28c_c ==  3, "no sabe", ""))))

drop h_3_28c_c

generate H_3_29 = cond(h_3_29 ==  0, "si", cond(h_3_29 ==  1, "no", cond(h_3_29 ==  2, "no responde", cond(h_3_29 ==  3, "no sabe", ""))))

drop h_3_29

generate H_3_31A_P = cond(h_3_31a_p ==  0, "si", cond(h_3_31a_p ==  1, "no", cond(h_3_31a_p ==  2, "no responde", cond(h_3_31a_p ==  3, "no sabe", ""))))

drop h_3_31a_p

generate H_3_31A_D = cond(h_3_31a_d ==  0, "si", cond(h_3_31a_d ==  1, "no", cond(h_3_31a_d ==  2, "no responde", cond(h_3_31a_d ==  3, "no sabe", ""))))

drop h_3_31a_d

generate H_3_31A_C = cond(h_3_31a_c ==  0, "si", cond(h_3_31a_c ==  1, "no", cond(h_3_31a_c ==  2, "no responde", cond(h_3_31a_c ==  3, "no sabe", ""))))

drop h_3_31a_c

generate H_3_31B_P = cond(h_3_31b_p ==  0, "si", cond(h_3_31b_p ==  1, "no", cond(h_3_31b_p ==  2, "no responde", cond(h_3_31b_p ==  3, "no sabe", ""))))

drop h_3_31b_p

generate H_3_31B_D = cond(h_3_31b_d ==  0, "si", cond(h_3_31b_d ==  1, "no", cond(h_3_31b_d ==  2, "no responde", cond(h_3_31b_d ==  3, "no sabe", ""))))

drop h_3_31b_d

generate H_3_31B_C = cond(h_3_31b_c ==  0, "si", cond(h_3_31b_c ==  1, "no", cond(h_3_31b_c ==  2, "no responde", cond(h_3_31b_c ==  3, "no sabe", ""))))

drop h_3_31b_c

generate H_3_31C_P = cond(h_3_31c_p ==  0, "si", cond(h_3_31c_p ==  1, "no", cond(h_3_31c_p ==  2, "no responde", cond(h_3_31c_p ==  3, "no sabe", ""))))

drop h_3_31c_p

generate H_3_31C_D = cond(h_3_31c_d ==  0, "si", cond(h_3_31c_d ==  1, "no", cond(h_3_31c_d ==  2, "no responde", cond(h_3_31c_d ==  3, "no sabe", ""))))

drop h_3_31c_d

generate H_3_31C_C = cond(h_3_31c_c ==  0, "si", cond(h_3_31c_c ==  1, "no", cond(h_3_31c_c ==  2, "no responde", cond(h_3_31c_c ==  3, "no sabe", ""))))

drop h_3_31c_c

generate H_3_33A_P = cond(h_3_33a_p ==  0, "si", cond(h_3_33a_p ==  1, "no", cond(h_3_33a_p ==  2, "no responde", cond(h_3_33a_p ==  3, "no sabe", ""))))

drop h_3_33a_p

generate H_3_33A_D = cond(h_3_33a_d ==  0, "si", cond(h_3_33a_d ==  1, "no", cond(h_3_33a_d ==  2, "no responde", cond(h_3_33a_d ==  3, "no sabe", ""))))

drop h_3_33a_d

generate H_3_33A_C = cond(h_3_33a_c ==  0, "si", cond(h_3_33a_c ==  1, "no", cond(h_3_33a_c ==  2, "no responde", cond(h_3_33a_c ==  3, "no sabe", ""))))

drop h_3_33a_c

generate H_3_33B_P = cond(h_3_33b_p ==  0, "si", cond(h_3_33b_p ==  1, "no", cond(h_3_33b_p ==  2, "no responde", cond(h_3_33b_p ==  3, "no sabe", ""))))

drop h_3_33b_p

generate H_3_33B_D = cond(h_3_33b_d ==  0, "si", cond(h_3_33b_d ==  1, "no", cond(h_3_33b_d ==  2, "no responde", cond(h_3_33b_d ==  3, "no sabe", ""))))

drop h_3_33b_d

generate H_3_33B_C = cond(h_3_33b_c ==  0, "si", cond(h_3_33b_c ==  1, "no", cond(h_3_33b_c ==  2, "no responde", cond(h_3_33b_c ==  3, "no sabe", ""))))

drop h_3_33b_c

generate H_3_33C_P = cond(h_3_33c_p ==  0, "si", cond(h_3_33c_p ==  1, "no", cond(h_3_33c_p ==  2, "no responde", cond(h_3_33c_p ==  3, "no sabe", ""))))

drop h_3_33c_p

generate H_3_33C_D = cond(h_3_33c_d ==  0, "si", cond(h_3_33c_d ==  1, "no", cond(h_3_33c_d ==  2, "no responde", cond(h_3_33c_d ==  3, "no sabe", ""))))

drop h_3_33c_d

generate H_3_33C_C = cond(h_3_33c_c ==  0, "si", cond(h_3_33c_c ==  1, "no", cond(h_3_33c_c ==  2, "no responde", cond(h_3_33c_c ==  3, "no sabe", ""))))

drop h_3_33c_c

generate H_3_34 = cond(h_3_34 ==  0, "si", cond(h_3_34 ==  1, "no", cond(h_3_34 ==  2, "no responde", cond(h_3_34 ==  3, "no sabe", ""))))

drop h_3_34

generate H_4_1 = cond(h_4_1 ==  0, "si", cond(h_4_1 ==  1, "no", cond(h_4_1 ==  2, "no responde", cond(h_4_1 ==  3, "no sabe", ""))))

drop h_4_1

generate H_4_1B_P = cond(h_4_1b_p ==  0, "si", cond(h_4_1b_p ==  1, "no", cond(h_4_1b_p ==  2, "no responde", cond(h_4_1b_p ==  3, "no sabe", ""))))

drop h_4_1b_p

generate H_4_1B_D = cond(h_4_1b_d ==  0, "si", cond(h_4_1b_d ==  1, "no", cond(h_4_1b_d ==  2, "no responde", cond(h_4_1b_d ==  3, "no sabe", ""))))

drop h_4_1b_d

generate H_4_1B_C = cond(h_4_1b_c ==  0, "si", cond(h_4_1b_c ==  1, "no", cond(h_4_1b_c ==  2, "no responde", cond(h_4_1b_c ==  3, "no sabe", ""))))

drop h_4_1b_c

generate H_4_1B2_P = cond(h_4_1b2_p ==  0, "si", cond(h_4_1b2_p ==  1, "no", cond(h_4_1b2_p ==  2, "no responde", cond(h_4_1b2_p ==  3, "no sabe", ""))))

drop h_4_1b2_p

generate H_4_1B2_D = cond(h_4_1b2_d ==  0, "si", cond(h_4_1b2_d ==  1, "no", cond(h_4_1b2_d ==  2, "no responde", cond(h_4_1b2_d ==  3, "no sabe", ""))))

drop h_4_1b2_d

generate H_4_1B2_C = cond(h_4_1b2_c ==  0, "si", cond(h_4_1b2_c ==  1, "no", cond(h_4_1b2_c ==  2, "no responde", cond(h_4_1b2_c ==  3, "no sabe", ""))))

drop h_4_1b2_c

generate H_4_1B3_P = cond(h_4_1b3_p ==  0, "si", cond(h_4_1b3_p ==  1, "no", cond(h_4_1b3_p ==  2, "no responde", cond(h_4_1b3_p ==  3, "no sabe", ""))))

drop h_4_1b3_p

generate H_4_1B3_D = cond(h_4_1b3_d ==  0, "si", cond(h_4_1b3_d ==  1, "no", cond(h_4_1b3_d ==  2, "no responde", cond(h_4_1b3_d ==  3, "no sabe", ""))))

drop h_4_1b3_d

generate H_4_1B3_C = cond(h_4_1b3_c ==  0, "si", cond(h_4_1b3_c ==  1, "no", cond(h_4_1b3_c ==  2, "no responde", cond(h_4_1b3_c ==  3, "no sabe", ""))))

drop h_4_1b3_c

generate H_4_2 = cond(h_4_2 ==  0, "si", cond(h_4_2 ==  1, "no", cond(h_4_2 ==  2, "no responde", cond(h_4_2 ==  3, "no sabe", ""))))

drop h_4_2

generate H_4_2B_P = cond(h_4_2b_p ==  0, "si", cond(h_4_2b_p ==  1, "no", cond(h_4_2b_p ==  2, "no responde", cond(h_4_2b_p ==  3, "no sabe", ""))))

drop h_4_2b_p

generate H_4_2B_D = cond(h_4_2b_d ==  0, "si", cond(h_4_2b_d ==  1, "no", cond(h_4_2b_d ==  2, "no responde", cond(h_4_2b_d ==  3, "no sabe", ""))))

drop h_4_2b_d

generate H_4_2B_C = cond(h_4_2b_c ==  0, "si", cond(h_4_2b_c ==  1, "no", cond(h_4_2b_c ==  2, "no responde", cond(h_4_2b_c ==  3, "no sabe", ""))))

drop h_4_2b_c

generate H_4_2B2_P = cond(h_4_2b2_p ==  0, "si", cond(h_4_2b2_p ==  1, "no", cond(h_4_2b2_p ==  2, "no responde", cond(h_4_2b2_p ==  3, "no sabe", ""))))

drop h_4_2b2_p

generate H_4_2B2_D = cond(h_4_2b2_d ==  0, "si", cond(h_4_2b2_d ==  1, "no", cond(h_4_2b2_d ==  2, "no responde", cond(h_4_2b2_d ==  3, "no sabe", ""))))

drop h_4_2b2_d

generate H_4_2B2_C = cond(h_4_2b2_c ==  0, "si", cond(h_4_2b2_c ==  1, "no", cond(h_4_2b2_c ==  2, "no responde", cond(h_4_2b2_c ==  3, "no sabe", ""))))

drop h_4_2b2_c

generate H_4_2B3_P = cond(h_4_2b3_p ==  0, "si", cond(h_4_2b3_p ==  1, "no", cond(h_4_2b3_p ==  2, "no responde", cond(h_4_2b3_p ==  3, "no sabe", ""))))

drop h_4_2b3_p

generate H_4_2B3_D = cond(h_4_2b3_d ==  0, "si", cond(h_4_2b3_d ==  1, "no", cond(h_4_2b3_d ==  2, "no responde", cond(h_4_2b3_d ==  3, "no sabe", ""))))

drop h_4_2b3_d

generate H_4_2B3_C = cond(h_4_2b3_c ==  0, "si", cond(h_4_2b3_c ==  1, "no", cond(h_4_2b3_c ==  2, "no responde", cond(h_4_2b3_c ==  3, "no sabe", ""))))

drop h_4_2b3_c

generate H_4_3 = cond(h_4_3 ==  0, "si", cond(h_4_3 ==  1, "no", cond(h_4_3 ==  2, "no responde", cond(h_4_3 ==  3, "no sabe", ""))))

drop h_4_3

generate H_4_3B_P = cond(h_4_3b_p ==  0, "si", cond(h_4_3b_p ==  1, "no", cond(h_4_3b_p ==  2, "no responde", cond(h_4_3b_p ==  3, "no sabe", ""))))

drop h_4_3b_p

generate H_4_3B_D = cond(h_4_3b_d ==  0, "si", cond(h_4_3b_d ==  1, "no", cond(h_4_3b_d ==  2, "no responde", cond(h_4_3b_d ==  3, "no sabe", ""))))

drop h_4_3b_d

generate H_4_3B_C = cond(h_4_3b_c ==  0, "si", cond(h_4_3b_c ==  1, "no", cond(h_4_3b_c ==  2, "no responde", cond(h_4_3b_c ==  3, "no sabe", ""))))

drop h_4_3b_c

generate H_4_3B2_P = cond(h_4_3b2_p ==  0, "si", cond(h_4_3b2_p ==  1, "no", cond(h_4_3b2_p ==  2, "no responde", cond(h_4_3b2_p ==  3, "no sabe", ""))))

drop h_4_3b2_p

generate H_4_3B2_D = cond(h_4_3b2_d ==  0, "si", cond(h_4_3b2_d ==  1, "no", cond(h_4_3b2_d ==  2, "no responde", cond(h_4_3b2_d ==  3, "no sabe", ""))))

drop h_4_3b2_d

generate H_4_3B2_C = cond(h_4_3b2_c ==  0, "si", cond(h_4_3b2_c ==  1, "no", cond(h_4_3b2_c ==  2, "no responde", cond(h_4_3b2_c ==  3, "no sabe", ""))))

drop h_4_3b2_c

generate H_4_3B3_P = cond(h_4_3b3_p ==  0, "si", cond(h_4_3b3_p ==  1, "no", cond(h_4_3b3_p ==  2, "no responde", cond(h_4_3b3_p ==  3, "no sabe", ""))))

drop h_4_3b3_p

generate H_4_3B3_D = cond(h_4_3b3_d ==  0, "si", cond(h_4_3b3_d ==  1, "no", cond(h_4_3b3_d ==  2, "no responde", cond(h_4_3b3_d ==  3, "no sabe", ""))))

drop h_4_3b3_d

generate H_4_3B3_C = cond(h_4_3b3_c ==  0, "si", cond(h_4_3b3_c ==  1, "no", cond(h_4_3b3_c ==  2, "no responde", cond(h_4_3b3_c ==  3, "no sabe", ""))))

drop h_4_3b3_c

generate H_4_4 = cond(h_4_4 ==  0, "si", cond(h_4_4 ==  1, "no", cond(h_4_4 ==  2, "no responde", cond(h_4_4 ==  3, "no sabe", ""))))

drop h_4_4

generate H_4_4B_P = cond(h_4_4b_p ==  0, "si", cond(h_4_4b_p ==  1, "no", cond(h_4_4b_p ==  2, "no responde", cond(h_4_4b_p ==  3, "no sabe", ""))))

drop h_4_4b_p

generate H_4_4B_D = cond(h_4_4b_d ==  0, "si", cond(h_4_4b_d ==  1, "no", cond(h_4_4b_d ==  2, "no responde", cond(h_4_4b_d ==  3, "no sabe", ""))))

drop h_4_4b_d

generate H_4_4B_C = cond(h_4_4b_c ==  0, "si", cond(h_4_4b_c ==  1, "no", cond(h_4_4b_c ==  2, "no responde", cond(h_4_4b_c ==  3, "no sabe", ""))))

drop h_4_4b_c

generate H_4_4B2_P = cond(h_4_4b2_p ==  0, "si", cond(h_4_4b2_p ==  1, "no", cond(h_4_4b2_p ==  2, "no responde", cond(h_4_4b2_p ==  3, "no sabe", ""))))

drop h_4_4b2_p

generate H_4_4B2_D = cond(h_4_4b2_d ==  0, "si", cond(h_4_4b2_d ==  1, "no", cond(h_4_4b2_d ==  2, "no responde", cond(h_4_4b2_d ==  3, "no sabe", ""))))

drop h_4_4b2_d

generate H_4_4B2_C = cond(h_4_4b2_c ==  0, "si", cond(h_4_4b2_c ==  1, "no", cond(h_4_4b2_c ==  2, "no responde", cond(h_4_4b2_c ==  3, "no sabe", ""))))

drop h_4_4b2_c

generate H_4_4B3_P = cond(h_4_4b3_p ==  0, "si", cond(h_4_4b3_p ==  1, "no", cond(h_4_4b3_p ==  2, "no responde", cond(h_4_4b3_p ==  3, "no sabe", ""))))

drop h_4_4b3_p

generate H_4_4B3_D = cond(h_4_4b3_d ==  0, "si", cond(h_4_4b3_d ==  1, "no", cond(h_4_4b3_d ==  2, "no responde", cond(h_4_4b3_d ==  3, "no sabe", ""))))

drop h_4_4b3_d

generate H_4_4B3_C = cond(h_4_4b3_c ==  0, "si", cond(h_4_4b3_c ==  1, "no", cond(h_4_4b3_c ==  2, "no responde", cond(h_4_4b3_c ==  3, "no sabe", ""))))

drop h_4_4b3_c

generate H_4_5 = cond(h_4_5 ==  0, "si", cond(h_4_5 ==  1, "no", cond(h_4_5 ==  2, "no responde", cond(h_4_5 ==  3, "no sabe", ""))))

drop h_4_5

generate H_4_5B_P = cond(h_4_5b_p ==  0, "si", cond(h_4_5b_p ==  1, "no", cond(h_4_5b_p ==  2, "no responde", cond(h_4_5b_p ==  3, "no sabe", ""))))

drop h_4_5b_p

generate H_4_5B_D = cond(h_4_5b_d ==  0, "si", cond(h_4_5b_d ==  1, "no", cond(h_4_5b_d ==  2, "no responde", cond(h_4_5b_d ==  3, "no sabe", ""))))

drop h_4_5b_d

generate H_4_5B_C = cond(h_4_5b_c ==  0, "si", cond(h_4_5b_c ==  1, "no", cond(h_4_5b_c ==  2, "no responde", cond(h_4_5b_c ==  3, "no sabe", ""))))

drop h_4_5b_c

generate H_4_5B2_P = cond(h_4_5b2_p ==  0, "si", cond(h_4_5b2_p ==  1, "no", cond(h_4_5b2_p ==  2, "no responde", cond(h_4_5b2_p ==  3, "no sabe", ""))))

drop h_4_5b2_p

generate H_4_5B2_D = cond(h_4_5b2_d ==  0, "si", cond(h_4_5b2_d ==  1, "no", cond(h_4_5b2_d ==  2, "no responde", cond(h_4_5b2_d ==  3, "no sabe", ""))))

drop h_4_5b2_d

generate H_4_5B2_C = cond(h_4_5b2_c ==  0, "si", cond(h_4_5b2_c ==  1, "no", cond(h_4_5b2_c ==  2, "no responde", cond(h_4_5b2_c ==  3, "no sabe", ""))))

drop h_4_5b2_c

generate H_4_5B3_P = cond(h_4_5b3_p ==  0, "si", cond(h_4_5b3_p ==  1, "no", cond(h_4_5b3_p ==  2, "no responde", cond(h_4_5b3_p ==  3, "no sabe", ""))))

drop h_4_5b3_p

generate H_4_5B3_D = cond(h_4_5b3_d ==  0, "si", cond(h_4_5b3_d ==  1, "no", cond(h_4_5b3_d ==  2, "no responde", cond(h_4_5b3_d ==  3, "no sabe", ""))))

drop h_4_5b3_d

generate H_4_5B3_C = cond(h_4_5b3_c ==  0, "si", cond(h_4_5b3_c ==  1, "no", cond(h_4_5b3_c ==  2, "no responde", cond(h_4_5b3_c ==  3, "no sabe", ""))))

drop h_4_5b3_c

generate H_4_6 = cond(h_4_6 ==  0, "si", cond(h_4_6 ==  1, "no", cond(h_4_6 ==  2, "no responde", cond(h_4_6 ==  3, "no sabe", ""))))

drop h_4_6

generate H_4_6B_P = cond(h_4_6b_p ==  0, "si", cond(h_4_6b_p ==  1, "no", cond(h_4_6b_p ==  2, "no responde", cond(h_4_6b_p ==  3, "no sabe", ""))))

drop h_4_6b_p

generate H_4_6B_D = cond(h_4_6b_d ==  0, "si", cond(h_4_6b_d ==  1, "no", cond(h_4_6b_d ==  2, "no responde", cond(h_4_6b_d ==  3, "no sabe", ""))))

drop h_4_6b_d

generate H_4_6B_C = cond(h_4_6b_c ==  0, "si", cond(h_4_6b_c ==  1, "no", cond(h_4_6b_c ==  2, "no responde", cond(h_4_6b_c ==  3, "no sabe", ""))))

drop h_4_6b_c

generate H_4_6B2_P = cond(h_4_6b2_p ==  0, "si", cond(h_4_6b2_p ==  1, "no", cond(h_4_6b2_p ==  2, "no responde", cond(h_4_6b2_p ==  3, "no sabe", ""))))

drop h_4_6b2_p

generate H_4_6B2_D = cond(h_4_6b2_d ==  0, "si", cond(h_4_6b2_d ==  1, "no", cond(h_4_6b2_d ==  2, "no responde", cond(h_4_6b2_d ==  3, "no sabe", ""))))

drop h_4_6b2_d

generate H_4_6B2_C = cond(h_4_6b2_c ==  0, "si", cond(h_4_6b2_c ==  1, "no", cond(h_4_6b2_c ==  2, "no responde", cond(h_4_6b2_c ==  3, "no sabe", ""))))

drop h_4_6b2_c

generate H_4_6B3_P = cond(h_4_6b3_p ==  0, "si", cond(h_4_6b3_p ==  1, "no", cond(h_4_6b3_p ==  2, "no responde", cond(h_4_6b3_p ==  3, "no sabe", ""))))

drop h_4_6b3_p

generate H_4_6B3_D = cond(h_4_6b3_d ==  0, "si", cond(h_4_6b3_d ==  1, "no", cond(h_4_6b3_d ==  2, "no responde", cond(h_4_6b3_d ==  3, "no sabe", ""))))

drop h_4_6b3_d

generate H_4_6B3_C = cond(h_4_6b3_c ==  0, "si", cond(h_4_6b3_c ==  1, "no", cond(h_4_6b3_c ==  2, "no responde", cond(h_4_6b3_c ==  3, "no sabe", ""))))

drop h_4_6b3_c

generate H_4_7 = cond(h_4_7 ==  0, "si", cond(h_4_7 ==  1, "no", cond(h_4_7 ==  2, "no responde", cond(h_4_7 ==  3, "no sabe", ""))))

drop h_4_7

generate H_4_7B_P = cond(h_4_7b_p ==  0, "si", cond(h_4_7b_p ==  1, "no", cond(h_4_7b_p ==  2, "no responde", cond(h_4_7b_p ==  3, "no sabe", ""))))

drop h_4_7b_p

generate H_4_7B_D = cond(h_4_7b_d ==  0, "si", cond(h_4_7b_d ==  1, "no", cond(h_4_7b_d ==  2, "no responde", cond(h_4_7b_d ==  3, "no sabe", ""))))

drop h_4_7b_d

generate H_4_7B_C = cond(h_4_7b_c ==  0, "si", cond(h_4_7b_c ==  1, "no", cond(h_4_7b_c ==  2, "no responde", cond(h_4_7b_c ==  3, "no sabe", ""))))

drop h_4_7b_c

generate H_4_7B2_P = cond(h_4_7b2_p ==  0, "si", cond(h_4_7b2_p ==  1, "no", cond(h_4_7b2_p ==  2, "no responde", cond(h_4_7b2_p ==  3, "no sabe", ""))))

drop h_4_7b2_p

generate H_4_7B2_D = cond(h_4_7b2_d ==  0, "si", cond(h_4_7b2_d ==  1, "no", cond(h_4_7b2_d ==  2, "no responde", cond(h_4_7b2_d ==  3, "no sabe", ""))))

drop h_4_7b2_d

generate H_4_7B2_C = cond(h_4_7b2_c ==  0, "si", cond(h_4_7b2_c ==  1, "no", cond(h_4_7b2_c ==  2, "no responde", cond(h_4_7b2_c ==  3, "no sabe", ""))))

drop h_4_7b2_c

generate H_4_8 = cond(h_4_8 ==  0, "si", cond(h_4_8 ==  1, "no", cond(h_4_8 ==  2, "no responde", cond(h_4_8 ==  3, "no sabe", ""))))

drop h_4_8

generate H_4_8B_P = cond(h_4_8b_p ==  0, "si", cond(h_4_8b_p ==  1, "no", cond(h_4_8b_p ==  2, "no responde", cond(h_4_8b_p ==  3, "no sabe", ""))))

drop h_4_8b_p

generate H_4_8B_D = cond(h_4_8b_d ==  0, "si", cond(h_4_8b_d ==  1, "no", cond(h_4_8b_d ==  2, "no responde", cond(h_4_8b_d ==  3, "no sabe", ""))))

drop h_4_8b_d

generate H_4_8B_C = cond(h_4_8b_c ==  0, "si", cond(h_4_8b_c ==  1, "no", cond(h_4_8b_c ==  2, "no responde", cond(h_4_8b_c ==  3, "no sabe", ""))))

drop h_4_8b_c

generate H_4_8B2_P = cond(h_4_8b2_p ==  0, "si", cond(h_4_8b2_p ==  1, "no", cond(h_4_8b2_p ==  2, "no responde", cond(h_4_8b2_p ==  3, "no sabe", ""))))

drop h_4_8b2_p

generate H_4_8B2_D = cond(h_4_8b2_d ==  0, "si", cond(h_4_8b2_d ==  1, "no", cond(h_4_8b2_d ==  2, "no responde", cond(h_4_8b2_d ==  3, "no sabe", ""))))

drop h_4_8b2_d

generate H_4_8B2_C = cond(h_4_8b2_c ==  0, "si", cond(h_4_8b2_c ==  1, "no", cond(h_4_8b2_c ==  2, "no responde", cond(h_4_8b2_c ==  3, "no sabe", ""))))

drop h_4_8b2_c

generate H_5 = cond(h_5 ==  0, "si", cond(h_5 ==  1, "no", ""))

drop h_5

generate H_5_1 = cond(h_5_1 ==  0, "si", cond(h_5_1 ==  1, "no", cond(h_5_1 ==  2, "no responde", cond(h_5_1 ==  3, "no sabe", ""))))

drop h_5_1

generate H_5_1B_P = cond(h_5_1b_p ==  0, "si", cond(h_5_1b_p ==  1, "no", cond(h_5_1b_p ==  2, "no responde", cond(h_5_1b_p ==  3, "no sabe", ""))))

drop h_5_1b_p

generate H_5_1B_D = cond(h_5_1b_d ==  0, "si", cond(h_5_1b_d ==  1, "no", cond(h_5_1b_d ==  2, "no responde", cond(h_5_1b_d ==  3, "no sabe", ""))))

drop h_5_1b_d

generate H_5_1B_C = cond(h_5_1b_c ==  0, "si", cond(h_5_1b_c ==  1, "no", cond(h_5_1b_c ==  2, "no responde", cond(h_5_1b_c ==  3, "no sabe", ""))))

drop h_5_1b_c

generate H_5_1B2_P = cond(h_5_1b2_p ==  0, "si", cond(h_5_1b2_p ==  1, "no", cond(h_5_1b2_p ==  2, "no responde", cond(h_5_1b2_p ==  3, "no sabe", ""))))

drop h_5_1b2_p

generate H_5_1B2_D = cond(h_5_1b2_d ==  0, "si", cond(h_5_1b2_d ==  1, "no", cond(h_5_1b2_d ==  2, "no responde", cond(h_5_1b2_d ==  3, "no sabe", ""))))

drop h_5_1b2_d

generate H_5_1B2_C = cond(h_5_1b2_c ==  0, "si", cond(h_5_1b2_c ==  1, "no", cond(h_5_1b2_c ==  2, "no responde", cond(h_5_1b2_c ==  3, "no sabe", ""))))

drop h_5_1b2_c

generate H_5_1B3_P = cond(h_5_1b3_p ==  0, "si", cond(h_5_1b3_p ==  1, "no", cond(h_5_1b3_p ==  2, "no responde", cond(h_5_1b3_p ==  3, "no sabe", ""))))

drop h_5_1b3_p

generate H_5_1B3_D = cond(h_5_1b3_d ==  0, "si", cond(h_5_1b3_d ==  1, "no", cond(h_5_1b3_d ==  2, "no responde", cond(h_5_1b3_d ==  3, "no sabe", ""))))

drop h_5_1b3_d

generate H_5_1B3_C = cond(h_5_1b3_c ==  0, "si", cond(h_5_1b3_c ==  1, "no", cond(h_5_1b3_c ==  2, "no responde", cond(h_5_1b3_c ==  3, "no sabe", ""))))

drop h_5_1b3_c

generate H_5_2 = cond(h_5_2 ==  0, "si", cond(h_5_2 ==  1, "no", cond(h_5_2 ==  2, "no responde", cond(h_5_2 ==  3, "no sabe", ""))))

drop h_5_2

generate H_5_2B_P = cond(h_5_2b_p ==  0, "si", cond(h_5_2b_p ==  1, "no", cond(h_5_2b_p ==  2, "no responde", cond(h_5_2b_p ==  3, "no sabe", ""))))

drop h_5_2b_p

generate H_5_2B_D = cond(h_5_2b_d ==  0, "si", cond(h_5_2b_d ==  1, "no", cond(h_5_2b_d ==  2, "no responde", cond(h_5_2b_d ==  3, "no sabe", ""))))

drop h_5_2b_d

generate H_5_2B_C = cond(h_5_2b_c ==  0, "si", cond(h_5_2b_c ==  1, "no", cond(h_5_2b_c ==  2, "no responde", cond(h_5_2b_c ==  3, "no sabe", ""))))

drop h_5_2b_c

generate H_5_2B2_P = cond(h_5_2b2_p ==  0, "si", cond(h_5_2b2_p ==  1, "no", cond(h_5_2b2_p ==  2, "no responde", cond(h_5_2b2_p ==  3, "no sabe", ""))))

drop h_5_2b2_p

generate H_5_2B2_D = cond(h_5_2b2_d ==  0, "si", cond(h_5_2b2_d ==  1, "no", cond(h_5_2b2_d ==  2, "no responde", cond(h_5_2b2_d ==  3, "no sabe", ""))))

drop h_5_2b2_d

generate H_5_2B2_C = cond(h_5_2b2_c ==  0, "si", cond(h_5_2b2_c ==  1, "no", cond(h_5_2b2_c ==  2, "no responde", cond(h_5_2b2_c ==  3, "no sabe", ""))))

drop h_5_2b2_c

generate H_5_2B3_P = cond(h_5_2b3_p ==  0, "si", cond(h_5_2b3_p ==  1, "no", cond(h_5_2b3_p ==  2, "no responde", cond(h_5_2b3_p ==  3, "no sabe", ""))))

drop h_5_2b3_p

generate H_5_2B3_D = cond(h_5_2b3_d ==  0, "si", cond(h_5_2b3_d ==  1, "no", cond(h_5_2b3_d ==  2, "no responde", cond(h_5_2b3_d ==  3, "no sabe", ""))))

drop h_5_2b3_d

generate H_5_2B3_C = cond(h_5_2b3_c ==  0, "si", cond(h_5_2b3_c ==  1, "no", cond(h_5_2b3_c ==  2, "no responde", cond(h_5_2b3_c ==  3, "no sabe", ""))))

drop h_5_2b3_c

generate H_5_3 = cond(h_5_3 ==  0, "si", cond(h_5_3 ==  1, "no", cond(h_5_3 ==  2, "no responde", cond(h_5_3 ==  3, "no sabe", ""))))

drop h_5_3

generate H_5_3B_P = cond(h_5_3b_p ==  0, "si", cond(h_5_3b_p ==  1, "no", cond(h_5_3b_p ==  2, "no responde", cond(h_5_3b_p ==  3, "no sabe", ""))))

drop h_5_3b_p

generate H_5_3B_D = cond(h_5_3b_d ==  0, "si", cond(h_5_3b_d ==  1, "no", cond(h_5_3b_d ==  2, "no responde", cond(h_5_3b_d ==  3, "no sabe", ""))))

drop h_5_3b_d

generate H_5_3B_C = cond(h_5_3b_c ==  0, "si", cond(h_5_3b_c ==  1, "no", cond(h_5_3b_c ==  2, "no responde", cond(h_5_3b_c ==  3, "no sabe", ""))))

drop h_5_3b_c

generate H_5_3B2_P = cond(h_5_3b2_p ==  0, "si", cond(h_5_3b2_p ==  1, "no", cond(h_5_3b2_p ==  2, "no responde", cond(h_5_3b2_p ==  3, "no sabe", ""))))

drop h_5_3b2_p

generate H_5_3B2_D = cond(h_5_3b2_d ==  0, "si", cond(h_5_3b2_d ==  1, "no", cond(h_5_3b2_d ==  2, "no responde", cond(h_5_3b2_d ==  3, "no sabe", ""))))

drop h_5_3b2_d

generate H_5_3B2_C = cond(h_5_3b2_c ==  0, "si", cond(h_5_3b2_c ==  1, "no", cond(h_5_3b2_c ==  2, "no responde", cond(h_5_3b2_c ==  3, "no sabe", ""))))

drop h_5_3b2_c

generate H_5_3B3_P = cond(h_5_3b3_p ==  0, "si", cond(h_5_3b3_p ==  1, "no", cond(h_5_3b3_p ==  2, "no responde", cond(h_5_3b3_p ==  3, "no sabe", ""))))

drop h_5_3b3_p

generate H_5_3B3_D = cond(h_5_3b3_d ==  0, "si", cond(h_5_3b3_d ==  1, "no", cond(h_5_3b3_d ==  2, "no responde", cond(h_5_3b3_d ==  3, "no sabe", ""))))

drop h_5_3b3_d

generate H_5_3B3_C = cond(h_5_3b3_c ==  0, "si", cond(h_5_3b3_c ==  1, "no", cond(h_5_3b3_c ==  2, "no responde", cond(h_5_3b3_c ==  3, "no sabe", ""))))

drop h_5_3b3_c

generate H_5_4 = cond(h_5_4 ==  0, "si", cond(h_5_4 ==  1, "no", cond(h_5_4 ==  2, "no responde", cond(h_5_4 ==  3, "no sabe", ""))))

drop h_5_4

generate H_5_4B_P = cond(h_5_4b_p ==  0, "si", cond(h_5_4b_p ==  1, "no", cond(h_5_4b_p ==  2, "no responde", cond(h_5_4b_p ==  3, "no sabe", ""))))

drop h_5_4b_p

generate H_5_4B_D = cond(h_5_4b_d ==  0, "si", cond(h_5_4b_d ==  1, "no", cond(h_5_4b_d ==  2, "no responde", cond(h_5_4b_d ==  3, "no sabe", ""))))

drop h_5_4b_d

generate H_5_4B_C = cond(h_5_4b_c ==  0, "si", cond(h_5_4b_c ==  1, "no", cond(h_5_4b_c ==  2, "no responde", cond(h_5_4b_c ==  3, "no sabe", ""))))

drop h_5_4b_c

generate H_5_4B2_P = cond(h_5_4b2_p ==  0, "si", cond(h_5_4b2_p ==  1, "no", cond(h_5_4b2_p ==  2, "no responde", cond(h_5_4b2_p ==  3, "no sabe", ""))))

drop h_5_4b2_p

generate H_5_4B2_D = cond(h_5_4b2_d ==  0, "si", cond(h_5_4b2_d ==  1, "no", cond(h_5_4b2_d ==  2, "no responde", cond(h_5_4b2_d ==  3, "no sabe", ""))))

drop h_5_4b2_d

generate H_5_4B2_C = cond(h_5_4b2_c ==  0, "si", cond(h_5_4b2_c ==  1, "no", cond(h_5_4b2_c ==  2, "no responde", cond(h_5_4b2_c ==  3, "no sabe", ""))))

drop h_5_4b2_c

generate H_5_4B3_P = cond(h_5_4b3_p ==  0, "si", cond(h_5_4b3_p ==  1, "no", cond(h_5_4b3_p ==  2, "no responde", cond(h_5_4b3_p ==  3, "no sabe", ""))))

drop h_5_4b3_p

generate H_5_4B3_D = cond(h_5_4b3_d ==  0, "si", cond(h_5_4b3_d ==  1, "no", cond(h_5_4b3_d ==  2, "no responde", cond(h_5_4b3_d ==  3, "no sabe", ""))))

drop h_5_4b3_d

generate H_5_4B3_C = cond(h_5_4b3_c ==  0, "si", cond(h_5_4b3_c ==  1, "no", cond(h_5_4b3_c ==  2, "no responde", cond(h_5_4b3_c ==  3, "no sabe", ""))))

drop h_5_4b3_c

generate H_5_5 = cond(h_5_5 ==  0, "si", cond(h_5_5 ==  1, "no", cond(h_5_5 ==  2, "no responde", cond(h_5_5 ==  3, "no sabe", ""))))

drop h_5_5

generate H_5_5B_P = cond(h_5_5b_p ==  0, "si", cond(h_5_5b_p ==  1, "no", cond(h_5_5b_p ==  2, "no responde", cond(h_5_5b_p ==  3, "no sabe", ""))))

drop h_5_5b_p

generate H_5_5B_D = cond(h_5_5b_d ==  0, "si", cond(h_5_5b_d ==  1, "no", cond(h_5_5b_d ==  2, "no responde", cond(h_5_5b_d ==  3, "no sabe", ""))))

drop h_5_5b_d

generate H_5_5B_C = cond(h_5_5b_c ==  0, "si", cond(h_5_5b_c ==  1, "no", cond(h_5_5b_c ==  2, "no responde", cond(h_5_5b_c ==  3, "no sabe", ""))))

drop h_5_5b_c

generate H_5_5B2_P = cond(h_5_5b2_p ==  0, "si", cond(h_5_5b2_p ==  1, "no", cond(h_5_5b2_p ==  2, "no responde", cond(h_5_5b2_p ==  3, "no sabe", ""))))

drop h_5_5b2_p

generate H_5_5B2_D = cond(h_5_5b2_d ==  0, "si", cond(h_5_5b2_d ==  1, "no", cond(h_5_5b2_d ==  2, "no responde", cond(h_5_5b2_d ==  3, "no sabe", ""))))

drop h_5_5b2_d

generate H_5_5B2_C = cond(h_5_5b2_c ==  0, "si", cond(h_5_5b2_c ==  1, "no", cond(h_5_5b2_c ==  2, "no responde", cond(h_5_5b2_c ==  3, "no sabe", ""))))

drop h_5_5b2_c

generate H_5_5B3_P = cond(h_5_5b3_p ==  0, "si", cond(h_5_5b3_p ==  1, "no", cond(h_5_5b3_p ==  2, "no responde", cond(h_5_5b3_p ==  3, "no sabe", ""))))

drop h_5_5b3_p

generate H_5_5B3_D = cond(h_5_5b3_d ==  0, "si", cond(h_5_5b3_d ==  1, "no", cond(h_5_5b3_d ==  2, "no responde", cond(h_5_5b3_d ==  3, "no sabe", ""))))

drop h_5_5b3_d

generate H_5_5B3_C = cond(h_5_5b3_c ==  0, "si", cond(h_5_5b3_c ==  1, "no", cond(h_5_5b3_c ==  2, "no responde", cond(h_5_5b3_c ==  3, "no sabe", ""))))

drop h_5_5b3_c

generate H_5_6 = cond(h_5_6 ==  0, "si", cond(h_5_6 ==  1, "no", cond(h_5_6 ==  2, "no responde", cond(h_5_6 ==  3, "no sabe", ""))))

drop h_5_6

generate H_5_6B_P = cond(h_5_6b_p ==  0, "si", cond(h_5_6b_p ==  1, "no", cond(h_5_6b_p ==  2, "no responde", cond(h_5_6b_p ==  3, "no sabe", ""))))

drop h_5_6b_p

generate H_5_6B_D = cond(h_5_6b_d ==  0, "si", cond(h_5_6b_d ==  1, "no", cond(h_5_6b_d ==  2, "no responde", cond(h_5_6b_d ==  3, "no sabe", ""))))

drop h_5_6b_d

generate H_5_6B_C = cond(h_5_6b_c ==  0, "si", cond(h_5_6b_c ==  1, "no", cond(h_5_6b_c ==  2, "no responde", cond(h_5_6b_c ==  3, "no sabe", ""))))

drop h_5_6b_c

generate H_5_6B2_P = cond(h_5_6b2_p ==  0, "si", cond(h_5_6b2_p ==  1, "no", cond(h_5_6b2_p ==  2, "no responde", cond(h_5_6b2_p ==  3, "no sabe", ""))))

drop h_5_6b2_p

generate H_5_6B2_D = cond(h_5_6b2_d ==  0, "si", cond(h_5_6b2_d ==  1, "no", cond(h_5_6b2_d ==  2, "no responde", cond(h_5_6b2_d ==  3, "no sabe", ""))))

drop h_5_6b2_d

generate H_5_6B2_C = cond(h_5_6b2_c ==  0, "si", cond(h_5_6b2_c ==  1, "no", cond(h_5_6b2_c ==  2, "no responde", cond(h_5_6b2_c ==  3, "no sabe", ""))))

drop h_5_6b2_c

generate H_5_6B3_P = cond(h_5_6b3_p ==  0, "si", cond(h_5_6b3_p ==  1, "no", cond(h_5_6b3_p ==  2, "no responde", cond(h_5_6b3_p ==  3, "no sabe", ""))))

drop h_5_6b3_p

generate H_5_6B3_D = cond(h_5_6b3_d ==  0, "si", cond(h_5_6b3_d ==  1, "no", cond(h_5_6b3_d ==  2, "no responde", cond(h_5_6b3_d ==  3, "no sabe", ""))))

drop h_5_6b3_d

generate H_5_6B3_C = cond(h_5_6b3_c ==  0, "si", cond(h_5_6b3_c ==  1, "no", cond(h_5_6b3_c ==  2, "no responde", cond(h_5_6b3_c ==  3, "no sabe", ""))))

drop h_5_6b3_c

generate H_5_7 = cond(h_5_7 ==  0, "si", cond(h_5_7 ==  1, "no", cond(h_5_7 ==  2, "no responde", cond(h_5_7 ==  3, "no sabe", ""))))

drop h_5_7

generate H_5_7B_P = cond(h_5_7b_p ==  0, "si", cond(h_5_7b_p ==  1, "no", cond(h_5_7b_p ==  2, "no responde", cond(h_5_7b_p ==  3, "no sabe", ""))))

drop h_5_7b_p

generate H_5_7B_D = cond(h_5_7b_d ==  0, "si", cond(h_5_7b_d ==  1, "no", cond(h_5_7b_d ==  2, "no responde", cond(h_5_7b_d ==  3, "no sabe", ""))))

drop h_5_7b_d

generate H_5_7B_C = cond(h_5_7b_c ==  0, "si", cond(h_5_7b_c ==  1, "no", cond(h_5_7b_c ==  2, "no responde", cond(h_5_7b_c ==  3, "no sabe", ""))))

drop h_5_7b_c

generate H_5_7B2_P = cond(h_5_7b2_p ==  0, "si", cond(h_5_7b2_p ==  1, "no", cond(h_5_7b2_p ==  2, "no responde", cond(h_5_7b2_p ==  3, "no sabe", ""))))

drop h_5_7b2_p

generate H_5_7B2_D = cond(h_5_7b2_d ==  0, "si", cond(h_5_7b2_d ==  1, "no", cond(h_5_7b2_d ==  2, "no responde", cond(h_5_7b2_d ==  3, "no sabe", ""))))

drop h_5_7b2_d

generate H_5_7B2_C = cond(h_5_7b2_c ==  0, "si", cond(h_5_7b2_c ==  1, "no", cond(h_5_7b2_c ==  2, "no responde", cond(h_5_7b2_c ==  3, "no sabe", ""))))

drop h_5_7b2_c

generate H_5_8 = cond(h_5_8 ==  0, "si", cond(h_5_8 ==  1, "no", cond(h_5_8 ==  2, "no responde", cond(h_5_8 ==  3, "no sabe", ""))))

drop h_5_8

generate H_5_8B_P = cond(h_5_8b_p ==  0, "si", cond(h_5_8b_p ==  1, "no", cond(h_5_8b_p ==  2, "no responde", cond(h_5_8b_p ==  3, "no sabe", ""))))

drop h_5_8b_p

generate H_5_8B_D = cond(h_5_8b_d ==  0, "si", cond(h_5_8b_d ==  1, "no", cond(h_5_8b_d ==  2, "no responde", cond(h_5_8b_d ==  3, "no sabe", ""))))

drop h_5_8b_d

generate H_5_8B_C = cond(h_5_8b_c ==  0, "si", cond(h_5_8b_c ==  1, "no", cond(h_5_8b_c ==  2, "no responde", cond(h_5_8b_c ==  3, "no sabe", ""))))

drop h_5_8b_c

generate H_5_8B2_P = cond(h_5_8b2_p ==  0, "si", cond(h_5_8b2_p ==  1, "no", cond(h_5_8b2_p ==  2, "no responde", cond(h_5_8b2_p ==  3, "no sabe", ""))))

drop h_5_8b2_p

generate H_5_8B2_D = cond(h_5_8b2_d ==  0, "si", cond(h_5_8b2_d ==  1, "no", cond(h_5_8b2_d ==  2, "no responde", cond(h_5_8b2_d ==  3, "no sabe", ""))))

drop h_5_8b2_d

generate H_5_8B2_C = cond(h_5_8b2_c ==  0, "si", cond(h_5_8b2_c ==  1, "no", cond(h_5_8b2_c ==  2, "no responde", cond(h_5_8b2_c ==  3, "no sabe", ""))))

drop h_5_8b2_c

generate H_6_1 = cond(h_6_1 ==  0, "si", cond(h_6_1 ==  1, "no", cond(h_6_1 ==  2, "no responde", cond(h_6_1 ==  3, "no sabe", ""))))

drop h_6_1

generate H_6_1B1_P = cond(h_6_1b1_p ==  0, "si", cond(h_6_1b1_p ==  1, "no", cond(h_6_1b1_p ==  2, "no responde", cond(h_6_1b1_p ==  3, "no sabe", ""))))

drop h_6_1b1_p

generate H_6_1B1_D = cond(h_6_1b1_d ==  0, "si", cond(h_6_1b1_d ==  1, "no", cond(h_6_1b1_d ==  2, "no responde", cond(h_6_1b1_d ==  3, "no sabe", ""))))

drop h_6_1b1_d

generate H_6_1B1_C = cond(h_6_1b1_c ==  0, "si", cond(h_6_1b1_c ==  1, "no", cond(h_6_1b1_c ==  2, "no responde", cond(h_6_1b1_c ==  3, "no sabe", ""))))

drop h_6_1b1_c

generate H_6_1B2_P = cond(h_6_1b2_p ==  0, "si", cond(h_6_1b2_p ==  1, "no", cond(h_6_1b2_p ==  2, "no responde", cond(h_6_1b2_p ==  3, "no sabe", ""))))

drop h_6_1b2_p

generate H_6_1B2_D = cond(h_6_1b2_d ==  0, "si", cond(h_6_1b2_d ==  1, "no", cond(h_6_1b2_d ==  2, "no responde", cond(h_6_1b2_d ==  3, "no sabe", ""))))

drop h_6_1b2_d

generate H_6_1B2_C = cond(h_6_1b2_c ==  0, "si", cond(h_6_1b2_c ==  1, "no", cond(h_6_1b2_c ==  2, "no responde", cond(h_6_1b2_c ==  3, "no sabe", ""))))

drop h_6_1b2_c

generate H_6_2 = cond(h_6_2 ==  0, "más que suficiente?", cond(h_6_2 ==  1, "suficiente?", cond(h_6_2 ==  2, "no es suficiente", cond(h_6_2 ==  3, "no responde", cond(h_6_2 ==  4, "no sabe", "")))))

drop h_6_2

generate H_6_3 = cond(h_6_3 ==  0, "más que suficiente?", cond(h_6_3 ==  1, "suficiente?", cond(h_6_3 ==  2, "no es suficiente", cond(h_6_3 ==  3, "no responde", cond(h_6_3 ==  4, "no sabe", "")))))

drop h_6_3

generate H_6_41_D = cond(h_6_41_d ==  0, "si y ya está incluido en los apartados anteriores", cond(h_6_41_d ==  1, "si y no está incluido en los apartados anteriores", cond(h_6_41_d ==  2, "no", cond(h_6_41_d ==  3, "no responde", cond(h_6_41_d ==  4, "no sabe", "")))))

drop h_6_41_d

generate H_6_42_D = cond(h_6_42_d ==  0, "si y ya está incluido en los apartados anteriores", cond(h_6_42_d ==  1, "si y no está incluido en los apartados anteriores", cond(h_6_42_d ==  2, "no", cond(h_6_42_d ==  3, "no responde", cond(h_6_42_d ==  4, "no sabe", "")))))

drop h_6_42_d

generate H_6_43_D = cond(h_6_43_d ==  0, "si y ya está incluido en los apartados anteriores", cond(h_6_43_d ==  1, "si y no está incluido en los apartados anteriores", cond(h_6_43_d ==  2, "no", cond(h_6_43_d ==  3, "no responde", cond(h_6_43_d ==  4, "no sabe", "")))))

drop h_6_43_d

generate H_6_44_P = cond(h_6_44_p ==  0, "si y ya está incluido en los apartados anteriores", cond(h_6_44_p ==  1, "si y no está incluido en los apartados anteriores", cond(h_6_44_p ==  2, "no", cond(h_6_44_p ==  3, "no responde", cond(h_6_44_p ==  4, "no sabe", "")))))

drop h_6_44_p

generate H_6_5 = cond(h_6_5 ==  0, "si", cond(h_6_5 ==  1, "no", cond(h_6_5 ==  2, "no responde", cond(h_6_5 ==  3, "no sabe", ""))))

drop h_6_5

generate H_6_5B1_P = cond(h_6_5b1_p ==  0, "si", cond(h_6_5b1_p ==  1, "no", cond(h_6_5b1_p ==  2, "no responde", cond(h_6_5b1_p ==  3, "no sabe", ""))))

drop h_6_5b1_p

generate H_6_5B1_D = cond(h_6_5b1_d ==  0, "si", cond(h_6_5b1_d ==  1, "no", cond(h_6_5b1_d ==  2, "no responde", cond(h_6_5b1_d ==  3, "no sabe", ""))))

drop h_6_5b1_d

generate H_6_5B1_C = cond(h_6_5b1_c ==  0, "si", cond(h_6_5b1_c ==  1, "no", cond(h_6_5b1_c ==  2, "no responde", cond(h_6_5b1_c ==  3, "no sabe", ""))))

drop h_6_5b1_c

generate H_6_5B2_P = cond(h_6_5b2_p ==  0, "si", cond(h_6_5b2_p ==  1, "no", cond(h_6_5b2_p ==  2, "no responde", cond(h_6_5b2_p ==  3, "no sabe", ""))))

drop h_6_5b2_p

generate H_6_5B2_D = cond(h_6_5b2_d ==  0, "si", cond(h_6_5b2_d ==  1, "no", cond(h_6_5b2_d ==  2, "no responde", cond(h_6_5b2_d ==  3, "no sabe", ""))))

drop h_6_5b2_d

generate H_6_5B2_C = cond(h_6_5b2_c ==  0, "si", cond(h_6_5b2_c ==  1, "no", cond(h_6_5b2_c ==  2, "no responde", cond(h_6_5b2_c ==  3, "no sabe", ""))))

drop h_6_5b2_c

generate H_6_6 = cond(h_6_6 ==  0, "si", cond(h_6_6 ==  1, "no", cond(h_6_6 ==  2, "no responde", cond(h_6_6 ==  3, "no sabe", ""))))

drop h_6_6

generate H_6_6B1_P = cond(h_6_6b1_p ==  0, "si", cond(h_6_6b1_p ==  1, "no", cond(h_6_6b1_p ==  2, "no responde", cond(h_6_6b1_p ==  3, "no sabe", ""))))

drop h_6_6b1_p

generate H_6_6B1_D = cond(h_6_6b1_d ==  0, "si", cond(h_6_6b1_d ==  1, "no", cond(h_6_6b1_d ==  2, "no responde", cond(h_6_6b1_d ==  3, "no sabe", ""))))

drop h_6_6b1_d

generate H_6_6B1_C = cond(h_6_6b1_c ==  0, "si", cond(h_6_6b1_c ==  1, "no", cond(h_6_6b1_c ==  2, "no responde", cond(h_6_6b1_c ==  3, "no sabe", ""))))

drop h_6_6b1_c

generate H_6_6B2_P = cond(h_6_6b2_p ==  0, "si", cond(h_6_6b2_p ==  1, "no", cond(h_6_6b2_p ==  2, "no responde", cond(h_6_6b2_p ==  3, "no sabe", ""))))

drop h_6_6b2_p

generate H_6_6B2_D = cond(h_6_6b2_d ==  0, "si", cond(h_6_6b2_d ==  1, "no", cond(h_6_6b2_d ==  2, "no responde", cond(h_6_6b2_d ==  3, "no sabe", ""))))

drop h_6_6b2_d

generate H_6_6B2_C = cond(h_6_6b2_c ==  0, "si", cond(h_6_6b2_c ==  1, "no", cond(h_6_6b2_c ==  2, "no responde", cond(h_6_6b2_c ==  3, "no sabe", ""))))

drop h_6_6b2_c

generate H_7_1_P_C = cond(h_7_1_p_c ==  0, "casa separada", cond(h_7_1_p_c ==  1, "casa que comparte paredes con otra casa", cond(h_7_1_p_c ==  2, "apartamento", cond(h_7_1_p_c ==  3, "pieza en cuartería o parte atras", cond(h_7_1_p_c ==  4, "vivienda compartida con negocio", cond(h_7_1_p_c ==  5, "otro", cond(h_7_1_p_c ==  6, "no sabe", "")))))))

drop h_7_1_p_c

generate H_7_1_D = cond(h_7_1_d ==  0, "casa separada", cond(h_7_1_d ==  1, "casa que comparte paredes con otra casa", cond(h_7_1_d ==  2, "apartamento", cond(h_7_1_d ==  3, "pieza en cuartería o parte atras", cond(h_7_1_d ==  4, "vivienda compartida con negocio", cond(h_7_1_d ==  5, "barracón", cond(h_7_1_d ==  6, "otro", cond(h_7_1_d ==  7, "no sabe", ""))))))))

drop h_7_1_d

generate H_7_2_1 = cond(h_7_2_1 ==  0, "si", cond(h_7_2_1 ==  1, "no", cond(h_7_2_1 ==  2, "no responde", cond(h_7_2_1 ==  3, "no sabe", ""))))

drop h_7_2_1

generate H_7_2_2 = cond(h_7_2_2 ==  0, "si", cond(h_7_2_2 ==  1, "no", cond(h_7_2_2 ==  2, "no responde", cond(h_7_2_2 ==  3, "no sabe", ""))))

drop h_7_2_2

generate H_7_2_3 = cond(h_7_2_3 ==  0, "si", cond(h_7_2_3 ==  1, "no", cond(h_7_2_3 ==  2, "no responde", cond(h_7_2_3 ==  3, "no sabe", ""))))

drop h_7_2_3

generate H_7_2_4 = cond(h_7_2_4 ==  0, "si", cond(h_7_2_4 ==  1, "no", cond(h_7_2_4 ==  2, "no responde", cond(h_7_2_4 ==  3, "no sabe", ""))))

drop h_7_2_4

generate H_7_2_5 = cond(h_7_2_5 ==  0, "si", cond(h_7_2_5 ==  1, "no", cond(h_7_2_5 ==  2, "no responde", cond(h_7_2_5 ==  3, "no sabe", ""))))

drop h_7_2_5

if `country' == 0 {
    export delimited using "../PR_in/Household_Child_String.csv", replace
}
else if `country' == 1 {
    export delimited using "../DR_in/Household_Child_String.csv", replace
}
else if `country' == 2 {
    export delimited using "../CUBA_in/Household_Child_String.csv", replace
}


if `country' == 0 {
    insheet using "../PR_in/Household_Child_String.csv", comma names clear
}
else if `country' == 1 {
    insheet using "../DR_in/Household_Child_String.csv", comma names clear
}
else if `country' == 2 {
    insheet using "../CUBA_in/Household_Child_String.csv", comma names clear
}


*encoding
   
   ds, has(type string)

  local string_vars = r(varlist)

foreach var of local string_vars {

    gen `var'_trimmed = ustrlower(ustrtrim(`var'))

    replace `var' = `var'_trimmed

    drop `var'_trimmed

}

label define country_label 0 "Puerto Rico" 1 "República Dominicana" 2 "Cuba"
label values h_country country_label

gen h_country_str = string(h_country, "%12.0f")

gen h_clustid_str = string(h_clustid, "%12.0f")
replace h_clustid_str = cond(strlen(h_clustid_str) == 1, "0" + h_clustid_str, h_clustid_str)

gen h_houseid_str = string(h_houseid, "%03.0f")
replace h_houseid_str = cond(strlen(h_houseid_str) == 1, "00" + h_houseid_str, h_houseid_str)
replace h_houseid_str = cond(strlen(h_houseid_str) == 2, "0" + h_houseid_str, h_houseid_str)

gen hhid = h_country_str + h_clustid_str + h_houseid_str
drop h_clustid_str h_houseid_str

*second entry

gen h_clustid2_str = string(h_conglid2, "%12.0f")
replace h_clustid2_str = cond(strlen(h_clustid2_str) == 1, "0" + h_clustid2_str, h_clustid2_str)

gen h_houseid2_str = string(h_houseid2, "%03.0f")
replace h_houseid2_str = cond(strlen(h_houseid2_str) == 1, "00" + h_houseid2_str, h_houseid2_str)
replace h_houseid2_str = cond(strlen(h_houseid2_str) == 2, "0" + h_houseid2_str, h_houseid2_str)


gen hhid2 = h_country_str + h_clustid2_str + h_houseid2_str 
drop h_country_str h_clustid2_str h_houseid2_str 


rename h_3_1 (H_3_1)

capture confirm numeric variable H_3_1
if !_rc{
     tostring H_3_1, replace
}

label define H_3_1 .a"." 1 "propietario" 2 "alquilada" 3 "otro" 

encode H_3_1, gen(h_3_1) label (H_3_1)

rename h_3_3a_p (H_3_3A_P)

capture confirm numeric variable H_3_3A_P
if !_rc{
     tostring H_3_3A_P, replace
}

label define H_3_3A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3A_P, gen(h_3_3a_p) label (H_3_3A_P)

rename h_3_3a_d (H_3_3A_D)

capture confirm numeric variable H_3_3A_D
if !_rc{
     tostring H_3_3A_D, replace
}

label define H_3_3A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3A_D, gen(h_3_3a_d) label (H_3_3A_D)

rename h_3_3a_c (H_3_3A_C)

capture confirm numeric variable H_3_3A_C
if !_rc{
     tostring H_3_3A_C, replace
}

label define H_3_3A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3A_C, gen(h_3_3a_c) label (H_3_3A_C)

rename h_3_3b_p (H_3_3B_P)

capture confirm numeric variable H_3_3B_P
if !_rc{
     tostring H_3_3B_P, replace
}

label define H_3_3B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3B_P, gen(h_3_3b_p) label (H_3_3B_P)

rename h_3_3b_d (H_3_3B_D)

capture confirm numeric variable H_3_3B_D
if !_rc{
     tostring H_3_3B_D, replace
}

label define H_3_3B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3B_D, gen(h_3_3b_d) label (H_3_3B_D)

rename h_3_3b_c (H_3_3B_C)

capture confirm numeric variable H_3_3B_C
if !_rc{
     tostring H_3_3B_C, replace
}

label define H_3_3B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3B_C, gen(h_3_3b_c) label (H_3_3B_C)

rename h_3_3c_p (H_3_3C_P)

capture confirm numeric variable H_3_3C_P
if !_rc{
     tostring H_3_3C_P, replace
}

label define H_3_3C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3C_P, gen(h_3_3c_p) label (H_3_3C_P)

rename h_3_3c_d (H_3_3C_D)

capture confirm numeric variable H_3_3C_D
if !_rc{
     tostring H_3_3C_D, replace
}

label define H_3_3C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3C_D, gen(h_3_3c_d) label (H_3_3C_D)

rename h_3_3c_c (H_3_3C_C)

capture confirm numeric variable H_3_3C_C
if !_rc{
     tostring H_3_3C_C, replace
}

label define H_3_3C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_3C_C, gen(h_3_3c_c) label (H_3_3C_C)

rename h_3_5a_p (H_3_5A_P)

capture confirm numeric variable H_3_5A_P
if !_rc{
     tostring H_3_5A_P, replace
}

label define H_3_5A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5A_P, gen(h_3_5a_p) label (H_3_5A_P)

rename h_3_5a_d (H_3_5A_D)

capture confirm numeric variable H_3_5A_D
if !_rc{
     tostring H_3_5A_D, replace
}

label define H_3_5A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5A_D, gen(h_3_5a_d) label (H_3_5A_D)

rename h_3_5a_c (H_3_5A_C)

capture confirm numeric variable H_3_5A_C
if !_rc{
     tostring H_3_5A_C, replace
}

label define H_3_5A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5A_C, gen(h_3_5a_c) label (H_3_5A_C)

rename h_3_5b_p (H_3_5B_P)

capture confirm numeric variable H_3_5B_P
if !_rc{
     tostring H_3_5B_P, replace
}

label define H_3_5B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5B_P, gen(h_3_5b_p) label (H_3_5B_P)

rename h_3_5b_d (H_3_5B_D)

capture confirm numeric variable H_3_5B_D
if !_rc{
     tostring H_3_5B_D, replace
}

label define H_3_5B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5B_D, gen(h_3_5b_d) label (H_3_5B_D)

rename h_3_5b_c (H_3_5B_C)

capture confirm numeric variable H_3_5B_C
if !_rc{
     tostring H_3_5B_C, replace
}

label define H_3_5B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5B_C, gen(h_3_5b_c) label (H_3_5B_C)

rename h_3_5c_p (H_3_5C_P)

capture confirm numeric variable H_3_5C_P
if !_rc{
     tostring H_3_5C_P, replace
}

label define H_3_5C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5C_P, gen(h_3_5c_p) label (H_3_5C_P)

rename h_3_5c_d (H_3_5C_D)

capture confirm numeric variable H_3_5C_D
if !_rc{
     tostring H_3_5C_D, replace
}

label define H_3_5C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5C_D, gen(h_3_5c_d) label (H_3_5C_D)

rename h_3_5c_c (H_3_5C_C)

capture confirm numeric variable H_3_5C_C
if !_rc{
     tostring H_3_5C_C, replace
}

label define H_3_5C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_5C_C, gen(h_3_5c_c) label (H_3_5C_C)

rename h_3_7a_p (H_3_7A_P)

capture confirm numeric variable H_3_7A_P
if !_rc{
     tostring H_3_7A_P, replace
}

label define H_3_7A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7A_P, gen(h_3_7a_p) label (H_3_7A_P)

rename h_3_7a_d (H_3_7A_D)

capture confirm numeric variable H_3_7A_D
if !_rc{
     tostring H_3_7A_D, replace
}

label define H_3_7A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7A_D, gen(h_3_7a_d) label (H_3_7A_D)

rename h_3_7a_c (H_3_7A_C)

capture confirm numeric variable H_3_7A_C
if !_rc{
     tostring H_3_7A_C, replace
}

label define H_3_7A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7A_C, gen(h_3_7a_c) label (H_3_7A_C)

rename h_3_7b_p (H_3_7B_P)

capture confirm numeric variable H_3_7B_P
if !_rc{
     tostring H_3_7B_P, replace
}

label define H_3_7B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7B_P, gen(h_3_7b_p) label (H_3_7B_P)

rename h_3_7b_d (H_3_7B_D)

capture confirm numeric variable H_3_7B_D
if !_rc{
     tostring H_3_7B_D, replace
}

label define H_3_7B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7B_D, gen(h_3_7b_d) label (H_3_7B_D)

rename h_3_7b_c (H_3_7B_C)

capture confirm numeric variable H_3_7B_C
if !_rc{
     tostring H_3_7B_C, replace
}

label define H_3_7B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7B_C, gen(h_3_7b_c) label (H_3_7B_C)

rename h_3_7c_p (H_3_7C_P)

capture confirm numeric variable H_3_7C_P
if !_rc{
     tostring H_3_7C_P, replace
}

label define H_3_7C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7C_P, gen(h_3_7c_p) label (H_3_7C_P)

rename h_3_7c_d (H_3_7C_D)

capture confirm numeric variable H_3_7C_D
if !_rc{
     tostring H_3_7C_D, replace
}

label define H_3_7C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7C_D, gen(h_3_7c_d) label (H_3_7C_D)

rename h_3_7c_c (H_3_7C_C)

capture confirm numeric variable H_3_7C_C
if !_rc{
     tostring H_3_7C_C, replace
}

label define H_3_7C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_7C_C, gen(h_3_7c_c) label (H_3_7C_C)

rename h_3_8 (H_3_8)

capture confirm numeric variable H_3_8
if !_rc{
     tostring H_3_8, replace
}

label define H_3_8 .a"." 1 "concreto" 2 "tejas" 3 "madera" 4 "zinc" 5 "otro" 8 "no responde"9 "no sabe"

encode H_3_8, gen(h_3_8) label (H_3_8)

rename n10enestaviviendatienen (N10ENESTAVIVIENDATIENEN)

capture confirm numeric variable N10ENESTAVIVIENDATIENEN
if !_rc{
     tostring N10ENESTAVIVIENDATIENEN, replace
}

label define N10ENESTAVIVIENDATIENEN .a"." 1 "agua de tuberia dentro de la vivienda?" 2 "agua de tuberia fuera de la vivienda pero dentro del terreno?" 3 "otra agua de tuberia?" 4 "otra no de tuberia (pipa pozo río otro)?" 8 "no responde"9 "no sabe"

encode N10ENESTAVIVIENDATIENEN, gen(n10enestaviviendatienen) label (N10ENESTAVIVIENDATIENEN)

rename h_3_11 (H_3_11)

capture confirm numeric variable H_3_11
if !_rc{
     tostring H_3_11, replace
}

label define H_3_11 .a"." 1 "tiene conexión de agua?" 2 "le echan agua con cubeta?" 3 "no se le echa agua? (letrina)" 4 "no tiene" 8 "no responde"9 "no sabe"

encode H_3_11, gen(h_3_11) label (H_3_11)

rename h_3_12 (H_3_12)

capture confirm numeric variable H_3_12
if !_rc{
     tostring H_3_12, replace
}

label define H_3_12 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_12, gen(h_3_12) label (H_3_12)

rename s_3_13 (S_3_13)

capture confirm numeric variable S_3_13
if !_rc{
     tostring S_3_13, replace
}

label define S_3_13 .a"." 1 "gas?" 2 "leña o carbón?" 3 "electricidad" 4 "otro" 8 "no responde"9 "no sabe"

*changing s to h here
encode S_3_13, gen(h_3_13) label (S_3_13)

rename h_3_14_1 (H_3_14_1)

capture confirm numeric variable H_3_14_1
if !_rc{
     tostring H_3_14_1, replace
}

label define H_3_14_1 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_1, gen(h_3_14_1) label (H_3_14_1)

rename h_3_14_2 (H_3_14_2)

capture confirm numeric variable H_3_14_2
if !_rc{
     tostring H_3_14_2, replace
}

label define H_3_14_2 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_2, gen(h_3_14_2) label (H_3_14_2)

rename h_3_14_3 (H_3_14_3)

capture confirm numeric variable H_3_14_3
if !_rc{
     tostring H_3_14_3, replace
}

label define H_3_14_3 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_3, gen(h_3_14_3) label (H_3_14_3)

rename h_3_14_4 (H_3_14_4)

capture confirm numeric variable H_3_14_4
if !_rc{
     tostring H_3_14_4, replace
}

label define H_3_14_4 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_4, gen(h_3_14_4) label (H_3_14_4)

rename h_3_14_5 (H_3_14_5)

capture confirm numeric variable H_3_14_5
if !_rc{
     tostring H_3_14_5, replace
}

label define H_3_14_5 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_5, gen(h_3_14_5) label (H_3_14_5)

rename h_3_14_6 (H_3_14_6)

capture confirm numeric variable H_3_14_6
if !_rc{
     tostring H_3_14_6, replace
}

label define H_3_14_6 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_6, gen(h_3_14_6) label (H_3_14_6)

rename h_3_14_7 (H_3_14_7)

capture confirm numeric variable H_3_14_7
if !_rc{
     tostring H_3_14_7, replace
}

label define H_3_14_7 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_7, gen(h_3_14_7) label (H_3_14_7)

rename h_3_14_8 (H_3_14_8)

capture confirm numeric variable H_3_14_8
if !_rc{
     tostring H_3_14_8, replace
}

label define H_3_14_8 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_8, gen(h_3_14_8) label (H_3_14_8)

rename h_3_14_9 (H_3_14_9)

capture confirm numeric variable H_3_14_9
if !_rc{
     tostring H_3_14_9, replace
}

label define H_3_14_9 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_9, gen(h_3_14_9) label (H_3_14_9)

rename h_3_14_10 (H_3_14_10)

capture confirm numeric variable H_3_14_10
if !_rc{
     tostring H_3_14_10, replace
}

label define H_3_14_10 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_10, gen(h_3_14_10) label (H_3_14_10)

rename h_3_14_11 (H_3_14_11)

capture confirm numeric variable H_3_14_11
if !_rc{
     tostring H_3_14_11, replace
}

label define H_3_14_11 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_11, gen(h_3_14_11) label (H_3_14_11)

rename h_3_14_12 (H_3_14_12)

capture confirm numeric variable H_3_14_12
if !_rc{
     tostring H_3_14_12, replace
}

label define H_3_14_12 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_14_12, gen(h_3_14_12) label (H_3_14_12)

rename h_3_17a_p (H_3_17A_P)

capture confirm numeric variable H_3_17A_P
if !_rc{
     tostring H_3_17A_P, replace
}

label define H_3_17A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17A_P, gen(h_3_17a_p) label (H_3_17A_P)

rename h_3_17a_d (H_3_17A_D)

capture confirm numeric variable H_3_17A_D
if !_rc{
     tostring H_3_17A_D, replace
}

label define H_3_17A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17A_D, gen(h_3_17a_d) label (H_3_17A_D)

rename h_3_17a_c (H_3_17A_C)

capture confirm numeric variable H_3_17A_C
if !_rc{
     tostring H_3_17A_C, replace
}

label define H_3_17A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17A_C, gen(h_3_17a_c) label (H_3_17A_C)

rename h_3_17b_p (H_3_17B_P)

capture confirm numeric variable H_3_17B_P
if !_rc{
     tostring H_3_17B_P, replace
}

label define H_3_17B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17B_P, gen(h_3_17b_p) label (H_3_17B_P)

rename h_3_17b_d (H_3_17B_D)

capture confirm numeric variable H_3_17B_D
if !_rc{
     tostring H_3_17B_D, replace
}

label define H_3_17B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17B_D, gen(h_3_17b_d) label (H_3_17B_D)

rename h_3_17b_c (H_3_17B_C)

capture confirm numeric variable H_3_17B_C
if !_rc{
     tostring H_3_17B_C, replace
}

label define H_3_17B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17B_C, gen(h_3_17b_c) label (H_3_17B_C)

rename h_3_17c_p (H_3_17C_P)

capture confirm numeric variable H_3_17C_P
if !_rc{
     tostring H_3_17C_P, replace
}

label define H_3_17C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17C_P, gen(h_3_17c_p) label (H_3_17C_P)

rename h_3_17c_d (H_3_17C_D)

capture confirm numeric variable H_3_17C_D
if !_rc{
     tostring H_3_17C_D, replace
}

label define H_3_17C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17C_D, gen(h_3_17c_d) label (H_3_17C_D)

rename h_3_17c_c (H_3_17C_C)

capture confirm numeric variable H_3_17C_C
if !_rc{
     tostring H_3_17C_C, replace
}

label define H_3_17C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_17C_C, gen(h_3_17c_c) label (H_3_17C_C)

rename h_3_18 (H_3_18)

capture confirm numeric variable H_3_18
if !_rc{
     tostring H_3_18, replace
}

label define H_3_18 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_18, gen(h_3_18) label (H_3_18)

rename h_3_20a_p (H_3_20A_P)

capture confirm numeric variable H_3_20A_P
if !_rc{
     tostring H_3_20A_P, replace
}

label define H_3_20A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20A_P, gen(h_3_20a_p) label (H_3_20A_P)

rename h_3_20a_d (H_3_20A_D)

capture confirm numeric variable H_3_20A_D
if !_rc{
     tostring H_3_20A_D, replace
}

label define H_3_20A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20A_D, gen(h_3_20a_d) label (H_3_20A_D)

rename h_3_20a_c (H_3_20A_C)

capture confirm numeric variable H_3_20A_C
if !_rc{
     tostring H_3_20A_C, replace
}

label define H_3_20A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20A_C, gen(h_3_20a_c) label (H_3_20A_C)

rename h_3_20b_p (H_3_20B_P)

capture confirm numeric variable H_3_20B_P
if !_rc{
     tostring H_3_20B_P, replace
}

label define H_3_20B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20B_P, gen(h_3_20b_p) label (H_3_20B_P)

rename h_3_20b_d (H_3_20B_D)

capture confirm numeric variable H_3_20B_D
if !_rc{
     tostring H_3_20B_D, replace
}

label define H_3_20B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20B_D, gen(h_3_20b_d) label (H_3_20B_D)

rename h_3_20b_c (H_3_20B_C)

capture confirm numeric variable H_3_20B_C
if !_rc{
     tostring H_3_20B_C, replace
}

label define H_3_20B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20B_C, gen(h_3_20b_c) label (H_3_20B_C)

rename h_3_20c_p (H_3_20C_P)

capture confirm numeric variable H_3_20C_P
if !_rc{
     tostring H_3_20C_P, replace
}

label define H_3_20C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20C_P, gen(h_3_20c_p) label (H_3_20C_P)

rename h_3_20c_d (H_3_20C_D)

capture confirm numeric variable H_3_20C_D
if !_rc{
     tostring H_3_20C_D, replace
}

label define H_3_20C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20C_D, gen(h_3_20c_d) label (H_3_20C_D)

rename h_3_20c_c (H_3_20C_C)

capture confirm numeric variable H_3_20C_C
if !_rc{
     tostring H_3_20C_C, replace
}

label define H_3_20C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_20C_C, gen(h_3_20c_c) label (H_3_20C_C)

rename h_3_21 (H_3_21)

capture confirm numeric variable H_3_21
if !_rc{
     tostring H_3_21, replace
}

label define H_3_21 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_21, gen(h_3_21) label (H_3_21)

rename h_3_23a_p (H_3_23A_P)

capture confirm numeric variable H_3_23A_P
if !_rc{
     tostring H_3_23A_P, replace
}

label define H_3_23A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23A_P, gen(h_3_23a_p) label (H_3_23A_P)

rename h_3_23a_d (H_3_23A_D)

capture confirm numeric variable H_3_23A_D
if !_rc{
     tostring H_3_23A_D, replace
}

label define H_3_23A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23A_D, gen(h_3_23a_d) label (H_3_23A_D)

rename h_3_23a_c (H_3_23A_C)

capture confirm numeric variable H_3_23A_C
if !_rc{
     tostring H_3_23A_C, replace
}

label define H_3_23A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23A_C, gen(h_3_23a_c) label (H_3_23A_C)

rename h_3_23b_p (H_3_23B_P)

capture confirm numeric variable H_3_23B_P
if !_rc{
     tostring H_3_23B_P, replace
}

label define H_3_23B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23B_P, gen(h_3_23b_p) label (H_3_23B_P)

rename h_3_23b_d (H_3_23B_D)

capture confirm numeric variable H_3_23B_D
if !_rc{
     tostring H_3_23B_D, replace
}

label define H_3_23B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23B_D, gen(h_3_23b_d) label (H_3_23B_D)

rename h_3_23b_c (H_3_23B_C)

capture confirm numeric variable H_3_23B_C
if !_rc{
     tostring H_3_23B_C, replace
}

label define H_3_23B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23B_C, gen(h_3_23b_c) label (H_3_23B_C)

rename h_3_23c_p (H_3_23C_P)

capture confirm numeric variable H_3_23C_P
if !_rc{
     tostring H_3_23C_P, replace
}

label define H_3_23C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23C_P, gen(h_3_23c_p) label (H_3_23C_P)

rename h_3_23c_d (H_3_23C_D)

capture confirm numeric variable H_3_23C_D
if !_rc{
     tostring H_3_23C_D, replace
}

label define H_3_23C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23C_D, gen(h_3_23c_d) label (H_3_23C_D)

rename h_3_23c_c (H_3_23C_C)

capture confirm numeric variable H_3_23C_C
if !_rc{
     tostring H_3_23C_C, replace
}

label define H_3_23C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_23C_C, gen(h_3_23c_c) label (H_3_23C_C)

rename h_3_24 (H_3_24)

capture confirm numeric variable H_3_24
if !_rc{
     tostring H_3_24, replace
}

label define H_3_24 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_24, gen(h_3_24) label (H_3_24)

rename h_3_26a_p (H_3_26A_P)

capture confirm numeric variable H_3_26A_P
if !_rc{
     tostring H_3_26A_P, replace
}

label define H_3_26A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26A_P, gen(h_3_26a_p) label (H_3_26A_P)

rename h_3_26a_d (H_3_26A_D)

capture confirm numeric variable H_3_26A_D
if !_rc{
     tostring H_3_26A_D, replace
}

label define H_3_26A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26A_D, gen(h_3_26a_d) label (H_3_26A_D)

rename h_3_26a_c (H_3_26A_C)

capture confirm numeric variable H_3_26A_C
if !_rc{
     tostring H_3_26A_C, replace
}

label define H_3_26A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26A_C, gen(h_3_26a_c) label (H_3_26A_C)

rename h_3_26b_p (H_3_26B_P)

capture confirm numeric variable H_3_26B_P
if !_rc{
     tostring H_3_26B_P, replace
}

label define H_3_26B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26B_P, gen(h_3_26b_p) label (H_3_26B_P)

rename h_3_26b_d (H_3_26B_D)

capture confirm numeric variable H_3_26B_D
if !_rc{
     tostring H_3_26B_D, replace
}

label define H_3_26B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26B_D, gen(h_3_26b_d) label (H_3_26B_D)

rename h_3_26b_c (H_3_26B_C)

capture confirm numeric variable H_3_26B_C
if !_rc{
     tostring H_3_26B_C, replace
}

label define H_3_26B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26B_C, gen(h_3_26b_c) label (H_3_26B_C)

rename h_3_26c_p (H_3_26C_P)

capture confirm numeric variable H_3_26C_P
if !_rc{
     tostring H_3_26C_P, replace
}

label define H_3_26C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26C_P, gen(h_3_26c_p) label (H_3_26C_P)

rename h_3_26c_d (H_3_26C_D)

capture confirm numeric variable H_3_26C_D
if !_rc{
     tostring H_3_26C_D, replace
}

label define H_3_26C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26C_D, gen(h_3_26c_d) label (H_3_26C_D)

rename h_3_26c_c (H_3_26C_C)

capture confirm numeric variable H_3_26C_C
if !_rc{
     tostring H_3_26C_C, replace
}

label define H_3_26C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_26C_C, gen(h_3_26c_c) label (H_3_26C_C)

rename h_3_28a_p (H_3_28A_P)

capture confirm numeric variable H_3_28A_P
if !_rc{
     tostring H_3_28A_P, replace
}

label define H_3_28A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28A_P, gen(h_3_28a_p) label (H_3_28A_P)

rename h_3_28a_d (H_3_28A_D)

capture confirm numeric variable H_3_28A_D
if !_rc{
     tostring H_3_28A_D, replace
}

label define H_3_28A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28A_D, gen(h_3_28a_d) label (H_3_28A_D)

rename h_3_28a_c (H_3_28A_C)

capture confirm numeric variable H_3_28A_C
if !_rc{
     tostring H_3_28A_C, replace
}

label define H_3_28A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28A_C, gen(h_3_28a_c) label (H_3_28A_C)

rename h_3_28b_p (H_3_28B_P)

capture confirm numeric variable H_3_28B_P
if !_rc{
     tostring H_3_28B_P, replace
}

label define H_3_28B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28B_P, gen(h_3_28b_p) label (H_3_28B_P)

rename h_3_28b_d (H_3_28B_D)

capture confirm numeric variable H_3_28B_D
if !_rc{
     tostring H_3_28B_D, replace
}

label define H_3_28B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28B_D, gen(h_3_28b_d) label (H_3_28B_D)

rename h_3_28b_c (H_3_28B_C)

capture confirm numeric variable H_3_28B_C
if !_rc{
     tostring H_3_28B_C, replace
}

label define H_3_28B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28B_C, gen(h_3_28b_c) label (H_3_28B_C)

rename h_3_28c_p (H_3_28C_P)

capture confirm numeric variable H_3_28C_P
if !_rc{
     tostring H_3_28C_P, replace
}

label define H_3_28C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28C_P, gen(h_3_28c_p) label (H_3_28C_P)

rename h_3_28c_d (H_3_28C_D)

capture confirm numeric variable H_3_28C_D
if !_rc{
     tostring H_3_28C_D, replace
}

label define H_3_28C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28C_D, gen(h_3_28c_d) label (H_3_28C_D)

rename h_3_28c_c (H_3_28C_C)

capture confirm numeric variable H_3_28C_C
if !_rc{
     tostring H_3_28C_C, replace
}

label define H_3_28C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_28C_C, gen(h_3_28c_c) label (H_3_28C_C)

rename h_3_29 (H_3_29)

capture confirm numeric variable H_3_29
if !_rc{
     tostring H_3_29, replace
}

label define H_3_29 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_29, gen(h_3_29) label (H_3_29)

rename h_3_31a_p (H_3_31A_P)

capture confirm numeric variable H_3_31A_P
if !_rc{
     tostring H_3_31A_P, replace
}

label define H_3_31A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31A_P, gen(h_3_31a_p) label (H_3_31A_P)

rename h_3_31a_d (H_3_31A_D)

capture confirm numeric variable H_3_31A_D
if !_rc{
     tostring H_3_31A_D, replace
}

label define H_3_31A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31A_D, gen(h_3_31a_d) label (H_3_31A_D)

rename h_3_31a_c (H_3_31A_C)

capture confirm numeric variable H_3_31A_C
if !_rc{
     tostring H_3_31A_C, replace
}

label define H_3_31A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31A_C, gen(h_3_31a_c) label (H_3_31A_C)

rename h_3_31b_p (H_3_31B_P)

capture confirm numeric variable H_3_31B_P
if !_rc{
     tostring H_3_31B_P, replace
}

label define H_3_31B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31B_P, gen(h_3_31b_p) label (H_3_31B_P)

rename h_3_31b_d (H_3_31B_D)

capture confirm numeric variable H_3_31B_D
if !_rc{
     tostring H_3_31B_D, replace
}

label define H_3_31B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31B_D, gen(h_3_31b_d) label (H_3_31B_D)

rename h_3_31b_c (H_3_31B_C)

capture confirm numeric variable H_3_31B_C
if !_rc{
     tostring H_3_31B_C, replace
}

label define H_3_31B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31B_C, gen(h_3_31b_c) label (H_3_31B_C)

rename h_3_31c_p (H_3_31C_P)

capture confirm numeric variable H_3_31C_P
if !_rc{
     tostring H_3_31C_P, replace
}

label define H_3_31C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31C_P, gen(h_3_31c_p) label (H_3_31C_P)

rename h_3_31c_d (H_3_31C_D)

capture confirm numeric variable H_3_31C_D
if !_rc{
     tostring H_3_31C_D, replace
}

label define H_3_31C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31C_D, gen(h_3_31c_d) label (H_3_31C_D)

rename h_3_31c_c (H_3_31C_C)

capture confirm numeric variable H_3_31C_C
if !_rc{
     tostring H_3_31C_C, replace
}

label define H_3_31C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_31C_C, gen(h_3_31c_c) label (H_3_31C_C)

rename h_3_33a_p (H_3_33A_P)

capture confirm numeric variable H_3_33A_P
if !_rc{
     tostring H_3_33A_P, replace
}

label define H_3_33A_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33A_P, gen(h_3_33a_p) label (H_3_33A_P)

rename h_3_33a_d (H_3_33A_D)

capture confirm numeric variable H_3_33A_D
if !_rc{
     tostring H_3_33A_D, replace
}

label define H_3_33A_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33A_D, gen(h_3_33a_d) label (H_3_33A_D)

rename h_3_33a_c (H_3_33A_C)

capture confirm numeric variable H_3_33A_C
if !_rc{
     tostring H_3_33A_C, replace
}

label define H_3_33A_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33A_C, gen(h_3_33a_c) label (H_3_33A_C)

rename h_3_33b_p (H_3_33B_P)

capture confirm numeric variable H_3_33B_P
if !_rc{
     tostring H_3_33B_P, replace
}

label define H_3_33B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33B_P, gen(h_3_33b_p) label (H_3_33B_P)

rename h_3_33b_d (H_3_33B_D)

capture confirm numeric variable H_3_33B_D
if !_rc{
     tostring H_3_33B_D, replace
}

label define H_3_33B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33B_D, gen(h_3_33b_d) label (H_3_33B_D)

rename h_3_33b_c (H_3_33B_C)

capture confirm numeric variable H_3_33B_C
if !_rc{
     tostring H_3_33B_C, replace
}

label define H_3_33B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33B_C, gen(h_3_33b_c) label (H_3_33B_C)

rename h_3_33c_p (H_3_33C_P)

capture confirm numeric variable H_3_33C_P
if !_rc{
     tostring H_3_33C_P, replace
}

label define H_3_33C_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33C_P, gen(h_3_33c_p) label (H_3_33C_P)

rename h_3_33c_d (H_3_33C_D)

capture confirm numeric variable H_3_33C_D
if !_rc{
     tostring H_3_33C_D, replace
}

label define H_3_33C_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33C_D, gen(h_3_33c_d) label (H_3_33C_D)

rename h_3_33c_c (H_3_33C_C)

capture confirm numeric variable H_3_33C_C
if !_rc{
     tostring H_3_33C_C, replace
}

label define H_3_33C_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_33C_C, gen(h_3_33c_c) label (H_3_33C_C)

rename h_3_34 (H_3_34)

capture confirm numeric variable H_3_34
if !_rc{
     tostring H_3_34, replace
}

label define H_3_34 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_3_34, gen(h_3_34) label (H_3_34)

rename h_4_1 (H_4_1)

capture confirm numeric variable H_4_1
if !_rc{
     tostring H_4_1, replace
}

label define H_4_1 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_1, gen(h_4_1) label (H_4_1)

rename h_4_1b_p (H_4_1B_P)

capture confirm numeric variable H_4_1B_P
if !_rc{
     tostring H_4_1B_P, replace
}

label define H_4_1B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B_P, gen(h_4_1b_p) label (H_4_1B_P)

rename h_4_1b_d (H_4_1B_D)

capture confirm numeric variable H_4_1B_D
if !_rc{
     tostring H_4_1B_D, replace
}

label define H_4_1B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B_D, gen(h_4_1b_d) label (H_4_1B_D)

rename h_4_1b_c (H_4_1B_C)

capture confirm numeric variable H_4_1B_C
if !_rc{
     tostring H_4_1B_C, replace
}

label define H_4_1B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B_C, gen(h_4_1b_c) label (H_4_1B_C)

rename h_4_1b2_p (H_4_1B2_P)

capture confirm numeric variable H_4_1B2_P
if !_rc{
     tostring H_4_1B2_P, replace
}

label define H_4_1B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B2_P, gen(h_4_1b2_p) label (H_4_1B2_P)

rename h_4_1b2_d (H_4_1B2_D)

capture confirm numeric variable H_4_1B2_D
if !_rc{
     tostring H_4_1B2_D, replace
}

label define H_4_1B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B2_D, gen(h_4_1b2_d) label (H_4_1B2_D)

rename h_4_1b2_c (H_4_1B2_C)

capture confirm numeric variable H_4_1B2_C
if !_rc{
     tostring H_4_1B2_C, replace
}

label define H_4_1B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B2_C, gen(h_4_1b2_c) label (H_4_1B2_C)

rename h_4_1b3_p (H_4_1B3_P)

capture confirm numeric variable H_4_1B3_P
if !_rc{
     tostring H_4_1B3_P, replace
}

label define H_4_1B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B3_P, gen(h_4_1b3_p) label (H_4_1B3_P)

rename h_4_1b3_d (H_4_1B3_D)

capture confirm numeric variable H_4_1B3_D
if !_rc{
     tostring H_4_1B3_D, replace
}

label define H_4_1B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B3_D, gen(h_4_1b3_d) label (H_4_1B3_D)

rename h_4_1b3_c (H_4_1B3_C)

capture confirm numeric variable H_4_1B3_C
if !_rc{
     tostring H_4_1B3_C, replace
}

label define H_4_1B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_1B3_C, gen(h_4_1b3_c) label (H_4_1B3_C)

rename h_4_2 (H_4_2)

capture confirm numeric variable H_4_2
if !_rc{
     tostring H_4_2, replace
}

label define H_4_2 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_2, gen(h_4_2) label (H_4_2)

rename h_4_2b_p (H_4_2B_P)

capture confirm numeric variable H_4_2B_P
if !_rc{
     tostring H_4_2B_P, replace
}

label define H_4_2B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B_P, gen(h_4_2b_p) label (H_4_2B_P)

rename h_4_2b_d (H_4_2B_D)

capture confirm numeric variable H_4_2B_D
if !_rc{
     tostring H_4_2B_D, replace
}

label define H_4_2B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B_D, gen(h_4_2b_d) label (H_4_2B_D)

rename h_4_2b_c (H_4_2B_C)

capture confirm numeric variable H_4_2B_C
if !_rc{
     tostring H_4_2B_C, replace
}

label define H_4_2B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B_C, gen(h_4_2b_c) label (H_4_2B_C)

rename h_4_2b2_p (H_4_2B2_P)

capture confirm numeric variable H_4_2B2_P
if !_rc{
     tostring H_4_2B2_P, replace
}

label define H_4_2B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B2_P, gen(h_4_2b2_p) label (H_4_2B2_P)

rename h_4_2b2_d (H_4_2B2_D)

capture confirm numeric variable H_4_2B2_D
if !_rc{
     tostring H_4_2B2_D, replace
}

label define H_4_2B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B2_D, gen(h_4_2b2_d) label (H_4_2B2_D)

rename h_4_2b2_c (H_4_2B2_C)

capture confirm numeric variable H_4_2B2_C
if !_rc{
     tostring H_4_2B2_C, replace
}

label define H_4_2B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B2_C, gen(h_4_2b2_c) label (H_4_2B2_C)

rename h_4_2b3_p (H_4_2B3_P)

capture confirm numeric variable H_4_2B3_P
if !_rc{
     tostring H_4_2B3_P, replace
}

label define H_4_2B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B3_P, gen(h_4_2b3_p) label (H_4_2B3_P)

rename h_4_2b3_d (H_4_2B3_D)

capture confirm numeric variable H_4_2B3_D
if !_rc{
     tostring H_4_2B3_D, replace
}

label define H_4_2B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B3_D, gen(h_4_2b3_d) label (H_4_2B3_D)

rename h_4_2b3_c (H_4_2B3_C)

capture confirm numeric variable H_4_2B3_C
if !_rc{
     tostring H_4_2B3_C, replace
}

label define H_4_2B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_2B3_C, gen(h_4_2b3_c) label (H_4_2B3_C)

rename h_4_3 (H_4_3)

capture confirm numeric variable H_4_3
if !_rc{
     tostring H_4_3, replace
}

label define H_4_3 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_3, gen(h_4_3) label (H_4_3)

rename h_4_3b_p (H_4_3B_P)

capture confirm numeric variable H_4_3B_P
if !_rc{
     tostring H_4_3B_P, replace
}

label define H_4_3B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B_P, gen(h_4_3b_p) label (H_4_3B_P)

rename h_4_3b_d (H_4_3B_D)

capture confirm numeric variable H_4_3B_D
if !_rc{
     tostring H_4_3B_D, replace
}

label define H_4_3B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B_D, gen(h_4_3b_d) label (H_4_3B_D)

rename h_4_3b_c (H_4_3B_C)

capture confirm numeric variable H_4_3B_C
if !_rc{
     tostring H_4_3B_C, replace
}

label define H_4_3B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B_C, gen(h_4_3b_c) label (H_4_3B_C)

rename h_4_3b2_p (H_4_3B2_P)

capture confirm numeric variable H_4_3B2_P
if !_rc{
     tostring H_4_3B2_P, replace
}

label define H_4_3B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B2_P, gen(h_4_3b2_p) label (H_4_3B2_P)

rename h_4_3b2_d (H_4_3B2_D)

capture confirm numeric variable H_4_3B2_D
if !_rc{
     tostring H_4_3B2_D, replace
}

label define H_4_3B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B2_D, gen(h_4_3b2_d) label (H_4_3B2_D)

rename h_4_3b2_c (H_4_3B2_C)

capture confirm numeric variable H_4_3B2_C
if !_rc{
     tostring H_4_3B2_C, replace
}

label define H_4_3B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B2_C, gen(h_4_3b2_c) label (H_4_3B2_C)

rename h_4_3b3_p (H_4_3B3_P)

capture confirm numeric variable H_4_3B3_P
if !_rc{
     tostring H_4_3B3_P, replace
}

label define H_4_3B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B3_P, gen(h_4_3b3_p) label (H_4_3B3_P)

rename h_4_3b3_d (H_4_3B3_D)

capture confirm numeric variable H_4_3B3_D
if !_rc{
     tostring H_4_3B3_D, replace
}

label define H_4_3B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B3_D, gen(h_4_3b3_d) label (H_4_3B3_D)

rename h_4_3b3_c (H_4_3B3_C)

capture confirm numeric variable H_4_3B3_C
if !_rc{
     tostring H_4_3B3_C, replace
}

label define H_4_3B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_3B3_C, gen(h_4_3b3_c) label (H_4_3B3_C)

rename h_4_4 (H_4_4)

capture confirm numeric variable H_4_4
if !_rc{
     tostring H_4_4, replace
}

label define H_4_4 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_4, gen(h_4_4) label (H_4_4)

rename h_4_4b_p (H_4_4B_P)

capture confirm numeric variable H_4_4B_P
if !_rc{
     tostring H_4_4B_P, replace
}

label define H_4_4B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B_P, gen(h_4_4b_p) label (H_4_4B_P)

rename h_4_4b_d (H_4_4B_D)

capture confirm numeric variable H_4_4B_D
if !_rc{
     tostring H_4_4B_D, replace
}

label define H_4_4B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B_D, gen(h_4_4b_d) label (H_4_4B_D)

rename h_4_4b_c (H_4_4B_C)

capture confirm numeric variable H_4_4B_C
if !_rc{
     tostring H_4_4B_C, replace
}

label define H_4_4B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B_C, gen(h_4_4b_c) label (H_4_4B_C)

rename h_4_4b2_p (H_4_4B2_P)

capture confirm numeric variable H_4_4B2_P
if !_rc{
     tostring H_4_4B2_P, replace
}

label define H_4_4B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B2_P, gen(h_4_4b2_p) label (H_4_4B2_P)

rename h_4_4b2_d (H_4_4B2_D)

capture confirm numeric variable H_4_4B2_D
if !_rc{
     tostring H_4_4B2_D, replace
}

label define H_4_4B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B2_D, gen(h_4_4b2_d) label (H_4_4B2_D)

rename h_4_4b2_c (H_4_4B2_C)

capture confirm numeric variable H_4_4B2_C
if !_rc{
     tostring H_4_4B2_C, replace
}

label define H_4_4B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B2_C, gen(h_4_4b2_c) label (H_4_4B2_C)

rename h_4_4b3_p (H_4_4B3_P)

capture confirm numeric variable H_4_4B3_P
if !_rc{
     tostring H_4_4B3_P, replace
}

label define H_4_4B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B3_P, gen(h_4_4b3_p) label (H_4_4B3_P)

rename h_4_4b3_d (H_4_4B3_D)

capture confirm numeric variable H_4_4B3_D
if !_rc{
     tostring H_4_4B3_D, replace
}

label define H_4_4B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B3_D, gen(h_4_4b3_d) label (H_4_4B3_D)

rename h_4_4b3_c (H_4_4B3_C)

capture confirm numeric variable H_4_4B3_C
if !_rc{
     tostring H_4_4B3_C, replace
}

label define H_4_4B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_4B3_C, gen(h_4_4b3_c) label (H_4_4B3_C)

rename h_4_5 (H_4_5)

capture confirm numeric variable H_4_5
if !_rc{
     tostring H_4_5, replace
}

label define H_4_5 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_5, gen(h_4_5) label (H_4_5)

rename h_4_5b_p (H_4_5B_P)

capture confirm numeric variable H_4_5B_P
if !_rc{
     tostring H_4_5B_P, replace
}

label define H_4_5B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B_P, gen(h_4_5b_p) label (H_4_5B_P)

rename h_4_5b_d (H_4_5B_D)

capture confirm numeric variable H_4_5B_D
if !_rc{
     tostring H_4_5B_D, replace
}

label define H_4_5B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B_D, gen(h_4_5b_d) label (H_4_5B_D)

rename h_4_5b_c (H_4_5B_C)

capture confirm numeric variable H_4_5B_C
if !_rc{
     tostring H_4_5B_C, replace
}

label define H_4_5B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B_C, gen(h_4_5b_c) label (H_4_5B_C)

rename h_4_5b2_p (H_4_5B2_P)

capture confirm numeric variable H_4_5B2_P
if !_rc{
     tostring H_4_5B2_P, replace
}

label define H_4_5B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B2_P, gen(h_4_5b2_p) label (H_4_5B2_P)

rename h_4_5b2_d (H_4_5B2_D)

capture confirm numeric variable H_4_5B2_D
if !_rc{
     tostring H_4_5B2_D, replace
}

label define H_4_5B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B2_D, gen(h_4_5b2_d) label (H_4_5B2_D)

rename h_4_5b2_c (H_4_5B2_C)

capture confirm numeric variable H_4_5B2_C
if !_rc{
     tostring H_4_5B2_C, replace
}

label define H_4_5B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B2_C, gen(h_4_5b2_c) label (H_4_5B2_C)

rename h_4_5b3_p (H_4_5B3_P)

capture confirm numeric variable H_4_5B3_P
if !_rc{
     tostring H_4_5B3_P, replace
}

label define H_4_5B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B3_P, gen(h_4_5b3_p) label (H_4_5B3_P)

rename h_4_5b3_d (H_4_5B3_D)

capture confirm numeric variable H_4_5B3_D
if !_rc{
     tostring H_4_5B3_D, replace
}

label define H_4_5B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B3_D, gen(h_4_5b3_d) label (H_4_5B3_D)

rename h_4_5b3_c (H_4_5B3_C)

capture confirm numeric variable H_4_5B3_C
if !_rc{
     tostring H_4_5B3_C, replace
}

label define H_4_5B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_5B3_C, gen(h_4_5b3_c) label (H_4_5B3_C)

rename h_4_6 (H_4_6)

capture confirm numeric variable H_4_6
if !_rc{
     tostring H_4_6, replace
}

label define H_4_6 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_6, gen(h_4_6) label (H_4_6)

rename h_4_6b_p (H_4_6B_P)

capture confirm numeric variable H_4_6B_P
if !_rc{
     tostring H_4_6B_P, replace
}

label define H_4_6B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B_P, gen(h_4_6b_p) label (H_4_6B_P)

rename h_4_6b_d (H_4_6B_D)

capture confirm numeric variable H_4_6B_D
if !_rc{
     tostring H_4_6B_D, replace
}

label define H_4_6B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B_D, gen(h_4_6b_d) label (H_4_6B_D)

rename h_4_6b_c (H_4_6B_C)

capture confirm numeric variable H_4_6B_C
if !_rc{
     tostring H_4_6B_C, replace
}

label define H_4_6B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B_C, gen(h_4_6b_c) label (H_4_6B_C)

rename h_4_6b2_p (H_4_6B2_P)

capture confirm numeric variable H_4_6B2_P
if !_rc{
     tostring H_4_6B2_P, replace
}

label define H_4_6B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B2_P, gen(h_4_6b2_p) label (H_4_6B2_P)

rename h_4_6b2_d (H_4_6B2_D)

capture confirm numeric variable H_4_6B2_D
if !_rc{
     tostring H_4_6B2_D, replace
}

label define H_4_6B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B2_D, gen(h_4_6b2_d) label (H_4_6B2_D)

rename h_4_6b2_c (H_4_6B2_C)

capture confirm numeric variable H_4_6B2_C
if !_rc{
     tostring H_4_6B2_C, replace
}

label define H_4_6B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B2_C, gen(h_4_6b2_c) label (H_4_6B2_C)

rename h_4_6b3_p (H_4_6B3_P)

capture confirm numeric variable H_4_6B3_P
if !_rc{
     tostring H_4_6B3_P, replace
}

label define H_4_6B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B3_P, gen(h_4_6b3_p) label (H_4_6B3_P)

rename h_4_6b3_d (H_4_6B3_D)

capture confirm numeric variable H_4_6B3_D
if !_rc{
     tostring H_4_6B3_D, replace
}

label define H_4_6B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B3_D, gen(h_4_6b3_d) label (H_4_6B3_D)

rename h_4_6b3_c (H_4_6B3_C)

capture confirm numeric variable H_4_6B3_C
if !_rc{
     tostring H_4_6B3_C, replace
}

label define H_4_6B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_6B3_C, gen(h_4_6b3_c) label (H_4_6B3_C)

rename h_4_7 (H_4_7)

capture confirm numeric variable H_4_7
if !_rc{
     tostring H_4_7, replace
}

label define H_4_7 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_7, gen(h_4_7) label (H_4_7)

rename h_4_7b_p (H_4_7B_P)

capture confirm numeric variable H_4_7B_P
if !_rc{
     tostring H_4_7B_P, replace
}

label define H_4_7B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B_P, gen(h_4_7b_p) label (H_4_7B_P)

rename h_4_7b_d (H_4_7B_D)

capture confirm numeric variable H_4_7B_D
if !_rc{
     tostring H_4_7B_D, replace
}

label define H_4_7B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B_D, gen(h_4_7b_d) label (H_4_7B_D)

rename h_4_7b_c (H_4_7B_C)

capture confirm numeric variable H_4_7B_C
if !_rc{
     tostring H_4_7B_C, replace
}

label define H_4_7B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B_C, gen(h_4_7b_c) label (H_4_7B_C)

rename h_4_7b2_p (H_4_7B2_P)

capture confirm numeric variable H_4_7B2_P
if !_rc{
     tostring H_4_7B2_P, replace
}

label define H_4_7B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B2_P, gen(h_4_7b2_p) label (H_4_7B2_P)

rename h_4_7b2_d (H_4_7B2_D)

capture confirm numeric variable H_4_7B2_D
if !_rc{
     tostring H_4_7B2_D, replace
}

label define H_4_7B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B2_D, gen(h_4_7b2_d) label (H_4_7B2_D)

rename h_4_7b2_c (H_4_7B2_C)

capture confirm numeric variable H_4_7B2_C
if !_rc{
     tostring H_4_7B2_C, replace
}

label define H_4_7B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_7B2_C, gen(h_4_7b2_c) label (H_4_7B2_C)

rename h_4_8 (H_4_8)

capture confirm numeric variable H_4_8
if !_rc{
     tostring H_4_8, replace
}

label define H_4_8 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_4_8, gen(h_4_8) label (H_4_8)

rename h_4_8b_p (H_4_8B_P)

capture confirm numeric variable H_4_8B_P
if !_rc{
     tostring H_4_8B_P, replace
}

label define H_4_8B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B_P, gen(h_4_8b_p) label (H_4_8B_P)

rename h_4_8b_d (H_4_8B_D)

capture confirm numeric variable H_4_8B_D
if !_rc{
     tostring H_4_8B_D, replace
}

label define H_4_8B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B_D, gen(h_4_8b_d) label (H_4_8B_D)

rename h_4_8b_c (H_4_8B_C)

capture confirm numeric variable H_4_8B_C
if !_rc{
     tostring H_4_8B_C, replace
}

label define H_4_8B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B_C, gen(h_4_8b_c) label (H_4_8B_C)

rename h_4_8b2_p (H_4_8B2_P)

capture confirm numeric variable H_4_8B2_P
if !_rc{
     tostring H_4_8B2_P, replace
}

label define H_4_8B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B2_P, gen(h_4_8b2_p) label (H_4_8B2_P)

rename h_4_8b2_d (H_4_8B2_D)

capture confirm numeric variable H_4_8B2_D
if !_rc{
     tostring H_4_8B2_D, replace
}

label define H_4_8B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B2_D, gen(h_4_8b2_d) label (H_4_8B2_D)

rename h_4_8b2_c (H_4_8B2_C)

capture confirm numeric variable H_4_8B2_C
if !_rc{
     tostring H_4_8B2_C, replace
}

label define H_4_8B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_4_8B2_C, gen(h_4_8b2_c) label (H_4_8B2_C)

rename h_5 (H_5)

capture confirm numeric variable H_5
if !_rc{
     tostring H_5, replace
}

label define H_5 .a"." 2 "si" 1 "no" 

encode H_5, gen(h_5) label (H_5)

rename h_5_1 (H_5_1)

capture confirm numeric variable H_5_1
if !_rc{
     tostring H_5_1, replace
}

label define H_5_1 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_1, gen(h_5_1) label (H_5_1)

rename h_5_1b_p (H_5_1B_P)

capture confirm numeric variable H_5_1B_P
if !_rc{
     tostring H_5_1B_P, replace
}

label define H_5_1B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B_P, gen(h_5_1b_p) label (H_5_1B_P)

rename h_5_1b_d (H_5_1B_D)

capture confirm numeric variable H_5_1B_D
if !_rc{
     tostring H_5_1B_D, replace
}

label define H_5_1B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B_D, gen(h_5_1b_d) label (H_5_1B_D)

rename h_5_1b_c (H_5_1B_C)

capture confirm numeric variable H_5_1B_C
if !_rc{
     tostring H_5_1B_C, replace
}

label define H_5_1B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B_C, gen(h_5_1b_c) label (H_5_1B_C)

rename h_5_1b2_p (H_5_1B2_P)

capture confirm numeric variable H_5_1B2_P
if !_rc{
     tostring H_5_1B2_P, replace
}

label define H_5_1B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B2_P, gen(h_5_1b2_p) label (H_5_1B2_P)

rename h_5_1b2_d (H_5_1B2_D)

capture confirm numeric variable H_5_1B2_D
if !_rc{
     tostring H_5_1B2_D, replace
}

label define H_5_1B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B2_D, gen(h_5_1b2_d) label (H_5_1B2_D)

rename h_5_1b2_c (H_5_1B2_C)

capture confirm numeric variable H_5_1B2_C
if !_rc{
     tostring H_5_1B2_C, replace
}

label define H_5_1B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B2_C, gen(h_5_1b2_c) label (H_5_1B2_C)

rename h_5_1b3_p (H_5_1B3_P)

capture confirm numeric variable H_5_1B3_P
if !_rc{
     tostring H_5_1B3_P, replace
}

label define H_5_1B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B3_P, gen(h_5_1b3_p) label (H_5_1B3_P)

rename h_5_1b3_d (H_5_1B3_D)

capture confirm numeric variable H_5_1B3_D
if !_rc{
     tostring H_5_1B3_D, replace
}

label define H_5_1B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B3_D, gen(h_5_1b3_d) label (H_5_1B3_D)

rename h_5_1b3_c (H_5_1B3_C)

capture confirm numeric variable H_5_1B3_C
if !_rc{
     tostring H_5_1B3_C, replace
}

label define H_5_1B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_1B3_C, gen(h_5_1b3_c) label (H_5_1B3_C)

rename h_5_2 (H_5_2)

capture confirm numeric variable H_5_2
if !_rc{
     tostring H_5_2, replace
}

label define H_5_2 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_2, gen(h_5_2) label (H_5_2)

rename h_5_2b_p (H_5_2B_P)

capture confirm numeric variable H_5_2B_P
if !_rc{
     tostring H_5_2B_P, replace
}

label define H_5_2B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B_P, gen(h_5_2b_p) label (H_5_2B_P)

rename h_5_2b_d (H_5_2B_D)

capture confirm numeric variable H_5_2B_D
if !_rc{
     tostring H_5_2B_D, replace
}

label define H_5_2B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B_D, gen(h_5_2b_d) label (H_5_2B_D)

rename h_5_2b_c (H_5_2B_C)

capture confirm numeric variable H_5_2B_C
if !_rc{
     tostring H_5_2B_C, replace
}

label define H_5_2B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B_C, gen(h_5_2b_c) label (H_5_2B_C)

rename h_5_2b2_p (H_5_2B2_P)

capture confirm numeric variable H_5_2B2_P
if !_rc{
     tostring H_5_2B2_P, replace
}

label define H_5_2B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B2_P, gen(h_5_2b2_p) label (H_5_2B2_P)

rename h_5_2b2_d (H_5_2B2_D)

capture confirm numeric variable H_5_2B2_D
if !_rc{
     tostring H_5_2B2_D, replace
}

label define H_5_2B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B2_D, gen(h_5_2b2_d) label (H_5_2B2_D)

rename h_5_2b2_c (H_5_2B2_C)

capture confirm numeric variable H_5_2B2_C
if !_rc{
     tostring H_5_2B2_C, replace
}

label define H_5_2B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B2_C, gen(h_5_2b2_c) label (H_5_2B2_C)

rename h_5_2b3_p (H_5_2B3_P)

capture confirm numeric variable H_5_2B3_P
if !_rc{
     tostring H_5_2B3_P, replace
}

label define H_5_2B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B3_P, gen(h_5_2b3_p) label (H_5_2B3_P)

rename h_5_2b3_d (H_5_2B3_D)

capture confirm numeric variable H_5_2B3_D
if !_rc{
     tostring H_5_2B3_D, replace
}

label define H_5_2B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B3_D, gen(h_5_2b3_d) label (H_5_2B3_D)

rename h_5_2b3_c (H_5_2B3_C)

capture confirm numeric variable H_5_2B3_C
if !_rc{
     tostring H_5_2B3_C, replace
}

label define H_5_2B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_2B3_C, gen(h_5_2b3_c) label (H_5_2B3_C)

rename h_5_3 (H_5_3)

capture confirm numeric variable H_5_3
if !_rc{
     tostring H_5_3, replace
}

label define H_5_3 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_3, gen(h_5_3) label (H_5_3)

rename h_5_3b_p (H_5_3B_P)

capture confirm numeric variable H_5_3B_P
if !_rc{
     tostring H_5_3B_P, replace
}

label define H_5_3B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B_P, gen(h_5_3b_p) label (H_5_3B_P)

rename h_5_3b_d (H_5_3B_D)

capture confirm numeric variable H_5_3B_D
if !_rc{
     tostring H_5_3B_D, replace
}

label define H_5_3B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B_D, gen(h_5_3b_d) label (H_5_3B_D)

rename h_5_3b_c (H_5_3B_C)

capture confirm numeric variable H_5_3B_C
if !_rc{
     tostring H_5_3B_C, replace
}

label define H_5_3B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B_C, gen(h_5_3b_c) label (H_5_3B_C)

rename h_5_3b2_p (H_5_3B2_P)

capture confirm numeric variable H_5_3B2_P
if !_rc{
     tostring H_5_3B2_P, replace
}

label define H_5_3B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B2_P, gen(h_5_3b2_p) label (H_5_3B2_P)

rename h_5_3b2_d (H_5_3B2_D)

capture confirm numeric variable H_5_3B2_D
if !_rc{
     tostring H_5_3B2_D, replace
}

label define H_5_3B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B2_D, gen(h_5_3b2_d) label (H_5_3B2_D)

rename h_5_3b2_c (H_5_3B2_C)

capture confirm numeric variable H_5_3B2_C
if !_rc{
     tostring H_5_3B2_C, replace
}

label define H_5_3B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B2_C, gen(h_5_3b2_c) label (H_5_3B2_C)

rename h_5_3b3_p (H_5_3B3_P)

capture confirm numeric variable H_5_3B3_P
if !_rc{
     tostring H_5_3B3_P, replace
}

label define H_5_3B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B3_P, gen(h_5_3b3_p) label (H_5_3B3_P)

rename h_5_3b3_d (H_5_3B3_D)

capture confirm numeric variable H_5_3B3_D
if !_rc{
     tostring H_5_3B3_D, replace
}

label define H_5_3B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B3_D, gen(h_5_3b3_d) label (H_5_3B3_D)

rename h_5_3b3_c (H_5_3B3_C)

capture confirm numeric variable H_5_3B3_C
if !_rc{
     tostring H_5_3B3_C, replace
}

label define H_5_3B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_3B3_C, gen(h_5_3b3_c) label (H_5_3B3_C)

rename h_5_4 (H_5_4)

capture confirm numeric variable H_5_4
if !_rc{
     tostring H_5_4, replace
}

label define H_5_4 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_4, gen(h_5_4) label (H_5_4)

rename h_5_4b_p (H_5_4B_P)

capture confirm numeric variable H_5_4B_P
if !_rc{
     tostring H_5_4B_P, replace
}

label define H_5_4B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B_P, gen(h_5_4b_p) label (H_5_4B_P)

rename h_5_4b_d (H_5_4B_D)

capture confirm numeric variable H_5_4B_D
if !_rc{
     tostring H_5_4B_D, replace
}

label define H_5_4B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B_D, gen(h_5_4b_d) label (H_5_4B_D)

rename h_5_4b_c (H_5_4B_C)

capture confirm numeric variable H_5_4B_C
if !_rc{
     tostring H_5_4B_C, replace
}

label define H_5_4B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B_C, gen(h_5_4b_c) label (H_5_4B_C)

rename h_5_4b2_p (H_5_4B2_P)

capture confirm numeric variable H_5_4B2_P
if !_rc{
     tostring H_5_4B2_P, replace
}

label define H_5_4B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B2_P, gen(h_5_4b2_p) label (H_5_4B2_P)

rename h_5_4b2_d (H_5_4B2_D)

capture confirm numeric variable H_5_4B2_D
if !_rc{
     tostring H_5_4B2_D, replace
}

label define H_5_4B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B2_D, gen(h_5_4b2_d) label (H_5_4B2_D)

rename h_5_4b2_c (H_5_4B2_C)

capture confirm numeric variable H_5_4B2_C
if !_rc{
     tostring H_5_4B2_C, replace
}

label define H_5_4B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B2_C, gen(h_5_4b2_c) label (H_5_4B2_C)

rename h_5_4b3_p (H_5_4B3_P)

capture confirm numeric variable H_5_4B3_P
if !_rc{
     tostring H_5_4B3_P, replace
}

label define H_5_4B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B3_P, gen(h_5_4b3_p) label (H_5_4B3_P)

rename h_5_4b3_d (H_5_4B3_D)

capture confirm numeric variable H_5_4B3_D
if !_rc{
     tostring H_5_4B3_D, replace
}

label define H_5_4B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B3_D, gen(h_5_4b3_d) label (H_5_4B3_D)

rename h_5_4b3_c (H_5_4B3_C)

capture confirm numeric variable H_5_4B3_C
if !_rc{
     tostring H_5_4B3_C, replace
}

label define H_5_4B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_4B3_C, gen(h_5_4b3_c) label (H_5_4B3_C)

rename h_5_5 (H_5_5)

capture confirm numeric variable H_5_5
if !_rc{
     tostring H_5_5, replace
}

label define H_5_5 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_5, gen(h_5_5) label (H_5_5)

rename h_5_5b_p (H_5_5B_P)

capture confirm numeric variable H_5_5B_P
if !_rc{
     tostring H_5_5B_P, replace
}

label define H_5_5B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B_P, gen(h_5_5b_p) label (H_5_5B_P)

rename h_5_5b_d (H_5_5B_D)

capture confirm numeric variable H_5_5B_D
if !_rc{
     tostring H_5_5B_D, replace
}

label define H_5_5B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B_D, gen(h_5_5b_d) label (H_5_5B_D)

rename h_5_5b_c (H_5_5B_C)

capture confirm numeric variable H_5_5B_C
if !_rc{
     tostring H_5_5B_C, replace
}

label define H_5_5B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B_C, gen(h_5_5b_c) label (H_5_5B_C)

rename h_5_5b2_p (H_5_5B2_P)

capture confirm numeric variable H_5_5B2_P
if !_rc{
     tostring H_5_5B2_P, replace
}

label define H_5_5B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B2_P, gen(h_5_5b2_p) label (H_5_5B2_P)

rename h_5_5b2_d (H_5_5B2_D)

capture confirm numeric variable H_5_5B2_D
if !_rc{
     tostring H_5_5B2_D, replace
}

label define H_5_5B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B2_D, gen(h_5_5b2_d) label (H_5_5B2_D)

rename h_5_5b2_c (H_5_5B2_C)

capture confirm numeric variable H_5_5B2_C
if !_rc{
     tostring H_5_5B2_C, replace
}

label define H_5_5B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B2_C, gen(h_5_5b2_c) label (H_5_5B2_C)

rename h_5_5b3_p (H_5_5B3_P)

capture confirm numeric variable H_5_5B3_P
if !_rc{
     tostring H_5_5B3_P, replace
}

label define H_5_5B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B3_P, gen(h_5_5b3_p) label (H_5_5B3_P)

rename h_5_5b3_d (H_5_5B3_D)

capture confirm numeric variable H_5_5B3_D
if !_rc{
     tostring H_5_5B3_D, replace
}

label define H_5_5B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B3_D, gen(h_5_5b3_d) label (H_5_5B3_D)

rename h_5_5b3_c (H_5_5B3_C)

capture confirm numeric variable H_5_5B3_C
if !_rc{
     tostring H_5_5B3_C, replace
}

label define H_5_5B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_5B3_C, gen(h_5_5b3_c) label (H_5_5B3_C)

rename h_5_6 (H_5_6)

capture confirm numeric variable H_5_6
if !_rc{
     tostring H_5_6, replace
}

label define H_5_6 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_6, gen(h_5_6) label (H_5_6)

rename h_5_6b_p (H_5_6B_P)

capture confirm numeric variable H_5_6B_P
if !_rc{
     tostring H_5_6B_P, replace
}

label define H_5_6B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B_P, gen(h_5_6b_p) label (H_5_6B_P)

rename h_5_6b_d (H_5_6B_D)

capture confirm numeric variable H_5_6B_D
if !_rc{
     tostring H_5_6B_D, replace
}

label define H_5_6B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B_D, gen(h_5_6b_d) label (H_5_6B_D)

rename h_5_6b_c (H_5_6B_C)

capture confirm numeric variable H_5_6B_C
if !_rc{
     tostring H_5_6B_C, replace
}

label define H_5_6B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B_C, gen(h_5_6b_c) label (H_5_6B_C)

rename h_5_6b2_p (H_5_6B2_P)

capture confirm numeric variable H_5_6B2_P
if !_rc{
     tostring H_5_6B2_P, replace
}

label define H_5_6B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B2_P, gen(h_5_6b2_p) label (H_5_6B2_P)

rename h_5_6b2_d (H_5_6B2_D)

capture confirm numeric variable H_5_6B2_D
if !_rc{
     tostring H_5_6B2_D, replace
}

label define H_5_6B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B2_D, gen(h_5_6b2_d) label (H_5_6B2_D)

rename h_5_6b2_c (H_5_6B2_C)

capture confirm numeric variable H_5_6B2_C
if !_rc{
     tostring H_5_6B2_C, replace
}

label define H_5_6B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B2_C, gen(h_5_6b2_c) label (H_5_6B2_C)

rename h_5_6b3_p (H_5_6B3_P)

capture confirm numeric variable H_5_6B3_P
if !_rc{
     tostring H_5_6B3_P, replace
}

label define H_5_6B3_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B3_P, gen(h_5_6b3_p) label (H_5_6B3_P)

rename h_5_6b3_d (H_5_6B3_D)

capture confirm numeric variable H_5_6B3_D
if !_rc{
     tostring H_5_6B3_D, replace
}

label define H_5_6B3_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B3_D, gen(h_5_6b3_d) label (H_5_6B3_D)

rename h_5_6b3_c (H_5_6B3_C)

capture confirm numeric variable H_5_6B3_C
if !_rc{
     tostring H_5_6B3_C, replace
}

label define H_5_6B3_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_6B3_C, gen(h_5_6b3_c) label (H_5_6B3_C)

rename h_5_7 (H_5_7)

capture confirm numeric variable H_5_7
if !_rc{
     tostring H_5_7, replace
}

label define H_5_7 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_7, gen(h_5_7) label (H_5_7)

rename h_5_7b_p (H_5_7B_P)

capture confirm numeric variable H_5_7B_P
if !_rc{
     tostring H_5_7B_P, replace
}

label define H_5_7B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B_P, gen(h_5_7b_p) label (H_5_7B_P)

rename h_5_7b_d (H_5_7B_D)

capture confirm numeric variable H_5_7B_D
if !_rc{
     tostring H_5_7B_D, replace
}

label define H_5_7B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B_D, gen(h_5_7b_d) label (H_5_7B_D)

rename h_5_7b_c (H_5_7B_C)

capture confirm numeric variable H_5_7B_C
if !_rc{
     tostring H_5_7B_C, replace
}

label define H_5_7B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B_C, gen(h_5_7b_c) label (H_5_7B_C)

rename h_5_7b2_p (H_5_7B2_P)

capture confirm numeric variable H_5_7B2_P
if !_rc{
     tostring H_5_7B2_P, replace
}

label define H_5_7B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B2_P, gen(h_5_7b2_p) label (H_5_7B2_P)

rename h_5_7b2_d (H_5_7B2_D)

capture confirm numeric variable H_5_7B2_D
if !_rc{
     tostring H_5_7B2_D, replace
}

label define H_5_7B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B2_D, gen(h_5_7b2_d) label (H_5_7B2_D)

rename h_5_7b2_c (H_5_7B2_C)

capture confirm numeric variable H_5_7B2_C
if !_rc{
     tostring H_5_7B2_C, replace
}

label define H_5_7B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_7B2_C, gen(h_5_7b2_c) label (H_5_7B2_C)

rename h_5_8 (H_5_8)

capture confirm numeric variable H_5_8
if !_rc{
     tostring H_5_8, replace
}

label define H_5_8 .a"." 1 "si" 0 "no" 8 "no responde"9 "no sabe"

encode H_5_8, gen(h_5_8) label (H_5_8)

rename h_5_8b_p (H_5_8B_P)

capture confirm numeric variable H_5_8B_P
if !_rc{
     tostring H_5_8B_P, replace
}

label define H_5_8B_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B_P, gen(h_5_8b_p) label (H_5_8B_P)

rename h_5_8b_d (H_5_8B_D)

capture confirm numeric variable H_5_8B_D
if !_rc{
     tostring H_5_8B_D, replace
}

label define H_5_8B_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B_D, gen(h_5_8b_d) label (H_5_8B_D)

rename h_5_8b_c (H_5_8B_C)

capture confirm numeric variable H_5_8B_C
if !_rc{
     tostring H_5_8B_C, replace
}

label define H_5_8B_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B_C, gen(h_5_8b_c) label (H_5_8B_C)

rename h_5_8b2_p (H_5_8B2_P)

capture confirm numeric variable H_5_8B2_P
if !_rc{
     tostring H_5_8B2_P, replace
}

label define H_5_8B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B2_P, gen(h_5_8b2_p) label (H_5_8B2_P)

rename h_5_8b2_d (H_5_8B2_D)

capture confirm numeric variable H_5_8B2_D
if !_rc{
     tostring H_5_8B2_D, replace
}

label define H_5_8B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B2_D, gen(h_5_8b2_d) label (H_5_8B2_D)

rename h_5_8b2_c (H_5_8B2_C)

capture confirm numeric variable H_5_8B2_C
if !_rc{
     tostring H_5_8B2_C, replace
}

label define H_5_8B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_5_8B2_C, gen(h_5_8b2_c) label (H_5_8B2_C)

rename h_6_1 (H_6_1)

capture confirm numeric variable H_6_1
if !_rc{
     tostring H_6_1, replace
}

label define H_6_1 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1, gen(h_6_1) label (H_6_1)

rename h_6_1b1_p (H_6_1B1_P)

capture confirm numeric variable H_6_1B1_P
if !_rc{
     tostring H_6_1B1_P, replace
}

label define H_6_1B1_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B1_P, gen(h_6_1b1_p) label (H_6_1B1_P)

rename h_6_1b1_d (H_6_1B1_D)

capture confirm numeric variable H_6_1B1_D
if !_rc{
     tostring H_6_1B1_D, replace
}

label define H_6_1B1_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B1_D, gen(h_6_1b1_d) label (H_6_1B1_D)

rename h_6_1b1_c (H_6_1B1_C)

capture confirm numeric variable H_6_1B1_C
if !_rc{
     tostring H_6_1B1_C, replace
}

label define H_6_1B1_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B1_C, gen(h_6_1b1_c) label (H_6_1B1_C)

rename h_6_1b2_p (H_6_1B2_P)

capture confirm numeric variable H_6_1B2_P
if !_rc{
     tostring H_6_1B2_P, replace
}

label define H_6_1B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B2_P, gen(h_6_1b2_p) label (H_6_1B2_P)

rename h_6_1b2_d (H_6_1B2_D)

capture confirm numeric variable H_6_1B2_D
if !_rc{
     tostring H_6_1B2_D, replace
}

label define H_6_1B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B2_D, gen(h_6_1b2_d) label (H_6_1B2_D)

rename h_6_1b2_c (H_6_1B2_C)

capture confirm numeric variable H_6_1B2_C
if !_rc{
     tostring H_6_1B2_C, replace
}

label define H_6_1B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_1B2_C, gen(h_6_1b2_c) label (H_6_1B2_C)

rename h_6_2 (H_6_2)

capture confirm numeric variable H_6_2
if !_rc{
     tostring H_6_2, replace
}

label define H_6_2 .a"." 1 "más que suficiente?" 2 "suficiente?" 3 "no es suficiente" 8 "no responde"9 "no sabe"

encode H_6_2, gen(h_6_2) label (H_6_2)

rename h_6_3 (H_6_3)

capture confirm numeric variable H_6_3
if !_rc{
     tostring H_6_3, replace
}

label define H_6_3 .a"." 1 "más que suficiente?" 2 "suficiente?" 3 "no es suficiente" 8 "no responde"9 "no sabe"

encode H_6_3, gen(h_6_3) label (H_6_3)

rename h_6_41_d (H_6_41_D)

capture confirm numeric variable H_6_41_D
if !_rc{
     tostring H_6_41_D, replace
}

label define H_6_41_D .a"." 1 "si y ya está incluido en los apartados anteriores" 2 "si y no está incluido en los apartados anteriores" 3 "no" 8 "no responde"9 "no sabe"

encode H_6_41_D, gen(h_6_41_d) label (H_6_41_D)

rename h_6_42_d (H_6_42_D)

capture confirm numeric variable H_6_42_D
if !_rc{
     tostring H_6_42_D, replace
}

label define H_6_42_D .a"." 1 "si y ya está incluido en los apartados anteriores" 2 "si y no está incluido en los apartados anteriores" 3 "no" 8 "no responde"9 "no sabe"

encode H_6_42_D, gen(h_6_42_d) label (H_6_42_D)

rename h_6_43_d (H_6_43_D)

capture confirm numeric variable H_6_43_D
if !_rc{
     tostring H_6_43_D, replace
}

label define H_6_43_D .a"." 1 "si y ya está incluido en los apartados anteriores" 2 "si y no está incluido en los apartados anteriores" 3 "no" 8 "no responde"9 "no sabe"

encode H_6_43_D, gen(h_6_43_d) label (H_6_43_D)

rename h_6_44_p (H_6_44_P)

capture confirm numeric variable H_6_44_P
if !_rc{
     tostring H_6_44_P, replace
}

label define H_6_44_P .a"." 1 "si y ya está incluido en los apartados anteriores" 2 "si y no está incluido en los apartados anteriores" 3 "no" 8 "no responde"9 "no sabe"

encode H_6_44_P, gen(h_6_44_p) label (H_6_44_P)

rename h_6_5 (H_6_5)

capture confirm numeric variable H_6_5
if !_rc{
     tostring H_6_5, replace
}

label define H_6_5 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5, gen(h_6_5) label (H_6_5)

rename h_6_5b1_p (H_6_5B1_P)

capture confirm numeric variable H_6_5B1_P
if !_rc{
     tostring H_6_5B1_P, replace
}

label define H_6_5B1_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B1_P, gen(h_6_5b1_p) label (H_6_5B1_P)

rename h_6_5b1_d (H_6_5B1_D)

capture confirm numeric variable H_6_5B1_D
if !_rc{
     tostring H_6_5B1_D, replace
}

label define H_6_5B1_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B1_D, gen(h_6_5b1_d) label (H_6_5B1_D)

rename h_6_5b1_c (H_6_5B1_C)

capture confirm numeric variable H_6_5B1_C
if !_rc{
     tostring H_6_5B1_C, replace
}

label define H_6_5B1_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B1_C, gen(h_6_5b1_c) label (H_6_5B1_C)

rename h_6_5b2_p (H_6_5B2_P)

capture confirm numeric variable H_6_5B2_P
if !_rc{
     tostring H_6_5B2_P, replace
}

label define H_6_5B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B2_P, gen(h_6_5b2_p) label (H_6_5B2_P)

rename h_6_5b2_d (H_6_5B2_D)

capture confirm numeric variable H_6_5B2_D
if !_rc{
     tostring H_6_5B2_D, replace
}

label define H_6_5B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B2_D, gen(h_6_5b2_d) label (H_6_5B2_D)

rename h_6_5b2_c (H_6_5B2_C)

capture confirm numeric variable H_6_5B2_C
if !_rc{
     tostring H_6_5B2_C, replace
}

label define H_6_5B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_5B2_C, gen(h_6_5b2_c) label (H_6_5B2_C)

rename h_6_6 (H_6_6)

capture confirm numeric variable H_6_6
if !_rc{
     tostring H_6_6, replace
}

label define H_6_6 .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6, gen(h_6_6) label (H_6_6)

rename h_6_6b1_p (H_6_6B1_P)

capture confirm numeric variable H_6_6B1_P
if !_rc{
     tostring H_6_6B1_P, replace
}

label define H_6_6B1_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B1_P, gen(h_6_6b1_p) label (H_6_6B1_P)

rename h_6_6b1_d (H_6_6B1_D)

capture confirm numeric variable H_6_6B1_D
if !_rc{
     tostring H_6_6B1_D, replace
}

label define H_6_6B1_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B1_D, gen(h_6_6b1_d) label (H_6_6B1_D)

rename h_6_6b1_c (H_6_6B1_C)

capture confirm numeric variable H_6_6B1_C
if !_rc{
     tostring H_6_6B1_C, replace
}

label define H_6_6B1_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B1_C, gen(h_6_6b1_c) label (H_6_6B1_C)

rename h_6_6b2_p (H_6_6B2_P)

capture confirm numeric variable H_6_6B2_P
if !_rc{
     tostring H_6_6B2_P, replace
}

label define H_6_6B2_P .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B2_P, gen(h_6_6b2_p) label (H_6_6B2_P)

rename h_6_6b2_d (H_6_6B2_D)

capture confirm numeric variable H_6_6B2_D
if !_rc{
     tostring H_6_6B2_D, replace
}

label define H_6_6B2_D .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B2_D, gen(h_6_6b2_d) label (H_6_6B2_D)

rename h_6_6b2_c (H_6_6B2_C)

capture confirm numeric variable H_6_6B2_C
if !_rc{
     tostring H_6_6B2_C, replace
}

label define H_6_6B2_C .a"." 1 "si" 2 "no" 8 "no responde"9 "no sabe"

encode H_6_6B2_C, gen(h_6_6b2_c) label (H_6_6B2_C)

rename h_7_1_p_c (H_7_1_P_C)

capture confirm numeric variable H_7_1_P_C
if !_rc{
     tostring H_7_1_P_C, replace
}

label define H_7_1_P_C .a"." 1 "casa separada" 2 "casa que comparte paredes con otra casa" 3 "apartamento" 4 "pieza en cuartería o parte atras" 5 "vivienda compartida con negocio" 77 "otro" 99 "no sabe"

encode H_7_1_P_C, gen(h_7_1_p_c) label (H_7_1_P_C)

rename h_7_1_d (H_7_1_D)

capture confirm numeric variable H_7_1_D
if !_rc{
     tostring H_7_1_D, replace
}

label define H_7_1_D .a"." 1 "casa separada" 2 "casa que comparte paredes con otra casa" 3 "apartamento" 4 "pieza en cuartería o parte atras" 5 "vivienda compartida con negocio" 6 "barracón" 77 "otro" 99 "no sabe"

encode H_7_1_D, gen(h_7_1_d) label (H_7_1_D)

rename h_7_2_1 (H_7_2_1)

capture confirm numeric variable H_7_2_1
if !_rc{
     tostring H_7_2_1, replace
}

label define H_7_2_1 .a"." 2 "si" 1 "no" 8 "no responde"9 "no sabe"

encode H_7_2_1, gen(h_7_2_1) label (H_7_2_1)

rename h_7_2_2 (H_7_2_2)

capture confirm numeric variable H_7_2_2
if !_rc{
     tostring H_7_2_2, replace
}

label define H_7_2_2 .a"." 2 "si" 1 "no" 8 "no responde"9 "no sabe"

encode H_7_2_2, gen(h_7_2_2) label (H_7_2_2)

rename h_7_2_3 (H_7_2_3)

capture confirm numeric variable H_7_2_3
if !_rc{
     tostring H_7_2_3, replace
}

label define H_7_2_3 .a"." 2 "si" 1 "no" 8 "no responde"9 "no sabe"

encode H_7_2_3, gen(h_7_2_3) label (H_7_2_3)

rename h_7_2_4 (H_7_2_4)

capture confirm numeric variable H_7_2_4
if !_rc{
     tostring H_7_2_4, replace
}

label define H_7_2_4 .a"." 2 "si" 1 "no" 8 "no responde"9 "no sabe"

encode H_7_2_4, gen(h_7_2_4) label (H_7_2_4)

rename h_7_2_5 (H_7_2_5)

capture confirm numeric variable H_7_2_5
if !_rc{
     tostring H_7_2_5, replace
}

label define H_7_2_5 .a"." 2 "si" 1 "no" 8 "no responde"9 "no sabe"

encode H_7_2_5, gen(h_7_2_5) label (H_7_2_5)

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

order hhid hhid2 h_interid h_houseid h_clustid h_houseid2 h_conglid2 h_country h_deviceid1 h_3_1 h_3_2_p h_3_2_d h_3_2_c h_3_3a_p h_3_3a_d h_3_3a_c h_3_3b_p h_3_3b_d h_3_3b_c h_3_3c_p h_3_3c_d h_3_3c_c h_3_4_p h_3_4_d h_3_4_c h_3_5a_p h_3_5a_d h_3_5a_c h_3_5b_p h_3_5b_d h_3_5b_c h_3_5c_p h_3_5c_d h_3_5c_c h_3_6_p h_3_6_d h_3_6_c h_3_7a_p h_3_7a_d h_3_7a_c h_3_7b_p h_3_7b_d h_3_7b_c h_3_7c_p h_3_7c_d h_3_7c_c h_3_8 h_3_9 n10enestaviviendatienen h_3_11 h_3_12 h_3_13 h_3_14_1 h_3_14_2 h_3_14_3 h_3_14_4 h_3_14_5 h_3_14_6 h_3_14_7 h_3_14_8 h_3_14_9 h_3_14_10 h_3_14_11 h_3_14_12 h_3_15 h_3_16_p h_3_16_d h_3_16_c h_3_17a_p h_3_17a_d h_3_17a_c h_3_17b_p h_3_17b_d h_3_17b_c h_3_17c_p h_3_17c_d h_3_17c_c h_3_18 h_3_19_p h_3_19_d h_3_19_c h_3_20a_p h_3_20a_d h_3_20a_c h_3_20b_p h_3_20b_d h_3_20b_c h_3_20c_p h_3_20c_d h_3_20c_c h_3_21 h_3_22_p h_3_22_d h_3_22_c h_3_23a_p h_3_23a_d h_3_23a_c h_3_23b_p h_3_23b_d h_3_23b_c h_3_23c_p h_3_23c_d h_3_23c_c h_3_24 h_3_25_p h_3_25_d h_3_25_c h_3_26a_p h_3_26a_d h_3_26a_c h_3_26b_p h_3_26b_d h_3_26b_c h_3_26c_p h_3_26c_d h_3_26c_c h_3_27_p h_3_27_d h_3_27_c h_3_28a_p h_3_28a_d h_3_28a_c h_3_28b_p h_3_28b_d h_3_28b_c h_3_28c_p h_3_28c_d h_3_28c_c h_3_29 h_3_30_p h_3_30_d h_3_30_c h_3_31a_p h_3_31a_d h_3_31a_c h_3_31b_p h_3_31b_d h_3_31b_c h_3_31c_p h_3_31c_d h_3_31c_c h_3_32_p h_3_32_d h_3_32_c h_3_33a_p h_3_33a_d h_3_33a_c h_3_33b_p h_3_33b_d h_3_33b_c h_3_33c_p h_3_33c_d h_3_33c_c h_3_34 h_4 h_4_1 h_4_1a h_4_1b_p h_4_1b_d h_4_1b_c h_4_1b2_p h_4_1b2_d h_4_1b2_c h_4_1b3_p h_4_1b3_d h_4_1b3_c h_4_2 h_4_2a h_4_2b_p h_4_2b_d h_4_2b_c h_4_2b2_p h_4_2b2_d h_4_2b2_c h_4_2b3_p h_4_2b3_d h_4_2b3_c h_4_3 h_4_3a h_4_3b_p h_4_3b_d h_4_3b_c h_4_3b2_p h_4_3b2_d h_4_3b2_c h_4_3b3_p h_4_3b3_d h_4_3b3_c h_4_4 h_4_4a h_4_4b_p h_4_4b_d h_4_4b_c h_4_4b2_p h_4_4b2_d h_4_4b2_c h_4_4b3_p h_4_4b3_d h_4_4b3_c h_4_5 h_4_5a h_4_5b_p h_4_5b_d h_4_5b_c h_4_5b2_p h_4_5b2_d h_4_5b2_c h_4_5b3_p h_4_5b3_d h_4_5b3_c h_4_6 h_4_6a h_4_6b_p h_4_6b_d h_4_6b_c h_4_6b2_p h_4_6b2_d h_4_6b2_c h_4_6b3_p h_4_6b3_d h_4_6b3_c h_4_7 h_4_7a h_4_7b_p h_4_7b_d h_4_7b_c h_4_7b2_p h_4_7b2_d h_4_7b2_c h_4_8 h_4_8a h_4_8b_p h_4_8b_d h_4_8b_c h_4_8b2_p h_4_8b2_d h_4_8b2_c h_5 h_5_1 h_5_1a h_5_1b_p h_5_1b_d h_5_1b_c h_5_1b2_p h_5_1b2_d h_5_1b2_c h_5_1b3_p h_5_1b3_d h_5_1b3_c h_5_2 h_5_2a h_5_2b_p h_5_2b_d h_5_2b_c h_5_2b2_p h_5_2b2_d h_5_2b2_c h_5_2b3_p h_5_2b3_d h_5_2b3_c h_5_3 h_5_3a h_5_3b_p h_5_3b_d h_5_3b_c h_5_3b2_p h_5_3b2_d h_5_3b2_c h_5_3b3_p h_5_3b3_d h_5_3b3_c h_5_4 h_5_4a h_5_4b_p h_5_4b_d h_5_4b_c h_5_4b2_p h_5_4b2_d h_5_4b2_c h_5_4b3_p h_5_4b3_d h_5_4b3_c h_5_5 h_5_5a h_5_5b_p h_5_5b_d h_5_5b_c h_5_5b2_p h_5_5b2_d h_5_5b2_c h_5_5b3_p h_5_5b3_d h_5_5b3_c h_5_6 h_5_6a h_5_6b_p h_5_6b_d h_5_6b_c h_5_6b2_p h_5_6b2_d h_5_6b2_c h_5_6b3_p h_5_6b3_d h_5_6b3_c h_5_7 h_5_7a h_5_7b_p h_5_7b_d h_5_7b_c h_5_7b2_p h_5_7b2_d h_5_7b2_c h_5_8 h_5_8a h_5_8b_p h_5_8b_d h_5_8b_c h_5_8b2_p h_5_8b2_d h_5_8b2_c h_6_1 h_6_1a_p h_6_1a_d h_6_1a_c h_6_1b1_p h_6_1b1_d h_6_1b1_c h_6_1b2_p h_6_1b2_d h_6_1b2_c h_6_2 h_6_3 h_6_41_d h_6_42_d h_6_43_d h_6_44_p h_6_5 h_6_5a_p h_6_5a_d h_6_5a_c h_6_5b1_p h_6_5b1_d h_6_5b1_c h_6_5b2_p h_6_5b2_d h_6_5b2_c h_6_6 h_6_6a_p h_6_6a_d h_6_6a_c h_6_6b1_p h_6_6b1_d h_6_6b1_c h_6_6b2_p h_6_6b2_d h_6_6b2_c h_7_1_p_c h_7_1_d h_7_2_1 h_7_2_2 h_7_2_3 h_7_2_4 h_7_2_5 h_deviceid2

*variable labels

label variable h_interid "Número del entrevistador:"

label variable h_houseid "Número de la casa:"

label variable h_clustid "Número del cluster"

label variable h_houseid2 "Número de la casa:"

label variable h_conglid2 "Número del cluster"

label variable h_country "Pais:"

label variable h_deviceid1 "Device ID:"

label variable h_3_1 "3.1 La familia es propietaria o alquila la casa?"

label variable h_3_2_p "3.2 Si la vendiera hoy y pagara lo que debe sobre esta propiedad (contando terreno y vivienda), ¿cuánto dinero le daría? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_2_d "3.2 Si la vendiera hoy y pagara lo que debe sobre esta propiedad (contando terreno y vivienda), ¿cuánto dinero le daría? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_2_c "3.2 Si la vendiera hoy y pagara lo que debe sobre esta propiedad (contando terreno y vivienda), ¿cuánto dinero le daría? |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_3a_p "3.3a más de $36 000?"

label variable h_3_3a_d "3.3a más de $500 000 pesos?"

label variable h_3_3a_c "3.3a más de 1 100 000 CUP?"

label variable h_3_3b_p "3.3b más de $18 500?"

label variable h_3_3b_d "3.3b más de $250 000 pesos?"

label variable h_3_3b_c "3.3b más de 550 000 CUP?"

label variable h_3_3c_p "3.3c más de $180 000?"

label variable h_3_3c_d "3.3c más de $2 500 000 pesos?"

label variable h_3_3c_c "3.3c más de 5 500 000 CUP?"

label variable h_3_4_p "3.4 Si esta casa la fueran a alquilar a otra persona, ¿cuánto sería el alquiler mensual? REGISTRA CANTIDAD |_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_4_d "3.4 Si esta casa la fueran a alquilar a otra persona, ¿cuánto sería el alquiler mensual? REGISTRA CANTIDAD |_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_4_c "3.4 Si esta casa la fueran a alquilar a otra persona, ¿cuánto sería el alquiler mensual? REGISTRA CANTIDAD |_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_5a_p "3.5a más de $1 200 al mes?"

label variable h_3_5a_d "3.5a más de $15 000 pesos al mes?"

label variable h_3_5a_c "3.5a más de 35 000 CUP"

label variable h_3_5b_p "3.5b más de $400 al mes?"

label variable h_3_5b_d "3.5b más de $5 000 pesos al mes?"

label variable h_3_5b_c "3.5b más de 12 500 CUP?"

label variable h_3_5c_p "3.5c más de $3 600?"

label variable h_3_5c_d "3.5c más de $50 000 pesos?"

label variable h_3_5c_c "3.5c más de 110,000 CUP"

label variable h_3_6_p "3.6 ¿Cuánto se paga de alquiler al mes? REGISTRA CANTIDAD |_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_6_d "3.6 ¿Cuánto se paga de alquiler al mes? REGISTRA CANTIDAD |_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_6_c "3.6 ¿Cuánto se paga de alquiler al mes? REGISTRA CANTIDAD |_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_7a_p "3.7a más de $1 200 al mes?"

label variable h_3_7a_d "3.7a más de $15 000 pesos al mes?"

label variable h_3_7a_c "3.7a más de 35 000 CUP?"

label variable h_3_7b_p "3.7b más de $400 al mes?"

label variable h_3_7b_d "3.7b más de $5 000 pesos al mes?"

label variable h_3_7b_c "3.7b más de 12 500 CUP?"

label variable h_3_7c_p "3.7c más de $3 600 pesos al mes?"

label variable h_3_7c_d "3.7c más de $50 000 pesos al mes?"

label variable h_3_7c_c "3.7c más de 110 000 CUP?"

label variable h_3_8 "3.8 ¿De qué material es la mayor parte de los techos de esta vivienda?"

label variable h_3_9 "3.9 ¿Cuantos dormitorios tiene?"

label variable n10enestaviviendatienen "3.10 ¿En esta vivienda tienen"

rename n10enestaviviendatienen h_3_10

label variable h_3_11 "3.11 ¿El servicio sanitario que ustedes usan..."

label variable h_3_12 "3.12 ¿Este servicio lo usan solamente las personas de esta vivienda?"

label variable h_3_13 "3.13 ¿El combustible que más usan para cocinar es..."

label variable h_3_14_1 "3.14.1 televisión"

label variable h_3_14_2 "3.14.2 nevera y/o congelador"

label variable h_3_14_3 "3.14.3 electricidad"

label variable h_3_14_4 "3.14.4 Teléfono residencial/fijo"

label variable h_3_14_5 "3.14.5 Algún miembro del hogar tiene celular?"

label variable h_3_14_6 "3.14.6 bañera de plomería"

label variable h_3_14_7 "3.14.7 radio"

label variable h_3_14_8 "3.14.8 máquina de coser"

label variable h_3_14_9 "3.14.9 computadora"

label variable h_3_14_10 "3.14.10 internet"

label variable h_3_14_11 "3.14.11 aire acondicionado"

label variable h_3_14_12 "3.14.12 abanico eléctrico"

label variable h_3_15 "3.15 ¿Cuantos vehículos de motor (carros, camionetas, camiones, etc.) poseen los miembros de la familia?"

label variable h_3_16_p "3.16 Si vendiera hoy todos estos vehículos ¿como cuánto le darían? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_16_d "3.16 Si vendiera hoy todos estos vehículos ¿como cuánto le darían? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_16_c "3.16 Si vendiera hoy todos estos vehículos ¿como cuánto le darían? |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_17a_p "3.17a más de $36 000?"

label variable h_3_17a_d "3.17a más de $500 000 pesos?"

label variable h_3_17a_c "3.17a más de 1 110 000 CUP?"

label variable h_3_17b_p "3.17b más de $18 500?"

label variable h_3_17b_d "3.17b más de $250 000 pesos?"

label variable h_3_17b_c "3.17b más de 550 000 CUP?"

label variable h_3_17c_p "3.17c más de $100 000?"

label variable h_3_17c_d "3.17c más de $1 400 000 pesos?"

label variable h_3_17c_c "3.17b más de 5 500 000 CUP"

label variable h_3_18 "3.18 Usted (o su cónyuge u otro adulto mayor de esta casa) es propietario de alguna otra casa o condominio, o alguna propiedad de bienes raíces como tierras y/o lotes?"

label variable h_3_19_p "3.19 Si los vendiera hoy y pagara lo que debe sobre estas propiedades, ¿cuánto le darían? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_19_d "3.19 Si los vendiera hoy y pagara lo que debe sobre estas propiedades, ¿cuánto le darían? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_19_c "3.19 Si los vendiera hoy y pagara lo que debe sobre estas propiedades, ¿cuánto le darían? |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_20a_p "3.20a más de $36 000?"

label variable h_3_20a_d "3.20a más de $500 000 pesos?"

label variable h_3_20a_c "3.20a más de 1 110 000 CUP"

label variable h_3_20b_p "3.20b más de $18 500?"

label variable h_3_20b_d "3.20b más de $250 000 pesos?"

label variable h_3_20b_c "3.20b más de 550 000 CUP"

label variable h_3_20c_p "3.20c más de $180 000?"

label variable h_3_20c_d "3.20c más de $2 500 000 pesos?"

label variable h_3_20c_c "3.20c más de 5 500 000 CUP"

label variable h_3_21 "3.21 ¿Es propietario usted (y/o su cónyuge u otro adulto mayor de esta casa) de algún negocio, tierra de cultivo o cría de animales?"

label variable h_3_22_p "3.22 Si lo vendiera ahora (y pagara lo que debe), ¿cuánto le darían? [Incluya el valor del equipo del negocio, animales, etc., pero excluya el valor de la propiedad ya estimado anteriormente] |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_22_d "3.22 Si lo vendiera ahora (y pagara lo que debe), ¿cuánto le darían? [Incluya el valor del equipo del negocio, animales, etc., pero excluya el valor de la propiedad ya estimado anteriormente] |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_22_c "3.22 Si lo vendiera ahora (y pagara lo que debe), ¿cuánto le darían? [Incluya el valor del equipo del negocio, animales, etc., pero excluya el valor de la propiedad ya estimado anteriormente] |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_23a_p "3.23a más de $30 000?"

label variable h_3_23a_d "3.23a más de $400 000 pesos?"

label variable h_3_23a_c "3.23a más de 150 000 CUP?"

label variable h_3_23b_p "3.23b más de $10 000?"

label variable h_3_23b_d "3.23b más de $140 000 pesos?"

label variable h_3_23b_c "3.23b más de 75 000 CUP?"

label variable h_3_23c_p "3.23c más de $100 000?"

label variable h_3_23c_d "3.23c más de $1 400 000 pesos?"

label variable h_3_23c_c "3.23c más de 550 000 CUP?"

label variable h_3_24 "3.24 Usted (y/o su cónyuge u otro adulto mayor de esta casa) tiene(n) cuentas de cheques, ahorro, inversiones a plazo fijo, préstamos hechos a terceros, acciones, bonos, etc.?"

label variable h_3_25_p "3.25 Sumando todas las cuentas ¿como cuánto es el valor de estas(os)…? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_25_d "3.25 Sumando todas las cuentas ¿como cuánto es el valor de estas(os)…? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_25_c "3.25 Sumando todas las cuentas ¿como cuánto es el valor de estas(os)…? |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_26a_p "3.26a más de $5 000?"

label variable h_3_26a_d "3.26a más de $70 000 pesos?"

label variable h_3_26a_c "3.26a más de 150 000 CUP?"

label variable h_3_26b_p "3.26b más de $2 500?"

label variable h_3_26b_d "3.26b más de $32 000 pesos?"

label variable h_3_26b_c "3.26b más de 75 000 CUP?"

label variable h_3_26c_p "3.26c más de $18 000?"

label variable h_3_26c_d "3.26c más de $240 000 pesos?"

label variable h_3_26c_c "3.26c más de 550 000 CUP?"

label variable h_3_27_p "3.27 En caso de una urgencia familiar por la que tuviera que vender todos los demás bienes que no me ha mencionado, ¿cuánto le darían? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_27_d "3.27 En caso de una urgencia familiar por la que tuviera que vender todos los demás bienes que no me ha mencionado, ¿cuánto le darían? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_27_c "3.27 En caso de una urgencia familiar por la que tuviera que vender todos los demás bienes que no me ha mencionado, ¿cuánto le darían? REGISTRA CANTIDAD |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_28a_p "3.28a más de $36 000?"

label variable h_3_28a_d "3.28a más de $500 000 pesos?"

label variable h_3_28a_c "3.28a más de 1 110 000 CUP?"

label variable h_3_28b_p "3.28b más de $18 500?"

label variable h_3_28b_d "3.28b más de $250 000 pesos?"

label variable h_3_28b_c "3.28b más de 550 000 CUP?"

label variable h_3_28c_p "3.28c más de $100 000?"

label variable h_3_28c_d "3.28c más de $ 1400 000 pesos?"

label variable h_3_28c_c "3.28c más de 3 000 000 CUP?"

label variable h_3_29 "3.29¿Usted (y/o su cónyuge u otro adulto mayor de esta casa) tiene deudas sobre las que no hemos preguntado, como en tarjetas de crédito, deudas médicas, préstamos sobre seguros de vida, préstamos de parientes, y demás?"

label variable h_3_30_p "3.30 Tomando todas estas juntas, ¿como cuánto debe? |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_30_d "3.30 Tomando todas estas juntas, ¿como cuánto debe? |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_30_c "3.30 Tomando todas estas juntas, ¿como cuánto debe? |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_31a_p "3.31a más de $5 000?"

label variable h_3_31a_d "3.31a más de $70 000 pesos?"

label variable h_3_31a_c "3.31a más de 150 000 CUP?"

label variable h_3_31b_p "3.31b más de $2 500?"

label variable h_3_31b_d "3.31b más de $32 000 pesos?"

label variable h_3_31b_c "3.31b más de 75 000 CUP?"

label variable h_3_31c_p "3.31c más de $18 000?"

label variable h_3_31c_d "3.31c más de $ 240 000 pesos?"

label variable h_3_31c_c "3.31c más de 550 000 CUP?"

label variable h_3_32_p "3.32 En total, ¿como cuánto gastan al mes para el hogar? Excluya lo que se produce en el hogar para autoconsumo. |_|_|_|_|_|_| $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_32_d "3.32 En total, ¿como cuánto gastan al mes para el hogar? Excluya lo que se produce en el hogar para autoconsumo. |_|_|_|_|_|_| pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_32_c "3.32 En total, ¿como cuánto gastan al mes para el hogar? Excluya lo que se produce en el hogar para autoconsumo. |_|_|_|_|_|_| CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_3_33a_p "3.33a más de $1 600?"

label variable h_3_33a_d "3.33a más de $20 000 pesos?"

label variable h_3_33a_c "3.33a más de 47 500 CUP?"

label variable h_3_33b_p "3.33b más de $800?"

label variable h_3_33b_d "3.33b más de $11 000 pesos?"

label variable h_3_33b_c "3.33b más de 25 000 CUP?"

label variable h_3_33c_p "3.33c más de $2 400?"

label variable h_3_33c_d "3.33c más de $ 32 000 pesos?"

label variable h_3_33c_c "3.33c más de 75 000 CUP?"

label variable h_3_34 "3.34 ¿Usted o alguna otra persona en el hogar hace ropa, cría animales, o cosecha alimentos para ser consumidos en el hogar?"

label variable h_4 "4. Anote el Código para el Participante cuyos ingresos está preguntando en esta sección:"

label variable h_4_1 "4.1 ¿Recibe alguna entrada por trabajo pagado?"

label variable h_4_1a "4.1.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_1b_p "4.1.B más de $1 600?"

label variable h_4_1b_d "4.1.B más de $20 000 pesos?"

label variable h_4_1b_c "4.1.B más de 47 500 CUP?"

label variable h_4_1b2_p "4.1.B.2 más de $400 al mes?"

label variable h_4_1b2_d "4.1.B.2 más de $5 000 pesos?"

label variable h_4_1b2_c "4.1.B.2 más de 12 500 CUP?"

label variable h_4_1b3_p "4.1.B.3 más de $3 000?"

label variable h_4_1b3_d "4.1.B.3 más de $40 000 pesos?"

label variable h_4_1b3_c "4.1.B.3 más de 90 000 CUP?"

label variable h_4_2 "4.2 ¿Recibe alguna pensión gubernamental?"

label variable h_4_2a "4.2.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_2b_p "4.2.B más de $400?"

label variable h_4_2b_d "4.2.B más de $5 000 pesos?"

label variable h_4_2b_c "4.2.B más de 12 000 CUP?"

label variable h_4_2b2_p "4.2.B.2 más de $200?"

label variable h_4_2b2_d "4.2.B.2 más de $2 500 pesos?"

label variable h_4_2b2_c "4.2.B.2 más de 6 250 CUP?"

label variable h_4_2b3_p "4.2.B.3 más de $1400?"

label variable h_4_2b3_d "4.2.B.3 más de $20 000 pesos?"

label variable h_4_2b3_c "4.2.B.3 más de 42 500 CUP?"

label variable h_4_3 "4.3 ¿Recibe alguna pensión ocupacional?"

label variable h_4_3a "4.3.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_3b_p "4.3.B más de $400?"

label variable h_4_3b_d "4.3.B más de $5 000 pesos?"

label variable h_4_3b_c "4.3.B más de 12 000 CUP?"

label variable h_4_3b2_p "4.3.B.2 más de $200?"

label variable h_4_3b2_d "4.3.B.2 más de $2 500 pesos?"

label variable h_4_3b2_c "4.3.B.2 más de 6 250 CUP?"

label variable h_4_3b3_p "4.3.B.3 más de $1400?"

label variable h_4_3b3_d "4.3.B.3 más de $20 000 pesos?"

label variable h_4_3b3_c "4.3.B.3 más de 42 500 CUP?"

label variable h_4_4 "4.4 ¿Recibe alguna pensión o beneficio por discapacidad?"

label variable h_4_4a "4.4.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_4b_p "4.4B más de $400?"

label variable h_4_4b_d "4.4.B más de $5 000 pesos?"

label variable h_4_4b_c "4.4.B más de 12 000 CUP?"

label variable h_4_4b2_p "4.4.B.2 más de $200?"

label variable h_4_4b2_d "4.4.B.2 más de $2 500 pesos?"

label variable h_4_4b2_c "4.4.B.2 más de 6 250 CUP?"

label variable h_4_4b3_p "4.4.B.3 más de $1400?"

label variable h_4_4b3_d "4.4.B.3 más de $20 000 pesos?"

label variable h_4_4b3_c "4.4.B.3 más de 42 500 CUP?"

label variable h_4_5 "4.5 ¿Recibe alguna entrada por tierra o propiedad alquilada ?"

label variable h_4_5a "4.5.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_5b_p "4.5.B más de $1 200?"

label variable h_4_5b_d "4.5.B más de $15 000 pesos?"

label variable h_4_5b_c "4.5.B más de 35 000 CUP?"

label variable h_4_5b2_p "4.5.B.2 más de $400?"

label variable h_4_5b2_d "4.5.B.2 más de $5 000 pesos?"

label variable h_4_5b2_c "4.5.B.2 más de 12 500 CUP?"

label variable h_4_5b3_p "4.5.B.3 más de $3 600?"

label variable h_4_5b3_d "4.5.B.3 más de $50 000 pesos?"

label variable h_4_5b3_c "4.5.B.3 más de 110 000 CUP?"

label variable h_4_6 "4.6 ¿Recibe alguna Ganancia por otro negocio (ingresos menos gastos)?"

label variable h_4_6a "4.6.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_6b_p "4.6.B más de $4 000?"

label variable h_4_6b_d "4.6.B más de $50 000 pesos?"

label variable h_4_6b_c "4.6.B más de 120 000 CUP?"

label variable h_4_6b2_p "4.6.B.2 más de $1 600?"

label variable h_4_6b2_d "4.6.B.2 más de $20 000 pesos?"

label variable h_4_6b2_c "4.6.B.2 más de 47 500 CUP?"

label variable h_4_6b3_p "4.6.B.3 más de $12 000?"

label variable h_4_6b3_d "4.6.B.3 más de $150 000 pesos?"

label variable h_4_6b3_c "4.6.B.3 más de 350 000 CUP?"

label variable h_4_7 "4.7 ¿Recibe dinero regularmente de sus nietos o hijos?"

label variable h_4_7a "4.7.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_7b_p "4.7.B más de $50?"

label variable h_4_7b_d "4.7.B más de $700 pesos?"

label variable h_4_7b_c "4.7.B más de 1 250 CUP?"

label variable h_4_7b2_p "4.7.B.2 más de $100?"

label variable h_4_7b2_d "4.7.B.2 más de $1 500 pesos?"

label variable h_4_7b2_c "4.7.B.2 más de 2 500 CUP?"

label variable h_4_8 "4.8 ¿Recibe otra entrada regular?"

label variable h_4_8a "4.8.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_4_8b_p "4.8.B más de $50?"

label variable h_4_8b_d "4.8.B más de $700 pesos?"

label variable h_4_8b_c "4.8.B más de 1 250 CUP?"

label variable h_4_8b2_p "4.8.B.2 más de $100?"

label variable h_4_8b2_d "4..B.2 más de $1 500 pesos?"

label variable h_4_8b2_c "4.8.B.2 más de 2 500 CUP?"

label variable h_5 "5¿El participante tiene un cónyuge/pareja co-residente, o hay otros Participantes en el hogar?"

label variable h_5_1 "5.1 ¿Recibe alguna entrada por trabajo pagado?"

label variable h_5_1a "5.1.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_1b_p "5.1.B más de $1 600?"

label variable h_5_1b_d "5.1.B más de $20 000 pesos?"

label variable h_5_1b_c "5.1.B más de 47 500 CUP?"

label variable h_5_1b2_p "5.1.B.2 más de $400 al mes?"

label variable h_5_1b2_d "5.1.B.2 más de $5 000 pesos?"

label variable h_5_1b2_c "5.1.B.2 más de 12 500 CUP?"

label variable h_5_1b3_p "5.1.B.3 más de $3 000?"

label variable h_5_1b3_d "5.1.B.3 más de $40 000 pesos?"

label variable h_5_1b3_c "5.1.B.3 más de 90 000 CUP?"

label variable h_5_2 "5.2 ¿Recibe alguna pensión gubernamental?"

label variable h_5_2a "5.2.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_2b_p "5.2.B más de $400?"

label variable h_5_2b_d "5.2.B más de $5 000 pesos?"

label variable h_5_2b_c "5.2.B más de 12 000 CUP?"

label variable h_5_2b2_p "5.2.B.2 más de $200?"

label variable h_5_2b2_d "5.2.B.2 más de $2 500 pesos?"

label variable h_5_2b2_c "5.2.B.2 más de 6 250 CUP?"

label variable h_5_2b3_p "5.2.B.3 más de $1400?"

label variable h_5_2b3_d "5.2.B.3 más de $20 000 pesos?"

label variable h_5_2b3_c "5.2.B.3 más de 42 500 CUP?"

label variable h_5_3 "5.3 ¿Recibe alguna pensión ocupacional?"

label variable h_5_3a "5.3.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_3b_p "5.3.B más de $400?"

label variable h_5_3b_d "5.3.B más de $5 000 pesos?"

label variable h_5_3b_c "5.3.B más de 12 000 CUP?"

label variable h_5_3b2_p "5.3.B.2 más de $200?"

label variable h_5_3b2_d "5.3.B.2 más de $2 500 pesos?"

label variable h_5_3b2_c "5.3.B.2 más de 6 250 CUP?"

label variable h_5_3b3_p "5.3.B.3 más de $1400?"

label variable h_5_3b3_d "5.3.B.3 más de $20 000 pesos?"

label variable h_5_3b3_c "5.3.B.3 más de 42 500 CUP?"

label variable h_5_4 "5.4 ¿Recibe alguna pensión o beneficio por discapacidad?"

label variable h_5_4a "5.4.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_4b_p "5.4B más de $400?"

label variable h_5_4b_d "5.4.B más de $5 000 pesos?"

label variable h_5_4b_c "5.4.B más de 12 000 CUP?"

label variable h_5_4b2_p "5.4.B.2 más de $200?"

label variable h_5_4b2_d "5.4.B.2 más de $2 500 pesos?"

label variable h_5_4b2_c "5.4.B.2 más de 6 250 CUP?"

label variable h_5_4b3_p "5.4.B.3 más de $1400?"

label variable h_5_4b3_d "5.4.B.3 más de $20 000 pesos?"

label variable h_5_4b3_c "5.4.B.3 más de 42 500 CUP?"

label variable h_5_5 "5.5 ¿Recibe alguna entrada por tierra o propiedad alquilada?"

label variable h_5_5a "5.5.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_5b_p "5.5.B más de $1 200?"

label variable h_5_5b_d "5.5.B más de $15 000 pesos?"

label variable h_5_5b_c "5.5.B más de 35 000 CUP?"

label variable h_5_5b2_p "5.5.B.2 más de $400?"

label variable h_5_5b2_d "5.5.B.2 más de $5 000 pesos?"

label variable h_5_5b2_c "5.5.B.2 más de 12 500 CUP?"

label variable h_5_5b3_p "5.5.B.3 más de $3 600?"

label variable h_5_5b3_d "5.5.B.3 más de $50 000 pesos?"

label variable h_5_5b3_c "5.5.B.3 más de 110 000 CUP?"

label variable h_5_6 "5.6 ¿Recibe alguna Ganancia por otro negocio (ingresos menos gastos)?"

label variable h_5_6a "5.6.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_6b_p "5.6.B más de $4 000?"

label variable h_5_6b_d "5.6.B más de $50 000 pesos?"

label variable h_5_6b_c "5.6.B más de 120 000 CUP?"

label variable h_5_6b2_p "5.6.B.2 más de $1 600?"

label variable h_5_6b2_d "5.6.B.2 más de $20 000 pesos?"

label variable h_5_6b2_c "5.6.B.2 más de 47 500 CUP?"

label variable h_5_6b3_p "5.6.B.3 más de $12 000?"

label variable h_5_6b3_d "5.6.B.3 más de $150 000 pesos?"

label variable h_5_6b3_c "5.6.B.3 más de 350 000 CUP?"

label variable h_5_7 "5.7 ¿Recibe dinero regularmente de sus nietos o hijos?"

label variable h_5_7a "5.7.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_7b_p "5.7.B más de $50?"

label variable h_5_7b_d "5.7.B más de $700 pesos?"

label variable h_5_7b_c "5.7.B más de 1 250 CUP?"

label variable h_5_7b2_p "5.7.B.2 más de $100?"

label variable h_5_7b2_d "5.7.B.2 más de $1 500 pesos?"

label variable h_5_7b2_c "5.7.B.2 más de 2 500 CUP?"

label variable h_5_8 "5.8 ¿Recibe otra entrada regular?"

label variable h_5_8a "5.8.A ¿Como cuánto recibe cada mes? NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_5_8b_p "5.8.B más de $50?"

label variable h_5_8b_d "5.8.B más de $700 pesos?"

label variable h_5_8b_c "5.8.B más de 1 250 CUP?"

label variable h_5_8b2_p "5.8.B.2 más de $100?"

label variable h_5_8b2_d "5.B.2 más de $1 500 pesos?"

label variable h_5_8b2_c "5.8.B.2 más de 2 500 CUP?"

label variable h_6_1 "6.1 En el último año, cualquier participante o su cónyuge ha recibido ayuda en dinero o en bienes de sus hijos y/o nietos que no viven en este hogar? (No incluye el ayuda mensual ya mencionado)?"

label variable h_6_1a_p "6.1a ¿Aproximadamente, cuánto fue esa ayuda en el último año? (No incluye el ayuda mensual ya mencionado) CANTIDAD $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_1a_d "6.1a ¿Aproximadamente, cuánto fue esa ayuda en el último año? (No incluye el ayuda mensual ya mencionado) CANTIDAD pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_1a_c "6.1a ¿Aproximadamente, cuánto fue esa ayuda en el último año? (No incluye el ayuda mensual ya mencionado) CANTIDAD CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_1b1_p "6.1b1 más de $250?"

label variable h_6_1b1_d "6.1b1 más de 15 000 pesos?"

label variable h_6_1b1_c "6.1b1 más de 35 000 CUP?"

label variable h_6_1b2_p "6.1b2 más de $500?"

label variable h_6_1b2_d "6.1b2 más de 30 000 pesos?"

label variable h_6_1b2_c "6.1b2 más de 70 000 CUP?"

label variable h_6_2 "6.2 La ayuda en dinero o en bienes que usted recibe de sus hijos/nuera/yerno/nietos (y los de su cónyuge). ¿Cree usted que es..."

label variable h_6_3 "6.3 La ayuda con quehaceres del hogar, cuidados, mandados y transporte que usted recibe de sus hijos/nuera/yerno/nietos (y los de su cónyuge), ¿cree usted que es..."

label variable h_6_41_d "6.4.1 ¿Recibe usted (y/o cónyuge u otro adulto mayor) la tarjeta de solidaridad (para comprar comida en supermercados)?"

label variable h_6_42_d "6.4.2 ¿Recibe usted (y/o cónyuge u otro adulto mayor) un bono llamado bono-gas?"

label variable h_6_43_d "6.4.3 ¿Recibe usted (y/o cónyuge u otro adulto mayor) un bono llamado bono-luz?"

label variable h_6_44_p "6.4.4 ¿Recibe usted (y/o cónyuge u otro adulto mayor) la Carta de Pan (para comprar comida)?"

label variable h_6_5 "6.5 En el último año, ¿usted (o su cónyuge u otro adulto mayor) ha dado ayuda en dinero o en bienes a sus hijos y/o nietos?"

label variable h_6_5a_p "6.5a ¿Aproximademente, cuánto fue esa ayuda en el último año? CANTIDAD $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_5a_d "6.5a ¿Aproximademente, cuánto fue esa ayuda en el último año? CANTIDAD pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_5a_c "6.5a ¿Aproximademente, cuánto fue esa ayuda en el último año? CANTIDAD CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_5b1_p "6.5b1 más de $500?"

label variable h_6_5b1_d "6.5b1 más de $7 000 pesos?"

label variable h_6_5b1_c "6.5b1 más de 15 000 CUP?"

label variable h_6_5b2_p "6.5b2 más de $1 000?"

label variable h_6_5b2_d "6.5b2 más de $15 000 pesos?"

label variable h_6_5b2_c "6.5b2 más de 30 000 CUP?"

label variable h_6_6 "6.6 Durante el último año, ¿usted (y/o su cónyuge u otro adulto mayor) dio apoyo económico a sus padres (y/o sus suegros) que no viven en esta hogar?"

label variable h_6_6a_p "6.6a ¿Aproximadamente, cuánto dinero fue ese apoyo en el último año? CANTIDAD $ NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_6a_d "6.6a ¿Aproximadamente, cuánto dinero fue ese apoyo en el último año? CANTIDAD pesos NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_6a_c "6.6a ¿Aproximadamente, cuánto dinero fue ese apoyo en el último año? CANTIDAD CUP NO RESPONDE............ 88 NO SABE ...................... 99"

label variable h_6_6b1_p "6.6b1 más de $500?"

label variable h_6_6b1_d "6.6b1 más de $7 000 pesos?"

label variable h_6_6b1_c "6.6b1 más de 15 000 CUP?"

label variable h_6_6b2_p "6.6b2 más de $1 000?"

label variable h_6_6b2_d "6.6b2 más de $15 000 pesos?"

label variable h_6_6b2_c "6.6b2 más de 30 000 CUP?"

label variable h_7_1_p_c "7.1 Esta vivienda es..."

label variable h_7_1_d "7.1 Esta vivienda es..."

label variable h_7_2_1 "7.2.1 sobre calle pavimentada?"

label variable h_7_2_2 "7.2.2 sobre una carretera?"

label variable h_7_2_3 "7.2.3 sobre un camino o vereda?"

label variable h_7_2_4 "7.2.4 a un lado de campos de cultivo?"

label variable h_7_2_5 "7.2.5 A menos de 500 metros (como tres cuadras) de una avenida grande, de más de dos carriles?"

label variable h_deviceid2 "Device ID:"

*missing values

*response on line 6 did invalid skip on 3_3a_c, but answered 3_3b_c so my code marked 3_3c_c as invalid (valid because 3_3b_c was answered, but i can change if we want to)
*response on line 8 should not have answered 3_3a_c, but they did so it also let them answer 3_3c_c (which also should have been skipped because of their answer to 3_2_c)

*all cuba invalid

if h_country == 2 {
replace h_3_1 = .i if (h_3_1 == . | h_3_1 == .a)

replace h_3_2_c = .i if (h_3_2_c == . | h_3_2_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_c = .i if (h_3_3a_c == . | h_3_3a_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i))

replace h_3_3b_c = .i if (h_3_3b_c == . | h_3_3b_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i) & (h_3_3a_c == 2 | h_3_3a_c == .i))

replace h_3_3c_c = .i if (h_3_3c_c == . | h_3_3c_c == .a) & (h_country == 2 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_c == 88 | h_3_2_c == 99 | h_3_2_c == .i) & (h_3_3a_c == 1 | h_3_3a_c == .i))

replace h_3_4_c = .i if (h_3_4_c == . | h_3_4_c == .a) & (h_country == 2 & h_3_1 ~= 2)

replace h_3_5a_c = .i if (h_3_5a_c == . | h_3_5a_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i))

replace h_3_5b_c = .i if (h_3_5b_c == . | h_3_5b_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i) & (h_3_5a_c == 2 | h_3_5a_c == .i))

replace h_3_5c_c = .i if (h_3_5c_c == . | h_3_5c_c == .a) & (h_country == 2 & (h_3_4_c == 88 | h_3_4_c == 99 | h_3_4_c == .i) & (h_3_5a_c == 1 | h_3_5a_c == .i))

replace h_3_6_c = .i if (h_3_6_c == . | h_3_6_c == .i) & (h_country == 2 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_c = .i if (h_3_7a_c == . | h_3_7a_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i))

replace h_3_7b_c = .i if (h_3_7b_c == . | h_3_7b_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i) & (h_3_7a_c == 2 | h_3_7a_c == .i))

replace h_3_7c_c = .i if (h_3_7c_c == . | h_3_7c_c == .a) & (h_country == 2 & (h_3_6_c == 88 | h_3_6_c == 99 | h_3_6_c == .i) & (h_3_7a_c == 1 | h_3_7a_c == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace h_3_13 = .i if (h_3_13 == . | h_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_c = .i if (h_3_16_c == . | h_3_16_c == .a) & (h_country == 2 & h_3_15 ~= 0)

replace h_3_17a_c = .i if (h_3_17a_c == . | h_3_17a_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i))

replace h_3_17b_c = .i if (h_3_17b_c == . | h_3_17b_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i) & (h_3_17a_c == 2 | h_3_17a_c == .i))

replace h_3_17c_c = .i if (h_3_17c_c == . | h_3_17c_c == .a) & (h_country == 2 & (h_3_16_c == 88 | h_3_16_c == 99 | h_3_16_c == .i) & (h_3_17a_c == 1 | h_3_17a_c == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 2

replace h_3_19_c = .i if (h_3_19_c == . | h_3_19_c == .a) & (h_country == 2 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_c = .i if (h_3_20a_c == . | h_3_20a_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i))

replace h_3_20b_c = .i if (h_3_20b_c == . | h_3_20b_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i) & (h_3_20a_c == 2 | h_3_20a_c == .i))

replace h_3_20c_c = .i if (h_3_20c_c == . | h_3_20c_c == .a) & (h_country == 2 & (h_3_19_c == 88 | h_3_19_c == 99 | h_3_19_c == .i) & (h_3_20a_c == 1 | h_3_20a_c == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_c = .i if (h_3_22_c == . | h_3_22_c == .a) & (h_country == 2 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_c = .i if (h_3_23a_c == . | h_3_23a_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i))

replace h_3_23b_c = .i if (h_3_23b_c == . | h_3_23b_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i) & (h_3_23a_c == 2 | h_3_23a_c == .i))

replace h_3_23c_c = .i if (h_3_23c_c == . | h_3_23c_c == .a) & (h_country == 2 & (h_3_22_c == 88 | h_3_22_c == 99 | h_3_22_c == .i) & (h_3_23a_c == 1 | h_3_23a_c == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_c = .i if (h_3_25_c == . | h_3_25_c == .a) & (h_country == 2 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_c = .i if (h_3_26a_c == . | h_3_26a_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i))

replace h_3_26b_c = .i if (h_3_26b_c == . | h_3_26b_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i) & (h_3_26a_c == 2 | h_3_26a_c == .i))

replace h_3_26c_c = .i if (h_3_26c_c == . | h_3_26c_c == .a) & (h_country == 2 & (h_3_25_c == 88 | h_3_25_c == 99 | h_3_25_c == .i) & (h_3_26a_c == 1 | h_3_26a_c == .i))

replace h_3_27_c = .i if (h_3_27_c == . | h_3_27_c == .a) & h_country == 2

replace h_3_28a_c = .i if (h_3_28a_c == . | h_3_28a_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i))

replace h_3_28b_c = .i if (h_3_28b_c == . | h_3_28b_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i) & (h_3_28a_c == 2 | h_3_28a_c == .i))

replace h_3_28c_c = .i if (h_3_28c_c == . | h_3_28c_c == .a) & (h_country == 2 & (h_3_27_c == 88 | h_3_27_c == 99 | h_3_27_c == .i) & (h_3_28a_c == 1 | h_3_28a_c == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_c = .i if (h_3_30_c == . | h_3_30_c == .a) & (h_country == 2 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_c = .i if (h_3_31a_c == . | h_3_31a_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i))

replace h_3_31b_c = .i if (h_3_31b_c == . | h_3_31b_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i) & (h_3_31a_c == 2 | h_3_31a_c == .i))

replace h_3_31c_c = .i if (h_3_31c_c == . | h_3_31c_c == .a) & (h_country == 2 & (h_3_30_c == 88 | h_3_30_c == 99 | h_3_30_c == .i) & (h_3_31a_c == 1 | h_3_31a_c == .i))

replace h_3_32_c = .i if (h_3_32_c == . | h_3_32_c == .a) & h_country == 2

replace h_3_33a_c = .i if (h_3_33a_c == . | h_3_33a_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i))

replace h_3_33b_c = .i if (h_3_33b_c == . | h_3_33b_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i) & (h_3_33a_c == 2 | h_3_33a_c == .i))

replace h_3_33c_c = .i if (h_3_33c_c == . | h_3_33c_c == .a) & (h_country == 2 & (h_3_32_c == 88 | h_3_32_c == 99 | h_3_32_c == .i) & (h_3_33a_c == 1 | h_3_33a_c == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4 = .i if (h_4 == . | h_4 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_c = .i if (h_4_1b_c == . | h_4_1b_c == .a) & (h_country == 2 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_c = .i if (h_4_1b2_c == . | h_4_1b2_c == .a) & (h_country == 2 & (h_4_1b_c == 2 | h_4_1b_c == .i))

replace h_4_1b3_c = .i if (h_4_1b3_c == . | h_4_1b3_c == .a) & (h_country == 2 & (h_4_1b_c == 1 | h_4_1b_c == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_c = .i if (h_4_2b_c == . | h_4_2b_c == .a) & (h_country == 2 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_c = .i if (h_4_2b2_c == . | h_4_2b2_c == .a) & (h_country == 2 & (h_4_2b_c == 2 | h_4_2b_c == .i))

replace h_4_2b3_c = .i if (h_4_2b3_c == . | h_4_2b3_c == .a) & (h_country == 2 & (h_4_2b_c == 1 | h_4_2b_c == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_c = .i if (h_4_3b_c == . | h_4_3b_c == .a) & (h_country == 2 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_c = .i if (h_4_3b2_c == . | h_4_3b2_c == .a) & (h_country == 2 & (h_4_3b_c == 2 | h_4_3b_c == .i))

replace h_4_3b3_c = .i if (h_4_3b3_c == . | h_4_3b3_c == .a) & (h_country == 2 & (h_4_3b_c == 1 | h_4_3b_c == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_c = .i if (h_4_4b_c == . | h_4_4b_c == .a) & (h_country == 2 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_c = .i if (h_4_4b2_c == . | h_4_4b2_c == .a) & (h_country == 2 & (h_4_4b_c == 2 | h_4_4b_c == .i))

replace h_4_4b3_c = .i if (h_4_4b3_c == . | h_4_4b3_c == .a) & (h_country == 2 & (h_4_4b_c == 1 | h_4_4b_c == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_c = .i if (h_4_5b_c == . | h_4_5b_c == .a) & (h_country == 2 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_c = .i if (h_4_5b2_c == . | h_4_5b2_c == .a) & (h_country == 2 & (h_4_5b_c == 2 | h_4_5b_c == .i))

replace h_4_5b3_c = .i if (h_4_5b3_c == . | h_4_5b3_c == .a) & (h_country == 2 & (h_4_5b_c == 1 | h_4_5b_c == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_c = .i if (h_4_6b_c == . | h_4_6b_c == .a) & (h_country == 2 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_c = .i if (h_4_6b2_c == . | h_4_6b2_c == .a) & (h_country == 2 & (h_4_6b_c == 2 | h_4_6b_c == .i))

replace h_4_6b3_c = .i if (h_4_6b3_c == . | h_4_6b3_c == .a) & (h_country == 2 & (h_4_6b_c == 1 | h_4_6b_c == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_c = .i if (h_4_7b_c == . | h_4_7b_c == .a) & (h_country == 2 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_c = .i if (h_4_7b2_c == . | h_4_7b2_c == .a) & (h_country == 2 & (h_4_7b_c == 2 | h_4_7b_c == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_c = .i if (h_4_8b_c == . | h_4_8b_c == .a) & (h_country == 2 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_c = .i if (h_4_8b2_c == . | h_4_8b2_c == .a) & (h_country == 2 & (h_4_8b_c == 2 | h_4_8b_c == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_c = .i if (h_5_1b_c == . | h_5_1b_c == .a) & (h_country == 2 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_c = .i if (h_5_1b2_c == . | h_5_1b2_c == .a) & (h_country == 2 & (h_5_1b_c == 2 | h_5_1b_c == .i) & h_5 ~= 1)

replace h_5_1b3_c = .i if (h_5_1b3_c == . | h_5_1b3_c == .a) & (h_country == 2 & (h_5_1b_c == 1 | h_5_1b_c == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_c = .i if (h_5_2b_c == . | h_5_2b_c == .a) & (h_country == 2 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_c = .i if (h_5_2b2_c == . | h_5_2b2_c == .a) & (h_country == 2 & (h_5_2b_c == 2 | h_5_2b_c == .i) & h_5 ~= 1)

replace h_5_2b3_c = .i if (h_5_2b3_c == . | h_5_2b3_c == .a) & (h_country == 2 & (h_5_2b_c == 1 | h_5_2b_c == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_c = .i if (h_5_3b_c == . | h_5_3b_c == .a) & (h_country == 2 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_c = .i if (h_5_3b2_c == . | h_5_3b2_c == .a) & (h_country == 2 & (h_5_3b_c == 2 | h_5_3b_c == .i) & h_5 ~= 1)

replace h_5_3b3_c = .i if (h_5_3b3_c == . | h_5_3b3_c == .a) & (h_country == 2 & (h_5_3b_c == 1 | h_5_3b_c == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_c = .i if (h_5_4b_c == . | h_5_4b_c == .a) & (h_country == 2 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_c = .i if (h_5_4b2_c == . | h_5_4b2_c == .a) & (h_country == 2 & (h_5_4b_c == 2 | h_5_4b_c == .i) & h_5 ~= 1)

replace h_5_4b3_c = .i if (h_5_4b3_c == . | h_5_4b3_c == .a) & (h_country == 2 & (h_5_4b_c == 1 | h_5_4b_c == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_c = .i if (h_5_5b_c == . | h_5_5b_c == .a) & (h_country == 2 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_c = .i if (h_5_5b2_c == . | h_5_5b2_c == .a) & (h_country == 2 & (h_5_5b_c == 2 | h_5_5b_c == .i) & h_5 ~= 1)

replace h_5_5b3_c = .i if (h_5_5b3_c == . | h_5_5b3_c == .a) & (h_country == 2 & (h_5_5b_c == 1 | h_5_5b_c == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_c = .i if (h_5_6b_c == . | h_5_6b_c == .a) & (h_country == 2 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_c = .i if (h_5_6b2_c == . | h_5_6b2_c == .a) & (h_country == 2 & (h_5_6b_c == 2 | h_5_6b_c == .i) & h_5 ~= 1)

replace h_5_6b3_c = .i if (h_5_6b3_c == . | h_5_6b3_c == .a) & (h_country == 2 & (h_5_6b_c == 1 | h_5_6b_c == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_c = .i if (h_5_7b_c == . | h_5_7b_c == .a) & (h_country == 2 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_c = .i if (h_5_7b2_c == . | h_5_7b2_c == .a) & (h_country == 2 & (h_5_7b_c == 2 | h_5_7b_c == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_c = .i if (h_5_8b_c == . | h_5_8b_c == .a) & (h_country == 2 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_c = .i if (h_5_8b2_c == . | h_5_8b2_c == .a) & (h_country == 2 & (h_5_8b_c == 2 | h_5_8b_c == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_c = .i if (h_6_1a_c == . | h_6_1a_c == .a) & (h_country == 2 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_c = .i if (h_6_1b1_c == . | h_6_1b1_c == .a) & (h_country == 2 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1a_c == 88 | h_6_1a_c == 99 | h_6_1a_c == .i))

replace h_6_1b2_c = .i if (h_6_1b2_c == . | h_6_1b2_c == .a) & (h_country == 2 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1b1_c == 1 | h_6_1b1_c == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_c = .i if (h_6_5a_c == . | h_6_5a_c == .a) & (h_country == 2 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_c = .i if (h_6_5b1_c == . | h_6_5b1_c == .a) & (h_country == 2 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5a_c == 88 | h_6_5a_c == 99 | h_6_5a_c == .i))

replace h_6_5b2_c = .i if (h_6_5b2_c == . | h_6_5b2_c == .a) & (h_country == 2 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5b1_c == 1 | h_6_5b1_c == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_c = .i if (h_6_6a_c == . | h_6_6a_c == .a) & (h_country == 2 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_c = .i if (h_6_6b1_c == . | h_6_6b1_c == .a) & (h_country == 2 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6a_c == 88 | h_6_6a_c == 99 | h_6_6a_c == .i))

replace h_6_6b2_c = .i if (h_6_6b2_c == . | h_6_6b2_c == .a) & (h_country == 2 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6b1_c == 1 | h_6_6b1_c == .i))

replace h_7_1_p_c = .i if (h_7_1_p_c == . | h_7_1_p_c == .a) & (h_country == 0 | h_country == 2)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)
}



*all puerto rico invalid

if h_country == 0 {
replace h_3_2_p = .i if (h_3_2_p == . | h_3_2_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_p = .i if (h_3_3a_p == . | h_3_3a_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i))

replace h_3_3b_p = .i if (h_3_3b_p == . | h_3_3b_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i) & (h_3_3a_p == 2 | h_3_3a_p == .i))

replace h_3_3c_p = .i if (h_3_3c_p == . | h_3_3c_p == .a) & (h_country == 0 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_p == 88 | h_3_2_p == 99 | h_3_2_p == .i) & (h_3_3a_p == 1 | h_3_3a_p == .i))

replace h_3_4_p = .i if (h_3_4_p == . | h_3_4_p == .a) & (h_country == 0 & h_3_1 ~= 2)

replace h_3_5a_p = .i if (h_3_5a_p == . | h_3_5a_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i))

replace h_3_5b_p = .i if (h_3_5b_p == . | h_3_5b_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i) & (h_3_5a_p == 2 | h_3_5a_p == .i))

replace h_3_5c_p = .i if (h_3_5c_p == . | h_3_5c_p == .a) & (h_country == 0 & (h_3_4_p == 88 | h_3_4_p == 99 | h_3_4_p == .i) & (h_3_5a_p == 1 | h_3_5a_p == .i))

replace h_3_6_p = .i if (h_3_6_p == . | h_3_6_p == .i) & (h_country == 0 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_p = .i if (h_3_7a_p == . | h_3_7a_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i))

replace h_3_7b_p = .i if (h_3_7b_p == . | h_3_7b_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i) & (h_3_7a_p == 2 | h_3_7a_p == .i))

replace h_3_7c_p = .i if (h_3_7c_p == . | h_3_7c_p == .a) & (h_country == 0 & (h_3_6_p == 88 | h_3_6_p == 99 | h_3_6_p == .i) & (h_3_7a_p == 1 | h_3_7a_p == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace h_3_13 = .i if (h_3_13 == . | h_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_p = .i if (h_3_16_p == . | h_3_16_p == .a) & (h_country == 0 & h_3_15 ~= 0)

replace h_3_17a_p = .i if (h_3_17a_p == . | h_3_17a_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i))

replace h_3_17b_p = .i if (h_3_17b_p == . | h_3_17b_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i) & (h_3_17a_p == 2 | h_3_17a_p == .i))

replace h_3_17c_p = .i if (h_3_17c_p == . | h_3_17c_p == .a) & (h_country == 0 & (h_3_16_p == 88 | h_3_16_p == 99 | h_3_16_p == .i) & (h_3_17a_p == 1 | h_3_17a_p == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 0

replace h_3_19_p = .i if (h_3_19_p == . | h_3_19_p == .a) & (h_country == 0 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_p = .i if (h_3_20a_p == . | h_3_20a_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i))

replace h_3_20b_p = .i if (h_3_20b_p == . | h_3_20b_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i) & (h_3_20a_p == 2 | h_3_20a_p == .i))

replace h_3_20c_p = .i if (h_3_20c_p == . | h_3_20c_p == .a) & (h_country == 0 & (h_3_19_p == 88 | h_3_19_p == 99 | h_3_19_p == .i) & (h_3_20a_p == 1 | h_3_20a_p == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_p = .i if (h_3_22_p == . | h_3_22_p == .a) & (h_country == 0 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_p = .i if (h_3_23a_p == . | h_3_23a_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i))

replace h_3_23b_p = .i if (h_3_23b_p == . | h_3_23b_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i) & (h_3_23a_p == 2 | h_3_23a_p == .i))

replace h_3_23c_p = .i if (h_3_23c_p == . | h_3_23c_p == .a) & (h_country == 0 & (h_3_22_p == 88 | h_3_22_p == 99 | h_3_22_p == .i) & (h_3_23a_p == 1 | h_3_23a_p == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_p = .i if (h_3_25_p == . | h_3_25_p == .a) & (h_country == 0 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_p = .i if (h_3_26a_p == . | h_3_26a_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i))

replace h_3_26b_p = .i if (h_3_26b_p == . | h_3_26b_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i) & (h_3_26a_p == 2 | h_3_26a_p == .i))

replace h_3_26c_p = .i if (h_3_26c_p == . | h_3_26c_p == .a) & (h_country == 0 & (h_3_25_p == 88 | h_3_25_p == 99 | h_3_25_p == .i) & (h_3_26a_p == 1 | h_3_26a_p == .i))

replace h_3_27_p = .i if (h_3_27_p == . | h_3_27_p == .a) & h_country == 0

replace h_3_28a_p = .i if (h_3_28a_p == . | h_3_28a_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i))

replace h_3_28b_p = .i if (h_3_28b_p == . | h_3_28b_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i) & (h_3_28a_p == 2 | h_3_28a_p == .i))

replace h_3_28c_p = .i if (h_3_28c_p == . | h_3_28c_p == .a) & (h_country == 0 & (h_3_27_p == 88 | h_3_27_p == 99 | h_3_27_p == .i) & (h_3_28a_p == 1 | h_3_28a_p == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_p = .i if (h_3_30_p == . | h_3_30_p == .a) & (h_country == 0 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_p = .i if (h_3_31a_p == . | h_3_31a_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i))

replace h_3_31b_p = .i if (h_3_31b_p == . | h_3_31b_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i) & (h_3_31a_p == 2 | h_3_31a_p == .i))

replace h_3_31c_p = .i if (h_3_31c_p == . | h_3_31c_p == .a) & (h_country == 0 & (h_3_30_p == 88 | h_3_30_p == 99 | h_3_30_p == .i) & (h_3_31a_p == 1 | h_3_31a_p == .i))

replace h_3_32_p = .i if (h_3_32_p == . | h_3_32_p == .a) & h_country == 0

replace h_3_33a_p = .i if (h_3_33a_p == . | h_3_33a_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i))

replace h_3_33b_p = .i if (h_3_33b_p == . | h_3_33b_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i) & (h_3_33a_p == 2 | h_3_33a_p == .i))

replace h_3_33c_p = .i if (h_3_33c_p == . | h_3_33c_p == .a) & (h_country == 0 & (h_3_32_p == 88 | h_3_32_p == 99 | h_3_32_p == .i) & (h_3_33a_p == 1 | h_3_33a_p == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_p = .i if (h_4_1b_p == . | h_4_1b_p == .a) & (h_country == 0 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_p = .i if (h_4_1b2_p == . | h_4_1b2_p == .a) & (h_country == 0 & (h_4_1b_p == 2 | h_4_1b_p == .i))

replace h_4_1b3_p = .i if (h_4_1b3_p == . | h_4_1b3_p == .a) & (h_country == 0 & (h_4_1b_p == 1 | h_4_1b_p == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_p = .i if (h_4_2b_p == . | h_4_2b_p == .a) & (h_country == 0 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_p = .i if (h_4_2b2_p == . | h_4_2b2_p == .a) & (h_country == 0 & (h_4_2b_p == 2 | h_4_2b_p == .i))

replace h_4_2b3_p = .i if (h_4_2b3_p == . | h_4_2b3_p == .a) & (h_country == 0 & (h_4_2b_p == 1 | h_4_2b_p == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_p = .i if (h_4_3b_p == . | h_4_3b_p == .a) & (h_country == 0 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_p = .i if (h_4_3b2_p == . | h_4_3b2_p == .a) & (h_country == 0 & (h_4_3b_p == 2 | h_4_3b_p == .i))

replace h_4_3b3_p = .i if (h_4_3b3_p == . | h_4_3b3_p == .a) & (h_country == 0 & (h_4_3b_p == 1 | h_4_3b_p == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_p = .i if (h_4_4b_p == . | h_4_4b_p == .a) & (h_country == 0 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_p = .i if (h_4_4b2_p == . | h_4_4b2_p == .a) & (h_country == 0 & (h_4_4b_p == 2 | h_4_4b_p == .i))

replace h_4_4b3_p = .i if (h_4_4b3_p == . | h_4_4b3_p == .a) & (h_country == 0 & (h_4_4b_p == 1 | h_4_4b_p == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_p = .i if (h_4_5b_p == . | h_4_5b_p == .a) & (h_country == 0 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_p = .i if (h_4_5b2_p == . | h_4_5b2_p == .a) & (h_country == 0 & (h_4_5b_p == 2 | h_4_5b_p == .i))

replace h_4_5b3_p = .i if (h_4_5b3_p == . | h_4_5b3_p == .a) & (h_country == 0 & (h_4_5b_p == 1 | h_4_5b_p == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_p = .i if (h_4_6b_p == . | h_4_6b_p == .a) & (h_country == 0 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_p = .i if (h_4_6b2_p == . | h_4_6b2_p == .a) & (h_country == 0 & (h_4_6b_p == 2 | h_4_6b_p == .i))

replace h_4_6b3_p = .i if (h_4_6b3_p == . | h_4_6b3_p == .a) & (h_country == 0 & (h_4_6b_p == 1 | h_4_6b_p == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_p = .i if (h_4_7b_p == . | h_4_7b_p == .a) & (h_country == 0 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_p = .i if (h_4_7b2_p == . | h_4_7b2_p == .a) & (h_country == 0 & (h_4_7b_p == 2 | h_4_7b_p == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_p = .i if (h_4_8b_p == . | h_4_8b_p == .a) & (h_country == 0 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_p = .i if (h_4_8b2_p == . | h_4_8b2_p == .a) & (h_country == 0 & (h_4_8b_p == 2 | h_4_8b_p == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_p = .i if (h_5_1b_p == . | h_5_1b_p == .a) & (h_country == 0 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_p = .i if (h_5_1b2_p == . | h_5_1b2_p == .a) & (h_country == 0 & (h_5_1b_p == 2 | h_5_1b_p == .i) & h_5 ~= 1)

replace h_5_1b3_p = .i if (h_5_1b3_p == . | h_5_1b3_p == .a) & (h_country == 0 & (h_5_1b_p == 1 | h_5_1b_p == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_p = .i if (h_5_2b_p == . | h_5_2b_p == .a) & (h_country == 0 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_p = .i if (h_5_2b2_p == . | h_5_2b2_p == .a) & (h_country == 0 & (h_5_2b_p == 2 | h_5_2b_p == .i) & h_5 ~= 1)

replace h_5_2b3_p = .i if (h_5_2b3_p == . | h_5_2b3_p == .a) & (h_country == 0 & (h_5_2b_p == 1 | h_5_2b_p == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_p = .i if (h_5_3b_p == . | h_5_3b_p == .a) & (h_country == 0 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_p = .i if (h_5_3b2_p == . | h_5_3b2_p == .a) & (h_country == 0 & (h_5_3b_p == 2 | h_5_3b_p == .i) & h_5 ~= 1)

replace h_5_3b3_p = .i if (h_5_3b3_p == . | h_5_3b3_p == .a) & (h_country == 0 & (h_5_3b_p == 1 | h_5_3b_p == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_p = .i if (h_5_4b_p == . | h_5_4b_p == .a) & (h_country == 0 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_p = .i if (h_5_4b2_p == . | h_5_4b2_p == .a) & (h_country == 0 & (h_5_4b_p == 2 | h_5_4b_p == .i) & h_5 ~= 1)

replace h_5_4b3_p = .i if (h_5_4b3_p == . | h_5_4b3_p == .a) & (h_country == 0 & (h_5_4b_p == 1 | h_5_4b_p == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_p = .i if (h_5_5b_p == . | h_5_5b_p == .a) & (h_country == 0 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_p = .i if (h_5_5b2_p == . | h_5_5b2_p == .a) & (h_country == 0 & (h_5_5b_p == 2 | h_5_5b_p == .i) & h_5 ~= 1)

replace h_5_5b3_p = .i if (h_5_5b3_p == . | h_5_5b3_p == .a) & (h_country == 0 & (h_5_5b_p == 1 | h_5_5b_p == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_p = .i if (h_5_6b_p == . | h_5_6b_p == .a) & (h_country == 0 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_p = .i if (h_5_6b2_p == . | h_5_6b2_p == .a) & (h_country == 0 & (h_5_6b_p == 2 | h_5_6b_p == .i) & h_5 ~= 1)

replace h_5_6b3_p = .i if (h_5_6b3_p == . | h_5_6b3_p == .a) & (h_country == 0 & (h_5_6b_p == 1 | h_5_6b_p == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_p = .i if (h_5_7b_p == . | h_5_7b_p == .a) & (h_country == 0 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_p = .i if (h_5_7b2_p == . | h_5_7b2_p == .a) & (h_country == 0 & (h_5_7b_p == 2 | h_5_7b_p == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_p = .i if (h_5_8b_p == . | h_5_8b_p == .a) & (h_country == 0 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_p = .i if (h_5_8b2_p == . | h_5_8b2_p == .a) & (h_country == 0 & (h_5_8b_p == 2 | h_5_8b_p == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_p = .i if (h_6_1a_p == . | h_6_1a_p == .a) & (h_country == 0 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_p = .i if (h_6_1b1_p == . | h_6_1b1_p == .a) & (h_country == 0 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1a_p == 88 | h_6_1a_p == 99 | h_6_1a_p == .i))

replace h_6_1b2_p = .i if (h_6_1b2_p == . | h_6_1b2_p == .a) & (h_country == 0 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1b1_p == 1 | h_6_1b1_p == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_44_p = .i if (h_6_44_p == . | h_6_44_p == .a) & h_country == 0

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_p = .i if (h_6_5a_p == . | h_6_5a_p == .a) & (h_country == 0 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_p = .i if (h_6_5b1_p == . | h_6_5b1_p == .a) & (h_country == 0 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5a_p == 88 | h_6_5a_p == 99 | h_6_5a_p == .i))

replace h_6_5b2_p = .i if (h_6_5b2_p == . | h_6_5b2_p == .a) & (h_country == 0 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5b1_p == 1 | h_6_5b1_p == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_p = .i if (h_6_6a_p == . | h_6_6a_p == .a) & (h_country == 0 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_p = .i if (h_6_6b1_p == . | h_6_6b1_p == .a) & (h_country == 0 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6a_p == 88 | h_6_6a_p == 99 | h_6_6a_p == .i))

replace h_6_6b2_p = .i if (h_6_6b2_p == . | h_6_6b2_p == .a) & (h_country == 0 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6b1_p == 1 | h_6_6b1_p == .i))

replace h_7_1_p_c = .i if (h_7_1_p_c == . | h_7_1_p_c == .a) & (h_country == 0 | h_country == 2)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)
}



*all dominican republic invalid

if h_country == 1 {
replace h_3_2_d = .i if (h_3_2_d == . | h_3_2_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3)

replace h_3_3a_d = .i if (h_3_3a_d == . | h_3_3a_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i))

replace h_3_3b_d = .i if (h_3_3b_d == . | h_3_3b_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i) & (h_3_3a_d == 2 | h_3_3a_d == .i))

replace h_3_3c_d = .i if (h_3_3c_d == . | h_3_3c_d == .a) & (h_country == 1 & h_3_1 ~= 2 & h_3_1 ~= 3 & (h_3_2_d == 88 | h_3_2_d == 99 | h_3_2_d == .i) & (h_3_3a_d == 1 | h_3_3a_d == .i))

replace h_3_4_d = .i if (h_3_4_d == . | h_3_4_d == .a) & (h_country == 1 & h_3_1 ~= 2)

replace h_3_5a_d = .i if (h_3_5a_d == . | h_3_5a_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i))

replace h_3_5b_d = .i if (h_3_5b_d == . | h_3_5b_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i) & (h_3_5a_d == 2 | h_3_5a_d == .i))

replace h_3_5c_d = .i if (h_3_5c_d == . | h_3_5c_d == .a) & (h_country == 1 & (h_3_4_d == 88 | h_3_4_d == 99 | h_3_4_d == .i) & (h_3_5a_d == 1 | h_3_5a_d == .i))

replace h_3_6_d = .i if (h_3_6_d == . | h_3_6_d == .i) & (h_country == 1 & (h_3_1 == 2 | h_3_1 == .i))

replace h_3_7a_d = .i if (h_3_7a_d == . | h_3_7a_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i))

replace h_3_7b_d = .i if (h_3_7b_d == . | h_3_7b_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i) & (h_3_7a_d == 2 | h_3_7a_d == .i))

replace h_3_7c_d = .i if (h_3_7c_d == . | h_3_7c_d == .a) & (h_country == 1 & (h_3_6_d == 88 | h_3_6_d == 99 | h_3_6_d == .i) & (h_3_7a_d == 1 | h_3_7a_d == .i))

replace h_3_8 = .i if (h_3_8 == . | h_3_8 == .a)

replace h_3_9 = .i if (h_3_9 == . | h_3_9 == .a)

replace h_3_10 = .i if (h_3_10 == . | h_3_10 == .a)

replace h_3_11 = .i if (h_3_11 == . | h_3_11 == .a)

replace h_3_12 = .i if (h_3_12 == . | h_3_12 == .a) & h_3_11 ~= 4



/*
replace h_3_13 = .i if (h_3_13 == . | h_3_13 == .a)
this variable was incorrectly(??) labeled with an s instead of h
*/



replace h_3_14_1 = .i if (h_3_14_1 == . | h_3_14_1 == .a)

replace h_3_14_2 = .i if (h_3_14_2 == . | h_3_14_2 == .a)

replace h_3_14_3 = .i if (h_3_14_3 == . | h_3_14_3 == .a)

replace h_3_14_4 = .i if (h_3_14_4 == . | h_3_14_4 == .a)

replace h_3_14_5 = .i if (h_3_14_5 == . | h_3_14_5 == .a)

replace h_3_14_6 = .i if (h_3_14_6 == . | h_3_14_6 == .a)

replace h_3_14_7 = .i if (h_3_14_7 == . | h_3_14_7 == .a)

replace h_3_14_8 = .i if (h_3_14_8 == . | h_3_14_8 == .a)

replace h_3_14_9 = .i if (h_3_14_9 == . | h_3_14_9 == .a)

replace h_3_14_10 = .i if (h_3_14_10 == . | h_3_14_10 == .a)

replace h_3_14_11 = .i if (h_3_14_11 == . | h_3_14_11 == .a)

replace h_3_14_12 = .i if (h_3_14_12 == . | h_3_14_12 == .a)

replace h_3_15 = .i if (h_3_15 == . | h_3_15 == .a)

replace h_3_16_d = .i if (h_3_16_d == . | h_3_16_d == .a) & (h_country == 1 & h_3_15 ~= 0)

replace h_3_17a_d = .i if (h_3_17a_d == . | h_3_17a_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i))

replace h_3_17b_d = .i if (h_3_17b_d == . | h_3_17b_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i) & (h_3_17a_d == 2 | h_3_17a_d == .i))

replace h_3_17c_d = .i if (h_3_17c_d == . | h_3_17c_d == .a) & (h_country == 1 & (h_3_16_d == 88 | h_3_16_d == 99 | h_3_16_d == .i) & (h_3_17a_d == 1 | h_3_17a_d == .i))

replace h_3_18 = .i if (h_3_18 == . | h_3_18 == .a) & h_country == 1

replace h_3_19_d = .i if (h_3_19_d == . | h_3_19_d == .a) & (h_country == 1 & (h_3_18 == 1 | h_3_18 == .i))

replace h_3_20a_d = .i if (h_3_20a_d == . | h_3_20a_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i))

replace h_3_20b_d = .i if (h_3_20b_d == . | h_3_20b_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i) & (h_3_20a_d == 2 | h_3_20a_d == .i))

replace h_3_20c_d = .i if (h_3_20c_d == . | h_3_20c_d == .a) & (h_country == 1 & (h_3_19_d == 88 | h_3_19_d == 99 | h_3_19_d == .i) & (h_3_20a_d == 1 | h_3_20a_d == .i))

replace h_3_21 = .i if (h_3_21 == . | h_3_21 == .a)

replace h_3_22_d = .i if (h_3_22_d == . | h_3_22_d == .a) & (h_country == 1 & (h_3_21 == 1 | h_3_21 == .i))

replace h_3_23a_d = .i if (h_3_23a_d == . | h_3_23a_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i))

replace h_3_23b_d = .i if (h_3_23b_d == . | h_3_23b_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i) & (h_3_23a_d == 2 | h_3_23a_d == .i))

replace h_3_23c_d = .i if (h_3_23c_d == . | h_3_23c_d == .a) & (h_country == 1 & (h_3_22_d == 88 | h_3_22_d == 99 | h_3_22_d == .i) & (h_3_23a_d == 1 | h_3_23a_d == .i))

replace h_3_24 = .i if (h_3_24 == . | h_3_24 == .a)

replace h_3_25_d = .i if (h_3_25_d == . | h_3_25_d == .a) & (h_country == 1 & (h_3_24 == 1 | h_3_24 == .i))

replace h_3_26a_d = .i if (h_3_26a_d == . | h_3_26a_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i))

replace h_3_26b_d = .i if (h_3_26b_d == . | h_3_26b_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i) & (h_3_26a_d == 2 | h_3_26a_d == .i))

replace h_3_26c_d = .i if (h_3_26c_d == . | h_3_26c_d == .a) & (h_country == 1 & (h_3_25_d == 88 | h_3_25_d == 99 | h_3_25_d == .i) & (h_3_26a_d == 1 | h_3_26a_d == .i))

replace h_3_27_d = .i if (h_3_27_d == . | h_3_27_d == .a) & h_country == 1

replace h_3_28a_d = .i if (h_3_28a_d == . | h_3_28a_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i))

replace h_3_28b_d = .i if (h_3_28b_d == . | h_3_28b_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i) & (h_3_28a_d == 2 | h_3_28a_d == .i))

replace h_3_28c_d = .i if (h_3_28c_d == . | h_3_28c_d == .a) & (h_country == 1 & (h_3_27_d == 88 | h_3_27_d == 99 | h_3_27_d == .i) & (h_3_28a_d == 1 | h_3_28a_d == .i))

replace h_3_29 = .i if (h_3_29 == . | h_3_29 == .a)

replace h_3_30_d = .i if (h_3_30_d == . | h_3_30_d == .a) & (h_country == 1 & (h_3_29 == 1 | h_3_29 == .i))

replace h_3_31a_d = .i if (h_3_31a_d == . | h_3_31a_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i))

replace h_3_31b_d = .i if (h_3_31b_d == . | h_3_31b_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i) & (h_3_31a_d == 2 | h_3_31a_d == .i))

replace h_3_31c_d = .i if (h_3_31c_d == . | h_3_31c_d == .a) & (h_country == 1 & (h_3_30_d == 88 | h_3_30_d == 99 | h_3_30_d == .i) & (h_3_31a_d == 1 | h_3_31a_d == .i))

replace h_3_32_d = .i if (h_3_32_d == . | h_3_32_d == .a) & h_country == 1

replace h_3_33a_d = .i if (h_3_33a_d == . | h_3_33a_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i))

replace h_3_33b_d = .i if (h_3_33b_d == . | h_3_33b_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i) & (h_3_33a_d == 2 | h_3_33a_d == .i))

replace h_3_33c_d = .i if (h_3_33c_d == . | h_3_33c_d == .a) & (h_country == 1 & (h_3_32_d == 88 | h_3_32_d == 99 | h_3_32_d == .i) & (h_3_33a_d == 1 | h_3_33a_d == .i))

replace h_3_34 = .i if (h_3_34 == . | h_3_34 == .a)

replace h_4_1 = .i if (h_4_1 == . | h_4_1 == .a)

replace h_4_1a = .i if (h_4_1a == . | h_4_1a == .a) & (h_4_1 == 1 | h_4_1 == .i)

replace h_4_1b_d = .i if (h_4_1b_d == . | h_4_1b_d == .a) & (h_country == 1 & (h_4_1a == 88 | h_4_1a == 99 | h_4_1a == .i))

replace h_4_1b2_d = .i if (h_4_1b2_d == . | h_4_1b2_d == .a) & (h_country == 1 & (h_4_1b_d == 2 | h_4_1b_d == .i))

replace h_4_1b3_d = .i if (h_4_1b3_d == . | h_4_1b3_d == .a) & (h_country == 1 & (h_4_1b_d == 1 | h_4_1b_d == .i))

replace h_4_2 = .i if (h_4_2 == . | h_4_2 == .a)

replace h_4_2a = .i if (h_4_2a == . | h_4_2a == .a) & (h_4_2 == 1 | h_4_2 == .i)

replace h_4_2b_d = .i if (h_4_2b_d == . | h_4_2b_d == .a) & (h_country == 1 & (h_4_2a == 88 | h_4_2a == 99 | h_4_2a == .i))

replace h_4_2b2_d = .i if (h_4_2b2_d == . | h_4_2b2_d == .a) & (h_country == 1 & (h_4_2b_d == 2 | h_4_2b_d == .i))

replace h_4_2b3_d = .i if (h_4_2b3_d == . | h_4_2b3_d == .a) & (h_country == 1 & (h_4_2b_d == 1 | h_4_2b_d == .i))

replace h_4_3 = .i if (h_4_3 == . | h_4_3 == .a)

replace h_4_3a = .i if (h_4_3a == . | h_4_3a == .a) & (h_4_3 == 1 | h_4_3 == .i)

replace h_4_3b_d = .i if (h_4_3b_d == . | h_4_3b_d == .a) & (h_country == 1 & (h_4_3a == 88 | h_4_3a == 99 | h_4_3a == .i))

replace h_4_3b2_d = .i if (h_4_3b2_d == . | h_4_3b2_d == .a) & (h_country == 1 & (h_4_3b_d == 2 | h_4_3b_d == .i))

replace h_4_3b3_d = .i if (h_4_3b3_d == . | h_4_3b3_d == .a) & (h_country == 1 & (h_4_3b_d == 1 | h_4_3b_d == .i))

replace h_4_4 = .i if (h_4_4 == . | h_4_4 == .a)

replace h_4_4a = .i if (h_4_4a == . | h_4_4a == .a) & (h_4_4 == 1 | h_4_4 == .i)

replace h_4_4b_d = .i if (h_4_4b_d == . | h_4_4b_d == .a) & (h_country == 1 & (h_4_4a == 88 | h_4_4a == 99 | h_4_4a == .i))

replace h_4_4b2_d = .i if (h_4_4b2_d == . | h_4_4b2_d == .a) & (h_country == 1 & (h_4_4b_d == 2 | h_4_4b_d == .i))

replace h_4_4b3_d = .i if (h_4_4b3_d == . | h_4_4b3_d == .a) & (h_country == 1 & (h_4_4b_d == 1 | h_4_4b_d == .i))

replace h_4_5 = .i if (h_4_5 == . | h_4_5 == .a)

replace h_4_5a = .i if (h_4_5a == . | h_4_5a == .a) & (h_4_5 == 1 | h_4_5 == .i)

replace h_4_5b_d = .i if (h_4_5b_d == . | h_4_5b_d == .a) & (h_country == 1 & (h_4_5a == 88 | h_4_5a == 99 | h_4_5a == .i))

replace h_4_5b2_d = .i if (h_4_5b2_d == . | h_4_5b2_d == .a) & (h_country == 1 & (h_4_5b_d == 2 | h_4_5b_d == .i))

replace h_4_5b3_d = .i if (h_4_5b3_d == . | h_4_5b3_d == .a) & (h_country == 1 & (h_4_5b_d == 1 | h_4_5b_d == .i))

replace h_4_6 = .i if (h_4_6 == . | h_4_6 == .a)

replace h_4_6a = .i if (h_4_6a == . | h_4_6a == .a) & (h_4_6 == 1 | h_4_6 == .i)

replace h_4_6b_d = .i if (h_4_6b_d == . | h_4_6b_d == .a) & (h_country == 1 & (h_4_6a == 88 | h_4_6a == 99 | h_4_6a == .i))

replace h_4_6b2_d = .i if (h_4_6b2_d == . | h_4_6b2_d == .a) & (h_country == 1 & (h_4_6b_d == 2 | h_4_6b_d == .i))

replace h_4_6b3_d = .i if (h_4_6b3_d == . | h_4_6b3_d == .a) & (h_country == 1 & (h_4_6b_d == 1 | h_4_6b_d == .i))

replace h_4_7 = .i if (h_4_7 == . | h_4_7 == .a)

replace h_4_7a = .i if (h_4_7a == . | h_4_7a == .a) & (h_4_7 == 1 | h_4_7 == .i)

replace h_4_7b_d = .i if (h_4_7b_d == . | h_4_7b_d == .a) & (h_country == 1 & (h_4_7a == 88 | h_4_7a == 99 | h_4_7a == .i))

replace h_4_7b2_d = .i if (h_4_7b2_d == . | h_4_7b2_d == .a) & (h_country == 1 & (h_4_7b_d == 2 | h_4_7b_d == .i))

replace h_4_8 = .i if (h_4_8 == . | h_4_8 == .a)

replace h_4_8a = .i if (h_4_8a == . | h_4_8a == .a) & (h_4_8 == 1 | h_4_8 == .i)

replace h_4_8b_d = .i if (h_4_8b_d == . | h_4_8b_d == .a) & (h_country == 1 & (h_4_8a == 88 | h_4_8a == 99 | h_4_8a == .i))

replace h_4_8b2_d = .i if (h_4_8b2_d == . | h_4_8b2_d == .a) & (h_country == 1 & (h_4_8b_d == 2 | h_4_8b_d == .i))

replace h_5 = .i if (h_5 == . | h_5 == .a)

replace h_5_1 = .i if (h_5_1 == . | h_5_1 == .a) & h_5 ~= 1

replace h_5_1a = .i if (h_5_1a == . | h_5_1a == .a) & ((h_5_1 == 1 | h_5_1 == .i) & h_5 ~= 1)

replace h_5_1b_d = .i if (h_5_1b_d == . | h_5_1b_d == .a) & (h_country == 1 & (h_5_1a == 88 | h_5_1a == 99 | h_5_1a == .i) & h_5 ~= 1)

replace h_5_1b2_d = .i if (h_5_1b2_d == . | h_5_1b2_d == .a) & (h_country == 1 & (h_5_1b_d == 2 | h_5_1b_d == .i) & h_5 ~= 1)

replace h_5_1b3_d = .i if (h_5_1b3_d == . | h_5_1b3_d == .a) & (h_country == 1 & (h_5_1b_d == 1 | h_5_1b_d == .i) & h_5 ~= 1)

replace h_5_2 = .i if (h_5_2 == . | h_5_2 == .a) & h_5 ~= 1

replace h_5_2a = .i if (h_5_2a == . | h_5_2a == .a) & ((h_5_2 == 1 | h_5_2 == .i) & h_5 ~= 1)

replace h_5_2b_d = .i if (h_5_2b_d == . | h_5_2b_d == .a) & (h_country == 1 & (h_5_2a == 88 | h_5_2a == 99 | h_5_2a == .i) & h_5 ~= 1)

replace h_5_2b2_d = .i if (h_5_2b2_d == . | h_5_2b2_d == .a) & (h_country == 1 & (h_5_2b_d == 2 | h_5_2b_d == .i) & h_5 ~= 1)

replace h_5_2b3_d = .i if (h_5_2b3_d == . | h_5_2b3_d == .a) & (h_country == 1 & (h_5_2b_d == 1 | h_5_2b_d == .i) & h_5 ~= 1)

replace h_5_3 = .i if (h_5_3 == . | h_5_3 == .a) & h_5 ~= 1

replace h_5_3a = .i if (h_5_3a == . | h_5_3a == .a) & ((h_5_3 == 1 | h_5_3 == .i) & h_5 ~= 1)

replace h_5_3b_d = .i if (h_5_3b_d == . | h_5_3b_d == .a) & (h_country == 1 & (h_5_3a == 88 | h_5_3a == 99 | h_5_3a == .i) & h_5 ~= 1)

replace h_5_3b2_d = .i if (h_5_3b2_d == . | h_5_3b2_d == .a) & (h_country == 1 & (h_5_3b_d == 2 | h_5_3b_d == .i) & h_5 ~= 1)

replace h_5_3b3_d = .i if (h_5_3b3_d == . | h_5_3b3_d == .a) & (h_country == 1 & (h_5_3b_d == 1 | h_5_3b_d == .i) & h_5 ~= 1)

replace h_5_4 = .i if (h_5_4 == . | h_5_4 == .a) & h_5 ~= 1

replace h_5_4a = .i if (h_5_4a == . | h_5_4a == .a) & ((h_5_4 == 1 | h_5_4 == .i) & h_5 ~= 1)

replace h_5_4b_d = .i if (h_5_4b_d == . | h_5_4b_d == .a) & (h_country == 1 & (h_5_4a == 88 | h_5_4a == 99 | h_5_4a == .i) & h_5 ~= 1)

replace h_5_4b2_d = .i if (h_5_4b2_d == . | h_5_4b2_d == .a) & (h_country == 1 & (h_5_4b_d == 2 | h_5_4b_d == .i) & h_5 ~= 1)

replace h_5_4b3_d = .i if (h_5_4b3_d == . | h_5_4b3_d == .a) & (h_country == 1 & (h_5_4b_d == 1 | h_5_4b_d == .i) & h_5 ~= 1)

replace h_5_5 = .i if (h_5_5 == . | h_5_5 == .a) & h_5 ~= 1

replace h_5_5a = .i if (h_5_5a == . | h_5_5a == .a) & ((h_5_5 == 1 | h_5_5 == .i) & h_5 ~= 1)

replace h_5_5b_d = .i if (h_5_5b_d == . | h_5_5b_d == .a) & (h_country == 1 & (h_5_5a == 88 | h_5_5a == 99 | h_5_5a == .i) & h_5 ~= 1)

replace h_5_5b2_d = .i if (h_5_5b2_d == . | h_5_5b2_d == .a) & (h_country == 1 & (h_5_5b_d == 2 | h_5_5b_d == .i) & h_5 ~= 1)

replace h_5_5b3_d = .i if (h_5_5b3_d == . | h_5_5b3_d == .a) & (h_country == 1 & (h_5_5b_d == 1 | h_5_5b_d == .i) & h_5 ~= 1)

replace h_5_6 = .i if (h_5_6 == . | h_5_6 == .a) & h_5 ~= 1

replace h_5_6a = .i if (h_5_6a == . | h_5_6a == .a) & ((h_5_6 == 1 | h_5_6 == .i) & h_5 ~= 1)

replace h_5_6b_d = .i if (h_5_6b_d == . | h_5_6b_d == .a) & (h_country == 1 & (h_5_6a == 88 | h_5_6a == 99 | h_5_6a == .i) & h_5 ~= 1)

replace h_5_6b2_d = .i if (h_5_6b2_d == . | h_5_6b2_d == .a) & (h_country == 1 & (h_5_6b_d == 2 | h_5_6b_d == .i) & h_5 ~= 1)

replace h_5_6b3_d = .i if (h_5_6b3_d == . | h_5_6b3_d == .a) & (h_country == 1 & (h_5_6b_d == 1 | h_5_6b_d == .i) & h_5 ~= 1)

replace h_5_7 = .i if (h_5_7 == . | h_5_7 == .a) & h_5 ~= 1

replace h_5_7a = .i if (h_5_7a == . | h_5_7a == .a) & ((h_5_7 == 1 | h_5_7 == .i) & h_5 ~= 1)

replace h_5_7b_d = .i if (h_5_7b_d == . | h_5_7b_d == .a) & (h_country == 1 & (h_5_7a == 88 | h_5_7a == 99 | h_5_7a == .i) & h_5 ~= 1)

replace h_5_7b2_d = .i if (h_5_7b2_d == . | h_5_7b2_d == .a) & (h_country == 1 & (h_5_7b_d == 2 | h_5_7b_d == .i) & h_5 ~= 1)

replace h_5_8 = .i if (h_5_8 == . | h_5_8 == .a) & h_5 ~= 1

replace h_5_8a = .i if (h_5_8a == . | h_5_8a == .a) & ((h_5_8 == 1 | h_5_8 == .i) & h_5 ~= 1)

replace h_5_8b_d = .i if (h_5_8b_d == . | h_5_8b_d == .a) & (h_country == 1 & (h_5_8a == 88 | h_5_8a == 99 | h_5_8a == .i) & h_5 ~= 1)

replace h_5_8b2_d = .i if (h_5_8b2_d == . | h_5_8b2_d == .a) & (h_country == 1 & (h_5_8b_d == 2 | h_5_8b_d == .i) & h_5 ~= 1)

replace h_6_1 = .i if (h_6_1 == . | h_6_1 == .a)

replace h_6_1a_d = .i if (h_6_1a_d == . | h_6_1a_d == .a) & (h_country == 1 & (h_6_1 == 1 | h_6_1 == .i))

replace h_6_1b1_d = .i if (h_6_1b1_d == . | h_6_1b1_d == .a) & (h_country == 1 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1a_d == 88 | h_6_1a_d == 99 | h_6_1a_d == .i))

replace h_6_1b2_d = .i if (h_6_1b2_d == . | h_6_1b2_d == .a) & (h_country == 1 & (h_6_1 == 1 | h_6_1 == .i) & (h_6_1b1_d == 1 | h_6_1b1_d == .i))

replace h_6_2 = .i if (h_6_2 == . | h_6_2 == .a)

replace h_6_3 = .i if (h_6_3 == . | h_6_3 == .a)

replace h_6_41_d = .i if (h_6_41_d == . | h_6_41_d == .a) & h_country == 1

replace h_6_42_d = .i if (h_6_42_d == . | h_6_42_d == .a) & h_country == 1

replace h_6_43_d = .i if (h_6_43_d == . | h_6_43_d == .a) & h_country == 1

replace h_6_5 = .i if (h_6_5 == . | h_6_5 == .a)

replace h_6_5a_d = .i if (h_6_5a_d == . | h_6_5a_d == .a) & (h_country == 1 & (h_6_5 == 1 | h_6_5 == .i))

replace h_6_5b1_d = .i if (h_6_5b1_d == . | h_6_5b1_d == .a) & (h_country == 1 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5a_d == 88 | h_6_5a_d == 99 | h_6_5a_d == .i))

replace h_6_5b2_d = .i if (h_6_5b2_d == . | h_6_5b2_d == .a) & (h_country == 1 & (h_6_5 == 1 | h_6_5 == .i) & (h_6_5b1_d == 1 | h_6_5b1_d == .i))

replace h_6_6 = .i if (h_6_6 == . | h_6_6 == .a)

replace h_6_6a_d = .i if (h_6_6a_d == . | h_6_6a_d == .a) & (h_country == 1 & (h_6_6 == 1 | h_6_6 == .i))

replace h_6_6b1_d = .i if (h_6_6b1_d == . | h_6_6b1_d == .a) & (h_country == 1 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6a_d == 88 | h_6_6a_d == 99 | h_6_6a_d == .i))

replace h_6_6b2_d = .i if (h_6_6b2_d == . | h_6_6b2_d == .a) & (h_country == 1 & (h_6_6 == 1 | h_6_6 == .i) & (h_6_6b1_d == 1 | h_6_6b1_d == .i))

replace h_7_1_d = .i if (h_7_1_d == . | h_7_1_d == .a) & (h_country == 1)

replace h_7_2_1 = .i if (h_7_2_1 == . | h_7_2_1 == .a)

replace h_7_2_2 = .i if (h_7_2_2 == . | h_7_2_2 == .a)

replace h_7_2_3 = .i if (h_7_2_3 == . | h_7_2_3 == .a)

replace h_7_2_4 = .i if (h_7_2_4 == . | h_7_2_4 == .a)

replace h_7_2_5 = .i if (h_7_2_5 == . | h_7_2_5 == .a)
}



*all remaining . are converted to .v

replace h_3_2_c = .v if (h_3_2_c == . | h_3_2_c == .a)
replace h_3_3a_c = .v if (h_3_3a_c == . | h_3_3a_c == .a)
replace h_3_3b_c = .v if (h_3_3b_c == . | h_3_3b_c == .a)
replace h_3_3c_c = .v if (h_3_3c_c == . | h_3_3c_c == .a)
replace h_3_4_c = .v if (h_3_4_c == . | h_3_4_c == .a)
replace h_3_5a_c = .v if (h_3_5a_c == . | h_3_5a_c == .a)
replace h_3_5b_c = .v if (h_3_5b_c == . | h_3_5b_c == .a)
replace h_3_5c_c = .v if (h_3_5c_c == . | h_3_5c_c == .a)
replace h_3_6_c = .v if (h_3_6_c == . | h_3_6_c == .a)
replace h_3_7a_c = .v if (h_3_7a_c == . | h_3_7a_c == .a)
replace h_3_7b_c = .v if (h_3_7b_c == . | h_3_7b_c == .a)
replace h_3_7c_c = .v if (h_3_7c_c == . | h_3_7c_c == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_c = .v if (h_3_16_c == . | h_3_16_c == .a)
replace h_3_17a_c = .v if (h_3_17a_c == . | h_3_17a_c == .a)
replace h_3_17b_c = .v if (h_3_17b_c == . | h_3_17b_c == .a)
replace h_3_17c_c = .v if (h_3_17c_c == . | h_3_17c_c == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_c = .v if (h_3_19_c == . | h_3_19_c == .a)
replace h_3_20a_c = .v if (h_3_20a_c == . | h_3_20a_c == .a)
replace h_3_20b_c = .v if (h_3_20b_c == . | h_3_20b_c == .a)
replace h_3_20c_c = .v if (h_3_20c_c == . | h_3_20c_c == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_c = .v if (h_3_22_c == . | h_3_22_c == .a)
replace h_3_23a_c = .v if (h_3_23a_c == . | h_3_23a_c == .a)
replace h_3_23b_c = .v if (h_3_23b_c == . | h_3_23b_c == .a)
replace h_3_23c_c = .v if (h_3_23c_c == . | h_3_23c_c == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_c = .v if (h_3_25_c == . | h_3_25_c == .a)
replace h_3_26a_c = .v if (h_3_26a_c == . | h_3_26a_c == .a)
replace h_3_26b_c = .v if (h_3_26b_c == . | h_3_26b_c == .a)
replace h_3_26c_c = .v if (h_3_26c_c == . | h_3_26c_c == .a)
replace h_3_27_c = .v if (h_3_27_c == . | h_3_27_c == .a)
replace h_3_28a_c = .v if (h_3_28a_c == . | h_3_28a_c == .a)
replace h_3_28b_c = .v if (h_3_28b_c == . | h_3_28b_c == .a)
replace h_3_28c_c = .v if (h_3_28c_c == . | h_3_28c_c == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_c = .v if (h_3_30_c == . | h_3_30_c == .a)
replace h_3_31a_c = .v if (h_3_31a_c == . | h_3_31a_c == .a)
replace h_3_31b_c = .v if (h_3_31b_c == . | h_3_31b_c == .a)
replace h_3_31c_c = .v if (h_3_31c_c == . | h_3_31c_c == .a)
replace h_3_32_c = .v if (h_3_32_c == . | h_3_32_c == .a)
replace h_3_33a_c = .v if (h_3_33a_c == . | h_3_33a_c == .a)
replace h_3_33b_c = .v if (h_3_33b_c == . | h_3_33b_c == .a)
replace h_3_33c_c = .v if (h_3_33c_c == . | h_3_33c_c == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_c = .v if (h_4_1b_c == . | h_4_1b_c == .a)
replace h_4_1b2_c = .v if (h_4_1b2_c == . | h_4_1b2_c == .a)
replace h_4_1b3_c = .v if (h_4_1b3_c == . | h_4_1b3_c == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_c = .v if (h_4_2b_c == . | h_4_2b_c == .a)
replace h_4_2b2_c = .v if (h_4_2b2_c == . | h_4_2b2_c == .a)
replace h_4_2b3_c = .v if (h_4_2b3_c == . | h_4_2b3_c == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_c = .v if (h_4_3b_c == . | h_4_3b_c == .a)
replace h_4_3b2_c = .v if (h_4_3b2_c == . | h_4_3b2_c == .a)
replace h_4_3b3_c = .v if (h_4_3b3_c == . | h_4_3b3_c == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_c = .v if (h_4_4b_c == . | h_4_4b_c == .a)
replace h_4_4b2_c = .v if (h_4_4b2_c == . | h_4_4b2_c == .a)
replace h_4_4b3_c = .v if (h_4_4b3_c == . | h_4_4b3_c == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_c = .v if (h_4_5b_c == . | h_4_5b_c == .a)
replace h_4_5b2_c = .v if (h_4_5b2_c == . | h_4_5b2_c == .a)
replace h_4_5b3_c = .v if (h_4_5b3_c == . | h_4_5b3_c == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_c = .v if (h_4_6b_c == . | h_4_6b_c == .a)
replace h_4_6b2_c = .v if (h_4_6b2_c == . | h_4_6b2_c == .a)
replace h_4_6b3_c = .v if (h_4_6b3_c == . | h_4_6b3_c == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_c = .v if (h_4_7b_c == . | h_4_7b_c == .a)
replace h_4_7b2_c = .v if (h_4_7b2_c == . | h_4_7b2_c == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_c = .v if (h_4_8b_c == . | h_4_8b_c == .a)
replace h_4_8b2_c = .v if (h_4_8b2_c == . | h_4_8b2_c == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_c = .v if (h_5_1b_c == . | h_5_1b_c == .a)
replace h_5_1b2_c = .v if (h_5_1b2_c == . | h_5_1b2_c == .a)
replace h_5_1b3_c = .v if (h_5_1b3_c == . | h_5_1b3_c == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_c = .v if (h_5_2b_c == . | h_5_2b_c == .a)
replace h_5_2b2_c = .v if (h_5_2b2_c == . | h_5_2b2_c == .a)
replace h_5_2b3_c = .v if (h_5_2b3_c == . | h_5_2b3_c == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_c = .v if (h_5_3b_c == . | h_5_3b_c == .a)
replace h_5_3b2_c = .v if (h_5_3b2_c == . | h_5_3b2_c == .a)
replace h_5_3b3_c = .v if (h_5_3b3_c == . | h_5_3b3_c == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_c = .v if (h_5_4b_c == . | h_5_4b_c == .a)
replace h_5_4b2_c = .v if (h_5_4b2_c == . | h_5_4b2_c == .a)
replace h_5_4b3_c = .v if (h_5_4b3_c == . | h_5_4b3_c == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_c = .v if (h_5_5b_c == . | h_5_5b_c == .a)
replace h_5_5b2_c = .v if (h_5_5b2_c == . | h_5_5b2_c == .a)
replace h_5_5b3_c = .v if (h_5_5b3_c == . | h_5_5b3_c == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_c = .v if (h_5_6b_c == . | h_5_6b_c == .a)
replace h_5_6b2_c = .v if (h_5_6b2_c == . | h_5_6b2_c == .a)
replace h_5_6b3_c = .v if (h_5_6b3_c == . | h_5_6b3_c == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_c = .v if (h_5_7b_c == . | h_5_7b_c == .a)
replace h_5_7b2_c = .v if (h_5_7b2_c == . | h_5_7b2_c == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_c = .v if (h_5_8b_c == . | h_5_8b_c == .a)
replace h_5_8b2_c = .v if (h_5_8b2_c == . | h_5_8b2_c == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_c = .v if (h_6_1a_c == . | h_6_1a_c == .a)
replace h_6_1b1_c = .v if (h_6_1b1_c == . | h_6_1b1_c == .a)
replace h_6_1b2_c = .v if (h_6_1b2_c == . | h_6_1b2_c == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_c = .v if (h_6_5a_c == . | h_6_5a_c == .a)
replace h_6_5b1_c = .v if (h_6_5b1_c == . | h_6_5b1_c == .a)
replace h_6_5b2_c = .v if (h_6_5b2_c == . | h_6_5b2_c == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_c = .v if (h_6_6a_c == . | h_6_6a_c == .a)
replace h_6_6b1_c = .v if (h_6_6b1_c == . | h_6_6b1_c == .a)
replace h_6_6b2_c = .v if (h_6_6b2_c == . | h_6_6b2_c == .a)
replace h_7_1_p_c = .v if (h_7_1_p_c == . | h_7_1_p_c == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)
replace h_3_2_p = .v if (h_3_2_p == . | h_3_2_p == .a)
replace h_3_3a_p = .v if (h_3_3a_p == . | h_3_3a_p == .a)
replace h_3_3b_p = .v if (h_3_3b_p == . | h_3_3b_p == .a)
replace h_3_3c_p = .v if (h_3_3c_p == . | h_3_3c_p == .a)
replace h_3_4_p = .v if (h_3_4_p == . | h_3_4_p == .a)
replace h_3_5a_p = .v if (h_3_5a_p == . | h_3_5a_p == .a)
replace h_3_5b_p = .v if (h_3_5b_p == . | h_3_5b_p == .a)
replace h_3_5c_p = .v if (h_3_5c_p == . | h_3_5c_p == .a)
replace h_3_6_p = .v if (h_3_6_p == . | h_3_6_p == .a)
replace h_3_7a_p = .v if (h_3_7a_p == . | h_3_7a_p == .a)
replace h_3_7b_p = .v if (h_3_7b_p == . | h_3_7b_p == .a)
replace h_3_7c_p = .v if (h_3_7c_p == . | h_3_7c_p == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_p = .v if (h_3_16_p == . | h_3_16_p == .a)
replace h_3_17a_p = .v if (h_3_17a_p == . | h_3_17a_p == .a)
replace h_3_17b_p = .v if (h_3_17b_p == . | h_3_17b_p == .a)
replace h_3_17c_p = .v if (h_3_17c_p == . | h_3_17c_p == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_p = .v if (h_3_19_p == . | h_3_19_p == .a)
replace h_3_20a_p = .v if (h_3_20a_p == . | h_3_20a_p == .a)
replace h_3_20b_p = .v if (h_3_20b_p == . | h_3_20b_p == .a)
replace h_3_20c_p = .v if (h_3_20c_p == . | h_3_20c_p == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_p = .v if (h_3_22_p == . | h_3_22_p == .a)
replace h_3_23a_p = .v if (h_3_23a_p == . | h_3_23a_p == .a)
replace h_3_23b_p = .v if (h_3_23b_p == . | h_3_23b_p == .a)
replace h_3_23c_p = .v if (h_3_23c_p == . | h_3_23c_p == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_p = .v if (h_3_25_p == . | h_3_25_p == .a)
replace h_3_26a_p = .v if (h_3_26a_p == . | h_3_26a_p == .a)
replace h_3_26b_p = .v if (h_3_26b_p == . | h_3_26b_p == .a)
replace h_3_26c_p = .v if (h_3_26c_p == . | h_3_26c_p == .a)
replace h_3_27_p = .v if (h_3_27_p == . | h_3_27_p == .a)
replace h_3_28a_p = .v if (h_3_28a_p == . | h_3_28a_p == .a)
replace h_3_28b_p = .v if (h_3_28b_p == . | h_3_28b_p == .a)
replace h_3_28c_p = .v if (h_3_28c_p == . | h_3_28c_p == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_p = .v if (h_3_30_p == . | h_3_30_p == .a)
replace h_3_31a_p = .v if (h_3_31a_p == . | h_3_31a_p == .a)
replace h_3_31b_p = .v if (h_3_31b_p == . | h_3_31b_p == .a)
replace h_3_31c_p = .v if (h_3_31c_p == . | h_3_31c_p == .a)
replace h_3_32_p = .v if (h_3_32_p == . | h_3_32_p == .a)
replace h_3_33a_p = .v if (h_3_33a_p == . | h_3_33a_p == .a)
replace h_3_33b_p = .v if (h_3_33b_p == . | h_3_33b_p == .a)
replace h_3_33c_p = .v if (h_3_33c_p == . | h_3_33c_p == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_p = .v if (h_4_1b_p == . | h_4_1b_p == .a)
replace h_4_1b2_p = .v if (h_4_1b2_p == . | h_4_1b2_p == .a)
replace h_4_1b3_p = .v if (h_4_1b3_p == . | h_4_1b3_p == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_p = .v if (h_4_2b_p == . | h_4_2b_p == .a)
replace h_4_2b2_p = .v if (h_4_2b2_p == . | h_4_2b2_p == .a)
replace h_4_2b3_p = .v if (h_4_2b3_p == . | h_4_2b3_p == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_p = .v if (h_4_3b_p == . | h_4_3b_p == .a)
replace h_4_3b2_p = .v if (h_4_3b2_p == . | h_4_3b2_p == .a)
replace h_4_3b3_p = .v if (h_4_3b3_p == . | h_4_3b3_p == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_p = .v if (h_4_4b_p == . | h_4_4b_p == .a)
replace h_4_4b2_p = .v if (h_4_4b2_p == . | h_4_4b2_p == .a)
replace h_4_4b3_p = .v if (h_4_4b3_p == . | h_4_4b3_p == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_p = .v if (h_4_5b_p == . | h_4_5b_p == .a)
replace h_4_5b2_p = .v if (h_4_5b2_p == . | h_4_5b2_p == .a)
replace h_4_5b3_p = .v if (h_4_5b3_p == . | h_4_5b3_p == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_p = .v if (h_4_6b_p == . | h_4_6b_p == .a)
replace h_4_6b2_p = .v if (h_4_6b2_p == . | h_4_6b2_p == .a)
replace h_4_6b3_p = .v if (h_4_6b3_p == . | h_4_6b3_p == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_p = .v if (h_4_7b_p == . | h_4_7b_p == .a)
replace h_4_7b2_p = .v if (h_4_7b2_p == . | h_4_7b2_p == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_p = .v if (h_4_8b_p == . | h_4_8b_p == .a)
replace h_4_8b2_p = .v if (h_4_8b2_p == . | h_4_8b2_p == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_p = .v if (h_5_1b_p == . | h_5_1b_p == .a)
replace h_5_1b2_p = .v if (h_5_1b2_p == . | h_5_1b2_p == .a)
replace h_5_1b3_p = .v if (h_5_1b3_p == . | h_5_1b3_p == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_p = .v if (h_5_2b_p == . | h_5_2b_p == .a)
replace h_5_2b2_p = .v if (h_5_2b2_p == . | h_5_2b2_p == .a)
replace h_5_2b3_p = .v if (h_5_2b3_p == . | h_5_2b3_p == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_p = .v if (h_5_3b_p == . | h_5_3b_p == .a)
replace h_5_3b2_p = .v if (h_5_3b2_p == . | h_5_3b2_p == .a)
replace h_5_3b3_p = .v if (h_5_3b3_p == . | h_5_3b3_p == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_p = .v if (h_5_4b_p == . | h_5_4b_p == .a)
replace h_5_4b2_p = .v if (h_5_4b2_p == . | h_5_4b2_p == .a)
replace h_5_4b3_p = .v if (h_5_4b3_p == . | h_5_4b3_p == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_p = .v if (h_5_5b_p == . | h_5_5b_p == .a)
replace h_5_5b2_p = .v if (h_5_5b2_p == . | h_5_5b2_p == .a)
replace h_5_5b3_p = .v if (h_5_5b3_p == . | h_5_5b3_p == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_p = .v if (h_5_6b_p == . | h_5_6b_p == .a)
replace h_5_6b2_p = .v if (h_5_6b2_p == . | h_5_6b2_p == .a)
replace h_5_6b3_p = .v if (h_5_6b3_p == . | h_5_6b3_p == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_p = .v if (h_5_7b_p == . | h_5_7b_p == .a)
replace h_5_7b2_p = .v if (h_5_7b2_p == . | h_5_7b2_p == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_p = .v if (h_5_8b_p == . | h_5_8b_p == .a)
replace h_5_8b2_p = .v if (h_5_8b2_p == . | h_5_8b2_p == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_p = .v if (h_6_1a_p == . | h_6_1a_p == .a)
replace h_6_1b1_p = .v if (h_6_1b1_p == . | h_6_1b1_p == .a)
replace h_6_1b2_p = .v if (h_6_1b2_p == . | h_6_1b2_p == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_44_p = .v if (h_6_44_p == . | h_6_44_p == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_p = .v if (h_6_5a_p == . | h_6_5a_p == .a)
replace h_6_5b1_p = .v if (h_6_5b1_p == . | h_6_5b1_p == .a)
replace h_6_5b2_p = .v if (h_6_5b2_p == . | h_6_5b2_p == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_p = .v if (h_6_6a_p == . | h_6_6a_p == .a)
replace h_6_6b1_p = .v if (h_6_6b1_p == . | h_6_6b1_p == .a)
replace h_6_6b2_p = .v if (h_6_6b2_p == . | h_6_6b2_p == .a)
replace h_7_1_p_c = .v if (h_7_1_p_c == . | h_7_1_p_c == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)
replace h_3_2_d = .v if (h_3_2_d == . | h_3_2_d == .a)
replace h_3_3a_d = .v if (h_3_3a_d == . | h_3_3a_d == .a)
replace h_3_3b_d = .v if (h_3_3b_d == . | h_3_3b_d == .a)
replace h_3_3c_d = .v if (h_3_3c_d == . | h_3_3c_d == .a)
replace h_3_4_d = .v if (h_3_4_d == . | h_3_4_d == .a)
replace h_3_5a_d = .v if (h_3_5a_d == . | h_3_5a_d == .a)
replace h_3_5b_d = .v if (h_3_5b_d == . | h_3_5b_d == .a)
replace h_3_5c_d = .v if (h_3_5c_d == . | h_3_5c_d == .a)
replace h_3_6_d = .v if (h_3_6_d == . | h_3_6_d == .a)
replace h_3_7a_d = .v if (h_3_7a_d == . | h_3_7a_d == .a)
replace h_3_7b_d = .v if (h_3_7b_d == . | h_3_7b_d == .a)
replace h_3_7c_d = .v if (h_3_7c_d == . | h_3_7c_d == .a)
replace h_3_8 = .v if (h_3_8 == . | h_3_8 == .a)
replace h_3_9 = .v if (h_3_9 == . | h_3_9 == .a)
replace h_3_10 = .v if (h_3_10 == . | h_3_10 == .a)
replace h_3_11 = .v if (h_3_11 == . | h_3_11 == .a)
replace h_3_12 = .v if (h_3_12 == . | h_3_12 == .a)
replace h_3_14_1 = .v if (h_3_14_1 == . | h_3_14_1 == .a)
replace h_3_14_2 = .v if (h_3_14_2 == . | h_3_14_2 == .a)
replace h_3_14_3 = .v if (h_3_14_3 == . | h_3_14_3 == .a)
replace h_3_14_4 = .v if (h_3_14_4 == . | h_3_14_4 == .a)
replace h_3_14_5 = .v if (h_3_14_5 == . | h_3_14_5 == .a)
replace h_3_14_6 = .v if (h_3_14_6 == . | h_3_14_6 == .a)
replace h_3_14_7 = .v if (h_3_14_7 == . | h_3_14_7 == .a)
replace h_3_14_8 = .v if (h_3_14_8 == . | h_3_14_8 == .a)
replace h_3_14_9 = .v if (h_3_14_9 == . | h_3_14_9 == .a)
replace h_3_14_10 = .v if (h_3_14_10 == . | h_3_14_10 == .a)
replace h_3_14_11 = .v if (h_3_14_11 == . | h_3_14_11 == .a)
replace h_3_14_12 = .v if (h_3_14_12 == . | h_3_14_12 == .a)
replace h_3_15 = .v if (h_3_15 == . | h_3_15 == .a)
replace h_3_16_d = .v if (h_3_16_d == . | h_3_16_d == .a)
replace h_3_17a_d = .v if (h_3_17a_d == . | h_3_17a_d == .a)
replace h_3_17b_d = .v if (h_3_17b_d == . | h_3_17b_d == .a)
replace h_3_17c_d = .v if (h_3_17c_d == . | h_3_17c_d == .a)
replace h_3_18 = .v if (h_3_18 == . | h_3_18 == .a)
replace h_3_19_d = .v if (h_3_19_d == . | h_3_19_d == .a)
replace h_3_20a_d = .v if (h_3_20a_d == . | h_3_20a_d == .a)
replace h_3_20b_d = .v if (h_3_20b_d == . | h_3_20b_d == .a)
replace h_3_20c_d = .v if (h_3_20c_d == . | h_3_20c_d == .a)
replace h_3_21 = .v if (h_3_21 == . | h_3_21 == .a)
replace h_3_22_d = .v if (h_3_22_d == . | h_3_22_d == .a)
replace h_3_23a_d = .v if (h_3_23a_d == . | h_3_23a_d == .a)
replace h_3_23b_d = .v if (h_3_23b_d == . | h_3_23b_d == .a)
replace h_3_23c_d = .v if (h_3_23c_d == . | h_3_23c_d == .a)
replace h_3_24 = .v if (h_3_24 == . | h_3_24 == .a)
replace h_3_25_d = .v if (h_3_25_d == . | h_3_25_d == .a)
replace h_3_26a_d = .v if (h_3_26a_d == . | h_3_26a_d == .a)
replace h_3_26b_d = .v if (h_3_26b_d == . | h_3_26b_d == .a)
replace h_3_26c_d = .v if (h_3_26c_d == . | h_3_26c_d == .a)
replace h_3_27_d = .v if (h_3_27_d == . | h_3_27_d == .a)
replace h_3_28a_d = .v if (h_3_28a_d == . | h_3_28a_d == .a)
replace h_3_28b_d = .v if (h_3_28b_d == . | h_3_28b_d == .a)
replace h_3_28c_d = .v if (h_3_28c_d == . | h_3_28c_d == .a)
replace h_3_29 = .v if (h_3_29 == . | h_3_29 == .a)
replace h_3_30_d = .v if (h_3_30_d == . | h_3_30_d == .a)
replace h_3_31a_d = .v if (h_3_31a_d == . | h_3_31a_d == .a)
replace h_3_31b_d = .v if (h_3_31b_d == . | h_3_31b_d == .a)
replace h_3_31c_d = .v if (h_3_31c_d == . | h_3_31c_d == .a)
replace h_3_32_d = .v if (h_3_32_d == . | h_3_32_d == .a)
replace h_3_33a_d = .v if (h_3_33a_d == . | h_3_33a_d == .a)
replace h_3_33b_d = .v if (h_3_33b_d == . | h_3_33b_d == .a)
replace h_3_33c_d = .v if (h_3_33c_d == . | h_3_33c_d == .a)
replace h_3_34 = .v if (h_3_34 == . | h_3_34 == .a)
replace h_4_1 = .v if (h_4_1 == . | h_4_1 == .a)
replace h_4_1a = .v if (h_4_1a == . | h_4_1a == .a)
replace h_4_1b_d = .v if (h_4_1b_d == . | h_4_1b_d == .a)
replace h_4_1b2_d = .v if (h_4_1b2_d == . | h_4_1b2_d == .a)
replace h_4_1b3_d = .v if (h_4_1b3_d == . | h_4_1b3_d == .a)
replace h_4_2 = .v if (h_4_2 == . | h_4_2 == .a)
replace h_4_2a = .v if (h_4_2a == . | h_4_2a == .a)
replace h_4_2b_d = .v if (h_4_2b_d == . | h_4_2b_d == .a)
replace h_4_2b2_d = .v if (h_4_2b2_d == . | h_4_2b2_d == .a)
replace h_4_2b3_d = .v if (h_4_2b3_d == . | h_4_2b3_d == .a)
replace h_4_3 = .v if (h_4_3 == . | h_4_3 == .a)
replace h_4_3a = .v if (h_4_3a == . | h_4_3a == .a)
replace h_4_3b_d = .v if (h_4_3b_d == . | h_4_3b_d == .a)
replace h_4_3b2_d = .v if (h_4_3b2_d == . | h_4_3b2_d == .a)
replace h_4_3b3_d = .v if (h_4_3b3_d == . | h_4_3b3_d == .a)
replace h_4_4 = .v if (h_4_4 == . | h_4_4 == .a)
replace h_4_4a = .v if (h_4_4a == . | h_4_4a == .a)
replace h_4_4b_d = .v if (h_4_4b_d == . | h_4_4b_d == .a)
replace h_4_4b2_d = .v if (h_4_4b2_d == . | h_4_4b2_d == .a)
replace h_4_4b3_d = .v if (h_4_4b3_d == . | h_4_4b3_d == .a)
replace h_4_5 = .v if (h_4_5 == . | h_4_5 == .a)
replace h_4_5a = .v if (h_4_5a == . | h_4_5a == .a)
replace h_4_5b_d = .v if (h_4_5b_d == . | h_4_5b_d == .a)
replace h_4_5b2_d = .v if (h_4_5b2_d == . | h_4_5b2_d == .a)
replace h_4_5b3_d = .v if (h_4_5b3_d == . | h_4_5b3_d == .a)
replace h_4_6 = .v if (h_4_6 == . | h_4_6 == .a)
replace h_4_6a = .v if (h_4_6a == . | h_4_6a == .a)
replace h_4_6b_d = .v if (h_4_6b_d == . | h_4_6b_d == .a)
replace h_4_6b2_d = .v if (h_4_6b2_d == . | h_4_6b2_d == .a)
replace h_4_6b3_d = .v if (h_4_6b3_d == . | h_4_6b3_d == .a)
replace h_4_7 = .v if (h_4_7 == . | h_4_7 == .a)
replace h_4_7a = .v if (h_4_7a == . | h_4_7a == .a)
replace h_4_7b_d = .v if (h_4_7b_d == . | h_4_7b_d == .a)
replace h_4_7b2_d = .v if (h_4_7b2_d == . | h_4_7b2_d == .a)
replace h_4_8 = .v if (h_4_8 == . | h_4_8 == .a)
replace h_4_8a = .v if (h_4_8a == . | h_4_8a == .a)
replace h_4_8b_d = .v if (h_4_8b_d == . | h_4_8b_d == .a)
replace h_4_8b2_d = .v if (h_4_8b2_d == . | h_4_8b2_d == .a)
replace h_5 = .v if (h_5 == . | h_5 == .a)
replace h_5_1 = .v if (h_5_1 == . | h_5_1 == .a)
replace h_5_1a = .v if (h_5_1a == . | h_5_1a == .a)
replace h_5_1b_d = .v if (h_5_1b_d == . | h_5_1b_d == .a)
replace h_5_1b2_d = .v if (h_5_1b2_d == . | h_5_1b2_d == .a)
replace h_5_1b3_d = .v if (h_5_1b3_d == . | h_5_1b3_d == .a)
replace h_5_2 = .v if (h_5_2 == . | h_5_2 == .a)
replace h_5_2a = .v if (h_5_2a == . | h_5_2a == .a)
replace h_5_2b_d = .v if (h_5_2b_d == . | h_5_2b_d == .a)
replace h_5_2b2_d = .v if (h_5_2b2_d == . | h_5_2b2_d == .a)
replace h_5_2b3_d = .v if (h_5_2b3_d == . | h_5_2b3_d == .a)
replace h_5_3 = .v if (h_5_3 == . | h_5_3 == .a)
replace h_5_3a = .v if (h_5_3a == . | h_5_3a == .a)
replace h_5_3b_d = .v if (h_5_3b_d == . | h_5_3b_d == .a)
replace h_5_3b2_d = .v if (h_5_3b2_d == . | h_5_3b2_d == .a)
replace h_5_3b3_d = .v if (h_5_3b3_d == . | h_5_3b3_d == .a)
replace h_5_4 = .v if (h_5_4 == . | h_5_4 == .a)
replace h_5_4a = .v if (h_5_4a == . | h_5_4a == .a)
replace h_5_4b_d = .v if (h_5_4b_d == . | h_5_4b_d == .a)
replace h_5_4b2_d = .v if (h_5_4b2_d == . | h_5_4b2_d == .a)
replace h_5_4b3_d = .v if (h_5_4b3_d == . | h_5_4b3_d == .a)
replace h_5_5 = .v if (h_5_5 == . | h_5_5 == .a)
replace h_5_5a = .v if (h_5_5a == . | h_5_5a == .a)
replace h_5_5b_d = .v if (h_5_5b_d == . | h_5_5b_d == .a)
replace h_5_5b2_d = .v if (h_5_5b2_d == . | h_5_5b2_d == .a)
replace h_5_5b3_d = .v if (h_5_5b3_d == . | h_5_5b3_d == .a)
replace h_5_6 = .v if (h_5_6 == . | h_5_6 == .a)
replace h_5_6a = .v if (h_5_6a == . | h_5_6a == .a)
replace h_5_6b_d = .v if (h_5_6b_d == . | h_5_6b_d == .a)
replace h_5_6b2_d = .v if (h_5_6b2_d == . | h_5_6b2_d == .a)
replace h_5_6b3_d = .v if (h_5_6b3_d == . | h_5_6b3_d == .a)
replace h_5_7 = .v if (h_5_7 == . | h_5_7 == .a)
replace h_5_7a = .v if (h_5_7a == . | h_5_7a == .a)
replace h_5_7b_d = .v if (h_5_7b_d == . | h_5_7b_d == .a)
replace h_5_7b2_d = .v if (h_5_7b2_d == . | h_5_7b2_d == .a)
replace h_5_8 = .v if (h_5_8 == . | h_5_8 == .a)
replace h_5_8a = .v if (h_5_8a == . | h_5_8a == .a)
replace h_5_8b_d = .v if (h_5_8b_d == . | h_5_8b_d == .a)
replace h_5_8b2_d = .v if (h_5_8b2_d == . | h_5_8b2_d == .a)
replace h_6_1 = .v if (h_6_1 == . | h_6_1 == .a)
replace h_6_1a_d = .v if (h_6_1a_d == . | h_6_1a_d == .a)
replace h_6_1b1_d = .v if (h_6_1b1_d == . | h_6_1b1_d == .a)
replace h_6_1b2_d = .v if (h_6_1b2_d == . | h_6_1b2_d == .a)
replace h_6_2 = .v if (h_6_2 == . | h_6_2 == .a)
replace h_6_3 = .v if (h_6_3 == . | h_6_3 == .a)
replace h_6_41_d = .v if (h_6_41_d == . | h_6_41_d == .a)
replace h_6_42_d = .v if (h_6_42_d == . | h_6_42_d == .a)
replace h_6_43_d = .v if (h_6_43_d == . | h_6_43_d == .a)
replace h_6_5 = .v if (h_6_5 == . | h_6_5 == .a)
replace h_6_5a_d = .v if (h_6_5a_d == . | h_6_5a_d == .a)
replace h_6_5b1_d = .v if (h_6_5b1_d == . | h_6_5b1_d == .a)
replace h_6_5b2_d = .v if (h_6_5b2_d == . | h_6_5b2_d == .a)
replace h_6_6 = .v if (h_6_6 == . | h_6_6 == .a)
replace h_6_6a_d = .v if (h_6_6a_d == . | h_6_6a_d == .a)
replace h_6_6b1_d = .v if (h_6_6b1_d == . | h_6_6b1_d == .a)
replace h_6_6b2_d = .v if (h_6_6b2_d == . | h_6_6b2_d == .a)
replace h_7_1_d = .v if (h_7_1_d == . | h_7_1_d == .a)
replace h_7_2_1 = .v if (h_7_2_1 == . | h_7_2_1 == .a)
replace h_7_2_2 = .v if (h_7_2_2 == . | h_7_2_2 == .a)
replace h_7_2_3 = .v if (h_7_2_3 == . | h_7_2_3 == .a)
replace h_7_2_4 = .v if (h_7_2_4 == . | h_7_2_4 == .a)
replace h_7_2_5 = .v if (h_7_2_5 == . | h_7_2_5 == .a)


*questions that are not country specific are repeated, but that shouldn't affect anything



*h_6_41_d thru h_6_44_p are changed to .v if they did not have the proper country

replace h_6_41_d = .v if h_country ~= 1
replace h_6_42_d = .v if h_country ~= 1
replace h_6_43_d = .v if h_country ~= 1
replace h_6_44_p = .v if h_country ~= 0




*drop all uppercase variables

drop H_*
drop S_3_13
drop N10ENESTAVIVIENDATIENEN



*remove all variables not related to the country (0 == p , 1 == d , 2 == c)
if h_country == 0 {
	drop h_3_3a_d h_3_3a_c h_3_3b_d h_3_3b_c h_3_3c_d h_3_3c_c h_3_4_d h_3_4_c h_3_27_d h_3_27_c h_6_5a_d h_6_41_d h_3_5a_d h_3_5a_c h_3_5b_d h_3_5b_c h_3_5c_d h_3_5c_c h_3_6_d h_3_6_c h_3_31a_c h_3_31b_c h_3_31c_c h_3_7a_d h_3_7a_c h_3_7b_d h_3_7b_c h_3_7c_d h_3_7c_c h_3_16_d h_3_16_c h_3_31a_d h_3_31b_d h_3_31c_d h_3_17a_d h_3_17a_c h_3_17b_d h_3_17b_c h_3_17c_d h_3_17c_c  h_3_19_d h_3_19_c h_3_20a_d h_3_20a_c h_3_20b_d h_3_20b_c h_3_20c_d h_3_20c_c h_3_2_d h_3_2_c h_3_22_d h_3_22_c h_3_25_d h_3_25_c h_6_5a_d h_3_23a_d h_3_23a_c h_3_23b_d h_3_23b_c h_3_23c_d h_3_23c_c h_3_26a_d h_3_26a_c h_3_26b_d h_3_26b_c h_3_26c_d h_3_26c_c h_3_28a_d h_3_28a_c h_3_28b_d h_3_28b_c h_3_28c_d h_3_28c_c h_3_30_d h_3_30_c h_6_1a_d h_6_1a_c h_6_1b1_d h_6_1b1_c h_6_1b2_d h_6_1b2_c h_3_33a_d h_3_33b_d h_3_33c_d h_3_33a_c h_3_33b_c h_3_33c_c h_3_32_d h_3_32_c h_6_6a_d h_6_6a_c h_6_42_d h_6_43_d h_6_5b1_d h_6_5b2_d h_6_5b1_c h_6_5b2_c h_6_5a_c h_6_6b1_d h_6_6b1_c h_6_6b2_d h_6_6b2_c h_7_1_d h_4_1b_d h_4_1b2_d h_4_1b3_d h_4_2b_d h_4_2b2_d h_4_2b3_d h_4_3b_d h_4_3b2_d h_4_3b3_d h_4_4b_d h_4_4b2_d h_4_4b3_d h_4_5b_d h_4_5b2_d h_4_5b3_d h_4_6b_d h_4_6b2_d h_4_6b3_d h_4_7b_d h_4_7b2_d h_4_8b_d h_4_8b2_d   h_4_1b_c h_4_1b2_c h_4_1b3_c h_4_2b_c h_4_2b2_c h_4_2b3_c h_4_3b_c h_4_3b2_c h_4_3b3_c h_4_4b_c h_4_4b2_c h_4_4b3_c h_4_5b_c h_4_5b2_c h_4_5b3_c h_4_6b_c h_4_6b2_c h_4_6b3_c h_4_7b_c h_4_7b2_c h_4_8b_c h_4_8b2_c h_5_1b_d h_5_1b2_d h_5_1b3_d h_5_2b_d h_5_2b2_d h_5_2b3_d h_5_3b_d h_5_3b2_d h_5_3b3_d h_5_4b_d h_5_4b2_d h_5_4b3_d h_5_5b_d h_5_5b2_d h_5_5b3_d h_5_6b_d h_5_6b2_d h_5_6b3_d h_5_7b_d h_5_7b2_d h_5_8b_d h_5_8b2_d h_5_1b_c h_5_1b2_c h_5_1b3_c h_5_2b_c h_5_2b2_c h_5_2b3_c h_5_3b_c h_5_3b2_c h_5_3b3_c h_5_4b_c h_5_4b2_c h_5_4b3_c h_5_5b_c h_5_5b2_c h_5_5b3_c h_5_6b_c h_5_6b2_c h_5_6b3_c h_5_7b_c h_5_7b2_c h_5_8b_c h_5_8b2_c
}
if h_country == 1 {
	drop h_3_3a_p h_3_3a_c h_3_3b_p h_3_3b_c h_3_3c_p h_3_3c_c h_3_4_p h_3_4_c h_3_27_p h_3_27_c h_6_6a_p h_6_44_p h_3_5a_p h_3_5a_c h_3_5b_p h_3_5b_c h_3_5c_p h_3_5c_c h_3_6_p h_3_6_c h_3_7a_p h_3_7a_c h_3_7b_p h_3_7b_c h_3_7c_p h_3_7c_c h_3_16_p h_3_16_c h_3_2_p h_3_2_c h_3_26a_p h_3_26a_c h_3_26b_p h_3_26b_c h_3_26c_p h_3_26c_c h_3_17a_p h_3_17a_c h_3_17b_p h_3_17b_c h_3_17c_p h_3_22_p h_3_22_c h_3_31a_p h_3_31b_p h_3_31c_p h_3_17c_c h_3_19_p h_3_19_c h_3_20a_p h_3_20a_c h_3_20b_p h_3_20b_c h_3_20c_p h_3_20c_c h_6_6a_c h_3_23a_p h_3_23a_c h_3_23b_p h_3_23b_c h_3_23c_p h_3_23c_c h_3_25_p h_3_25_c h_3_30_p h_3_30_c h_7_1_p_c h_3_28a_p h_3_28a_c h_3_28b_p h_3_28b_c h_3_28c_p h_3_28c_c h_3_31a_c h_3_31b_c h_3_31c_c h_6_5a_p h_3_33a_p h_3_33b_p h_3_33c_p h_3_33a_c h_3_33b_c h_3_33c_c h_3_32_p h_3_32_c h_6_1a_p h_6_1a_c h_6_5a_c h_6_5b1_p h_6_5b2_p h_6_5b1_c h_6_5b2_c h_6_1b1_p h_6_1b2_p h_6_1b1_c h_6_1b2_c h_6_6b1_p h_6_6b2_p h_6_6b1_c h_6_6b2_c h_4_2b_c h_4_2b2_c h_4_2b3_c h_4_3b_c h_4_3b2_c h_4_3b3_c h_4_4b_c h_4_4b2_c h_4_4b3_c h_4_5b_c h_4_5b2_c h_4_5b3_c h_4_6b_c h_4_6b2_c h_4_6b3_c h_4_7b_c h_4_7b2_c h_4_8b_c h_4_8b2_c h_4_2b_p h_4_2b2_p h_4_2b3_p h_4_3b_p h_4_3b2_p h_4_3b3_p h_4_4b_p h_4_4b2_p h_4_4b3_p h_4_5b_p h_4_5b2_p h_4_5b3_p h_4_6b_p h_4_6b2_p h_4_6b3_p h_4_7b_p h_4_7b2_p h_4_8b_p h_4_8b2_p h_5_1b_p h_5_1b2_p h_5_1b3_p h_5_2b_p h_5_2b2_p h_5_2b3_p h_5_3b_p h_5_3b2_p h_5_3b3_p h_5_4b_p h_5_4b2_p h_5_4b3_p h_5_5b_p h_5_5b2_p h_5_5b3_p h_5_6b_p h_5_6b2_p h_5_6b3_p h_5_7b_p h_5_7b2_p h_5_8b_p h_5_8b2_p h_5_1b_c h_5_1b2_c h_5_1b3_c h_5_2b_c h_5_2b2_c h_5_2b3_c h_5_3b_c h_5_3b2_c h_5_3b3_c h_5_4b_c h_5_4b2_c h_5_4b3_c h_5_5b_c h_5_5b2_c h_5_5b3_c h_5_6b_c h_5_6b2_c h_5_6b3_c h_5_7b_c h_5_7b2_c h_5_8b_c h_5_8b2_c
}
if h_country == 2 {
	drop h_3_19_p h_4_1b_p h_4_1b2_p h_4_1b3_p h_4_1b_d h_4_1b2_d h_4_1b3_d h_6_6a_p h_6_44_p h_3_3a_p h_3_3a_d h_3_3b_p h_3_3b_d h_3_3c_p h_3_3c_d h_3_4_p h_3_4_d h_3_5a_p h_6_6a_d h_3_16_d h_3_5a_d h_3_5b_p h_3_5b_d h_3_5c_p h_3_5c_d h_3_6_p h_3_6_d h_3_2_p h_3_2_d h_6_1a_p h_6_1a_d h_3_7a_p h_3_7a_d h_3_7b_p h_3_7b_d h_3_7c_p h_3_7c_d h_3_22_p h_3_22_d h_3_27_p h_3_27_d h_3_16_p h_3_17a_d h_3_17a_p h_3_17b_d h_3_17b_p h_3_17c_d h_3_17c_p h_3_19_d h_6_42_d h_6_43_d h_3_20a_p h_3_20a_d h_3_20b_p h_3_20b_d h_3_20c_p h_3_20c_d h_3_3a_p h_6_5a_p h_6_5a_d h_3_3a_d h_3_3b_p h_3_3b_d h_3_3c_p h_3_3c_d h_3_4_p h_3_4_d h_3_26a_d h_3_26a_p h_3_26b_d h_3_26b_p h_3_26c_d h_3_26c_p h_3_5a_p h_3_5a_d h_3_5b_p h_3_5b_d h_3_5c_p h_3_5c_d h_3_6_p h_3_6_d h_3_33a_d h_3_33b_d h_3_33c_d h_3_7a_p h_3_7a_d h_3_7b_p h_3_7b_d h_3_7c_p h_3_7c_d h_3_31a_p h_3_31b_p h_3_31c_p h_7_1_d h_3_17a_d h_3_17a_p h_3_17b_d h_3_17b_p h_3_16_p h_3_30_p h_3_30_d h_3_33a_p h_3_33b_p h_3_33c_p h_3_17c_d h_3_17c_p h_3_19_d h_3_20a_p h_3_20a_d h_3_20b_p h_3_20b_d h_3_20c_p h_3_20c_d h_3_23a_p h_3_23a_d h_3_23b_p h_3_23b_d h_3_23c_p h_3_23c_d h_3_25_p h_3_25_d h_3_32_d h_3_32_p h_3_28a_d h_3_28a_p h_3_28b_d h_3_28b_p h_3_28c_d h_3_28c_p h_3_31a_d h_3_31b_d h_3_31c_d h_6_5b1_d h_6_5b2_d h_6_5b1_p h_6_5b2_p h_6_1b1_p h_6_1b2_p h_6_1b1_d h_6_1b2_d h_6_6b1_p h_6_6b2_p h_6_6b1_d h_6_6b2_d h_4_2b_d h_4_2b2_d h_4_2b3_d h_4_3b_d h_4_3b2_d h_4_3b3_d h_4_4b_d h_4_4b2_d h_4_4b3_d h_4_5b_d h_4_5b2_d h_4_5b3_d h_4_6b_d h_4_6b2_d h_4_6b3_d h_4_7b_d h_4_7b2_d h_4_8b_d h_4_8b2_d h_4_2b_p h_4_2b2_p h_4_2b3_p h_4_3b_p h_4_3b2_p h_4_3b3_p h_4_4b_p h_4_4b2_p h_4_4b3_p h_4_5b_p h_4_5b2_p h_4_5b3_p h_4_6b_p h_4_6b2_p h_4_6b3_p h_4_7b_p h_4_7b2_p h_4_8b_p h_4_8b2_p h_5_1b_d h_5_1b2_d h_5_1b3_d h_5_2b_d h_5_2b2_d h_5_2b3_d h_5_3b_d h_5_3b2_d h_5_3b3_d h_5_4b_d h_5_4b2_d h_5_4b3_d h_5_5b_d h_5_5b2_d h_5_5b3_d h_5_6b_d h_5_6b2_d h_5_6b3_d h_5_7b_d h_5_7b2_d h_5_8b_d h_5_8b2_d h_5_1b_p h_5_1b2_p h_5_1b3_p h_5_2b_p h_5_2b2_p h_5_2b3_p h_5_3b_p h_5_3b2_p h_5_3b3_p h_5_4b_p h_5_4b2_p h_5_4b3_p h_5_5b_p h_5_5b2_p h_5_5b3_p h_5_6b_p h_5_6b2_p h_5_6b3_p h_5_7b_p h_5_7b2_p h_5_8b_p h_5_8b2_p
}





*COUNTS NUMBER OF .i IN EACH OBSERVATION UNDER NEW VARIABLE CALLED h_countmissing
local i 1
gen h_countmissing = 0

quietly ds h_countmissing hhid h_date fkey globalrecordid v1 h_deviceid2, not
capture quietly ds h_date_end h_time_end_1 h_time_end h_time1, not
local allvar `r(varlist)'


foreach v in `allvar' {
	local allvarR `v' `allvarR'
	}




quietly forvalues i = 1(1) `=_N' {
	foreach v of local allvarR {
		capture confirm str var `v'
		if _rc == 0 {
			if `v'[`i'] == ".i" {
				replace h_countmissing = h_countmissing[`i'] + 1 in `i'
			}
			else {
			}
		}
		else {
			if `v'[`i'] == .i {
				replace h_countmissing = h_countmissing[`i'] + 1 in `i'
			}
			else{
			}
		}
	}
}






*SHOWS LAST QUESTION ANSWERED FOR EACH OBSERVATION UNDER NEW VARIABLE CALLED h_last
local i 1
gen h_last = "AllAnswered"

quietly ds h_last h_countmissing hhid h_date fkey globalrecordid v1 h_deviceid2, not
capture quietly ds h_date_end h_time_end_1 h_time_end h_time1, not
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
				replace h_last = "`v'" in `i'
				continue, break
			}
		}
		else {
			if (`v'[`i'] == .i | `v'[`i'] == .v) {
				continue
			}
			else{
				replace h_last = "`v'" in `i'
				continue, break
			}
		}
	}
}


*For now, I'm removing this
*gen h_TotalTime = (Clock(h_time2, "MDYhms") - Clock(h_time1, "MDYhms"))/1000/60


capture log close
log using logs/HouseholdMissingCodebook, text replace

codebook

log close

 save Household.dta, replace
clear all
