function [mean_ed,mean_ecu, mean_ecr, mean_fcr] = pwnorep(mvced, mvcecu, mvcecr, mvcfcr, r1, r2,m,n)
% This function gives the mean outputs of each muscle during certain
% position when performing the task of pouring water. It also presents a figure comparing how each muscle contributed to the task.  

% m refers to the position 
% n to the number of figure 

    windowlen = 250; % how many samples the movmean is using to calculate the moving mean. 
    
    % maximum contraction values 
    edmvc = mvc(mvced);
    ecumvc = mvc(mvcecu);
    ecrmvc = mvc(mvcecr);
    fcrmvc = mvc(mvcfcr);

    % read files 
    rep_1 = xlsread(r1);
    rep_2 = xlsread(r2);
    
    % ranges of positions and rescaling the vectors to fit the time
    if m == 1
        p = 3225:5376;
        t = rescale(p,1.5,2.5); 
        x = 'first';
    elseif m == 2
        p = 5376:9668;
        t = rescale(p,2.5,4.5);
        x = 'second';
    else m == 3
        p = 9668:12890;
        t = rescale(p,4.5,6);
        x = 'third';
    end 

    % position range and calculating the mean for that range

    ed_1 = rep_1(p,2); % reads file first repetition 
    ed_1_m = sqrt(mean(ed_1).^2); % calculates mean of first file 
    ecu_1 = rep_1(p,4);
    ecu_1_m = sqrt(mean(ecu_1).^2);
    ecr_1 = rep_1(p,6);
    ecr_1_m = sqrt(mean(ecr_1).^2);
    fcr_1 = rep_1(p,8);
    fcr_1_m = sqrt(mean(fcr_1).^2);

    ed_2 = rep_2(p,2); % reads file second repetition 
    ed_2_m = sqrt(mean(ed_2).^2); % calculates mean of such read file
    ecu_2 = rep_2(p,4);
    ecu_2_m = sqrt(mean(ecu_2).^2);
    ecr_2 = rep_2(p,6);
    ecr_2_m = sqrt(mean(ecr_2).^2);
    fcr_2 = rep_2(p,8);
    fcr_2_m = sqrt(mean(fcr_2).^2);


    % comparing maximum contraction for each position for all the muscles 

    % if the mean higher than the maximum voluntary contraction value, then
    % such mean is used as the normalised factor. 
   
    edmax = max([edmvc ed_1_m ed_2_m]);
    
    if edmvc == edmax
        mean_ed = sqrt(mean(1/edmax*[ed_1_m ed_2_m]).^2)
        signal_ed = (ed_1 + ed_2)/(2*edmax);
        ed_plot = sqrt(movmean(signal_ed.^2,windowlen));

    elseif ed_1_m == edmax
        mean_ed = sqrt(mean(1/edmax*[ed_2_m]).^2)
        signal_ed = (ed_2)/(1*edmax);
        ed_plot = sqrt(movmean(signal_ed.^2,windowlen));

    elseif ed_2_m == edmax
        mean_ed = sqrt(mean(1/edmax*[ed_1_m]).^2)
        signal_ed = (ed_1)/(1*edmax);
        ed_plot = sqrt(movmean(signal_ed.^2,windowlen));
    end 

    ecumax = max([ecumvc ecu_1_m ecu_2_m]);
    
    if ecumvc == ecumax
        mean_ecu = sqrt(mean(1/ecumax*[ecu_1_m ecu_2_m]).^2)
        signal_ecu = (ecu_1 + ecu_2)/(2*ecumax);
        ecu_plot = sqrt(movmean(signal_ecu.^2,windowlen));

    elseif ecu_1_m == ecumax
        mean_ecu = sqrt(mean(1/ecumax*[ecu_2_m]).^2)
        signal_ecu = (ecu_2)/(1*ecumax);
        ecu_plot = sqrt(movmean(signal_ecu.^2,windowlen));

    elseif ecu_2_m == ecumax
        mean_ecu = sqrt(mean(1/ecumax*[ecu_1_m]).^2)
        signal_ecu = (ecu_1)/(1*ecumax);
        ecu_plot = sqrt(movmean(signal_ecu.^2,windowlen));
    end

    ecrmax = max([ecrmvc ecr_1_m ecr_2_m]);
    
    if ecrmvc == ecrmax
        mean_ecr = sqrt(mean(1/ecrmax*[ecr_1_m ecr_2_m]).^2)
        signal_ecr = (ecr_1 + ecr_2)/(2*ecrmax);
        ecr_plot = sqrt(movmean(signal_ecr.^2,windowlen));

    elseif ecr_1_m == ecrmax
        mean_ecr = sqrt(mean(1/ecrmax*[ecr_2_m]).^2)
        signal_ecr = (ecr_2)/(1*ecrmax);
        ecr_plot = sqrt(movmean(signal_ecr.^2,windowlen));

    elseif ecr_2_m == ecrmax
        mean_ecr = sqrt(mean(1/ecrmax*[ecr_1_m]).^2)
        signal_ecr = (ecr_1)/(1*ecrmax);
        ecr_plot = sqrt(movmean(signal_ecr.^2,windowlen));
    end

    fcrmax = max([fcrmvc fcr_1_m fcr_2_m]);
    
    if fcrmvc == fcrmax
        mean_fcr = sqrt(mean(1/fcrmax*[fcr_1_m fcr_2_m]).^2)
        signal_fcr = (fcr_1 + fcr_2)/(2*fcrmax);
        fcr_plot = sqrt(movmean(signal_fcr.^2,windowlen));

    elseif fcr_1_m == fcrmax
        mean_fcr = sqrt(mean(1/fcrmax*[fcr_2_m]).^2)
        signal_fcr = (fcr_2)/(1*fcrmax);
        fcr_plot = sqrt(movmean(signal_fcr.^2,windowlen));

    elseif fcr_2_m == fcrmax
        mean_fcr = sqrt(mean(1/fcrmax*[fcr_1_m]).^2)
        signal_fcr = (fcr_1)/(1*fcrmax);
        fcr_plot = sqrt(movmean(signal_fcr.^2,windowlen));
    end

% graphical results figure 

figure(n)

subplot(4,1,1);
plot(t,ed_plot);
title('ED signal')
xlabel('time (s)')
ylabel('Amplitude (μV)')
subplot(4,1,2);
plot(t,ecu_plot);
title('ECU signal')
xlabel('time (s)')
ylabel('Amplitude (μV)')
subplot(4,1,3);
plot(t,ecr_plot);
title('ECR signal')
xlabel('time (s)')
ylabel('Amplitude (μV)')
subplot(4,1,4);
plot(t,fcr_plot)
title('FCR signal')
xlabel('time (s)')
ylabel('Amplitude (μV)')

sgtitle(sprintf('Normalized muscle activity signal of each muscle during the %s position - pouring water',x))
end 