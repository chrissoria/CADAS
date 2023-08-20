clear all 
set more off
capture log close
log using CogTestScores, text replace

* cd "/hdir/0/chrissoria/Stata_CADAS/Data/Socio"
 
   use using "C:\Users\Ty\Desktop\CogMissing.dta", clear



******************************
*serial 7 scores (questions 15-19)
gen serial7_score = 0

*+1 point if first number is 93
replace serial7_score = 1 if c_15 == 93

*+1 point if second number is seven less than the first number
replace serial7_score = (serial7_score + 1) if (c_15 - 7 == c_16)

*+1 point if third number is seven less than the second number
replace serial7_score = (serial7_score + 1) if (c_16 - 7 == c_17)

*+1 point if fourth number is seven less than the third number
replace serial7_score = (serial7_score + 1) if (c_17 - 7 == c_18)

*+1 point if fifth number is seven less than the fourth number
replace serial7_score = (serial7_score + 1) if (c_18 - 7 == c_19)

label variable serial7_score "CADAS Series of subtractions 7 from 100 (0-5)"
******************************




******************************
*create WORLD spelled backwards score variable (question 20)
gen worldspelling_score = 0

*create temporary variable with c_20 string that we can edit
gen c_20_temp = c_20

*clean variable c_20_temp to delete any characters other than m, u, n, d, and o
quietly forvalues obs = 1(1) `=_N' {
	forvalues character = `=strlen(c_20_temp[`obs'])'(-1) 1 {
		if substr(c_20_temp[`obs'],-`character',1) ~= "o" {
			display substr(c_20_temp[`obs'],-`character',1)
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


*replace all o,d,n,u,m with 1,2,3,4,5
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

*create a temporary score variable to keep track of their highest score through each iteration of scoring
gen spell_score_temp = 1

*create a program that will loop through all possible combinations of dropping letters to find the highest score they can be given
*they are scored based on number of letters in the correct order (ODNUM), 1 point for each letter
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

*run the program we created to score the response from each participant
quietly forvalues obs = 1(1) `=_N' {
	if c_20_temp[`obs'] ~= "" {
		local name = c_20_temp[`obs']
			score `name' `obs'
	}
}

*replace invalid missings (did not answer, .i) with a score of .i
replace worldspelling_score = .i if c_20 == ".i"

*replace valid skips (entered 7) with a score of .v
replace worldspelling_score = .v if c_20 == "7"

*drop the temporary variables we created
drop c_20_temp
drop spell_score_temp
******************************




******************************
*create mini-mental status exam (MMSE) score (questions 1-32)
gen c_MMSEscore = 0

*13 points total, 1 point each (questions 1-13)
replace c_MMSEscore = (c_MMSEscore + 1) if c_1 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_2_p_c == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_2_d == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_3 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_4 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_5 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_6 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_7_d_c == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_7_p == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_8 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_9 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_10 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_11 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_12 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_13 == 1

*5 points - spelling MUNDO backward (question 20)
replace c_MMSEscore = (c_MMSEscore + serial7_score)

*4 ponts total, 1 point each (questions 21-23, 26)			how should 11-13 and 21-23 get scored if they couldnt repeat the words?			for c_26_1 why are there people with incorrect scores but only 2 or 3 tries?
replace c_MMSEscore = (c_MMSEscore + 1) if c_21 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_22 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_23 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_26 == 1

*7 points total, 1 point each (questions 24-25, 27-31)
replace c_MMSEscore = (c_MMSEscore + 1) if c_24 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_25 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_27 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_28 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_29 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_30 == 1
replace c_MMSEscore = (c_MMSEscore + 1) if c_31 == 1

*1 point (question cs_32 in cognitive scoring)
*replace c_MMSEscore = (c_MMSEscore + 1) if cs_32 == 1

*correct for questions unable to be answered due to physical limitation or illiteracy
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
drop MMSEcorrection
******************************




******************************
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
*for this variable, .r means refused to answer
replace c_33_score = .r if c_33_a == 7

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
*for this variable, .r means refused to answer
replace c_34_score = .r if (c_33_a == 7 | c_34_a == 7)

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
*for this variable, .r means refused to answer
replace c_35_score = .r if (c_33_a == 7 | c_34_a == 7 | c_35_a == 7)
******************************




******************************
*create delayed recall score (question 63)
*should they get a .r if c_33 is refusal but they still attempted c_63?

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
*for this variable, .r means refused to answer
replace c_63_score = .r if c_63_a == 7
******************************




******************************
*create recognition score (question 68)
*3 5 8 11 17 19 12 20 6 14 are on the list
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

*for this variable, .r means refused to answer
replace c_68_onlist = .r if c_68_a == 7



*create score for words identified that were not on the list (question 68)
*1 2 4 7 9 10 13 15 16 18
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

*for this variable, .r means refused to answer
replace c_68_notlist = .r if c_68_a == 7
******************************




******************************
*create short story score immediate recall (exact recall, question 66)
gen shortstory_immediate_exact = 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66a == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66b == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66c == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66d == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66e == 0
replace shortstory_immediate_exact = (shortstory_immediate_exact + 1) if c_66f == 0


*create short story score immediate recall (approximate recall, question 66)
gen shortstory_immediate_approximate = 0
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66a == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66b == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66c == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66d == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66e == 1
replace shortstory_immediate_approximate = (shortstory_immediate_approximate + 1) if c_66f == 1


*create short story score delayed recall (exact recall, question 77)
gen shortstory_delayed_exact = 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77a == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77b == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77c == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77d == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77e == 0
replace shortstory_delayed_exact = (shortstory_delayed_exact + 1) if c_77f == 0


*create short story score delayed recall (approximate recall, question 77)
gen shortstory_delayed_approximate = 0
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77a == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77b == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77c == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77d == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77e == 1
replace shortstory_delayed_approximate = (shortstory_delayed_approximate + 1) if c_77f == 1


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
******************************
log close
exit, clear
