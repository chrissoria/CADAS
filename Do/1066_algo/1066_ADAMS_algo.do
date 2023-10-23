{\rtf1\ansi\ansicpg1252\cocoartf2757
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all \
set more off\
capture log close\
cls\
\
/*\
The challenge though is that we don't have all of the same variables in ADAMS to create cogscore and relscore. \
The attached file hrs1066_adams_20230616.do has the code that was used to try to create in 10/66 new versions of cogscore and relscore that only used the variables that exist in both datasets. \
Can you please look at this file and see if the way they constructed these indices is consistent with the full 10/66 algorithm for constructing cogscore and relscore \
(but again we could just drop the missings if those are problematic).\
\
Notes from Chris:\
\\I\'92m finding that some variables excluded in this do file are in the ADAMS (Informant) (kept)\
I'm finding that some variables includes in this do file are NOT in the ADAMS (Informant) (chores)\
If I use the other one that might be the correct (CLINICAL HISTORY FIRST INFORMANT) there is also some variables in there that aren't here (hobby)\
Story might be a different length in ADAMS\
Some of these variables are in different scales (for example, the toilet variable). \
We don't have recall in the ADAMS\
*/\
\
*******ADJUST LOCALS HERE**********\
\
***********************************\
local user "Chris"  // Change this to "Will" to switch paths\
\
local Chris "/hdir/0/chrissoria/1066/"\
local Will "PATH"\
\
local path = cond("`user'" == "Chris", "`Chris'", "`Will'")\
\
cd "`path'"\
\
local wave 2\
\
local drop_missing_from_relscore "yes"\
local drop_missing_from_cogscore "yes"\
\
\
***** SCRIPT STARTS HERE *********\
\
**********************************\
\
if `wave' == 1 \{\
    use "`path'/data/1066_Baseline_data.dta"\
\}\
else if `wave' == 2 \{\
    use "`path'/data/1066_full_follow_up_Caribbean.dta"\
\}\
\
if `wave' == 2 \{\
    foreach var of varlist _all \{\
        local lowvar = lower("`var'")\
        rename `var' `lowvar'\
        local newname = substr("`lowvar'", 3, .)\
        rename `lowvar' `newname'\
    \}\
gen pid = (ntreid*1000000) + (useid*100) + rticid\
*I'm dropping these because they look to have been dropped in the data possible incomplete\
drop if inlist(pid, 20028102,20041200,20076700,20129300,20131602)\
*I'm dropping this case but I cannot see a reason why it would've been dropped (no missing in relscore)\
*I'm assuming it was dropped for a specific resons (singled out)\
drop if inlist(pid, 20125302)\
*the cogscores below have been dropped for a reason that's not identifiable\
*the dem1066 algo ends up dropping them somewhere in its computation\
drop if inlist(pid, 1109201, 1300101, 1300901, 1312101, 1316301, 1316302, 1620901, 2026501, 2040901, 2046001, 2046002, 2066101, 2070001, 2070302, 2583601)\
\}\
else if `wave' == 1 \{\
    foreach var of varlist _all \{\
    rename `var' `=lower("`var'")'\
\}\
gen pid = (countryid*1000000) + (region*100000) + (houseid*100) + particid\
\}\
\
if `wave' == 1 \{\
    log using 1066_algo_w1.log, text replace\
\}\
else if `wave' == 2 \{\
    log using 1066_algo_w2.log, text replace\
\}\
\
*************COGSCORE******************\
\
\
**************************************\
\
/*\
\
12/26 variables in the 1066 cannot be included in the ADAMS algo\
they are: chair shoes knuckle elbow should bridge hammer pray chemist store longmem nod point circle\
all 0 / 1\
\
*/\
\
egen count = rowtotal(pencil watch repeat town chief street address month day year season pentag)\
\
foreach var in pencil watch repeat town chief street address month day year season pentag animals wordimm worddel paper story\{\
    replace `var' = 0 if `var' == .\
\}\
\
foreach var in animals wordimm worddel paper story \{\
    replace `var' = 0 if `var' == 99\
