*Change the filepath name here to the folder containing the do files



capture include "/Users/chrissoria/documents/CADAS/Do/Read/CADAS_user_define.do"



capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"



clear all


if `"`user'"' == "Chris" {

    local path = "/Users/chrissoria/documents/CADAS/Do/Read"

    include "`path'/CADAS_country_define.do"

    if `country' == 0 {
    	do "`path'/../PR/Resumen_PR.do"
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

        do "/Users/chrissoria/documents/CADAS/Do/DR/global_checks_DR.do"



    }



    else if `country' == 2 {



        do "/Users/chrissoria/documents/CADAS/Do/CU/global_checks_CU.do" 

    }

if `country' != 0{


    do "/Users/chrissoria/documents/CADAS/Do/mp4_TyManualScoring.do"
    

}
	do "/Users/chrissoria/documents/CADAS/Do/Tracker.do"
	do "/Users/chrissoria/documents/CADAS/Do/InterviewerConcordance1.do"
	do "/Users/chrissoria/documents/CADAS/Do/cadas_1066_reproduced.do"
	do "/Users/chrissoria/documents/CADAS/Do/Ty_Pent_Scoring.do"
	do "/Users/chrissoria/documents/CADAS/Do/consensus_site.do"
	if `country' == 1 {
		do "/Users/chrissoria/documents/CADAS/Do/DR/UPM_Read_DR.do"
	}
	do "/Users/chrissoria/documents/CADAS/Do/EVERYTHING_WIDE.do"
if `country' == 1 {
	*translating to english
	do "/Users/chrissoria/documents/CADAS/Do/Cog_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Cog_Scoring_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Phys_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Infor_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Socio_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Consensus Site_english_DR.do"
	do "/Users/chrissoria/documents/CADAS/Do/Household_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/Neighborhood_translate.do"
	do "/Users/chrissoria/documents/CADAS/Do/EVERYTHING_WIDE_english_DR.do"
	}
	
}

else if `"`user'"' == "Ty" {

    local path = "C:\Users\Ty\Desktop\CADAS Data do files"

    include "`path'/CADAS_country_define.do"

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

}



