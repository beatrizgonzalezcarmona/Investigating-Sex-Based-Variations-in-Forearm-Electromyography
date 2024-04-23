function Checks_noed = pwplotsnoed(mvcecu, mvcecr, mvcfcr, r1, r2, r3,n)

% This function is just to check if all the muscles were recorded during the acquisition.


    windowlen = 250;
   
    ecu = mvc(mvcecu);
    ecr = mvc(mvcecr);
    fcr = mvc(mvcfcr);

    rep_1 = xlsread(r1);
    rep_2 = xlsread(r2);
    rep_3 = xlsread(r3);

    
    pw_ecu_1 = rep_1(:,4)/ecu;
    pw_ecr_1 = rep_1(:,6)/ecr;
    pw_fcr_1 = rep_1(:,8)/fcr;

   
    pw_ecu_2 = rep_2(:,4)/ecu;
    pw_ecr_2 = rep_2(:,6)/ecr;
    pw_fcr_2 = rep_2(:,8)/fcr;

    
    pw_ecu_3 = rep_3(:,4)/ecu;
    pw_ecr_3 = rep_3(:,6)/ecr;
    pw_fcr_3 = rep_3(:,8)/fcr;

   
    ecu1 = sqrt(movmean(pw_ecu_1.^2,windowlen));
    ecu2 = sqrt(movmean(pw_ecu_2.^2,windowlen));
    ecu3 = sqrt(movmean(pw_ecu_3.^2,windowlen));

    ecr1 = sqrt(movmean(pw_ecr_1.^2,windowlen));
    ecr2 = sqrt(movmean(pw_ecr_2.^2,windowlen));
    ecr3 = sqrt(movmean(pw_ecr_3.^2,windowlen));

    fcr1 = sqrt(movmean(pw_fcr_1.^2,windowlen));
    fcr2 = sqrt(movmean(pw_fcr_2.^2,windowlen));
    fcr3 = sqrt(movmean(pw_fcr_3.^2,windowlen));
    
    figure(n);

    subplot(4,3,4);
    plot(ecu1);
    title("rep1 ecu");
    subplot(4,3,5);
    plot(ecu2);
    title("rep2 ecu");
    subplot(4,3,6);
    plot(ecu3);
    title("rep3 ecu");
   
    subplot(4,3,7);
    plot(ecr1);
    title("rep1 ecr");
    subplot(4,3,8);
    plot(ecr2);
    title("rep2 ecr");
    subplot(4,3,9);
    plot(ecr3);
    title("rep3 ecr");

    subplot(4,3,10);
    plot(fcr1);
    title("rep1 fcr");
    subplot(4,3,11);
    plot(fcr2);
    title("rep2 fcr");
    subplot(4,3,12);
    plot(fcr3);
    title("rep3 fcr");

end