function Repetitions = rep2(mvcfile, file1, file2, a)
clear Repetitions

% only done for two repetitions 

mvcvalue = mvc(mvcfile);
data1 = xlsread(file1);
data2 = xlsread(file2);
range = 4256:(11814-4256);

data4 = data1(range,a);
data5 = data2(range,a);

mean1 = sqrt(mean(data4).^2);
mean2 = sqrt(mean(data5).^2);

mean_position_muscle = [mean1 mean2];
max_value = max([mean_position_muscle mvcvalue]);

if mean1 == max_value
    Repetitions = mean([mean2/max_value]);

elseif mean2 == max_value
   Repetitions = mean([mean1/max_value]);

else Repetitions = mean([mean1/max_value mean2/max_value]);

end

 
end 