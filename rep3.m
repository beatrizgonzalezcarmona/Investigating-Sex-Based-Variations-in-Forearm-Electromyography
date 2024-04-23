function Repetitions = rep3(mvcfile, file1, a)
clear Repetitions

% only done for one repetition 

mvcvalue = mvc(mvcfile);
data1 = xlsread(file1);

range = 4256:(11814-4256);

data4 = data1(range,a);


mean1 = sqrt(mean(data4).^2);


max_value = mvcvalue;


Repetitions = mean(mean1/max_value);


 
end 