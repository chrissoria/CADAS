clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\\Users\\Ty\\Desktop\\CADAS Data do files\\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

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
    import excel using "../PR_in/Resumen de Entrevistas.xlsx", firstrow clear
    *drop N-Z
    keep if strpos(lower(NotasCuestionariosnohechos), "complete") > 0
    keep Cluster Casa Participante GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos
    rename (Casa GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos) ///
           (House_ID sex age Fecha Notas)
    drop if missing(Cluster, House_ID, Participante, sex, age, Fecha, Notas)
}
else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas.xlsx", firstrow
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    rename NotasCuestionariosnohechos Notas
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
    import excel using "../PR_in/Resumen de Entrevistas.xlsx", firstrow clear
    *drop N-Z
    keep if strpos(lower(NotasCuestionariosnohechos), "complete") > 0
    keep Cluster Casa Participante GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos
    rename (Casa GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos) ///
           (House_ID sex age Fecha Notas)
    drop if missing(Cluster, House_ID, Participante, sex, age, Fecha, Notas)
}
else if `country' == 1 {
    import excel using "../DR_in/Resumen de entrevistas.xlsx", firstrow
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    rename NotasCuestionariosnohechos Notas
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
	replace sex = "0" if strpos(sex, "hombre") > 0 | strpos(sex, "male") > 0 | sex == "m"
	replace sex = "1" if strpos(sex, "mujer") > 0 | strpos(sex, "female") > 0 | sex == "f"
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

duplicates drop pid, force

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
