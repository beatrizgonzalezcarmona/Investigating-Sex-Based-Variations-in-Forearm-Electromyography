
a07_mvc_ecu = ('a07_MVC_1_-_ED_-_bea_Rep_1.105.xlsx');
a07_ne_1 = ('a07_neutral_Rep_1.117.xlsx');
a07_ne_2 = ('a07_neutral_Rep_2.118.xlsx');
a07_ne_3 = ('a07_neutral_Rep_3.119.xlsx');  


b08_mvc_ecu = ('b08_MVC_-_ECU_-_bea_Rep_1.1.xlsx');
b08_ne_1 = ('b08_neutral_Rep_1.10.xlsx');
b08_ne_2 = ('b08_neutral_Rep_2.11.xlsx');
b08_ne_3 = ('b08_neutral_Rep_3.12.xlsx');
d =xlsread(b08_ne_1);

samples = d(4256:(11814-4256),1);
t = rescale(samples,4256*5/11814,7558*5/11814);

%%

a07_ne_ecu = rmsplots(a07_mvc_ecu,a07_ne_1,a07_ne_2,a07_ne_3,4);
b08_ne_ecu = rmsplots(b08_mvc_ecu,b08_ne_1,b08_ne_2,b08_ne_3,4);

  figure(4);
  plot(t,a07_ne_ecu)
  hold on
  plot(t,b08_ne_ecu)
  title("Comparison of Neutral Position RMS normalised EMG signal for female and male particpants for Extensor Digitorum muscle")
  xlabel("time (s)")
  ylabel("Amplitude (μV)")
  legend("female","male")



