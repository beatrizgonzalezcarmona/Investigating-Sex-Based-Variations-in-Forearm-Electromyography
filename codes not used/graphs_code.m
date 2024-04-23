%% READ ME
% this code compares the results of each patient between sexes. 
% the data comparison is shown first in a spider graph, and then in an excel sheet
%for the spider plot, an already defined function is used.


%% SPIDER PLOTS

% finger point 
close all

data_f = xlsread('f_data.xlsx');

fp_ed_f = [a01_fp_mean_ed a02_fp_mean_ed a03_fp_mean_ed a04_fp_mean_ed a05_fp_mean_ed a06_fp_mean_ed a07_fp_mean_ed a10_fp_mean_ed];
fp_ed_f_mean = mean(fp_ed_f);
fp_ecu_f = [a01_fp_mean_ecu a02_fp_mean_ecu a03_fp_mean_ecu a04_fp_mean_ecu a05_fp_mean_ecu a06_fp_mean_ecu a07_fp_mean_ecu a08_fp_mean_ecu a09_fp_mean_ecu a10_fp_mean_ecu];
fp_ecu_f_mean = mean(fp_ecu_f);
fp_ecr_f = [a01_fp_mean_ecr a02_fp_mean_ecr a03_fp_mean_ecr a04_fp_mean_ecr a05_fp_mean_ecr a06_fp_mean_ecr a07_fp_mean_ecr a08_fp_mean_ecr a09_fp_mean_ecr a10_fp_mean_ecr];
fp_ecr_f_mean = mean(fp_ecr_f);
fp_fcr_f = [a01_fp_mean_fcr a02_fp_mean_fcr a03_fp_mean_fcr a04_fp_mean_fcr a05_fp_mean_fcr a06_fp_mean_fcr a07_fp_mean_fcr a08_fp_mean_fcr a09_fp_mean_fcr a10_fp_mean_fcr];
fp_fcr_f_mean = mean(fp_fcr_f);

fp_muscle_f = [fp_ed_f_mean; fp_ecu_f_mean; fp_ecr_f_mean; fp_fcr_f_mean];

fp_ed_m = [b01_fp_mean_ed b02_fp_mean_ed b03_fp_mean_ed b04_fp_mean_ed b05_fp_mean_ed b06_fp_mean_ed b07_fp_mean_ed b08_fp_mean_ed b09_fp_mean_ed b10_fp_mean_ed];
fp_ed_m_mean = mean(fp_ed_m);
fp_ecu_m = [b01_fp_mean_ecu b02_fp_mean_ecu b03_fp_mean_ecu b04_fp_mean_ecu b05_fp_mean_ecu b06_fp_mean_ecu b07_fp_mean_ecu b08_fp_mean_ecu b09_fp_mean_ecu b10_fp_mean_ecu];
fp_ecu_m_mean = mean(fp_ecu_m);
fp_ecr_m = [b01_fp_mean_ecr b02_fp_mean_ecr b03_fp_mean_ecr b04_fp_mean_ecr b05_fp_mean_ecr b06_fp_mean_ecr b07_fp_mean_ecr b08_fp_mean_ecr b09_fp_mean_ecr b10_fp_mean_ecr];
fp_ecr_m_mean = mean(fp_ecr_m);
fp_fcr_m = [b01_fp_mean_fcr b02_fp_mean_fcr b03_fp_mean_fcr b04_fp_mean_fcr b05_fp_mean_fcr b06_fp_mean_fcr b07_fp_mean_fcr b08_fp_mean_fcr b09_fp_mean_fcr b10_fp_mean_fcr];
fp_fcr_m_mean = mean(fp_fcr_m);

