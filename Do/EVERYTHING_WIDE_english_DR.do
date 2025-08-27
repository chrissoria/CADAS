
clear all 
set more off
capture log close

*Here we will identify the country we want before we run the file
*0 = PR, 1 = DR, 2 = CU

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/Users/chrissoria/documents/CADAS/Data"
include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_country_define.do"
cd "`path'/DR_out/translation_DR"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translation_PR"
}
else if `country' == 1 {
    cd "`path'/DR_out/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}
}


*below we read in a country-specific file

/*The goal of this do file is to:
A. Track which individuals took one survey but not the others
B. Count Unique Households
C. Check to see gender in Socio matches gender in Roster
*/

//below we'll pull out the pid row and any columns that might be relevant

if `country' == 0 {
    import excel using "../PR_in/Resumen de Entrevistas.xlsx", firstrow clear
	missings dropobs, force
    *drop N-Z
    keep if strpos(lower(NotasCuestionariosnohechos), "complete") > 0
    keep Cluster Casa Participante GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos
    rename (Casa GénerodeParticpante EdaddeParticpante Fechadeentrevista NotasCuestionariosnohechos) ///
           (House_ID sex age Fecha Notas)
    drop if missing(Cluster, House_ID, Participante, sex, age, Fecha, Notas)
}
else if `country' == 1 {
    import excel using "`path'/DR_in/Resumen de entrevistas.xlsx", firstrow
	missings dropobs, force
    rename HouseID House_ID
    rename GénerodeParticpante sex
    rename EdaddeParticpante age
    rename Fechaenquecompletoelchequeo Fecha
    rename NotasCuestionariosnohechos Notas
}
else if `country' == 2 {
    import excel using "../CUBA_in/Resumen de entrevistas.xlsx", firstrow
    rename Sexo1Hombre2Mujer sex
rename Edad age
rename Fechacompleto Fecha
rename Casa House_ID1
rename Porque1nohubo2rehuso Notas

destring Participante, replace
rename Completo1si2no Completo

destring Completo, replace
destring Cluster, replace
destring House_ID1, replace
}

gen pais = 0
  
if `country' == 1 {
    replace pais = 1 if Participante != .
}
else if `country' == 2 {
    replace pais = 2 if Participante != .
}

if `country' == 1 {
*drop if pais == .
replace Notas = lower(trim(Notas))
*drop if Notas == "rechazo"

capture replace Notas_2 = lower(trim(Notas_2))
*capture drop if Notas_2 == "rechazo"
}

if `country' == 2 {
*drop if pais == 0
replace Notas = lower(trim(Notas))
replace Completo = "3" if missing(Completo)
replace Completo = "1" if Completo == "SI"
destring Completo, replace
*drop if Completo == 2
}
*drop if missing(Cluster)

gen country_str = string(pais, "%12.0f")

if `country' != 2 {
destring Cluster, replace
destring House_ID, replace
destring Participante, replace

gen Cluster_str = string(Cluster, "%12.0f")
gen House_ID_str = string(House_ID, "%12.0f")
gen Participante_str = string(Participante, "%12.0f")

replace Cluster_str = cond(strlen(Cluster_str) == 1, "0" + Cluster_str, Cluster_str)
replace House_ID_str = cond(strlen(House_ID_str) == 1, "00" + House_ID_str, House_ID_str)
replace House_ID_str = cond(strlen(House_ID_str) == 2, "0" + House_ID_str, House_ID_str)
replace Participante_str = cond(strlen(Participante_str) == 1, "0" + Participante_str, Participante_str)

gen pid = country_str + Cluster_str + House_ID_str + Participante_str
drop country_str Cluster_str House_ID_str Participante_str
}

else if `country' == 2 {
	rename Cluster cluster_real
	tostring cluster_real, generate(Cluster) format(%12.0g)
replace Cluster = cond(strlen(Cluster) == 1, "0" + Cluster, Cluster)
gen House_ID = string(House_ID)
replace House_ID = cond(strlen(House_ID) == 1, "00" + House_ID, House_ID)
replace House_ID = cond(strlen(House_ID) == 2, "0" + House_ID, House_ID)
	rename Participante Participante1
gen Participante = string(Participante1)
replace Participante = cond(strlen(Participante) == 1, "0" + Participante, Participante)

gen pid = country_str + Cluster + House_ID + Participante
drop country_str
}


duplicates drop pid, force

*********
* RESUMEN ENTREVISTAS
********

keep pid age sex House_ID Cluster
gen pidr=real(pid)
rename sex SEX

if `country' != 2 {
replace SEX = lower(trim(SEX))
generate sex = cond(SEX == "m", 0, cond(SEX == "f", 1, .))
}

