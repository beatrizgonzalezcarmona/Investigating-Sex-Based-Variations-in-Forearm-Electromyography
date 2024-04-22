female_data = xlsread('female.xlsx');
male_data = xlsread('male.xlsx');
f = 10:19;
m = 1:10;

%% Mann Whitney U test
% p value is the probability that the mean measure will be greater, than or
% equal to the observed results.

% null hypothesis assumes that there is no difference among groups. If
% thought to be true, p-value represents the probability of obtaining the observed
% results

[fp_hed,fp_ped, fp_hecu,fp_pecu, fp_hecr, fp_pecr, fp_hfcr,fp_pfcr] = mannwhitney(female_data,male_data,1); % finger point

[ne_hed,ne_ped, ne_hecu, ne_pecu, ne_hecr, ne_pecr, ne_hfcr,ne_pfcr] = mannwhitney(female_data,male_data,1); % neutral

[pi_hed,pi_ped, pi_hecu,pi_pecu, pi_hecr, pi_pecr, pi_hfcr,pi_pfcr] = mannwhitney(female_data,male_data,2); % pinch

[pw1_hed,pw1_ped, pw1_hecu,pw1_pecu, pw1_hecr, pw1_pecr, pw1_hfcr,pw1_pfcr] = mannwhitney(female_data,male_data,2); % pour water position 1

[pw2_hed,pw2_ped, pw2_hecu,pw2_pecu, pw2_hecr, pw2_pecr, pw2_hfcr,pw2_pfcr] = mannwhitney(female_data,male_data,2); % pour water position 2

[pw3_hed,pw3_ped, pw3_hecu,pw3_pecu, pw3_hecr, pw3_pecr, pw3_hfcr,pw3_pfcr] = mannwhitney(female_data,male_data,2); % pour water position 3


% collecting the data 
clear table

tasks = ["muscle"; "hypothesis result"; "p value"];
finger_point = ["ed" "ecu" "ecr" "fcr"; fp_hed fp_hecu fp_hecr fp_hfcr; fp_ped fp_pecu fp_pecr fp_pfcr];
pinch = ["ed" "ecu" "ecr" "fcr"; pi_hed pi_hecu pi_hecr pi_hfcr; pi_ped pi_pecu pi_pecr pi_pfcr];
neutral = ["ed" "ecu" "ecr" "fcr"; ne_hed ne_hecu ne_hecr ne_hfcr; ne_ped ne_pecu ne_pecr ne_pfcr];
pour_water_p1 = ["ed" "ecu" "ecr" "fcr"; pw1_hed pw1_hecu pw1_hecr pw1_hfcr; pw1_ped pw1_pecu pw1_pecr pw1_pfcr];
pour_water_p2 = ["ed" "ecu" "ecr" "fcr"; pw2_hed pw2_hecu pw2_hecr pw2_hfcr; pw2_ped pw2_pecu pw2_pecr pw2_pfcr];
pour_water_p3 = ["ed" "ecu" "ecr" "fcr"; pw3_hed pw3_hecu pw3_hecr pw3_hfcr; pw3_ped pw3_pecu pw3_pecr pw3_pfcr];

statisticdata = table(tasks, finger_point,pinch,neutral,pour_water_p1,pour_water_p2, pour_water_p3)

filename_m = 'results.xlsx';
writetable(statisticdata,filename_m)









