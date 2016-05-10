function s_filtered_voice_ekko = ekko(s_voice ,amplitude, ekko)


fsample = 44100;

% ***** Ekko-filter ****************************************************
delay_samples = round(ekko*fsample);
 
 b = [amplitude zeros(1,delay_samples)];

  % ***** Frekvensanalyse ************************************************
H = fft(b,fsample);

% ***** Plots **********************************************************
%figure(2); clf
%semilogx(20*log10(abs(H(1:0.5*fsample))))
%figure(1);clf
%plot(b)

% ***** Filtrering på lyd **********************************************,

s_voice_left = s_voice(:,1)';  % venstre kanal i wave-filen udtages

s_filtered_voice = filter(b,1,s_voice_left);  % filtrering med b (FIR)


% ***** filtreret version ***************************
s_filtered_voice_ekko = s_filtered_voice/max(abs(s_filtered_voice));  % normalisering
%soundsc(s_filtered_voice_norm, fsample)
 
end