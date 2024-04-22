function Checks = checks(mvced, mvcecu, mvcecr, mvcfcr, r1, r2, r3,a,n)

% This function is just to check if all the muscles were recorded during the acquisition.
% a refers to 1 = static task, 2 = pouring water task
% n to the number of figure that will come up

    if a == 1
        p = 2:11814; % range of static tasks
        t = rescale(p,0,5); 
    elseif a == 2 
        p = 2:16110; % range of pouring water task
        t = rescale(p,0,7.125);

    end
    windowlen = 250;
    
    % Performs the MVC of each muscle
    ed = mvc(mvced);
    ecu = mvc(mvcecu);
    ecr = mvc(mvcecr);
    fcr = mvc(mvcfcr);

    rep_1 = xlsread(r1);
    rep_2 = xlsread(r2);
    rep_3 = xlsread(r3);

    ch_ed_1 = rep_1(:,2)/ed;
    ch_ecu_1 = rep_1(:,4)/ecu;
    ch_ecr_1 = rep_1(:,6)/ecr;
    ch_fcr_1 = rep_1(:,8)/fcr;

    ch_ed_2 = rep_2(:,2)/ed;
    ch_ecu_2 = rep_2(:,4)/ecu;
    ch_ecr_2 = rep_2(:,6)/ecr;
    ch_fcr_2 = rep_2(:,8)/fcr;

    ch_ed_3 = rep_3(:,2)/ed;
    ch_ecu_3 = rep_3(:,4)/ecu;
    ch_ecr_3 = rep_3(:,6)/ecr;
    ch_fcr_3 = rep_3(:,8)/fcr;

    ed1 = sqrt(movmean(ch_ed_1.^2,windowlen));
    ed2 = sqrt(movmean(ch_ed_2.^2,windowlen));
    ed3 = sqrt(movmean(ch_ed_3.^2,windowlen));

    ecu1 = sqrt(movmean(ch_ecu_1.^2,windowlen));
    ecu2 = sqrt(movmean(ch_ecu_2.^2,windowlen));
    ecu3 = sqrt(movmean(ch_ecu_3.^2,windowlen));

    ecr1 = sqrt(movmean(ch_ecr_1.^2,windowlen));
    ecr2 = sqrt(movmean(ch_ecr_2.^2,windowlen));
    ecr3 = sqrt(movmean(ch_ecr_3.^2,windowlen));

    fcr1 = sqrt(movmean(ch_fcr_1.^2,windowlen));
    fcr2 = sqrt(movmean(ch_fcr_2.^2,windowlen));
    fcr3 = sqrt(movmean(ch_fcr_3.^2,windowlen));
    
    figure(n);
    subplot(4,3,1);
    plot(t,ed1);    
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep1 ED");
    subplot(4,3,2);
    plot(t,ed2);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep2 ED");
    subplot(4,3,3);
    plot(t,ed3);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep3 ED");

    subplot(4,3,4);
    plot(t,ecu1);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep1 ECU");
    subplot(4,3,5);
    plot(t,ecu2);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep2 ECU");
    subplot(4,3,6);
    plot(t,ecu3);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep3 ECU");
   
    subplot(4,3,7);
    plot(t,ecr1);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep1 ECR");
    subplot(4,3,8);
    plot(t,ecr2);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep2 ECR");
    subplot(4,3,9);
    plot(t,ecr3);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep3 ECR");

    subplot(4,3,10);
    plot(t,fcr1);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep1 FCR");
    subplot(4,3,11);
    plot(t,fcr2);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep2 FCR");
    subplot(4,3,12);
    plot(t,fcr3);
    xlabel('time (s)')
    ylabel('Amplitude (μV)')
    title("rep3 FCR");

end