\}\
\
foreach var in wordimm worddel paper story \{\
    replace `var' = 0 if `var' == 9\
\}\
\
*other variables that we won't be able to use are learn1 learn2 learn3 recall immed nrecall\
\
foreach var in pencil watch repeat town chief street address month day year season pentag \{\
    replace `var' = . if `var' >= 2 & `var' <= 9\
\}\
\
local vars "animals wordimm worddel paper story"\
local nums "45 3 3 3 6"\
\
local n : word count `vars'\
\
forval i = 1/`n' \{\
    local var : word `i' of `vars'\
    local num : word `i' of `nums'\
    replace `var' = . if `var' > `num'\
\}\
\
gen animtot=animals/23\
\
gen wordtot1=wordimm/3\
\
gen wordtot2=worddel/3\
\
gen papertot=paper/3\
\
gen storytot=story/6\
\
*if we are to weight count for the variables it doesn't have\
gen cogscore_adams1 = 1.03125*(count + animtot + wordtot1 + wordtot2 + papertot + storytot)\
\
\
gen cogscore_adams2 = 1.03125*(count*(1+(26-12)/12) + animtot + wordtot1 + wordtot2 + papertot + storytot)\
\
summarize cogscore cogscore_adams1 cogscore_adams2\
\
******************\
* RELSCORE\
******************\
\
\
sum memory put frdname famname wordfind wordwrg lastday orient lostout lostin chores money reason feed dress toilet\
\
egen MISS1 = rowmiss(memory put frdname famname wordfind wordwrg lastday orient lostout lostin chores money reason)\
\
egen MISS3 = rowmiss(feed dress toilet)\
\
gen MISSTOT = (MISS3*3) + MISS1\
\
if "`drop_missing_from_relscore'" == "yes" \{\
    drop if missing(memory) | missing(put) | missing(frdname) | missing(famname) | missing(wordfind) | missing(wordwrg) | missing(lastday) | missing(orient) | missing(lostout) | missing(lostin) | missing(chores) | missing(money) | missing(reason) | missing(feed) | missing(dress) | missing(toilet)\
\}\
\
/*\
variables present 16/24\
\
memory 0 / 1\
put 0 / 2\
frdname 0 / 1 / 2\
famname 0 / 1 / 2\
wordfind 0 / 1 /2\
wordwrg 0 / 1 / 2\
lastday 0 / 1 / 2\
orient 0 / 1 / 2\
lostout 0 / 1 / 2\
lostin 0 / 1 / 2\
chores 0 / 1 / 2 (I could not find this in ADAMS)\
money 0 / 1 / 2\
reason 0 / 1\
feed 0 / 1 / 2 / 3\
dress 0 / 1 / 2 / 3\
toilet 0 / 1 / 2 / 3\
\
possible score present =  33\
\
not present:\
\
activ 0 /1\
mental 0 / 1\
kept 0 / 1 / 2 (I found this in ADAMS Q19 https://hrs.isr.umich.edu/sites/default/files/meta/adams/forms/ADAMS1InformantQnaireCD.pdf)\
convers 0 / 1 / 2\
past 0 / 1 / 2\
lastsee 0 / 1 / 2\
hobby 0 / 1 (https://hrs.isr.umich.edu/documentation/questionnaires)\
change 0 / 1 / 2\
\
possible score not present = 13\
total possible score = 46\
*/\
\
if `wave' == 1 \{\
\
foreach var in put frdname famname wordfind wordwrg lastday orient lostout lostin chores money\{\
    replace `var'= `var'/2\
\}\
\
\}\
\
else if `wave' == 2 \{\
foreach var in put frdname famname wordfind wordwrg lastday orient lostout lostin chores_original money\{\
    replace `var'= `var'/2\
    \
replace chores = chores_original\
\}\
\
\}\
\
* Backup original 'dress' variable and recode if 'dressdis' is 1\
replace dress = 0 if dressdis == 1\
\
* Backup original 'chores' variable and recode if 'choredis' is 1 (I cannot find this)\
replace chores = 0 if choredis == 1\
\
* Backup original 'feed' variable and recode if 'feeddis' is 1\
replace feed = 0 if feeddis == 1\
\
* Backup original 'toilet' variable and recode if 'toildis' is 1\
replace toilet = 0 if toildis == 1\
\
gen S = memory + put + frdname + famname /*\
*/ + wordfind + wordwrg + lastday + orient + lostout /*\
*/ + lostin + chores + money + reason + feed + dress + toilet\
\
*weighted by possible score\
gen S2 = (memory + put + frdname + famname /*\
*/ + wordfind + wordwrg + lastday + orient + lostout /*\
*/ + lostin + chores + money + reason + feed + dress + toilet) * (1+((46-33)/33))\
\
gen relscore_adams1 = (30/(30-MISSTOT))*((S)-((MISS1+MISS3)*9))\
\
gen relscore_adams2 = (30/(30-MISSTOT))*((S2)-((MISS1+MISS3)*9))\
\
summarize relscore relscore_adams1 relscore_adams2\
\
generate dfscore_adams = 0.452322 - (0.01669918 * cogscore_adams2) + (0.03033851 * relscore_adams2)\
\
summarize dfscore dfscore_adams\
\
/*\
gen f_dem1066prob = exp(-0.261*f_cogscore + 0.516*f_relscore - 0.713*f_recall + 4.826) / (1+exp(-0.261*f_cogscore + 0.516*f_relscore - 0.713*f_recall + 4.826))\
\
 \
\
gen f_dem1066pred50 = f_dem1066prob>0.5\
\
*/\
\
}