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
max_force_a02 = 29.4

%% DATA READ FOR INDIVIDUAL a02

% MVC

% first line: data set is acquired
% second line: corresponding signal acquired
% third line: maximum value selected, which corresponds to the max peak of the signal


close all

  a02mvc_ed = mvc('a02_MVC_1_-_ED_-_bea_Rep_1.17.xlsx'); 


  a02mvc_ecu = mvc('a02_MVC_-_ECU_-_bea_Rep_1.18.xlsx');


  a02mvc_ecr = mvc('a02_MVC_-_ECR_-_bea_Rep_1.19.xlsx');


  a02mvc_fcr = mvc('a02_MVC_-_FCR_-_bea_Rep_1.20.xlsx');
  

%%

% FINGER POINT 

% 1st repetition 

  a021fp = xlsread('a02_finger_point__Rep_1.25.xlsx');


% first lines refer to the signal
% second lines normalises the signal
% third lines compute the rms of the normalised signal


  a02_1fp_ed =   a021fp(4256:(end-4256),2);
  a02_1fp_edn =   a02_1fp_ed/a02mvc_ed; 
  a02_1fp_eds = sqrt(movmean(a02_1fp_edn.^2, windowlen)); 

  a02_1fp_ecu =   a021fp(4256:(end-4256),4);
  a02_1fp_ecun =   a02_1fp_ecu/a02mvc_ecu; 
  a02_1fp_ecus = sqrt(movmean(a02_1fp_ecun.^2, windowlen)); 

  a02_1fp_ecr =   a021fp(4256:(end-4256),6);
  a02_1fp_ecrn =   a02_1fp_ecr/a02mvc_ecr;
  a02_1fp_ecrs = sqrt(movmean(a02_1fp_ecrn.^2, windowlen)); 

  a02_1fp_fcr =   a021fp(4256:(end-4256),8);
  a02_1fp_fcrn =   a02_1fp_fcr/a02mvc_fcr;
  a02_1fp_fcrs = sqrt(movmean(a02_1fp_fcrn.^2, windowlen)); 


% 2nd repetition 

  a022fp = xlsread('a02_finger_point__Rep_2.26.xlsx');


  a02_2fp_ed =   a022fp(4256:(end-4256),2);
  a02_2fp_edn =   a02_2fp_ed/a02mvc_ed;
  a02_2fp_eds = sqrt(movmean(a02_2fp_edn.^2, windowlen)); 

  a02_2fp_ecu =   a022fp(4256:(end-4256),4);
  a02_2fp_ecun =   a02_2fp_ecu/a02mvc_ecu;
  a02_2fp_ecus = sqrt(movmean(a02_2fp_ecun.^2, windowlen));

  a02_2fp_ecr =   a022fp(4256:(end-4256),6);
  a02_2fp_ecrn =   a02_2fp_ecr/a02mvc_ecr;
  a02_2fp_ecrs = sqrt(movmean(a02_2fp_ecrn.^2, windowlen));

  a02_2fp_fcr =   a022fp(4256:(end-4256),8);
  a02_2fp_fcrn =   a02_2fp_fcr/a02mvc_fcr;
  a02_2fp_fcrs = sqrt(movmean(a02_2fp_fcrn.^2, windowlen));


% 3rd repetition 

  a023fp = xlsread('a02_finger_point__Rep_3.27.xlsx');


  a02_3fp_ed =   a023fp(4256:(end-4256),2);
  a02_3fp_edn =   a02_3fp_ed/a02mvc_ed;
  a02_3fp_eds = sqrt(movmean(a02_3fp_edn.^2, windowlen));

  a02_3fp_ecu =   a023fp(4256:(end-4256),4);
  a02_3fp_ecun =   a02_3fp_ecu/a02mvc_ecu;
  a02_3fp_ecus = sqrt(movmean(a02_3fp_ecun.^2, windowlen));

  a02_3fp_ecr =   a023fp(4256:(end-4256),6);
  a02_3fp_ecrn =   a02_3fp_ecr/a02mvc_ecr;
  a02_3fp_ecrs = sqrt(movmean(a02_3fp_ecrn.^2, windowlen));

  a02_3fp_fcr =   a023fp(4256:(end-4256),8);
  a02_3fp_fcrn =   a02_3fp_fcr/a02mvc_fcr;
  a02_3fp_fcrs = sqrt(movmean(a02_3fp_fcrn.^2, windowlen));


