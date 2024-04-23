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
max_force_a05 = 26.8

%% DATA READ FOR INDIVIDUAL a05

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  a05mvc_ed = mvc('a05_MVC_1_-_ED_-_bea_Rep_1.70.xlsx'); 
 
  a05mvc_ecu = mvc('a05_MVC_-_ECU_-_bea_Rep_1.71.xlsx');

  a05mvc_ecr = mvc('a05_MVC_-_ECR_-_bea_Rep_1.72.xlsx');

  a05mvc_fcr = mvc('a05_MVC_-_FCR_-_bea_Rep_1.73.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  a051fp = xlsread('a05_finger_point__Rep_1.77.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  a05_1fp_ed =   a051fp(4256:(end-4256),2);
  a05_1fp_edn =   a05_1fp_ed/a05mvc_ed; 
  a05_1fp_eds = sqrt(movmean(a05_1fp_edn.^2, windowlen)); 

  a05_1fp_ecu =   a051fp(4256:(end-4256),4);
  a05_1fp_ecun =   a05_1fp_ecu/a05mvc_ecu; 
  a05_1fp_ecus = sqrt(movmean(a05_1fp_ecun.^2, windowlen)); 

  a05_1fp_ecr =   a051fp(4256:(end-4256),6);
  a05_1fp_ecrn =   a05_1fp_ecr/a05mvc_ecr;
  a05_1fp_ecrs = sqrt(movmean(a05_1fp_ecrn.^2, windowlen)); 

  a05_1fp_fcr =   a051fp(4256:(end-4256),8);
  a05_1fp_fcrn =   a05_1fp_fcr/a05mvc_fcr;
  a05_1fp_fcrs = sqrt(movmean(a05_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a052fp = xlsread('a05_finger_point__Rep_2.78.xlsx');


  a05_2fp_ed =   a052fp(4256:(end-4256),2);
  a05_2fp_edn =   a05_2fp_ed/a05mvc_ed;
  a05_2fp_eds = sqrt(movmean(a05_2fp_edn.^2, windowlen)); 

  a05_2fp_ecu =   a052fp(4256:(end-4256),4);
  a05_2fp_ecun =   a05_2fp_ecu/a05mvc_ecu;
  a05_2fp_ecus = sqrt(movmean(a05_2fp_ecun.^2, windowlen));

  a05_2fp_ecr =   a052fp(4256:(end-4256),6);
  a05_2fp_ecrn =   a05_2fp_ecr/a05mvc_ecr;
  a05_2fp_ecrs = sqrt(movmean(a05_2fp_ecrn.^2, windowlen));

  a05_2fp_fcr =   a052fp(4256:(end-4256),8);
  a05_2fp_fcrn =   a05_2fp_fcr/a05mvc_fcr;
  a05_2fp_fcrs = sqrt(movmean(a05_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a053fp = xlsread('a05_finger_point__Rep_4.80.xlsx');


  a05_3fp_ed =   a053fp(4256:(end-4256),2);
  a05_3fp_edn =   a05_3fp_ed/a05mvc_ed;
  a05_3fp_eds = sqrt(movmean(a05_3fp_edn.^2, windowlen));

  a05_3fp_ecu =   a053fp(4256:(end-4256),4);
  a05_3fp_ecun =   a05_3fp_ecu/a05mvc_ecu;
  a05_3fp_ecus = sqrt(movmean(a05_3fp_ecun.^2, windowlen));

  a05_3fp_ecr =   a053fp(4256:(end-4256),6);
  a05_3fp_ecrn =   a05_3fp_ecr/a05mvc_ecr;
  a05_3fp_ecrs = sqrt(movmean(a05_3fp_ecrn.^2, windowlen));

  a05_3fp_fcr =   a053fp(4256:(end-4256),8);
  a05_3fp_fcrn =   a05_3fp_fcr/a05mvc_fcr;
  a05_3fp_fcrs = sqrt(movmean(a05_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  a05_fp_ed = (a05_1fp_eds +   a05_2fp_eds +   a05_3fp_eds)/3;
 a05_fp_mean_ed = mean( a05_fp_ed)

figure(1);
subplot(3,1,1);
plot(a05_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(a05_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(a05_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (a05_fp_ed);
title('Finger point Extensor Digitorium Subject a05');
 
ylabel('amplitude (mV)');

  a05_fp_ecu = (a05_1fp_ecus +   a05_2fp_ecus)/2;
 a05_fp_mean_ecu = mean( a05_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a05_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a05_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a05_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a05_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject a05');
 
ylabel('amplitude (mV)');

  a05_fp_ecr = (a05_1fp_ecrs +   a05_2fp_ecrs +   a05_3fp_ecrs)/3;
 a05_fp_mean_ecr = mean( a05_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a05_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a05_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a05_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a05_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


  a05_fp_fcr = (a05_1fp_fcrs +   a05_2fp_fcrs +   a05_3fp_fcrs)/3;
 a05_fp_mean_fcr = mean( a05_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a05_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a05_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a05_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a05_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a051ne = xlsread('a05_neutral_Rep_2.82.xlsx');


  a05_1ne_ed =   a051ne(4056:(end-4056),2);
  a05_1ne_edn =   a05_1ne_ed/a05mvc_ed; 
  a05_1ne_eds = sqrt(movmean(a05_1ne_edn.^2, windowlen)); 

  a05_1ne_ecu =   a051ne(4056:(end-4056),4);
  a05_1ne_ecun =   a05_1ne_ecu/a05mvc_ecu; 
  a05_1ne_ecus = sqrt(movmean(a05_1ne_ecun.^2, windowlen)); 

  a05_1ne_ecr =   a051ne(4056:(end-4056),6);
  a05_1ne_ecrn =   a05_1ne_ecr/a05mvc_ecr;
  a05_1ne_ecrs = sqrt(movmean(a05_1ne_ecrn.^2, windowlen)); 

  a05_1ne_fcr =   a051ne(4056:(end-4056),8);
  a05_1ne_fcrn =   a05_1ne_fcr/a05mvc_fcr;
  a05_1ne_fcrs = sqrt(movmean(a05_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a052ne = xlsread('a05_neutral_Rep_3.83.xlsx');


  a05_2ne_ed =   a052ne(4056:(end-4056),2);
  a05_2ne_edn =   a05_2ne_ed/a05mvc_ed;
  a05_2ne_eds = sqrt(movmean(a05_2ne_edn.^2, windowlen)); 

  a05_2ne_ecu =   a052ne(4056:(end-4056),4);
  a05_2ne_ecun =   a05_2ne_ecu/a05mvc_ecu;
  a05_2ne_ecus = sqrt(movmean(a05_2ne_ecun.^2, windowlen));

  a05_2ne_ecr =   a052ne(4056:(end-4056),6);
  a05_2ne_ecrn =   a05_2ne_ecr/a05mvc_ecr;
  a05_2ne_ecrs = sqrt(movmean(a05_2ne_ecrn.^2, windowlen));

  a05_2ne_fcr =   a052ne(4056:(end-4056),8);
  a05_2ne_fcrn =   a05_2ne_fcr/a05mvc_fcr;
  a05_2ne_fcrs = sqrt(movmean(a05_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  a053ne = xlsread('a05_neutral_Rep_4.84.xlsx');


  a05_3ne_ed =   a053ne(4056:(end-4056),2);
  a05_3ne_edn =   a05_3ne_ed/a05mvc_ed;
  a05_3ne_eds = sqrt(movmean(a05_3ne_edn.^2, windowlen));

  a05_3ne_ecu =   a053ne(4056:(end-4056),4);
  a05_3ne_ecun =   a05_3ne_ecu/a05mvc_ecu;
  a05_3ne_ecus = sqrt(movmean(a05_3ne_ecun.^2, windowlen));

  a05_3ne_ecr =   a053ne(4056:(end-4056),6);
  a05_3ne_ecrn =   a05_3ne_ecr/a05mvc_ecr;
  a05_3ne_ecrs = sqrt(movmean(a05_3ne_ecrn.^2, windowlen));

  a05_3ne_fcr =   a053ne(4056:(end-4056),8);
  a05_3ne_fcrn =   a05_3ne_fcr/a05mvc_fcr;
  a05_3ne_fcrs = sqrt(movmean(a05_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a05_ne_ed = (a05_1ne_eds +   a05_2ne_eds +   a05_3ne_eds)/3;
 a05_ne_mean_ed = mean( a05_ne_ed)

figure(9);
subplot(3,1,1);
plot(a05_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a05_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a05_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(a05_ne_ed);
title('Neutral position Extensor Digitorium Subject a05');
 
ylabel('amplitude (mV)');

  a05_ne_ecu = (a05_1ne_ecus +   a05_2ne_ecus +   a05_3ne_ecus)/3;
 a05_ne_mean_ecu = mean( a05_ne_ecu)

figure(11);
subplot(3,1,1);
plot(a05_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(a05_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(a05_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(a05_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject a05');
 
ylabel('amplitude (mV)');

  a05_ne_ecr = (a05_1ne_ecrs +   a05_2ne_ecrs +   a05_3ne_ecrs)/3;
 a05_ne_mean_ecr = mean( a05_ne_ecr)

figure(13);
subplot(3,1,1);
plot(a05_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(a05_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(a05_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(a05_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


  a05_ne_fcr = (a05_1ne_fcrs +   a05_2ne_fcrs +   a05_3ne_fcrs)/3;
 a05_ne_mean_fcr = mean( a05_ne_fcr)

figure(15);
subplot(3,1,1);
plot(a05_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(a05_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(a05_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(a05_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a051pi = xlsread('a05_pinch_Rep_1.85.xlsx');


  a05_1pi_ed =   a051pi(4056:(end-4256),2);
  a05_1pi_edn =   a05_1pi_ed/a05mvc_ed; 
  a05_1pi_eds = sqrt(movmean(a05_1pi_edn.^2, windowlen)); 

  a05_1pi_ecu =   a051pi(4056:(end-4256),4);
  a05_1pi_ecun =   a05_1pi_ecu/a05mvc_ecu; 
  a05_1pi_ecus = sqrt(movmean(a05_1pi_ecun.^2, windowlen)); 

  a05_1pi_ecr =   a051pi(4056:(end-4256),6);
  a05_1pi_ecrn =   a05_1pi_ecr/a05mvc_ecr;
  a05_1pi_ecrs = sqrt(movmean(a05_1pi_ecrn.^2, windowlen)); 

  a05_1pi_fcr =   a051pi(4056:(end-4256),8);
  a05_1pi_fcrn =   a05_1pi_fcr/a05mvc_fcr;
  a05_1pi_fcrs = sqrt(movmean(a05_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a052pi = xlsread('a05_pinch_Rep_2.86.xlsx');


  a05_2pi_ed =   a052pi(4056:(end-4256),2);
  a05_2pi_edn =   a05_2pi_ed/a05mvc_ed;
  a05_2pi_eds = sqrt(movmean(a05_2pi_edn.^2, windowlen)); 

  a05_2pi_ecu =   a052pi(4056:(end-4256),4);
  a05_2pi_ecun =   a05_2pi_ecu/a05mvc_ecu;
  a05_2pi_ecus = sqrt(movmean(a05_2pi_ecun.^2, windowlen));

  a05_2pi_ecr =   a052pi(4056:(end-4256),6);
  a05_2pi_ecrn =   a05_2pi_ecr/a05mvc_ecr;
  a05_2pi_ecrs = sqrt(movmean(a05_2pi_ecrn.^2, windowlen));

  a05_2pi_fcr =   a052pi(4056:(end-4256),8);
  a05_2pi_fcrn =   a05_2pi_fcr/a05mvc_fcr;
  a05_2pi_fcrs = sqrt(movmean(a05_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a053pi = xlsread('a05_pinch_Rep_3.87.xlsx');


  a05_3pi_ed =   a053pi(4056:(end-4256),2);
  a05_3pi_edn =   a05_3pi_ed/a05mvc_ed;
  a05_3pi_eds = sqrt(movmean(a05_3pi_edn.^2, windowlen));

  a05_3pi_ecu =   a053pi(4056:(end-4256),4);
  a05_3pi_ecun =   a05_3pi_ecu/a05mvc_ecu;
  a05_3pi_ecus = sqrt(movmean(a05_3pi_ecun.^2, windowlen));

  a05_3pi_ecr =   a053pi(4056:(end-4256),6);
  a05_3pi_ecrn =   a05_3pi_ecr/a05mvc_ecr;
  a05_3pi_ecrs = sqrt(movmean(a05_3pi_ecrn.^2, windowlen));

  a05_3pi_fcr =   a053pi(4056:(end-4256),8);
  a05_3pi_fcrn =   a05_3pi_fcr/a05mvc_fcr;
  a05_3pi_fcrs = sqrt(movmean(a05_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a05_pi_ed = (a05_1pi_eds +   a05_2pi_eds +   a05_3pi_eds)/3;
 a05_pi_mean_ed = mean( a05_pi_ed)

figure(17);
subplot(3,1,1);
plot(a05_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a05_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a05_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(a05_pi_ed);
title('pinch position Extensor Digitorium Subject a05');
 
ylabel('amplitude (mV)');

  a05_pi_ecu = (a05_1pi_ecus +   a05_2pi_ecus +   a05_3pi_ecus)/3;
 a05_pi_mean_ecu = mean( a05_pi_ecu)

figure(19);
subplot(3,1,1);
plot(a05_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(a05_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(a05_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(a05_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject a05');
 
ylabel('amplitude (mV)');

  a05_pi_ecr = (a05_1pi_ecrs +   a05_2pi_ecrs +   a05_3pi_ecrs)/3;
 a05_pi_mean_ecr = mean( a05_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a05_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a05_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a05_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a05_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


 a05_pi_fcr = (a05_1pi_fcrs +   a05_2pi_fcrs +   a05_3pi_fcrs)/3;
 a05_pi_mean_fcr = mean( a05_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a05_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a05_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a05_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a05_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a051pw = xlsread('a05_pour_water_Rep_1.74.xlsx');


  a05_1pw_ed =   a051pw(417:(end-2000),2);
  a05_1pw_edn =   a05_1pw_ed/a05mvc_ed; 
  a05_1pw_eds = sqrt(movmean(a05_1pw_edn.^2, windowlen)); 

  a05_1pw_ecu =   a051pw(417:(end-2000),4);
  a05_1pw_ecun =   a05_1pw_ecu/a05mvc_ecu; 
  a05_1pw_ecus = sqrt(movmean(a05_1pw_ecun.^2, windowlen)); 

  a05_1pw_ecr =   a051pw(417:(end-2000),6);
  a05_1pw_ecrn =   a05_1pw_ecr/a05mvc_ecr;
  a05_1pw_ecrs = sqrt(movmean(a05_1pw_ecrn.^2, windowlen)); 

  a05_1pw_fcr =   a051pw(417:(end-2000),8);
  a05_1pw_fcrn =   a05_1pw_fcr/a05mvc_fcr;
  a05_1pw_fcrs = sqrt(movmean(a05_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a052pw = xlsread('a05_pour_water_Rep_2.75.xlsx');


  a05_2pw_ed =   a052pw(417:(end-2000),2);
  a05_2pw_edn =   a05_2pw_ed/a05mvc_ed;
  a05_2pw_eds = sqrt(movmean(a05_2pw_edn.^2, windowlen)); 

  a05_2pw_ecu =   a052pw(417:(end-2000),4);
  a05_2pw_ecun =   a05_2pw_ecu/a05mvc_ecu;
  a05_2pw_ecus = sqrt(movmean(a05_2pw_ecun.^2, windowlen));

  a05_2pw_ecr =   a052pw(417:(end-2000),6);
  a05_2pw_ecrn =   a05_2pw_ecr/a05mvc_ecr;
  a05_2pw_ecrs = sqrt(movmean(a05_2pw_ecrn.^2, windowlen));

  a05_2pw_fcr =   a052pw(417:(end-2000),8);
  a05_2pw_fcrn =   a05_2pw_fcr/a05mvc_fcr;
  a05_2pw_fcrs = sqrt(movmean(a05_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  a053pw = xlsread('a05_pour_water_Rep_3.76.xlsx');


  a05_3pw_ed =   a053pw(417:(end-2000),2);
  a05_3pw_edn =   a05_3pw_ed/a05mvc_ed;
  a05_3pw_eds = sqrt(movmean(a05_3pw_edn.^2, windowlen));

  a05_3pw_ecu =   a053pw(417:(end-2000),4);
  a05_3pw_ecun =   a05_3pw_ecu/a05mvc_ecu;
  a05_3pw_ecus = sqrt(movmean(a05_3pw_ecun.^2, windowlen));

  a05_3pw_ecr =   a053pw(417:(end-2000),6);
  a05_3pw_ecrn =   a05_3pw_ecr/a05mvc_ecr;
  a05_3pw_ecrs = sqrt(movmean(a05_3pw_ecrn.^2, windowlen));

  a05_3pw_fcr =   a053pw(417:(end-2000),8);
  a05_3pw_fcrn =   a05_3pw_fcr/a05mvc_fcr;
  a05_3pw_fcrs = sqrt(movmean(a05_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 a05_pw_ed = (a05_1pw_eds +   a05_2pw_eds +   a05_3pw_eds)/3;
 a05_pw_mean_ed = mean( a05_pw_ed)

figure(25);
subplot(3,1,1);
plot(a05_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(a05_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(a05_3pw_eds);
title('pour water ED 3');

figure(26);
plot(a05_pw_ed);
title('pour water Extensor Digitorium Subject a05');
 
ylabel('amplitude (mV)');

 a05_pw_ecu = (a05_1pw_ecus +   a05_2pw_ecus +   a05_3pw_ecus)/3;
 a05_pw_mean_ecu = mean(a05_pw_ecu)

figure(27);
subplot(3,1,1);
plot(a05_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(a05_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(a05_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(a05_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject a05');
 
ylabel('amplitude (mV)');

  a05_pw_ecr = (a05_1pw_ecrs +   a05_2pw_ecrs +   a05_3pw_ecrs)/3;
 a05_pw_mean_ecr = mean( a05_pw_ecr)

figure(29);
subplot(3,1,1);
plot(a05_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(a05_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(a05_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(a05_pw_ecr);
title('pour water Extensor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');


 a05_pw_fcr = ( a05_1pw_fcrs +   a05_2pw_fcrs +   a05_3pw_fcrs)/3;
 a05_pw_mean_fcr = mean( a05_pw_fcr)

figure(31);
subplot(3,1,1);
plot(a05_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(a05_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(a05_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(a05_pw_fcr);
title('pour water Flexor Carpis Radialis Subject a05');
 
ylabel('amplitude (mV)');