[x,fsample] = audioread('voice_sample_female.wav');

VolumeAmplifier = 1.25;
EqMatrix = [2 1.5 1 1 1];
Quantize_bit = 16;
Ekko_amplitude = 0.5;
Ekko_time = 0.1;
Chorus_amp = 1;
Chorus_amount = [0.1 0.2 0.3];

%Y = equalizer(x,EqMatrix(1),EqMatrix(2),EqMatrix(3),EqMatrix(4),EqMatrix(5));
%QuantizeLyd(Quantize_bit,x,fsample);
Y1 = ekko(x,Ekko_amplitude,Ekko_time);
%chorus(x,Chorus_amp,Chorus_amount(1),Chorus_amount(2),Chorus_amount(3));
Y2 = volume(Y1,VolumeAmplifier);



plot(Y2,'r')
hold on
plot(x,'b')
