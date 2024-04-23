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
max_force_b07 = 48.8

%% DATA READ FOR INDIVIDUAL b07

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  b07mvc_ed = mvc('b07_MVC_1_-_ED_-_bea_Rep_1.20.xlsx'); 


  b07mvc_ecu = mvc('b07_MVC_-_ECU_-_bea_Rep_1.21.xlsx');


  b07mvc_ecr = mvc('b07_MVC_-_ECR_-_bea_Rep_1.22.xlsx');


  b07mvc_fcr = mvc('b07_MVC_-_FCR_-_bea_Rep_1.23.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  b071fp = xlsread('b07_finger_point__Rep_1.27.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  b07_1fp_ed =   b071fp(4256:(end-4256),2);
  b07_1fp_edn =   b07_1fp_ed/b07mvc_ed; 
  b07_1fp_eds = sqrt(movmean(b07_1fp_edn.^2, windowlen)); 

  b07_1fp_ecu =   b071fp(4256:(end-4256),4);
  b07_1fp_ecun =   b07_1fp_ecu/b07mvc_ecu; 
  b07_1fp_ecus = sqrt(movmean(b07_1fp_ecun.^2, windowlen)); 

  b07_1fp_ecr =   b071fp(4256:(end-4256),6);
  b07_1fp_ecrn =   b07_1fp_ecr/b07mvc_ecr;
  b07_1fp_ecrs = sqrt(movmean(b07_1fp_ecrn.^2, windowlen)); 

  b07_1fp_fcr =   b071fp(4256:(end-4256),8);
  b07_1fp_fcrn =   b07_1fp_fcr/b07mvc_fcr;
  b07_1fp_fcrs = sqrt(movmean(b07_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  b072fp = xlsread('b07_finger_point__Rep_2.28.xlsx');


  b07_2fp_ed =   b072fp(4256:(end-4256),2);
  b07_2fp_edn =   b07_2fp_ed/b07mvc_ed;
  b07_2fp_eds = sqrt(movmean(b07_2fp_edn.^2, windowlen)); 

  b07_2fp_ecu =   b072fp(4256:(end-4256),4);
  b07_2fp_ecun =   b07_2fp_ecu/b07mvc_ecu;
  b07_2fp_ecus = sqrt(movmean(b07_2fp_ecun.^2, windowlen));

  b07_2fp_ecr =   b072fp(4256:(end-4256),6);
  b07_2fp_ecrn =   b07_2fp_ecr/b07mvc_ecr;
  b07_2fp_ecrs = sqrt(movmean(b07_2fp_ecrn.^2, windowlen));

  b07_2fp_fcr =   b072fp(4256:(end-4256),8);
  b07_2fp_fcrn =   b07_2fp_fcr/b07mvc_fcr;
  b07_2fp_fcrs = sqrt(movmean(b07_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  b073fp = xlsread('b07_finger_point__Rep_3.29.xlsx');


  b07_3fp_ed =   b073fp(4256:(end-4256),2);
  b07_3fp_edn =   b07_3fp_ed/b07mvc_ed;
  b07_3fp_eds = sqrt(movmean(b07_3fp_edn.^2, windowlen));

  b07_3fp_ecu =   b073fp(4256:(end-4256),4);
  b07_3fp_ecun =   b07_3fp_ecu/b07mvc_ecu;
  b07_3fp_ecus = sqrt(movmean(b07_3fp_ecun.^2, windowlen));

  b07_3fp_ecr =   b073fp(4256:(end-4256),6);
  b07_3fp_ecrn =   b07_3fp_ecr/b07mvc_ecr;
  b07_3fp_ecrs = sqrt(movmean(b07_3fp_ecrn.^2, windowlen));

  b07_3fp_fcr =   b073fp(4256:(end-4256),8);
  b07_3fp_fcrn =   b07_3fp_fcr/b07mvc_fcr;
  b07_3fp_fcrs = sqrt(movmean(b07_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  b07_fp_ed = (b07_1fp_eds +   b07_2fp_eds +   b07_3fp_eds)/3;
 b07_fp_mean_ed = mean( b07_fp_ed)

figure(1);
subplot(3,1,1);
plot(b07_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(b07_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(b07_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (b07_fp_ed);
title('Finger point Extensor Digitorium Subject b07');
 
ylabel('amplitude (mV)');

  b07_fp_ecu = (b07_1fp_ecus +   b07_2fp_ecus +   b07_3fp_ecus)/3;
 b07_fp_mean_ecu = mean( b07_fp_ecu)

figure(3);
subplot(3,1,1);
plot(b07_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(b07_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(b07_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (b07_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject b07');
 
ylabel('amplitude (mV)');

  b07_fp_ecr = (b07_1fp_ecrs +   b07_2fp_ecrs +   b07_3fp_ecrs)/3;
 b07_fp_mean_ecr = mean( b07_fp_ecr)

figure(5);
subplot(3,1,1);
plot(b07_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(b07_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(b07_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (b07_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


  b07_fp_fcr = (b07_1fp_fcrs +   b07_2fp_fcrs +   b07_3fp_fcrs)/3;
 b07_fp_mean_fcr = mean( b07_fp_fcr)

figure(7);
subplot(3,1,1);
plot(b07_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(b07_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(b07_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (b07_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  b071ne = xlsread('b07_neutral_Rep_1.30.xlsx');


  b07_1ne_ed =   b071ne(4056:(end-4056),2);
  b07_1ne_edn =   b07_1ne_ed/b07mvc_ed; 
  b07_1ne_eds = sqrt(movmean(b07_1ne_edn.^2, windowlen)); 

  b07_1ne_ecu =   b071ne(4056:(end-4056),4);
  b07_1ne_ecun =   b07_1ne_ecu/b07mvc_ecu; 
  b07_1ne_ecus = sqrt(movmean(b07_1ne_ecun.^2, windowlen)); 

  b07_1ne_ecr =   b071ne(4056:(end-4056),6);
  b07_1ne_ecrn =   b07_1ne_ecr/b07mvc_ecr;
  b07_1ne_ecrs = sqrt(movmean(b07_1ne_ecrn.^2, windowlen)); 

  b07_1ne_fcr =   b071ne(4056:(end-4056),8);
  b07_1ne_fcrn =   b07_1ne_fcr/b07mvc_fcr;
  b07_1ne_fcrs = sqrt(movmean(b07_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  b072ne = xlsread('b07_neutral_Rep_2.31.xlsx');


  b07_2ne_ed =   b072ne(4056:(end-4056),2);
  b07_2ne_edn =   b07_2ne_ed/b07mvc_ed;
  b07_2ne_eds = sqrt(movmean(b07_2ne_edn.^2, windowlen)); 

  b07_2ne_ecu =   b072ne(4056:(end-4056),4);
  b07_2ne_ecun =   b07_2ne_ecu/b07mvc_ecu;
  b07_2ne_ecus = sqrt(movmean(b07_2ne_ecun.^2, windowlen));

  b07_2ne_ecr =   b072ne(4056:(end-4056),6);
  b07_2ne_ecrn =   b07_2ne_ecr/b07mvc_ecr;
  b07_2ne_ecrs = sqrt(movmean(b07_2ne_ecrn.^2, windowlen));

  b07_2ne_fcr =   b072ne(4056:(end-4056),8);
  b07_2ne_fcrn =   b07_2ne_fcr/b07mvc_fcr;
  b07_2ne_fcrs = sqrt(movmean(b07_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  b073ne = xlsread('b07_neutral_Rep_3.32.xlsx');


  b07_3ne_ed =   b073ne(4056:(end-4056),2);
  b07_3ne_edn =   b07_3ne_ed/b07mvc_ed;
  b07_3ne_eds = sqrt(movmean(b07_3ne_edn.^2, windowlen));

  b07_3ne_ecu =   b073ne(4056:(end-4056),4);
  b07_3ne_ecun =   b07_3ne_ecu/b07mvc_ecu;
  b07_3ne_ecus = sqrt(movmean(b07_3ne_ecun.^2, windowlen));

  b07_3ne_ecr =   b073ne(4056:(end-4056),6);
  b07_3ne_ecrn =   b07_3ne_ecr/b07mvc_ecr;
  b07_3ne_ecrs = sqrt(movmean(b07_3ne_ecrn.^2, windowlen));

  b07_3ne_fcr =   b073ne(4056:(end-4056),8);
  b07_3ne_fcrn =   b07_3ne_fcr/b07mvc_fcr;
  b07_3ne_fcrs = sqrt(movmean(b07_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b07_ne_ed = (b07_1ne_eds +   b07_2ne_eds +   b07_3ne_eds)/3;
 b07_ne_mean_ed = mean( b07_ne_ed)

figure(9);
subplot(3,1,1);
plot(b07_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b07_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b07_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(b07_ne_ed);
title('Neutral position Extensor Digitorium Subject b07');
 
ylabel('amplitude (mV)');

  b07_ne_ecu = (b07_1ne_ecus +   b07_2ne_ecus +   b07_3ne_ecus)/3;
 b07_ne_mean_ecu = mean( b07_ne_ecu)

figure(11);
subplot(3,1,1);
plot(b07_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(b07_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(b07_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(b07_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject b07');
 
ylabel('amplitude (mV)');

  b07_ne_ecr = (b07_1ne_ecrs +   b07_2ne_ecrs +   b07_3ne_ecrs)/3;
 b07_ne_mean_ecr = mean( b07_ne_ecr)

figure(13);
subplot(3,1,1);
plot(b07_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(b07_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(b07_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(b07_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


  b07_ne_fcr = (b07_1ne_fcrs +   b07_2ne_fcrs +   b07_3ne_fcrs)/3;
 b07_ne_mean_fcr = mean( b07_ne_fcr)

figure(15);
subplot(3,1,1);
plot(b07_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(b07_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(b07_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(b07_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  b071pi = xlsread('b07_pinch_Rep_1.33.xlsx');


  b07_1pi_ed =   b071pi(4056:(end-4256),2);
  b07_1pi_edn =   b07_1pi_ed/b07mvc_ed; 
  b07_1pi_eds = sqrt(movmean(b07_1pi_edn.^2, windowlen)); 

  b07_1pi_ecu =   b071pi(4056:(end-4256),4);
  b07_1pi_ecun =   b07_1pi_ecu/b07mvc_ecu; 
  b07_1pi_ecus = sqrt(movmean(b07_1pi_ecun.^2, windowlen)); 

  b07_1pi_ecr =   b071pi(4056:(end-4256),6);
  b07_1pi_ecrn =   b07_1pi_ecr/b07mvc_ecr;
  b07_1pi_ecrs = sqrt(movmean(b07_1pi_ecrn.^2, windowlen)); 

  b07_1pi_fcr =   b071pi(4056:(end-4256),8);
  b07_1pi_fcrn =   b07_1pi_fcr/b07mvc_fcr;
  b07_1pi_fcrs = sqrt(movmean(b07_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  b072pi = xlsread('b07_pinch_Rep_2.34.xlsx');


  b07_2pi_ed =   b072pi(4056:(end-4256),2);
  b07_2pi_edn =   b07_2pi_ed/b07mvc_ed;
  b07_2pi_eds = sqrt(movmean(b07_2pi_edn.^2, windowlen)); 

  b07_2pi_ecu =   b072pi(4056:(end-4256),4);
  b07_2pi_ecun =   b07_2pi_ecu/b07mvc_ecu;
  b07_2pi_ecus = sqrt(movmean(b07_2pi_ecun.^2, windowlen));

  b07_2pi_ecr =   b072pi(4056:(end-4256),6);
  b07_2pi_ecrn =   b07_2pi_ecr/b07mvc_ecr;
  b07_2pi_ecrs = sqrt(movmean(b07_2pi_ecrn.^2, windowlen));

  b07_2pi_fcr =   b072pi(4056:(end-4256),8);
  b07_2pi_fcrn =   b07_2pi_fcr/b07mvc_fcr;
  b07_2pi_fcrs = sqrt(movmean(b07_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  b073pi = xlsread('b07_pinch_Rep_3.35.xlsx');


  b07_3pi_ed =   b073pi(4056:(end-4256),2);
  b07_3pi_edn =   b07_3pi_ed/b07mvc_ed;
  b07_3pi_eds = sqrt(movmean(b07_3pi_edn.^2, windowlen));

  b07_3pi_ecu =   b073pi(4056:(end-4256),4);
  b07_3pi_ecun =   b07_3pi_ecu/b07mvc_ecu;
  b07_3pi_ecus = sqrt(movmean(b07_3pi_ecun.^2, windowlen));

  b07_3pi_ecr =   b073pi(4056:(end-4256),6);
  b07_3pi_ecrn =   b07_3pi_ecr/b07mvc_ecr;
  b07_3pi_ecrs = sqrt(movmean(b07_3pi_ecrn.^2, windowlen));

  b07_3pi_fcr =   b073pi(4056:(end-4256),8);
  b07_3pi_fcrn =   b07_3pi_fcr/b07mvc_fcr;
  b07_3pi_fcrs = sqrt(movmean(b07_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b07_pi_ed = (b07_1pi_eds +   b07_2pi_eds +   b07_3pi_eds)/3;
 b07_pi_mean_ed = mean( b07_pi_ed)

figure(17);
subplot(3,1,1);
plot(b07_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b07_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b07_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(b07_pi_ed);
title('pinch position Extensor Digitorium Subject b07');
 
ylabel('amplitude (mV)');

  b07_pi_ecu = (b07_1pi_ecus +   b07_2pi_ecus +   b07_3pi_ecus)/3;
 b07_pi_mean_ecu = mean( b07_pi_ecu)

figure(19);
subplot(3,1,1);
plot(b07_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(b07_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(b07_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(b07_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject b07');
 
ylabel('amplitude (mV)');

  b07_pi_ecr = (b07_1pi_ecrs +   b07_2pi_ecrs +   b07_3pi_ecrs)/3;
 b07_pi_mean_ecr = mean( b07_pi_ecr)

figure(21);
subplot(3,1,1);
plot(b07_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(b07_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(b07_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(b07_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


 b07_pi_fcr = (b07_1pi_fcrs +   b07_2pi_fcrs +   b07_3pi_fcrs)/3;
 b07_pi_mean_fcr = mean( b07_pi_fcr)

figure(23);
subplot(3,1,1);
plot(b07_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(b07_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(b07_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(b07_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  b071pw = xlsread('b07_pour_water_Rep_1.24.xlsx');


  b07_1pw_ed =   b071pw(417:(end-2000),2);
  b07_1pw_edn =   b07_1pw_ed/b07mvc_ed; 
  b07_1pw_eds = sqrt(movmean(b07_1pw_edn.^2, windowlen)); 

  b07_1pw_ecu =   b071pw(417:(end-2000),4);
  b07_1pw_ecun =   b07_1pw_ecu/b07mvc_ecu; 
  b07_1pw_ecus = sqrt(movmean(b07_1pw_ecun.^2, windowlen)); 

  b07_1pw_ecr =   b071pw(417:(end-2000),6);
  b07_1pw_ecrn =   b07_1pw_ecr/b07mvc_ecr;
  b07_1pw_ecrs = sqrt(movmean(b07_1pw_ecrn.^2, windowlen)); 

  b07_1pw_fcr =   b071pw(417:(end-2000),8);
  b07_1pw_fcrn =   b07_1pw_fcr/b07mvc_fcr;
  b07_1pw_fcrs = sqrt(movmean(b07_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  b072pw = xlsread('b07_pour_water_Rep_2.25.xlsx');


  b07_2pw_ed =   b072pw(417:(end-2000),2);
  b07_2pw_edn =   b07_2pw_ed/b07mvc_ed;
  b07_2pw_eds = sqrt(movmean(b07_2pw_edn.^2, windowlen)); 

  b07_2pw_ecu =   b072pw(417:(end-2000),4);
  b07_2pw_ecun =   b07_2pw_ecu/b07mvc_ecu;
  b07_2pw_ecus = sqrt(movmean(b07_2pw_ecun.^2, windowlen));

  b07_2pw_ecr =   b072pw(417:(end-2000),6);
  b07_2pw_ecrn =   b07_2pw_ecr/b07mvc_ecr;
  b07_2pw_ecrs = sqrt(movmean(b07_2pw_ecrn.^2, windowlen));

  b07_2pw_fcr =   b072pw(417:(end-2000),8);
  b07_2pw_fcrn =   b07_2pw_fcr/b07mvc_fcr;
  b07_2pw_fcrs = sqrt(movmean(b07_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  b073pw = xlsread('b07_pour_water_Rep_3.26.xlsx');


  b07_3pw_ed =   b073pw(417:(end-2000),2);
  b07_3pw_edn =   b07_3pw_ed/b07mvc_ed;
  b07_3pw_eds = sqrt(movmean(b07_3pw_edn.^2, windowlen));

  b07_3pw_ecu =   b073pw(417:(end-2000),4);
  b07_3pw_ecun =   b07_3pw_ecu/b07mvc_ecu;
  b07_3pw_ecus = sqrt(movmean(b07_3pw_ecun.^2, windowlen));

  b07_3pw_ecr =   b073pw(417:(end-2000),6);
  b07_3pw_ecrn =   b07_3pw_ecr/b07mvc_ecr;
  b07_3pw_ecrs = sqrt(movmean(b07_3pw_ecrn.^2, windowlen));

  b07_3pw_fcr =   b073pw(417:(end-2000),8);
  b07_3pw_fcrn =   b07_3pw_fcr/b07mvc_fcr;
  b07_3pw_fcrs = sqrt(movmean(b07_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 b07_pw_ed = (b07_1pw_eds +   b07_2pw_eds +   b07_3pw_eds)/3;
 b07_pw_mean_ed = mean( b07_pw_ed)

figure(25);
subplot(3,1,1);
plot(b07_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(b07_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(b07_3pw_eds);
title('pour water ED 3');

figure(26);
plot(b07_pw_ed);
title('pour water Extensor Digitorium Subject b07');
 
ylabel('amplitude (mV)');

 b07_pw_ecu = (b07_1pw_ecus +   b07_2pw_ecus +   b07_3pw_ecus)/3;
 b07_pw_mean_ecu = mean(b07_pw_ecu)

figure(27);
subplot(3,1,1);
plot(b07_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(b07_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(b07_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(b07_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject b07');
 
ylabel('amplitude (mV)');

  b07_pw_ecr = (b07_1pw_ecrs +   b07_2pw_ecrs +   b07_3pw_ecrs)/3;
 b07_pw_mean_ecr = mean( b07_pw_ecr)

figure(29);
subplot(3,1,1);
plot(b07_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(b07_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(b07_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(b07_pw_ecr);
title('pour water Extensor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');


 b07_pw_fcr = ( b07_1pw_fcrs +   b07_2pw_fcrs +   b07_3pw_fcrs)/3;
 b07_pw_mean_fcr = mean( b07_pw_fcr)

figure(31);
subplot(3,1,1);
plot(b07_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(b07_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(b07_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(b07_pw_fcr);
title('pour water Flexor Carpis Radialis Subject b07');
 
ylabel('amplitude (mV)');