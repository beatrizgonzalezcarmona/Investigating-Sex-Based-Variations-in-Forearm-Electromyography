function Repetitions = rep(mvcfile, file1, file2, file3, a)
clear Repetitions

% mvc file corresponds to the mvc file of the muscle being analysed.
% Each file1 file2 and file3 correspond to each repetition file
% a is the muscle that is being analysed 
% a = 2 if ed, 4 if ecu, 6 if ecr, and 8 if fcr

mvcvalue = mvc(mvcfile);
data1 = xlsread(file1);
data2 = xlsread(file2);
data3 = xlsread(file3);

range = 4256:(11814-4256); % contraction samples

data4 = data1(range,a);
data5 = data2(range,a);
data6 = data3(range,a);

mean1 = sqrt(mean(data4).^2);
mean2 = sqrt(mean(data5).^2);
mean3 = sqrt(mean(data6).^2);


% it calculates the mean of the contraction of each reptition without having been normalised 
% Then, it compares each of those means wit the mvc value and chooses the
% higher out of them 
mean_position_muscle = [mean1 mean2 mean3];
max_value = max([mean_position_muscle mvcvalue]);

% That max value is used as the normalisation factor, which is then used to
% calculate a mean value of the average signal using all the repetitions. 
if mean1 == max_value
    Repetitions = mean([mean2/max_value mean3/max_value]);

elseif mean2 == max_value
   Repetitions = mean([mean1/max_value mean3/max_value]);
    
elseif mean3 == max_value
   Repetitions = mean([mean1/max_value mean2/max_value]);

else Repetitions = mean([mean1/max_value mean2/max_value mean3/max_value]);

end

end 

