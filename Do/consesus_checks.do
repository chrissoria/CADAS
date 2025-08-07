cd /hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out

use "ConsensusVariables.dta", clear
d,s

* i_b1: =1 hh member, =2 non-res child, =3 other
tab i_b1

*i_b5: relat. =1 spouse, =2 child, =3 son/daughter-in-law, =4 bro/sis
tab i_b5
tab i_b5 i_b1

*s_2_9: married =2 yes
tab s_2_9
tab s_2_9 i_b5

* i_b4: =1 female, =2 male
tab i_b4

* s_0: =0 male, =1 female
tab s_0
tab s_0 i_b4
bysort i_b5: tab s_0 i_b4

* i_b3: age
sum i_b3

* s_2_3: age
sum s_2_3 if s_2_3>=65 & s_2_3<=110

gen dage=s_2_3 - i_b3 if s_2_3>=65 & s_2_3<=110
tab dage i_b5

* i_b7: educ =0 none, =1 is 1-5, =2 is 6-8, =3 is 9-12, =4 is >12
tab i_b7

* s_2_8c: years educ
tab s_2_8c

gen cluster=substr(pid,2,2)
gen casa=substr(pid,4,3)
gen participante=substr(pid,7,2)
sort i_b5 cluster
list pid cluster i_b1 i_b5 s_2_9 i_b4 s_0 i_b3 s_2_3 dage i_b7 s_2_8c

* look at child similar age to respondent:
list pid cluster i_b1 i_b5 s_2_9 i_b4 s_0 i_b3 s_2_3 dage i_b7 s_2_8c if i_b5==2 & (dage > -5 & dage <5)

* look at spouse of same gender:
gen samesex= i_b5==1 & i_b4 == (2- s_0) if i_b4~=.
tab cluster samesex
list pid cluster i_b1 i_b5 s_2_9 i_b4 s_0 i_b3 s_2_3 dage i_b7 s_2_8c if samesex==1

keep if samesex==1
tab cluster
sort cluster casa participante
list cluster casa participante i_b5 i_b4 s_0 i_b3 s_2_3 i_b7 s_2_8c if samesex==1

save "CADAS Cuba informant demog2", replace

keep cluster casa participante i_b5 i_b4 s_0 i_b3 s_2_3 i_b7 s_2_8c i_globalrecordid s_globalrecordid
export excel using "Informant-sexo2", firstrow(variables) replace

exit, clear
