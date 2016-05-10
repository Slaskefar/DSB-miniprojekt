[x,fsample] = audioread('metallica.wav');

VolumeAmplifier = 1;
EqMatrix = [1 1 1 1 1];
Quantize_bit = 16;
Ekko_amplitude = 1;
Ekko_time = 0.1;
Chorus_amp = 1;
Chorus_amount = [0.1 0.2 0.3];

volume(x,VolumeAmplifier);
equalizer(x,EqMatrix(1),EqMatrix(2),EqMatrix(3),EqMatrix(4),EqMatrix(5));
QuantizeLyd(Quantize_bit,x,fsample);
ekko(x,Ekko_amplitude,Ekko_time);
chorus(x,Chorus_amp,Chorus_amount(1),Chorus_amount(2),Chorus_amount(3));

