clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"
}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"
}

* Location only for DR so far
local country = 0

if `country' == 0 {
    cd "`path'/PR_in"
}
else if `country' == 1 {
    cd "`path'/DR_in"
}
else if `country' == 2 {
    cd "`path'/CUBA_in"
}

* Merge all parent files together
insheet using Cog_Child.csv , names
keep fkey c_deviceid1 c_date
rename fkey globalrecordid
save Cog_Childtemp.dta , replace
clear

insheet using Household_Child.csv , names
keep fkey h_deviceid1 h_date
rename fkey globalrecordid
save Household_Childtemp.dta , replace
clear

insheet using Infor_Child.csv , names
keep fkey i_deviceid1 i_date
rename fkey globalrecordid
save Infor_Childtemp.dta , replace
clear

insheet using Phys_Child.csv , names
keep fkey p_deviceid1 p_date
rename fkey globalrecordid
save Phys_Childtemp.dta , replace
clear

insheet using Socio_Child.csv , names
keep fkey s_deviceid1 s_date
rename fkey globalrecordid
save Socio_Childtemp.dta , replace
clear

insheet using Cog_Parent.csv , names
gen c_country_str = "1"
gen c_clustid_str = string(c_clustid1, "%12.0f")
replace c_clustid_str = cond(strlen(c_clustid_str) == 1, "0" + c_clustid_str, c_clustid_str)
gen c_houseid_str = string(c_houseid1, "%03.0f")
replace c_houseid_str = cond(strlen(c_houseid_str) == 1, "00" + c_houseid_str, c_houseid_str)
replace c_houseid_str = cond(strlen(c_houseid_str) == 2, "0" + c_houseid_str, c_houseid_str)
gen hhid = c_country_str + c_clustid_str + c_houseid_str
drop c_country_str c_clustid_str c_houseid_str
merge 1:1 globalrecordid using Cog_Childtemp.dta
drop _merge
save Cog_Parenttemp.dta , replace
erase Cog_Childtemp.dta
clear

insheet using Household_Parent.csv , names
gen h_country_str = "1"
gen h_clustid_str = string(h_clustid1, "%12.0f")
replace h_clustid_str = cond(strlen(h_clustid_str) == 1, "0" + h_clustid_str, h_clustid_str)
gen h_houseid_str = string(h_houseid1, "%03.0f")
replace h_houseid_str = cond(strlen(h_houseid_str) == 1, "00" + h_houseid_str, h_houseid_str)
replace h_houseid_str = cond(strlen(h_houseid_str) == 2, "0" + h_houseid_str, h_houseid_str)
gen hhid = h_country_str + h_clustid_str + h_houseid_str
drop h_country_str h_clustid_str h_houseid_str
merge 1:1 globalrecordid using Household_Childtemp.dta
drop _merge
save Household_Parenttemp.dta , replace
erase Household_Childtemp.dta
clear

insheet using Infor_Parent.csv , names
gen i_country_str = "1"
gen i_clustid_str = string(i_clustid1, "%12.0f")
replace i_clustid_str = cond(strlen(i_clustid_str) == 1, "0" + i_clustid_str, i_clustid_str)
gen i_houseid_str = string(i_houseid1, "%03.0f")
replace i_houseid_str = cond(strlen(i_houseid_str) == 1, "00" + i_houseid_str, i_houseid_str)
replace i_houseid_str = cond(strlen(i_houseid_str) == 2, "0" + i_houseid_str, i_houseid_str)
gen hhid = i_country_str + i_clustid_str + i_houseid_str
drop i_country_str i_clustid_str i_houseid_str
merge 1:1 globalrecordid using Infor_Childtemp.dta
drop _merge
save Infor_Parenttemp.dta , replace
erase Infor_Childtemp.dta
clear

insheet using Phys_Parent.csv , names
gen p_country_str = "1"
gen p_clustid_str = string(p_clustid1, "%12.0f")
replace p_clustid_str = cond(strlen(p_clustid_str) == 1, "0" + p_clustid_str, p_clustid_str)
gen p_houseid_str = string(p_houseid1, "%03.0f")
replace p_houseid_str = cond(strlen(p_houseid_str) == 1, "00" + p_houseid_str, p_houseid_str)
replace p_houseid_str = cond(strlen(p_houseid_str) == 2, "0" + p_houseid_str, p_houseid_str)
gen hhid = p_country_str + p_clustid_str + p_houseid_str
drop p_country_str p_clustid_str p_houseid_str
merge 1:1 globalrecordid using Phys_Childtemp.dta
drop _merge
save Phys_Parenttemp.dta , replace
erase Phys_Childtemp.dta
clear

