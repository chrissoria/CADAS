clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

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
    use using "../PR_out/door_merged_all.dta"
}
else if `country' == 1 {
    use using "../DR_out/door_merged_all.dta"
}
else if `country' == 2 {
    use using "../CUBA_out/door_merged_all.dta"
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
    use using "../PR_out/door_merged_all.dta"
}
else if `country' == 1 {
    use using "../DR_out/door_merged_all.dta"
}
else if `country' == 2 {
    use using "../CUBA_out/door_merged_all.dta"
}
}

label drop _all

label variable d_1 "Relation to the household"

label variable d_2 "2. Number of people aged <= 15"

label variable d_3 "3. Number of people aged 16-39"

label variable d_4 "4. Number of people aged 40-64"

label variable d_5 "5. Number of men aged >= 65"

label variable d_6 "6. Number of women aged >= 65"

label variable d_0 "Were you able to do the door knocking interview?"

label variable d_15 "15. What was the reason you could not do the door-knock interview? [Mark the first answer that applies]"

label define D_0 .a"." 0 "no"1 "yes"

label values d_0 D_0

recode d_1 (0=1) (1=2) (2=3) (3=8) (4=9)

label define D_1 .a"." 1 "household member"2 "neighbor"3 "other"8 "no response"9 "does not know"

label values d_1 D_1

label define D_15 .a"." 0 "house is uninhabited"1 "looks inhabited, but no one opened the door"2 "those present did not know the answers"3 "rejected"

label variable d_7_1 "7.1 Approximate age"

label variable d_7_2 "7.2 Sex"

label define D_7_2 .a"." 0 "male"1 "female"2 "no response"

label variable d_7_3 "7.3 Physical health"

label define D_7_3 .a"." 1 "good/fair"2 "poor"8 "no response"9 "does not know"

label variable d_7_4 "7.4 Cognitive health"

label define D_7_4 .a"." 1 "good/fair"2 "poor"8 "no response"9 "does not know"

label variable d_7_5 "7.5 Result of Interview attempt"

label define D_7_5 .a"." 1 "Completed interview"2 "Partial interview"3 "Participant is incapacitated"4 "Participant is not available"5 "Participant refused"

save door_merged_all.dta, replace