% averaged signal for each muscle for finger point 

  a02_fp_ed = (a02_1fp_eds +   a02_2fp_eds +   a02_3fp_eds)/3;
 a02_fp_mean_ed = mean( a02_fp_ed)

figure(1);
subplot(3,1,1);
plot(a02_1fp_eds);
title('Finger point ED 1');
subplot(3,1,2);
plot(a02_2fp_eds);
title('Finger point ED 2');
subplot(3,1,3);
plot(a02_3fp_eds);
title('Finger point ED 3');


figure(2);
plot  (a02_fp_ed);
title('Finger point Extensor Digitorium Subject a02');
 
ylabel('amplitude (mV)');

  a02_fp_ecu = (a02_1fp_ecus +   a02_2fp_ecus +   a02_3fp_ecus)/3;
 a02_fp_mean_ecu = mean( a02_fp_ecu)

figure(3);
subplot(3,1,1);
plot(a02_1fp_ecus);
title('Finger point ECU 1');
subplot(3,1,2);
plot(a02_2fp_ecus);
title('Finger point ECU 2');
subplot(3,1,3);
plot(a02_3fp_ecus);
title('Finger point ECU 3');

figure(4);
plot  (a02_fp_ecu);
title('Finger point Extensor Carpis Ulnaris Subject a02');
 
ylabel('amplitude (mV)');

  a02_fp_ecr = (a02_1fp_ecrs +   a02_2fp_ecrs +   a02_3fp_ecrs)/3;
 a02_fp_mean_ecr = mean( a02_fp_ecr)

figure(5);
subplot(3,1,1);
plot(a02_1fp_ecrs);
title('Finger point ECR 1');
subplot(3,1,2);
plot(a02_2fp_ecrs);
title('Finger point ECR 2');
subplot(3,1,3);
plot(a02_3fp_ecrs);
title('Finger point ECR 3');