insheet using Socio_Parent.csv , names
gen s_country_str = "1"
gen s_clustid_str = string(s_clustid1, "%12.0f")
replace s_clustid_str = cond(strlen(s_clustid_str) == 1, "0" + s_clustid_str, s_clustid_str)
gen s_houseid_str = string(s_houseid1, "%03.0f")
replace s_houseid_str = cond(strlen(s_houseid_str) == 1, "00" + s_houseid_str, s_houseid_str)
replace s_houseid_str = cond(strlen(s_houseid_str) == 2, "0" + s_houseid_str, s_houseid_str)
gen hhid = s_country_str + s_clustid_str + s_houseid_str
drop s_country_str s_clustid_str s_houseid_str
merge 1:1 globalrecordid using Socio_Childtemp.dta
drop _merge
save Socio_Parenttemp.dta , replace
erase Socio_Childtemp.dta
clear

use using Cog_Parenttemp.dta
merge m:m hhid using Household_Parenttemp.dta
drop _merge
merge m:m hhid using Infor_Parenttemp.dta
drop _merge
merge m:m hhid using Phys_Parenttemp.dta
drop _merge
merge m:m hhid using Socio_Parenttemp.dta
drop _merge

drop *time* *country* cognitive household informant physical_exam sociodemographic v1
drop if inlist(globalrecordid, "88399738-9084-4291-82ca-df4cc0fd3413", "23ec95fb-5580-4195-8253-1eb210d537bf", "b1e19f52-d8cb-4f4d-a4ef-428e0da44ddd")
drop if hhid == ""

*fixing dates, dropping obs before November 8th 2023
gen edate = date(c_date, "YMD")
format edate  %tdCCYY/nn/dd
/*
drop if edate < date("20231108", "YMD")
*/
egen lat_avg = rmean(*lat)
egen lon_avg = rmean(*lon)
insobs 100

gen coorid = _n
spset coorid , coord(lat_avg lon_avg)

/*
forvalues a = 1(1) 81 {
	quietly sum lat_avg if c_clustid1 == `a', d
	replace _CX = r(p50) in -`a'
	quietly sum lon_avg if c_clustid1 == `a', d
	replace _CY = r(p50) in -`a'
	replace c_clustid1 = `a' in -`a'
	replace lat_avg = _CX in -`a'
	replace lon_avg = _CY in -`a'
}
*/

/*
*PR coords? unsure what this is from, maybe website
replace _CX = 0 if _CX == .
replace _CY = 0 if _CY == .

replace c_clustid1 = 2 in -1 
replace _CX = 18.3968626 in -1 
replace _CY = -66.0388131 in -1 

replace c_clustid1 = 3 in -2 
replace _CX = 18.4368730 in -2 
replace _CY = -66.0469809 in -2 

replace c_clustid1 = 4 in -3 
replace _CX = 18.42511824 in -3 
replace _CY = -66.0524288 in -3 
*/

replace _CX = 0 if _CX == .
replace _CY = 0 if _CY == .

replace c_clustid1 = 1 in -1
replace _CX = 18.430642 in -1
replace _CY = -66.0580281 in -1

replace c_clustid1 = 2 in -2
replace _CX = 18.3962487 in -2
replace _CY = -66.0376499 in -2

replace c_clustid1 = 3 in -3
replace _CX = 18.4360818 in -3
replace _CY = -66.047057 in -3

replace c_clustid1 = 4 in -4
replace _CX = 18.4010983 in -4
replace _CY = -65.9627966 in -4

replace c_clustid1 = 5 in -5
replace _CX = 18.3859172 in -5
replace _CY = -65.9591204 in -5

replace c_clustid1 = 6 in -6
replace _CX = 18.3983586 in -6
replace _CY = -66.0893028 in -6

replace c_clustid1 = 7 in -7
replace _CX = 18.3932403 in -7
replace _CY = -65.9241402 in -7

