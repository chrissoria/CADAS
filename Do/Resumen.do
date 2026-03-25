clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\\Users\\Ty\\Desktop\\CADAS Data do files\\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
if "$country" != "" {
    local country = $country
}

if `country' == 0 {
    cd "`path'/PR_out"
    local temp_dir "../PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_out"
    local temp_dir "../DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
    local temp_dir "../CUBA_in"
}

****************************************
* IMPORT RESUMEN DE ENTREVISTAS
****************************************

if `country' == 0 {
    import excel using "../PR_in/Auditoria de entrevistas CADAS.xlsx", firstrow clear
    * Drop rows after the data section (row 838+ is blank/notes)
    gen _row = _n
    drop if _row > 837
    drop _row
    keep Cluster Casa Participante Gender Age Fechadeentrevista
    rename (Casa Gender Age Fechadeentrevista) ///
           (House_ID sex age Fecha)
    gen Notas = "complete"
    * Extract leading numbers from ID fields (some have appended notes)
    foreach var in Cluster House_ID Participante {
        replace `var' = regexs(0) if regexm(`var', "^[0-9\.]+")
    }
    destring Cluster, replace force
    destring House_ID, replace force
    destring Participante, replace force
    replace Cluster = round(Cluster)
    replace House_ID = round(House_ID)
    replace Participante = round(Participante)
    drop if missing(Cluster, House_ID, Participante)
}
else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas ralizadas junio -2023 hasta agosto 2025. Act. 10-3-2026.xlsx", firstrow clear
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    * New file has no Notas column; generate placeholder for downstream compatibility
    gen Notas = "complete"
    * Manual fix: Participante entered as ",1" instead of "1"
    replace Participante = "1" if Cluster == 54 & House_ID == "86" & Participante == ",1"

    * === DUPLICATE FIXES (disregarded — new Excel already has corrected PIDs) ===
    * gen excel_row = _n + 1
    * --- Delete duplicate rows (Eliminar) ---
    * drop if inlist(excel_row, 22, 92, 701, 699, 700, 643, 644, 647)
    * drop if inlist(excel_row, 645, 646, 693, 689, 634, 640, 639, 686)
    * drop if inlist(excel_row, 220, 253, 383, 661, 688)
    * Ambiguous duplicates (no comment on either row) — drop later copy
    * drop if inlist(excel_row, 692, 687)
    * Exact duplicates (same sex & age) in new file — drop later copy
    * drop if inlist(excel_row, 28, 29, 73)
    * --- Fix wrong participant IDs ---
    * replace Participante = "2" if excel_row == 456
    * replace Participante = "1" if excel_row == 745
    * replace Participante = "2" if excel_row == 958
    * replace Participante = "1" if excel_row == 976
    * replace Participante = "55" if excel_row == 614
    * replace Participante = "2" if excel_row == 467 & Cluster == 28
    * replace Participante = "1" if excel_row == 741 & Cluster == 45
    * replace Participante = "2" if excel_row == 1371 & Cluster == 75
    * replace Participante = "1" if excel_row == 652
    * replace Participante = "1" if excel_row == 651
    * replace Participante = "2" if excel_row == 113
    * replace Participante = "2" if excel_row == 828
    * replace Participante = "2" if excel_row == 391
    * drop excel_row

    * Clean ID fields: extract leading numbers, strip trailing characters (e.g. "20-" -> 20)
    foreach var in Cluster House_ID Participante {
        capture confirm numeric variable `var'
        if _rc != 0 {
            replace `var' = regexs(0) if regexm(`var', "^[0-9]+")
        }
        destring `var', replace force
        replace `var' = round(`var')
    }

    * === DUPLICATE PID FIXES (age may be string from Excel, use real() for comparison) ===
    * PID 12800701: two rows (F/71, F/72). Socio confirms part 1 = woman. F/71 is participant 2.
    replace Participante = 2 if Cluster == 28 & House_ID == 7 & Participante == 1 & real(age) == 71
    * PID 14502702: two rows (M/64, F/65). Socio confirms part 2 = woman, part 1 = man. M/64 is participant 1.
    replace Participante = 1 if Cluster == 45 & House_ID == 27 & Participante == 2 & real(age) == 64
    * PID 17507001: two rows (M/80, F/74). Socio confirms part 1 = man. F/74 is participant 2.
    replace Participante = 2 if Cluster == 75 & House_ID == 70 & Participante == 1 & real(age) == 74
    * PID 10217901 (Cluster 2, Casa 179): 4 entries — M/66 (part 1), F/65 (part 2),
    * plus two duplicates (F/65 repeated, F/66 with part 1). Socio: part 1 = man, part 2 = woman.
    * TODO: keep only M/66 as part 1 and F/65 as part 2, drop the two duplicate entries.

    drop if missing(Cluster) | missing(House_ID) | missing(Participante)
}
else if `country' == 2 {
    import excel using "../CUBA_in/Resumen de entrevistas.xlsx", firstrow
    rename Sexo1Hombre2Mujer sex
rename Edad age
rename Fechacompleto Fecha
rename Casa House_ID1
rename Porque1nohubo2rehuso Notas

destring Participante, replace
rename Completo1si2no Completo

destring Completo, replace
destring Cluster, replace
destring House_ID1, replace
}

}

else if `"`user'"' == "Ty" {
local path = "C:\\Users\\Ty\\Desktop\\Stata_CADAS\\DATA"
include "C:\\Users\\Ty\\Desktop\\CADAS Data do files\\CADAS_country_define.do"
if "$country" != "" {
    local country = $country
}

