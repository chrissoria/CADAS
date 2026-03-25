* Phys_english_labels.do
* Apply English labels to Physical Exam variables
* Called from Phys_Read.do when language == "E"

****************************************
* VALUE LABELS (label define + label values)
****************************************

label define P2_1   0 "No" 1 "Yes", replace
capture label values p_2_1 P2_1

label define P2_3   0 "No" 1 "Yes", replace
capture label values p_2_3 P2_3

label define P6     0 "Normal upgaze" 1 "Limited upgaze" 2 "No upgaze, or almost no upgaze" 6 "Did not do the test", replace
capture label values p_6 P6

label define P7_1   0 "1-4 taps" 1 "5 taps" 2 "6-9 taps" 3 "10+ taps" 6 "Did not do the test", replace
capture label values p_7_1 P7_1

label define P7_2   0 "No pout (sticks out lips)" 1 "Pout reflex present" 6 "Could not do test", replace
capture label values p_7_2 P7_2

label define P7_3   0 "No facial twitch" 1 "Facial twitch reflex present" 6 "Could not do test", replace
capture label values p_7_3 P7_3

label define P8_tone 0 "There is no tremor" 1 "Slow" 2 "Medium" 3 "Fast" 6 "Could not do test", replace
capture label values p_8_1 P8_tone
capture label values p_8_2 P8_tone
capture label values p_8_3 P8_tone

label define P9_1   0 "No drift" 1 "Drift, for neurological causes" 2 "Drift, for other causes" 6 "Did not attempt test", replace
capture label values p_9_1 P9_1

label define P9_2   0 "Right" 1 "Left" 6 "Could not do test" 7 "Did not attempt test", replace
capture label values p_9_2 P9_2

label define P10_tone 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test", replace
capture label values p_10_1_1_1 P10_tone
capture label values p_10_1_1_2 P10_tone
capture label values p_10_1_2_1 P10_tone
capture label values p_10_1_2_2 P10_tone
capture label values p_10_2_1_1 P10_tone
capture label values p_10_2_1_2 P10_tone
capture label values p_10_2_2_1 P10_tone
capture label values p_10_2_2_2 P10_tone

label define P11_1  0 "Right" 1 "Left" 8 "Does not respond" 9 "Does not know", replace
capture label values p_11_1 P11_1

label define P11_2  0 "No limitations" 1 "Limitations (slow, and or clumsy)" 6 "Could not do test", replace
capture label values p_11_2_1 P11_2
capture label values p_11_2_2 P11_2

label define P11_3_spd 0 "Normal speed" 1 "Slow" 6 "Did not try test", replace
capture label values p_11_3_1_1 P11_3_spd
capture label values p_11_3_1_2 P11_3_spd

label define P11_3_crd 0 "Normal coordination" 1 "Clumsy, uncoordinated" 6 "Did not try test", replace
capture label values p_11_3_2_1 P11_3_crd
capture label values p_11_3_2_2 P11_3_crd

label define P12_1  0 "Dominant" 1 "Non-dominant" 6 "Did not try test", replace
capture label values p_12_1 P12_1

label define P12_learn 0 "Requires only 1 demonstration" 1 "Requires 2-3 demonstrations" 2 "Requires 4-5 demonstrations" 3 "Unable to learn correctly with 5 demonstrations" 6 "Did not try test", replace
capture label values p_12_2_1 P12_learn
capture label values p_12_3_1 P12_learn

label define P12_seq 0 "5 correct sequences" 1 "5 sequences, made with one mistake" 2 "5 sequences after one re-demonstration" 3 "Unable to complete 5 sequences correctly" 6 "Did not try test", replace
capture label values p_12_2_2 P12_seq
capture label values p_12_3_2 P12_seq

label define P13    0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test", replace
capture label values p_13_1 P13
capture label values p_13_2 P13
capture label values p_13_3 P13
capture label values p_13_4 P13
capture label values p_13_5 P13

label define P14_swing 0 "Normal arm swing" 1 "Reduced arm swing" 2 "No arm swing" 6 "Did not try due to disability" 7 "Could not do it for another reason", replace
capture label values p_14_3_1 P14_swing
capture label values p_14_3_2 P14_swing

label define P14_4  0 "Normal gait" 1 "Unstable, broad-based gait" 2 "Very unstable, broad-based gait" 6 "Did not try due to disability" 7 "Could not do it for another reason", replace
capture label values p_14_4 P14_4

