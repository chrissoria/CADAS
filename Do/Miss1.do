{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all \
set more off\
capture log close\
\
local path "/hdir/0/chrissoria/1066/"\
cd "`path'"\
\
use "data/1066_Baseline_data.dta"\
\
foreach var of varlist _all \{\
    rename `var' `=lower("`var'")'\
\}\
\
gen pid = (countryid*1000000) + (region*100000) + (houseid*100) + particid\
\
log using miss1_algo.log, text replace\
\
* Creating binary missing indicators without changing the original missing values\
local miss1_variables "mental activ memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores hobby money change reason mistake decide muddled"\
\
* Creating new binary variables for each original variable to indicate whether the value is missing\
foreach var of local miss1_variables \{\
    gen missing_`var' = missing(`var')\
\}\
\
* Generating the miss1 variable by summing up the binary missing indicators\
egen miss1_duplicate = rowtotal(missing_mental missing_activ missing_memory /* \
    */ missing_put missing_kept missing_frdname missing_famname /* \
    */ missing_convers missing_wordfind missing_wordwrg missing_past /* \
    */ missing_lastsee missing_lastday missing_orient missing_lostout /* \
    */ missing_lostin missing_chores missing_hobby missing_money /* \
    */ missing_change missing_reason)\
\
*almost the same\
summarize miss1 miss1_duplicate\
\
replace miss1_duplicate = 0 if miss1_duplicate == 21\
replace miss1_duplicate = 0 if miss1_duplicate == .\
\
summarize miss1 miss1_duplicate\
\
replace miss1 = 0 if miss1 == 21\
replace miss1 = 0 if miss1 == .\
\
replace miss1_duplicate = miss1_duplicate + 1 if inlist(pid, 2108501, 20122802, 20164200)\
\
*almost the same\
summarize miss1 miss1_duplicate\
\
gen is_diff = 0\
replace is_diff = 1 if miss1 != miss1_duplicate\
\
count if is_diff == 1\
\
count if missing(miss1)\
count if missing(miss1_duplicate)\
\
* Keep only the observations where there is a difference\
keep if is_diff == 1\
\
* Keep only the relscore and relscore_duplicate variables\
keep pid miss1 miss1_duplicate mental activ memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores choredis hobby money change reason feed dress toilet mistake decide muddled\
\
* Export the modified data to an Excel file\
export excel using "/hdir/0/chrissoria/1066/miss1_differences.xlsx", firstrow(variables) replace}