replace c_clustid1 = 8 in -8
replace _CX = 18.3832181 in -8
replace _CY = -66.1548955 in -8

replace c_clustid1 = 9 in -9
replace _CX = 18.4316022 in -9
replace _CY = -66.0565921 in -9

replace c_clustid1 = 10 in -10
replace _CX = 18.4323994 in -10
replace _CY = 66.1471418 in -10

replace c_clustid1 = 11 in -11
replace _CX = 18.3611395 in -11
replace _CY = -66.5552613 in -11

replace c_clustid1 = 12 in -12
replace _CX = 18.4316557 in -12
replace _CY = -65.8371107 in -12

replace c_clustid1 = 13 in -13
replace _CX = 18.4324184 in -13
replace _CY = -66.4391271 in -13

replace c_clustid1 = 14 in -14
replace _CX = 18.3163382 in -14
replace _CY = -65.9267152 in -14

replace c_clustid1 = 15 in -15
replace _CX = 18.3829776 in -15
replace _CY = -65.8805072 in -15

replace c_clustid1 = 16 in -16
replace _CX = 18.0046385 in -16
replace _CY = -66.5878723 in -16

replace c_clustid1 = 17 in -17
replace _CX = 18.136456 in -17
replace _CY = -67.1499495 in -17

replace c_clustid1 = 18 in -18
replace _CX = 18.4276741 in -18
replace _CY = -66.4126487 in -18

replace c_clustid1 = 19 in -19
replace _CX = 18.06703 in -19
replace _CY = -66.570933 in -19

replace c_clustid1 = 20 in -20
replace _CX = 18.2640942 in -20
replace _CY = -65.6444874 in -20

replace c_clustid1 = 21 in -21
replace _CX = 18.3412286 in -21
replace _CY = -65.7301199 in -21

replace c_clustid1 = 22 in -22
replace _CX = 18.3720813 in -22
replace _CY = -65.7737837 in -22

replace c_clustid1 = 23 in -23
replace _CX = 18.4273719787598 in -23
replace _CY = -65.8382034301758 in -23

replace c_clustid1 = 24 in -24
replace _CX = 18.4725211 in -24
replace _CY = -66.8182988 in -24

replace c_clustid1 = 25 in -25
replace _CX = 18.324 in -25
replace _CY = -66.4731 in -25

replace c_clustid1 = 26 in -26
replace _CX = 18.4255532 in -26
replace _CY = -66.0570519 in -26

replace c_clustid1 = 27 in -27
replace _CX = 18.4566018 in -27
replace _CY = -66.7398529 in -27

replace c_clustid1 = 28 in -28
replace _CX = 18.3093091 in -28
replace _CY = -66.6171623 in -28

replace c_clustid1 = 29 in -29
replace _CX = 18.372966 in -29
replace _CY = -65.7152489 in -29

replace c_clustid1 = 30 in -30
replace _CX = 18.298337 in -30
replace _CY = -66.8786015 in -30

replace c_clustid1 = 31 in -31
replace _CX = 18.3613494 in -31
replace _CY = -66.8375483 in -31

replace c_clustid1 = 32 in -32
replace _CX = 18.2173182 in -32
replace _CY = -67.0846181 in -32

replace c_clustid1 = 33 in -33
replace _CX = 18.0378927 in -33
replace _CY = -66.9675109 in -33

replace c_clustid1 = 34 in -34
replace _CX = 18.3479016 in -34
replace _CY = -65.9369716 in -34

replace c_clustid1 = 35 in -35
replace _CX = 18.4740357 in -35
replace _CY = -67.0480367 in -35

replace c_clustid1 = 36 in -36
replace _CX = 18.0511185 in -36
replace _CY = -67.0516241 in -36

replace c_clustid1 = 37 in -37
replace _CX = 18.4029475 in -37
replace _CY = -67.1097801 in -37

replace c_clustid1 = 38 in -38
replace _CX = 18.2513994 in -38
replace _CY = -66.9921187 in -38

replace c_clustid1 = 39 in -39
replace _CX = 18.4900664 in -39
replace _CY = -67.0777918 in -39

replace c_clustid1 = 40 in -40
replace _CX = 18.3629221 in -40
replace _CY = -66.9455468 in -40

replace c_clustid1 = 41 in -41
replace _CX = 18.0819791 in -41
replace _CY = -67.1432399 in -41

