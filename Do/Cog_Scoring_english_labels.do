* Cog_Scoring_english_labels.do
* Apply English labels to Cognitive Scoring variables
* Called from Cog_Scoring_Read.do - only runs if language == "E"

* Check if language is set to English (using global from master)
if `"$language"' == "E" {

capture program drop apply_cog_scoring_english_labels
program define apply_cog_scoring_english_labels

****************************************
* VARIABLE LABELS (label variable)
****************************************

capture label variable cs_interid "INTERVIEWER"
capture label variable cs_houseid "HOUSE"
capture label variable cs_clustid "CLUSTER:"
capture label variable cs_particid "PARTICIPANT"
capture label variable cs_country "Country"
capture label variable cs_houseid2 "HOUSE"
capture label variable cs_conglid2 "CLUSTER:"
capture label variable cs_particid2 "PARTICIPANT"
capture label variable cs_32 "32. Drawing pentagons (0-1)"
capture label variable cs_40 "40.# Animals acceptable (excluding repetitions)"
capture label variable cs_41 "41.# Repetitions"
capture label variable cs_43 "43. Correct"
capture label variable cs_44 "44. Incorrect"
capture label variable cs_72_1 "72.1. Circle (0-2)"
capture label variable cs_72_2 "72.2. Diamond (0-3)"
capture label variable cs_72_3 "72.3. Crossed Rectangles (0-2)"
capture label variable cs_72_4 "72.4. Cube (0-4)"
capture label variable cs_79_1 "79.1. Circle (0-2)"
capture label variable cs_79_2 "79.2. Diamond (0-3)"
capture label variable cs_79_3 "79.3. Crossed Rectangles (0-2)"
capture label variable cs_79_4 "79.4. Cube (0-4)"

end

* Call the program
apply_cog_scoring_english_labels

} // end if language == "E"
