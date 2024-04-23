function [hed,ped, hecu,pecu, hecr,pecr, hfcr,pfcr] = mannwhitney(a,b,m)

    % this function reads the data from the table and returns a hypothesis
    % after doing a two sample t-test without assuming equal variances between
    % the populations. 
    
    % m = 1 finger point 
    % m = 2 neutral
    % m = 3 pinch 
    % m = 4.1 pouring water position 1
    % m = 4.2 pouring water position 2
    % m = 4.3 pouring water position 3
    
    % a is female data and b male data

    % h is the null hypothesis. If 0, then the difference between the
    % groups was not bigger than 5%. 
    % p is the p-value 

    % ranges of data depending on the task 

    d = 1:10; % rows in which the data is
    e = 1:10;

    if m == 1 
        edrange = 1;
        ecurange = 2;
        ecrrange = 3;
        fcrrange = 4;

    elseif m == 2;
        edrange = 5;
        ecurange = 6;
        ecrrange = 7;
        fcrrange = 8;

    elseif m == 3;
        edrange = 9;
        ecurange = 10;
        ecrrange = 11;
        fcrrange = 12;
    
    elseif m == 4.1;
        edrange = 13;
        ecurange = 14;
        ecrrange = 15;
        fcrrange = 16;
    
    elseif m == 4.2;
        edrange = 17;
        ecurange = 18;
        ecrrange = 19;
        fcrrange = 20;
    
    elseif m == 4.3;
        edrange = 21;
        ecurange = 22;
        ecrrange = 23;
        fcrrange = 24;
    
    else 
        print("task not specified")
    
    end 

    x1 = a(d,edrange);
    x2 = a(d,ecurange);
    x3 = a(d,ecrrange);
    x4 = a(d,fcrrange);

    y1 =b(e,edrange);
    y2 =b(e,ecurange);
    y3 =b(e,ecrrange);
    y4 =b(e,fcrrange);

    [ped, hed] = ranksum(x1,y1);
    [pecu, hecu] = ranksum(x2,y2);
    [pecr, hecr] = ranksum(x3,y3);
    [pfcr, hfcr] = ranksum(x4,y4);
end