label define P14_5  0 "Normal speed" 1 "Somewhat slow" 2 "Very slow" 6 "Did not try due to disability" 7 "Could not do it for another reason", replace
capture label values p_14_5 P14_5

label define P15_A  0 "No" 1 "Yes", replace
capture label values p_15_a P15_A

label define P16_1  0 "No" 1 "Yes", replace
capture label values p_16_1 P16_1

label define P16_2  0 "No" 1 "Yes" 8 "Does not respond" 9 "Does not know", replace
capture label values p_16_2 P16_2

label define P17_3  0 "No problems" 1 "Some problems" 2 "Many problems" 8 "Does not respond" 9 "Does not know", replace
capture label values p_17_3 P17_3

label define P19_1  1 "Could not finish the task" 2 "Could finish task, but needed to use hands" 3 "Could finish task, without help of hands" 6 "Did not try", replace
capture label values p_19_1 P19_1

label define P20    0 "Bed-bound / Confined to bed" 1 "Chair-bound / Confined to chair (limited mobility, can transfer from chair to bed)" 2 "House-bound (limited mobility, stays at home)" 3 "Limited mobility outside the home" 4 "Complete mobility, inside and outside the home" 9 "Does not know", replace
capture label values p_20 P20

label define P21_1  0 "No" 1 "Yes" 8 "Does not respond", replace
capture label values p_21_1 P21_1

label define P21_2  1 "Excellent" 2 "Very good" 3 "Good" 4 "Fair" 5 "Poor" 6 "Blind" 8 "Does not respond" 9 "Does not know", replace
capture label values p_21_2 P21_2

label define P22_1  0 "No" 1 "Yes" 8 "Does not respond", replace
capture label values p_22_1 P22_1

label define P22_2  1 "Excellent" 2 "Very good" 3 "Good" 4 "Fair" 5 "Poor" 6 "Deaf" 8 "Does not respond" 9 "Does not know", replace
capture label values p_22_2 P22_2

****************************************
* VARIABLE LABELS (label variable)
****************************************

* Identifier variables
label variable p_deviceid1 "Device ID:"
capture label variable p_deviceid2 "Device ID:"
label variable p_interid "Interviewer number:"
label variable p_clustid "Cluster number:"
label variable p_houseid "House number:"
label variable p_particid "Participant number:"
label variable p_country "Country"
label variable p_houseid2 "HOUSE NUMBER"
label variable p_conglid2 "CLUSTER NUMBER:"
label variable p_particid2 "PARTICIPANT NUMBER"

* Section 2: Blood Pressure
label variable p_2_1 "2.1 Were you able to perform the blood pressure measurement?"
label variable p_2_2_1 "Systolic (usual range is >80 or <200)"
label variable p_2_2_2 "Diastolic (usual range is >50 or <200)"
capture label variable p_2_3 "2.3 Were you able to perform the blood pressure measurement?"
capture label variable p_2_3_1 "SYSTOLIC PRESSURE (usual range: >80 or <200)"
capture label variable p_2_3_2 "DIASTOLIC PRESSURE (usual range: >50 or <200)"

* Section 3: Head Circumference
capture label variable p_3_d_c "Head circumference (Centimeters) (usual range is >49 or <63)"
capture label variable p_3_p "Head circumference (Inches) (usual range is >19 or <25)"

* Section 4: Waist Circumference
capture label variable p_4_d_c "Waist circumference (Centimeters) (usual range is >56 or <129)"
capture label variable p_4_p "Waist circumference (Inches) (usual range is >21 or <50)"

* Section 5: Height Measurements
capture label variable p_5_1_d_c "Knee height (Centimeters) (usual range is >49 or <59)"
capture label variable p_5_1_p "Knee height (Inches) (usual range is >19 or <23)"
capture label variable p_5_2_d_c "Stature (Centimeters) (usual range is >131 or <189)"
capture label variable p_5_2_p "Stature (Inches) (usual range is >51 or <74)"

* Section 6: Eye Movement
capture label variable p_6 "Vertical gaze assessment"

* Section 7: Primitive Reflexes
capture label variable p_7_1 "7.1 Glabellar reflex"
capture label variable p_7_2 "7.2 Snout reflex"
capture label variable p_7_3 "7.3 Palmomental reflex"

* Section 8: Tremor
capture label variable p_8_1 "8.1 HEAD"
capture label variable p_8_2 "8.2 RIGHT UPPER EXTREMITY"
capture label variable p_8_3 "8.3 LEFT UPPER EXTREMITY"

* Section 9: Facial Deviation
capture label variable p_9_1 "9.1 DEVIATION PRESENT"
capture label variable p_9_2 "9.2 Side deviated"

