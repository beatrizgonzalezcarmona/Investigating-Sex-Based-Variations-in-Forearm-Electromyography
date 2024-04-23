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
max_force_a09 = 27.6

%% DATA READ FOR INDIVIDUAL a09

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all



  a09mvc_ecu = mvc('a09_MVC_-_ECU_-_bea_Rep_5.5.xlsx');

  a09mvc_ecr = mvc('a09_MVC_-_ECR_-_bea_Rep_1.6.xlsx');

  a09mvc_fcr = mvc('a09_MVC_-_FCR_-_bea_Rep_1.7.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  a091fp = xlsread('a09_finger_point__Rep_1.11.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  

  a09_1fp_ecu =   a091fp(4256:(end-4256),4);
  a09_1fp_ecun =   a09_1fp_ecu/a09mvc_ecu; 
  a09_1fp_ecus = sqrt(movmean(a09_1fp_ecun.^2, windowlen)); 

  a09_1fp_ecr =   a091fp(4256:(end-4256),6);
  a09_1fp_ecrn =   a09_1fp_ecr/a09mvc_ecr;
  a09_1fp_ecrs = sqrt(movmean(a09_1fp_ecrn.^2, windowlen)); 

  a09_1fp_fcr =   a091fp(4256:(end-4256),8);
  a09_1fp_fcrn =   a09_1fp_fcr/a09mvc_fcr;
  a09_1fp_fcrs = sqrt(movmean(a09_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a092fp = xlsread('a09_finger_point__Rep_2.12.xlsx');


 

  a09_2fp_ecu =   a092fp(4256:(end-4256),4);
  a09_2fp_ecun =   a09_2fp_ecu/a09mvc_ecu;
  a09_2fp_ecus = sqrt(movmean(a09_2fp_ecun.^2, windowlen));

  a09_2fp_ecr =   a092fp(4256:(end-4256),6);
  a09_2fp_ecrn =   a09_2fp_ecr/a09mvc_ecr;
  a09_2fp_ecrs = sqrt(movmean(a09_2fp_ecrn.^2, windowlen));

  a09_2fp_fcr =   a092fp(4256:(end-4256),8);
  a09_2fp_fcrn =   a09_2fp_fcr/a09mvc_fcr;
  a09_2fp_fcrs = sqrt(movmean(a09_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a093fp = xlsread('a09_finger_point__Rep_3.13.xlsx');


 
  a09_3fp_ecu =   a093fp(4256:(end-4256),4);
  a09_3fp_ecun =   a09_3fp_ecu/a09mvc_ecu;
  a09_3fp_ecus = sqrt(movmean(a09_3fp_ecun.^2, windowlen));

  a09_3fp_ecr =   a093fp(4256:(end-4256),6);
  a09_3fp_ecrn =   a09_3fp_ecr/a09mvc_ecr;
  a09_3fp_ecrs = sqrt(movmean(a09_3fp_ecrn.^2, windowlen));

  a09_3fp_fcr =   a093fp(4256:(end-4256),8);
  a09_3fp_fcrn =   a09_3fp_fcr/a09mvc_fcr;
  a09_3fp_fcrs = sqrt(movmean(a09_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 


  a09_fp_ecu = (a09_1fp_ecus +   a09_2fp_ecus +   a09_3fp_ecus)/3;
 a09_fp_mean_ecu = mean( a09_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a09_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a09_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a09_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a09_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject a09');
 
ylabel('amplitude (mV)');

  a09_fp_ecr = (a09_1fp_ecrs +   a09_2fp_ecrs +   a09_3fp_ecrs)/3;
 a09_fp_mean_ecr = mean( a09_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a09_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a09_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a09_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a09_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


  a09_fp_fcr = (a09_1fp_fcrs +   a09_2fp_fcrs +   a09_3fp_fcrs)/3;
 a09_fp_mean_fcr = mean( a09_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a09_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a09_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a09_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a09_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a091ne = xlsread('a09_neutral_Rep_1.14.xlsx');


 
  a09_1ne_ecu =   a091ne(4056:(end-4056),4);
  a09_1ne_ecun =   a09_1ne_ecu/a09mvc_ecu; 
  a09_1ne_ecus = sqrt(movmean(a09_1ne_ecun.^2, windowlen)); 

  a09_1ne_ecr =   a091ne(4056:(end-4056),6);
  a09_1ne_ecrn =   a09_1ne_ecr/a09mvc_ecr;
  a09_1ne_ecrs = sqrt(movmean(a09_1ne_ecrn.^2, windowlen)); 

  a09_1ne_fcr =   a091ne(4056:(end-4056),8);
  a09_1ne_fcrn =   a09_1ne_fcr/a09mvc_fcr;
  a09_1ne_fcrs = sqrt(movmean(a09_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a092ne = xlsread('a09_neutral_Rep_2.15.xlsx');


  a09_2ne_ecu =   a092ne(4056:(end-4056),4);
  a09_2ne_ecun =   a09_2ne_ecu/a09mvc_ecu;
  a09_2ne_ecus = sqrt(movmean(a09_2ne_ecun.^2, windowlen));

  a09_2ne_ecr =   a092ne(4056:(end-4056),6);
  a09_2ne_ecrn =   a09_2ne_ecr/a09mvc_ecr;
  a09_2ne_ecrs = sqrt(movmean(a09_2ne_ecrn.^2, windowlen));

  a09_2ne_fcr =   a092ne(4056:(end-4056),8);
  a09_2ne_fcrn =   a09_2ne_fcr/a09mvc_fcr;
  a09_2ne_fcrs = sqrt(movmean(a09_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  a093ne = xlsread('a09_neutral_Rep_3.16.xlsx');


  a09_3ne_ecu =   a093ne(4056:(end-4056),4);
  a09_3ne_ecun =   a09_3ne_ecu/a09mvc_ecu;
  a09_3ne_ecus = sqrt(movmean(a09_3ne_ecun.^2, windowlen));

  a09_3ne_ecr =   a093ne(4056:(end-4056),6);
  a09_3ne_ecrn =   a09_3ne_ecr/a09mvc_ecr;
  a09_3ne_ecrs = sqrt(movmean(a09_3ne_ecrn.^2, windowlen));

  a09_3ne_fcr =   a093ne(4056:(end-4056),8);
  a09_3ne_fcrn =   a09_3ne_fcr/a09mvc_fcr;
  a09_3ne_fcrs = sqrt(movmean(a09_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 



  a09_ne_ecu = (a09_1ne_ecus +   a09_2ne_ecus +   a09_3ne_ecus)/3;
 a09_ne_mean_ecu = mean( a09_ne_ecu)

figure(11);
subplot(3,1,1);
plot(a09_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(a09_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(a09_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(a09_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject a09');
 
ylabel('amplitude (mV)');

  a09_ne_ecr = (a09_1ne_ecrs +   a09_2ne_ecrs +   a09_3ne_ecrs)/3;
 a09_ne_mean_ecr = mean( a09_ne_ecr)

figure(13);
subplot(3,1,1);
plot(a09_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(a09_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(a09_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(a09_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


  a09_ne_fcr = (a09_1ne_fcrs +   a09_2ne_fcrs +   a09_3ne_fcrs)/3;
 a09_ne_mean_fcr = mean( a09_ne_fcr)

figure(15);
subplot(3,1,1);
plot(a09_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(a09_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(a09_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(a09_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a091pi = xlsread('a09_pinch_Rep_1.17.xlsx');


  a09_1pi_ecu =   a091pi(4056:(end-4256),4);
  a09_1pi_ecun =   a09_1pi_ecu/a09mvc_ecu; 
  a09_1pi_ecus = sqrt(movmean(a09_1pi_ecun.^2, windowlen)); 

  a09_1pi_ecr =   a091pi(4056:(end-4256),6);
  a09_1pi_ecrn =   a09_1pi_ecr/a09mvc_ecr;
  a09_1pi_ecrs = sqrt(movmean(a09_1pi_ecrn.^2, windowlen)); 

  a09_1pi_fcr =   a091pi(4056:(end-4256),8);
  a09_1pi_fcrn =   a09_1pi_fcr/a09mvc_fcr;
  a09_1pi_fcrs = sqrt(movmean(a09_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a092pi = xlsread('a09_pinch_Rep_2.18.xlsx');


  a09_2pi_ecu =   a092pi(4056:(end-4256),4);
  a09_2pi_ecun =   a09_2pi_ecu/a09mvc_ecu;
  a09_2pi_ecus = sqrt(movmean(a09_2pi_ecun.^2, windowlen));

  a09_2pi_ecr =   a092pi(4056:(end-4256),6);
  a09_2pi_ecrn =   a09_2pi_ecr/a09mvc_ecr;
  a09_2pi_ecrs = sqrt(movmean(a09_2pi_ecrn.^2, windowlen));

  a09_2pi_fcr =   a092pi(4056:(end-4256),8);
  a09_2pi_fcrn =   a09_2pi_fcr/a09mvc_fcr;
  a09_2pi_fcrs = sqrt(movmean(a09_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a093pi = xlsread('a09_pinch_Rep_3.19.xlsx');


  a09_3pi_ecu =   a093pi(4056:(end-4256),4);
  a09_3pi_ecun =   a09_3pi_ecu/a09mvc_ecu;
  a09_3pi_ecus = sqrt(movmean(a09_3pi_ecun.^2, windowlen));

  a09_3pi_ecr =   a093pi(4056:(end-4256),6);
  a09_3pi_ecrn =   a09_3pi_ecr/a09mvc_ecr;
  a09_3pi_ecrs = sqrt(movmean(a09_3pi_ecrn.^2, windowlen));

  a09_3pi_fcr =   a093pi(4056:(end-4256),8);
  a09_3pi_fcrn =   a09_3pi_fcr/a09mvc_fcr;
  a09_3pi_fcrs = sqrt(movmean(a09_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 


  a09_pi_ecu = (a09_1pi_ecus +   a09_2pi_ecus +   a09_3pi_ecus)/3;
 a09_pi_mean_ecu = mean( a09_pi_ecu)

figure(19);
subplot(3,1,1);
plot(a09_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(a09_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(a09_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(a09_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject a09');
 
ylabel('amplitude (mV)');

  a09_pi_ecr = (a09_1pi_ecrs +   a09_2pi_ecrs +   a09_3pi_ecrs)/3;
 a09_pi_mean_ecr = mean( a09_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a09_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a09_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a09_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a09_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


 a09_pi_fcr = (a09_1pi_fcrs +   a09_2pi_fcrs +   a09_3pi_fcrs)/3;
 a09_pi_mean_fcr = mean( a09_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a09_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a09_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a09_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a09_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a091pw = xlsread('a09_pour_water_Rep_1.8.xlsx');

  a09_1pw_ecu =   a091pw(417:(end-2000),4);
  a09_1pw_ecun =   a09_1pw_ecu/a09mvc_ecu; 
  a09_1pw_ecus = sqrt(movmean(a09_1pw_ecun.^2, windowlen)); 

  a09_1pw_ecr =   a091pw(417:(end-2000),6);
  a09_1pw_ecrn =   a09_1pw_ecr/a09mvc_ecr;
  a09_1pw_ecrs = sqrt(movmean(a09_1pw_ecrn.^2, windowlen)); 

  a09_1pw_fcr =   a091pw(417:(end-2000),8);
  a09_1pw_fcrn =   a09_1pw_fcr/a09mvc_fcr;
  a09_1pw_fcrs = sqrt(movmean(a09_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a092pw = xlsread('a09_pour_water_Rep_2.9.xlsx');

  a09_2pw_ecu =   a092pw(417:(end-2000),4);
  a09_2pw_ecun =   a09_2pw_ecu/a09mvc_ecu;
  a09_2pw_ecus = sqrt(movmean(a09_2pw_ecun.^2, windowlen));

  a09_2pw_ecr =   a092pw(417:(end-2000),6);
  a09_2pw_ecrn =   a09_2pw_ecr/a09mvc_ecr;
  a09_2pw_ecrs = sqrt(movmean(a09_2pw_ecrn.^2, windowlen));

  a09_2pw_fcr =   a092pw(417:(end-2000),8);
  a09_2pw_fcrn =   a09_2pw_fcr/a09mvc_fcr;
  a09_2pw_fcrs = sqrt(movmean(a09_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  a093pw = xlsread('a09_pour_water_Rep_3.10.xlsx');

  a09_3pw_ecu =   a093pw(417:(end-2000),4);
  a09_3pw_ecun =   a09_3pw_ecu/a09mvc_ecu;
  a09_3pw_ecus = sqrt(movmean(a09_3pw_ecun.^2, windowlen));

  a09_3pw_ecr =   a093pw(417:(end-2000),6);
  a09_3pw_ecrn =   a09_3pw_ecr/a09mvc_ecr;
  a09_3pw_ecrs = sqrt(movmean(a09_3pw_ecrn.^2, windowlen));

  a09_3pw_fcr =   a093pw(417:(end-2000),8);
  a09_3pw_fcrn =   a09_3pw_fcr/a09mvc_fcr;
  a09_3pw_fcrs = sqrt(movmean(a09_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 



 a09_pw_ecu = (a09_1pw_ecus +   a09_2pw_ecus +   a09_3pw_ecus)/3;
 a09_pw_mean_ecu = mean(a09_pw_ecu)

figure(27);
subplot(3,1,1);
plot(a09_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(a09_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(a09_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(a09_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject a09');
 
ylabel('amplitude (mV)');

  a09_pw_ecr = (a09_1pw_ecrs +   a09_2pw_ecrs +   a09_3pw_ecrs)/3;
 a09_pw_mean_ecr = mean( a09_pw_ecr)

figure(29);
subplot(3,1,1);
plot(a09_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(a09_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(a09_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(a09_pw_ecr);
title('pour water Extensor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');


 a09_pw_fcr = ( a09_1pw_fcrs +   a09_2pw_fcrs +   a09_3pw_fcrs)/3;
 a09_pw_mean_fcr = mean( a09_pw_fcr)

figure(31);
subplot(3,1,1);
plot(a09_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(a09_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(a09_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(a09_pw_fcr);
title('pour water Flexor Carpis Radialis Subject a09');
 
ylabel('amplitude (mV)');