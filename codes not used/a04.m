%% EXCEL FILE: each position has an excel with eight columns
%               - the first one refers to the time
%               - the second column, to the muscle amplitude


%% Data = xlsread('file') reads the excel file referring to each position
%               - for each position, there will be a different set of 'data'
%               - time is constant for all repetitions in each set of positions


%% NAME FOR CONSTANTS 
% a to the female patient & b to the male patient
% p is the number of patient (2digits)
% r refers to the repetition
% for normalised add an n and for rms an s at the end 

% ED - extensor digitorium  2nd column of each position set
% ECU - extensor carpis ulnaris 4th column of each position set
% ECR - extensor carpis radialis 6th column of each position set
% FCR - flexor carpi radialis 8th column of each position set

% fp - finger point => ap_rfp_muscle
% ne - neutral => ap_rne_muscle
% pi - pinch => ap_rpi_muscle
% pw - pour water => ap_rpw_muscle


%% OTHER NOTES
% Each position first presents the data file
% The second line is the time
% Then, each muscle raw signal is acquired, then normalised and then rms
% The last step is to average all of the rms signals of each muscle for all the repetitions


%% Window length for the mrs
windowlen = 250;
max_force_a04 = 31.6

%% DATA READ FOR INDIVIDUAL a04

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  a04mvc_ed = mvc('a04_MVC_1_-_ED_-_bea_Rep_1.88.xlsx'); 

  a04mvc_ecu = mvc('a04_MVC_-_ECU_-_bea_Rep_1.89.xlsx');

  a04mvc_ecr = mvc('a04_MVC_-_ECR_-_bea_Rep_1.90.xlsx');

  a04mvc_fcr = mvc('a04_MVC_-_FCR_-_bea_Rep_1.91.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  a041fp = xlsread('a04_finger_point__Rep_1.95.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  a04_1fp_ed =   a041fp(4256:(end-4256),2);
  a04_1fp_edn =   a04_1fp_ed/a04mvc_ed; 
  a04_1fp_eds = sqrt(movmean(a04_1fp_edn.^2, windowlen)); 

  a04_1fp_ecu =   a041fp(4256:(end-4256),4);
  a04_1fp_ecun =   a04_1fp_ecu/a04mvc_ecu; 
  a04_1fp_ecus = sqrt(movmean(a04_1fp_ecun.^2, windowlen)); 

  a04_1fp_ecr =   a041fp(4256:(end-4256),6);
  a04_1fp_ecrn =   a04_1fp_ecr/a04mvc_ecr;
  a04_1fp_ecrs = sqrt(movmean(a04_1fp_ecrn.^2, windowlen)); 

  a04_1fp_fcr =   a041fp(4256:(end-4256),8);
  a04_1fp_fcrn =   a04_1fp_fcr/a04mvc_fcr;
  a04_1fp_fcrs = sqrt(movmean(a04_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a042fp = xlsread('a04_finger_point__Rep_2.96.xlsx');


  a04_2fp_ed =   a042fp(4256:(end-4256),2);
  a04_2fp_edn =   a04_2fp_ed/a04mvc_ed;
  a04_2fp_eds = sqrt(movmean(a04_2fp_edn.^2, windowlen)); 

  a04_2fp_ecu =   a042fp(4256:(end-4256),4);
  a04_2fp_ecun =   a04_2fp_ecu/a04mvc_ecu;
  a04_2fp_ecus = sqrt(movmean(a04_2fp_ecun.^2, windowlen));

  a04_2fp_ecr =   a042fp(4256:(end-4256),6);
  a04_2fp_ecrn =   a04_2fp_ecr/a04mvc_ecr;
  a04_2fp_ecrs = sqrt(movmean(a04_2fp_ecrn.^2, windowlen));

  a04_2fp_fcr =   a042fp(4256:(end-4256),8);
  a04_2fp_fcrn =   a04_2fp_fcr/a04mvc_fcr;
  a04_2fp_fcrs = sqrt(movmean(a04_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a043fp = xlsread('a04_finger_point__Rep_3.97.xlsx');


  a04_3fp_ed =   a043fp(4256:(end-4256),2);
  a04_3fp_edn =   a04_3fp_ed/a04mvc_ed;
  a04_3fp_eds = sqrt(movmean(a04_3fp_edn.^2, windowlen));

  a04_3fp_ecu =   a043fp(4256:(end-4256),4);
  a04_3fp_ecun =   a04_3fp_ecu/a04mvc_ecu;
  a04_3fp_ecus = sqrt(movmean(a04_3fp_ecun.^2, windowlen));

  a04_3fp_ecr =   a043fp(4256:(end-4256),6);
  a04_3fp_ecrn =   a04_3fp_ecr/a04mvc_ecr;
  a04_3fp_ecrs = sqrt(movmean(a04_3fp_ecrn.^2, windowlen));

  a04_3fp_fcr =   a043fp(4256:(end-4256),8);
  a04_3fp_fcrn =   a04_3fp_fcr/a04mvc_fcr;
  a04_3fp_fcrs = sqrt(movmean(a04_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  a04_fp_ed = (a04_1fp_eds +   a04_2fp_eds +   a04_3fp_eds)/3;
 a04_fp_mean_ed = mean( a04_fp_ed)

figure(1);
subplot(3,1,1);
plot(a04_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(a04_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(a04_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (a04_fp_ed);
title('Finger point Extensor Digitorium Subject a04');
 
ylabel('amplitude (mV)');

  a04_fp_ecu = (a04_1fp_ecus +   a04_2fp_ecus +   a04_3fp_ecus)/3;
 a04_fp_mean_ecu = mean( a04_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a04_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a04_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a04_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a04_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject a04');
 
ylabel('amplitude (mV)');

  a04_fp_ecr = (a04_1fp_ecrs +   a04_2fp_ecrs +   a04_3fp_ecrs)/3;
 a04_fp_mean_ecr = mean( a04_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a04_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a04_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a04_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a04_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


  a04_fp_fcr = (a04_1fp_fcrs +   a04_2fp_fcrs +   a04_3fp_fcrs)/3;
 a04_fp_mean_fcr = mean( a04_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a04_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a04_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a04_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a04_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a041ne = xlsread('a04_neutral_Rep_1.98.xlsx');


  a04_1ne_ed =   a041ne(4056:(end-4056),2);
  a04_1ne_edn =   a04_1ne_ed/a04mvc_ed; 
  a04_1ne_eds = sqrt(movmean(a04_1ne_edn.^2, windowlen)); 

  a04_1ne_ecu =   a041ne(4056:(end-4056),4);
  a04_1ne_ecun =   a04_1ne_ecu/a04mvc_ecu; 
  a04_1ne_ecus = sqrt(movmean(a04_1ne_ecun.^2, windowlen)); 

  a04_1ne_ecr =   a041ne(4056:(end-4056),6);
  a04_1ne_ecrn =   a04_1ne_ecr/a04mvc_ecr;
  a04_1ne_ecrs = sqrt(movmean(a04_1ne_ecrn.^2, windowlen)); 

  a04_1ne_fcr =   a041ne(4056:(end-4056),8);
  a04_1ne_fcrn =   a04_1ne_fcr/a04mvc_fcr;
  a04_1ne_fcrs = sqrt(movmean(a04_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a042ne = xlsread('a04_neutral_Rep_4.101.xlsx');


  a04_2ne_ed =   a042ne(4056:(end-4056),2);
  a04_2ne_edn =   a04_2ne_ed/a04mvc_ed;
  a04_2ne_eds = sqrt(movmean(a04_2ne_edn.^2, windowlen)); 

  a04_2ne_ecu =   a042ne(4056:(end-4056),4);
  a04_2ne_ecun =   a04_2ne_ecu/a04mvc_ecu;
  a04_2ne_ecus = sqrt(movmean(a04_2ne_ecun.^2, windowlen));

  a04_2ne_ecr =   a042ne(4056:(end-4056),6);
  a04_2ne_ecrn =   a04_2ne_ecr/a04mvc_ecr;
  a04_2ne_ecrs = sqrt(movmean(a04_2ne_ecrn.^2, windowlen));

  a04_2ne_fcr =   a042ne(4056:(end-4056),8);
  a04_2ne_fcrn =   a04_2ne_fcr/a04mvc_fcr;
  a04_2ne_fcrs = sqrt(movmean(a04_2ne_fcrn.^2, windowlen));




% averaged signal for each muscle for neutral position 

  a04_ne_ed = (a04_1ne_eds +  a04_2ne_eds)/2;
 a04_ne_mean_ed = mean( a04_ne_ed)

figure(9);
subplot(2,1,1);
plot(a04_1ne_eds);
title('Neutral position ED 1');
subplot(2,1,2);
plot(a04_2ne_eds);
title('Neutral position ED 2');


figure(10);
plot(a04_ne_ed);
title('Neutral position Extensor Digitorium Subject a04');
 
ylabel('amplitude (mV)');

  a04_ne_ecu = (a04_1ne_ecus +   a04_2ne_ecus)/2;
 a04_ne_mean_ecu = mean( a04_ne_ecu)

figure(11);
subplot(2,1,1);
plot(a04_1ne_ecus);
title('Neutral position ECU 1');
subplot(2,1,2);
plot(a04_2ne_ecus);
title('Neutral position ECU 2');


figure(12);
plot(a04_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject a04');
 
ylabel('amplitude (mV)');

  a04_ne_ecr = (a04_1ne_ecrs +   a04_2ne_ecrs)/2;
 a04_ne_mean_ecr = mean( a04_ne_ecr)

figure(13);
subplot(2,1,1);
plot(a04_1ne_ecrs);
title('Neutral position ECR 1');
subplot(2,1,2);
plot(a04_2ne_ecrs);
title('Neutral position ECR 2');

figure(14);
plot(a04_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


  a04_ne_fcr = (a04_1ne_fcrs +   a04_2ne_fcrs)/2;
 a04_ne_mean_fcr = mean( a04_ne_fcr)

figure(15);
subplot(2,1,1);
plot(a04_1ne_fcrs);
title('Neutral position FCR 1');
subplot(2,1,2);
plot(a04_2ne_fcrs);
title('Neutral position FCR 2');


figure(16);
plot(a04_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a041pi = xlsread('a04_pinch_Rep_1.102.xlsx');


  a04_1pi_ed =   a041pi(4056:(end-4256),2);
  a04_1pi_edn =   a04_1pi_ed/a04mvc_ed; 
  a04_1pi_eds = sqrt(movmean(a04_1pi_edn.^2, windowlen)); 

  a04_1pi_ecu =   a041pi(4056:(end-4256),4);
  a04_1pi_ecun =   a04_1pi_ecu/a04mvc_ecu; 
  a04_1pi_ecus = sqrt(movmean(a04_1pi_ecun.^2, windowlen)); 

  a04_1pi_ecr =   a041pi(4056:(end-4256),6);
  a04_1pi_ecrn =   a04_1pi_ecr/a04mvc_ecr;
  a04_1pi_ecrs = sqrt(movmean(a04_1pi_ecrn.^2, windowlen)); 

  a04_1pi_fcr =   a041pi(4056:(end-4256),8);
  a04_1pi_fcrn =   a04_1pi_fcr/a04mvc_fcr;
  a04_1pi_fcrs = sqrt(movmean(a04_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a042pi = xlsread('a04_pinch_Rep_2.103.xlsx');


  a04_2pi_ed =   a042pi(4056:(end-4256),2);
  a04_2pi_edn =   a04_2pi_ed/a04mvc_ed;
  a04_2pi_eds = sqrt(movmean(a04_2pi_edn.^2, windowlen)); 

  a04_2pi_ecu =   a042pi(4056:(end-4256),4);
  a04_2pi_ecun =   a04_2pi_ecu/a04mvc_ecu;
  a04_2pi_ecus = sqrt(movmean(a04_2pi_ecun.^2, windowlen));

  a04_2pi_ecr =   a042pi(4056:(end-4256),6);
  a04_2pi_ecrn =   a04_2pi_ecr/a04mvc_ecr;
  a04_2pi_ecrs = sqrt(movmean(a04_2pi_ecrn.^2, windowlen));

  a04_2pi_fcr =   a042pi(4056:(end-4256),8);
  a04_2pi_fcrn =   a04_2pi_fcr/a04mvc_fcr;
  a04_2pi_fcrs = sqrt(movmean(a04_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a043pi = xlsread('a04_pinch_Rep_3.104.xlsx');


  a04_3pi_ed =   a043pi(4056:(end-4256),2);
  a04_3pi_edn =   a04_3pi_ed/a04mvc_ed;
  a04_3pi_eds = sqrt(movmean(a04_3pi_edn.^2, windowlen));

  a04_3pi_ecu =   a043pi(4056:(end-4256),4);
  a04_3pi_ecun =   a04_3pi_ecu/a04mvc_ecu;
  a04_3pi_ecus = sqrt(movmean(a04_3pi_ecun.^2, windowlen));

  a04_3pi_ecr =   a043pi(4056:(end-4256),6);
  a04_3pi_ecrn =   a04_3pi_ecr/a04mvc_ecr;
  a04_3pi_ecrs = sqrt(movmean(a04_3pi_ecrn.^2, windowlen));

  a04_3pi_fcr =   a043pi(4056:(end-4256),8);
  a04_3pi_fcrn =   a04_3pi_fcr/a04mvc_fcr;
  a04_3pi_fcrs = sqrt(movmean(a04_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a04_pi_ed = (a04_1pi_eds +   a04_2pi_eds +   a04_3pi_eds)/3;
 a04_pi_mean_ed = mean( a04_pi_ed)

figure(17);
subplot(3,1,1);
plot(a04_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a04_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a04_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(a04_pi_ed);
title('pinch position Extensor Digitorium Subject a04');
 
ylabel('amplitude (mV)');

  a04_pi_ecu = (a04_1pi_ecus +   a04_2pi_ecus +   a04_3pi_ecus)/3;
 a04_pi_mean_ecu = mean( a04_pi_ecu)

figure(19);
subplot(3,1,1);
plot(a04_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(a04_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(a04_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(a04_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject a04');
 
ylabel('amplitude (mV)');

  a04_pi_ecr = (a04_1pi_ecrs +   a04_2pi_ecrs +   a04_3pi_ecrs)/3;
 a04_pi_mean_ecr = mean( a04_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a04_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a04_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a04_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a04_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


 a04_pi_fcr = (a04_1pi_fcrs +   a04_2pi_fcrs +   a04_3pi_fcrs)/3;
 a04_pi_mean_fcr = mean( a04_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a04_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a04_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a04_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a04_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a041pw = xlsread('a04_pour_water_Rep_1.92.xlsx');


  a04_1pw_ed =   a041pw(417:(end-2000),2);
  a04_1pw_edn =   a04_1pw_ed/a04mvc_ed; 
  a04_1pw_eds = sqrt(movmean(a04_1pw_edn.^2, windowlen)); 

  a04_1pw_ecu =   a041pw(417:(end-2000),4);
  a04_1pw_ecun =   a04_1pw_ecu/a04mvc_ecu; 
  a04_1pw_ecus = sqrt(movmean(a04_1pw_ecun.^2, windowlen)); 

  a04_1pw_ecr =   a041pw(417:(end-2000),6);
  a04_1pw_ecrn =   a04_1pw_ecr/a04mvc_ecr;
  a04_1pw_ecrs = sqrt(movmean(a04_1pw_ecrn.^2, windowlen)); 

  a04_1pw_fcr =   a041pw(417:(end-2000),8);
  a04_1pw_fcrn =   a04_1pw_fcr/a04mvc_fcr;
  a04_1pw_fcrs = sqrt(movmean(a04_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a042pw = xlsread('a04_pour_water_Rep_2.93.xlsx');


  a04_2pw_ed =   a042pw(417:(end-2000),2);
  a04_2pw_edn =   a04_2pw_ed/a04mvc_ed;
  a04_2pw_eds = sqrt(movmean(a04_2pw_edn.^2, windowlen)); 

  a04_2pw_ecu =   a042pw(417:(end-2000),4);
  a04_2pw_ecun =   a04_2pw_ecu/a04mvc_ecu;
  a04_2pw_ecus = sqrt(movmean(a04_2pw_ecun.^2, windowlen));

  a04_2pw_ecr =   a042pw(417:(end-2000),6);
  a04_2pw_ecrn =   a04_2pw_ecr/a04mvc_ecr;
  a04_2pw_ecrs = sqrt(movmean(a04_2pw_ecrn.^2, windowlen));

  a04_2pw_fcr =   a042pw(417:(end-2000),8);
  a04_2pw_fcrn =   a04_2pw_fcr/a04mvc_fcr;
  a04_2pw_fcrs = sqrt(movmean(a04_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  a043pw = xlsread('a04_pour_water_Rep_3.94.xlsx');


  a04_3pw_ed =   a043pw(417:(end-2000),2);
  a04_3pw_edn =   a04_3pw_ed/a04mvc_ed;
  a04_3pw_eds = sqrt(movmean(a04_3pw_edn.^2, windowlen));

  a04_3pw_ecu =   a043pw(417:(end-2000),4);
  a04_3pw_ecun =   a04_3pw_ecu/a04mvc_ecu;
  a04_3pw_ecus = sqrt(movmean(a04_3pw_ecun.^2, windowlen));

  a04_3pw_ecr =   a043pw(417:(end-2000),6);
  a04_3pw_ecrn =   a04_3pw_ecr/a04mvc_ecr;
  a04_3pw_ecrs = sqrt(movmean(a04_3pw_ecrn.^2, windowlen));

  a04_3pw_fcr =   a043pw(417:(end-2000),8);
  a04_3pw_fcrn =   a04_3pw_fcr/a04mvc_fcr;
  a04_3pw_fcrs = sqrt(movmean(a04_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 a04_pw_ed = (a04_1pw_eds +   a04_2pw_eds +   a04_3pw_eds)/3;
 a04_pw_mean_ed = mean( a04_pw_ed)

figure(25);
subplot(3,1,1);
plot(a04_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(a04_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(a04_3pw_eds);
title('pour water ED 3');

figure(26);
plot(a04_pw_ed);
title('pour water Extensor Digitorium Subject a04');
 
ylabel('amplitude (mV)');

 a04_pw_ecu = (a04_1pw_ecus +   a04_2pw_ecus +   a04_3pw_ecus)/3;
 a04_pw_mean_ecu = mean(a04_pw_ecu)

figure(27);
subplot(3,1,1);
plot(a04_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(a04_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(a04_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(a04_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject a04');
 
ylabel('amplitude (mV)');

  a04_pw_ecr = (a04_1pw_ecrs +   a04_2pw_ecrs +   a04_3pw_ecrs)/3;
 a04_pw_mean_ecr = mean( a04_pw_ecr)

figure(29);
subplot(3,1,1);
plot(a04_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(a04_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(a04_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(a04_pw_ecr);
title('pour water Extensor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');


 a04_pw_fcr = ( a04_1pw_fcrs +   a04_2pw_fcrs +   a04_3pw_fcrs)/3;
 a04_pw_mean_fcr = mean( a04_pw_fcr)

figure(31);
subplot(3,1,1);
plot(a04_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(a04_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(a04_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(a04_pw_fcr);
title('pour water Flexor Carpis Radialis Subject a04');
 
ylabel('amplitude (mV)');