else if `country' == 2 {
	replace SEX = lower(trim(SEX))
	replace SEX = "1" if SEX == "masculino"
	replace SEX = "2" if SEX == "femenino"
	destring SEX, replace
generate sex = cond(SEX == 1,0, cond(SEX == 2, 1,.))
}


drop SEX
destring age, replace

egen duplic=count(pid), by(pid)
egen sd_sex=sd(sex), by(pid)
destring age, replace force

egen sd_age=sd(age), by(pid)
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid sex age duplic if duplic>1 /* print duplicate obs */
gen pid_en_resumen=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
gen hhid=substr(pid,1,6)

save Everything_Wide, replace

use using "../all_unique_pids.dta", clear

merge m:m pid using Everything_Wide.dta
tab _merge
drop _merge

********** 
* ROSTER_PARTICIPANTS
**********
use "../rosters_participants.dta", clear
*keep pid pr_3 pr_4 hhid r_deviceid r_date
rename r_deviceid numero_tableta
gen pidr=real(pid)
*drop if pidr==. /* check if any obs are missing pid */
egen duplic=count(pid), by(pid) /* check for duplicate PID: should all be =1 if no duplicates */
tab duplic /* if any duplicates, should re-do cleaning .do file then re-run this file */
egen sd_sex=sd(pr_3), by(pid)
egen sd_age=sd(pr_4), by(pid)
sum sd_sex sd_age /* these should be all zero if duplicates have identical age and sex */
sort pid
list pid pr_3 pr_4 duplic if duplic>1 /* print duplicate obs */
gen pid_en_listas=1 /* create indicator to use after merge with other questionnaire files */
drop pidr duplic sd_sex sd_age
*save rosters_check.dta, replace /* I think you could drop these lines, and save just tracker per next line */
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m hhid using Everything_Wide
tab pr_3 sex, miss
list pid pr_3 sex if (pr_3 ~= sex +1) & _merge==3 /* list if sex differs between Roster and Resumen */
corr pr_4 age
list pid pr_4 age if abs(pr_4 - age) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Resumen */
drop _merge
save Everything_Wide, replace
********** 
* SOCIO
**********
use Socio, clear
*s_2_3 will be slightly different if age on official documents differs from roster age

capture confirm variable s_sex
if _rc == 0 {
    rename s_sex s_0
}

*keep pid s_0 s_2_3 s_interid s_deviceid1 s_date
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid s_0 s_2_3 duplic if duplic>1 
gen pid_en_socio=1 
drop pidr duplic
*save socio_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using Everything_Wide

tab pr_3 s_0, miss
list pid pr_3 s_0 if (pr_3 ~= s_0 +1) & _merge==3 /* list if sex differs between Roster and Socio */
corr pr_4 s_2_3
list pid pr_4 s_2_3 if abs(pr_4 - s_2_3) >2 & _merge==3 /* list if sex differs more than 2 years between Roster and Socio */

drop _merge
save Everything_Wide, replace

********** 
* PHYS
**********
use Phys, clear
*keep pid p_interid p_deviceid1 p_date
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_phys=1 
drop pidr duplic
*save phys_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* COG
**********
use Cog, clear
*keep pid c_interid c_deviceid1 all_image_files_found all_audio_files_found c_date
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_cog=1 
drop pidr duplic
*save cog_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* COG SCORING
**********
use Cog_Scoring, clear
rename cs_32 cs_32_interviewers
*keep pid cs_interid cs_date
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_cog_scor=1 
drop pidr duplic
*save cog_scoring_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* INFORMANT
**********
use Infor, clear
*keep pid i_interid i_deviceid1 i_date
gen pidr=real(pid)
*drop if pidr==.
egen duplic=count(pid), by(pid)
tab duplic
sort pid
list pid duplic if duplic>1 
gen pid_en_infor=1 
drop pidr duplic
*save infor_check.dta, replace
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
merge m:m pid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* HOUSEHOLD
**********

use Household, clear
*keep hhid h_interid h_deviceid1 h_date
gen hhidr=real(hhid)
*drop if hhidr==.
egen duplic=count(hhid), by(hhid)
tab duplic
sort hhid
list hhid duplic if duplic>1 
gen existe_familiar=1 
drop hhidr duplic
*save hh_check.dta, replace
replace hhid = "2" + substr(hhid, 2, .) if substr(hhid, 1, 1) == "."
merge m:m hhid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* CONSENSUS
**********

use ConsensusVariables, clear
replace pid = "2" + substr(pid, 2, .) if substr(pid, 1, 1) == "."
rename cs_32 cs_40_ty
merge m:m pid using Everything_Wide
drop _merge
save Everything_Wide, replace

********** 
* NEIGHBORDHOOD
**********

use Neighborhood, clear

collapse (mean) n_5-n_38, by(n_clustid)
foreach var of varlist n_5-n_38 {
	gen double `var'mean = recode(`var', 0.5, 1.5, 2.5, 3.5, 4)
	recode `var'mean (0.5=0) (1.5=1) (2.5=2) (3.5=3) (4=4), gen(`var'new)
}
*only cuba needs it to be converted to string
if `country' == 2{
	tostring n_clustid, replace
}

rename n_clustid Cluster
merge 1:m Cluster using Everything_Wide
drop _merge
save Everything_Wide, replace

if `country' == 2 {
	merge m:m pid using "Cuba_CDR.dta"
	drop _merge
}

**********
* SUMMARY VARIABLES
**********

*drop all Summary variables (JORM, ADL, IADL, memory, NPI, MMSE.)
drop JORM_IQCODE_summ i_JORM_IQCODE_summ ADL_summ IADL_summ i_ADL_summ i_IADL_summ NPIQ_summary_score i_NPI_summ MMSE_denominator c_MMSEscore_raw2 s_depression_score s_depression_score1 MUNDO_score serial7_score serial7_score2
drop CSID_blessed_score walk_score TICS_CSID_score CSID_object_naming_score CSID_concept_nomination_score orientation_score comprehension_score T1_immediate_word_recall_score T2_immediate_word_recall_score T3_immediate_word_recall_score
drop immediate_word_recall_total delayed_word_recall_score word_recognition_total_score CSID_blessed_decline_score CSID_memory_score MMSE_immediate_recall MMSE_delayed_recall MMSE_object_naming MMSE_paper_folding_task i_memory_summ

*gen serial 7s
gen serial7_score = 0
replace serial7_score = 1 if c_15 == 93
replace serial7_score = (serial7_score + 1) if ((c_15 - 7 == c_16) & (c_15 ~= .i) & (c_15 ~= .v) & (c_15 ~= .) & (c_16 ~= .i) & (c_16 ~= .v) & (c_16 ~= .))
replace serial7_score = (serial7_score + 1) if ((c_16 - 7 == c_17) & (c_17 ~= .i) & (c_17 ~= .) & (c_17 ~= .v) & (c_16 ~= .i) & (c_16 ~= .v) & (c_16 ~= .))
replace serial7_score = (serial7_score + 1) if ((c_17 - 7 == c_18) & (c_17 ~= .i) & (c_17 ~= .) & (c_17 ~= .v) & (c_18 ~= .i) & (c_18 ~= .v) & (c_18 ~= .))
replace serial7_score = (serial7_score + 1) if ((c_18 - 7 == c_19) & (c_19 ~= .i) & (c_19 ~= .) & (c_19 ~= .v) & (c_18 ~= .i) & (c_18 ~= .v) & (c_18 ~= .))
replace serial7_score = . if c_15 == . | c_15 == .i | c_15 == .v
label variable serial7_score "CADAS Series of subtractions 7 from 100 (0-5)"

