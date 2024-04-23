function MVC = mvc(file)
    
    fileread = xlsread(file);
    c1 = (13700:15500);
    c2 = (42300:44700);
    c3 = (69900:72400);
    b = 2;
    r1 = mean(fileread(c1,b)); 
    r2 = mean(fileread(c2,b));
    r3 = mean(fileread(c3,b));

     MVC = sqrt(mean([r1 r2 r3])^2);
end
