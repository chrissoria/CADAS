*Change the filepath name here to the folder containing the do files
*local path = "C:\Users\Ty\Desktop\CADAS Data do files"
local user = "Chris"

if `"`user'"' == "Chris" {
    local path = "/hdir/0/chrissoria/Stata_CADAS/Do/Read"
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
        do "/hdir/0/chrissoria/Stata_CADAS/Do/PR/global_checks.do"
    }
    else if `country' == 1 {
	do "/hdir/0/chrissoria/Stata_CADAS/Do/Read/Sangre_Read.do"
        do "/hdir/0/chrissoria/Stata_CADAS/Do/DR/global_checks.do"
    }
    else if `country' == 2 {
        do "/hdir/0/chrissoria/Stata_CADAS/Do/CU/global_checks.do"
    }

    do "/hdir/0/chrissoria/Stata_CADAS/Do/Tracker.do"

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
    do "`path'/global_checks_PR"
}
else if `country' == 1 {
    do "`path'/global_checks_DR"
}
else if `country' == 2 {
    do "`path'/global_checks_CUBA"
}
do "`path'\Tracker.do"

}


