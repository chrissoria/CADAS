{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all \
set more off\
capture log close\
log using tracker_log.log, text replace\
\
 cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
\
/* \
\
The goal of this do file is to:\
A. Track which individuals took one survey but not the others\
B. Count Unique Households\
C. Check to see gender in Socio matches gender in Roster\
*/\
\
//below we'll pull out the pid row and any columns that might be relevant\
use rosters_participants\
keep pid hhid pr_3 pr_4\
save rosters_check.dta, replace\
clear\
\
use Socio\
*s83 will be slightly different because age on official documents versus real age\
keep pid s_sex s_8_3\
save socio_check.dta, replace\
clear\
\
use Phys\
keep pid\
save phys_check.dta, replace\
clear\
\
use Cog\
keep pid\
save cog_check.dta, replace\
clear\
\
use Infor\
*ib3 won't be because difference in ages between respondents and proxies\
keep pid i_b3\
save infor_check, replace\
clear\
\
use Cog_Scoring\
keep pid\
save cog_scoring_check.dta, replace\
clear\
\
use Household\
keep hhid\
save Household_checks.dta, replace\
clear\
\
use "rosters_check.dta", clear\
local rosters_rows = _N\
display "rosters_check.dta: " _N\
\
use "socio_check.dta", clear\
local socio_rows = _N\
display "socio_check.dta: " _N\
\
use "phys_check.dta", clear\
local phys_rows = _N\
display "socio_check.dta: " _N\
\
use "cog_check.dta", clear\
local cog_rows = _N\
display "cog_check.dta: " _N\
\
use "infor_check.dta", clear\
local infor_rows = _N\
display "infor_check.dta: " _N\
\
// Find the max number of rows and use the corresponding dataset\
local max_rows = max(`rosters_rows', `socio_rows', `phys_rows', `cog_rows', `infor_rows')\
\
if `rosters_rows' == `max_rows' \{\
    use "rosters_check.dta", clear\
\}\
else if `socio_rows' == `max_rows' \{\
    use "socio_check.dta", clear\
\}\
else if `phys_rows' == `max_rows' \{\
    use "phys_check.dta", clear\
\}\
else if `cog_rows' == `max_rows' \{\
    use "cog_check.dta", clear\
\}\
else if `infor_rows' == `max_rows' \{\
    use "infor_check.dta", clear\
\}\
\
quietly merge 1:1 pid using "rosters_check.dta"\
rename _merge merge_rosters\
\
quietly merge 1:1 pid using "socio_check.dta"\
rename _merge merge_socio\
\
quietly merge 1:1 pid using "phys_check.dta"\
rename _merge merge_phys\
\
quietly merge 1:1 pid using "cog_check.dta"\
rename _merge merge_cog\
\
/*quietly merge 1:1 pid using "cog_scoring_check.dta"\
rename merge merge_cog_scoring*/\
\
quietly merge 1:1 pid using "infor_check.dta"\
rename _merge merge_infor\
\
*Here we will see broadly if gender in roster matches gender in socio\
\
label define gender_label 0 "hombre" 1 "mujer"\
\
recode pr_3 (1=0)\
recode pr_3 (2=1)\
\
label values pr_3 gender_label\
\
*Here, we will see which exact cases do not match in gender\
\
generate gender_mismatch = (pr_3 != s_sex)\
list if gender_mismatch == 1\
\
summarize pr_3\
*the below should be renamed to s_0\
summarize s_sex\
\
save Tracker.dta, replace\
\
// Identify the unmatched pid values\
list pid if merge_rosters != 3 | merge_socio != 3 | merge_phys != 3 | merge_cog != 3 | merge_infor != 3\
\
\
\
 log close\
\
clear all}