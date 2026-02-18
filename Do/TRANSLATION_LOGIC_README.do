/*
================================================================================
CADAS TRANSLATION FRAMEWORK - LOGIC SUMMARY
================================================================================

PURPOSE:
Create English-labeled versions of Spanish data files by conditionally saving
to translation folders when the global $language variable is set to "E".

--------------------------------------------------------------------------------
GLOBAL VARIABLE:
--------------------------------------------------------------------------------
$language - Set in CADAS_master.do
  "S" = Spanish (default) - saves to regular locations
  "E" = English - saves to translation folders

--------------------------------------------------------------------------------
TRANSLATION FOLDER STRUCTURE:
--------------------------------------------------------------------------------
Each country output folder has a translation subfolder:
  - PR_out/translation_PR/
  - DR_out/translation_DR/
  - CUBA_out/translation_CUBA/

Each translation folder contains:
  - excel/          (for Excel exports)
  - duplicates/     (for duplicate check exports)

--------------------------------------------------------------------------------
LOCAL MACRO PATTERN:
--------------------------------------------------------------------------------
Define trans_folder based on language and country:

    if `"$language"' == "E" {
        if `country' == 0 {
            local trans_folder "translation_PR/"
        }
        else if `country' == 1 {
            local trans_folder "translation_DR/"
        }
        else if `country' == 2 {
            local trans_folder "translation_CUBA/"
        }
    }
    else {
        local trans_folder ""
    }

IMPORTANT: Must re-define trans_folder after every `clear all` command
since clear all erases local macros.

--------------------------------------------------------------------------------
FILE OPERATIONS WITH TRANS_FOLDER:
--------------------------------------------------------------------------------
Use files:
    use `trans_folder'Filename.dta

Save files:
    save `trans_folder'Filename.dta, replace

Export Excel:
    export excel using "`trans_folder'excel/filename.xlsx", ...
    export excel using "`trans_folder'duplicates/filename.xlsx", ...

Merge files:
    merge 1:1 keyvar using `trans_folder'Filename.dta

--------------------------------------------------------------------------------
READ FILE PATTERN (_Read.do files):
--------------------------------------------------------------------------------
For files with intermediate saves before parent form merges (Socio, Phys, Infor, Cog):

1. FIRST SAVE (before parent merge):
   - Apply English labels if $language == "E"
   - Save to translation folder for English, regular location for Spanish

   Example:
   if `"$language"' == "E" {
       capture do "path/to/Filename_english_labels.do"
       if `country' == 0 {
           save "translation_PR/Filename.dta", replace
       }
       else if `country' == 1 {
           save "translation_DR/Filename.dta", replace
       }
       else if `country' == 2 {
           save "translation_CUBA/Filename.dta", replace
       }
   }
   else {
       save Filename.dta, replace
   }

2. AFTER CLEAR ALL (before parent form merge):
   - Re-define trans_folder local macro
   - Load parent CSV
   - Merge with trans_folder'Filename (matches where first save went)

3. FINAL SAVE:
   - Apply English labels again if needed
   - Save to translation folder for English, regular for Spanish

--------------------------------------------------------------------------------
ENGLISH LABELS FILES:
--------------------------------------------------------------------------------
Located in Do/Read/ folder:
  - Socio_english_labels.do
  - Phys_english_labels.do
  - Infor_english_labels.do
  - Cog_english_labels.do
  - Cog_Scoring_english_labels.do
  - Household_english_labels.do
  - Neighborhood_english_labels.do

These files contain:
  - capture label variable varname "English Label"
  - capture label define/replace value label definitions

--------------------------------------------------------------------------------
FILES MODIFIED FOR TRANSLATION:
--------------------------------------------------------------------------------
Read files (Do/Read/):
  - Socio_Read.do
  - Phys_Read.do
  - Infor_Read.do
  - Cog_Read.do
  - Cog_Scoring_Read.do
  - Household_Read.do
  - Neighborhood_Read.do

Processing files (Do/):
  - EVERYTHING_WIDE.do
  - Tracker.do
  - consensus_site.do

Global checks files:
  - Do/PR/global_checks_PR.do
  - Do/DR/global_checks_DR.do
  - Do/CU/global_checks_CU.do

--------------------------------------------------------------------------------
TRANSLATED DATASETS:
--------------------------------------------------------------------------------
  - Socio.dta
  - Phys.dta
  - Infor.dta
  - Cog.dta
  - Cog_Scoring.dta
  - Household.dta
  - Neighborhood.dta
  - Everything_Wide.dta (and variants: _full, _slim, _door)
  - tracker_full.dta (and variants: _slim, _door)
  - ConsensusVariables.dta

--------------------------------------------------------------------------------
COUNTRY CODES:
--------------------------------------------------------------------------------
  0 = Puerto Rico (PR)
  1 = Dominican Republic (DR)
  2 = Cuba

================================================================================
*/
