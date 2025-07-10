capture log close

// Prepare LASI core data
global PROGDIR  "./adofiles"
global WAVES    1
local  datadir  "./data"
global HLASI    "`datadir'/H_LASI_all.dta"
global BASEFILE "`datadir'/lasi-basedemo.dta"
global DEMOFILE "`datadir'/lasi-wavedemo.dta"
global HLTHFILE "`datadir'/lasi-econ-health.dta"
global COGFILE  "`datadir'/lasi-cognition.dta"
global INFFILE  "`datadir'/lasi-informant.dta"
global OUTFILE  "lasi-imputed.dta"
do "prep_lasi.do"

// Demographics
global ILASI    "${OUTFILE}"
global HDAD     "`datadir'/H_DAD_noimp.dta"
global DRAWFILE "dad_cogimp_draws.dta"
global REDRAW   1
global SEEDFILE "./seeds/rseed-dad-demo.dta"
global SEEDLOG  "./seeds/rseed-dad-demo.log"
global OUTFILE  "dad-demo.dta"
do "dad_cogimp01.do"

global SEEDFILE "./seeds/rseed-dad-health.dta"
global SEEDLOG  "./seeds/rseed-dad-health.log"
global DEMOFILE `"${OUTFILE}"'
global OUTFILE  "dad-health.dta"
do "dad_cogimp02.do"

global SEEDFILE "./seeds/rseed-dad-cog.dta"
global SEEDLOG  "./seeds/rseed-dad-cog.log"
global HLTHFILE `"${OUTFILE}"'
global OUTFILE  "dad-cognition.dta"
global OUTFILE2 "dad-cognition-finalized.dta"
do "dad_cogimp03.do"

exit

// EOF
