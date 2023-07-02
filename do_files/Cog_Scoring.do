{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 clear all\
\
*next, I want to find out if we have the right amount of cog scoring and cog surveys\
\
cd "/hdir/0/chrissoria/Stata_CADAS/Data/CUBA_out"\
insheet using "../CUBA_in/Cog_Scoring.csv"\
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
 save Cog_Scoring.dta, replace\
 export excel using "Cognitive_Scoring.xlsx", firstrow(variables) nolabel replace\
\
 d\
 sum\
 list\
 \
 log close\
\
clear all}