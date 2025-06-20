clear all 
set more off
capture log close

capture include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_user_define.do"
capture include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_user_define.do"

if `"`user'"' == "Chris" {
local path = "/hdir/0/chrissoria/Stata_CADAS/Data"
include "/hdir/0/chrissoria/Stata_CADAS/Do/Read/CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translaton_PR"
}
else if `country' == 1 {
    cd "`path'/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}

if `country' == 0 {
    use using "../PR_out/Phys"
}
else if `country' == 1 {
    use using "../DR_out/Phys"
}
else if `country' == 2 {
    use using "../CUBA_out/Phys"
}

}

else if `"`user'"' == "Ty" {
local path = "C:\Users\Ty\Desktop\Stata_CADAS\DATA"
include "C:\Users\Ty\Desktop\CADAS Data do files\CADAS_country_define.do"

if `country' == 0 {
    cd "`path'/translaton_PR"
}
else if `country' == 1 {
    cd "`path'/translation_DR"
}
else if `country' == 2 {
    cd "`path'/translation_CUBA"
}

if `country' == 0 {
    use using "../PR_out/Phys"
}
else if `country' == 1 {
    use using "../DR_out/Phys"
}
else if `country' == 2 {
    use using "../CUBA_out/Phys"
}
}

label drop _all


capture confirm numeric variable P2_1
if !_rc{
     tostring P2_1, replace
}

label define P2_1 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable P6
if !_rc{
     tostring P6, replace
}

label define P6 .a"." 0 "Normal upgaze" 1 "Limited upgaze" 2 "No upgaze, or almost no upgaze" 6 "Did not do the test" 



capture confirm numeric variable P7_1
if !_rc{
     tostring P7_1, replace
}

label define P7_1 .a"." 0 "1-4 taps" 1 "5 taps" 2 "6-9 taps" 3 "10+ taps" 6 "Did not do the test" 



capture confirm numeric variable P7_2
if !_rc{
     tostring P7_2, replace
}

label define P7_2 .a"." 0 "No pout (sticks out lips)" 1 "Pout reflex present" 6 "Could not do test" 



capture confirm numeric variable P7_3
if !_rc{
     tostring P7_3, replace
}

label define P7_3 .a"." 0 "No facial twitch" 1 "Facial twitch reflex present" 6 "Could not do test"



capture confirm numeric variable P8_1
if !_rc{
     tostring P8_1, replace
}

label define P8_1 .a"." 0 "There is no tremor " 1 "Slow" 2 "Medium" 3 "Fast" 6 "Could not do test"



capture confirm numeric variable P8_2
if !_rc{
     tostring P8_2, replace
}

label define P8_2 .a"." 0 "There is no tremor" 1 "Slow" 2 "Medium" 3 "Fast" 6 "Could not do test"



capture confirm numeric variable P8_3
if !_rc{
     tostring P8_3, replace
}

label define P8_3 .a"." 0 "There is no tremor" 1 "Slow" 2 "Medium" 3 "Fast" 6 "Could not do test"



capture confirm numeric variable P9_1
if !_rc{
     tostring P9_1, replace
}

label define P9_1 .a"." 0 "No drift" 1 "Drift, for neurological causes" 2 "Drift, for other causes" 6 "Did not attempt test" 



capture confirm numeric variable P9_2
if !_rc{
     tostring P9_2, replace
}

label define P9_2 .a"." 0 "Right" 1 "Left" 6 "Could not do test"7 "Did not attempt test" 



capture confirm numeric variable P10_1_1_1
if !_rc{
     tostring P10_1_1_1, replace
}

label define P10_1_1_1 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test" 



capture confirm numeric variable P10_1_1_2
if !_rc{
     tostring P10_1_1_2, replace
}

label define P10_1_1_2 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test" 



capture confirm numeric variable P10_1_2_1
if !_rc{
     tostring P10_1_2_1, replace
}

label define P10_1_2_1 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test"  



capture confirm numeric variable P10_1_2_2
if !_rc{
     tostring P10_1_2_2, replace
}

label define P10_1_2_2 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test" 



capture confirm numeric variable P10_2_1_1
if !_rc{
     tostring P10_2_1_1, replace
}

label define P10_2_1_1 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test"  



capture confirm numeric variable P10_2_1_2
if !_rc{
     tostring P10_2_1_2, replace
}

label define P10_2_1_2 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test" 



capture confirm numeric variable P10_2_2_1
if !_rc{
     tostring P10_2_2_1, replace
}

label define P10_2_2_1 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test"  



capture confirm numeric variable P10_2_2_2
if !_rc{
     tostring P10_2_2_2, replace
}

label define P10_2_2_2 .a"." 0 "Normal tone" 1 "Slightly increased tone" 2 "Much increased tone" 6 "Did not attempt test" 



capture confirm numeric variable P11_1
if !_rc{
     tostring P11_1, replace
}

label define P11_1 .a"." 0 "Right" 1 "Left" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable P11_2_1
if !_rc{
     tostring P11_2_1, replace
}

label define P11_2_1 .a"." 0 "No limitations" 1 "Limitations (slow, and or clumsy)" 6 "Could not do test" 



capture confirm numeric variable P11_2_2
if !_rc{
     tostring P11_2_2, replace
}

label define P11_2_2 .a"." 0 "No limitations" 1 "Limitations (slow, and or clumsy)" 6 "Could not do test" 



capture confirm numeric variable P11_3_1_1
if !_rc{
     tostring P11_3_1_1, replace
}

label define P11_3_1_1 .a"." 0 "Normal speed" 1 "Slow" 6 "Did not try test" 



capture confirm numeric variable P11_3_1_2
if !_rc{
     tostring P11_3_1_2, replace
}

label define P11_3_1_2 .a"." 0 "Normal speed" 1 "Slow" 6 "Did not try test" 



capture confirm numeric variable P11_3_2_1
if !_rc{
     tostring P11_3_2_1, replace
}

label define P11_3_2_1 .a"." 0 "Normal coordination" 1 "Clumsy, uncoordinated" 6 "Did not try test" 



capture confirm numeric variable P11_3_2_2
if !_rc{
     tostring P11_3_2_2, replace
}

label define P11_3_2_2 .a"." 0 "Normal coordination" 1 "Clumsy, uncoordinated" 6 "Did not try test" 



capture confirm numeric variable P12_1
if !_rc{
     tostring P12_1, replace
}

label define P12_1 .a"." 0 "Dominant" 1 "Non-dominant" 6 "Did not try test" 



capture confirm numeric variable P12_2_1
if !_rc{
     tostring P12_2_1, replace
}

label define P12_2_1 .a"." 0 "Requires only 1 demonstration" 1 "Requires 2-3 demonstrations" 2 "Requires 4-5 demonstrations" 3 "Unable to learn correctly with 5 demonstrations" 6 "Did not try test" 



capture confirm numeric variable P12_2_2
if !_rc{
     tostring P12_2_2, replace
}

label define P12_2_2 .a"." 0 "5 correct sequences" 1 "5 sequences, made with one mistake" 2 "5 sequences after one re-demonstration" 3 "Unable to complete 5 sequences correctly" 6 "Did not try test" 



capture confirm numeric variable P12_3_1
if !_rc{
     tostring P12_3_1, replace
}

label define P12_3_1 .a"." 0 "Requires only 1 demonstration" 1 "Requires 2-3 demonstrations" 2 "Requires 4-5 demonstrations" 3 "Unable to learn correctly with 5 demonstrations" 6 "Did not try test" 



capture confirm numeric variable P12_3_2
if !_rc{
     tostring P12_3_2, replace
}

label define P12_3_2 .a"." 0 "5 correct sequences" 1 "5 sequences, made with one mistake" 2 "5 sequences after one re-demonstration" 3 "Unable to complete 5 sequences correctly" 6 "Did not try test" 



capture confirm numeric variable P13_1
if !_rc{
     tostring P13_1, replace
}

label define P13_1 .a"." 0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test" 



capture confirm numeric variable P13_2
if !_rc{
     tostring P13_2, replace
}

label define P13_2 .a"." 0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test" 



capture confirm numeric variable P13_3
if !_rc{
     tostring P13_3, replace
}

label define P13_3 .a"." 0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test" 



capture confirm numeric variable P13_4
if !_rc{
     tostring P13_4, replace
}

label define P13_4 .a"." 0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test" 



capture confirm numeric variable P13_5
if !_rc{
     tostring P13_5, replace
}

label define P13_5 .a"." 0 "Absent" 1 "Normal (+)" 2 "Fast normal (2+)" 3 "Pathologically fast (3+)" 6 "Did not try the test" 



capture confirm numeric variable P2_3
if !_rc{
     tostring P2_3, replace
}

label define P2_3 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable P14_3_1
if !_rc{
     tostring P14_3_1, replace
}

label define P14_3_1 .a"." 0 "Normal arm swing" 1 "Reduced arm swing" 2 "No arm swing" 6 "Did not try due to disability" 7 "Could not do it for another reason" 



capture confirm numeric variable P14_3_2
if !_rc{
     tostring P14_3_2, replace
}

label define P14_3_2 .a"." 0 "Normal arm swing" 1 "Reduced arm swing" 2 "No arm swing" 6 "Did not try due to disability" 7 "Could not do it for another reason" 



capture confirm numeric variable P14_4
if !_rc{
     tostring P14_4, replace
}

label define P14_4 .a"." 0 "Normal gait" 1 "Unstable, broad-based gait" 2 "Very unstable, broad-based gait" 6 "Did not try due to disability" 7 "Could not do it for another reason" 



capture confirm numeric variable P14_5
if !_rc{
     tostring P14_5, replace
}

label define P14_5 .a"." 0 "Normal speed" 1 "Somewhat slow" 2 "Very slow" 6 "Did not try due to disability" 7 "Could not do it for another reason" 



capture confirm numeric variable P15_A
if !_rc{
     tostring P15_A, replace
}

label define P15_A .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable P16_1
if !_rc{
     tostring P16_1, replace
}

label define P16_1 .a"." 0 "No" 1 "Yes" 



capture confirm numeric variable P16_2
if !_rc{
     tostring P16_2, replace
}

label define P16_2 .a"." 0 "No" 1 "Yes" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable P17_3
if !_rc{
     tostring P17_3, replace
}

label define P17_3 .a"." 0 "No problems" 1 "Some problems" 2 "Many problems" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable P19_1
if !_rc{
     tostring P19_1, replace
}

label define P19_1 .a"." 1 "Could not finish the task" 2 "Could finish task, but needed to use hands" 3 "Could finish task, without help of hands" 6 "DID NOT TRY" 



capture confirm numeric variable P20
if !_rc{
     tostring P20, replace
}

label define P20 .a"." 0 "Bed-bound / Confined to bed" 1 "Chair-bound / Confined to chair (Limited mobility, can transfer from chair to bed)" 2 "House-bound (Limited mobility, stays at home)" 3 "Limited mobility outside the home" 4 "Complete mobility, inside and outside the home" 9 "Does not know"



capture confirm numeric variable P21_1
if !_rc{
     tostring P21_1, replace
}

label define P21_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"



capture confirm numeric variable P21_2
if !_rc{
     tostring P21_2, replace
}

label define P21_2 .a"." 1 "Excellent" 2 "Very good" 3 "Good" 4 "Fair" 5 "Poor" 6 "Blind" 8 "Does not respond"9 "Does not know"



capture confirm numeric variable P22_1
if !_rc{
     tostring P22_1, replace
}

label define P22_1 .a"." 0 "No" 1 "Yes" 8 "Does not respond"



capture confirm numeric variable P22_2
if !_rc{
     tostring P22_2, replace
}

label define P22_2 .a"." 1 "Excellent" 2 "Very good" 3 "Good" 4 "Fair" 5 "Poor" 6 "Deaf" 8 "Does not respond"9 "Does not know"


*reorder

*order pid pid2 globalrecordid p_deviceid1 p_interid p_clustid p_houseid p_particid p_country p_houseid2 p_conglid2 p_particid2 p2_1 p2_2_1 p2_2_2 p3_d_c p3_p p4_d_c p4_p p5_1_d_c p5_1_p p5_2_d_c p5_2_p p6 p7_1 p7_2 p7_3 p8_1 p8_2 p8_3 p9_1 p9_2 p10_1_1_1 p10_1_1_2 p10_1_2_1 p10_1_2_2 p10_2_1_1 p10_2_1_2 p10_2_2_1 p10_2_2_2 p11_1 p11_2_1 p11_2_2 p11_3_1_1 p11_3_1_2 p11_3_2_1 p11_3_2_2 p12_1 p12_2_1 p12_2_2 p12_3_1 p12_3_2 p13_1 p13_2 p13_3 p13_4 p13_5 p2_3 p2_3_1 p2_3_2 p14_1 p14_2 p14_3_1 p14_3_2 p14_4 p14_5 p15_a p15_1_1 p15_1_2 p15_1_3 p15_2_1 p15_2_2 p15_2_3 p16_1 p16_2 p17_1 p17_2 p17_3 p18_d_c p18_p p19_1 p19_2 p20 p21_1 p21_2 p22_1 p22_2 p_deviceid2 p_deviceid2

sort p_clustid p_houseid

*convert missing comment legal and text values to string

capture confirm numeric variable p_deviceid1
if !_rc{
     tostring p_deviceid1, replace
}

capture confirm numeric variable p_particid2
if !_rc{
     tostring p_particid2, replace
}

capture confirm numeric variable p_deviceid2
if !_rc{
     tostring p_deviceid2, replace
}

*add variable labels

label variable p_deviceid1 "Device ID:"

label variable p_interid "Interviewer number:"

label variable p_clustid "Community number:"

label variable p_houseid "House number:"

label variable p_particid "Participant number:"

label variable p_country "Country:"

label variable p_houseid2 "HOUSE NUMBER"

label variable p_conglid2 "COMMUNITY NUMBER"

label variable p_particid2 "PARTICIPANT NUMBER"

label variable p2_1 "2.1 Could you measure the blood pressure?"

label variable p2_2_1 "SYSTOLIC BLOOD PRESSURE (Verify, if it is: <80 or >200)"

label variable p2_2_2 "DIASTOLIC BLOOD PRESSURE (Verify, if it is: <50 or >200)"

label variable p3_d_c "SKULL CIRCUMFERENCE (CENTIMETERS) (Verify, if it is: >49 or <63)"

label variable p3_p "SKULL CIRCUMFERENCE (INCHES) (Verify, if it is: >19 or <25)"

label variable p4_d_c "WAIST CIRCUMFERENCE (CENTIMETERS) (Verify, if it is: >56 or <129)"

label variable p4_p "WAIST CIRCUMFERENCE (INCHES) (Verify, if it is: >21 or <50)"

label variable p5_1_d_c "KNEE HEIGHT (CENTIMETERS) (Verify, if it is: >49 or <59)"

label variable p5_1_p "KNEE HEIGHT (INCHES) (Verify, if it is: >19 or <23)"

label variable p5_2_d_c "HEIGHT (CENTIMETERS) (Verify, if it is: >131 or <189)"

label variable p5_2_p "HEIGHT (INCHES) (Verify, if it is: >51 or <74)"

label variable p6 "Please follow my finger, but keep your head still"

label variable p7_1 "7.1 GLABELAR TAP Lightly tap the participant's forehead just above the bridge of their nose. Continue to tap until they stop blinking. Count the number of taps required."

label variable p7_2 "7.2 POUT REFLEX Lightly tap the participant's lips with the tip of your index finger"

label variable p7_3 "7.3 PALMO-MENTAL REFLEX Scratch the little finger side of each of the participant's palms in turn with a key, while observing their chin and mouth for signs of twitching."

label variable p8_1 "8.1 Head"

label variable p8_2 "8.2 Right Upper Limb"

label variable p8_3 "8.3 Left Upper Limb"

label variable p9_1 "9.1 DRIFT PRESENT"

label variable p9_2 "9.2 Side with drift"

label variable p10_1_1_1 "10.1.1.1 Upper Limbs - Left"

label variable p10_1_1_2 "10.1.1.2 Upper Limbs - Right"

label variable p10_1_2_1 "10.1.2.1. Lower Limbs - Left"

label variable p10_1_2_2 "10.1.2.2. Lower Limbs - Right"

label variable p10_2_1_1 "10.2.1.1 Upper Limbs - Left"

label variable p10_2_1_2 "10.2.1.2. Upper Limbs - Right"

label variable p10_2_2_1 "10.2.2.1 Lower Limbs - Left"

label variable p10_2_2_2 "10.2.2.2 Lower Limbs - Right"

label variable p11_1 "Which hand do you use for writing? (You may need to devise another culturally appropriate question to test dominance if participant is illiterate)"

label variable p11_2_1 "11.2.1 Right Hand Fingers"

label variable p11_2_2 "11.2.2 Left Hand Fingers"

label variable p11_3_1_1 "11.3.1.1 Alternating Movements Speed – Right"

label variable p11_3_1_2 "11.3.1.2 Alternating Movements Speed – Left"

label variable p11_3_2_1 "11.3.2.1 Alternating Movements – Right"

label variable p11_3_2_2 "11.3.2.2 Alternating Movements – Left"

label variable p12_1 "12.1 WHICH HAND USED FOR PALM-FIST-SIDE"

label variable p12_2_1 "12.2.1 Fist-Palm-Side – Learning"

label variable p12_2_2 "12.2.2 Fist-Palm-Side – Sequence"

label variable p12_3_1 "12.3.1 Reciprocal Coordination – Learning"

label variable p12_3_2 "12.3.2 Reciprocal Coordination – Sequences"

label variable p13_1 "13.1 Right biceps jerk (jump)"

label variable p13_2 "13.2 Left biceps jerk (jump)"

label variable p13_3 "13.3 Jaw jerk (jump)"

label variable p13_4 "13.4 Right knee jerk (jump)"

label variable p13_5 "13.5 Left knee jerk (jump)"

label variable p2_3 "2.3 Could you measure the blood pressure?"

label variable p2_3_1 "SYSTOLIC BLOOD PRESSURE (Verify, if it is: >80 or <200)"

label variable p2_3_2 "DIASTOLIC BLOOD PRESSURE (Verify, if it is: >50 or <200)"

label variable p14_1 "14.1 Number of steps taken (you need to count them): ## 66   Could not do due to disability 77 Could not do for another reason"

label variable p14_2 "14.2 Time taken to do this (you will need to keep time using an appropriate watch): ## 66 Could not do due to disability 77 Could not do for another reason"

label variable p14_3_1 "14.3.1 Arm swing, right"

label variable p14_3_2 "14.3.2 Arm swing, left"

label variable p14_4 "14.4 Ataxia (instability)"

label variable p14_5 "14.5 Bradykinesia (slowing movement)"

label variable p15_a "15.A Could you do the hand grip strength test?"

label variable p15_1_1 "15.1.1 1st Test"

label variable p15_1_2 "15.1.2 2nd Test"

label variable p15_1_3 "15.1.3 3rd Test"

label variable p15_2_1 "15.2.1 1st Test"

label variable p15_2_2 "15.2.2 2nd Test"

label variable p15_2_3 "15.2.3 3rd Test"

label variable p16_1 "16.1 Do you have dentures?"

label variable p16_2 "16.2 OBSERVATION: Were they wearing dentures at the time of the exam?"

label variable p17_1 "17.1 Upper Jaw"

label variable p17_2 "17.2 Lower Jaw"

label variable p17_3 "17.3 Do you have trouble chewing?"

label variable p18_d_c "WEIGHT (KILOGRAMS)"

label variable p18_p "WEIGHT (POUNDS)"

label variable p19_1 "19.1 OBSERVATION"

label variable p19_2 "19.2 OBSERVATION Number of repetitions completed in 30 seconds DID NOT TRY............66"

label variable p20 "20. INTERVIEWER: Select the number that best describes the participant’s mobility, given all you have been able to observe during the interview"

label variable p21_1 "21.1 Do you usually use glasses?"

label variable p21_2 "21.2 How is your vision (with glasses, if you usually use them)?"

label variable p22_1 "22.1 Do you usually use hearing aids?"

label variable p22_2 "22.2 How is your hearing range (with hearing aids, if you usually use them)?"

label variable p_deviceid2 "Device ID:"

label variable p_deviceid2 "Device ID:"

save Phys.dta, replace