replace c_clustid1 = 42 in -42
replace _CX = 18.47024 in -42
replace _CY = -67.14806 in -42

replace c_clustid1 = 43 in -43
replace _CX = 18.143698 in -43
replace _CY = -66.726807 in -43

replace c_clustid1 = 44 in -44
replace _CX = 18.4021596 in -44
replace _CY = -66.0534644 in -44

replace c_clustid1 = 45 in -45
replace _CX = 18.1647632 in -45
replace _CY = -66.7225813 in -45

replace c_clustid1 = 46 in -46
replace _CX = 18.1593357 in -46
replace _CY = -66.7239824 in -46

replace c_clustid1 = 47 in -47
replace _CX = 18.0090987 in -47
replace _CY = -66.8025162 in -47

replace c_clustid1 = 48 in -48
replace _CX = 18.0002198 in -48
replace _CY = -66.914773 in -48

replace c_clustid1 = 49 in -49
replace _CX = 18.3189709 in -49
replace _CY = -65.6657161 in -49

replace c_clustid1 = 50 in -50
replace _CX = 18.44044931 in -50
replace _CY = -66.0454369 in -50

replace c_clustid1 = 51 in -51
replace _CX = 18.0758994 in -51
replace _CY = -66.7456988 in -51

replace c_clustid1 = 52 in -52
replace _CX = 17.9746777 in -52
replace _CY = -66.4089708 in -52

replace c_clustid1 = 53 in -53
replace _CX = 18.0077335 in -53
replace _CY = -66.0182065 in -53

replace c_clustid1 = 54 in -54
replace _CX = 18.1181373 in -54
replace _CY = -66.1733146 in -54

replace c_clustid1 = 55 in -55
replace _CX = 18.1640236 in -55
replace _CY = -66.1606851 in -55

replace c_clustid1 = 56 in -56
replace _CX = 18.1785181 in -56
replace _CY = -66.0505052 in -56

replace c_clustid1 = 57 in -57
replace _CX = 18.2418371 in -57
replace _CY = -66.0474825 in -57

replace c_clustid1 = 58 in -58
replace _CX = 18.2403038 in -58
replace _CY = -66.0234709 in -58

replace c_clustid1 = 59 in -59
replace _CX = 18.1407728 in -59
replace _CY = -65.870928 in -59

replace c_clustid1 = 60 in -60
replace _CX = 18.1624899 in -60
replace _CY = -65.988556 in -60

replace c_clustid1 = 61 in -61
replace _CX = 18.0830062 in -61
replace _CY = -65.8049298 in -61

replace c_clustid1 = 62 in -62
replace _CX = 18.2519925 in -62
replace _CY = -66.0304925 in -62

replace c_clustid1 = 63 in -63
replace _CX = 18.2471538 in -63
replace _CY = -65.9795402 in -63

replace c_clustid1 = 64 in -64
replace _CX = 18.1474696 in -64
replace _CY = -65.8218728 in -64

replace c_clustid1 = 65 in -65
replace _CX = 18.2350268 in -65
replace _CY = -65.8167719 in -65

replace c_clustid1 = 66 in -66
replace _CX = 18.4132317 in -66
replace _CY = -66.3308506 in -66

replace c_clustid1 = 67 in -67
replace _CX = 18.2497509 in -67
replace _CY = -66.3389067 in -67

replace c_clustid1 = 68 in -68
replace _CX = 18.3978941 in -68
replace _CY = -66.155918 in -68

replace c_clustid1 = 69 in -69
replace _CX = 18.0183743 in -69
replace _CY = -66.5342502 in -69

replace c_clustid1 = 70 in -70
replace _CX = 18.2477987 in -70
replace _CY = -66.3884029 in -70

replace c_clustid1 = 71 in -71
replace _CX = 18.413703 in -71
replace _CY = -66.2986268 in -71

replace c_clustid1 = 72 in -72
replace _CX = 18.4406869 in -72
replace _CY = -66.0452415 in -72

replace c_clustid1 = 73 in -73
replace _CX = 18.4412454 in -73
replace _CY = -66.3333992 in -73

replace c_clustid1 = 74 in -74
replace _CX = 18.4602852 in -74
replace _CY = -66.1968688 in -74

replace c_clustid1 = 75 in -75
replace _CX = 18.3742393 in -75
replace _CY = -66.1974157 in -75

