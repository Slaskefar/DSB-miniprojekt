function s_filtered_voice_norm = chorus(s_voice, amplitude, kor1, kor2, kor3)


fsample = 44100;

% ***** Chorus-filter ****************************************************
delay_1 = round(kor1*fsample);
delay2 = round(kor2*fsample);
delay3 = round(kor3*fsample);
b = [1 zeros(1,delay_1) amplitude zeros(1,delay2) amplitude zeros(1,delay3) amplitude]; 
 
 % ***** Frekvensanalyse ************************************************
H = fft(b,fsample);

% ***** Plots **********************************************************
%figure(2); clf
%semilogx(20*log10(abs(H(1:0.5*fsample))))
%figure(1);clf
%plot(b)

% ***** Filtrering p� lyd **********************************************,

s_voice_left = s_voice(:,1)';  % venstre kanal i wave-filen udtages

s_filtered_voice = filter(b,1,s_voice_left);  % filtrering med b (FIR)


% ***** filtreret version ***************************
s_filtered_voice_norm = s_filtered_voice/max(abs(s_filtered_voice));  % normalisering
%soundsc(s_filtered_voice_norm, fsample)

 
end