*create WORLD spelled backwards score variable (question 20)
gen worldspelling_score = 0
gen c_20_temp = c_20
replace c_20_temp = subinstr(c_20_temp,"0","o",.)
quietly forvalues obs = 1(1) `=_N' {
	forvalues character = `=strlen(c_20_temp[`obs'])'(-1) 1 {
		if substr(c_20_temp[`obs'],-`character',1) ~= "o" {
			if substr(c_20_temp[`obs'],-`character',1) ~= "d" {
				if substr(c_20_temp[`obs'],-`character',1) ~= "n" {
					if substr(c_20_temp[`obs'],-`character',1) ~= "u" {
						if substr(c_20_temp[`obs'],-`character',1) ~= "m" {
							replace c_20_temp = subinstr(c_20_temp[`obs'],substr(c_20_temp[`obs'],-`character',1),"",1) in `obs'
						}
						else {
							continue
						}
					}
					else {
						continue
					}
				}
				else {
					continue
				}
			}	
			else {
				continue
			}
		}
		else {
			continue
		}
	}
}
quietly forvalues i = 1(1) `=_N' {
	local x = 1
	while `x' <= strlen(c_20_temp[`i']) {
		if substr(c_20_temp[`i'],`x',1) == "o" {
			replace c_20_temp = subinstr(c_20_temp[`i'],substr(c_20_temp[`i'],`x',1),"1",.) in `i'
			local x = `x' + 1
			continue
		}

		else {
			if substr(c_20_temp[`i'],`x',1) == "d" {
				replace c_20_temp = subinstr(c_20_temp[`i'],substr(c_20_temp[`i'],`x',1),"2",.) in `i'
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "n" {
				replace c_20_temp = subinstr(c_20_temp[`i'],substr(c_20_temp[`i'],`x',1),"3",.) in `i'
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "u" {
				replace c_20_temp = subinstr(c_20_temp[`i'],substr(c_20_temp[`i'],`x',1),"4",.) in `i'
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "m" {
				replace c_20_temp = subinstr(c_20_temp[`i'],substr(c_20_temp[`i'],`x',1),"5",.) in `i'
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "1" {
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "2" {
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "3" {
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "4" {
				local x = `x' + 1
				continue
			}
		}
		else {
			if substr(c_20_temp[`i'],`x',1) == "5" {
				local x = `x' + 1
				continue
			}
		}
		else {
			continue, break
		}
	}
}
gen spell_score_temp = 1
program score

	local temp = `1'

	replace spell_score_temp = 1 in `2'

	local previous = 1

	forvalues spot = 1(1) `=strlen("`temp'")' {

		if substr("`temp'",`spot',1) > substr("`temp'",`previous',1) {

			replace spell_score_temp = (spell_score_temp + 1) in `2'

			local previous = `spot'

		}

		if spell_score_temp[`2'] > worldspelling_score[`2'] {

			replace worldspelling_score = spell_score_temp[`2'] in `2'

		}

	}

	forvalues spot = 1(1) `=strlen("`1'")' {

		local temp = subinstr("`1'",substr("`1'",`spot',1),"",1)

		if strlen("`temp'") > 2 {

			score `temp' `2'

		}

	}

end
if `country' == 0 {
	replace c_20_temp = "12345" if c_20_temp == "5432112345"
}
if `country' == 0 {
	replace c_20_temp = substr(c_20_temp, -6, .) if strlen(c_20_temp) > 5
}
quietly forvalues obs = 1(1) `=_N' {
	if c_20_temp[`obs'] ~= "" {
		local name = c_20_temp[`obs']
			score `name' `obs'
	}
}
replace worldspelling_score = .i if c_20 == ".i"
replace worldspelling_score = .v if c_20 == "7"
replace worldspelling_score = 0 if c_20 == "no dijo nada"
drop c_20_temp spell_score_temp

*create mini-mental status exam (MMSE) score (questions 1-32)
gen c_MMSEscore = 0
replace c_MMSEscore = (c_MMSEscore + 1) if c_1 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_2_p_c == 1 & (c_country == 0 | c_country == 2)
replace c_MMSEscore = (c_MMSEscore + 1) if c_2_d == 1 & c_country == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_3 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_4 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_5 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_6 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_7_d_c == 1 & (c_country == 1 | c_country == 2)
replace c_MMSEscore = (c_MMSEscore + 1) if c_7_p == 1 & c_country == 0
replace c_MMSEscore = (c_MMSEscore + 1) if c_8 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_9 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_10 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_11 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_12 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_13 == 1
replace c_MMSEscore = (c_MMSEscore + worldspelling_score) if ((worldspelling_score ~= .v) & (worldspelling_score ~= .i) & (worldspelling_score > serial7_score))
replace c_MMSEscore = (c_MMSEscore + serial7_score) if ((worldspelling_score ~= .v) & (worldspelling_score ~= .i) & (worldspelling_score <= serial7_score))
replace c_MMSEscore = (c_MMSEscore + serial7_score) if ((worldspelling_score == .v) | (worldspelling_score == .i))
replace c_MMSEscore = (c_MMSEscore + 1) if c_21 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_22 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_23 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_26 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_24 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_25 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_27 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_28 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_29 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_30 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_31 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if cs_32_interviewers == 1
gen c_MMSEscore_raw = c_MMSEscore
gen MMSEcorrection = 0
replace MMSEcorrection = (MMSEcorrection + 1) if c_24 == 6
replace MMSEcorrection = (MMSEcorrection + 1) if c_25 == 6
replace MMSEcorrection = (MMSEcorrection + 1) if c_27 == 6
replace MMSEcorrection = (MMSEcorrection + 1) if c_28 == 6
replace MMSEcorrection = (MMSEcorrection + 1) if c_29 == 6
replace MMSEcorrection = (MMSEcorrection + 1) if (c_30 == 5 | c_30 == 6)
replace MMSEcorrection = (MMSEcorrection + 1) if (c_31 == 5 | c_31 == 6)
replace MMSEcorrection = (MMSEcorrection + 1) if c_32 == 6
replace c_MMSEscore = ((c_MMSEscore)*30/(30 - (MMSEcorrection)))
replace c_MMSEscore = . if missing(c_1, c_2_d, c_3, c_4, c_5, c_6, c_7_d_c, c_8, c_9, c_10, c_11, c_12, c_13, worldspelling_score, serial7_score, c_20, c_21, c_22, c_23, c_24, c_25, c_26, c_27, c_28, c_29, c_30, c_31, cs_32_interviewers)
drop MMSEcorrection

*create 10 word list learning score (questions 33-35)
gen c_33_score = 0
replace c_33_score = (c_33_score + 1) if (c_33_1 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_2 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_3 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_4 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_5 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_6 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_7 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_8 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_9 == 1 & c_33_a == 0)
replace c_33_score = (c_33_score + 1) if (c_33_10 == 1 & c_33_a == 0)
replace c_33_score = .r if c_33_a == 7
replace c_33_score = . if missing(c_33_1, c_33_2, c_33_3, c_33_4, c_33_5, c_33_6, c_33_7, c_33_8, c_33_9, c_33_10)
gen c_34_score = 0
replace c_34_score = (c_34_score + 1) if (c_34_1 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_2 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_3 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_4 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_5 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_6 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_7 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_8 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_9 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = (c_34_score + 1) if (c_34_10 == 1 & c_33_a == 0 & c_34_a == 0)
replace c_34_score = .r if (c_33_a == 7 | c_34_a == 7)
replace c_34_score = . if missing(c_34_1, c_34_2, c_34_3, c_34_4, c_34_5, c_34_6, c_34_7, c_34_8, c_34_9, c_34_10)
gen c_35_score = 0
replace c_35_score = (c_34_score + 1) if (c_35_1 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_2 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_3 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_4 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_5 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_6 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_7 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_8 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_9 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = (c_34_score + 1) if (c_35_10 == 1 & c_33_a == 0 & c_34_a == 0 & c_35_a == 0)
replace c_35_score = .r if (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
replace c_35_score = . if missing(c_35_1, c_35_2, c_35_3, c_35_4, c_35_5, c_35_6, c_35_7, c_35_8, c_35_9, c_35_10)

*create delayed recall score (question 63)
gen c_63_score = 0
replace c_63_score = (c_63_score + 1) if (c_63_1 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_2 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_3 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_4 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_5 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_6 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_7 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_8 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_9 == 1 & c_63_a == 0)
replace c_63_score = (c_63_score + 1) if (c_63_10 == 1 & c_63_a == 0)
replace c_63_score = .r if c_63_a == 7
replace c_63_score = . if missing(c_63_1, c_63_2, c_63_3, c_63_4, c_63_5, c_63_6, c_63_7, c_63_8, c_63_9, c_63_10)

*create recognition score (question 68)
gen c_68_onlist = 0
replace c_68_onlist = (c_68_onlist + 1) if (c_68_03 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_05 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_08 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_11 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_17 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_19 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_12 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_20 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_06 == 1 & c_68_a == 0)
replace c_68_onlist = (c_68_onlist + 1) if (c_68_14 == 1 & c_68_a == 0)
replace c_68_onlist = .r if c_68_a == 7
replace c_68_onlist = . if missing(c_68_01, c_68_20, c_68_03, c_68_04, c_68_05, c_68_06, c_68_07, c_68_08, c_68_09, c_68_10, c_68_11, c_68_12, c_68_13, c_68_14, c_68_15, c_68_16, c_68_17, c_68_18, c_68_19, c_68_20)
gen c_68_notlist = 0
replace c_68_notlist = (c_68_notlist + 1) if (c_68_01 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_02 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_04 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_07 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_09 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_10 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_13 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_15 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_16 == 1 & c_68_a == 0)
replace c_68_notlist = (c_68_notlist + 1) if (c_68_18 == 1 & c_68_a == 0)
replace c_68_notlist = .r if c_68_a == 7
replace c_68_notlist = . if missing(c_68_01, c_68_20, c_68_03, c_68_04, c_68_05, c_68_06, c_68_07, c_68_08, c_68_09, c_68_10, c_68_11, c_68_12, c_68_13, c_68_14, c_68_15, c_68_16, c_68_17, c_68_18, c_68_19, c_68_20)

*create short story score immediate recall (exact recall, question 66)
gen shortstory_immediate_exact = 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66a == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66b == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66c == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66d == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66e == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66f == 0
replace shortstory_immediate_exact = . if missing(c_66a, c_66b, c_66c, c_66d, c_66e, c_66f)

*create short story score immediate recall (approximate recall, question 66)
gen shortstory_immediate_approximate = 0
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66a == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66b == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66c == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66d == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66e == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66f == 1
replace shortstory_immediate_approximate = . if missing(c_66a, c_66b, c_66c, c_66d, c_66e, c_66f)

*create short story score delayed recall (exact recall, question 77)
gen shortstory_delayed_exact = 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77a == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77b == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77c == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77d == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77e == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77f == 0
replace shortstory_delayed_exact = . if missing(c_77a, c_77b, c_77c, c_77d, c_77e, c_77f)

*create short story score delayed recall (approximate recall, question 77)
gen shortstory_delayed_approximate = 0
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77a == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77b == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77c == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77d == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77e == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77f == 1
replace shortstory_delayed_approximate = . if missing(c_77a, c_77b, c_77c, c_77d, c_77e, c_77f)

*create long story score immediate recall (exact recall, question 67)
gen longstory_immediate_exact = 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_01 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_02 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_03 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_04 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_05 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_06 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_07 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_08 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_09 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_10 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_11 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_12 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_13_c == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_13_d == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_13_p == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_14 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_15 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_16 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_17 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_18 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_19 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_20 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_21 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_22 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_23 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_24 == 0
replace longstory_immediate_exact = (longstory_immediate_exact + 1) if c_67_25 == 0
replace longstory_immediate_exact = . if missing(c_67_01, c_67_02, c_67_03, c_67_04, c_67_05, c_67_06, c_67_07, c_67_08, c_67_09, c_67_10, c_67_11, c_67_12, c_67_13_d, c_67_14, c_67_15, c_67_16, c_67_17, c_67_18, c_67_19, c_67_20, c_67_21, c_67_22, c_67_23, c_67_24, c_67_25)

*create long story score immediate recall (approximate recall, question 67)
gen longstory_immediate_approximate = 0
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_01 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_02 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_03 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_04 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_05 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_06 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_07 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_08 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_09 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_10 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_11 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_12 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_13_c == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_13_d == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_13_p == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_14 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_15 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_16 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_17 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_18 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_19 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_20 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_21 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_22 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_23 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_24 == 1
replace longstory_immediate_approximate = (longstory_immediate_approximate + 1) if c_67_25 == 1
replace longstory_immediate_approximate = . if missing(c_67_01, c_67_02, c_67_03, c_67_04, c_67_05, c_67_06, c_67_07, c_67_08, c_67_09, c_67_10, c_67_11, c_67_12, c_67_13_d, c_67_14, c_67_15, c_67_16, c_67_17, c_67_18, c_67_19, c_67_20, c_67_21, c_67_22, c_67_23, c_67_24, c_67_25)

*create long story score delayed recall (exact recall, question 78)
gen longstory_delayed_exact = 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_01 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_02 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_03 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_04 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_05 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_06 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_07 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_08 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_09 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_10 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_11 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_12 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_13 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_14 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_15 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_16 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_17 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_18 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_19 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_20 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_21 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_22 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_23 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_24 == 0
replace longstory_delayed_exact = (longstory_delayed_exact + 1) if c_78_25 == 0
replace longstory_delayed_exact = . if missing(c_78_01, c_78_02, c_78_03, c_78_04, c_78_05, c_78_06, c_78_07, c_78_08, c_78_09, c_78_10, c_78_11, c_78_12, c_78_13, c_78_14, c_78_15, c_78_16, c_78_17, c_78_18, c_78_19, c_78_20, c_78_21, c_78_22, c_78_23, c_78_24, c_78_25)

*create long story score delayed recall (approximate recall, question 78)
gen longstory_delayed_approximate = 0
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_01 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_02 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_03 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_04 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_05 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_06 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_07 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_08 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_09 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_10 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_11 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_12 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_13 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_14 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_15 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_16 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_17 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_18 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_19 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_20 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_21 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_22 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_23 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_24 == 1
replace longstory_delayed_approximate = (longstory_delayed_approximate + 1) if c_78_25 == 1
replace longstory_delayed_approximate = . if missing(c_78_01, c_78_02, c_78_03, c_78_04, c_78_05, c_78_06, c_78_07, c_78_08, c_78_09, c_78_10, c_78_11, c_78_12, c_78_13, c_78_14, c_78_15, c_78_16, c_78_17, c_78_18, c_78_19, c_78_20, c_78_21, c_78_22, c_78_23, c_78_24, c_78_25)


*depression score from s.10.1
gen s_depression_score = 0
replace s_depression_score = (s_depression_score + 1) if s_10_1a == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1b == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1c == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1d == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1e == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1f == 5
replace s_depression_score = (s_depression_score + 1) if s_10_1g == 1
replace s_depression_score = (s_depression_score + 1) if s_10_1h == 1
*for now we want a score that is missing if any depression indicators are missing
replace s_depression_score = . if s_10_1a == . | s_10_1a == .i |s_10_1a == .v
replace s_depression_score = . if s_10_1b == . | s_10_1b == .i |s_10_1b == .v
replace s_depression_score = . if s_10_1c == . | s_10_1c == .i |s_10_1c == .v
replace s_depression_score = . if s_10_1d == . | s_10_1d == .i |s_10_1d == .v
replace s_depression_score = . if s_10_1e == . | s_10_1e == .i |s_10_1e == .v
replace s_depression_score = . if s_10_1f == . | s_10_1f == .i |s_10_1f == .v
replace s_depression_score = . if s_10_1g == . | s_10_1g == .i |s_10_1g == .v
replace s_depression_score = . if s_10_1h == . | s_10_1h == .i |s_10_1h == .v

*summary of 3 ADL limitations (# with difficulty, i.e. >0), from F.CSID 22.1, 23.1, 24.1
gen i_ADL_summ = 0
replace i_ADL_summ = (i_ADL_summ + 1) if ((i_f_csid_22_1 == 1 | i_f_csid_22_1 == 2 | i_f_csid_22_1 == 3) & i_f_csid_22_2 ~= 1)
replace i_ADL_summ = (i_ADL_summ + 1) if ((i_f_csid_23_1 == 1 | i_f_csid_23_1 == 2 | i_f_csid_23_1 == 3) & i_f_csid_23_2 ~= 1)
replace i_ADL_summ = (i_ADL_summ + 1) if ((i_f_csid_24_1 == 1 | i_f_csid_24_1 == 2 | i_f_csid_24_1 == 3) & i_f_csid_24_2 ~= 1)
replace i_ADL_summ = . if missing(i_f_csid_22_1, i_f_csid_23_1, i_f_csid_24_1)

*summary of 4 IADL limitations from F.CSID (# with problem, i.e. >0), from F.CSID.16, 17, 18, 19
gen i_IADL_summ = 0
replace i_IADL_summ = (i_IADL_summ + 1) if (i_f_csid_16 == 1 | i_f_csid_16 == 2)
replace i_IADL_summ = (i_IADL_summ + 1) if ((i_f_csid_17 == 1 | i_f_csid_17 == 2) & i_f_csid_17a ~= 1)
replace i_IADL_summ = (i_IADL_summ + 1) if (i_f_csid_18 == 1)
replace i_IADL_summ = (i_IADL_summ + 1) if (i_f_csid_19 == 1 | i_f_csid_19 == 2)
replace i_IADL_summ = . if missing(i_f_csid_16, i_f_csid_17, i_f_csid_18, i_f_csid_19)

*summary of 6 memory variables (# with problem, i.e. >0) from section F such as F.BSE.3
gen i_memory_summ = 0
replace i_memory_summ = (i_memory_summ + 1) if (i_f_bse_3 == 1 | i_f_bse_3 == 2)
replace i_memory_summ = (i_memory_summ + 1) if (i_f_bse_7 == 1 | i_f_bse_7 == 2)
replace i_memory_summ = (i_memory_summ + 1) if (i_f_csid_11 == 1 | i_f_csid_11 == 2)
replace i_memory_summ = (i_memory_summ + 1) if (i_f_csid_13 == 1 | i_f_csid_13 == 2)
replace i_memory_summ = (i_memory_summ + 1) if (i_f_csid_15 == 1 | i_f_csid_15 == 2)
replace i_memory_summ = (i_memory_summ + 1) if (i_f_csid_16 == 1 | i_f_csid_16 == 2)
replace i_memory_summ = . if missing(i_f_bse_3, i_f_bse_7, i_f_csid_11, i_f_csid_13, i_f_csid_15, i_f_csid_16)

*summary of 12 NPI questions from section H
*NPI-Q Summary Score
gen NPIQ_summary_score = 0
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_1) if (i_h_npi_1 ~= 8 & i_h_npi_1 ~= 9 & i_h_npi_1 ~= .i & i_h_npi_1 ~= .v & i_h_npi_1 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_2) if (i_h_npi_2 ~= 8 & i_h_npi_2 ~= 9 & i_h_npi_2 ~= .i & i_h_npi_2 ~= .v & i_h_npi_2 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_3) if (i_h_npi_3 ~= 8 & i_h_npi_3 ~= 9 & i_h_npi_3 ~= .i & i_h_npi_3 ~= .v & i_h_npi_3 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_4) if (i_h_npi_4 ~= 8 & i_h_npi_4 ~= 9 & i_h_npi_4 ~= .i & i_h_npi_4 ~= .v & i_h_npi_4 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_5) if (i_h_npi_5 ~= 8 & i_h_npi_5 ~= 9 & i_h_npi_5 ~= .i & i_h_npi_5 ~= .v & i_h_npi_5 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_6) if (i_h_npi_6 ~= 8 & i_h_npi_6 ~= 9 & i_h_npi_6 ~= .i & i_h_npi_6 ~= .v & i_h_npi_6 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_7) if (i_h_npi_7 ~= 8 & i_h_npi_7 ~= 9 & i_h_npi_7 ~= .i & i_h_npi_7 ~= .v & i_h_npi_7 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_8) if (i_h_npi_8 ~= 8 & i_h_npi_8 ~= 9 & i_h_npi_8 ~= .i & i_h_npi_8 ~= .v & i_h_npi_8 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_9) if (i_h_npi_9 ~= 8 & i_h_npi_9 ~= 9 & i_h_npi_9 ~= .i & i_h_npi_9 ~= .v & i_h_npi_9 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_10) if (i_h_npi_10 ~= 8 & i_h_npi_10 ~= 9 & i_h_npi_10 ~= .i & i_h_npi_10 ~= .v & i_h_npi_10 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_11) if (i_h_npi_11 ~= 8 & i_h_npi_11 ~= 9 & i_h_npi_11 ~= .i & i_h_npi_11 ~= .v & i_h_npi_11 ~= .)
replace NPIQ_summary_score = (NPIQ_summary_score + i_h_npi_12) if (i_h_npi_12 ~= 8 & i_h_npi_12 ~= 9 & i_h_npi_12 ~= .i & i_h_npi_12 ~= .v & i_h_npi_12 ~= .)
replace NPIQ_summary_score = . if missing(i_h_npi_1, i_h_npi_2, i_h_npi_3, i_h_npi_4, i_h_npi_5, i_h_npi_6, i_h_npi_7, i_h_npi_8, i_h_npi_9, i_h_npi_10, i_h_npi_11, i_h_npi_12)

gen NPIQ_denom = 12
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_1 == 8 | i_h_npi_1 == 9 | i_h_npi_1 == .i | i_h_npi_1 == .v | i_h_npi_1 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_2 == 8 | i_h_npi_2 == 9 | i_h_npi_2 == .i | i_h_npi_2 == .v | i_h_npi_2 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_3 == 8 | i_h_npi_3 == 9 | i_h_npi_3 == .i | i_h_npi_3 == .v | i_h_npi_3 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_4 == 8 | i_h_npi_4 == 9 | i_h_npi_4 == .i | i_h_npi_4 == .v | i_h_npi_4 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_5 == 8 | i_h_npi_5 == 9 | i_h_npi_5 == .i | i_h_npi_5 == .v | i_h_npi_5 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_6 == 8 | i_h_npi_6 == 9 | i_h_npi_6 == .i | i_h_npi_6 == .v | i_h_npi_6 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_7 == 8 | i_h_npi_7 == 9 | i_h_npi_7 == .i | i_h_npi_7 == .v | i_h_npi_7 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_8 == 8 | i_h_npi_8 == 9 | i_h_npi_8 == .i | i_h_npi_8 == .v | i_h_npi_8 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_9 == 8 | i_h_npi_9 == 9 | i_h_npi_9 == .i | i_h_npi_9 == .v | i_h_npi_9 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_10 == 8 | i_h_npi_10 == 9 | i_h_npi_10 == .i | i_h_npi_10 == .v | i_h_npi_10 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_11 == 8 | i_h_npi_11 == 9 | i_h_npi_11 == .i | i_h_npi_11 == .v | i_h_npi_11 == .)
replace NPIQ_denom = (NPIQ_denom - 1) if (i_h_npi_12 == 8 | i_h_npi_12 == 9 | i_h_npi_12 == .i | i_h_npi_12 == .v | i_h_npi_12 == .)
replace NPIQ_summary_score = round((NPIQ_summary_score * 12)/NPIQ_denom)

*summary scale for the JORM IQCODE in section E (mean across 16 questions)
gen i_JORM_IQCODE_summ_raw = 0
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e1) if (i_e1 ~= 8 & i_e1 ~= 9 & i_e1 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e2) if (i_e2 ~= 8 & i_e2 ~= 9 & i_e2 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e3) if (i_e3 ~= 8 & i_e3 ~= 9 & i_e3 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e4) if (i_e4 ~= 8 & i_e4 ~= 9 & i_e4 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e5) if (i_e5 ~= 8 & i_e5 ~= 9 & i_e5 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e6) if (i_e6 ~= 8 & i_e6 ~= 9 & i_e6 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e7) if (i_e7 ~= 8 & i_e7 ~= 9 & i_e7 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e8) if (i_e8 ~= 8 & i_e8 ~= 9 & i_e8 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e9) if (i_e9 ~= 8 & i_e9 ~= 9 & i_e9 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e10) if (i_e10 ~= 8 & i_e10 ~= 9 & i_e10 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e11) if (i_e11 ~= 8 & i_e11 ~= 9 & i_e11 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e12) if (i_e12 ~= 8 & i_e12 ~= 9 & i_e12 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e13) if (i_e13 ~= 8 & i_e13 ~= 9 & i_e13 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e14) if (i_e14 ~= 8 & i_e14 ~= 9 & i_e14 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e15) if (i_e15 ~= 8 & i_e15 ~= 9 & i_e15 ~= .i)
replace i_JORM_IQCODE_summ_raw = (i_JORM_IQCODE_summ_raw + i_e16) if (i_e16 ~= 8 & i_e16 ~= 9 & i_e16 ~= .i)
replace i_JORM_IQCODE_summ_raw = . if missing(i_e1, i_e2, i_e3, i_e4, i_e5, i_e6, i_e7, i_e8, i_e9, i_e10, i_e11, i_e12, i_e13, i_e14, i_e15, i_e16)

gen i_JORM_IQCODE_impute = 0
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e1 == 8 | i_e1 == 9 | i_e1 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e2 == 8 | i_e2 == 9 | i_e2 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e3 == 8 | i_e3 == 9 | i_e3 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e4 == 8 | i_e4 == 9 | i_e4 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e5 == 8 | i_e5 == 9 | i_e5 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e6 == 8 | i_e6 == 9 | i_e6 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e7 == 8 | i_e7 == 9 | i_e7 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e8 == 8 | i_e8 == 9 | i_e8 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e9 == 8 | i_e9 == 9 | i_e9 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e10 == 8 | i_e10 == 9 | i_e10 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e11 == 8 | i_e11 == 9 | i_e11 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e12 == 8 | i_e12 == 9 | i_e12 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e13 == 8 | i_e13 == 9 | i_e13 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e14 == 8 | i_e14 == 9 | i_e14 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e15 == 8 | i_e15 == 9 | i_e15 == .i)
replace i_JORM_IQCODE_impute = (i_JORM_IQCODE_impute + 1) if (i_e16 == 8 | i_e16 == 9 | i_e16 == .i)
gen i_JORM_IQCODE_summ = ((i_JORM_IQCODE_summ_raw)/(16 - i_JORM_IQCODE_impute)) if i_JORM_IQCODE_impute ~= 16
drop i_JORM_IQCODE_impute

*CSI-D/Blessed 1 Total Score
gen CSID_blessed_score = 0
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_1 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_2 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_3 == 1
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_4 == 1
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_5 == 1
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_bse_3 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_bse_3 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_bse_7 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_bse_7 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_6 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_6 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_7 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_7 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_8 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_8 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_9 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_9 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_10 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_10 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_11 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_11 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_12 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_12 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_13 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_13 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_14 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_14 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_15 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_15 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_16 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_16 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if (i_f_csid_17 == 1 & i_f_csid_17a ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_17 == 2 & i_f_csid_17a ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_18 == 1
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_19 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_19 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_20 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_20 == 2
replace CSID_blessed_score = (CSID_blessed_score + 0.5) if i_f_csid_21 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_21 == 2
replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_22_1 == 1 & i_f_csid_22_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_22_1 == 2 & i_f_csid_22_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_22_1 == 3 & i_f_csid_22_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_23_1 == 1 & i_f_csid_23_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_23_1 == 2 & i_f_csid_23_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_23_1 == 3 & i_f_csid_23_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 1) if (i_f_csid_24_1 == 1 & i_f_csid_24_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 2) if (i_f_csid_24_1 == 2 & i_f_csid_24_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 3) if (i_f_csid_24_1 == 3 & i_f_csid_24_2 ~= 1)
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_25 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_26 == 1
replace CSID_blessed_score = (CSID_blessed_score + 1) if i_f_csid_27 == 1
replace CSID_blessed_score = . if missing(i_f_csid_1, i_f_csid_2, i_f_csid_3, i_f_csid_4, i_f_csid_5, i_f_bse_3, i_f_bse_7, i_f_csid_6, i_f_csid_7, i_f_csid_8, i_f_csid_9, i_f_csid_10, i_f_csid_11, i_f_csid_12)
replace CSID_blessed_score = . if missing(i_f_csid_13, i_f_csid_14, i_f_csid_15, i_f_csid_16, i_f_csid_17, i_f_csid_18, i_f_csid_19, i_f_csid_20, i_f_csid_21, i_f_csid_22_1, i_f_csid_23_1, i_f_csid_24_1, i_f_csid_25, i_f_csid_26, i_f_csid_27)

*TICS_CSID_score
gen TICS_CSID_score = 0
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_48 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_49 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_50 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_51 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_52 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_53 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_54 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_55 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_56 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a2 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a3 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if i_a4 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_61 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_62 == 1
replace TICS_CSID_score = (TICS_CSID_score + 1) if c_70_all == 1
replace TICS_CSID_score = . if missing(c_48, c_49, c_50, c_51, c_52, c_53, c_54, c_55, c_56, i_a2, i_a3, i_a4, c_61, c_62, c_70_all)
gen TICS_CSID_denom = 15
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_48 == . | c_48 == .i | c_48 == .v | c_48 == 6 | c_48 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_49 == . | c_49 == .i | c_49 == .v | c_49 == 6 | c_49 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_50 == . | c_50 == .i | c_50 == .v | c_50 == 6 | c_50 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_51 == . | c_51 == .i | c_51 == .v | c_51 == 6 | c_51 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_52 == . | c_52 == .i | c_52 == .v | c_52 == 6 | c_52 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_53 == . | c_53 == .i | c_53 == .v | c_53 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_54 == . | c_54 == .i | c_54 == .v | c_54 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_55 == . | c_55 == .i | c_55 == .v | c_55 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_56 == . | c_56 == .i | c_56 == .v | c_56 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a2 == . | i_a2 == .i | i_a2 == .v | i_a2 == 8 | i_a2 == 9)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a3 == . | i_a3 == .i | i_a3 == .v | i_a2 == 8 | i_a2 == 9)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (i_a4 == . | i_a4 == .i | i_a4 == .v | i_a4 == 8 | i_a4 == 9)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_61 == . | c_61 == .i | c_61 == .v | c_61 == 6 | c_61 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_62 == . | c_62 == .i | c_62 == .v | c_61 == 6 | c_61 == 7)
replace TICS_CSID_denom = (TICS_CSID_denom - 1) if (c_70_all == . | c_70_all == .i | c_70_all == .v)

replace TICS_CSID_score = round((TICS_CSID_score * 15)/TICS_CSID_denom)
drop TICS_CSID_denom

*Walk score
gen walk_score = "."
replace walk_score = "Cannot walk" if s_12_11 == 2
replace walk_score = "Difficulty walking several blocks" if (s_12_11 == 1 & s_12_13 == 1)
replace walk_score =  "No difficulty walking several blocks" if s_12_13 == 2

*CSID object naming score
gen CSID_object_naming_score = 0
replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_48 == 1
replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_49 == 1
replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_50 == 1
replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_51 == 1
replace CSID_object_naming_score = (CSID_object_naming_score + 1) if c_52 == 1
replace CSID_object_naming_score = . if missing(c_48, c_49, c_50, c_51, c_52)
gen object_naming_denom = 5
replace object_naming_denom = (object_naming_denom - 1) if (c_48 == . | c_48 == .i | c_48 == .v | c_48 == 6 | c_48 == 7)
replace object_naming_denom = (object_naming_denom - 1) if (c_49 == . | c_49 == .i | c_49 == .v | c_49 == 6 | c_49 == 7)
replace object_naming_denom = (object_naming_denom - 1) if (c_50 == . | c_50 == .i | c_50 == .v | c_50 == 6 | c_50 == 7)
replace object_naming_denom = (object_naming_denom - 1) if (c_51 == . | c_51 == .i | c_51 == .v | c_51 == 6 | c_51 == 7)
replace object_naming_denom = (object_naming_denom - 1) if (c_52 == . | c_52 == .i | c_52 == .v | c_52 == 6 | c_52 == 7)
replace CSID_object_naming_score = round((CSID_object_naming_score * 5)/object_naming_denom)
drop object_naming_denom

*CSID concept nomination score
gen CSID_concept_nomination_score = 0
replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_53 == 1
replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_54 == 1
replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_55 == 1
replace CSID_concept_nomination_score = (CSID_concept_nomination_score + 1) if c_56 == 1
replace CSID_concept_nomination_score = . if missing(c_53, c_54, c_55, c_56)
gen concept_nomination_denom = 4
replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_53 == . | c_53 == .i | c_53 == .v | c_53 == 7)
replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_54 == . | c_54 == .i | c_54 == .v | c_54 == 7)
replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_55 == . | c_55 == .i | c_55 == .v | c_55 == 7)
replace concept_nomination_denom = (concept_nomination_denom - 1) if (c_56 == . | c_56 == .i | c_56 == .v | c_56 == 7)
replace CSID_concept_nomination_score = round((CSID_concept_nomination_score * 4)/concept_nomination_denom)
drop concept_nomination_denom

*Orientation score
gen orientation_score = 0
replace orientation_score = (orientation_score + 1) if i_a2 == 1
replace orientation_score = (orientation_score + 1) if i_a3 == 1
replace orientation_score = (orientation_score + 1) if i_a4 == 1
replace orientation_score = . if missing(i_a2, i_a3, i_a4)
gen orientation_denom = 3
replace orientation_denom = (orientation_denom - 1) if (i_a2 == . | i_a2 == .i | i_a2 == .v | i_a2 == 8 | i_a2 == 9)
replace orientation_denom = (orientation_denom - 1) if (i_a3 == . | i_a3 == .i | i_a3 == .v | i_a2 == 8 | i_a2 == 9)
replace orientation_denom = (orientation_denom - 1) if (i_a4 == . | i_a4 == .i | i_a4 == .v | i_a4 == 8 | i_a4 == 9)
replace orientation_score = round((orientation_score * 3)/orientation_denom)
drop orientation_denom

*Comprehension score
gen comprehension_score = 0
replace comprehension_score = (comprehension_score + 1) if c_61 == 1
replace comprehension_score = (comprehension_score + 1) if c_62 == 1
replace comprehension_score = . if missing(c_61, c_62)
gen comprehension_denom = 2
replace comprehension_denom = (comprehension_denom - 1) if (c_61 == . | c_61 == .i | c_61 == .v | c_61 == 6 | c_61 == 7)
replace comprehension_denom = (comprehension_denom - 1) if (c_62 == . | c_62 == .i | c_62 == .v | c_61 == 6 | c_61 == 7)
replace comprehension_score = round((comprehension_score * 2)/comprehension_denom)
drop comprehension_denom

*Trial 1 immediate word recall
gen T1_immediate_word_recall_score = 0
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_1 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_2 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_3 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_4 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_5 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_6 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_7 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_8 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_9 == 1
replace T1_immediate_word_recall_score = (T1_immediate_word_recall_score + 1) if c_33_10 == 1
replace T1_immediate_word_recall_score = . if missing(c_33_1, c_33_2, c_33_3, c_33_4, c_33_5, c_33_6, c_33_7, c_33_8, c_33_9, c_33_10)
replace T1_immediate_word_recall_score = .v if (T1_immediate_word_recall_score == 0 & c_33_a == 7)

*Trial 2 immediate word recall
gen T2_immediate_word_recall_score = 0
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_1 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_2 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_3 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_4 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_5 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_6 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_7 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_8 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_9 == 1
replace T2_immediate_word_recall_score = (T2_immediate_word_recall_score + 1) if c_34_10 == 1
replace T2_immediate_word_recall_score = . if missing(c_34_1, c_34_2, c_34_3, c_34_4, c_34_5, c_34_6, c_34_7, c_34_8, c_34_9, c_34_10)
replace T2_immediate_word_recall_score = .v if (T2_immediate_word_recall_score == 0 & c_34_a == 7)

*Trial 3 immediate word recall
gen T3_immediate_word_recall_score = 0
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_1 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_2 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_3 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_4 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_5 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_6 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_7 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_8 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_9 == 1
replace T3_immediate_word_recall_score = (T3_immediate_word_recall_score + 1) if c_35_10 == 1
replace T3_immediate_word_recall_score = . if missing(c_35_1, c_35_2, c_35_3, c_35_4, c_35_5, c_35_6, c_35_7, c_35_8, c_35_9, c_35_10)
replace T3_immediate_word_recall_score = .v if (T3_immediate_word_recall_score == 0 & c_35_a == 7)

*Immediate word recall total
gen immediate_word_recall_total = .
replace immediate_word_recall_total = ((T1_immediate_word_recall_score + T2_immediate_word_recall_score) * 3) if (c_33_a ~= 7 & c_34_a == 7)
replace immediate_word_recall_total = round((T1_immediate_word_recall_score + T2_immediate_word_recall_score) * 1.5) if (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a == 7)
replace immediate_word_recall_total = (T1_immediate_word_recall_score + T2_immediate_word_recall_score + T3_immediate_word_recall_score) if (c_33_a ~= 7 & c_34_a ~= 7 & c_35_a ~= 7)

*Delayed word recall
gen delayed_word_recall_score = 0
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_1 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_2 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_3 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_4 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_5 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_6 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_7 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_8 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_9 == 1
replace delayed_word_recall_score = (delayed_word_recall_score + 1) if c_63_10 == 1
replace delayed_word_recall_score = . if missing(c_63_1, c_63_2, c_63_3, c_63_4, c_63_5, c_63_6, c_63_7, c_63_8, c_63_9, c_63_10)
replace delayed_word_recall_score = .v if (delayed_word_recall_score == 0 & c_63_a == 7)

*Word recognition total
*this one is not based on correctness?
gen word_recognition_total_score = 0
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_01 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_02 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_03 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_04 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_05 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_06 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_07 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_08 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_09 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_10 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_11 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_12 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_13 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_14 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_15 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_16 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_17 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_18 == 2
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_19 == 1
replace word_recognition_total_score = (word_recognition_total_score + 1) if c_68_20 == 1
replace word_recognition_total_score = . if missing(c_68_01, c_68_02, c_68_03, c_68_04, c_68_05, c_68_06, c_68_07, c_68_08, c_68_09, c_68_10, c_68_11, c_68_12, c_68_13, c_68_14, c_68_15, c_68_16, c_68_17, c_68_18, c_68_19, c_68_20)
replace word_recognition_total_score = .v if (word_recognition_total_score == 0 & c_68_a == 7)

*CSI-D Blessed Decline Score
gen CSID_blessed_decline_score = 0
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_1 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_2 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_3 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_bse_3 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_bse_3 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_bse_7 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_bse_7 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_11 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_11 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_15 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_15 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_16 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_16 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if (i_f_csid_17 == 1 & i_f_csid_17a == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_17 == 2 & i_f_csid_17a == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 0.5) if i_f_csid_19 == 1
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if i_f_csid_19 == 2
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_22_1 == 1 & i_f_csid_22_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_22_1 == 2 & i_f_csid_22_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_22_1 == 3 & i_f_csid_22_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_23_1 == 1 & i_f_csid_23_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_23_1 == 2 & i_f_csid_23_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_23_1 == 3 & i_f_csid_23_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 1) if (i_f_csid_24_1 == 1 & i_f_csid_24_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 2) if (i_f_csid_24_1 == 2 & i_f_csid_24_2 == 0)
replace CSID_blessed_decline_score = (CSID_blessed_decline_score + 3) if (i_f_csid_24_1 == 3 & i_f_csid_24_2 == 0)
replace CSID_blessed_decline_score = . if missing(i_f_csid_1, i_f_csid_2, i_f_csid_3, i_f_bse_3, i_f_bse_7, i_f_csid_11, i_f_csid_15, i_f_csid_16, i_f_csid_17)
replace CSID_blessed_decline_score = . if missing(i_f_csid_19, i_f_csid_22_1, i_f_csid_23_1, i_f_csid_24_1)

gen CSID_blessed_decline_denom = 21 //* shouldn't this be out of 19?
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_1 == . | i_f_csid_1 == .i | i_f_csid_1 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_2 == . | i_f_csid_2 == .i | i_f_csid_2 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_3 == . | i_f_csid_3 == .i | i_f_csid_3 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_bse_3 == . | i_f_bse_3 == .i | i_f_bse_3 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_bse_7 == . | i_f_bse_7 == .i | i_f_bse_7 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_11 == . | i_f_csid_11 == .i | i_f_csid_11 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_15 == . | i_f_csid_15 == .i | i_f_csid_15 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_16 == . | i_f_csid_16 == .i | i_f_csid_16 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_17 == . | i_f_csid_17 == .i | i_f_csid_17 == .v | i_f_csid_17a == 1)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 1) if (i_f_csid_19 == . | i_f_csid_19 == .i | i_f_csid_19 == .v)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_22_1 == . | i_f_csid_22_1 == .i | i_f_csid_22_1 == .v | i_f_csid_22_2 == 1)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_23_1 == . | i_f_csid_23_1 == .i | i_f_csid_23_1 == .v | i_f_csid_23_2 == 1)
replace CSID_blessed_decline_denom = (CSID_blessed_decline_denom - 3) if (i_f_csid_24_1 == . | i_f_csid_24_1 == .i | i_f_csid_24_1 == .v | i_f_csid_24_2 == 1)
replace CSID_blessed_decline_score = round((CSID_blessed_decline_score * 21)/CSID_blessed_decline_denom)

*CSI-D Memory Score
gen CSID_memory_score = 0
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_bse_3 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_bse_3 == 2
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_15 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_15 == 2
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_16 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_16 == 2
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_bse_7 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_bse_7 == 2
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_13 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_13 == 2
replace CSID_memory_score = (CSID_memory_score + 0.5) if i_f_csid_11 == 1
replace CSID_memory_score = (CSID_memory_score + 1) if i_f_csid_11 == 2
replace CSID_memory_score = . if missing(i_f_bse_3, i_f_csid_15, i_f_csid_16, i_f_bse_7, i_f_csid_13, i_f_csid_11)

gen CSID_memory_denom = 6
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_bse_3 == . | i_f_bse_3 == .i | i_f_bse_3 == .v)
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_15 == . | i_f_csid_15 == .i | i_f_csid_15 == .v)
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_16 == . | i_f_csid_16 == .i | i_f_csid_16 == .v)
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_bse_7 == . | i_f_bse_7 == .i | i_f_bse_7 == .v)
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_13 == . | i_f_csid_13 == .i | i_f_csid_13 == .v)
replace CSID_memory_denom = (CSID_memory_denom - 1) if (i_f_csid_11 == . | i_f_csid_11 == .i | i_f_csid_11 == .v)
replace CSID_memory_score = round((CSID_memory_score * 6)/CSID_memory_denom)

*MMSE - immediate recall
gen MMSE_immediate_recall = 0
replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_11 == 1
replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_12 == 1
replace MMSE_immediate_recall = (MMSE_immediate_recall + 1) if c_13 == 1
replace MMSE_immediate_recall = . if missing(c_11, c_12, c_13)

*MMSE - delayed recall
gen MMSE_delayed_recall = 0
replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_21 == 1
replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_22 == 1
replace MMSE_delayed_recall = (MMSE_delayed_recall + 1) if c_23 == 1
replace MMSE_delayed_recall = . if missing(c_21, c_22, c_23)

*MMSE - Object naming
gen MMSE_object_naming = 0
replace MMSE_object_naming = (MMSE_object_naming + 1) if c_24 == 1
replace MMSE_object_naming = (MMSE_object_naming + 1) if c_25 == 1
replace MMSE_object_naming = . if missing(c_24, c_25)

*MMSE - 3 step paper folding task
gen MMSE_paper_folding_task = 0
replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_27 == 1
replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_28 == 1
replace MMSE_paper_folding_task = (MMSE_paper_folding_task + 1) if c_29 == 1
replace MMSE_paper_folding_task = . if missing(c_27, c_28, c_29)

rename s_0 sexo_en_socio
rename s_2_3 edad_en_socio
rename age edad_en_resumen

order pid House_ID Cluster

save Everything_Wide_full, replace