replace c_clustid1 = 76 in -76
replace _CX = 18.3848247 in -76
replace _CY = -66.146636 in -76

replace c_clustid1 = 77 in -77
replace _CX = 18.3371613 in -77
replace _CY = -66.2764568 in -77

replace c_clustid1 = 79 in -78
replace _CX = 18.2140522003174 in -78
replace _CY = -66.0400924682617 in -78

replace c_clustid1 = 80 in -79
replace _CX = 18.4277839660645 in -79
replace _CY = -66.1353378295898 in -79

replace c_clustid1 = 81 in -80
replace _CX = 18.2830377 in -80
replace _CY = -65.8722781 in -80

replace c_clustid1 = 83 in -81
replace _CX = 18.4445018768311 in -81
replace _CY = -66.3815460205078 in -81

replace c_clustid1 = 84 in -82
replace _CX = 18.3237 in -82
replace _CY = -66.3377 in -82

replace c_clustid1 = 85 in -83
replace _CX = 18.3387832641602 in -83
replace _CY = -65.6631240844727 in -83

replace c_clustid1 = 87 in -84
replace _CX = 18.3919492 in -84
replace _CY = -66.1853576 in -84

replace c_clustid1 = 89 in -85
replace _CX = 18.12868309021 in -85
replace _CY = -66.1074829101563 in -85

replace c_clustid1 = 90 in -86
replace _CX = 18.0174023990884 in -86
replace _CY = -66.609249782368 in -86

replace c_clustid1 = 91 in -87
replace _CX = 18.2975 in -87
replace _CY = -66.2109 in -87

replace c_clustid1 = 92 in -88
replace _CX = 18.3588 in -88
replace _CY = -66.5677 in -88

replace c_clustid1 = 93 in -89
replace _CX = 18.2434 in -89
replace _CY = -66.2887 in -89

replace c_clustid1 = 94 in -90
replace _CX = 18.1824340820313 in -90
replace _CY = -65.9583511352539 in -90

replace c_clustid1 = 99 in -91
replace _CX = 18.5020206 in -91
replace _CY = -67.0928127 in -91

replace c_clustid1 = 100 in -92
replace _CX = 18.204288482666 in -92
replace _CY = -67.1415933105476 in -92

replace c_clustid1 = 100 in -93
replace _CX = 18.1116371154782 in -93
replace _CY = -66.486686706543 in -93

replace c_clustid1 = 102 in -94
replace _CX = 18.1551685333252 in -94
replace _CY = -66.2611846923828 in -94


spset, modify coordsys(latlong, kilometers)

gen distance = .


forvalues i = 1(1) `=_N' {
	di "obs `i'"
	if (lat_avg[`i'] ~= .) & (lon_avg[`i'] ~= .) & (c_clustid1[`i'] > 0) & (c_clustid1[`i'] < 82) {
		spdistance `i' `=_N + 1 - c_clustid1[`i']'
		replace distance = r(distance) in `i'
	}
}


order hhid c_clustid1 *avg c_date distance
*order edate , after(c_date)
order *lat *lon , last

erase Cog_Parenttemp.dta
erase Household_Parenttemp.dta
erase Infor_Parenttemp.dta
erase Phys_Parenttemp.dta
erase Socio_Parenttemp.dta


gen tempdist = 10000
gen tempdist1 = 0
gen tempclust = 0
forvalues i = 1(1) `=_N-83' {
	forvalues j = 0/83 {
		spdistance `i' `=_N-`j''
		replace tempdist1 = r(distance) in `i'
		if tempdist1[`i'] < tempdist[`i'] {
			replace tempdist = tempdist1[`i'] in `i'
			replace tempclust = c_clustid1[`=_N-`j''] in `i'
		}
	}
}
drop tempdist1
rename tempdist shortest_dist
rename tempclust predicted_clust

gen check_clust = c_clustid1 if c_clustid1 ~= predicted_clust

gen home_dist = 7000
forvalues i = 1/`=_N' {
	spdistance `i' `=_N-83'
	replace home_dist = r(distance) in `i'
}

replace distance = . if distance >7000
replace shortest_dist = . if shortest_dist >7000
replace home_dist = . if home_dist >7000

save "../PR_out/Location_Check.dta" , replace

exit
