{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all\
set more off\
capture log close\
log using Cognitive_Socring, text replace\
\
*next, I want to find out if we have the right amount of cog scoring and cog surveys\
\
local country = 1\
\
if `country' == 0 \{\
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/PR_out"\
\}\
else if `country' == 1 \{\
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/DR_out"\
\}\
else if `country' == 2 \{\
    cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
\}\
\
*below we read in a country-specific file\
\
if `country' == 0 \{\
    insheet using "../PR_in/Cog_Scoring.csv", comma names clear\
\}\
else if `country' == 1 \{\
    insheet using "../DR_in/Cog_Scoring.csv", comma names clear\
\}\
else if `country' == 2 \{\
    insheet using "../CUBA_in/Cog_Scoring.csv", comma names clear\
\}\
 \
gen cs_country_str = string(cs_country, "%12.0f")\
\
gen cs_clustid_str = string(cs_clustid, "%12.0f")\
replace cs_clustid_str = cond(strlen(cs_clustid_str) == 1, "0" + cs_clustid_str, cs_clustid_str)\
\
gen cs_houseid_str = string(cs_houseid, "%03.0f")\
replace cs_houseid_str = cond(strlen(cs_houseid_str) == 1, "00" + cs_houseid_str, cs_houseid_str)\
replace cs_houseid_str = cond(strlen(cs_houseid_str) == 2, "0" + cs_houseid_str, cs_houseid_str)\
\
gen cs_particid_str = string(cs_particid, "%12.0f")\
replace cs_particid_str = cond(strlen(cs_particid_str) == 1, "0" + cs_particid_str, cs_particid_str)\
\
gen pid = cs_country_str + cs_clustid_str + cs_houseid_str + cs_particid_str\
gen hhid = cs_country_str + cs_clustid_str + cs_houseid_str\
\
drop firstsavelogonname firstsavetime lastsavelogonname lastsavetime fkey\
\
order cs_interid cs_houseid cs_clustid cs_particid cs_country cs_houseid2 cs_conglid2 cs_particid2 cs_32 cs_40 cs_41 cs_43 cs_44 cs_72_1 cs_72_2 cs_72_3 cs_72_4 cs_79_1 cs_79_2 cs_79_3 cs_79_4\
\
label variable cs_interid "NUMERO DEL ENTREVISTADOR"\
\
label variable cs_houseid "N\'daMERO DE LA CASA"\
\
label variable cs_clustid "NUMERO DEL CLUSTER:"\
\
label variable cs_particid "NUMERO DEL PARTICIPANTE"\
\
label variable cs_country "Pais"\
\
label variable cs_houseid2 "N\'daMERO DE LA CASA"\
\
label variable cs_conglid2 "NUMERO DEL CLUSTER:"\
\
label variable cs_particid2 "NUMERO DEL PARTICIPANTE"\
\
label variable cs_32 "32. Dibujo de pentagonos (0-1)"\
\
label variable cs_40 "40.# Animales"\
\
label variable cs_41 "41.# Repetitiones"\
\
label variable cs_43 "43. Correctas"\
\
label variable cs_44 "44. Incorrectas"\
\
label variable cs_72_1 "72.1. El c\'edrculo (0-2)"\
\
label variable cs_72_2 "72.2. El diamante (0-3)"\
\
label variable cs_72_3 "72.3. Rect\'e1ngulos cruzados (0-2)"\
\
label variable cs_72_4 "72.4. El cubo (0-4)"\
\
label variable cs_79_1 "79.1. El c\'edrculo (0-2)"\
\
label variable cs_79_2 "79.2. El diamante (0-3)"\
\
label variable cs_79_3 "79.3. Rect\'e1ngulos cruzados (0-2)"\
\
label variable cs_79_4 "79.4. El cubo (0-4)"\
\
 save Cog_Scoring.dta, replace\
 export excel using "Cognitive_Scoring.xlsx", firstrow(variables) nolabel replace\
\
 d\
 sum\
 list\
 \
 log close\
\
clear all\
}