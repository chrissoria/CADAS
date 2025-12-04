* Phys_english_labels.do
* Apply English labels to Physical Exam variables
* Called from Phys_Read.do when language == "E"

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
label variable p2_1 "2.1 Were you able to perform the blood pressure measurement?"
label variable p2_2_1 "Systolic (usual range is >80 or <200)"
label variable p2_2_2 "Diastolic (usual range is >50 or <200)"
capture label variable p2_3 "2.3 Were you able to perform the blood pressure measurement?"
capture label variable p2_3_1 "SYSTOLIC PRESSURE (usual range: >80 or <200)"
capture label variable p2_3_2 "DIASTOLIC PRESSURE (usual range: >50 or <200)"

* Section 3: Head Circumference
capture label variable p3_d_c "Head circumference (Centimeters) (usual range is >49 or <63)"
capture label variable p3_p "Head circumference (Inches) (usual range is >19 or <25)"

* Section 4: Waist Circumference
capture label variable p4_d_c "Waist circumference (Centimeters) (usual range is >56 or <129)"
capture label variable p4_p "Waist circumference (Inches) (usual range is >21 or <50)"

* Section 5: Height Measurements
capture label variable p5_1_d_c "Knee height (Centimeters) (usual range is >49 or <59)"
capture label variable p5_1_p "Knee height (Inches) (usual range is >19 or <23)"
capture label variable p5_2_d_c "Stature (Centimeters) (usual range is >131 or <189)"
capture label variable p5_2_p "Stature (Inches) (usual range is >51 or <74)"

* Section 6: Eye Movement
capture label variable p6 "Please do not move your head, only follow my finger with your eyes"

* Section 7: Primitive Reflexes
capture label variable p7_1 "7.1 GLABELLAR REFLEX Tap lightly on the participant's forehead above the bridge of the nose. Repeat the tap until the patient stops blinking. Count the number of taps needed."
capture label variable p7_2 "7.2 SNOUT REFLEX Tap lightly on the participant's lips with the tip of the index finger."
capture label variable p7_3 "7.3 PALMOMENTAL REFLEX Scratch the lateral side of the little finger on the participant's palm with a key while observing the chin and mouth for signs of movement."

* Section 8: Tremor
capture label variable p8_1 "8.1 HEAD"
capture label variable p8_2 "8.2 RIGHT UPPER EXTREMITY"
capture label variable p8_3 "8.3 LEFT UPPER EXTREMITY"

* Section 9: Facial Deviation
capture label variable p9_1 "9.1 DEVIATION PRESENT"
capture label variable p9_2 "9.2 Side deviated"

* Section 10: Limb Tone
capture label variable p10_1_1_1 "10.1.1.1 Upper - Left"
capture label variable p10_1_1_2 "10.1.1.2 Upper - Right"
capture label variable p10_1_2_1 "10.1.2.1. Lower - Left"
capture label variable p10_1_2_2 "10.1.2.2. Lower - Right"
capture label variable p10_2_1_1 "10.2.1.1 Upper - Left"
capture label variable p10_2_1_2 "10.2.1.2. Upper - Right"
capture label variable p10_2_2_1 "10.2.2.1 Lower - Left"
capture label variable p10_2_2_2 "10.2.2.2 Lower - Right"

* Section 11: Hand Dominance and Fine Motor
capture label variable p11_1 "Which hand do you use to write? (You may use another culturally appropriate question to determine dominance if participant is illiterate)"
capture label variable p11_2_1 "11.2.1 RIGHT HAND FINGERS"
capture label variable p11_2_2 "11.2.2 LEFT HAND FINGERS"
capture label variable p11_3_1_1 "11.3.1.1. Speed of alternating movements on right"
capture label variable p11_3_1_2 "11.3.1.2. Speed of alternating movements on left"
capture label variable p11_3_2_1 "11.3.2.1. Alternating movements on right"
capture label variable p11_3_2_2 "11.3.2.2. Alternating movements on left"

* Section 12: Motor Sequencing
capture label variable p12_1 "12.1. WHICH HAND USED FOR PALM-FIST-SIDE"
capture label variable p12_2_1 "12.2.1. Learning - FIST-PALM-SIDE"
capture label variable p12_2_2 "12.2.2 Sequence: - FIST-PALM-SIDE."
capture label variable p12_3_1 "12.3.1. LEARNING - RECIPROCAL COORDINATION"
capture label variable p12_3_2 "12.3.2 SEQUENCES - RECIPROCAL COORDINATION"

* Section 13: Deep Tendon Reflexes
capture label variable p13_1 "13.1 Right biceps jerk"
capture label variable p13_2 "13.2 Left biceps jerk"
capture label variable p13_3 "13.3 Jaw jerk"
capture label variable p13_4 "13.4 Right knee jerk"
capture label variable p13_5 "13.5 Left knee jerk"

* Section 14: Gait Assessment
capture label variable p14_1 "14.1 Number of steps taken (you need to count them): ## 66 COULD NOT DO DUE TO DISABILITY 77 COULD NOT DO FOR OTHER REASON"
capture label variable p14_2 "14.2 Time it took to do it (you need to time using an appropriate watch): ## 66 COULD NOT DO DUE TO DISABILITY 77 COULD NOT DO FOR OTHER REASON"
capture label variable p14_3_1 "14.3.1 Arm swing, right"
capture label variable p14_3_2 "14.3.2 Arm swing, left"
capture label variable p14_4 "14.4 Ataxia (instability)"
capture label variable p14_5 "14.5 Bradykinesia (slowness of movement)"

* Section 15: Grip Strength
capture label variable p15_a "15.A Were you able to perform the hand grip strength test?"
capture label variable p15_1_1 "15.1.1. 1st TEST"
capture label variable p15_1_2 "15.1.2. 2nd TEST"
capture label variable p15_1_3 "15.1.3. 3rd TEST"
capture label variable p15_2_1 "15.2.1. 1st TEST"
capture label variable p15_2_2 "15.2.2. 2nd TEST"
capture label variable p15_2_3 "15.2.3. 3rd TEST"

* Section 16-17: Dental
capture label variable p16_1 "16.1 Do you have dentures?"
capture label variable p16_2 "16.2 OBSERVATION: WAS THE PARTICIPANT WEARING DENTURES AT THE TIME OF THE EXAM?"
capture label variable p17_1 "17.1 UPPER JAW"
capture label variable p17_2 "17.2 LOWER JAW"
capture label variable p17_3 "17.3 Do you have problems chewing?"

* Section 18: Weight
capture label variable p18_d_c "WEIGHT (KILOS)"
capture label variable p18_p "WEIGHT (POUNDS)"

* Section 19: Chair Stand
capture label variable p19_1 "19.1 OBSERVATION"
capture label variable p19_2 "19.2 OBSERVATION Number of repetitions performed in 30 seconds DID NOT ATTEMPT............66"

* Section 20: Mobility Observation
capture label variable p20 "20. INTERVIEWER: select the number that best describes the participant's mobility as a result of everything you observed during the interview"

* Section 21: Vision
capture label variable p21_1 "21.1 Do you normally wear glasses?"
capture label variable p21_2 "21.2 How is your vision (with glasses, if you normally wear them)?"

* Section 22: Hearing
capture label variable p22_1 "22.1 Do you normally use a hearing aid?"
capture label variable p22_2 "22.2 How is your hearing (with hearing aid if you normally use one)?"
