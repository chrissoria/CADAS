capture log close
* log using, text replace
clear
set more off
 
**********************************
* create reduced versions of COGSCORE and RELSCORE using only variables also in ADAMS
* started: 12/03/2021
* last update: 06/19/2023, JW
**********************************


use "1066 Baseline data_(Survey cohort) Caribbean.dta", clear

****************
* COGSCORE
****************
sum pencil watch repeat town chief street address month day year season pentag
gen count = pencil + watch + repeat + town + chief + street + address + month + day + year + season + pentag

sum animals
gen animtot=animals/23

sum wordimm worddel paper story
gen wordtot1=wordimm/3
gen wordtot2=worddel/3
gen papertot=paper/3
gen storytot=story/37

sum count animtot wordtot1 wordtot2 papertot storytot
gen COGSCORE_adams = 1.03125*(count + animtot + wordtot1 + wordtot2 + papertot + storytot)
sum COGSCORE_adams, d
mean COGSCORE_adams


***********
* RELSCORE
***********
sum memory put frdname famname wordfind wordwrg lastday orient lostout lostin chores money reason feed dress toilet

egen MISS1 = rowmiss(memory put frdname famname wordfind wordwrg lastday orient lostout lostin chores money reason)

egen MISS3 = rowmiss( feed dress toilet)

gen MISSTOT = (MISS3*3) + MISS1
summ MISS*

gen RELSCORE_adams = (30/(30-MISSTOT))*((memory + put/2 + frdname/2 + famname/2 /*
*/ + wordfind/2 + wordwrg/2 + lastday/2 + orient/2 + lostout/2 /*
*/ + lostin/2 + chores/2 + money/2 + reason + feed + dress + toilet)-((MISS1+MISS3)*9))

16 
24

8 variables 

activ mental kept convers past lastsee hobby change

sum RELSCORE_adams, d
mean RELSCORE_adams

log close
exit, clear
