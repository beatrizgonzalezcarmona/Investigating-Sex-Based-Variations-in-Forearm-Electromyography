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
max_force_b08 = 60

%% DATA READ FOR INDIVIDUAL b08

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  b08mvc_ed = mvc('b08_MVC_1_-_ED_-_bea_Rep_1.0.xlsx'); 


  b08mvc_ecu = mvc('b08_MVC_-_ECU_-_bea_Rep_1.1.xlsx');


  b08mvc_ecr = mvc('b08_MVC_-_ECR_-_bea_Rep_1.2.xlsx');


  b08mvc_fcr = mvc('b08_MVC_-_FCR_-_bea_Rep_1.3.xlsx');


%%

% FINGER POINT 

% 1st repetition 

  b081fp = xlsread('b08_finger_point__Rep_1.7.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  b08_1fp_ed =   b081fp(4256:(end-4256),2);
  b08_1fp_edn =   b08_1fp_ed/b08mvc_ed; 
  b08_1fp_eds = sqrt(movmean(b08_1fp_edn.^2, windowlen)); 

  b08_1fp_ecu =   b081fp(4256:(end-4256),4);
  b08_1fp_ecun =   b08_1fp_ecu/b08mvc_ecu; 
  b08_1fp_ecus = sqrt(movmean(b08_1fp_ecun.^2, windowlen)); 

  b08_1fp_ecr =   b081fp(4256:(end-4256),6);
  b08_1fp_ecrn =   b08_1fp_ecr/b08mvc_ecr;
  b08_1fp_ecrs = sqrt(movmean(b08_1fp_ecrn.^2, windowlen)); 

  b08_1fp_fcr =   b081fp(4256:(end-4256),8);
  b08_1fp_fcrn =   b08_1fp_fcr/b08mvc_fcr;
  b08_1fp_fcrs = sqrt(movmean(b08_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  b082fp = xlsread('b08_finger_point__Rep_2.8.xlsx');


  b08_2fp_ed =   b082fp(4256:(end-4256),2);
  b08_2fp_edn =   b08_2fp_ed/b08mvc_ed;
  b08_2fp_eds = sqrt(movmean(b08_2fp_edn.^2, windowlen)); 

  b08_2fp_ecu =   b082fp(4256:(end-4256),4);
  b08_2fp_ecun =   b08_2fp_ecu/b08mvc_ecu;
  b08_2fp_ecus = sqrt(movmean(b08_2fp_ecun.^2, windowlen));

  b08_2fp_ecr =   b082fp(4256:(end-4256),6);
  b08_2fp_ecrn =   b08_2fp_ecr/b08mvc_ecr;
  b08_2fp_ecrs = sqrt(movmean(b08_2fp_ecrn.^2, windowlen));

  b08_2fp_fcr =   b082fp(4256:(end-4256),8);
  b08_2fp_fcrn =   b08_2fp_fcr/b08mvc_fcr;
  b08_2fp_fcrs = sqrt(movmean(b08_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  b083fp = xlsread('b08_finger_point__Rep_3.9.xlsx');


  b08_3fp_ed =   b083fp(4256:(end-4256),2);
  b08_3fp_edn =   b08_3fp_ed/b08mvc_ed;
  b08_3fp_eds = sqrt(movmean(b08_3fp_edn.^2, windowlen));

  b08_3fp_ecu =   b083fp(4256:(end-4256),4);
  b08_3fp_ecun =   b08_3fp_ecu/b08mvc_ecu;
  b08_3fp_ecus = sqrt(movmean(b08_3fp_ecun.^2, windowlen));

  b08_3fp_ecr =   b083fp(4256:(end-4256),6);
  b08_3fp_ecrn =   b08_3fp_ecr/b08mvc_ecr;
  b08_3fp_ecrs = sqrt(movmean(b08_3fp_ecrn.^2, windowlen));

  b08_3fp_fcr =   b083fp(4256:(end-4256),8);
  b08_3fp_fcrn =   b08_3fp_fcr/b08mvc_fcr;
  b08_3fp_fcrs = sqrt(movmean(b08_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  b08_fp_ed = (b08_1fp_eds +   b08_2fp_eds +   b08_3fp_eds)/3;
 b08_fp_mean_ed = mean( b08_fp_ed)

figure(1);
subplot(3,1,1);
plot(b08_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(b08_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(b08_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (b08_fp_ed);
title('Finger point Extensor Digitorium Subject b08');
 
ylabel('amplitude (mV)');

  b08_fp_ecu = (b08_1fp_ecus +   b08_2fp_ecus +   b08_3fp_ecus)/3;
 b08_fp_mean_ecu = mean( b08_fp_ecu)

figure(3);
subplot(3,1,1);
plot(b08_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(b08_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(b08_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (b08_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject b08');
 
ylabel('amplitude (mV)');

  b08_fp_ecr = (b08_1fp_ecrs +   b08_2fp_ecrs +   b08_3fp_ecrs)/3;
 b08_fp_mean_ecr = mean( b08_fp_ecr)

figure(5);
subplot(3,1,1);
plot(b08_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(b08_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(b08_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (b08_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


  b08_fp_fcr = (b08_1fp_fcrs +   b08_2fp_fcrs +   b08_3fp_fcrs)/3;
 b08_fp_mean_fcr = mean( b08_fp_fcr)

figure(7);
subplot(3,1,1);
plot(b08_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(b08_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(b08_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (b08_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  b081ne = xlsread('b08_neutral_Rep_1.10.xlsx');


  b08_1ne_ed =   b081ne(4056:(end-4056),2);
  b08_1ne_edn =   b08_1ne_ed/b08mvc_ed; 
  b08_1ne_eds = sqrt(movmean(b08_1ne_edn.^2, windowlen)); 

  b08_1ne_ecu =   b081ne(4056:(end-4056),4);
  b08_1ne_ecun =   b08_1ne_ecu/b08mvc_ecu; 
  b08_1ne_ecus = sqrt(movmean(b08_1ne_ecun.^2, windowlen)); 

  b08_1ne_ecr =   b081ne(4056:(end-4056),6);
  b08_1ne_ecrn =   b08_1ne_ecr/b08mvc_ecr;
  b08_1ne_ecrs = sqrt(movmean(b08_1ne_ecrn.^2, windowlen)); 

  b08_1ne_fcr =   b081ne(4056:(end-4056),8);
  b08_1ne_fcrn =   b08_1ne_fcr/b08mvc_fcr;
  b08_1ne_fcrs = sqrt(movmean(b08_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  b082ne = xlsread('b08_neutral_Rep_2.11.xlsx');


  b08_2ne_ed =   b082ne(4056:(end-4056),2);
  b08_2ne_edn =   b08_2ne_ed/b08mvc_ed;
  b08_2ne_eds = sqrt(movmean(b08_2ne_edn.^2, windowlen)); 

  b08_2ne_ecu =   b082ne(4056:(end-4056),4);
  b08_2ne_ecun =   b08_2ne_ecu/b08mvc_ecu;
  b08_2ne_ecus = sqrt(movmean(b08_2ne_ecun.^2, windowlen));

  b08_2ne_ecr =   b082ne(4056:(end-4056),6);
  b08_2ne_ecrn =   b08_2ne_ecr/b08mvc_ecr;
  b08_2ne_ecrs = sqrt(movmean(b08_2ne_ecrn.^2, windowlen));

  b08_2ne_fcr =   b082ne(4056:(end-4056),8);
  b08_2ne_fcrn =   b08_2ne_fcr/b08mvc_fcr;
  b08_2ne_fcrs = sqrt(movmean(b08_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  b083ne = xlsread('b08_neutral_Rep_3.12.xlsx');


  b08_3ne_ed =   b083ne(4056:(end-4056),2);
  b08_3ne_edn =   b08_3ne_ed/b08mvc_ed;
  b08_3ne_eds = sqrt(movmean(b08_3ne_edn.^2, windowlen));

  b08_3ne_ecu =   b083ne(4056:(end-4056),4);
  b08_3ne_ecun =   b08_3ne_ecu/b08mvc_ecu;
  b08_3ne_ecus = sqrt(movmean(b08_3ne_ecun.^2, windowlen));

  b08_3ne_ecr =   b083ne(4056:(end-4056),6);
  b08_3ne_ecrn =   b08_3ne_ecr/b08mvc_ecr;
  b08_3ne_ecrs = sqrt(movmean(b08_3ne_ecrn.^2, windowlen));

  b08_3ne_fcr =   b083ne(4056:(end-4056),8);
  b08_3ne_fcrn =   b08_3ne_fcr/b08mvc_fcr;
  b08_3ne_fcrs = sqrt(movmean(b08_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b08_ne_ed = (b08_1ne_eds +   b08_2ne_eds +   b08_3ne_eds)/3;
 b08_ne_mean_ed = mean( b08_ne_ed)

figure(9);
subplot(3,1,1);
plot(b08_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b08_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b08_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(b08_ne_ed);
title('Neutral position Extensor Digitorium Subject b08');
 
ylabel('amplitude (mV)');

  b08_ne_ecu = (b08_1ne_ecus +   b08_2ne_ecus +   b08_3ne_ecus)/3;
 b08_ne_mean_ecu = mean( b08_ne_ecu)

figure(11);
subplot(3,1,1);
plot(b08_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(b08_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(b08_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(b08_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject b08');
 
ylabel('amplitude (mV)');

  b08_ne_ecr = (b08_1ne_ecrs +   b08_2ne_ecrs +   b08_3ne_ecrs)/3;
 b08_ne_mean_ecr = mean( b08_ne_ecr)

figure(13);
subplot(3,1,1);
plot(b08_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(b08_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(b08_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(b08_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


  b08_ne_fcr = (b08_1ne_fcrs +   b08_2ne_fcrs +   b08_3ne_fcrs)/3;
 b08_ne_mean_fcr = mean( b08_ne_fcr)

figure(15);
subplot(3,1,1);
plot(b08_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(b08_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(b08_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(b08_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  b081pi = xlsread('b08_pinch_Rep_2.14.xlsx');


  b08_1pi_ed =   b081pi(4056:(end-4256),2);
  b08_1pi_edn =   b08_1pi_ed/b08mvc_ed; 
  b08_1pi_eds = sqrt(movmean(b08_1pi_edn.^2, windowlen)); 

  b08_1pi_ecu =   b081pi(4056:(end-4256),4);
  b08_1pi_ecun =   b08_1pi_ecu/b08mvc_ecu; 
  b08_1pi_ecus = sqrt(movmean(b08_1pi_ecun.^2, windowlen)); 

  b08_1pi_ecr =   b081pi(4056:(end-4256),6);
  b08_1pi_ecrn =   b08_1pi_ecr/b08mvc_ecr;
  b08_1pi_ecrs = sqrt(movmean(b08_1pi_ecrn.^2, windowlen)); 

  b08_1pi_fcr =   b081pi(4056:(end-4256),8);
  b08_1pi_fcrn =   b08_1pi_fcr/b08mvc_fcr;
  b08_1pi_fcrs = sqrt(movmean(b08_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  b082pi = xlsread('b08_pinch_Rep_3.15.xlsx');


  b08_2pi_ed =   b082pi(4056:(end-4256),2);
  b08_2pi_edn =   b08_2pi_ed/b08mvc_ed;
  b08_2pi_eds = sqrt(movmean(b08_2pi_edn.^2, windowlen)); 

  b08_2pi_ecu =   b082pi(4056:(end-4256),4);
  b08_2pi_ecun =   b08_2pi_ecu/b08mvc_ecu;
  b08_2pi_ecus = sqrt(movmean(b08_2pi_ecun.^2, windowlen));

  b08_2pi_ecr =   b082pi(4056:(end-4256),6);
  b08_2pi_ecrn =   b08_2pi_ecr/b08mvc_ecr;
  b08_2pi_ecrs = sqrt(movmean(b08_2pi_ecrn.^2, windowlen));

  b08_2pi_fcr =   b082pi(4056:(end-4256),8);
  b08_2pi_fcrn =   b08_2pi_fcr/b08mvc_fcr;
  b08_2pi_fcrs = sqrt(movmean(b08_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  b083pi = xlsread('b08_pinch_Rep_4.16.xlsx');


  b08_3pi_ed =   b083pi(4056:(end-4256),2);
  b08_3pi_edn =   b08_3pi_ed/b08mvc_ed;
  b08_3pi_eds = sqrt(movmean(b08_3pi_edn.^2, windowlen));

  b08_3pi_ecu =   b083pi(4056:(end-4256),4);
  b08_3pi_ecun =   b08_3pi_ecu/b08mvc_ecu;
  b08_3pi_ecus = sqrt(movmean(b08_3pi_ecun.^2, windowlen));

  b08_3pi_ecr =   b083pi(4056:(end-4256),6);
  b08_3pi_ecrn =   b08_3pi_ecr/b08mvc_ecr;
  b08_3pi_ecrs = sqrt(movmean(b08_3pi_ecrn.^2, windowlen));

  b08_3pi_fcr =   b083pi(4056:(end-4256),8);
  b08_3pi_fcrn =   b08_3pi_fcr/b08mvc_fcr;
  b08_3pi_fcrs = sqrt(movmean(b08_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  b08_pi_ed = (b08_1pi_eds +   b08_2pi_eds +   b08_3pi_eds)/3;
 b08_pi_mean_ed = mean( b08_pi_ed)

figure(17);
subplot(3,1,1);
plot(b08_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(b08_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(b08_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(b08_pi_ed);
title('pinch position Extensor Digitorium Subject b08');
 
ylabel('amplitude (mV)');

  b08_pi_ecu = (b08_1pi_ecus +   b08_2pi_ecus +   b08_3pi_ecus)/3;
 b08_pi_mean_ecu = mean( b08_pi_ecu)

figure(19);
subplot(3,1,1);
plot(b08_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(b08_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(b08_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(b08_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject b08');
 
ylabel('amplitude (mV)');

  b08_pi_ecr = (b08_1pi_ecrs +   b08_2pi_ecrs +   b08_3pi_ecrs)/3;
 b08_pi_mean_ecr = mean( b08_pi_ecr)

figure(21);
subplot(3,1,1);
plot(b08_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(b08_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(b08_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(b08_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


 b08_pi_fcr = (b08_1pi_fcrs +   b08_2pi_fcrs +   b08_3pi_fcrs)/3;
 b08_pi_mean_fcr = mean( b08_pi_fcr)

figure(23);
subplot(3,1,1);
plot(b08_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(b08_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(b08_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(b08_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  b081pw = xlsread('b08_pour_water_Rep_1.4.xlsx');


  b08_1pw_ed =   b081pw(417:(end-2000),2);
  b08_1pw_edn =   b08_1pw_ed/b08mvc_ed; 
  b08_1pw_eds = sqrt(movmean(b08_1pw_edn.^2, windowlen)); 

  b08_1pw_ecu =   b081pw(417:(end-2000),4);
  b08_1pw_ecun =   b08_1pw_ecu/b08mvc_ecu; 
  b08_1pw_ecus = sqrt(movmean(b08_1pw_ecun.^2, windowlen)); 

  b08_1pw_ecr =   b081pw(417:(end-2000),6);
  b08_1pw_ecrn =   b08_1pw_ecr/b08mvc_ecr;
  b08_1pw_ecrs = sqrt(movmean(b08_1pw_ecrn.^2, windowlen)); 

  b08_1pw_fcr =   b081pw(417:(end-2000),8);
  b08_1pw_fcrn =   b08_1pw_fcr/b08mvc_fcr;
  b08_1pw_fcrs = sqrt(movmean(b08_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  b082pw = xlsread('b08_pour_water_Rep_2.5.xlsx');


  b08_2pw_ed =   b082pw(417:(end-2000),2);
  b08_2pw_edn =   b08_2pw_ed/b08mvc_ed;
  b08_2pw_eds = sqrt(movmean(b08_2pw_edn.^2, windowlen)); 

  b08_2pw_ecu =   b082pw(417:(end-2000),4);
  b08_2pw_ecun =   b08_2pw_ecu/b08mvc_ecu;
  b08_2pw_ecus = sqrt(movmean(b08_2pw_ecun.^2, windowlen));

  b08_2pw_ecr =   b082pw(417:(end-2000),6);
  b08_2pw_ecrn =   b08_2pw_ecr/b08mvc_ecr;
  b08_2pw_ecrs = sqrt(movmean(b08_2pw_ecrn.^2, windowlen));

  b08_2pw_fcr =   b082pw(417:(end-2000),8);
  b08_2pw_fcrn =   b08_2pw_fcr/b08mvc_fcr;
  b08_2pw_fcrs = sqrt(movmean(b08_2pw_fcrn.^2, windowlen));


% 3rd repetition 

  b083pw = xlsread('b08_pour_water_Rep_3.6.xlsx');


  b08_3pw_ed =   b083pw(417:(end-2000),2);
  b08_3pw_edn =   b08_3pw_ed/b08mvc_ed;
  b08_3pw_eds = sqrt(movmean(b08_3pw_edn.^2, windowlen));

  b08_3pw_ecu =   b083pw(417:(end-2000),4);
  b08_3pw_ecun =   b08_3pw_ecu/b08mvc_ecu;
  b08_3pw_ecus = sqrt(movmean(b08_3pw_ecun.^2, windowlen));

  b08_3pw_ecr =   b083pw(417:(end-2000),6);
  b08_3pw_ecrn =   b08_3pw_ecr/b08mvc_ecr;
  b08_3pw_ecrs = sqrt(movmean(b08_3pw_ecrn.^2, windowlen));

  b08_3pw_fcr =   b083pw(417:(end-2000),8);
  b08_3pw_fcrn =   b08_3pw_fcr/b08mvc_fcr;
  b08_3pw_fcrs = sqrt(movmean(b08_3pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 b08_pw_ed = (b08_1pw_eds +   b08_2pw_eds +   b08_3pw_eds)/3;
 b08_pw_mean_ed = mean( b08_pw_ed)

figure(25);
subplot(3,1,1);
plot(b08_1pw_eds);
title('pour water ED 1');
subplot(3,1,2);
plot(b08_2pw_eds);
title('pour water ED 2');
subplot(3,1,3);
plot(b08_3pw_eds);
title('pour water ED 3');

figure(26);
plot(b08_pw_ed);
title('pour water Extensor Digitorium Subject b08');
 
ylabel('amplitude (mV)');

 b08_pw_ecu = (b08_1pw_ecus +   b08_2pw_ecus +   b08_3pw_ecus)/3;
 b08_pw_mean_ecu = mean(b08_pw_ecu)

figure(27);
subplot(3,1,1);
plot(b08_1pw_ecus);
title('pour water ECU 1');
subplot(3,1,2);
plot(b08_2pw_ecus);
title('pour water ECU 2');
subplot(3,1,3);
plot(b08_3pw_ecus);
title('pour water ECU 3');

figure(28);
plot(b08_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject b08');
 
ylabel('amplitude (mV)');

  b08_pw_ecr = (b08_1pw_ecrs +   b08_2pw_ecrs +   b08_3pw_ecrs)/3;
 b08_pw_mean_ecr = mean( b08_pw_ecr)

figure(29);
subplot(3,1,1);
plot(b08_1pw_ecrs);
title('pour water ECR 1');
subplot(3,1,2);
plot(b08_2pw_ecrs);
title('pour water ECR 2');
subplot(3,1,3);
plot(b08_3pw_ecrs);
title('pour water ECR 3');

figure(30);
plot(b08_pw_ecr);
title('pour water Extensor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');


 b08_pw_fcr = ( b08_1pw_fcrs +   b08_2pw_fcrs +   b08_3pw_fcrs)/3;
 b08_pw_mean_fcr = mean( b08_pw_fcr)

figure(31);
subplot(3,1,1);
plot(b08_1pw_fcrs);
title('pour water FCR 1');
subplot(3,1,2);
plot(b08_2pw_fcrs);
title('pour water FCR 2');
subplot(3,1,3);
plot(b08_3pw_fcrs);
title('pour water FCR 3');

figure(32);
plot(b08_pw_fcr);
title('pour water Flexor Carpis Radialis Subject b08');
 
ylabel('amplitude (mV)');