figure(6);
plot  (a02_fp_ecr);
title('Finger point Extensor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


  a02_fp_fcr = (a02_1fp_fcrs +   a02_2fp_fcrs +   a02_3fp_fcrs)/3;
 a02_fp_mean_fcr = mean( a02_fp_fcr)

figure(7);
subplot(3,1,1);
plot(a02_1fp_fcrs);
title('Finger point FCR 1');
subplot(3,1,2);
plot(a02_2fp_fcrs);
title('Finger point FCR 3');
subplot(3,1,3);
plot(a02_3fp_fcrs);
title('Finger point FCR 3');

figure(8);
plot  (a02_fp_fcr);
title('Finger point Flexor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


%%
% Neutral position
% 1st repetition 

  a021ne = xlsread('a02_neutral_Rep_1.28.xlsx');


  a02_1ne_ed =   a021ne(4056:(end-4056),2);
  a02_1ne_edn =   a02_1ne_ed/a02mvc_ed; 
  a02_1ne_eds = sqrt(movmean(a02_1ne_edn.^2, windowlen)); 

  a02_1ne_ecu =   a021ne(4056:(end-4056),4);
  a02_1ne_ecun =   a02_1ne_ecu/a02mvc_ecu; 
  a02_1ne_ecus = sqrt(movmean(a02_1ne_ecun.^2, windowlen)); 

  a02_1ne_ecr =   a021ne(4056:(end-4056),6);
  a02_1ne_ecrn =   a02_1ne_ecr/a02mvc_ecr;
  a02_1ne_ecrs = sqrt(movmean(a02_1ne_ecrn.^2, windowlen)); 

  a02_1ne_fcr =   a021ne(4056:(end-4056),8);
  a02_1ne_fcrn =   a02_1ne_fcr/a02mvc_fcr;
  a02_1ne_fcrs = sqrt(movmean(a02_1ne_fcrn.^2, windowlen)); 


% 2nd repetition 

  a022ne = xlsread('a02_neutral_Rep_2.29.xlsx');


  a02_2ne_ed =   a022ne(4056:(end-4056),2);
  a02_2ne_edn =   a02_2ne_ed/a02mvc_ed;
  a02_2ne_eds = sqrt(movmean(a02_2ne_edn.^2, windowlen)); 

  a02_2ne_ecu =   a022ne(4056:(end-4056),4);
  a02_2ne_ecun =   a02_2ne_ecu/a02mvc_ecu;
  a02_2ne_ecus = sqrt(movmean(a02_2ne_ecun.^2, windowlen));

  a02_2ne_ecr =   a022ne(4056:(end-4056),6);
  a02_2ne_ecrn =   a02_2ne_ecr/a02mvc_ecr;
  a02_2ne_ecrs = sqrt(movmean(a02_2ne_ecrn.^2, windowlen));

  a02_2ne_fcr =   a022ne(4056:(end-4056),8);
  a02_2ne_fcrn =   a02_2ne_fcr/a02mvc_fcr;
  a02_2ne_fcrs = sqrt(movmean(a02_2ne_fcrn.^2, windowlen));


% 3rd repetition 

  a023ne = xlsread('a02_neutral_Rep_3.30.xlsx');


  a02_3ne_ed =   a023ne(4056:(end-4056),2);
  a02_3ne_edn =   a02_3ne_ed/a02mvc_ed;
  a02_3ne_eds = sqrt(movmean(a02_3ne_edn.^2, windowlen));

  a02_3ne_ecu =   a023ne(4056:(end-4056),4);
  a02_3ne_ecun =   a02_3ne_ecu/a02mvc_ecu;
  a02_3ne_ecus = sqrt(movmean(a02_3ne_ecun.^2, windowlen));

  a02_3ne_ecr =   a023ne(4056:(end-4056),6);
  a02_3ne_ecrn =   a02_3ne_ecr/a02mvc_ecr;
  a02_3ne_ecrs = sqrt(movmean(a02_3ne_ecrn.^2, windowlen));

  a02_3ne_fcr =   a023ne(4056:(end-4056),8);
  a02_3ne_fcrn =   a02_3ne_fcr/a02mvc_fcr;
  a02_3ne_fcrs = sqrt(movmean(a02_3ne_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a02_ne_ed = (a02_1ne_eds +   a02_2ne_eds +   a02_3ne_eds)/3;
 a02_ne_mean_ed = mean( a02_ne_ed)

figure(9);
subplot(3,1,1);
plot(a02_1ne_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a02_2ne_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a02_3ne_eds);
title('Neutral position ED 3');

figure(10);
plot(a02_ne_ed);
title('Neutral position Extensor Digitorium Subject a02');
 
ylabel('amplitude (mV)');

  a02_ne_ecu = (a02_1ne_ecus +   a02_2ne_ecus +   a02_3ne_ecus)/3;
 a02_ne_mean_ecu = mean( a02_ne_ecu)

figure(11);
subplot(3,1,1);
plot(a02_1ne_ecus);
title('Neutral position ECU 1');
subplot(3,1,2);
plot(a02_2ne_ecus);
title('Neutral position ECU 2');
subplot(3,1,3);
plot(a02_3ne_ecus);
title('Neutral position ECU 3');

figure(12);
plot(a02_ne_ecu);
title('Neutral position Extensor Carpis Ulnaris Subject a02');
 
ylabel('amplitude (mV)');

  a02_ne_ecr = (a02_1ne_ecrs +   a02_2ne_ecrs +   a02_3ne_ecrs)/3;
 a02_ne_mean_ecr = mean( a02_ne_ecr)

figure(13);
subplot(3,1,1);
plot(a02_1ne_ecrs);
title('Neutral position ECR 1');
subplot(3,1,2);
plot(a02_2ne_ecrs);
title('Neutral position ECR 2');
subplot(3,1,3);
plot(a02_3ne_ecrs);
title('Neutral position ECR 3');

figure(14);
plot(a02_ne_ecr);
title('Neutral position Extensor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


  a02_ne_fcr = (a02_1ne_fcrs +   a02_2ne_fcrs +   a02_3ne_fcrs)/3;
 a02_ne_mean_fcr = mean( a02_ne_fcr)

figure(15);
subplot(3,1,1);
plot(a02_1ne_fcrs);
title('Neutral position FCR 1');
subplot(3,1,2);
plot(a02_2ne_fcrs);
title('Neutral position FCR 2');
subplot(3,1,3);
plot(a02_3ne_fcrs);
title('Neutral position FCR 3');

figure(16);
plot(a02_ne_fcr);
title('Neutral position Flexor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


%%
% Pinch position
% 1st repetition 

  a021pi = xlsread('a02_pinch_Rep_1.31.xlsx');


  a02_1pi_ed =   a021pi(4056:(end-4256),2);
  a02_1pi_edn =   a02_1pi_ed/a02mvc_ed; 
  a02_1pi_eds = sqrt(movmean(a02_1pi_edn.^2, windowlen)); 

  a02_1pi_ecu =   a021pi(4056:(end-4256),4);
  a02_1pi_ecun =   a02_1pi_ecu/a02mvc_ecu; 
  a02_1pi_ecus = sqrt(movmean(a02_1pi_ecun.^2, windowlen)); 

  a02_1pi_ecr =   a021pi(4056:(end-4256),6);
  a02_1pi_ecrn =   a02_1pi_ecr/a02mvc_ecr;
  a02_1pi_ecrs = sqrt(movmean(a02_1pi_ecrn.^2, windowlen)); 

  a02_1pi_fcr =   a021pi(4056:(end-4256),8);
  a02_1pi_fcrn =   a02_1pi_fcr/a02mvc_fcr;
  a02_1pi_fcrs = sqrt(movmean(a02_1pi_fcrn.^2, windowlen)); 


% 2nd repetition 

  a022pi = xlsread('a02_pinch_Rep_2.32.xlsx');


  a02_2pi_ed =   a022pi(4056:(end-4256),2);
  a02_2pi_edn =   a02_2pi_ed/a02mvc_ed;
  a02_2pi_eds = sqrt(movmean(a02_2pi_edn.^2, windowlen)); 

  a02_2pi_ecu =   a022pi(4056:(end-4256),4);
  a02_2pi_ecun =   a02_2pi_ecu/a02mvc_ecu;
  a02_2pi_ecus = sqrt(movmean(a02_2pi_ecun.^2, windowlen));

  a02_2pi_ecr =   a022pi(4056:(end-4256),6);
  a02_2pi_ecrn =   a02_2pi_ecr/a02mvc_ecr;
  a02_2pi_ecrs = sqrt(movmean(a02_2pi_ecrn.^2, windowlen));

  a02_2pi_fcr =   a022pi(4056:(end-4256),8);
  a02_2pi_fcrn =   a02_2pi_fcr/a02mvc_fcr;
  a02_2pi_fcrs = sqrt(movmean(a02_2pi_fcrn.^2, windowlen));


% 3rd repetition 

  a023pi = xlsread('a02_pinch_Rep_3.33.xlsx');


  a02_3pi_ed =   a023pi(4056:(end-4256),2);
  a02_3pi_edn =   a02_3pi_ed/a02mvc_ed;
  a02_3pi_eds = sqrt(movmean(a02_3pi_edn.^2, windowlen));

  a02_3pi_ecu =   a023pi(4056:(end-4256),4);
  a02_3pi_ecun =   a02_3pi_ecu/a02mvc_ecu;
  a02_3pi_ecus = sqrt(movmean(a02_3pi_ecun.^2, windowlen));

  a02_3pi_ecr =   a023pi(4056:(end-4256),6);
  a02_3pi_ecrn =   a02_3pi_ecr/a02mvc_ecr;
  a02_3pi_ecrs = sqrt(movmean(a02_3pi_ecrn.^2, windowlen));

  a02_3pi_fcr =   a023pi(4056:(end-4256),8);
  a02_3pi_fcrn =   a02_3pi_fcr/a02mvc_fcr;
  a02_3pi_fcrs = sqrt(movmean(a02_3pi_fcrn.^2, windowlen));


% averaged signal for each muscle for neutral position 

  a02_pi_ed = (a02_1pi_eds +   a02_2pi_eds +   a02_3pi_eds)/3;
 a02_pi_mean_ed = mean( a02_pi_ed)

figure(17);
subplot(3,1,1);
plot(a02_1pi_eds);
title('Neutral position ED 1');
subplot(3,1,2);
plot(a02_2pi_eds);
title('Neutral position ED 2');
subplot(3,1,3);
plot(a02_3pi_eds);
title('Neutral position ED 3');

figure(18);
plot(a02_pi_ed);
title('pinch position Extensor Digitorium Subject a02');
 
ylabel('amplitude (mV)');

  a02_pi_ecu = (a02_1pi_ecus +   a02_2pi_ecus +   a02_3pi_ecus)/3;
 a02_pi_mean_ecu = mean( a02_pi_ecu)

figure(19);
subplot(3,1,1);
plot(a02_1pi_ecus);
title('Pinch position ECU 1');
subplot(3,1,2);
plot(a02_2pi_ecus);
title('Pinch position ECU 2');
subplot(3,1,3);
plot(a02_3pi_ecus);
title('Pinch position ECU 3');

figure(20);
plot(a02_pi_ecu);
title('pinch position Extensor Carpis Ulnaris Subject a02');
 
ylabel('amplitude (mV)');

  a02_pi_ecr = (a02_1pi_ecrs +   a02_2pi_ecrs +   a02_3pi_ecrs)/3;
 a02_pi_mean_ecr = mean( a02_pi_ecr)

figure(21);
subplot(3,1,1);
plot(a02_1pi_ecrs);
title('Pinch position ECR 1');
subplot(3,1,2);
plot(a02_2pi_ecrs);
title('Pinch position ECR 2');
subplot(3,1,3);
plot(a02_3pi_ecrs);
title('Pinch position ECR 3');

figure(22);
plot(a02_pi_ecr);
title('pinch position Extensor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


 a02_pi_fcr = (a02_1pi_fcrs +   a02_2pi_fcrs +   a02_3pi_fcrs)/3;
 a02_pi_mean_fcr = mean( a02_pi_fcr)

figure(23);
subplot(3,1,1);
plot(a02_1pi_fcrs);
title('pinch position FCR 1');
subplot(3,1,2);
plot(a02_2pi_fcrs);
title('pinch position FCR 2');
subplot(3,1,3);
plot(a02_3pi_fcrs);
title('pinch position FCR 3');

figure(24);
plot(a02_pi_fcr);
title('pinch position Flexor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


%%
% pour water
% 1st repetition 

  a021pw = xlsread('a02_pour_water_Rep_2.22.xlsx');


  a02_1pw_ed =   a021pw(417:(end-2000),2);
  a02_1pw_edn =   a02_1pw_ed/a02mvc_ed; 
  a02_1pw_eds = sqrt(movmean(a02_1pw_edn.^2, windowlen)); 

  a02_1pw_ecu =   a021pw(417:(end-2000),4);
  a02_1pw_ecun =   a02_1pw_ecu/a02mvc_ecu; 
  a02_1pw_ecus = sqrt(movmean(a02_1pw_ecun.^2, windowlen)); 

  a02_1pw_ecr =   a021pw(417:(end-2000),6);
  a02_1pw_ecrn =   a02_1pw_ecr/a02mvc_ecr;
  a02_1pw_ecrs = sqrt(movmean(a02_1pw_ecrn.^2, windowlen)); 

  a02_1pw_fcr =   a021pw(417:(end-2000),8);
  a02_1pw_fcrn =   a02_1pw_fcr/a02mvc_fcr;
  a02_1pw_fcrs = sqrt(movmean(a02_1pw_fcrn.^2, windowlen)); 


% 2nd repetition 

  a022pw = xlsread('a02_pour_water_Rep_4.24.xlsx');


  a02_2pw_ed =   a022pw(417:(end-2000),2);
  a02_2pw_edn =   a02_2pw_ed/a02mvc_ed;
  a02_2pw_eds = sqrt(movmean(a02_2pw_edn.^2, windowlen)); 

  a02_2pw_ecu =   a022pw(417:(end-2000),4);
  a02_2pw_ecun =   a02_2pw_ecu/a02mvc_ecu;
  a02_2pw_ecus = sqrt(movmean(a02_2pw_ecun.^2, windowlen));

  a02_2pw_ecr =   a022pw(417:(end-2000),6);
  a02_2pw_ecrn =   a02_2pw_ecr/a02mvc_ecr;
  a02_2pw_ecrs = sqrt(movmean(a02_2pw_ecrn.^2, windowlen));

  a02_2pw_fcr =   a022pw(417:(end-2000),8);
  a02_2pw_fcrn =   a02_2pw_fcr/a02mvc_fcr;
  a02_2pw_fcrs = sqrt(movmean(a02_2pw_fcrn.^2, windowlen));


% averaged signal for each muscle for pour water 

 a02_pw_ed = (a02_1pw_eds +   a02_2pw_eds)/2;
 a02_pw_mean_ed = mean( a02_pw_ed)

figure(25);
subplot(2,1,1);
plot(a02_1pw_eds);
title('pour water ED 1');
subplot(2,1,2);
plot(a02_2pw_eds);
title('pour water ED 2');


figure(26);
plot(a02_pw_ed);
title('pour water Extensor Digitorium Subject a02');
 
ylabel('amplitude (mV)');

 a02_pw_ecu = (a02_1pw_ecus +   a02_2pw_ecus)/2;
 a02_pw_mean_ecu = mean(a02_pw_ecu)

figure(27);
subplot(2,1,1);
plot(a02_1pw_ecus);
title('pour water ECU 1');
subplot(2,1,2);
plot(a02_2pw_ecus);
title('pour water ECU 2');


figure(28);
plot(a02_pw_ecu);
title('pour water Extensor Carpis Ulnaris Subject a02');
 
ylabel('amplitude (mV)');

  a02_pw_ecr = (a02_1pw_ecrs +   a02_2pw_ecrs)/2;
 a02_pw_mean_ecr = mean( a02_pw_ecr)

figure(29);
subplot(2,1,1);
plot(a02_1pw_ecrs);
title('pour water ECR 1');
subplot(2,1,2);
plot(a02_2pw_ecrs);
title('pour water ECR 2');



figure(30);
plot(a02_pw_ecr);
title('pour water Extensor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');


 a02_pw_fcr = ( a02_1pw_fcrs +   a02_2pw_fcrs)/2;
 a02_pw_mean_fcr = mean( a02_pw_fcr)

figure(31);
subplot(2,1,1);
plot(a02_1pw_fcrs);
title('pour water FCR 1');
subplot(2,1,2);
plot(a02_2pw_fcrs);
title('pour water FCR 1');


figure(32);
plot(a02_pw_fcr);
title('pour water Flexor Carpis Radialis Subject a02');
 
ylabel('amplitude (mV)');