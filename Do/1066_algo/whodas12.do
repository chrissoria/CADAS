capture log close
log using whodas12, text replace
clear
set more off
 
**********************************
* 1066 Caribbean prevalence data
* Code whodas12 for RELSCORE
* WDow 9/18/23
**********************************

use "1066 Baseline data_(Survey cohort) Caribbean.dta", clear

sum PDAS1-PDAS12 whodas12

* simple sum, re-scaled from 48 to 100
gen whodas12b=(PDAS1+PDAS2+PDAS3+PDAS4+PDAS5+PDAS6+PDAS7+PDAS8+PDAS9+PDAS10+PDAS11+PDAS12)*(100/48)
sum whodas12 whodas12b
corr whodas12 whodas12b /* close but not exact */

/* Note WHODAS2.0 manual for the full WHODAS codes half the variables as 0-4, but recodes some
https://www.who.int/standards/classifications/international-classification-of-functioning-disability-and-health/who-disability-assessment-schedule
*/

recode PDAS2 (1 2 =1) (3 4 =2), gen(PDAS2a)
recode PDAS4 (1 2 =1) (3 4 =2), gen(PDAS4a)
recode PDAS8 (1 2 =1) (3 4 =2), gen(PDAS8a)
recode PDAS10 (1 2 =1) (3 4 =2), gen(PDAS10a)
recode PDAS11 (1 2 =1) (3 4 =2), gen(PDAS11a)
recode PDAS12 (1 2 =1) (3 4 =2), gen(PDAS12a)

* sum, re-scaled from 36 to 100
gen whodas12a=(PDAS1+PDAS2a+PDAS3+PDAS4a+PDAS5+PDAS6+PDAS7+PDAS8a+PDAS9+PDAS10a+PDAS11a+PDAS12a)*(100/36)
sum whodas12 whodas12a
corr whodas12 whodas12a 

log close
exit, clear
