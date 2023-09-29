clear all 
set more off
capture log close

local path "/hdir/0/chrissoria/1066/"
cd "`path'"

use "data/1066_Baseline_data.dta"

*First we create the cogscore
rename cogscore cogscore_first

foreach var of varlist _all {
    rename `var' `=lower("`var'")'
}

gen nametot = 0

replace nametot = 1 if name > 0
replace nametot = 1 if nrecall > 0

* Counting the number of 1s in specific columns (all binary)

egen count = rowtotal(pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag)

* Recoding values from na to 0 so that we can perform the arithmetic

foreach var in animals wordimm worddel paper story learn1 learn2 learn3 recall pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag nametot nrecall {
    replace `var' = 0 if `var' == .
}

* recoding 9's and 99's to 0

* Replace 99 with 0 for specific columns
foreach var in animals wordimm worddel paper story {
    replace `var' = 0 if `var' == 99
}

* Replace 9 with 0 for specific columns
foreach var in wordimm worddel paper story {
    replace `var' = 0 if `var' == 9
}

* cleaning the learn variables and recoding, from what I can tell this is to fix possible errors
* I assume this on the basis that the learn1-3 max words possible is 10
* replacing the values 11, 20, 21, 30, 31, 40, 41, 50, 51, 60, 61, 70, 71, 80, 81, and 90 
* with the values 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, and 9, respectively.
* this may or may not be a good idea, given that we are assuming 11 was meant to be typed in as 11 and not 10

foreach var in learn1 learn2 learn3 recall {
    replace `var' = 1 if `var' == 11
    replace `var' = 2 if inlist(`var', 20, 21)
    replace `var' = 3 if inlist(`var', 30, 31)
    replace `var' = 4 if inlist(`var', 40, 41)
    replace `var' = 5 if inlist(`var', 50, 51)
    replace `var' = 6 if inlist(`var', 60, 61)
    replace `var' = 7 if inlist(`var', 70, 71)
    replace `var' = 8 if inlist(`var', 80, 81)
    replace `var' = 9 if inlist(`var', 90, 91)
    * Map 99 to sysmis (in Stata, missing values are represented by .)
    replace `var' = . if `var' == 99
}

* below should all be binary 0 1 variables, we will recode any values greater than 2 but less than 9 as na
* this is an odd recoding, why less than 9? We will have to be careful with this in CADAS

foreach var in name pencil watch chair shoes knuckle elbow should bridge hammer pray chemist repeat town chief street store address longmem month day year season nod point circle pentag {
    replace `var' = . if `var' >= 2 & `var' <= 9
}

* more cleaning, recoding any values higher than a certain amount as "na"

local vars "animals wordimm worddel paper story recall immed nrecall"
local nums "45 3 3 3 6 10 29 1"

local n : word count `vars'

forval i = 1/`n' {
    local var : word `i' of `vars'
    local num : word `i' of `nums'
    replace `var' = . if `var' > `num'
}

*dividing by total amount of possible correct answers to get a "total"

local divide_var "animals wordimm worddel paper story"
local divisor "23 3 3 3 6"
local new_column "animtot wordtot1 wordtot2 papertot storytot"

local n : word count `divide_var'

forval i = 1/`n' {
    local col : word `i' of `divide_var'
    local num : word `i' of `divisor'
    local new : word `i' of `new_column'
    
    capture gen `new' = `col'/`num'
    
    if _rc capture replace `new' = `col'/`num'
}

* then put it all together below
* nametot = ability to say the interviewer's name and remember it
* count = ability to identify common objects, repeat simple words, orient themselves in space and time, and motor skills
* animtot = quickly list the names of animals 
* wordtot1 = immediate recall of words
* wordtot2 = delayed recall of words
* papertot = ability to fold paper and follow instructions
* storytot = ability to recall the elements of a story

* Calculate the cognitive score
* Try to generate the new variable
capture gen cogscore = 1.03125 * (nametot + count + animtot + wordtot1 + wordtot2 + papertot + storytot)

* If the variable already exists, replace its values
if _rc capture replace cogscore = 1.03125 * (nametot + count + animtot + wordtot1 + wordtot2 + papertot + storytot)

* Find the minimum and maximum values of the cognitive score
su cogscore, detail

* Display the range of the cognitive score
di "Range of cogscore: " r(min) " to " r(max)

