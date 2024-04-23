function graph = spidergraph(f, m, a, n)
    
    f = xlsread(f); % female data
    m = xlsread(m); % male data 
    
    frange = 10:19; % columns female data
    mrange = 1:10; % columns male data 
    
    % a = 1 finger point 
    % a = 2 neutral
    % a = 3 pinch  
    % a = 4.1 pour water pos 1
    % a = 4.2 pour water pos 2
    % a = 4.3 pour water pos 3 
    % n = number of figure

    % situate the column in which the data we want to choose is

    if a == 1
        b = 1;
        c = "Finger Point Position";
    elseif a == 2
        b = 5;
        c = "Neutral Position";
    elseif a == 3
        b = 9;
        c = "Pinch Position";
    elseif a == 4.1
        b = 8;
        c = " Pouring Water During First Position";
    elseif a == 4.2
        b = 7;
        c = " Pouring Water During Second Position";
    elseif a == 4.3
        b = 6; 
        c = " Pouring Water During Third Position";
    else disp("choose a task");
    end 

    % calculate mean of those values chosen for both male and female

    fdata_ed = mean(f(frange,b));
    mdata_ed = mean(m(mrange,b));

    fdata_ecu = mean(f(frange,b+1));
    mdata_ecu = mean(m(mrange,b+1));

    fdata_ecr = mean(f(frange,b+2));
    mdata_ecr = mean(m(mrange,b+2));

    fdata_fcr = mean(f(frange,b+3));
    mdata_fcr = mean(m(mrange,b+3));

    % group the data 
    
    fdata = [fdata_ed; fdata_ecu; fdata_ecr; fdata_fcr];
    mdata = [mdata_ed; mdata_ecu; mdata_ecr; mdata_fcr];

    task = [fdata mdata];
    range = [1;1;1;1]; % range of the data values

    figure(n)
    graph = spider(task, sprintf('%s Female vs Male Mean Muscle Activity (μV)',c),range,{'Extensor Digitorum'; 'Extensor Carpi Ulnaris'; 'Extensor Carpi Radialis'; 'Flexor Carpi Radialis'},{'female';'male'});

end