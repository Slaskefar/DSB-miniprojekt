function b = chorus(amplitude)


fsample = 44100;

ekko_sekunder = 0.1;
 ekko2 = 0.2;
 ekko3 = 0.3;
 ekko4 = 0.4;



% ***** Ekko-filter ****************************************************
delay_samples = round(ekko_sekunder*fsample);
 delay2 = round(ekko2*fsample);
 delay3 = round(ekko3*fsample);
 b = [1 zeros(1,delay_samples) amplitude zeros(1,delay2) amplitude zeros(1,delay3) amplitude];

end

