{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /* I used the below to create the necessary variables to merge on\
\
use "/hdir/0/chrissoria/1066/data/LangaWeir2020v2/cogfinalimp_9520wide.dta", clear\
\
gen HHID_r = real(hhid)\
egen hhidpn = concat(HHID_r pn)\
	destring hhidpn, replace\
	drop HHID_r\
	\
save "/hdir/0/chrissoria/1066/data/LangaWeir2020v2/cogfinalimp_9520wide.dta", replace\
\
\
use "/hdir/0/chrissoria/1066/data/hrsdementia_2021_1109/hrsdementia_2021_1109.dta", clear\
\
*There's multiple years of data for the same person here, so we'll need to select one.\
*ADAMS Wave A data is A group of 1,770 HRS respondent from the HRS 2000 and HRS 2002 waves, so I will keep only those years.\
\
drop if HRS_year != "2000" & HRS_year != "2002"\
\
\
gen HHID_r = real(HHID)\
egen hhidpn = concat(HHID_r PN)\
	destring hhidpn, replace\
	drop HHID_r\
	\
duplicates tag hhidpn, generate(dup_tag)\
destring HRS_year, replace\
sort HRS_year\
drop if dup_tag > 0 & HRS_year == 2000\
\
save "/hdir/0/chrissoria/1066/data/hrsdementia_2021_1109/hrsdementia_2021_1109.dta", replace\
\
set maxvar 100000\
use "/hdir/0/chrissoria/1066/data/randhrs1992_2016v2_archive_STATA/randhrs1992_2016v2.dta", clear\
gen HHID_r = real(HHID)\
egen hhidpn = concat(HHID_r PN)\
	destring hhidpn, replace\
	drop HHID_r\
\
*/\
clear all\
capture log close\
cd "/hdir/0/chrissoria/1066/"\
\
set maxvar 100000\
set more off\
\
log using "/hdir/0/chrissoria/1066/ADAMS_1066_aggressive.log", text replace\
use "/hdir/0/chrissoria/ADAMS/DTA/ADAMS_WAVE_A_aggressive.dta", clear\
\
 \
**********************************\
* replicate COGSCORE [10/66] and RELSCORE [10/66] in ADAMS\
* started: 12/03/2021\
* last update: 08/01/2023\
**********************************\
\
**\
recode ANAFTOT ANWM1TOT (97 = .)\
rename ANAFTOT aANIMALS\
rename ANWM1TOT aSTORY\
\
**https://hrsdata.isr.umich.edu/data-products/cross-wave-imputation-cognitive-functioning-measures-1992-2020\
* The Cross-Wave Imputation of Cognitive Functioning Measures: 1992-2020 (Final, Version 3.0) data release contains imputations for cognitive functioning data for HRS 1992 through 2020.\
\
*we're comparing these algorithms\
\
merge 1:1 hhidpn using "/hdir/0/chrissoria/ADAMS/DTA/cogfinalimp_9520wide.dta", keepusing (cogtot27_imp2000 cogtot27_imp2002 cogfunction2000 cogfunction2002) gen(_merge3)\
keep if _merge3 == 3\
**\
\
/* https://hrsdata.isr.umich.edu/data-products/gianattasio-power-predicted-dementia-probability-scores-and-dementia-classifications\
Gianattasio-Power Predicted Dementia Probability Scores and Dementia Classifications\
\
*/\
\
merge 1:1 hhidpn using "/hdir/0/chrissoria/ADAMS/DTA/hrsdementia_2021_1109_reproduced.dta", keepusing (expert_dem hurd_dem lasso_dem hurd_p expert_p lasso_p) gen(_merge4)\
keep if _merge4 == 3\
**\
\
\
** https://hrsdata.isr.umich.edu/data-products/rand-hrs-archived-data-products\
* Every individual who has ever completed an HRS Core Interview has a record in this file.\
merge 1:1 hhidpn using "/hdir/0/chrissoria/ADAMS/DTA/randhrs1992_2016v2.dta", keepusing (raeduc raracem rahispan ragender) gen(_merge5)\
keep if _merge5 == 3\
**\
\
destring hurd_p expert_p lasso_p, force replace\
\
gen female = .\
	replace female = 1 if ragender == 2\
	replace female = 0 if ragender == 1\
\
gen AAGE2 = AAGE * AAGE\
\
gen AAGE_cat = .\
	replace AAGE_cat = 1 if AAGE >= 70 & AAGE < 80\
		replace AAGE_cat = 2 if AAGE >= 80 & AAGE < 120\
gen educat = .\
	replace educat = 1 if raeduc == 1 | raeduc == 2\
	replace educat = 2 if raeduc == 3\
	replace educat = 3 if raeduc == 4 | raeduc == 5\
\
*chris adding this in based on Jordan's instruction\
\
foreach i in A\{\
\
*variable BDFDX1 not found\
codebook `i'DFDX1\
\
tab `i'DFDX1\
\
cap drop dementia\
\
gen dementia=0\
\
replace dementia=1 if `i'DFDX1<=19\
\
tab dementia\
\
tab `i'DFDX1 if dementia==1 //308 with dementia\
\
tab `i'DFDX1 if dementia==0 \
\
tab dementia\
\
cap drop cind\
\
cap drop cognormal\
\
gen cind=0\
\
replace cind=1 if ((`i'DFDX1>19 & `i'DFDX1<=30) | `i'DFDX1==32 | `i'DFDX1==33)\
\
tab `i'DFDX1 if cind==1 //241\
\
tab `i'DFDX1 if cind==0\
\
gen cognormal= 0\
\
replace cognormal= 1 if `i'DFDX1==31\
\
tab `i'DFDX1 if cognormal==1 //307 normal\
\
\}\
\
****************\
* COGSCORE\
****************\
\
*chris adding this\
rename ANMSE17 aWATCH\
rename ANMSE7 aREPEAT\
rename ANMSE16 aPENCIL\
rename ANMSE8 aTOWN\
rename ANPRES aCHIEF\
rename ANMSE10 aSTREET\
rename ANMSE6 aADDRESS\
rename ANMSE3 aMONTH\
rename ANMSE5 aDAY\
rename ANMSE1 aYEAR\
rename ANMSE2 aSEASON\
rename ANMSE22 aPENTAG\
\
\
*recoding everything that's reported as missing for whatever reason as missing  \
foreach var in aPENCIL aWATCH aREPEAT aTOWN aCHIEF aSTREET aADDRESS aMONTH aDAY aYEAR aSEASON aPENTAG \{\
	recode `var' (97 = .)\
	recode `var' (98 = .)\
	recode `var' (99 = .)\
\}\
\
*below is what already was (haven't added two variables i found\
\
sum aPENCIL aWATCH aREPEAT aTOWN aCHIEF aSTREET aADDRESS aMONTH aDAY aYEAR aSEASON aPENTAG\
gen count = aPENCIL + aWATCH + aREPEAT + aTOWN + aCHIEF + aSTREET + aADDRESS + aMONTH + aDAY + aYEAR + aSEASON + aPENTAG\
\
*I changed the 23 to 33 based on the survey question\
* if we leave as 23 some people will have a score for animtot that's greater than 1\
sum aANIMALS\
gen animtot=aANIMALS/33\
\
*****chris adding this*****\
rename ANMSE11S aWORDIMM\
*there's three of these, I'm choosing the first delayed recall\
rename ANMSE13 aWORDDEL\
foreach var in ANMSE20F ANMSE20L ANMSE20R \{\
	recode `var' (97 = .)\
\}\
gen aPAPER = ANMSE20F + ANMSE20L + ANMSE20R\
\
sum aWORDIMM aWORDDEL aPAPER aSTORY\
gen wordtot1=aWORDIMM/3\
gen wordtot2=aWORDDEL/3\
gen papertot=aPAPER/3\
gen storytot=aSTORY/37 \
\
sum count animtot wordtot1 wordtot2 papertot storytot\
gen COGSCORE = 1.03125*(count + animtot + wordtot1 + wordtot2 + papertot + storytot)\
sum COGSCORE, d\
mean COGSCORE\
\
\
***********\
* RELSCORE\
***********\
\
***chris adding this***\
rename ADDRS1 aMEMORY\
gen aFRDNAME = ADDRS8 \
gen aFAMNAME = ADDRS8\
rename ADBL1G aLASTDAY\
rename ADDRS2 aORIENT\
rename ADBL1E aLOSTOUT\
rename ADBL1D aLOSTIN\
rename ADBL1A aCHORES\
rename ADBL1B aMONEY\
rename ADDRS3 aREASON\
rename ADBL2EA aFEED\
rename ADBL2DRE aDRESS\
rename ADBL2TO aTOILET\
\
/*removing for now\
*****variables chris found*****\
* these comes from the informant questionairre which would require us to drop over 100 cases\
rename AGQ20 aPUTcs\
rename AGQ19 aKEPTcs\
*/\
*this comes from section C which has a high response rate\
rename AC99 aHOBBYcs\
rename ANDELCOR aRECALLcs\
\
foreach var in aMEMORY aFRDNAME aFAMNAME aLASTDAY aORIENT aLOSTOUT aLOSTIN aCHORES aMONEY aREASON ADDRS7 ADDRS7 aFEED aDRESS aTOILET aHOBBYcs aRECALLcs\{ \
recode `var' (97 = .)\
recode `var' (98 = .)\
recode `var' (99 = .)\
\}\
\
*recoding according to what's in the excel document\
*I made this so that they are how the SPSS document wants it\
gen aWORDFIND = ADDRS7\
tab aWORDFIND, miss\
recode aWORDFIND (1=0) (2=.5) (3/max=1)\
tab aWORDFIND, miss\
\
gen aWORDWRG = ADDRS7\
tab aWORDWRG, miss\
recode aWORDWRG (1=0) (2=.5) (3/max=1)\
tab aWORDWRG, miss\
\
tab aMEMORY, miss\
recode aMEMORY (1 2=0) (3/max=1)\
tab aMEMORY, miss\
\
/*\
tab aPUTcs, miss\
recode aPUTcs (1 2 3=0) (4=.5) (5=1)\
tab aPUTcs, miss\
\
tab aKEPTcs, miss\
recode aKEPTcs (1 2 3=0) (4=.5) (5=1)\
tab aKEPTcs, miss\
\
\
tab aKEPT, miss\
recode aKEPT (1 2 3=0) (4=.5) (5=1)\
tab aKEPT, miss\
*/\
\
tab aHOBBYcs, miss\
recode aHOBBYcs (4=0) (1 2 3=1) (7 8=.)\
tab aHOBBYcs, miss\
\
\
tab aFRDNAME, miss\
recode aFRDNAME (1 2 3=0) (4=.5) (5 6=1)\
tab aFRDNAME, miss\
\
tab aFAMNAME, miss\
recode aFAMNAME (1 2 3=0) (4=.5) (5 6=1)\
tab aFAMNAME, miss\
\
tab aLASTDAY, miss\
recode aLASTDAY (1=.5) (2=1)\
tab aLASTDAY, miss\
\
tab aORIENT, miss\
recode aORIENT (1 2=0) (3 4=.5) (5 6=1)\
tab aORIENT, miss\
\
tab aLOSTOUT, miss\
recode aLOSTOUT (1=.5) (2=1)\
tab aLOSTOUT, miss\
\
tab aLOSTIN, miss\
recode aLOSTIN (1=.5) (2=1)\
tab aLOSTIN, miss\
\
tab aCHORES, miss\
recode aCHORES (1=.5) (2=1)\
tab aCHORES, miss\
\
tab aMONEY, miss\
recode aMONEY (1=.5) (2=1)\
tab aMONEY, miss\
\
tab aREASON, miss\
recode aREASON (1 2=0) (3/max=1)\
tab aREASON, miss\
\
*max score 3\
tab aFEED, miss\
\
*max score 3\
tab aDRESS, miss\
\
*max score 3\
tab aTOILET\
\
*now let's cancel out in case of physical disabiity\
rename ADBL2DRR aDRESSDIS\
recode aDRESSDIS (1 2=0) (0=1)\
replace aDRESS = 0 if aDRESSDIS == 1\
\
rename ADBL2TOR aTOILETDIS\
recode aTOILETDIS (1 2=0) (0=1)\
replace aTOILET = 0 if aTOILETDIS == 1\
\
rename ADBL2EAR aFEEDDIS\
recode aFEEDDIS (1 2=0) (0=1)\
replace aFEED =0 if aFEEDDIS == 1\
\
rename ADBL1AR aCHORESDIS\
recode aCHORESDIS (1 2=0) (0=1)\
replace aCHORES = 0 if aCHORESDIS == 1\
\
sum aMEMORY aFRDNAME aFAMNAME aWORDFIND aWORDWRG /* \
*/ aLASTDAY aORIENT aLOSTOUT aLOSTIN aCHORES aMONEY aREASON aFEED aDRESS aTOILET aHOBBYcs\
\
egen MISS1 = rowmiss(aMEMORY aFRDNAME aFAMNAME aWORDFIND aWORDWRG aLASTDAY aORIENT aLOSTOUT aLOSTIN aCHORES aMONEY aREASON aHOBBYcs)\
\
egen MISS3 = rowmiss(aFEED aDRESS aTOILET)\
\
gen MISSTOT = (MISS3*3) + MISS1\
summ MISS*\
\
*this only works after we recode everything and have all variables (we have to change the 30 to 25 if we use the variables i added in)\
* and X if we don't add them in\
gen U = 23 / (23 - MISSTOT)\
summ U\
*max S should be 25\
gen S = (cond(missing(aMEMORY), 0, aMEMORY) + ///\
                    cond(missing(aFRDNAME), 0, aFRDNAME) + ///\
                    cond(missing(aFAMNAME), 0, aFAMNAME) + ///\
                    cond(missing(aWORDFIND), 0, aWORDFIND) + ///\
                    cond(missing(aWORDWRG), 0, aWORDWRG) + ///\
                    cond(missing(aLASTDAY), 0, aLASTDAY) + ///\
                    cond(missing(aORIENT), 0, aORIENT) + ///\
                    cond(missing(aLOSTOUT), 0, aLOSTOUT) + ///\
                    cond(missing(aLOSTIN), 0, aLOSTIN) + ///\
                    cond(missing(aCHORES), 0, aCHORES) + ///\
                    cond(missing(aMONEY), 0, aMONEY) + ///\
                    cond(missing(aREASON), 0, aREASON) + ///\
                    cond(missing(aFEED), 0, aFEED) + ///\
                    cond(missing(aDRESS), 0, aDRESS) + ///\
                    cond(missing(aTOILET), 0, aTOILET) + ///\
		    cond(missing(aHOBBYcs), 0, aHOBBYcs))\
\
summ S		    \
gen RELSCORE = (U)*S\
\
summ RELSCORE\
\
\
\
** rescaling\
*  10/66\
gen cogscore_1066_mean_full = 28.34736\
gen cogscore_1066_sd_full = 5.843216\
\
gen relscore_1066_mean_full = 2.570601\
gen relscore_1066_sd_full = 4.487136\
\
\
*  adams\
gen COGSCORE_mean = 13.52969\
gen COGSCORE_sd = 3.346019\
\
gen RELSCORE_mean = 4.666667    \
gen RELSCORE_sd = 5.748317\
\
\
gen cogscore_adams_scaled_full = cogscore_1066_mean_full + (COGSCORE - COGSCORE_mean) * cogscore_1066_sd_full/COGSCORE_sd\
\
gen relscore_adams_scaled_full = relscore_1066_mean_full + (RELSCORE - RELSCORE_mean) * relscore_1066_sd_full/RELSCORE_sd\
\
\
** set sample inclusion\
egen in_samp = rowmiss(AAGE RELSCORE COGSCORE dementia cogtot27_imp2002 ragender raeduc)\
keep if in_samp == 0\
egen in_samp2 = rowmiss(hurd_p expert_p lasso_p)\
\
\
** table 2 **\
tab female\
tab AAGE_cat\
tab educat\
\
\
** table 3 **\
** identify cutpoints to maximize sensitivity and specificity [optimal]\
* http://www.haghish.com/statistics/stata-blog/stata-programming/download/cutpt.html\
keep if in_samp2 == 0\
*  1066\
logit dementia cogscore_adams_scaled_full relscore_adams_scaled_full aRECALLcs\
predict dem_pred_1066\
\
*below is where Jordan identified the ideal cutoff point that maximizes the product of sensitivity and specificity\
*however, we'll also want to try .5 (the traditional indicator) and .25 (Prince 2003) stated on page 915 that, \
*"A predicted probability of more than 0\'b725 produced the best sensitivity and specificity\
\
cutpt dementia dem_pred_1066\
\
*Chris is updating this slightly to reflect slightly revised computation of relscore\
rocreg dementia dem_pred_1066\
	gen dem_pred_bin_1066 = (dem_pred_1066 >= .12903367) if !missing(dem_pred_1066)\
tab dementia dem_pred_bin_1066\
\
*  hrs, tics\
logit dementia cogtot27_imp2002\
predict dem_pred_lw\
\
cutpt dementia dem_pred_lw\
\
rocreg dementia dem_pred_lw\
	gen dem_pred_bin_lw = (dem_pred_lw >=  .17525444) if !missing(dem_pred_lw)\
tab dementia dem_pred_bin_lw\
\
\
*  expert\
logit dementia expert_p\
predict dem_pred_expert\
\
cutpt dementia dem_pred_expert\
\
rocreg dementia dem_pred_expert\
	gen dem_pred_bin_expert = (dem_pred_expert >= .13569181) if !missing(dem_pred_expert)\
tab dementia dem_pred_bin_expert\
\
\
*  hurd\
logit dementia hurd_p\
predict dem_pred_hurd\
\
cutpt dementia dem_pred_hurd\
rocreg dementia dem_pred_hurd\
	gen dem_pred_bin_hurd = (dem_pred_hurd >= .10522348) if !missing(dem_pred_hurd)\
tab dementia dem_pred_bin_hurd\
\
\
*  lasso\
logit dementia lasso_p\
predict dem_pred_lasso\
\
cutpt dementia dem_pred_lasso\
rocreg dementia dem_pred_lasso\
	gen dem_pred_bin_lasso = (dem_pred_lasso >= .24691924) if !missing(dem_pred_lasso)\
tab dementia dem_pred_bin_lasso\
\
\
** table 4 **\
** [ascribed cutpoints]\
*  1066\
gen dem_pred_bin_1066a25 = (dem_pred_1066 >= .25) if !missing(dem_pred_1066)\
tab dem_pred_bin_1066a25\
tab dementia dem_pred_bin_1066a25 \
roctab dementia dem_pred_bin_1066a25\
tab dem_pred_bin_1066a25\
\
gen dem_pred_bin_1066a50= (dem_pred_1066 >= .5) if !missing(dem_pred_1066)\
tab dem_pred_bin_1066a50\
tab dementia dem_pred_bin_1066a50 \
roctab dementia dem_pred_bin_1066a50\
tab dem_pred_bin_1066a50\
\
*  hrs, tics\
gen dem_pred_lwa = 0\
	replace dem_pred_lwa = 1 if cogtot27_imp2002 >= 0 & cogtot27_imp2002 <= 6\
tab dem_pred_lwa\
tab dementia dem_pred_lwa\
roctab dementia dem_pred_lwa\
tab dem_pred_lwa\
\
*  expert\
gen dem_pred_experta = (dem_pred_expert >= .5) if !missing(dem_pred_expert)\
tab dem_pred_experta\
tab dementia dem_pred_experta \
roctab dementia dem_pred_experta\
tab dem_pred_experta\
\
*  hurd\
gen dem_pred_hurda = (dem_pred_hurd >= .5) if !missing(dem_pred_hurd)\
tab dem_pred_hurda\
tab dementia dem_pred_hurda \
roctab dementia dem_pred_hurda\
tab dem_pred_hurda\
\
*  lasso\
gen dem_pred_lassoa = (dem_pred_lasso >= .5) if !missing(dem_pred_lasso)\
tab dem_pred_lassoa\
tab dementia dem_pred_lassoa \
roctab dementia dem_pred_lassoa\
tab dem_pred_lassoa\
\
** table 5a **\
** education gradients [optimal cutpoints]\
foreach dem_var in dementia dem_pred_bin_1066 dem_pred_bin_lw dem_pred_bin_expert dem_pred_bin_hurd dem_pred_bin_lasso \{\
forvalues r=1/2 \{\
display "****start: `dem_var' `r'****"\
qui: logit `dem_var' ib2.educat AAGE AAGE2 if AAGE_cat == `r'\
	margins educat, post\
	eststo `dem_var'_`r'\
	\}\
\}\
\
*in this data there are zero cases of dem_pred_experta if AAGE_CAT == 1\
*same thing for dem_pred_hurda and dem_pred_lassoa\
*I will remove it for now and ask Jordan about it\
tab AAGE_cat dem_pred_experta\
tab AAGE_cat dem_pred_hurda\
tab AAGE_cat dem_pred_lassoa\
\
** table 5b **\
** education gradients [optimal ascribed]\
foreach dem_var in dementia dem_pred_bin_1066a25 dem_pred_bin_1066a50 dem_pred_lwa dem_pred_experta dem_pred_hurda dem_pred_lassoa\{\
forvalues r=1/2 \{\
display "****start: `dem_var' `r'****"\
qui: regress `dem_var' ib2.educat AAGE AAGE2 if AAGE_cat == `r'\
	margins educat, post\
	eststo `dem_var'_`r'\
	\}\
\}\
\
\
log close\
exit, clear\
\
}