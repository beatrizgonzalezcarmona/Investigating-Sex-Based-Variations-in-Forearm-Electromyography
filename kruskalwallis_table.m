%% Kruskal Wallis non-parametric test 1% significance 

% We want to see if there are any differences between the muscles while
% performing the same activity. 

% The first step is to creat a matrix with the data we want to compare. 
% Each column will represent one muscle 

%% READ DATA
clear female_ed_fp
clear female_ed_ne
clear female_ed_pi

clear female_ed_pw1
clear female_ed_pw2
clear female_ed_pw3

clear male_ecu_fp
clear male_ecu_ne 
clear male_ecu_pi

clear male_ecr_pw1
clear male_ecu_pw2
clear male_ecu_pw3

female = xlsread("female.xlsx");
male = xlsread("male.xlsx");

% common range where the data is in the table
f = 1:10;
m = 1:10;

female_ed_fp = female(f,1);
female_ecu_fp = female(f,2);
female_ecr_fp = female(f,3);
female_fcr_fp = female(f,4);

female_ed_ne = female(f,5);
female_ecu_ne = female(f,6);
female_ecr_ne = female(f,7);
female_fcr_ne = female(f,8);

female_ed_pi = female(f,9);
female_ecu_pi = female(f,10);
female_ecr_pi = female(f,11);
female_fcr_pi = female(f,12);

female_ed_pw1 = female(f,13);
female_ecu_pw1 = female(f,14);
female_ecr_pw1 = female(f,15);
female_fcr_pw1 = female(f,16);

female_ed_pw2 = female(f,17);
female_ecu_pw2 = female(f,18);
female_ecr_pw2 = female(f,19);
female_fcr_pw2 = female(f,20);

female_ed_pw3 = female(f,21);
female_ecu_pw3 = female(f,22);
female_ecr_pw3 = female(f,23);
female_fcr_pw3 = female(f,24);

male_ed_fp = male(m,1);
male_ecu_fp = male(m,2); 
male_ecr_fp = male(m,3);
male_fcr_fp = male(m,4);

male_ed_ne = male(m,5);
male_ecu_ne = male(m,6); 
male_ecr_ne = male(m,7);
male_fcr_ne = male(m,8);

male_ed_pi = male(m,9);
male_ecu_pi = male(m,10);
male_ecr_pi = male(m,11);
male_fcr_pi = male(m,12);

male_ed_pw1 = male(m,13);
male_ecu_pw1 = male(m,14);
male_ecr_pw1 = male(m,15);
male_fcr_pw1 = male(m,16);

male_ed_pw2 = male(m,17);
male_ecu_pw2 = male(m,14); 
male_ecr_pw2 = male(m,19);
male_fcr_pw2 = male(m,20);

male_ed_pw3 = male(m,21);
male_ecu_pw3 = male(m,22); 
male_ecr_pw3 = male(m,23);
male_fcr_pw3 = male(m,24);



%% FEMALE GROUP 

% finger point position 
finger_point_f = [female_ed_fp, female_ecu_fp, female_ecr_fp, female_fcr_fp];
p_fp_f = kruskalwallis(finger_point_f)

% neutral position 
neutral_f = [female_ed_ne, female_ecu_ne, female_ecr_ne, female_fcr_ne];
p_ne_f = kruskalwallis(neutral_f)

% pinch position
pinch_f = [female_ed_pi, female_ecu_pi, female_ecr_pi, female_fcr_pi];
p_pi_f = kruskalwallis(pinch_f)

% pour water position 1
pw1_f = [female_ed_pw1, female_ecu_pw1, female_ecr_pw1, female_fcr_pw1];
p_pw1_f = kruskalwallis(pw1_f)

% pour water position 2
pw2_f = [female_ed_pw2, female_ecu_pw2, female_ecr_pw2, female_fcr_pw2];
p_pw2_f = kruskalwallis(pw2_f)

% pour water position 3
pw3_f = [female_ed_pw3, female_ecu_pw3, female_ecr_pw3, female_fcr_pw3];
p_pw3_f = kruskalwallis(pw3_f)


%% MALE GROUP 

% finger point position 
finger_point_m = [male_ed_fp, male_ecu_fp, male_ecr_fp, male_fcr_fp];
p_fp_m = kruskalwallis(finger_point_m)

% neutral position 
neutral_m = [male_ed_ne, male_ecu_ne, male_ecr_ne, male_fcr_ne];
p_ne_m = kruskalwallis(neutral_m)

% pinch position
pinch_m = [male_ed_pi, male_ecu_pi, male_ecr_pi, male_fcr_pi];
p_pi_m = kruskalwallis(pinch_m)

% pour water position 1
pw1_m = [male_ed_pw1, male_ecu_pw1, male_ecr_pw1, male_fcr_pw1];
p_pw1_m = kruskalwallis(pw1_m)

% pour water position 2
pw2_m = [male_ed_pw2, male_ecu_pw2, male_ecr_pw2, male_fcr_pw2];
p_pw2_m = kruskalwallis(pw2_m)

% pour water position 3
pw3_m = [male_ed_pw3, male_ecu_pw3, male_ecr_pw3, male_fcr_pw3];
p_pw3_m = kruskalwallis(pw3_m)


%% table to collect p_values
clear table 
Sex = ["female";"male"];
FingerPoint = [p_fp_f; p_fp_m];
Neutral = [p_ne_f; p_ne_m];
Pinch = [p_pi_f; p_pi_m];
PourWater1 = [p_pw1_f; p_pw2_m];
PourWater2 = [p_pw2_f; p_pw2_m];
PourWater3 = [p_pw3_f; p_pw3_m];

p_values_table = table(Sex, FingerPoint, Neutral, Pinch, PourWater1, PourWater2, PourWater3)
filename_p = 'Kurskal_Wallis.xlsx';
writetable(p_values_table,filename_p)
