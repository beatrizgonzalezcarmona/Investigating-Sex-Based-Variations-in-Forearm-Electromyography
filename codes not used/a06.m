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
max_force_a06 = 36

%% DATA READ FOR INDIVIDUAL a1

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  a06mvc_ed = mvc('a06_MVC_1_-_ED_-_bea_Rep_1.123.xlsx'); 

  a06mvc_ecu = mvc('a06_MVC_-_ECU_-_bea_Rep_1.124.xlsx');

  a06mvc_ecr = mvc('a06_MVC_-_ECR_-_bea_Rep_1.125.xlsx');

  a06mvc_fcr = mvc('a06_MVC_-_FCR_-_bea_Rep_1.126.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  a061fp = xlsread('a06_finger_point__Rep_3.132.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  a06_1fp_ed =   a061fp(4256:(end-4256),2);
  a06_1fp_edn =   a06_1fp_ed/a06mvc_ed; 
  a06_1fp_eds = sqrt(movmean(a06_1fp_edn.^2, windowlen)); 

  a06_1fp_ecu =   a061fp(4256:(end-4256),4);
  a06_1fp_ecun =   a06_1fp_ecu/a06mvc_ecu; 
  a06_1fp_ecus = sqrt(movmean(a06_1fp_ecun.^2, windowlen)); 

  a06_1fp_ecr =   a061fp(4256:(end-4256),6);
  a06_1fp_ecrn =   a06_1fp_ecr/a06mvc_ecr;
  a06_1fp_ecrs = sqrt(movmean(a06_1fp_ecrn.^2, windowlen)); 

  a06_1fp_fcr =   a061fp(4256:(end-4256),8);
  a06_1fp_fcrn =   a06_1fp_fcr/a06mvc_fcr;
  a06_1fp_fcrs = sqrt(movmean(a06_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a062fp = xlsread('a06_finger_point__Rep_4.133.xlsx');


  a06_2fp_ed =   a062fp(4256:(end-4256),2);
  a06_2fp_edn =   a06_2fp_ed/a06mvc_ed;
  a06_2fp_eds = sqrt(movmean(a06_2fp_edn.^2, windowlen)); 

  a06_2fp_ecu =   a062fp(4256:(end-4256),4);
  a06_2fp_ecun =   a06_2fp_ecu/a06mvc_ecu;
  a06_2fp_ecus = sqrt(movmean(a06_2fp_ecun.^2, windowlen));

  a06_2fp_ecr =   a062fp(4256:(end-4256),6);
  a06_2fp_ecrn =   a06_2fp_ecr/a06mvc_ecr;
  a06_2fp_ecrs = sqrt(movmean(a06_2fp_ecrn.^2, windowlen));

  a06_2fp_fcr =   a062fp(4256:(end-4256),8);
  a06_2fp_fcrn =   a06_2fp_fcr/a06mvc_fcr;
  a06_2fp_fcrs = sqrt(movmean(a06_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a063fp = xlsread('a06_finger_point__Rep_5.134.xlsx');


  a06_3fp_ed =   a063fp(4256:(end-4256),2);
  a06_3fp_edn =   a06_3fp_ed/a06mvc_ed;
  a06_3fp_eds = sqrt(movmean(a06_3fp_edn.^2, windowlen));

  a06_3fp_ecu =   a063fp(4256:(end-4256),4);
  a06_3fp_ecun =   a06_3fp_ecu/a06mvc_ecu;
  a06_3fp_ecus = sqrt(movmean(a06_3fp_ecun.^2, windowlen));

  a06_3fp_ecr =   a063fp(4256:(end-4256),6);
  a06_3fp_ecrn =   a06_3fp_ecr/a06mvc_ecr;
  a06_3fp_ecrs = sqrt(movmean(a06_3fp_ecrn.^2, windowlen));

  a06_3fp_fcr =   a063fp(4256:(end-4256),8);
  a06_3fp_fcrn =   a06_3fp_fcr/a06mvc_fcr;
  a06_3fp_fcrs = sqrt(movmean(a06_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  a06_fp_ed = (a06_1fp_eds +   a06_2fp_eds +   a06_3fp_eds)/3;
 a06_fp_mean_ed = mean( a06_fp_ed)

figure(1);
subplot(3,1,1);
plot(a06_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(a06_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(a06_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (a06_fp_ed);
title('Finger point Extensor Digitorium Subject   a06');
 
ylabel('amplitude (mV)');

  a06_fp_ecu = (a06_1fp_ecus +   a06_2fp_ecus +   a06_3fp_ecus)/3;
 a06_fp_mean_ecu = mean( a06_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a06_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a06_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a06_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a06_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject   a06');
 
ylabel('amplitude (mV)');

  a06_fp_ecr = (a06_1fp_ecrs +   a06_2fp_ecrs +   a06_3fp_ecrs)/3;
 a06_fp_mean_ecr = mean( a06_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a06_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a06_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a06_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a06_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


  a06_fp_fcr = (a06_1fp_fcrs +   a06_2fp_fcrs +   a06_3fp_fcrs)/3;
 a06_fp_mean_fcr = mean( a06_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a06_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a06_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a06_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a06_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a061ne = xlsread('a06_neutral_Rep_1.135.xlsx');


  a06_1ne_ed =   a061ne(4056:(end-4056),2);
  a06_1ne_edn =   a06_1ne_ed/a06mvc_ed; 
  a06_1ne_eds = sqrt(movmean(a06_1ne_edn.^2, windowlen)); 

  a06_1ne_ecu =   a061ne(4056:(end-4056),4);
  a06_1ne_ecun =   a06_1ne_ecu/a06mvc_ecu; 
  a06_1ne_ecus = sqrt(movmean(a06_1ne_ecun.^2, windowlen)); 

  a06_1ne_ecr =   a061ne(4056:(end-4056),6);
  a06_1ne_ecrn =   a06_1ne_ecr/a06mvc_ecr;
  a06_1ne_ecrs = sqrt(movmean(a06_1ne_ecrn.^2, windowlen)); 

  a06_1ne_fcr =   a061ne(4056:(end-4056),8);
  a06_1ne_fcrn =   a06_1ne_fcr/a06mvc_fcr;
  a06_1ne_fcrs = sqrt(movmean(a06_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a062ne = xlsread('a06_neutral_Rep_2.136.xlsx');


  a06_2ne_ed =   a062ne(4056:(end-4056),2);
  a06_2ne_edn =   a06_2ne_ed/a06mvc_ed;
  a06_2ne_eds = sqrt(movmean(a06_2ne_edn.^2, windowlen)); 

  a06_2ne_ecu =   a062ne(4056:(end-4056),4);
  a06_2ne_ecun =   a06_2ne_ecu/a06mvc_ecu;
  a06_2ne_ecus = sqrt(movmean(a06_2ne_ecun.^2, windowlen));

  a06_2ne_ecr =   a062ne(4056:(end-4056),6);
  a06_2ne_ecrn =   a06_2ne_ecr/a06mvc_ecr;
  a06_2ne_ecrs = sqrt(movmean(a06_2ne_ecrn.^2, windowlen));

  a06_2ne_fcr =   a062ne(4056:(end-4056),8);
  a06_2ne_fcrn =   a06_2ne_fcr/a06mvc_fcr;
  a06_2ne_fcrs = sqrt(movmean(a06_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  a063ne = xlsread('a06_neutral_Rep_3.137.xlsx');


  a06_3ne_ed =   a063ne(4056:(end-4056),2);
  a06_3ne_edn =   a06_3ne_ed/a06mvc_ed;
  a06_3ne_eds = sqrt(movmean(a06_3ne_edn.^2, windowlen));

  a06_3ne_ecu =   a063ne(4056:(end-4056),4);
  a06_3ne_ecun =   a06_3ne_ecu/a06mvc_ecu;
  a06_3ne_ecus = sqrt(movmean(a06_3ne_ecun.^2, windowlen));

  a06_3ne_ecr =   a063ne(4056:(end-4056),6);
  a06_3ne_ecrn =   a06_3ne_ecr/a06mvc_ecr;
  a06_3ne_ecrs = sqrt(movmean(a06_3ne_ecrn.^2, windowlen));

  a06_3ne_fcr =   a063ne(4056:(end-4056),8);
  a06_3ne_fcrn =   a06_3ne_fcr/a06mvc_fcr;
  a06_3ne_fcrs = sqrt(movmean(a06_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a06_ne_ed = (a06_1ne_eds +   a06_2ne_eds +   a06_3ne_eds)/3;
 a06_ne_mean_ed = mean( a06_ne_ed)

figure(9);
subplot(3,1,1);
plot(a06_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a06_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a06_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(a06_ne_ed);
title('Neutral position Extensor Digitorium Subject   a06');
 
ylabel('amplitude (mV)');

  a06_ne_ecu = (a06_1ne_ecus +   a06_2ne_ecus +   a06_3ne_ecus)/3;
 a06_ne_mean_ecu = mean( a06_ne_ecu)

figure(11);
subplot(3,1,1);
plot(a06_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(a06_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(a06_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(a06_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject   a06');
 
ylabel('amplitude (mV)');

  a06_ne_ecr = (a06_1ne_ecrs +   a06_2ne_ecrs +   a06_3ne_ecrs)/3;
 a06_ne_mean_ecr = mean( a06_ne_ecr)

figure(13);
subplot(3,1,1);
plot(a06_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(a06_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(a06_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(a06_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


  a06_ne_fcr = (a06_1ne_fcrs +   a06_2ne_fcrs +   a06_3ne_fcrs)/3;
 a06_ne_mean_fcr = mean( a06_ne_fcr)

figure(15);
subplot(3,1,1);
plot(a06_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(a06_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(a06_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(a06_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a061pi = xlsread('a06_pinch_Rep_1.138.xlsx');


  a06_1pi_ed =   a061pi(4056:(end-4256),2);
  a06_1pi_edn =   a06_1pi_ed/a06mvc_ed; 
  a06_1pi_eds = sqrt(movmean(a06_1pi_edn.^2, windowlen)); 

  a06_1pi_ecu =   a061pi(4056:(end-4256),4);
  a06_1pi_ecun =   a06_1pi_ecu/a06mvc_ecu; 
  a06_1pi_ecus = sqrt(movmean(a06_1pi_ecun.^2, windowlen)); 

  a06_1pi_ecr =   a061pi(4056:(end-4256),6);
  a06_1pi_ecrn =   a06_1pi_ecr/a06mvc_ecr;
  a06_1pi_ecrs = sqrt(movmean(a06_1pi_ecrn.^2, windowlen)); 

  a06_1pi_fcr =   a061pi(4056:(end-4256),8);
  a06_1pi_fcrn =   a06_1pi_fcr/a06mvc_fcr;
  a06_1pi_fcrs = sqrt(movmean(a06_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a062pi = xlsread('a06_pinch_Rep_2.139.xlsx');


  a06_2pi_ed =   a062pi(4056:(end-4256),2);
  a06_2pi_edn =   a06_2pi_ed/a06mvc_ed;
  a06_2pi_eds = sqrt(movmean(a06_2pi_edn.^2, windowlen)); 

  a06_2pi_ecu =   a062pi(4056:(end-4256),4);
  a06_2pi_ecun =   a06_2pi_ecu/a06mvc_ecu;
  a06_2pi_ecus = sqrt(movmean(a06_2pi_ecun.^2, windowlen));

  a06_2pi_ecr =   a062pi(4056:(end-4256),6);
  a06_2pi_ecrn =   a06_2pi_ecr/a06mvc_ecr;
  a06_2pi_ecrs = sqrt(movmean(a06_2pi_ecrn.^2, windowlen));

  a06_2pi_fcr =   a062pi(4056:(end-4256),8);
  a06_2pi_fcrn =   a06_2pi_fcr/a06mvc_fcr;
  a06_2pi_fcrs = sqrt(movmean(a06_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a063pi = xlsread('a06_pinch_Rep_3.140.xlsx');


  a06_3pi_ed =   a063pi(4056:(end-4256),2);
  a06_3pi_edn =   a06_3pi_ed/a06mvc_ed;
  a06_3pi_eds = sqrt(movmean(a06_3pi_edn.^2, windowlen));

  a06_3pi_ecu =   a063pi(4056:(end-4256),4);
  a06_3pi_ecun =   a06_3pi_ecu/a06mvc_ecu;
  a06_3pi_ecus = sqrt(movmean(a06_3pi_ecun.^2, windowlen));

  a06_3pi_ecr =   a063pi(4056:(end-4256),6);
  a06_3pi_ecrn =   a06_3pi_ecr/a06mvc_ecr;
  a06_3pi_ecrs = sqrt(movmean(a06_3pi_ecrn.^2, windowlen));

  a06_3pi_fcr =   a063pi(4056:(end-4256),8);
  a06_3pi_fcrn =   a06_3pi_fcr/a06mvc_fcr;
  a06_3pi_fcrs = sqrt(movmean(a06_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a06_pi_ed = (a06_1pi_eds +   a06_2pi_eds +   a06_3pi_eds)/3;
 a06_pi_mean_ed = mean( a06_pi_ed)

figure(17);
subplot(3,1,1);
plot(a06_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a06_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a06_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(a06_pi_ed);
title('pinch position Extensor Digitorium Subject   a06');
 
ylabel('amplitude (mV)');

  a06_pi_ecu = (a06_1pi_ecus +   a06_2pi_ecus)/2; % third repetition not taken into account because electrode did not work
 a06_pi_mean_ecu = mean( a06_pi_ecu)

figure(19);
subplot(2,1,1);
plot(a06_1pi_ecus);
title('Pinch position ECU 1');
subplot(2,1,2);
plot(a06_2pi_ecus);
title('Pinch position ECU 2');


figure(20);
plot(a06_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject   a06');
 
ylabel('amplitude (mV)');

  a06_pi_ecr = (a06_1pi_ecrs +   a06_2pi_ecrs +   a06_3pi_ecrs)/3;
 a06_pi_mean_ecr = mean( a06_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a06_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a06_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a06_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a06_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


 a06_pi_fcr = (a06_1pi_fcrs +   a06_2pi_fcrs +   a06_3pi_fcrs)/3;
 a06_pi_mean_fcr = mean( a06_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a06_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a06_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a06_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a06_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a061pw = xlsread('a06_pour_water_Rep_1.127.xlsx');


  a06_1pw_ed =   a061pw(417:(end-2000),2);
  a06_1pw_edn =   a06_1pw_ed/a06mvc_ed; 
  a06_1pw_eds = sqrt(movmean(a06_1pw_edn.^2, windowlen)); 

  a06_1pw_ecu =   a061pw(417:(end-2000),4);
  a06_1pw_ecun =   a06_1pw_ecu/a06mvc_ecu; 
  a06_1pw_ecus = sqrt(movmean(a06_1pw_ecun.^2, windowlen)); 

  a06_1pw_ecr =   a061pw(417:(end-2000),6);
  a06_1pw_ecrn =   a06_1pw_ecr/a06mvc_ecr;
  a06_1pw_ecrs = sqrt(movmean(a06_1pw_ecrn.^2, windowlen)); 

  a06_1pw_fcr =   a061pw(417:(end-2000),8);
  a06_1pw_fcrn =   a06_1pw_fcr/a06mvc_fcr;
  a06_1pw_fcrs = sqrt(movmean(a06_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a062pw = xlsread('a06_pour_water_Rep_2.128.xlsx');


  a06_2pw_ed =   a062pw(417:(end-2000),2);
  a06_2pw_edn =   a06_2pw_ed/a06mvc_ed;
  a06_2pw_eds = sqrt(movmean(a06_2pw_edn.^2, windowlen)); 

  a06_2pw_ecu =   a062pw(417:(end-2000),4);
  a06_2pw_ecun =   a06_2pw_ecu/a06mvc_ecu;
  a06_2pw_ecus = sqrt(movmean(a06_2pw_ecun.^2, windowlen));

  a06_2pw_ecr =   a062pw(417:(end-2000),6);
  a06_2pw_ecrn =   a06_2pw_ecr/a06mvc_ecr;
  a06_2pw_ecrs = sqrt(movmean(a06_2pw_ecrn.^2, windowlen));

  a06_2pw_fcr =   a062pw(417:(end-2000),8);
  a06_2pw_fcrn =   a06_2pw_fcr/a06mvc_fcr;
  a06_2pw_fcrs = sqrt(movmean(a06_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  a063pw = xlsread('a06_pour_water_Rep_3.129.xlsx');


  a06_3pw_ed =   a063pw(417:(end-2000),2);
  a06_3pw_edn =   a06_3pw_ed/a06mvc_ed;
  a06_3pw_eds = sqrt(movmean(a06_3pw_edn.^2, windowlen));

  a06_3pw_ecu =   a063pw(417:(end-2000),4);
  a06_3pw_ecun =   a06_3pw_ecu/a06mvc_ecu;
  a06_3pw_ecus = sqrt(movmean(a06_3pw_ecun.^2, windowlen));

  a06_3pw_ecr =   a063pw(417:(end-2000),6);
  a06_3pw_ecrn =   a06_3pw_ecr/a06mvc_ecr;
  a06_3pw_ecrs = sqrt(movmean(a06_3pw_ecrn.^2, windowlen));

  a06_3pw_fcr =   a063pw(417:(end-2000),8);
  a06_3pw_fcrn =   a06_3pw_fcr/a06mvc_fcr;
  a06_3pw_fcrs = sqrt(movmean(a06_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 a06_pw_ed = (a06_1pw_eds +   a06_2pw_eds +   a06_3pw_eds)/3;
 a06_pw_mean_ed = mean( a06_pw_ed)

figure(25);
subplot(3,1,1);
plot(a06_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(a06_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(a06_3pw_eds);
title('pour water ED 3');

figure(26);
plot(a06_pw_ed);
title('pour water Extensor Digitorium Subject   a06');
 
ylabel('amplitude (mV)');

 a06_pw_ecu = (a06_1pw_ecus +   a06_2pw_ecus +   a06_3pw_ecus)/3;
 a06_pw_mean_ecu = mean(a06_pw_ecu)

figure(27);
subplot(3,1,1);
plot(a06_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(a06_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(a06_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(a06_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject   a06');
 
ylabel('amplitude (mV)');

  a06_pw_ecr = (a06_1pw_ecrs +   a06_2pw_ecrs +   a06_3pw_ecrs)/3;
 a06_pw_mean_ecr = mean( a06_pw_ecr)

figure(29);
subplot(3,1,1);
plot(a06_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(a06_2pw_ecrs);
title('pour water ECR 1');
subplot(3,1,3);
plot(a06_3pw_ecrs);
title('pour water ECR 1');

figure(30);
plot(a06_pw_ecr);
title('pour water Extensor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');


 a06_pw_fcr = ( a06_1pw_fcrs +   a06_2pw_fcrs +   a06_3pw_fcrs)/3;
 a06_pw_mean_fcr = mean( a06_pw_fcr)

figure(31);
subplot(3,1,1);
plot(a06_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(a06_2pw_fcrs);
title('pour water FCR 1');
subplot(3,1,3);
plot(a06_3pw_fcrs);
title('pour water FCR 1');

figure(32);
plot(a06_pw_fcr);
title('pour water Flexor Carpis Radialis Subject   a06');
 
ylabel('amplitude (mV)');