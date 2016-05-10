function outputSignal = QuantizeLyd(bit, x, fsample)

%filename = file;


N=bit;

signal_q = quantizeN(x,N);

signal_err = x-signal_q;

audiowrite('newlyd.wav', signal_q, fsample);

sound(signal_q,fsample);

outputSignal = signal_q;
%quantizeN2(





% Nsamples = length(signal_q);
% Tlength = Nsamples/y;
% 
% hej1 = fft(signal_q(:,1),Nsamples);
% 
% hej2 = fft(signal_err(:,1),Nsamples);
% 
% delta_f = y/Nsamples;
% f_axis = [0:delta_f:y-delta_f];
% 
% 
% 
% 
% % ***** Plots ***************************************************
% 
% 
% figure(4)
% semilogx(f_axis(1:0.5*end), 20*log10(abs((2/Nsamples)*hej1(1:0.5*end))));
% xlabel('Frekvens i Herz')
% ylabel('Størrelse dB rel. 1 Volt')
% title('DFT størrelse (magnitude)')
% grid on
% 
% figure(5)
% semilogx(f_axis(1:0.5*end), 20*log10(abs((2/Nsamples)*hej2(1:0.5*end))));
% xlabel('Frekvens i Herz')
% ylabel('Størrelse dB rel. 1 Volt')
% title('DFT størrelse (magnitude)')
% grid on