if `country' == 0 {
    cd "`path'/PR_out"
    local temp_dir "../PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_out"
    local temp_dir "../DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
    local temp_dir "../CUBA_in"
}

****************************************
* IMPORT RESUMEN DE ENTREVISTAS
****************************************

if `country' == 0 {
    import excel using "../PR_in/Auditoria de entrevistas CADAS.xlsx", firstrow clear
    * Drop rows after the data section (row 838+ is blank/notes)
    gen _row = _n
    drop if _row > 837
    drop _row
    keep Cluster Casa Participante Gender Age Fechadeentrevista
    rename (Casa Gender Age Fechadeentrevista) ///
           (House_ID sex age Fecha)
    gen Notas = "complete"
    * Extract leading numbers from ID fields (some have appended notes)
    foreach var in Cluster House_ID Participante {
        replace `var' = regexs(0) if regexm(`var', "^[0-9\.]+")
    }
    destring Cluster, replace force
    destring House_ID, replace force
    destring Participante, replace force
    replace Cluster = round(Cluster)
    replace House_ID = round(House_ID)
    replace Participante = round(Participante)
    drop if missing(Cluster, House_ID, Participante)
}
else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas ralizadas junio -2023 hasta agosto 2025. Act. 10-3-2026.xlsx", firstrow clear
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    * New file has no Notas column; generate placeholder for downstream compatibility
    gen Notas = "complete"
    * Manual fix: Participante entered as ",1" instead of "1"
    replace Participante = "1" if Cluster == 54 & House_ID == "86" & Participante == ",1"

    * === DUPLICATE FIXES (disregarded — new Excel already has corrected PIDs) ===
    * gen excel_row = _n + 1
    * --- Delete duplicate rows (Eliminar) ---
    * drop if inlist(excel_row, 22, 92, 701, 699, 700, 643, 644, 647)
    * drop if inlist(excel_row, 645, 646, 693, 689, 634, 640, 639, 686)
    * drop if inlist(excel_row, 220, 253, 383, 661, 688)
    * Ambiguous duplicates (no comment on either row) — drop later copy
    * drop if inlist(excel_row, 692, 687)
    * Exact duplicates (same sex & age) in new file — drop later copy
    * drop if inlist(excel_row, 28, 29, 73)
    * --- Fix wrong participant IDs ---
    * replace Participante = "2" if excel_row == 456
    * replace Participante = "1" if excel_row == 745
    * replace Participante = "2" if excel_row == 958
    * replace Participante = "1" if excel_row == 976
    * replace Participante = "55" if excel_row == 614
    * replace Participante = "2" if excel_row == 467 & Cluster == 28
    * replace Participante = "1" if excel_row == 741 & Cluster == 45
    * replace Participante = "2" if excel_row == 1371 & Cluster == 75
    * replace Participante = "1" if excel_row == 652
    * replace Participante = "1" if excel_row == 651
    * replace Participante = "2" if excel_row == 113
    * replace Participante = "2" if excel_row == 828
    * replace Participante = "2" if excel_row == 391
    * drop excel_row

    * Clean ID fields: extract leading numbers, strip trailing characters (e.g. "20-" -> 20)
    foreach var in Cluster House_ID Participante {
        capture confirm numeric variable `var'
        if _rc != 0 {
            replace `var' = regexs(0) if regexm(`var', "^[0-9]+")
        }
        destring `var', replace force
        replace `var' = round(`var')
    }

    * === DUPLICATE PID FIXES (age may be string from Excel, use real() for comparison) ===
    * PID 12800701: two rows (F/71, F/72). Socio confirms part 1 = woman. F/71 is participant 2.
    replace Participante = 2 if Cluster == 28 & House_ID == 7 & Participante == 1 & real(age) == 71
    * PID 14502702: two rows (M/64, F/65). Socio confirms part 2 = woman, part 1 = man. M/64 is participant 1.
    replace Participante = 1 if Cluster == 45 & House_ID == 27 & Participante == 2 & real(age) == 64
    * PID 17507001: two rows (M/80, F/74). Socio confirms part 1 = man. F/74 is participant 2.
    replace Participante = 2 if Cluster == 75 & House_ID == 70 & Participante == 1 & real(age) == 74
    * PID 10217901 (Cluster 2, Casa 179): 4 entries — M/66 (part 1), F/65 (part 2),
    * plus two duplicates (F/65 repeated, F/66 with part 1). Socio: part 1 = man, part 2 = woman.
    * TODO: keep only M/66 as part 1 and F/65 as part 2, drop the two duplicate entries.

    drop if missing(Cluster) | missing(House_ID) | missing(Participante)
}
else if `country' == 2 {
    import excel using "../CUBA_in/Resumen de entrevistas.xlsx", firstrow
    rename Sexo1Hombre2Mujer sex
rename Edad age
rename Fechacompleto Fecha
rename Casa House_ID1
rename Porque1nohubo2rehuso Notas

destring Participante, replace
rename Completo1si2no Completo

destring Completo, replace
destring Cluster, replace
destring House_ID1, replace
}

}

****************************************
* STANDARDIZE VARIABLES
****************************************

* Standardize sex to numeric 0=Hombre/Male/M, 1=Mujer/Female/F
capture confirm numeric variable sex
if _rc != 0 {
	replace sex = lower(trim(sex))
	replace sex = "1" if strpos(sex, "mujer") > 0 | strpos(sex, "female") > 0 | sex == "f"
	replace sex = "0" if strpos(sex, "hombre") > 0 | strpos(sex, "male") > 0 | sex == "m"
	destring sex, replace force
}
* If sex was 1/2 (e.g. from Cuba), shift to 0/1
capture sum sex
if _rc == 0 {
	if r(max) == 2 {
		replace sex = sex - 1
	}
}

gen pais = `country'

