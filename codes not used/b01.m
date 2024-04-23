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
max_force_b01 = 63.4

%% DATA READ FOR INDIVIDUAL b01

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  b01mvc_ed = mvc('b01_MVC_1_-_ED_-_bea_Rep_1.23.xlsx');  

  b01mvc_ecu = mvc('b01_MVC_-_ECU_-_bea_Rep_1.24.xlsx');

  b01mvc_ecr = mvc('b01_MVC_-_ECR_-_bea_Rep_1.25.xlsx');

  b01mvc_fcr = mvc('b01_MVC_-_FCR_-_bea_Rep_1.26.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  b011fp = xlsread('b01_finger_point__Rep_1.30.xlsx');
  b01_1fp_ed =  b011fp(4256:(end-4256),2);
  b01_2fp_ecu = b013fp(4256:(end-4256),4);
  b01_1fp_ecr = b011fp(4256:(end-4256),6);
  b01_1fp_fcr = b011fp(4256:(end-4256),8);
  b012fp = xlsread('b01_finger_point__Rep_2.31.xlsx');
  b01_2fp_ed =  b012fp(4256:(end-4256),2);
  b01_2fp_ecu = b013fp(4256:(end-4256),4);
  b01_2fp_ecr = b012fp(4256:(end-4256),6);
  b01_2fp_fcr = b012fp(4256:(end-4256),8);
  b013fp = xlsread('b01_finger_point__Rep_3.32.xlsx');
  b01_3fp_ed =  b013fp(4256:(end-4256),2);
  b01_3fp_ecu = b013fp(4256:(end-4256),4);
  b01_3fp_ecr = b013fp(4256:(end-4256),6);
  b01_3fp_fcr = b013fp(4256:(end-4256),8);


  fp_mean_ecr = rep('b01_finger_point__Rep_1.30.xlsx','b01_finger_point__Rep_2.31.xlsx','b01_finger_point__Rep_3.32.xlsx',6);

  fp_mean_fcr = rep('b01_finger_point__Rep_1.30.xlsx','b01_finger_point__Rep_2.31.xlsx','b01_finger_point__Rep_3.32.xlsx',8);
  

% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


 
  b01_1fp_edn =   b01_1fp_ed/b01mvc_ed; 
  b01_1fp_eds = sqrt(movmean(b01_1fp_edn.^2, windowlen)); 

  b01_1fp_ecu =   b011fp(4256:(end-4256),4);
  b01_1fp_ecun =   b01_1fp_ecu/b01mvc_ecu; 
  b01_1fp_ecus = sqrt(movmean(b01_1fp_ecun.^2, windowlen)); 

  
  b01_1fp_ecrn =   b01_1fp_ecr/fp_mean_ecr;
  b01_1fp_ecrs = sqrt(movmean(b01_1fp_ecrn.^2, windowlen)); 

  
  b01_1fp_fcrn =   b01_1fp_fcr/fp_mean_fcr;
  b01_1fp_fcrs = sqrt(movmean(b01_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

 
  b01_2fp_edn =   b01_2fp_ed/b01mvc_ed;
  b01_2fp_eds = sqrt(movmean(b01_2fp_edn.^2, windowlen)); 

  b01_2fp_ecun =   b01_2fp_ecu/b01mvc_ecu;
  b01_2fp_ecus = sqrt(movmean(b01_2fp_ecun.^2, windowlen));


  b01_2fp_ecrn =   b01_2fp_ecr/b01mvc_ecr;
  b01_2fp_ecrs = sqrt(movmean(b01_2fp_ecrn.^2, windowlen));


  b01_2fp_fcrn =   b01_2fp_fcr/b01mvc_fcr;
  b01_2fp_fcrs = sqrt(movmean(b01_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  
  b01_3fp_edn =   b01_3fp_ed/b01mvc_ed;
  b01_3fp_eds = sqrt(movmean(b01_3fp_edn.^2, windowlen));


  b01_3fp_ecun =   b01_3fp_ecu/b01mvc_ecu;
  b01_3fp_ecus = sqrt(movmean(b01_3fp_ecun.^2, windowlen));


  b01_3fp_ecrn =   b01_3fp_ecr/fp_mean_ecr;
  b01_3fp_ecrs = sqrt(movmean(b01_3fp_ecrn.^2, windowlen));


  b01_3fp_fcrn =   b01_3fp_fcr/fp_mean_fcr;
  b01_3fp_fcrs = sqrt(movmean(b01_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  b01_fp_ed = (b01_1fp_eds +   b01_2fp_eds +   b01_3fp_eds)/3;
 b01_fp_mean_ed = mean( b01_fp_ed)

figure(1);
subplot(3,1,1);
plot(b01_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(b01_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(b01_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (b01_fp_ed);
title('Finger point Extensor Digitorium Subject b01'); 
ylabel('amplitude (mV)');

  b01_fp_ecu = (b01_1fp_ecus +   b01_2fp_ecus +   b01_3fp_ecus)/3;
 b01_fp_mean_ecu = mean( b01_fp_ecu)

figure(3);
subplot(3,1,1);
plot(b01_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(b01_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(b01_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (b01_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject b01');
ylabel('amplitude (mV)');

  b01_fp_ecr = (b01_1fp_ecrs +   b01_3fp_ecrs)/2;
 b01_fp_mean_ecr = mean( b01_fp_ecr)

figure(5);
subplot(3,1,1);
plot(b01_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(b01_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(b01_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (b01_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject b01');
ylabel('amplitude (mV)');


  b01_fp_fcr = (b01_1fp_fcrs +  b01_3fp_fcrs)/2;
 b01_fp_mean_fcr = mean( b01_fp_fcr)

figure(7);
subplot(3,1,1);
plot(b01_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(b01_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(b01_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (b01_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject b01');
ylabel('amplitude (mV)');


%%
b011ne = xlsread('b01_neutral_Rep_1.33.xlsx');
b012ne = xlsread('b01_neutral_Rep_2.34.xlsx');
b013ne = xlsread('b01_neutral_Rep_3.35.xlsx');

max_ne_ed = rep('b01_neutral_Rep_1.33.xlsx','b01_neutral_Rep_2.34.xlsx','b01_neutral_Rep_3.35.xlsx',2)
max_ne_ecr = rep('b01_neutral_Rep_1.33.xlsx','b01_neutral_Rep_2.34.xlsx','b01_neutral_Rep_3.35.xlsx',6)


% Neutral position
% 1st repetition 

  b011ne = xlsread('b01_neutral_Rep_1.33.xlsx');


  b01_1ne_ed =   b011ne(4056:(end-4056),2);
  b01_1ne_edn =   b01_1ne_ed/max_ne_ed; 
  b01_1ne_eds = sqrt(movmean(b01_1ne_edn.^2, windowlen)); 

  b01_1ne_ecu =   b011ne(4056:(end-4056),4);
  b01_1ne_ecun =   b01_1ne_ecu/b01mvc_ecu; 
  b01_1ne_ecus = sqrt(movmean(b01_1ne_ecun.^2, windowlen)); 

  b01_1ne_ecr =   b011ne(4056:(end-4056),6);
  b01_1ne_ecrn =   b01_1ne_ecr/max_ne_ecr;
  b01_1ne_ecrs = sqrt(movmean(b01_1ne_ecrn.^2, windowlen)); 

  b01_1ne_fcr =   b011ne(4056:(end-4056),8);
  b01_1ne_fcrn =   b01_1ne_fcr/b01mvc_fcr;
  b01_1ne_fcrs = sqrt(movmean(b01_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  b012ne = xlsread('b01_neutral_Rep_2.34.xlsx');


  b01_2ne_ed =   b012ne(4056:(end-4056),2);
  b01_2ne_edn =   b01_2ne_ed/b01mvc_ed;
  b01_2ne_eds = sqrt(movmean(b01_2ne_edn.^2, windowlen)); 

  b01_2ne_ecu =   b012ne(4056:(end-4056),4);
  b01_2ne_ecun =   b01_2ne_ecu/b01mvc_ecu;
  b01_2ne_ecus = sqrt(movmean(b01_2ne_ecun.^2, windowlen));

  b01_2ne_ecr =   b012ne(4056:(end-4056),6);
  b01_2ne_ecrn =   b01_2ne_ecr/b01mvc_ecr;
  b01_2ne_ecrs = sqrt(movmean(b01_2ne_ecrn.^2, windowlen));

  b01_2ne_fcr =   b012ne(4056:(end-4056),8);
  b01_2ne_fcrn =   b01_2ne_fcr/b01mvc_fcr;
  b01_2ne_fcrs = sqrt(movmean(b01_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  b013ne = xlsread('b01_neutral_Rep_3.35.xlsx');


  b01_3ne_ed =   b013ne(4056:(end-4056),2);
  b01_3ne_edn =   b01_3ne_ed/max_ne_ed;
  b01_3ne_eds = sqrt(movmean(b01_3ne_edn.^2, windowlen));

  b01_3ne_ecu =   b013ne(4056:(end-4056),4);
  b01_3ne_ecun =   b01_3ne_ecu/b01mvc_ecu;
  b01_3ne_ecus = sqrt(movmean(b01_3ne_ecun.^2, windowlen));

  b01_3ne_ecr =   b013ne(4056:(end-4056),6);
  b01_3ne_ecrn =   b01_3ne_ecr/max_ne_ecr;
  b01_3ne_ecrs = sqrt(movmean(b01_3ne_ecrn.^2, windowlen));

  b01_3ne_fcr =   b013ne(4056:(end-4056),8);
  b01_3ne_fcrn =   b01_3ne_fcr/b01mvc_fcr;
  b01_3ne_fcrs = sqrt(movmean(b01_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b01_ne_ed = (b01_1ne_eds +   b01_3ne_eds)/2;
 b01_ne_mean_ed = mean( b01_ne_ed)

figure(9);
subplot(3,1,1);
plot(b01_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b01_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b01_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(b01_ne_ed);
title('Neutral position Extensor Digitorium Subject b01');
ylabel('amplitude (mV)');

  b01_ne_ecu = b01_1ne_ecus; % only first repetition included
 b01_ne_mean_ecu = mean( b01_ne_ecu)

figure(11);
subplot(3,1,1);
plot(b01_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(b01_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(b01_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(b01_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject b01');
ylabel('amplitude (mV)');

  b01_ne_ecr = (b01_1ne_ecrs + b01_3ne_ecrs)/2; %second repetition not included
 b01_ne_mean_ecr = mean(b01_ne_ecr)

figure(13);
subplot(3,1,1);
plot(b01_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(b01_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(b01_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(b01_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject b01');
 
ylabel('amplitude (mV)');


  b01_ne_fcr = (b01_1ne_fcrs +   b01_3ne_fcrs)/2; %second repetition not included
 b01_ne_mean_fcr = mean( b01_ne_fcr)

figure(15);
subplot(3,1,1);
plot(b01_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(b01_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(b01_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(b01_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject b01');
ylabel('amplitude (mV)');


%%

mean_pi_ed = rep('b01_MVC_1_-_ED_-_bea_Rep_1.23.xlsx','b01_pinch_Rep_1.38.xlsx','b01_pinch_Rep_1.39.xlsx','b01_pinch_Rep_3.41.xlsx', 2)
%%
mean_pi_ecr = rep('b01_pinch_Rep_1.38.xlsx','b01_pinch_Rep_1.39.xlsx','b01_pinch_Rep_3.41.xlsx', 6)

%%


% Pinch position
% 1st repetition 

  b011pi = xlsread('b01_pinch_Rep_1.38.xlsx');


  b01_1pi_ed =   b011pi(4056:(end-4256),2);
  b01_1pi_edn =   b01_1pi_ed/b01mvc_ed; 
  b01_1pi_eds = sqrt(movmean(b01_1pi_edn.^2, windowlen)); 

  b01_1pi_ecu =   b011pi(4056:(end-4256),4);
  b01_1pi_ecun =   b01_1pi_ecu/b01mvc_ecu; 
  b01_1pi_ecus = sqrt(movmean(b01_1pi_ecun.^2, windowlen)); 

  b01_1pi_ecr =   b011pi(4056:(end-4256),6);
  b01_1pi_ecrn =   b01_1pi_ecr/b01mvc_ecr;
  b01_1pi_ecrs = sqrt(movmean(b01_1pi_ecrn.^2, windowlen)); 

  b01_1pi_fcr =   b011pi(4056:(end-4256),8);
  b01_1pi_fcrn =   b01_1pi_fcr/b01mvc_fcr;
  b01_1pi_fcrs = sqrt(movmean(b01_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  b012pi = xlsread('b01_pinch_Rep_1.39.xlsx');


  b01_2pi_ed =   b012pi(4056:(end-4256),2);
  b01_2pi_edn =   b01_2pi_ed/b01mvc_ed;
  b01_2pi_eds = sqrt(movmean(b01_2pi_edn.^2, windowlen)); 

  b01_2pi_ecu =   b012pi(4056:(end-4256),4);
  b01_2pi_ecun =   b01_2pi_ecu/b01mvc_ecu;
  b01_2pi_ecus = sqrt(movmean(b01_2pi_ecun.^2, windowlen));

  b01_2pi_ecr =   b012pi(4056:(end-4256),6);
  b01_2pi_ecrn =   b01_2pi_ecr/b01mvc_ecr;
  b01_2pi_ecrs = sqrt(movmean(b01_2pi_ecrn.^2, windowlen));

  b01_2pi_fcr =   b012pi(4056:(end-4256),8);
  b01_2pi_fcrn =   b01_2pi_fcr/b01mvc_fcr;
  b01_2pi_fcrs = sqrt(movmean(b01_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  b013pi = xlsread('b01_pinch_Rep_3.41.xlsx');


  b01_3pi_ed =   b013pi(4056:(end-4256),2);
  b01_3pi_edn =   b01_3pi_ed/b01mvc_ed;
  b01_3pi_eds = sqrt(movmean(b01_3pi_edn.^2, windowlen));

  b01_3pi_ecu =   b013pi(4056:(end-4256),4);
  b01_3pi_ecun =   b01_3pi_ecu/b01mvc_ecu;
  b01_3pi_ecus = sqrt(movmean(b01_3pi_ecun.^2, windowlen));

  b01_3pi_ecr =   b013pi(4056:(end-4256),6);
  b01_3pi_ecrn =   b01_3pi_ecr/b01mvc_ecr;
  b01_3pi_ecrs = sqrt(movmean(b01_3pi_ecrn.^2, windowlen));

  b01_3pi_fcr =   b013pi(4056:(end-4256),8);
  b01_3pi_fcrn =   b01_3pi_fcr/b01mvc_fcr;
  b01_3pi_fcrs = sqrt(movmean(b01_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b01_pi_ed = (b01_1pi_eds +   b01_2pi_eds +   b01_3pi_eds)/3;
 b01_pi_mean_ed = mean( b01_pi_ed)

figure(17);
subplot(3,1,1);
plot(b01_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b01_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b01_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(b01_pi_ed);
title('pinch position Extensor Digitorium Subject b01');
ylabel('amplitude (mV)');

  b01_pi_ecu = (b01_1pi_ecus +   b01_2pi_ecus +   b01_3pi_ecus)/3;
 b01_pi_mean_ecu = mean( b01_pi_ecu)

figure(19);
subplot(3,1,1);
plot(b01_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(b01_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(b01_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(b01_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject b01');
ylabel('amplitude (mV)');

  b01_pi_ecr = (b01_1pi_ecrs +   b01_2pi_ecrs +   b01_3pi_ecrs)/3;
 b01_pi_mean_ecr = mean( b01_pi_ecr)

figure(21);
subplot(3,1,1);
plot(b01_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(b01_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(b01_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(b01_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject b01');
ylabel('amplitude (mV)');


 b01_pi_fcr = (b01_1pi_fcrs +   b01_2pi_fcrs +   b01_3pi_fcrs)/3;
 b01_pi_mean_fcr = mean( b01_pi_fcr)

figure(23);
subplot(3,1,1);
plot(b01_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(b01_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(b01_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(b01_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject b01');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  b011pw = xlsread('b01_pour_water_Rep_1.27.xlsx');


  b01_1pw_ed =   b011pw(417:(end-2000),2);
  b01_1pw_edn =   b01_1pw_ed/b01mvc_ed; 
  b01_1pw_eds = sqrt(movmean(b01_1pw_edn.^2, windowlen)); 

  b01_1pw_ecu =   b011pw(417:(end-2000),4);
  b01_1pw_ecun =   b01_1pw_ecu/b01mvc_ecu; 
  b01_1pw_ecus = sqrt(movmean(b01_1pw_ecun.^2, windowlen)); 

  b01_1pw_ecr =   b011pw(417:(end-2000),6);
  b01_1pw_ecrn =   b01_1pw_ecr/b01mvc_ecr;
  b01_1pw_ecrs = sqrt(movmean(b01_1pw_ecrn.^2, windowlen)); 

  b01_1pw_fcr =   b011pw(417:(end-2000),8);
  b01_1pw_fcrn =   b01_1pw_fcr/b01mvc_fcr;
  b01_1pw_fcrs = sqrt(movmean(b01_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  b012pw = xlsread('b01_pour_water_Rep_2.28.xlsx');


  b01_2pw_ed =   b012pw(417:(end-2000),2);
  b01_2pw_edn =   b01_2pw_ed/b01mvc_ed;
  b01_2pw_eds = sqrt(movmean(b01_2pw_edn.^2, windowlen)); 

  b01_2pw_ecu =   b012pw(417:(end-2000),4);
  b01_2pw_ecun =   b01_2pw_ecu/b01mvc_ecu;
  b01_2pw_ecus = sqrt(movmean(b01_2pw_ecun.^2, windowlen));

  b01_2pw_ecr =   b012pw(417:(end-2000),6);
  b01_2pw_ecrn =   b01_2pw_ecr/b01mvc_ecr;
  b01_2pw_ecrs = sqrt(movmean(b01_2pw_ecrn.^2, windowlen));

  b01_2pw_fcr =   b012pw(417:(end-2000),8);
  b01_2pw_fcrn =   b01_2pw_fcr/b01mvc_fcr;
  b01_2pw_fcrs = sqrt(movmean(b01_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  b013pw = xlsread('b01_pour_water_Rep_3.29.xlsx');


  b01_3pw_ed =   b013pw(417:(end-2000),2);
  b01_3pw_edn =   b01_3pw_ed/b01mvc_ed;
  b01_3pw_eds = sqrt(movmean(b01_3pw_edn.^2, windowlen));

  b01_3pw_ecu =   b013pw(417:(end-2000),4);
  b01_3pw_ecun =   b01_3pw_ecu/b01mvc_ecu;
  b01_3pw_ecus = sqrt(movmean(b01_3pw_ecun.^2, windowlen));

  b01_3pw_ecr =   b013pw(417:(end-2000),6);
  b01_3pw_ecrn =   b01_3pw_ecr/b01mvc_ecr;
  b01_3pw_ecrs = sqrt(movmean(b01_3pw_ecrn.^2, windowlen));

  b01_3pw_fcr =   b013pw(417:(end-2000),8);
  b01_3pw_fcrn =   b01_3pw_fcr/b01mvc_fcr;
  b01_3pw_fcrs = sqrt(movmean(b01_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 b01_pw_ed = (b01_1pw_eds +   b01_2pw_eds +   b01_3pw_eds)/3;
 b01_pw_mean_ed = mean( b01_pw_ed)

figure(25);
subplot(3,1,1);
plot(b01_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(b01_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(b01_3pw_eds);
title('pour water ED 3');

figure(26);
plot(b01_pw_ed);
title('pour water Extensor Digitorium Subject b01'); 
ylabel('amplitude (mV)');

 b01_pw_ecu = (b01_1pw_ecus +   b01_2pw_ecus +   b01_3pw_ecus)/3;
 b01_pw_mean_ecu = mean(b01_pw_ecu)

figure(27);
subplot(3,1,1);
plot(b01_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(b01_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(b01_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(b01_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject b01');
ylabel('amplitude (mV)');

 b01_pw_ecr = (b01_1pw_ecrs +   b01_2pw_ecrs +   b01_3pw_ecrs)/3;
 b01_pw_mean_ecr = mean( b01_pw_ecr)

figure(29);
subplot(3,1,1);
plot(b01_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(b01_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(b01_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(b01_pw_ecr);
title('pour water Extensor Carpis Radialis Subject b01');
ylabel('amplitude (mV)');


 b01_pw_fcr = ( b01_1pw_fcrs +   b01_2pw_fcrs +   b01_3pw_fcrs)/3;
 b01_pw_mean_fcr = mean( b01_pw_fcr)

figure(31);
subplot(3,1,1);
plot(b01_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(b01_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(b01_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(b01_pw_fcr);
title('pour water Flexor Carpis Radialis Subject b01');
 
ylabel('amplitude (mV)');