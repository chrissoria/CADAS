clear all 
set more off
capture log close

local path "/hdir/0/chrissoria/1066/"
cd "`path'"

use "data/1066_Baseline_data.dta"

foreach var of varlist _all {
    rename `var' `=lower("`var'")'
}

gen pid = (countryid*1000000) + (region*100000) + (houseid*100) + particid

* Creating binary missing indicators without changing the original missing values
local miss1_variables "mental activ memory put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores hobby money change reason"

* Creating new binary variables for each original variable to indicate whether the value is missing
foreach var of local miss1_variables {
    gen missing_`var' = missing(`var')
}

* Generating the miss1 variable by summing up the binary missing indicators
egen miss1_duplicate = rowtotal(missing_mental missing_activ missing_memory /* 
    */ missing_put missing_kept missing_frdname missing_famname /* 
    */ missing_convers missing_wordfind missing_wordwrg missing_past /* 
    */ missing_lastsee missing_lastday missing_orient missing_lostout /* 
    */ missing_lostin missing_chores missing_hobby missing_money /* 
    */ missing_change missing_reason)

*replace miss1_duplicate = 0 if miss1_duplicate == 21
replace miss1_duplicate = 0 if miss1_duplicate == .

/*these are the three variables that
*/
replace miss1_duplicate = miss1_duplicate + 1 if inlist(pid, 2108501, 20122802, 20164200)

* counting up the remaining missing values to generate miss 3 variable
local miss3_variables "feed dress toilet"

* Generate the new variable miss3 if it doesn't exist
gen miss3_duplicate = 0

foreach var of local miss3_variables {
    * Sum up the variables that are missing
    replace miss3_duplicate = miss3_duplicate + missing(`var')
}

*the logic below makes these match, which also implies an inconcisistent conversion of miss3 to missing versus 0
replace miss3_duplicate = . if miss3_duplicate + miss1_duplicate == 24 & miss3 == .

local all_miss "feed dress toilet"

foreach var of local all_miss {
    gen missing_`var' = missing(`var')
}

* Generating the miss1 variable by summing up the binary missing indicators
egen all_miss = rowtotal(missing_mental missing_activ missing_memory /* 
    */ missing_put missing_kept missing_frdname missing_famname /* 
    */ missing_convers missing_wordfind missing_wordwrg missing_past /* 
    */ missing_lastsee missing_lastday missing_orient missing_lostout /* 
    */ missing_lostin missing_chores missing_hobby missing_money /* 
    */ missing_change missing_reason missing_feed missing_dress missing_toilet)
    
replace miss1_duplicate = . if (all_miss ==24 & miss3 == .)

gen misstot_duplicate = (miss3_duplicate * 3) + miss1_duplicate

/* below should be the correct logic
replace misstot = . if misstot == 30
replace misstot = 0 if misstot == .

replace misstot_duplicate = . if misstot_duplicate == 30
replace misstot_duplicate = 0 if misstot_duplicate == .

*/

summarize misstot misstot_duplicate
summarize miss1 miss1_duplicate
summarize miss3 miss3_duplicate

foreach var in put kept frdname famname convers wordfind wordwrg past lastsee lastday orient lostout lostin chores change money {
    replace `var'= `var'/2
}

*this whole chunk of code produces no changes
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

*replace misstot_duplicate = 0 if misstot_duplicate == .

gen S = activ + mental + memory + put + kept + ///
 frdname + famname + convers + wordfind + wordwrg + past + lastsee + lastday + ///
 orient + lostout + lostin + chores + hobby + money + change + reason + feed + ///
 dress + toilet
 
replace miss1_duplicate = 0 if miss1_duplicate == .
replace miss3_duplicate = 0 if miss3_duplicate == .

gen T = miss1_duplicate + miss3_duplicate

*if misstot = 0 then U = 1
gen U = 30 / (30 - misstot_duplicate)

*Whenever a statistical procedure starts, SPSS will first eliminate all observations that have one or more missing value across all variables that are specified for the current procedure. 
*This is called LISTWISE deletion and is the default mechanism.
gen relscore_duplicate = (U) * S - ((T) * 9)
 
 
summarize relscore_duplicate relscore_original

/*activ + MENTAL + MEMORY + PUT + KEPT + FRDNAME + FAMNAME 
+ CONVERS + WORDFIND + WORDWRG + PAST + LASTSEE + LASTDAY + ORIENT + LOSTOUT 
+ LOSTIN + CHORES + HOBBY + MONEY + CHANGE + REASON + FEED + DRESS + toilet
*/
 
gen S_2 = cond(missing(activ), 0, activ) +  ///
            cond(missing(mental), 0, mental) + ///
            cond(missing(memory), 0, memory) + ///
            cond(missing(put), 0, put) + ///
            cond(missing(kept), 0, kept) + ///
            cond(missing(frdname), 0, frdname) + ///
            cond(missing(famname), 0, famname) + ///
            cond(missing(convers), 0, convers) + ///
            cond(missing(wordfind), 0, wordfind) + ///
            cond(missing(wordwrg), 0, wordwrg) + ///
            cond(missing(past), 0, past) + ///
            cond(missing(lastsee), 0, lastsee) + ///
            cond(missing(lastday), 0, lastday) + ///
            cond(missing(orient), 0, orient) + ///
            cond(missing(lostout), 0, lostout) + ///
            cond(missing(lostin), 0, lostin) + ///
            cond(missing(chores), 0, chores) + ///
            cond(missing(hobby), 0, hobby) + ///
            cond(missing(money), 0, money) + ///
            cond(missing(change), 0, change) + ///
            cond(missing(reason), 0, reason) + ///
            cond(missing(feed), 0, feed) + ///
            cond(missing(dress), 0, dress) + ///
            cond(missing(toilet), 0, toilet)
	    
gen T_2 = cond(missing(miss1_duplicate), 0, miss1_duplicate) + ///
        cond(missing(miss3_duplicate), 0, miss3_duplicate)
	
gen U_2 = 30 / (30 - misstot)
replace U_2 = cond(missing(misstot), 0, U_2)

gen relscore_duplicate2 = (U_2) * S_2 - ((T_2) * 9)
gen relscore_duplicate3 = (U_2) * S_2

summarize relscore_duplicate relscore_original
summarize relscore_duplicate2 relscore_original
summarize relscore_duplicate3 relscore_original
 
gen is_diff1 = 0
replace is_diff1 = 1 if relscore_original != relscore_duplicate

gen is_diff2 = 0
replace is_diff2 = 1 if relscore_original != relscore_duplicate2

gen is_diff3 = 0
replace is_diff3 = 1 if relscore_original != relscore_duplicate3

keep if is_diff1 == 1 | is_diff2 == 1 | is_diff3 == 1

keep pid relscore_duplicate relscore_duplicate2 relscore_duplicate3 relscore_original misstot misstot_duplicate miss1 miss1_duplicate miss3 miss3_duplicate S T U S_2 T_2 U_2