*drop if missing(Cluster)

****************************************
* CREATE STANDARDIZED PIDs
****************************************

gen country_str = string(pais, "%12.0f")

if `country' != 2 {
* Convert to string if not already
capture confirm numeric variable Cluster
if _rc == 0 {
    tostring Cluster, replace
}
capture confirm numeric variable House_ID
if _rc == 0 {
    tostring House_ID, replace
}
capture confirm numeric variable Participante
if _rc == 0 {
    tostring Participante, replace
}

* Now all variables are strings, format them with leading zeros
gen Cluster_str = Cluster
replace Cluster_str = "0" + Cluster_str if strlen(Cluster_str) == 1

gen House_ID_str = House_ID
replace House_ID_str = "00" + House_ID_str if strlen(House_ID_str) == 1
replace House_ID_str = "0" + House_ID_str if strlen(House_ID_str) == 2

gen Participante_str = Participante
replace Participante_str = "0" + Participante_str if strlen(Participante_str) == 1

gen pid = country_str + Cluster_str + House_ID_str + Participante_str
gen hhid = country_str + Cluster_str + House_ID_str
drop country_str Cluster_str House_ID_str Participante_str
}

else if `country' == 2 {
	rename Cluster cluster_real
	tostring cluster_real, generate(Cluster) format(%12.0g)
replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)
gen House_ID = string(House_ID1)
replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)
	rename Participante Participante1
gen Participante = string(Participante1)
replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)

gen pid = country_str + Cluster + House_ID + Participante
gen hhid = country_str + Cluster + House_ID
drop country_str
}

duplicates report pid
duplicates drop pid, force

* Export only duplicate PIDs for review
preserve
duplicates tag pid, gen(dup)
keep if dup > 0
drop dup
sort pid
if _N > 0 {
    export excel using "duplicates/resumen_duplicates.xlsx", replace firstrow(variables)
}
restore

capture drop H I

save resumen.dta, replace
export excel using "excel/resumen.xlsx", replace firstrow(variables)

* Create resumen_hhid.dta for household merges
preserve
keep hhid
duplicates drop hhid, force
save resumen_hhid.dta, replace
restore

****************************************
* FINAL CLEANUP AND SAVE
****************************************

keep pid age sex House_ID Cluster
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid

gen pid_en_resumen=1 
drop pidr duplic
sum

tostring pid, replace

save "`temp_dir'/temp_Resumen.dta", replace

display "Resumen processing complete. Output saved to: `temp_dir'/temp_Resumen.dta"
