clear all
set more off
capture log close

*next, I want to find out if we have the right amount of cog scoring and cog surveys

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/PR_out/translation_PR"
}
else if `country' == 1 {
    cd "`path'/DR_out/translation_DR"
}
else if `country' == 2 {
    cd "`path'/CUBA_out/translation_CUBA"
}

if `country' == 0 {
    use using "../Cog_Scoring.dta"
}
else if `country' == 1 {
    use using "../Cog_Scoring.dta"
}
else if `country' == 2 {
    use using "../Cog_Scoring.dta"
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translation_PR"
}
else if `country' == 1 {
    cd "`path'/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}

if `country' == 0 {
    use using "../PR_out/Cog_Scoring.dta"
}
else if `country' == 1 {
    use using "../DR_out/Cog_Scoring.dta"
}
else if `country' == 2 {
    use using "../CUBA_out/Cog_Scoring.dta"
}
}

label variable cs_interid "INTERVIEWER"

label variable cs_houseid "HOUSE"

label variable cs_clustid "CLUSTER:"

label variable cs_particid "PARTICIPANT"

label variable cs_country "Country"

label variable cs_houseid2 "HOUSE"

label variable cs_conglid2 "CLUSTER:"

label variable cs_particid2 "PARTICIPANT"

label variable cs_32 "32. Drawing pentagons (0-1)"

label variable cs_40 "40.# Animals acceptable (excluding repetitions)"

label variable cs_41 "41.# Repetitions"

label variable cs_43 "43. Correct"

label variable cs_44 "44. Incorrect"

label variable cs_72_1 "72.1. Circle (0-2)"

label variable cs_72_2 "72.2. Diamond (0-3)"

label variable cs_72_3 "72.3. Crossed Rectangles (0-2)"

label variable cs_72_4 "72.4. Cube (0-4)"

label variable cs_79_1 "79.1. Circle (0-2)"

label variable cs_79_2 "79.2. Diamond (0-3)"

label variable cs_79_3 "79.3. Crossed Rectangles (0-2)"

label variable cs_79_4 "79.4. Cube (0-4)"

save Cog_Scoring.dta, replace

clear all
