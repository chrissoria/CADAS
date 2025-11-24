clear all 
set more off
capture log close

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

local country = 1

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
}

cd "`path'/DR_out"
import excel using "../DR_in/UPM CADAS RD.xlsx", firstrow cellrange(A3) clear

* rename UPM to Cluster
capture rename UPM Cluster
capture rename upm Cluster
capture rename Upm Cluster

* label the Cluster variable
label variable Cluster "UPM/Cluster identifier"

* keep only relevant variables
keep Cluster PROVINCIA_NOMBRE PROVINCIA_CODIGO ZONA_NOMBRE ZONA_CODIGO LATITUD LONGITUD VIVIENDASOCUPADAS PERSONASDE65Y

* rename variables with Cluster_ prefix and make more descriptive
rename PROVINCIA_NOMBRE Cluster_Province_Name
rename PROVINCIA_CODIGO Cluster_Province_Code
rename ZONA_NOMBRE Cluster_Zone_Name
rename ZONA_CODIGO Cluster_Zone_Code
rename LATITUD Cluster_Latitude
rename LONGITUD Cluster_Longitude
rename VIVIENDASOCUPADAS Cluster_Occupied_Dwellings
rename PERSONASDE65Y Cluster_Persons_65Plus

* to resolve the duplicate 24 cluster
generate str20 Cluster_Latitude_str = string(Cluster_Latitude, "%12.6f")
replace Cluster = 26 if Cluster_Latitude_str == "-68.971309"
drop Cluster_Latitude_str

* labels
label variable Cluster_Province_Name "Province name where cluster is located"
label variable Cluster_Province_Code "Province code"
label variable Cluster_Zone_Name "Zone name (urban/rural classification)"
label variable Cluster_Zone_Code "Zone code (urban/rural)"
label variable Cluster_Latitude "Cluster latitude coordinate"
label variable Cluster_Longitude "Cluster longitude coordinate"
label variable Cluster_Occupied_Dwellings "Number of occupied dwellings in cluster"
label variable Cluster_Persons_65Plus "Number of persons aged 65 and older in cluster"

duplicates drop Cluster, force

keep if Cluster != .
save UPM_CADAS_RD.dta, replace

exit, clear
