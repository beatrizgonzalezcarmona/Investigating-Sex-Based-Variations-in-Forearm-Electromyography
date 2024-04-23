%% READ ME
% this code compares the results of each patient between sexes. 
% the data comparison is shown first in a spider graph, and then in an excel sheet
%for the spider plot, an already defined function is used.


%% SPIDER PLOTS
close all
f = 'female.xlsx';
m = 'male.xlsx';
fp = spidergraph(f,m,1,1) % finger point 

ne = spidergraph(f,m,2,2) % neutral position 

pi = spidergraph(f,m,3,3) % pinch position 

pw1 = spidergraph(f,m,4.1,4) % pour water position 1
pw2 = spidergraph(f,m,4.2,5) % pour water position 2
pw3 = spidergraph(f,m,4.3,6) % pour water position 3

