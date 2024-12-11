clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out"
}
else if `country' == 1 {
    cd "`path'/DR_out"
}
else if `country' == 2 {
    cd "`path'/CUBA_out"
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
}

if `country' == 0 {
    import excel "../PR_in/Resumen de Entrevistas.xlsx", clear firstrow cellrange(A2:K200)
	keep Cluster Casa Participante Notas
	missings dropobs, force





	gen c_country = `country'
	gen c_country_str = string(c_country, "%12.0f")

	replace Cluster = Cluster*10 if Cluster < 1
	gen Cluster_str = string(Cluster, "%12.0f")
	replace Cluster_str = cond(strlen(Cluster_str) == 1, "0" + Cluster_str, Cluster_str)

	replace Casa = Casa*10 if Casa < 1
	gen Casa_str = string(Casa, "%03.0f")
	replace Casa_str = cond(strlen(Casa_str) == 1, "00" + Casa_str, Casa_str)
	replace Casa_str = cond(strlen(Casa_str) == 2, "0" + Casa_str, Casa_str)

	replace Participante = Participante*10 if Participante < 1
	gen Participante_str = string(Participante, "%12.0f")
	replace Participante_str = cond(strlen(Participante_str) == 1, "0" + Participante_str, Participante_str)


	gen pid = c_country_str + Cluster_str + Casa_str + Participante_str
	gen hhid = c_country_str + Cluster_str + Casa_str
	keep pid Notas


sort pid Notas
quietly by pid Notas:  gen dup = cond(_N==1,0,_n)
drop if dup>1
drop dup
}

if `country' == 0 {
    save "../PR_in/Resumen_PIDs.dta", replace
}
/*
else if `country' == 1 {
    save "../DR_in/Resumen_PIDs.dta", replace
}
else if `country' == 2 {
    save "../CUBA_in/Resumen_PIDs.dta", replace
}
*/
exit, clear
