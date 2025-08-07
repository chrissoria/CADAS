clear all 
set more off
capture log close

cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"

import excel "../DR_in/Relacion participante Proxy.xlsx", firstrow

gen c_country = 1
gen c_country_str = string(c_country, "%12.0f")

replace Cluster = Cluster*10 if Cluster < 1
gen Cluster_str = string(Cluster, "%12.0f")
replace Cluster_str = cond(strlen(Cluster_str) == 1, "0" + Cluster_str, Cluster_str)

replace HouseID = HouseID*10 if HouseID < 1
gen HouseID_str = string(HouseID, "%03.0f")
replace HouseID_str = cond(strlen(HouseID_str) == 1, "00" + HouseID_str, HouseID_str)
replace HouseID_str = cond(strlen(HouseID_str) == 2, "0" + HouseID_str, HouseID_str)

replace Participante = Participante*10 if Participante < 1
gen Participante_str = string(Participante, "%12.0f")
replace Participante_str = cond(strlen(Participante_str) == 1, "0" + Participante_str, Participante_str)


gen pid = c_country_str + Cluster_str + HouseID_str + Participante_str
gen hhid = c_country_str + Cluster_str + HouseID_str
drop Cluster_str HouseID_str Participante_str
drop in 20/l

merge 1:m pid using Cog.dta
drop in 20/l

keep Cluster HouseID Participante pid g_1_file g_2_file g_2_file2 g_3_file g_3_file2

export excel using "excel/audio_no_consent.xlsx", replace firstrow(variables)

*use Cog.dta
