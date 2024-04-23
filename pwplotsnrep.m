function Checksnorep = Checks_functionnrep(mvced, mvcecu, mvcecr, mvcfcr, r1, r2,n)

% This function is just to check if all the muscles were recorded during the acquisition.

    windowlen = 250;
    ed = mvc(mvced);
    ecu = mvc(mvcecu);
    ecr = mvc(mvcecr);
    fcr = mvc(mvcfcr);

    rep_1 = xlsread(r1);
    rep_2 = xlsread(r2);

    ch_ed_1 = rep_1(:,2)/ed;
    ch_ecu_1 = rep_1(:,4)/ecu;
    ch_ecr_1 = rep_1(:,6)/ecr;
    ch_fcr_1 = rep_1(:,8)/fcr;

    ch_ed_2 = rep_2(:,2)/ed;
    ch_ecu_2 = rep_2(:,4)/ecu;
    ch_ecr_2 = rep_2(:,6)/ecr;
    ch_fcr_2 = rep_2(:,8)/fcr;


    ed1 = sqrt(movmean(ch_ed_1.^2,windowlen));
    ed2 = sqrt(movmean(ch_ed_2.^2,windowlen));
   
    ecu1 = sqrt(movmean(ch_ecu_1.^2,windowlen));
    ecu2 = sqrt(movmean(ch_ecu_2.^2,windowlen));
   

    ecr1 = sqrt(movmean(ch_ecr_1.^2,windowlen));
    ecr2 = sqrt(movmean(ch_ecr_2.^2,windowlen));
   

    fcr1 = sqrt(movmean(ch_fcr_1.^2,windowlen));
    fcr2 = sqrt(movmean(ch_fcr_2.^2,windowlen));
   
    figure(n);
    subplot(4,3,1);
    plot(ed1);
    title("rep1 ed");
    subplot(4,3,2);
    plot(ed2);
    title("rep2 ed");
    
    subplot(4,3,4);
    plot(ecu1);
    title("rep1 ecu");
    subplot(4,3,5);
    plot(ecu2);
    title("rep2 ecu");
    
   
    subplot(4,3,6);
    plot(ecr1);
    title("rep1 ecr");
    subplot(4,3,7);
    plot(ecr2);
    title("rep2 ecr");
   

    subplot(4,3,9);
    plot(fcr1);
    title("rep1 fcr");
    subplot(4,3,10);
    plot(fcr2);
    title("rep2 fcr");
   

end