* Section 10: Limb Tone
capture label variable p_10_1_1_1 "10.1.1.1 Upper - Left"
capture label variable p_10_1_1_2 "10.1.1.2 Upper - Right"
capture label variable p_10_1_2_1 "10.1.2.1. Lower - Left"
capture label variable p_10_1_2_2 "10.1.2.2. Lower - Right"
capture label variable p_10_2_1_1 "10.2.1.1 Upper - Left"
capture label variable p_10_2_1_2 "10.2.1.2. Upper - Right"
capture label variable p_10_2_2_1 "10.2.2.1 Lower - Left"
capture label variable p_10_2_2_2 "10.2.2.2 Lower - Right"

* Section 11: Hand Dominance and Fine Motor
capture label variable p_11_1 "Which hand do you use to write?"
capture label variable p_11_2_1 "11.2.1 RIGHT HAND FINGERS"
capture label variable p_11_2_2 "11.2.2 LEFT HAND FINGERS"
capture label variable p_11_3_1_1 "11.3.1.1. Speed of alternating movements on right"
capture label variable p_11_3_1_2 "11.3.1.2. Speed of alternating movements on left"
capture label variable p_11_3_2_1 "11.3.2.1. Alternating movements on right"
capture label variable p_11_3_2_2 "11.3.2.2. Alternating movements on left"

* Section 12: Motor Sequencing
capture label variable p_12_1 "12.1. WHICH HAND USED FOR PALM-FIST-SIDE"
capture label variable p_12_2_1 "12.2.1. Learning - FIST-PALM-SIDE"
capture label variable p_12_2_2 "12.2.2 Sequence: - FIST-PALM-SIDE."
capture label variable p_12_3_1 "12.3.1. LEARNING - RECIPROCAL COORDINATION"
capture label variable p_12_3_2 "12.3.2 SEQUENCES - RECIPROCAL COORDINATION"

* Section 13: Deep Tendon Reflexes
capture label variable p_13_1 "13.1 Right biceps jerk"
capture label variable p_13_2 "13.2 Left biceps jerk"
capture label variable p_13_3 "13.3 Jaw jerk"
capture label variable p_13_4 "13.4 Right knee jerk"
capture label variable p_13_5 "13.5 Left knee jerk"

* Section 14: Gait Assessment
capture label variable p_14_1 "14.1 Number of steps taken"
capture label variable p_14_2 "14.2 Time to complete gait test"
capture label variable p_14_3_1 "14.3.1 Arm swing, right"
capture label variable p_14_3_2 "14.3.2 Arm swing, left"
capture label variable p_14_4 "14.4 Ataxia (instability)"
capture label variable p_14_5 "14.5 Bradykinesia (slowness of movement)"

* Section 15: Grip Strength
capture label variable p_15_a "15.A Were you able to perform the hand grip strength test?"
capture label variable p_15_1_1 "15.1.1. 1st TEST"
capture label variable p_15_1_2 "15.1.2. 2nd TEST"
capture label variable p_15_1_3 "15.1.3. 3rd TEST"
capture label variable p_15_2_1 "15.2.1. 1st TEST"
capture label variable p_15_2_2 "15.2.2. 2nd TEST"
capture label variable p_15_2_3 "15.2.3. 3rd TEST"

* Section 16-17: Dental
capture label variable p_16_1 "16.1 Do you have dentures?"
capture label variable p_16_2 "16.2 Was the participant wearing dentures at the time of the exam?"
capture label variable p_17_1 "17.1 UPPER JAW"
capture label variable p_17_2 "17.2 LOWER JAW"
capture label variable p_17_3 "17.3 Do you have problems chewing?"

* Section 18: Weight
capture label variable p_18_d_c "WEIGHT (KILOS)"
capture label variable p_18_p "WEIGHT (POUNDS)"

* Section 19: Chair Stand
capture label variable p_19_1 "19.1 OBSERVATION"
capture label variable p_19_2 "19.2 Number of repetitions performed in 30 seconds"

* Section 20: Mobility Observation
capture label variable p_20 "20. Participant mobility assessment"

* Section 21: Vision
capture label variable p_21_1 "21.1 Do you normally wear glasses?"
capture label variable p_21_2 "21.2 How is your vision (with glasses, if you normally wear them)?"

* Section 22: Hearing
capture label variable p_22_1 "22.1 Do you normally use a hearing aid?"
capture label variable p_22_2 "22.2 How is your hearing (with hearing aid if you normally use one)?"
