{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all \
set more off\
capture log close\
log using Checks, text replace\
\
 cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
 \
 use rosters_participants\
 \
   *dropped below because junk\
  drop if inlist(globalrecordid, "6960e6a6-29c2-4567-8826-48f40918d8e0","dd6d514a-0dc6-4ba6-ac6b-6d6ba99b9585","6960e6a6-29c2-4567-8826-48f40918d8e0","44842eb7-f3f0-4a28-bd83-e4d895bf44fe","0d9ad36e-e19e-4a95-8a75-fae393587e17")\
  *is dropped below has person id 201004, for which there appears to be two entries for (both have the same age, gender, etc) I'm dropping the one that looks more correct\
  drop if inlist(globalrecordid, "34bab32c-fbce-492b-b488-e9bbeed4f14f")\
  *is dropped because duplicate, contradicting gender, and missing info has personid 20103501\
  drop if inlist(globalrecordid, "1444788e-6d3b-439d-b241-468191f55b5a")\
  *is dropped below because suplicate and another case has all of the exact same information\
  drop if inlist(globalrecordid, "1e5c9452-4c2a-4a43-831d-dbb2616b8d1e")\
  *two weird things about the case below\
  *First, both cases have the same male gender\
  *Second, both have the same person number, but one is "esposo/a" and the other is si mismo\
  *for now, I will recode the case the came after as person 2\
  \
  replace pr_person_number = 2 if globalrecordid == "1303aefe-487f-4e40-a58b-c4e1ffc323c2"\
  \
drop pid hhid\
gen r_country_str = string(r_country, "%12.0f")\
\
gen r_clustid_str = string(r_clustid, "%12.0f")\
replace r_clustid_str = cond(strlen(r_clustid_str) == 1, "0" + r_clustid_str, r_clustid_str)\
\
gen r_houseid_str = string(r_houseid, "%03.0f")\
replace r_houseid_str = cond(strlen(r_houseid_str) == 1, "00" + r_houseid_str, r_houseid_str)\
replace r_houseid_str = cond(strlen(r_houseid_str) == 2, "0" + r_houseid_str, r_houseid_str)\
\
gen r_particid_str = string(pr_person_number, "%12.0f")\
replace r_particid_str = cond(strlen(r_particid_str) == 1, "0" + r_particid_str, r_particid_str)\
\
gen pid = r_country_str + r_clustid_str + r_houseid_str + r_particid_str\
gen hhid = r_country_str + r_clustid_str + r_houseid_str\
drop r_country_str r_clustid_str r_houseid_str r_particid_str\
\
  \
 duplicates report pid\
 *this older version of stata doesn't have an easy way to identify duplicate personid, so I'll do it manually\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 drop is_duplicate\
 \
 save rosters_participants.dta,replace\
 \
 keep pid pr_3 pr_4\
 save rosters_check.dta, replace\
 \
 clear all\
 \
 use Socio\
drop pid\
drop hhid\
 *deleting these "junk" files from cuba\
drop if inlist(globalrecordid, "f2bfcfe6-4438-4158-b4b8-29ddca8ad2fb", "a48e9e97-6bee-48d7-a040-c106fb781225", "b1337629-fae7-4957-b30c-f45d4d72b267", "c7f1bca0-9624-418d-a35a-20c50602fbb6", "4cc82be3-48e9-4c22-87ac-382ddb7c4f24", "bd2ddd15-66ad-49ff-b1fa-c585c9927176", "9e39dc33-c4bc-4b8a-a1bb-11e5b54668d9")\
drop if inlist(globalrecordid, "e6a08058-b663-467b-a8fe-808fa9092300", "b8a6b8c6-255d-4ae9-a0f7-08d60f68a9b6", "78ef6060-de63-4c55-b46a-58bdbdbd96a5", "95233fc6-a441-4368-ad47-c8e70c7dadaf", "51897609-91c6-43eb-8fe6-76919121b287", "6cb0313e-103d-460d-8cca-5f7796845b85", "c5caa2b1-c7e6-40d9-bb55-7a6b18164f76")\
drop if inlist(globalrecordid, "0de6bf32-7dbd-4a95-9ab0-989213e5a210")\
\
*is dropped because duplicate personid and less complete\
drop if inlist(globalrecordid, "9d73f0c1-9b16-4731-afc1-8f059b174d6f")\
 \
 *global recordid ad5fe156-95ff-4e45-8265-ea1b17e44683 and 4a73d862-e57f-40f6-93c1-5a739294a998 both have personid 20105002\
 *both are very similar, maybe the same person done on 2 separate occasions \
 *need to reach out to Tania to see which is the correct case\
 *for now, I will just drop the first case\
 drop if inlist(globalrecordid, "ad5fe156-95ff-4e45-8265-ea1b17e44683")\
 \
gen s_country_str = string(s_country, "%12.0f")\
\
gen s_clustid_str = string(s_clustid, "%12.0f")\
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)\
\
gen s_houseid_str = string(s_houseid, "%03.0f")\
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)\
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)\
\
gen s_particid_str = string(s_particid, "%12.0f")\
replace s_particid_str = cond(strlen(s_particid_str) == 1, "0" + s_particid_str, s_particid_str)\
\
gen pid = s_country_str + s_clustid_str + s_houseid_str + s_particid_str\
gen hhid = s_country_str + s_clustid_str + s_houseid_str\
drop s_country_str s_clustid_str s_houseid_str s_particid_str\
 \
 duplicates report pid\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 drop is_duplicate\
 \
 save Socio.dta, replace\
 \
 keep pid s_sex\
 save socio_check.dta, replace\
 \
 clear all\
 \
 use Phys\
 drop pid\
 drop hhid\
 *dropping these junk files that were entered before the study started\
drop if inlist(globalrecordid, "38ddf6b0-7465-425a-9534-1f042dbbe352", "985efbd2-5bd0-42c9-b9db-ca9205a8369d","70fa9041-5a26-4751-bf75-f9326e11a783", "99db8029-9609-4fb6-baac-852b38db7e36")\
drop if inlist(globalrecordid, "48135c80-626c-4114-b103-a8a32e5a86a2")\
 \
 *globalrecordid 7e0f47e0-9fcd-4e98-969e-8fa3eb3c386b and 899f1599-5cfb-4b1d-b61f-c9467ba12e1b have same personid 20106401\
 *both are complete cases but different, both from houseid 64 person number 1\
 *Tania's sheet says there should be person 2 in this house, i will code the person who did the survey last as person 2\
\
 replace p_particid = 2 if globalrecordid == "899f1599-5cfb-4b1d-b61f-c9467ba12e1b"\
 \
 gen p_country_str = string(p_country, "%12.0f")\
\
gen p_clustid_str = string(p_clustid, "%12.0f")\
replace p_clustid_str = cond(strlen(p_clustid_str) == 1, "0" + p_clustid_str, p_clustid_str)\
\
gen p_houseid_str = string(p_houseid, "%03.0f")\
replace p_houseid_str = cond(strlen(p_houseid_str) == 1, "00" + p_houseid_str, p_houseid_str)\
replace p_houseid_str = cond(strlen(p_houseid_str) == 2, "0" + p_houseid_str, p_houseid_str)\
\
gen p_particid_str = string(p_particid, "%12.0f")\
replace p_particid_str = cond(strlen(p_particid_str) == 1, "0" + p_particid_str, p_particid_str)\
\
gen pid = p_country_str + p_clustid_str + p_houseid_str + p_particid_str\
gen hhid = p_country_str + p_clustid_str + p_houseid_str\
drop p_country_str p_clustid_str p_houseid_str p_particid_str\
 \
 duplicates report pid\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 drop is_duplicate\
 \
 save Phys.dta, replace\
 \
 keep pid\
 save phys_check.dta, replace\
 \
 clear all\
 \
 use Cog\
 drop pid hhid\
 \
 *this is all junk that was entered before the study began\
 drop if inlist(globalrecordid, "91c4212a-a2bc-4e2c-8f43-70d1a2002986")\
 drop if inlist(globalrecordid, "eb91435b-3146-43fd-94d6-261a7e7526d2", "8bc87a48-a4a4-4972-b1c8-e2f990c602d9", "a3aaf799-a716-4f62-87fc-0e60b8ee398b", "7fe87507-a24f-4f5e-979b-51ad294b7122", "HERE", "1040e8ce-1260-43fa-9010-e2e553b549a9")\
\
*the case below says houseid is 456, fkey = feeb956a-217b-4bcc-b27d-e20c4dd0ed48, I will assume junk\
\
drop if inlist(fkey, "feeb956a-217b-4bcc-b27d-e20c4dd0ed48")\
\
*the two cases below have no parent files, are duplicates, and we already have two pid 20100101 in Cog\
\
drop if inlist(fkey, "0fcf7696-252b-4e0d-82ff-cb628198ac15","69583114-a60a-4575-943a-2215144dd18f")\
\
*the case below is junk I entered\
\
drop if inlist(fkey, "4938554b-7b33-4784-b0ef-efd01ede07a3")\
\
\
gen c_country_str = string(c_country, "%12.0f")\
\
gen c_clustid_str = string(c_clustid, "%12.0f")\
replace c_clustid_str = cond(strlen(c_clustid_str) == 1, "0" + c_clustid_str, c_clustid_str)\
\
gen c_houseid_str = string(c_houseid, "%03.0f")\
replace c_houseid_str = cond(strlen(c_houseid_str) == 1, "00" + c_houseid_str, c_houseid_str)\
replace c_houseid_str = cond(strlen(c_houseid_str) == 2, "0" + c_houseid_str, c_houseid_str)\
\
gen c_particid_str = string(c_particid, "%12.0f")\
replace c_particid_str = cond(strlen(c_particid_str) == 1, "0" + c_particid_str, c_particid_str)\
\
gen pid = c_country_str + c_clustid_str + c_houseid_str + c_particid_str\
gen hhid = c_country_str + c_clustid_str + c_houseid_str\
drop c_country_str c_clustid_str c_houseid_str c_particid_str\
 \
 duplicates report pid\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 drop is_duplicate\
 \
 *The parent is exporting person id, etc, but not the child. It makes no sense that this would be the case.\
 *Confirm that this is the case in epi info sync file. \
 *There's 101 cases so it's possible these are just junk. I'll need to confirm. \
 *I'll need to merge the child to the parent to extract pid and try to process all the data again\
 *skip for now\
 \
save Cog.dta, replace\
\
keep pid\
\
save cog_check.dta, replace\
 \
 log close\
 clear all\
 \
 use Infor\
 log using Infor_check, text replace\
 \
 *personid 201038 is duplicated and it's not clear which is which. \
 *According to the Tania excel sheet, there's too people in house 38, one male one female\
 *For now, I will recode the case that comes in first as person 1 (f3fef9bd-fcc9-458e-ae76-bf40abc44850)\
 \
 replace i_particid = 1 if globalrecordid == "f3fef9bd-fcc9-458e-ae76-bf40abc44850"\
 \
 *The personid duplicate below is 20104501, 306dd8e0-eed1-426d-9196-f180c7a8fd4a is person 2\
 *question b3 provides age, which I used to match to person number\
 *age 72 is person 1, age 66 is person 2\
\
 replace i_particid = 2 if globalrecordid == "306dd8e0-eed1-426d-9196-f180c7a8fd4a"\
 \
 *person 1 is age 79, person 2 is age 77\
 *personid duplicate 20105002, e69aad3b-5367-4f9c-90cb-8f1c9543eaee, is being recoded to person number 1\
 \
 replace i_particid = 1 if globalrecordid == "e69aad3b-5367-4f9c-90cb-8f1c9543eaee"\
 \
*person 1 is age 78, person 2 is 76, 73516e7d-4288-499a-a89c-9ffde5d2df0a person id = 20105202\
\
 replace i_particid = 1 if globalrecordid == "73516e7d-4288-499a-a89c-9ffde5d2df0a"\
\
*personid 20106402 is duplicated and not easy to decipher which is which (105e8dcc-7c09-464c-a092-42032ace1494)\
*one of two persons appear to be a proxy age 74, as their ages do not match what was put in completo rechazado sheet\
*I suspect that the age put down in informante is incorrect, as both the roster and cr sheet say person 2 is 81\
*person 1 is female is cr and person 2 is male (according to roster and cr sheet), and so I will recode accordingly\
\
 replace i_particid = 1 if globalrecordid == "105e8dcc-7c09-464c-a092-42032ace1494"\
 \
 *the case below looks like a "junk" file pid 20100201\
 *nearly every column is empty but the first part of the file has some information\
 *the other two people from this household are already in the data\
 \
 drop if inlist(globalrecordid, "a3b83872-c6bb-482e-a5f5-b0788f4438e0")\
 \
 drop pid hhid\
 \
 gen i_country_str = string(i_country, "%12.0f")\
\
gen i_clustid_str = string(i_clustid, "%12.0f")\
replace i_clustid_str = cond(strlen(i_clustid_str) == 1, "0" + i_clustid_str, i_clustid_str)\
\
gen i_houseid_str = string(i_houseid, "%03.0f")\
replace i_houseid_str = cond(strlen(i_houseid_str) == 1, "00" + i_houseid_str, i_houseid_str)\
replace i_houseid_str = cond(strlen(i_houseid_str) == 2, "0" + i_houseid_str, i_houseid_str)\
\
gen i_particid_str = string(i_particid, "%12.0f")\
replace i_particid_str = cond(strlen(i_particid_str) == 1, "0" + i_particid_str, i_particid_str)\
\
gen pid = i_country_str + i_clustid_str + i_houseid_str + i_particid_str\
gen hhid = i_country_str + i_clustid_str + i_houseid_str\
\
drop i_country_str i_clustid_str i_houseid_str i_particid_str\
 \
 duplicates report pid\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 drop is_duplicate\
 \
 save Infor.dta, replace\
 \
 keep pid\
 save infor_check, replace\
 log close\
 \
 clear all\
 \
 use Household\
 \
*It looks like epi info is spitting out duplicate household cases\
*I will drop the duplicate junk file for now, but will have to get to the bottom of what's going here later\
*interestingly they have the same fkey but all have unique parents! weird\
 \
 drop if inlist(hhid, "20000.")\
 \
 duplicates report hhid\
 sort hhid\
 gen is_duplicate = hhid[_n] == hhid[_n-1]\
 list if is_duplicate\
 \
 *7ac9fe02-99d7-412c-86f2-89d25b243930 was created by me, delete\
 *globalrecordid: 8d81d273-cf4a-495f-820d-2398360babc8, b91b8627-bc88-476c-944a-4157eafead99, 8aea5f27-6c25-4e9a-8fcc-b135f9ca3157, 8c27f197-12d2-45d6-873e-42fa3df6adcc, 2448b616-5773-403a-a24b-2128524a783c\
 *the above record ID have mostly missing data, including house number. For now, I will delete, but I will have to dig into this a bit more to make sure they aren't corrupted data\
 *I believe these might be junk\
 \
 *hhid 201035 is duplicated and both look like they could be valid, but slightly different.\
 *I'll have to reach out to Tania to find out which of the two is valid\
 *same thing with 201043\
\
drop is_duplicate\
\
save Household.dta, replace\
\
keep hhid\
\
save Household_checks.dta, replace\
\
clear all\
\
use Cog_Scoring\
\
 duplicates report pid\
 sort pid\
 gen is_duplicate = pid[_n] == pid[_n-1]\
 list if is_duplicate\
 \
 *globalrecordid 88e80078-4ca7-44ee-855e-387ca80b8299 and 0d543ac7-900d-4057-a324-72467116cfca have same pid 20100901\
 *both could be valid, there must be two people in same household, but not sure which goes where \
 \
 *ideally we would have these linked, maybe not too late?\
\
 *globalrecordid acda0aac-79fa-48dd-8932-f434536d9a8c and 35220af8-d6a0-43b6-b0bc-4f2032d7ef89 have same pid 20101401\
 *acda0aac-79fa-48dd-8932-f434536d9a8c is less complete but both have some answers \
\
 *Next, I will merge each child with the parent and see if things are matching\
 *Parents match to child with the fkey to globalrecordid, so I will need to rename the fkey to globalrecordid in the child\
 \
 clear all\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Socio_Parent.csv"\
\
drop fkey lastsavelogonname lastsavetime\
rename globalrecordid fkey\
\
merge 1:1 fkey using Socio\
\
save Socio_Child_Parent_Merged.dta, replace\
\
keep if _merge != 3\
list\
\
*6e69f965-5df9-4705-bd20-bdc9de2883a4 and a48e9e97-6bee-48d7-a040-c106fb781225 are in the parent and look like junk\
\
*However, f72ef590-00b4-4ba3-9318-514d98a4e1dc is in the child and not in the parent. It might be junk.\
*It doesn't match what's on the completo/rechaza form so I'll have to ask Tania about it.\
*Concerning that it didn't produce a duplicate pid 20100101\
*looks like I might've deleted the wrong duplicate!\
*global record id c5caa2b1-c7e6-40d9-bb55-7a6b18164f76 is not in the parent data but I see it in the child data.\
*the parent says a48e9e97-6bee-48d7-a040-c106fb781225 should be linked to this child which is linked to 1c5a2a7c-e19c-4ea9-8d18-6b2707e9c93c in the child\
*1c5a2a7c-e19c-4ea9-8d18-6b2707e9c93c was previously being deleted because it looked like junk, but looks to be the correct case instead of c5caa2b1-c7e6-40d9-bb55-7a6b18164f76\
*for now, I'll delete c5caa2b1-c7e6-40d9-bb55-7a6b18164f76 as it doesn't match completo rechazo and reach out to Tania for confirmation and ask about incompleteness\
*after I do this, all parent/child match except global = 6e69f965-5df9-4705-bd20-bdc9de2883a4, which is not in the child\
\
clear all\
\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Cog_Parent.csv"\
\
drop fkey lastsavelogonname lastsavetime\
rename globalrecordid fkey\
\
*3a6d1efa-a1ad-4318-aece-39c8144e894a appears to be a junk file in the child form.\
*It's almost entirely empty and also interesting that there is no duplicate for that file\
*In the the child form and see where else 20100101 is 357016cd-a3d1-4774-8876-a3767affe462 and another for fcfc1f54-e392-4c0c-a523-6c744a33fcc7\
\
merge 1:1 fkey using Cog\
\
save Cog_Child_Parent_Merged.dta, replace\
\
keep if _merge != 3\
list\
\
*after merge, three fkeys remain\
\
/* fkey\
0ad59e9a-06ab-40c4-a6a2-7bf248bcab80 has no child and we already have a pid that matches this, fkey = da856b52-2014-424f-83ef-2644f8b47cbb, so I will assume junk\
253db5a8-ac79-4fc9-9ef5-5f6994d17af1 has no child and we already have a pid that matchis this, fkey = f8946b79-c516-46c9-9746-223733de8097, so I will assume junk\
4938554b-7b33-4784-b0ef-efd01ede07a3 is junk I entered*/\
\
clear all\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Phys_Parent.csv"\
\
drop fkey lastsavelogonname lastsavetime\
rename globalrecordid fkey\
\
merge 1:1 fkey using Phys\
\
keep if _merge != 3\
list\
\
*all children are matched with parents (an ideal world) so I will assume that these are all valid cases\
\
clear all\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Infor_Parent.csv"\
\
drop fkey lastsavelogonname lastsavetime firstsavelogonname firstsavetime\
rename globalrecordid fkey\
\
merge 1:1 fkey using Infor\
\
keep if _merge != 3\
list\
\
*non-matched are mostly junk from the parent file except for fkey cd171634-306a-447c-9a31-167f2042fe68 which is childfree\
*I'll have to check sync files and export from epi info again to make sure these are \
\
clear all\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Household_Parent.csv"\
\
drop fkey lastsavelogonname lastsavetime firstsavelogonname firstsavetime\
rename globalrecordid fkey\
\
clear all\
use Household\
gen is_duplicate = fkey[_n] == fkey[_n-1]\
list if is_duplicate\
\
merge 1:1 fkey using Household\
\
keep if _merge != 3\
list\
\
*after i remove the above, I get all matches but there are 80 matches instead of the 76 that Tania reports\
*two households have duplicate hhid's but not clear which of the two are valid\
\
clear all\
\
*next, I want to find out if we have the right amount of cog scoring and cog surveys\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
use Cog_Scoring\
\
*for no, I will do m:m because I have't been able to pin down which unique cases are the true/correct ones\
merge m:m pid using Cog\
\
keep if _merge != 3\
list\
\
*e07eb881-5c85-4d8b-a4e7-59ec774cbd70 and 348c3d1d-e5c5-495f-87dd-e31bc8115251 are two cognitive scoring files with no cogntive survey\
\
/*globalrecordid\
bd349b37-ff38-4271-b099-12b6845b964c no particid or houseid\
c8799648-57ad-4864-8a0e-f2cce230e3d2 no particid or houseid\
b81579ca-4945-46da-8d06-45273fcfbeb5 pid 20100201, probably junk\
5133ce8a-22c6-4432-b2d0-3b9885b5a885 pid 20103901, probably junk\
the above are all cognitve surveys with no cognitve scoring files.*/\
\
*next, I want to merge with cog scoring to put a file together where we can see answer and pictures in the same doc\
\
clear all\
\
use Cog\
\
merge m:m pid using Cog_Scoring\
\
keep cs_32 cs_40 cs_41 cs_43 cs_44 cs_72_1 cs_72_2 cs_72_3 cs_72_4 cs_79_1 cs_79_2 cs_72_3 cs_72_4 }