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
log using cogscore_algo.log, text replace\
\
\
foreach var of varlist _all \{\
    rename `var' `=lower("`var'")'\
\}\
\
gen nametot_duplicate = 0\
\
replace nametot_duplicate = 1 if name > 0 & !missing(name)\
replace nametot_duplicate = 1 if nrecall > 0 & !missing(nrecall)\
\
* Counting the number of 1s in specific columns (all binary)\
\
egen count = rowtotal(pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag)\
\
* Recoding values from na to 0 so that we can perform the arithmetic\
\
foreach var in animals wordimm worddel paper story learn1 learn2 learn3 recall pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag nametot nrecall \{\
    replace `var' = 0 if `var' == .\
\}\
\
* recoding 9's and 99's to 0\
\
* Replace 99 with 0 for specific columns\
foreach var in animals wordimm worddel paper story \{\
    replace `var' = 0 if `var' == 99\
\}\
\
* Replace 9 with 0 for specific columns\
foreach var in wordimm worddel paper story \{\
    replace `var' = 0 if `var' == 9\
\}\
\
* cleaning the learn variables and recoding, from what I can tell this is to fix possible errors\
* I assume this on the basis that the learn1-3 max words possible is 10\
* replacing the values 11, 20, 21, 30, 31, 40, 41, 50, 51, 60, 61, 70, 71, 80, 81, and 90 \
* with the values 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, and 9, respectively.\
* this may or may not be a good idea, given that we are assuming 11 was meant to be typed in as 11 and not 10\
\
foreach var in learn1 learn2 learn3 recall \{\
    replace `var' = 1 if `var' == 11\
    replace `var' = 2 if inlist(`var', 20, 21)\
    replace `var' = 3 if inlist(`var', 30, 31)\
    replace `var' = 4 if inlist(`var', 40, 41)\
    replace `var' = 5 if inlist(`var', 50, 51)\
    replace `var' = 6 if inlist(`var', 60, 61)\
    replace `var' = 7 if inlist(`var', 70, 71)\
    replace `var' = 8 if inlist(`var', 80, 81)\
    replace `var' = 9 if inlist(`var', 90, 91)\
    * Map 99 to sysmis (in Stata, missing values are represented by .)\
    replace `var' = . if `var' == 99\
\}\
\
* below should all be binary 0 1 variables, we will recode any values greater than 2 but less than 9 as na\
* this is an odd recoding, why less than 9? We will have to be careful with this in CADAS\
\
foreach var in name pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag \{\
    replace `var' = . if `var' >= 2 & `var' <= 9\
\}\
\
* more cleaning, recoding any values higher than a certain amount as "na"\
\
local vars "animals wordimm worddel paper story recall immed nrecall"\
local nums "45 3 3 3 6 10 29 1"\
\
local n : word count `vars'\
\
forval i = 1/`n' \{\
    local var : word `i' of `vars'\
    local num : word `i' of `nums'\
    replace `var' = . if `var' > `num'\
\}\
\
*dividing by total amount of possible correct answers to get a "total"\
\
local divide_var "animals wordimm worddel paper story"\
local divisor "23 3 3 3 6"\
local new_column "animtot wordtot1 wordtot2 papertot storytot"\
\
local n : word count `divide_var'\
\
forval i = 1/`n' \{\
    local col : word `i' of `divide_var'\
    local num : word `i' of `divisor'\
    local new : word `i' of `new_column'\
    \
    capture gen `new' = `col'/`num'\
    \
    if _rc capture replace `new' = `col'/`num'\
\}\
\
* then put it all together below\
* nametot = ability to say the interviewer's name and remember it\
* count = ability to identify common objects, repeat simple words, orient themselves in space and time, and motor skills\
* animtot = quickly list the names of animals \
* wordtot1 = immediate recall of words\
* wordtot2 = delayed recall of words\
* papertot = ability to fold paper and follow instructions\
* storytot = ability to recall the elements of a story\
\
* Calculate the cognitive score\
* Try to generate the new variable\
capture gen cogscore_duplicate = 1.03125 * (nametot + count + animtot + wordtot1 + wordtot2 + papertot + storytot)\
format cogscore_duplicate %21.8f\
\
* Display the range of the cognitive score\
di "Range of cogscore: " r(min) " to " r(max)\
\
*nearly identical\
summarize cogscore cogscore_duplicate\
\
replace cogscore = round(cogscore, 0.001)\
replace cogscore_duplicate = round(cogscore_duplicate, 0.001)\
\
summarize cogscore cogscore_duplicate\
\
keep cogscore cogscore_duplicate\
}