fp_muscle_m = [fp_ed_m_mean; fp_ecu_m_mean; fp_ecr_m_mean; fp_fcr_m_mean];
fp = [fp_muscle_f fp_muscle_m]
range = 1
fp_plot = spider(fp, 'Finger Point Position Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});

figure (1)
fp_plot


% neutral position 
ne_ed_f = [a01_ne_mean_ed a02_ne_mean_ed a03_ne_mean_ed a04_ne_mean_ed a05_ne_mean_ed a06_ne_mean_ed a07_ne_mean_ed a10_ne_mean_ed];
ne_ed_f_mean = mean(ne_ed_f);
ne_ecu_f = [a01_ne_mean_ecu a02_ne_mean_ecu a03_ne_mean_ecu a04_ne_mean_ecu a05_ne_mean_ecu a06_ne_mean_ecu a07_ne_mean_ecu a08_ne_mean_ecu a09_ne_mean_ecu a10_ne_mean_ecu];
ne_ecu_f_mean = mean(ne_ecu_f);
ne_ecr_f = [a01_ne_mean_ecr a02_ne_mean_ecr a03_ne_mean_ecr a04_ne_mean_ecr a05_ne_mean_ecr a06_ne_mean_ecr a07_ne_mean_ecr a08_ne_mean_ecr a09_ne_mean_ecr a10_ne_mean_ecr];
ne_ecr_f_mean = mean(ne_ecr_f);
ne_fcr_f = [a01_ne_mean_fcr a02_ne_mean_fcr a03_ne_mean_fcr a04_ne_mean_fcr a05_ne_mean_fcr a06_ne_mean_fcr a07_ne_mean_fcr a08_ne_mean_fcr a09_ne_mean_fcr a10_ne_mean_fcr];
ne_fcr_f_mean = mean(ne_fcr_f);

ne_muscle_f = [ne_ed_f_mean; ne_ecu_f_mean; ne_ecr_f_mean; ne_fcr_f_mean];

ne_ed_m = [b01_ne_mean_ed b02_ne_mean_ed b03_ne_mean_ed b04_ne_mean_ed b05_ne_mean_ed b06_ne_mean_ed b07_ne_mean_ed b08_ne_mean_ed b09_ne_mean_ed b10_ne_mean_ed];
ne_ed_m_mean = mean(ne_ed_m);
ne_ecu_m = [b01_ne_mean_ecu b02_ne_mean_ecu b03_ne_mean_ecu b04_ne_mean_ecu b05_ne_mean_ecu b06_ne_mean_ecu b07_ne_mean_ecu b08_ne_mean_ecu b09_ne_mean_ecu b10_ne_mean_ecu];
ne_ecu_m_mean = mean(ne_ecu_m);
ne_ecr_m = [b01_ne_mean_ecr b02_ne_mean_ecr b03_ne_mean_ecr b04_ne_mean_ecr b05_ne_mean_ecr b06_ne_mean_ecr b07_ne_mean_ecr b08_ne_mean_ecr b09_ne_mean_ecr b10_ne_mean_ecr];
ne_ecr_m_mean = mean(ne_ecr_m);
ne_fcr_m = [b01_ne_mean_fcr b02_ne_mean_fcr b03_ne_mean_fcr b04_ne_mean_fcr b05_ne_mean_fcr b06_ne_mean_fcr b07_ne_mean_fcr b08_ne_mean_fcr b09_ne_mean_fcr b10_ne_mean_fcr];
ne_fcr_m_mean = mean(ne_fcr_m);

ne_muscle_m = [ne_ed_m_mean; ne_ecu_m_mean; ne_ecr_m_mean; ne_fcr_m_mean];
ne = [ne_muscle_f ne_muscle_m]
range = 1
ne_plot = spider(ne, 'Neutral Position Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});


figure (2)
ne_plot


% pinch position 
pi_ed_f = [a01_pi_mean_ed a02_pi_mean_ed a03_pi_mean_ed a04_pi_mean_ed a05_pi_mean_ed a06_pi_mean_ed a07_pi_mean_ed a10_pi_mean_ed];
pi_ed_f_mean = mean(pi_ed_f);
pi_ecu_f = [a01_pi_mean_ecu a02_pi_mean_ecu a03_pi_mean_ecu a04_pi_mean_ecu a05_pi_mean_ecu a06_pi_mean_ecu a07_pi_mean_ecu a08_pi_mean_ecu a09_pi_mean_ecu a10_pi_mean_ecu];
pi_ecu_f_mean = mean(pi_ecu_f);
pi_ecr_f = [a01_pi_mean_ecr a02_pi_mean_ecr a03_pi_mean_ecr a04_pi_mean_ecr a05_pi_mean_ecr a06_pi_mean_ecr a07_pi_mean_ecr a08_pi_mean_ecr a09_pi_mean_ecr a10_pi_mean_ecr];
pi_ecr_f_mean = mean(pi_ecr_f);
pi_fcr_f = [a01_pi_mean_fcr a02_pi_mean_fcr a03_pi_mean_fcr a04_pi_mean_fcr a05_pi_mean_fcr a06_pi_mean_fcr a07_pi_mean_fcr a08_pi_mean_fcr a09_pi_mean_fcr a10_pi_mean_fcr];
pi_fcr_f_mean = mean(pi_fcr_f);

pi_muscle_f = [pi_ed_f_mean; pi_ecu_f_mean; pi_ecr_f_mean; pi_fcr_f_mean];

pi_ed_m = [b01_pi_mean_ed b02_pi_mean_ed b03_pi_mean_ed b04_pi_mean_ed b05_pi_mean_ed b06_pi_mean_ed b07_pi_mean_ed b08_pi_mean_ed b09_pi_mean_ed b10_pi_mean_ed];
pi_ed_m_mean = mean(pi_ed_m);
pi_ecu_m = [b01_pi_mean_ecu b02_pi_mean_ecu b03_pi_mean_ecu b04_pi_mean_ecu b05_pi_mean_ecu b06_pi_mean_ecu b07_pi_mean_ecu b08_pi_mean_ecu b09_pi_mean_ecu b10_pi_mean_ecu];
pi_ecu_m_mean = mean(pi_ecu_m);
pi_ecr_m = [b01_pi_mean_ecr b02_pi_mean_ecr b03_pi_mean_ecr b04_pi_mean_ecr b05_pi_mean_ecr b06_pi_mean_ecr b07_pi_mean_ecr b08_pi_mean_ecr b09_pi_mean_ecr b10_pi_mean_ecr];
pi_ecr_m_mean = mean(pi_ecr_m);
pi_fcr_m = [b01_pi_mean_fcr b02_pi_mean_fcr b03_pi_mean_fcr b04_pi_mean_fcr b05_pi_mean_fcr b06_pi_mean_fcr b07_pi_mean_fcr b08_pi_mean_fcr b09_pi_mean_fcr b10_pi_mean_fcr];
pi_fcr_m_mean = mean(pi_fcr_m);

pi_muscle_m = [pi_ed_m_mean; pi_ecu_m_mean; pi_ecr_m_mean; pi_fcr_m_mean];
pi = [pi_muscle_f pi_muscle_m]
range = 1
pi_plot = spider(pi, 'Pinch Position Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});


figure (3)
pi_plot

%% pour water position 1

pw_ed_f = [a01_pw_mean_ed_1 a02_pw_mean_ed_1 a03_pw_mean_ed_1 a04_pw_mean_ed_1 a05_pw_mean_ed_1 a06_pw_mean_ed_1 a07_pw_mean_ed_1 a10_pw_mean_ed_1];
pw_ed_f_mean = mean(pw_ed_f);
pw_ecu_f = [a01_pw_mean_ecu_1 a02_pw_mean_ecu_1 a03_pw_mean_ecu_1 a04_pw_mean_ecu_1 a05_pw_mean_ecu_1 a06_pw_mean_ecu_1 a07_pw_mean_ecu_1 a08_pw_mean_ecu_1 a09_pw_mean_ecu_1 a10_pw_mean_ecu_1];
pw_ecu_f_mean = mean(pw_ecu_f);
pw_ecr_f = [a01_pw_mean_ecr_1 a02_pw_mean_ecr_1 a03_pw_mean_ecr_1 a04_pw_mean_ecr_1 a05_pw_mean_ecr_1 a06_pw_mean_ecr_1 a07_pw_mean_ecr_1 a08_pw_mean_ecr_1 a09_pw_mean_ecr_1 a10_pw_mean_ecr_1];
pw_ecr_f_mean = mean(pw_ecr_f);
pw_fcr_f = [a01_pw_mean_fcr_1 a02_pw_mean_fcr_1 a03_pw_mean_fcr_1 a04_pw_mean_fcr_1 a05_pw_mean_fcr_1 a06_pw_mean_fcr_1 a07_pw_mean_fcr_1 a08_pw_mean_fcr_1 a09_pw_mean_fcr_1 a10_pw_mean_fcr_1];
pw_fcr_f_mean = mean(pw_fcr_f);

pw_muscle_f = [pw_ed_f_mean; pw_ecu_f_mean; pw_ecr_f_mean; pw_fcr_f_mean];

pw_ed_m = [b01_pw_mean_ed_1 b02_pw_mean_ed_1 b03_pw_mean_ed_1 b04_pw_mean_ed_1 b05_pw_mean_ed_1 b06_pw_mean_ed_1 b07_pw_mean_ed_1 b08_pw_mean_ed_1 b09_pw_mean_ed_1 b10_pw_mean_ed_1];
pw_ed_m_mean = mean(pw_ed_m);
pw_ecu_m = [b01_pw_mean_ecu_1 b02_pw_mean_ecu_1 b03_pw_mean_ecu_1 b04_pw_mean_ecu_1 b05_pw_mean_ecu_1 b06_pw_mean_ecu_1 b07_pw_mean_ecu_1 b08_pw_mean_ecu_1 b09_pw_mean_ecu_1 b10_pw_mean_ecu_1];
pw_ecu_m_mean = mean(pw_ecu_m);
pw_ecr_m = [b01_pw_mean_ecr_1 b02_pw_mean_ecr_1 b03_pw_mean_ecr_1 b04_pw_mean_ecr_1 b05_pw_mean_ecr_1 b06_pw_mean_ecr_1 b07_pw_mean_ecr_1 b08_pw_mean_ecr_1 b09_pw_mean_ecr_1 b10_pw_mean_ecr_1];
pw_ecr_m_mean = mean(pw_ecr_m);
pw_fcr_m = [b01_pw_mean_fcr_1 b02_pw_mean_fcr_1 b03_pw_mean_fcr_1 b04_pw_mean_fcr_1 b05_pw_mean_fcr_1 b06_pw_mean_fcr_1 b07_pw_mean_fcr_1 b08_pw_mean_fcr_1 b09_pw_mean_fcr_1 b10_pw_mean_fcr_1];
pw_fcr_m_mean = mean(pw_fcr_m);

pw_muscle_m = [pw_ed_m_mean; pw_ecu_m_mean; pw_ecr_m_mean; pw_fcr_m_mean];
pw = [pw_muscle_f pw_muscle_m]
range = 1
pw_plot = spider(pw, 'Pour Water Position 1 Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});


figure (4)
pw_plot

% pour water position 2
pw2_ed_f = [a01_pw_mean_ed_2 a02_pw_mean_ed_2 a03_pw_mean_ed_2 a04_pw_mean_ed_2 a05_pw_mean_ed_2 a06_pw_mean_ed_2 a07_pw_mean_ed_2 a10_pw_mean_ed_2];
pw2_ed_f_mean = mean(pw2_ed_f);
pw2_ecu_f = [a01_pw_mean_ecu_2 a02_pw_mean_ecu_2 a03_pw_mean_ecu_2 a04_pw_mean_ecu_2 a05_pw_mean_ecu_2 a06_pw_mean_ecu_2 a07_pw_mean_ecu_2 a08_pw_mean_ecu_2 a09_pw_mean_ecu_2 a10_pw_mean_ecu_2];
pw2_ecu_f_mean = mean(pw2_ecu_f);
pw2_ecr_f = [a01_pw_mean_ecr_2 a02_pw_mean_ecr_2 a03_pw_mean_ecr_2 a04_pw_mean_ecr_2 a05_pw_mean_ecr_2 a06_pw_mean_ecr_2 a07_pw_mean_ecr_2 a08_pw_mean_ecr_2 a09_pw_mean_ecr_2 a10_pw_mean_ecr_2];
pw2_ecr_f_mean = mean(pw2_ecr_f);
pw2_fcr_f = [a01_pw_mean_fcr_2 a02_pw_mean_fcr_2 a03_pw_mean_fcr_2 a04_pw_mean_fcr_2 a05_pw_mean_fcr_2 a06_pw_mean_fcr_2 a07_pw_mean_fcr_2 a08_pw_mean_fcr_2 a09_pw_mean_fcr_2 a10_pw_mean_fcr_2];
pw2_fcr_f_mean = mean(pw2_fcr_f);

pw2_muscle_f = [pw2_ed_f_mean; pw2_ecu_f_mean; pw2_ecr_f_mean; pw2_fcr_f_mean];

pw2_ed_m = [b01_pw_mean_ed_2 b02_pw_mean_ed_2 b03_pw_mean_ed_2 b04_pw_mean_ed_2 b05_pw_mean_ed_2 b06_pw_mean_ed_2 b07_pw_mean_ed_2 b08_pw_mean_ed_2 b09_pw_mean_ed_2 b10_pw_mean_ed_2];
pw2_ed_m_mean = mean(pw2_ed_m);
pw2_ecu_m = [b01_pw_mean_ecu_2 b02_pw_mean_ecu_2 b03_pw_mean_ecu_2 b04_pw_mean_ecu_2 b05_pw_mean_ecu_2 b06_pw_mean_ecu_2 b07_pw_mean_ecu_2 b08_pw_mean_ecu_2 b09_pw_mean_ecu_2 b10_pw_mean_ecu_2];
pw2_ecu_m_mean = mean(pw2_ecu_m);
pw2_ecr_m = [b01_pw_mean_ecr_2 b02_pw_mean_ecr_2 b03_pw_mean_ecr_2 b04_pw_mean_ecr_2 b05_pw_mean_ecr_2 b06_pw_mean_ecr_2 b07_pw_mean_ecr_2 b08_pw_mean_ecr_2 b09_pw_mean_ecr_2 b10_pw_mean_ecr_2];
pw2_ecr_m_mean = mean(pw2_ecr_m);
pw2_fcr_m = [b01_pw_mean_fcr_2 b02_pw_mean_fcr_2 b03_pw_mean_fcr_2 b04_pw_mean_fcr_2 b05_pw_mean_fcr_2 b06_pw_mean_fcr_2 b07_pw_mean_fcr_2 b08_pw_mean_fcr_2 b09_pw_mean_fcr_2 b10_pw_mean_fcr_2];
pw2_fcr_m_mean = mean(pw2_fcr_m);

pw2_muscle_m = [pw2_ed_m_mean; pw2_ecu_m_mean; pw2_ecr_m_mean; pw2_fcr_m_mean];
pw2 = [pw2_muscle_f pw2_muscle_m];
range = 1;
pw2_plot = spider(pw2, 'Pour Water Position 2 Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});


figure (5)
pw2_plot

% pour water position 3
pw3_ed_f = [a01_pw_mean_ed_3 a02_pw_mean_ed_3 a03_pw_mean_ed_3 a04_pw_mean_ed_3 a05_pw_mean_ed_3 a06_pw_mean_ed_3 a07_pw_mean_ed_3 a10_pw_mean_ed_3];
pw3_ed_f_mean = mean(pw3_ed_f);
pw3_ecu_f = [a01_pw_mean_ecu_3 a02_pw_mean_ecu_3 a03_pw_mean_ecu_3 a04_pw_mean_ecu_3 a05_pw_mean_ecu_3 a06_pw_mean_ecu_3 a07_pw_mean_ecu_3 a08_pw_mean_ecu_3 a09_pw_mean_ecu_3 a10_pw_mean_ecu_3];
pw3_ecu_f_mean = mean(pw3_ecu_f);
pw3_ecr_f = [a01_pw_mean_ecr_3 a02_pw_mean_ecr_3 a03_pw_mean_ecr_3 a04_pw_mean_ecr_3 a05_pw_mean_ecr_3 a06_pw_mean_ecr_3 a07_pw_mean_ecr_3 a08_pw_mean_ecr_3 a09_pw_mean_ecr_3 a10_pw_mean_ecr_3];
pw3_ecr_f_mean = mean(pw3_ecr_f);
pw3_fcr_f = [a01_pw_mean_fcr_3 a02_pw_mean_fcr_3 a03_pw_mean_fcr_3 a04_pw_mean_fcr_3 a05_pw_mean_fcr_3 a06_pw_mean_fcr_3 a07_pw_mean_fcr_3 a08_pw_mean_fcr_3 a09_pw_mean_fcr_3 a10_pw_mean_fcr_3];
pw3_fcr_f_mean = mean(pw3_fcr_f);

pw3_muscle_f = [pw3_ed_f_mean; pw3_ecu_f_mean; pw3_ecr_f_mean; pw3_fcr_f_mean];

pw3_ed_m = [b01_pw_mean_ed_3 b02_pw_mean_ed_3 b03_pw_mean_ed_3 b04_pw_mean_ed_3 b05_pw_mean_ed_3 b06_pw_mean_ed_3 b07_pw_mean_ed_3 b08_pw_mean_ed_3 b09_pw_mean_ed_3 b10_pw_mean_ed_3];
pw3_ed_m_mean = mean(pw3_ed_m);
pw3_ecu_m = [b01_pw_mean_ecu_3 b02_pw_mean_ecu_3 b03_pw_mean_ecu_3 b04_pw_mean_ecu_3 b05_pw_mean_ecu_3 b06_pw_mean_ecu_3 b07_pw_mean_ecu_3 b08_pw_mean_ecu_3 b09_pw_mean_ecu_3 b10_pw_mean_ecu_3];
pw3_ecu_m_mean = mean(pw3_ecu_m);
pw3_ecr_m = [b01_pw_mean_ecr_3 b02_pw_mean_ecr_3 b03_pw_mean_ecr_3 b04_pw_mean_ecr_3 b05_pw_mean_ecr_3 b06_pw_mean_ecr_3 b07_pw_mean_ecr_3 b08_pw_mean_ecr_3 b09_pw_mean_ecr_3 b10_pw_mean_ecr_3];
pw3_ecr_m_mean = mean(pw3_ecr_m);
pw3_fcr_m = [b01_pw_mean_fcr_3 b02_pw_mean_fcr_3 b03_pw_mean_fcr_3 b04_pw_mean_fcr_3 b05_pw_mean_fcr_3 b06_pw_mean_fcr_3 b07_pw_mean_fcr_3 b08_pw_mean_fcr_3 b09_pw_mean_fcr_3 b10_pw_mean_fcr_3];
pw3_fcr_m_mean = mean(pw3_fcr_m);

pw3_muscle_m = [pw3_ed_m_mean; pw3_ecu_m_mean; pw3_ecr_m_mean; pw3_fcr_m_mean];
pw3 = [pw3_muscle_f pw3_muscle_m];
range = 1;
pw3_plot = spider(pw3, 'Pour Water Position 3 Female vs Male Mean Muscle Activity (μV)',[range; range; range; range],{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});


figure (6)
pw3_plot

