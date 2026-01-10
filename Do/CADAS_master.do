*Change the filepath name here to the folder containing the do files

capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

clear all

****************************************
* SET COUNTRY HERE (0=PR, 1=DR, 2=CUBA)
****************************************
global country = 2

if `"`user'"' == "Chris" {

    local path = "/Users/chrissoria/documents/CADAS/Do/Read"
    local country = $country

	****************************************
	* LANGUAGE LOOP: Process data in Spanish first, then English
	* S = Spanish (primary), E = English (translation)
	****************************************
	foreach lang in S E {
		global language = "`lang'"
		display "Processing language: $language"

		****************************************
		* READ FILES
		****************************************
		do "`path'/Resumen.do"

		if `country' == 0 {
			do "`path'/../PR/cog_checks_PR.do"
			*do "`path'/../PR/door_checks.do"
			do "/Users/chrissoria/documents/CADAS/Do/Read/Sangre_Read.do"
		}

		if `country' == 1 {
			do "`path'/../DR/cog_checks_DR.do"
			do "`path'/../DR/door_checks_DR.do"
		}

		if `country' == 2 {
			do "`path'/../CU/cuban_CDR.do"
			do "`path'/../CU/cog_checks_CU.do"
		}

		do "`path'/Cog_Scoring_Read.do"

		do "`path'/Cog_Read.do"

		if `country' == 1 {
			do "`path'/cog_scores.do"
		}

		do "`path'/Doors_Read.do"

		do "`path'/Household_Read.do"

		do "`path'/Infor_Read.do"

		do "`path'/Neighborhood_Read.do"

		do "`path'/Phys_Read.do"

		do "`path'/Rosters_Read.do"

		do "`path'/Socio_Read.do"

		if `country' == 0 {
			do "/Users/chrissoria/documents/CADAS/Do/PR/global_checks_PR.do"
		}
		else if `country' == 1 {
			do "/Users/chrissoria/documents/CADAS/Do/Read/Sangre_Read.do"
			do "/Users/chrissoria/documents/CADAS/Do/Tracker.do" // doing before to extract the RSP var
			do "/Users/chrissoria/documents/CADAS/Do/DR/global_checks_DR.do"
		}
		else if `country' == 2 {
			do "/Users/chrissoria/documents/CADAS/Do/CU/global_checks_CU.do"
		}

		****************************************
		* POST-PROCESSING AND FINAL OUTPUT
		****************************************
		if `country' != 0 {
			do "/Users/chrissoria/documents/CADAS/Do/mp4_TyManualScoring.do"
		}
		do "/Users/chrissoria/documents/CADAS/Do/InterviewerConcordance1.do"
		do "/Users/chrissoria/Documents/CADAS/do/1066_reproduced/1066_master.do"
		*do "/Users/chrissoria/documents/CADAS/Do/Ty_Pent_Scoring.do" // Logic moved to Cog_Scoring_Read.do
		if `country' == 1 {
			do "/Users/chrissoria/documents/CADAS/Do/DR/UPM_Read_DR.do"
		}
		do "/Users/chrissoria/documents/CADAS/Do/Tracker.do"
		do "/Users/chrissoria/documents/CADAS/Do/consensus_site.do"
		do "/Users/chrissoria/documents/CADAS/Do/EVERYTHING_WIDE.do"

	} // end language loop

} // end if user == Chris

else if `"`user'"' == "Ty" {

    local path = "C:\Users\Ty\Desktop\CADAS Data do files"
    local country = $country

    do "`path'/Cog_Scoring_Read.do"

    do "`path'/Cog_Read.do"

    do "`path'/Doors_Read.do"

    do "`path'/Household_Read.do"

    do "`path'/Infor_Read.do"

    do "`path'/Neighborhood_Read.do"

    do "`path'/Phys_Read.do"

    do "`path'/Rosters_Read.do"

    do "`path'/Socio_Read.do"


if `country' == 0 {
	do "`path'/../PR/Resumen.do"

    do "`path'/global_checks_PR"

}

else if `country' == 1 {

    do "`path'/global_checks_DR"

}

else if `country' == 2 {

    do "`path'/global_checks_CUBA"

}


do "`path'\Tracker.do"

do "`path'/InterviewerConcordance1.do"

do "`path'/mp4_TyManualScoring.do"

do "path'/cadas_1066_reproduced.do"

} // end if user == Ty

clear all