*same
corr cogscore cogscore_first

*Let's now compute the relscore
rename relscore relscore_first

* recoding all the na values in this list of vars to 9
local recode_9 "mental activ memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores hobby money change reason feed dress toilet"

foreach var of local recode_9 {
    * Replace missing values with 9
    replace `var' = 9 if `var' == .
}

* summing up all the missing values in the list (up to reason) to generate the miss1 variable
local miss1_variables "mental activ memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores hobby money change reason"

* Generate the new variable miss1 if it doesn't exist
rename miss1 miss1_first
capture gen miss1 = 0

foreach var of local miss1_variables {
    * Sum up the variables that are equal to 9
    replace miss1 = miss1 + (`var' == 9)
}

*almost the same
corr miss1 miss1_first

* counting up the remaining missing values to generate miss 3 variable
local miss3_variables "feed dress toilet"

* Generate the new variable miss3 if it doesn't exist
rename miss3 miss3_first
capture gen miss3 = 0

foreach var of local miss3_variables {
    * Sum up the variables that are equal to 9
    replace miss3 = miss3 + (`var' == 9)
}

corr miss3 miss3_first

* Check if the variable misstot already exists and replace its values; otherwise, generate it
rename misstot misstot_first

capture gen misstot = (miss3 * 3) + miss1
if _rc != 0 {
    replace misstot = (miss3 * 3) + miss1
}

corr misstot misstot_first

* halving the values (1 to .5 and 2 to 1) in the following variables
* Loop through each variable to recode
foreach var in kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores change money {
    replace `var' = 0.5 if `var' == 1
    replace `var' = 1 if `var' == 2
}

* Backup original 'dress' variable and recode if 'dressdis' is 1
gen dress_original = dress
replace dress = 0 if dressdis == 1

* Backup original 'chores' variable and recode if 'choredis' is 1
gen chores_original = chores
replace chores = 0 if choredis == 1

* Backup original 'feed' variable and recode if 'feeddis' is 1
gen feed_original = feed
replace feed = 0 if feeddis == 1

* Backup original 'toilet' variable and recode if 'toildis' is 1
gen toilet_original = toilet
replace toilet = 0 if toildis == 1

*relscore as it is in the SPSS file
gen relscore = (30 / (30 - misstot)) * (activ + mental + memory + put + kept + ///
 frdname + famname + convers + wordfind + wordwrg + past + lastsee + lastday + ///
 orient + lostout + lostin + chores + hobby + money + change + reason + feed + ///
 dress + toilet) - ((miss1 + miss3) * 9)
 
*relscore including the 3 variables that are missing from this battery
gen relscore2 = (30 / (30 - misstot)) * (activ + mental + memory + put + kept + ///
 frdname + famname + convers + wordfind + wordwrg + past + lastsee + lastday + ///
 orient + lostout + lostin + chores + hobby + money + change + reason + feed + ///
 dress + toilet + mistake + decide + muddled) - ((miss1 + miss3) * 9)
 
 *I added this line
foreach var of local recode_9 {
    * Replace missing values with 9
    replace `var' = . if `var' == 9
}

*relscore with all the missing values converted back to missing
gen relscore3 = (30 / (30 - misstot)) * (activ + mental + memory + put + kept + ///
 frdname + famname + convers + wordfind + wordwrg + past + lastsee + lastday + ///
 orient + lostout + lostin + chores + hobby + money + change + reason + feed + ///
 dress + toilet) - ((miss1 + miss3) * 9)

*relscore with all missing values converted AND adding in the 3 missing vars
gen RELSCORE = (30 / (30 - misstot)) * (activ + mental + memory + put + kept + ///
 frdname + famname + convers + wordfind + wordwrg + past + lastsee + lastday + ///
 orient + lostout + lostin + chores + hobby + money + change + reason + feed + ///
 dress + toilet + mistake + decide + muddled) - ((miss1 + miss3) * 9)

recode put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores change money (1=2) (0.5=1)

recode activ mental memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores choredis hobby money change reason feed feeddis dress dressdis toilet toildis mistake decide muddled (9=.)

replace relscore = . if misstot >= 29
replace relscore2 = . if misstot >= 29
replace relscore3 = . if misstot >= 29
replace RELSCORE = . if misstot >= 29

* Run a correlation between relscore and relscore_first (if relscore_first exists)
corr relscore relscore_original

corr relscore2 relscore_original

corr relscore3 relscore_original

corr RELSCORE relscore_original

*Next, let's create the whodas12

rename whodas12 whodas12_first

* Recode variables pdas2, pdas4, pdas8, pdas10, pdas11, and pdas12
gen pdas2a = pdas2
replace pdas2a = 1 if pdas2a == 1 | pdas2a == 2
replace pdas2a = 2 if pdas2a == 3 | pdas2a == 4

gen pdas4a = pdas4
replace pdas4a = 1 if pdas4a == 1 | pdas4a == 2
replace pdas4a = 2 if pdas4a == 3 | pdas4a == 4

gen pdas8a = pdas8
replace pdas8a = 1 if pdas8a == 1 | pdas8a == 2
replace pdas8a = 2 if pdas8a == 3 | pdas8a == 4

gen pdas10a = pdas10
replace pdas10a = 1 if pdas10a == 1 | pdas10a == 2
replace pdas10a = 2 if pdas10a == 3 | pdas10a == 4

gen pdas11a = pdas11
replace pdas11a = 1 if pdas11a == 1 | pdas11a == 2
replace pdas11a = 2 if pdas11a == 3 | pdas11a == 4

gen pdas12a = pdas12
replace pdas12a = 1 if pdas12a == 1 | pdas12a == 2
replace pdas12a = 2 if pdas12a == 3 | pdas12a == 4

* Try to generate the new variable
capture gen whodas12 = (pdas1 + pdas2a + pdas3 + pdas4a + pdas5 + pdas6 + pdas7 + pdas8a + pdas9 + pdas10a + pdas11a + pdas12a) * (100/36)

* If the variable already exists, replace its values
if _rc capture replace whodas12 = (pdas1 + pdas2a + pdas3 + pdas4a + pdas5 + pdas6 + pdas7 + pdas8a + pdas9 + pdas10a + pdas11a + pdas12a) * (100/36)

corr whodas12 whodas12_first

*then we'll calculate the predicted relscore

*rename pred_relscore pred_relscore_first

* Generate the predicted relscore variable
gen pred_relscore = 0.004 + (0.072 * whodas12) + (0.338 * npisev)

* Recode pred_relscore to a scale from 1-10
* Assuming 0 if <= 0 and 10 if >= 10
replace pred_relscore = 0 if pred_relscore <= 0
replace pred_relscore = 10 if pred_relscore >= 10

* Fill missing values in 'relscore' with values from 'pred_relscore'
* This will only make a change where whodas12 and npisev are not missing
* You might want to handle cases where they are missing differently
replace relscore = pred_relscore if missing(relscore)
replace relscore2 = pred_relscore if missing(relscore2)
replace relscore3 = pred_relscore if missing(relscore3)
replace RELSCORE = pred_relscore if missing(RELSCORE)

corr relscore relscore_first
corr relscore2 relscore_first
corr relscore3 relscore_first
corr RELSCORE relscore_first

*next I'll produce the cogscore
rename dfscore dfscore_first

gen dfscore = 0.452322 - (0.01669918 * cogscore) + (0.03033851 * relscore)
gen dfscore2 = 0.452322 - (0.01669918 * cogscore) + (0.03033851 * relscore2)
gen dfscore3 = 0.452322 - (0.01669918 * cogscore) + (0.03033851 * relscore3)
gen dfscore4 = 0.452322 - (0.01669918 * cogscore) + (0.03033851 * RELSCORE)

summarize dfscore, detail
summarize dfscore2, detail

corr dfscore dfscore_first
corr dfscore2 dfscore_first
corr dfscore3 dfscore_first
corr dfscore4 dfscore_first

*and then I'll produce dfcase and cogcase

rename dfcase dfcase_first

* Generate the 'dfcase' variable
gen dfcase = .
replace dfcase = 1 if dfscore <= 0.12
replace dfcase = 2 if dfscore >= 0.12 & dfscore < 0.184
replace dfcase = 3 if dfscore >= 0.184

summarize dfcase, detail


corr dfcase dfcase_first

gen dfcase2 = .
replace dfcase2 = 1 if dfscore2 <= 0.12
replace dfcase2 = 2 if dfscore2 >= 0.12 & dfscore2 < 0.184
replace dfcase2 = 3 if dfscore2 >= 0.184

*somehow has a lower correlation
corr dfcase2 dfcase_first

gen dfcase3 = .
replace dfcase3 = 1 if dfscore3 <= 0.12
replace dfcase3 = 2 if dfscore3 >= 0.12 & dfscore3 < 0.184
replace dfcase3 = 3 if dfscore3 >= 0.184

*also almost the same as dfcase_first (no improvement)
corr dfcase3 dfcase_first

gen dfcase4 = .
replace dfcase4 = 1 if dfscore4 <= 0.12
replace dfcase4 = 2 if dfscore4 >= 0.12 & dfscore4 < 0.184
replace dfcase4 = 3 if dfscore4 >= 0.184

corr dfcase4 dfcase_first

* Generate the 'cogcase' variable
rename cogcase cogcase_first

gen cogcase = .
replace cogcase = 3 if cogscore <= 28.5
replace cogcase = 2 if cogscore > 28.5 & cogscore <= 29.5
replace cogcase = 1 if cogscore > 29.5

*same
corr cogcase cogcase_first

*generate the set of variables that fit into the final equation
*none of these are already in the df

* Create the 'ncogscor' variable
gen ncogscor = . 
replace ncogscor = 1 if cogscore <= 23.699
replace ncogscor = 2 if cogscore >= 23.70 & cogscore <= 28.619
replace ncogscor = 3 if cogscore >= 28.62 & cogscore <= 30.619
replace ncogscor = 4 if cogscore >= 30.62 & cogscore <= 31.839
replace ncogscor = 5 if cogscore > 31.839

* Create the 'nrelscor' variable
*for now I'll use the regular relscore and see if it makes much a differe
gen nrelscor = .
replace nrelscor = 1 if relscore <= 0
replace nrelscor = 2 if relscore > 0 & relscore < 1.99
replace nrelscor = 3 if relscore >= 1.99 & relscore < 5.0
replace nrelscor = 4 if relscore >= 5.0 & relscore < 12.0
replace nrelscor = 5 if relscore >= 12.0

* Create the 'ndelay' variable
gen ndelay = .
replace ndelay = 1 if recall <= 1
replace ndelay = 2 if recall > 1 & recall <= 3
replace ndelay = 3 if recall == 4
replace ndelay = 4 if recall > 4 & recall <= 6
replace ndelay = 5 if recall > 6

* Create the 'brelscor' variable
gen brelscor = . 
replace brelscor = 0     if nrelscor == 1
replace brelscor = 1.908 if nrelscor == 2
replace brelscor = 2.311 if nrelscor == 3
replace brelscor = 4.171 if nrelscor == 4
replace brelscor = 5.68  if nrelscor == 5

* Create a new variable 'bcogscor'
gen bcogscor = .
replace bcogscor = 2.801 if ncogscor == 1
replace bcogscor = 1.377 if ncogscor == 2
replace bcogscor = 0.866 if ncogscor == 3
replace bcogscor = -0.231 if ncogscor == 4
replace bcogscor = 0 if ncogscor == 5


* Create the 'bdelay' variable
gen bdelay = .
replace bdelay = 3.822 if ndelay == 1
replace bdelay = 3.349 if ndelay == 2
replace bdelay = 2.575 if ndelay == 3
replace bdelay = 2.176 if ndelay == 4
replace bdelay = 0     if ndelay == 5

* Create the 'bgmsdiag' variable
gen bgmsdiag = .
replace bgmsdiag = 1.566  if gmsdiag == 1
replace bgmsdiag = 1.545  if gmsdiag == 2
replace bgmsdiag = -0.635 if gmsdiag == 3
replace bgmsdiag = -0.674 if gmsdiag == 4
replace bgmsdiag = 0.34   if gmsdiag == 5
replace bgmsdiag = 0      if gmsdiag == 6

* Compute the logodds variable based on brelscor, bcogscor, bdelay, and bgmsdiag
gen logodds = -9.53 + brelscor + bcogscor + bdelay + bgmsdiag

* Compute the odds from the logodds
gen odds = exp(logodds)

* Compute the probability from the odds
gen prob = odds / (1 + odds)

* Recode the probability into a new variable called dem1066
gen dem1066 = .
replace dem1066 = 0 if prob <= 0.25591
replace dem1066 = 1 if prob > 0.25591

*not sure if this is the same thing
corr dem1066 cdem1066
