function b = ekko


fsample = 44100;

amplitude
ekko_sekunder = 0.1;



% ***** Ekko-filter ****************************************************
delay_samples = round(ekko_sekunder*fsample);
 
 b = [amplitude zeros(1,delay_samples)];
 
end