function Rms = rmsplots(mvcfile, file1, file2, file3, a)
clear Rms

% This function is used to obtain a moving mean signal to plot the signals
% of the static tasks. It uses the same procedure used in the mean_task
% function to normalise the signal.

% a referes to the muscle: 
% 2 = ED
% 4 = ECU
% 6 = ECR
% 8 = FCR

mvcvalue = mvc(mvcfile);
data1 = xlsread(file1);
data2 = xlsread(file2);
data3 = xlsread(file3);
range = 4256:(11814-4256);
windowlen = 250;
data4 = data1(range,a);
data5 = data2(range,a);
data6 = data3(range,a);

mean1 = sqrt(mean(data4).^2);
mean2 = sqrt(mean(data5).^2);
mean3 = sqrt(mean(data6).^2);

mean_position_muscle = [mean1 mean2 mean3];
max_value = max([mean_position_muscle mvcvalue]);

if mean1 == max_value
    Rms = (sqrt(movmean((data5/max_value).^2,windowlen)) + sqrt(movmean((data6/max_value).^2,windowlen)))/2;

elseif mean2 == max_value
    Rms = (sqrt(movmean((data4/max_value).^2,windowlen)) + sqrt(movmean((data6/max_value).^2,windowlen)))/2;
    
elseif mean3 == max_value
   Rms = (sqrt(movmean((data4/max_value).^2,windowlen)) + sqrt(movmean((data5/max_value).^2,windowlen)))/2;

else Rms = (sqrt(movmean((data4/max_value).^2,windowlen)) + sqrt(movmean((data5/max_value).^2,windowlen))+ sqrt(movmean((data6/max_value).^2,windowlen)))/3;

end

end 