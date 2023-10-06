clear all 
set more off
capture log close

local path "/hdir/0/chrissoria/1066/"
cd "`path'"

use "data/1066_Baseline_data.dta"

log using 1066_algo.log, text replace

drop if misstot > 0

/*IMPUTING RELSCORE - THE FIRST COMMAND SAVES THE ORIGINAL RELSCORE VARIABLE BEFORE IMPUTATION OF THE MV

compute relscore_original= relscore.
execute.

COMPUTE pred_relscore= 0.004 + (0.072*whodas12) + (0.338*npisev).
execute.*/

gen pred_relscore = 0.004 + (0.072 * whodas12) + (0.338 * npisev)

summarize pred_relscore pred_relscore

/*RECODE
  pred_relscore  (Lowest thru 0=0)  (30 thru Highest=10)  .
EXECUTE .
*/

*I believe the above code is supposed to say 10 thru highest=10

replace pred_relscore = 0 if pred_relscore <= 0

*had to exclude the missing here because missing is greater than 30
replace pred_relscore = 30 if pred_relscore >= 30 & !missing(pred_relscore)


/*RECODE
  relscore  (MISSING=999).
EXECUTE .

IF (relscore=999) relscore = pred_relscore .
EXECUTE .*/

gen relscore_duplicate = relscore_original 

* Replace missing values in relscore_duplicate with non-missing values from pred_relscore
replace relscore_duplicate = pred_relscore if relscore_original == . & pred_relscore != .

*exactly the same
summarize relscore_duplicate relscore

generate dfscore_duplicate = 0.452322 - (0.01669918 * cogscore) + (0.03033851 * relscore)
*exact
summarize dfscore dfscore_duplicate

*again, have to be careful to exclude missing here
gen dfcase_duplicate = .
replace dfcase_duplicate = 1 if dfscore_duplicate <= 0.119999999
replace dfcase_duplicate = 2 if dfscore_duplicate >= 0.12 & dfscore_duplicate < 0.184
replace dfcase_duplicate = 3 if dfscore_duplicate >= 0.184 & dfscore_duplicate < .

*exact
summarize dfcase_duplicate dfcase

gen cogcase_duplicate = .
replace cogcase_duplicate = 3 if cogscore <= 28.5
replace cogcase_duplicate = 2 if cogscore > 28.5 & cogscore <= 29.5
replace cogcase_duplicate = 1 if cogscore > 29.5 & cogscore != .

*exact
summarize cogcase_duplicate cogcase

gen ncogscor_duplicate = .
replace ncogscor_duplicate = 1 if cogscore <= 23.699
replace ncogscor_duplicate = 2 if cogscore > 23.699 & cogscore <= 28.619
replace ncogscor_duplicate = 3 if cogscore > 28.619 & cogscore <= 30.619
replace ncogscor_duplicate = 4 if cogscore > 30.619 & cogscore <= 31.839
replace ncogscor_duplicate = 5 if cogscore > 31.839 & cogscore != .

gen nrelscor_duplicate = .
replace nrelscor_duplicate = 1 if relscore_duplicate == 0
replace nrelscor_duplicate = 2 if relscore_duplicate > 0 & relscore_duplicate <= 1.99
replace nrelscor_duplicate = 3 if relscore_duplicate > 1.99 & relscore_duplicate <= 5.0
replace nrelscor_duplicate = 4 if relscore_duplicate > 5.0 & relscore_duplicate <= 12.0
replace nrelscor_duplicate = 5 if relscore_duplicate > 12.0 & relscore_duplicate != .

gen ndelay_duplicate = .
replace ndelay_duplicate = 1 if recall == 0
replace ndelay_duplicate = 2 if recall >= 1 & recall <= 3
replace ndelay_duplicate = 3 if recall == 4
replace ndelay_duplicate = 4 if recall >= 5 & recall <= 6
replace ndelay_duplicate = 5 if recall >= 7 & recall != .

gen brelscor_duplicate = .
replace brelscor_duplicate = 0     if nrelscor_duplicate == 1
replace brelscor_duplicate = 1.908 if nrelscor_duplicate == 2
replace brelscor_duplicate = 2.311 if nrelscor_duplicate == 3
replace brelscor_duplicate = 4.171 if nrelscor_duplicate == 4
replace brelscor_duplicate = 5.680 if nrelscor_duplicate == 5 & nrelscor_duplicate != .

gen bcogscor_duplicate = .
replace bcogscor_duplicate = 2.801  if ncogscor_duplicate == 1
replace bcogscor_duplicate = 1.377  if ncogscor_duplicate == 2
replace bcogscor_duplicate = 0.866  if ncogscor_duplicate == 3
replace bcogscor_duplicate = -0.231 if ncogscor_duplicate == 4
replace bcogscor_duplicate = 0      if ncogscor_duplicate == 5 & ncogscor_duplicate != .

gen bdelay_duplicate = .
replace bdelay_duplicate = 3.822 if ndelay_duplicate == 1
replace bdelay_duplicate = 3.349 if ndelay_duplicate == 2
replace bdelay_duplicate = 2.575 if ndelay_duplicate == 3
replace bdelay_duplicate = 2.176 if ndelay_duplicate == 4
replace bdelay_duplicate = 0     if ndelay_duplicate == 5 & ndelay_duplicate != .

gen bgmsdiag_duplicate = .
replace bgmsdiag_duplicate = 0      if gmsdiag == 6
replace bgmsdiag_duplicate = 1.566  if gmsdiag == 1
replace bgmsdiag_duplicate = 1.545  if gmsdiag == 2
replace bgmsdiag_duplicate = -0.635 if gmsdiag == 3
replace bgmsdiag_duplicate = -0.674 if gmsdiag == 4
replace bgmsdiag_duplicate = 0.34   if gmsdiag == 5 & gmsdiag != .


gen logodds_duplicate = -9.53 + brelscor_duplicate + bcogscor_duplicate + bdelay_duplicate + bgmsdiag_duplicate

gen odds_duplicate = exp(logodds_duplicate)

gen prob_duplicate = odds_duplicate / (1 + odds_duplicate)

gen dem1066_duplicate = .
replace dem1066_duplicate = 0 if prob_duplicate <= 0.25591 & prob_duplicate != .
replace dem1066_duplicate = 1 if prob_duplicate > 0.25591 & prob_duplicate != .

summarize dem1066_duplicate cdem1066

tab dem1066_duplicate cdem1066

gen is_diff = 0
replace is_diff = 1 if dem1066 != cdem1066 & dem1066 != . & cdem1066 != .

* Keep only the observations where there is a difference
keep if is_diff == 1

* Keep only the relscore and relscore_duplicate variables
keep dem1066_duplicate cdem1066

* Export the modified data to an Excel file
export excel using "/hdir/0/chrissoria/1066/differences.xlsx", firstrow(variables) replace

