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
max_force_a08 = 21.5

%% DATA READ FOR INDIVIDUAL a08

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all


  a08mvc_ecu = mvc('a08_MVC_-_ECU_-_bea_Rep_1.53.xlsx');
 

  a08mvc_ecr = mvc('a08_MVC_-_ECR_-_bea_Rep_1.54.xlsx');


  a08mvc_fcr = mvc('a08_MVC_-_FCR_-_bea_Rep_1.55.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  a081fp = xlsread('a08_finger_point__Rep_1.59.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  a08_1fp_ecu =   a081fp(4256:(end-4256),4);
  a08_1fp_ecun =   a08_1fp_ecu/a08mvc_ecu; 
  a08_1fp_ecus = sqrt(movmean(a08_1fp_ecun.^2, windowlen)); 

  a08_1fp_ecr =   a081fp(4256:(end-4256),6);
  a08_1fp_ecrn =   a08_1fp_ecr/a08mvc_ecr;
  a08_1fp_ecrs = sqrt(movmean(a08_1fp_ecrn.^2, windowlen)); 

  a08_1fp_fcr =   a081fp(4256:(end-4256),8);
  a08_1fp_fcrn =   a08_1fp_fcr/a08mvc_fcr;
  a08_1fp_fcrs = sqrt(movmean(a08_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a082fp = xlsread('a08_finger_point__Rep_2.60.xlsx');


  

  a08_2fp_ecu =   a082fp(4256:(end-4256),4);
  a08_2fp_ecun =   a08_2fp_ecu/a08mvc_ecu;
  a08_2fp_ecus = sqrt(movmean(a08_2fp_ecun.^2, windowlen));

  a08_2fp_ecr =   a082fp(4256:(end-4256),6);
  a08_2fp_ecrn =   a08_2fp_ecr/a08mvc_ecr;
  a08_2fp_ecrs = sqrt(movmean(a08_2fp_ecrn.^2, windowlen));

  a08_2fp_fcr =   a082fp(4256:(end-4256),8);
  a08_2fp_fcrn =   a08_2fp_fcr/a08mvc_fcr;
  a08_2fp_fcrs = sqrt(movmean(a08_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a083fp = xlsread('a08_finger_point__Rep_3.61.xlsx');



  a08_3fp_ecu =   a083fp(4256:(end-4256),4);
  a08_3fp_ecun =   a08_3fp_ecu/a08mvc_ecu;
  a08_3fp_ecus = sqrt(movmean(a08_3fp_ecun.^2, windowlen));

  a08_3fp_ecr =   a083fp(4256:(end-4256),6);
  a08_3fp_ecrn =   a08_3fp_ecr/a08mvc_ecr;
  a08_3fp_ecrs = sqrt(movmean(a08_3fp_ecrn.^2, windowlen));

  a08_3fp_fcr =   a083fp(4256:(end-4256),8);
  a08_3fp_fcrn =   a08_3fp_fcr/a08mvc_fcr;
  a08_3fp_fcrs = sqrt(movmean(a08_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

 a08_fp_ecu = (a08_1fp_ecus +   a08_2fp_ecus +   a08_3fp_ecus)/3;
 a08_fp_mean_ecu = mean( a08_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a08_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a08_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a08_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a08_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject a08');
 
ylabel('amplitude (mV)');

  a08_fp_ecr = (a08_1fp_ecrs +   a08_2fp_ecrs +   a08_3fp_ecrs)/3;
 a08_fp_mean_ecr = mean( a08_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a08_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a08_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a08_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a08_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


  a08_fp_fcr = (a08_1fp_fcrs +   a08_2fp_fcrs +   a08_3fp_fcrs)/3;
 a08_fp_mean_fcr = mean( a08_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a08_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a08_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a08_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a08_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a081ne = xlsread('a08_neutral_Rep_1.62.xlsx');

  a08_1ne_ecu =   a081ne(4056:(end-4056),4);
  a08_1ne_ecun =   a08_1ne_ecu/a08mvc_ecu; 
  a08_1ne_ecus = sqrt(movmean(a08_1ne_ecun.^2, windowlen)); 

  a08_1ne_ecr =   a081ne(4056:(end-4056),6);
  a08_1ne_ecrn =   a08_1ne_ecr/a08mvc_ecr;
  a08_1ne_ecrs = sqrt(movmean(a08_1ne_ecrn.^2, windowlen)); 

  a08_1ne_fcr =   a081ne(4056:(end-4056),8);
  a08_1ne_fcrn =   a08_1ne_fcr/a08mvc_fcr;
  a08_1ne_fcrs = sqrt(movmean(a08_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a082ne = xlsread('a08_neutral_Rep_2.63.xlsx');

  a08_2ne_ecu =   a082ne(4056:(end-4056),4);
  a08_2ne_ecun =   a08_2ne_ecu/a08mvc_ecu;
  a08_2ne_ecus = sqrt(movmean(a08_2ne_ecun.^2, windowlen));

  a08_2ne_ecr =   a082ne(4056:(end-4056),6);
  a08_2ne_ecrn =   a08_2ne_ecr/a08mvc_ecr;
  a08_2ne_ecrs = sqrt(movmean(a08_2ne_ecrn.^2, windowlen));

  a08_2ne_fcr =   a082ne(4056:(end-4056),8);
  a08_2ne_fcrn =   a08_2ne_fcr/a08mvc_fcr;
  a08_2ne_fcrs = sqrt(movmean(a08_2ne_fcrn.^2, windowlen));



% averaged signal for each muscle for neutral position 

a08_ne_ecu = (a08_1ne_ecus+ a08_2ne_ecus)/2;
a08_ne_mean_ecu = mean( a08_ne_ecu)

figure(11);
subplot(2,1,1);
plot(a08_1ne_ecus);
title('Neutral position ECU 1');
subplot(2,1,2);
plot(a08_2ne_ecus);
title('Neutral position ECU 2');

figure(12);
plot(a08_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject a08');
ylabel('amplitude (mV)');

  a08_ne_ecr = (a08_1ne_ecrs +   a08_2ne_ecrs)/2;
 a08_ne_mean_ecr = mean( a08_ne_ecr)

figure(13);
subplot(2,1,1);
plot(a08_1ne_ecrs);
title('Neutral position ECR 1');
subplot(2,1,2);
plot(a08_2ne_ecrs);
title('Neutral position ECR 2');


figure(14);
plot(a08_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


  a08_ne_fcr = (a08_1ne_fcrs +   a08_2ne_fcrs)/2;
 a08_ne_mean_fcr = mean( a08_ne_fcr)

figure(15);
subplot(2,1,1);
plot(a08_1ne_fcrs);
title('Neutral position FCR 1');
subplot(2,1,2);
plot(a08_2ne_fcrs);
title('Neutral position FCR 2');

figure(16);
plot(a08_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a081pi = xlsread('a08_pinch_Rep_1.66.xlsx');

  a08_1pi_ecu =   a081pi(4056:(end-4256),4);
  a08_1pi_ecun =   a08_1pi_ecu/a08mvc_ecu; 
  a08_1pi_ecus = sqrt(movmean(a08_1pi_ecun.^2, windowlen)); 

  a08_1pi_ecr =   a081pi(4056:(end-4256),6);
  a08_1pi_ecrn =   a08_1pi_ecr/a08mvc_ecr;
  a08_1pi_ecrs = sqrt(movmean(a08_1pi_ecrn.^2, windowlen)); 

  a08_1pi_fcr =   a081pi(4056:(end-4256),8);
  a08_1pi_fcrn =   a08_1pi_fcr/a08mvc_fcr;
  a08_1pi_fcrs = sqrt(movmean(a08_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a082pi = xlsread('a08_pinch_Rep_2.67.xlsx');


  
  a08_2pi_ecu =   a082pi(4056:(end-4256),4);
  a08_2pi_ecun =   a08_2pi_ecu/a08mvc_ecu;
  a08_2pi_ecus = sqrt(movmean(a08_2pi_ecun.^2, windowlen));

  a08_2pi_ecr =   a082pi(4056:(end-4256),6);
  a08_2pi_ecrn =   a08_2pi_ecr/a08mvc_ecr;
  a08_2pi_ecrs = sqrt(movmean(a08_2pi_ecrn.^2, windowlen));

  a08_2pi_fcr =   a082pi(4056:(end-4256),8);
  a08_2pi_fcrn =   a08_2pi_fcr/a08mvc_fcr;
  a08_2pi_fcrs = sqrt(movmean(a08_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a083pi = xlsread('a08_pinch_Rep_4.69.xlsx');


  
  a08_3pi_ecu =   a083pi(4056:(end-4256),4);
  a08_3pi_ecun =   a08_3pi_ecu/a08mvc_ecu;
  a08_3pi_ecus = sqrt(movmean(a08_3pi_ecun.^2, windowlen));

  a08_3pi_ecr =   a083pi(4056:(end-4256),6);
  a08_3pi_ecrn =   a08_3pi_ecr/a08mvc_ecr;
  a08_3pi_ecrs = sqrt(movmean(a08_3pi_ecrn.^2, windowlen));

  a08_3pi_fcr =   a083pi(4056:(end-4256),8);
  a08_3pi_fcrn =   a08_3pi_fcr/a08mvc_fcr;
  a08_3pi_fcrs = sqrt(movmean(a08_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

a08_pi_ecu = (a08_1pi_ecus +   a08_2pi_ecus +   a08_3pi_ecus)/3;
a08_pi_mean_ecu = mean( a08_pi_ecu)

figure(19);
subplot(3,1,1);
plot(a08_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(a08_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(a08_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(a08_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject a08');
 
ylabel('amplitude (mV)');

  a08_pi_ecr = (a08_1pi_ecrs +   a08_2pi_ecrs +   a08_3pi_ecrs)/3;
 a08_pi_mean_ecr = mean( a08_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a08_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a08_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a08_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a08_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


 a08_pi_fcr = (a08_1pi_fcrs +   a08_2pi_fcrs +   a08_3pi_fcrs)/3;
 a08_pi_mean_fcr = mean( a08_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a08_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a08_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a08_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a08_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a081pw = xlsread('a08_pour_water_Rep_1.56.xlsx');


  a08_1pw_ecu =   a081pw(417:(end-2000),4);
  a08_1pw_ecun =   a08_1pw_ecu/a08mvc_ecu; 
  a08_1pw_ecus = sqrt(movmean(a08_1pw_ecun.^2, windowlen)); 

  a08_1pw_ecr =   a081pw(417:(end-2000),6);
  a08_1pw_ecrn =   a08_1pw_ecr/a08mvc_ecr;
  a08_1pw_ecrs = sqrt(movmean(a08_1pw_ecrn.^2, windowlen)); 

  a08_1pw_fcr =   a081pw(417:(end-2000),8);
  a08_1pw_fcrn =   a08_1pw_fcr/a08mvc_fcr;
  a08_1pw_fcrs = sqrt(movmean(a08_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a082pw = xlsread('a08_pour_water_Rep_2.57.xlsx');


  a08_2pw_ecu =   a082pw(417:(end-2000),4);
  a08_2pw_ecun =   a08_2pw_ecu/a08mvc_ecu;
  a08_2pw_ecus = sqrt(movmean(a08_2pw_ecun.^2, windowlen));

  a08_2pw_ecr =   a082pw(417:(end-2000),6);
  a08_2pw_ecrn =   a08_2pw_ecr/a08mvc_ecr;
  a08_2pw_ecrs = sqrt(movmean(a08_2pw_ecrn.^2, windowlen));

  a08_2pw_fcr =   a082pw(417:(end-2000),8);
  a08_2pw_fcrn =   a08_2pw_fcr/a08mvc_fcr;
  a08_2pw_fcrs = sqrt(movmean(a08_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  a083pw = xlsread('a08_pour_water_Rep_3.58.xlsx');


  a08_3pw_ecu =   a083pw(417:(end-2000),4);
  a08_3pw_ecun =   a08_3pw_ecu/a08mvc_ecu;
  a08_3pw_ecus = sqrt(movmean(a08_3pw_ecun.^2, windowlen));

  a08_3pw_ecr =   a083pw(417:(end-2000),6);
  a08_3pw_ecrn =   a08_3pw_ecr/a08mvc_ecr;
  a08_3pw_ecrs = sqrt(movmean(a08_3pw_ecrn.^2, windowlen));

  a08_3pw_fcr =   a083pw(417:(end-2000),8);
  a08_3pw_fcrn =   a08_3pw_fcr/a08mvc_fcr;
  a08_3pw_fcrs = sqrt(movmean(a08_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

a08_pw_ecu = (a08_1pw_ecus +   a08_2pw_ecus +   a08_3pw_ecus)/3;
a08_pw_mean_ecu = mean(a08_pw_ecu)

figure(27);
subplot(3,1,1);
plot(a08_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(a08_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(a08_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(a08_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject a08');
 
ylabel('amplitude (mV)');

a08_pw_ecr = (a08_1pw_ecrs +   a08_2pw_ecrs +   a08_3pw_ecrs)/3;
a08_pw_mean_ecr = mean( a08_pw_ecr)

figure(29);
subplot(3,1,1);
plot(a08_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(a08_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(a08_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(a08_pw_ecr);
title('pour water Extensor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');


 a08_pw_fcr = ( a08_1pw_fcrs +   a08_2pw_fcrs +   a08_3pw_fcrs)/3;
 a08_pw_mean_fcr = mean( a08_pw_fcr)

figure(31);
subplot(3,1,1);
plot(a08_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(a08_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(a08_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(a08_pw_fcr);
title('pour water Flexor Carpis Radialis Subject a08');
 
ylabel('amplitude (mV)');