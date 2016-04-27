[x f_sample] = audioread('angerfist.wav');

output = equalizer(0.25,1,1,4,4);

x_fft = fft(x,f_sample);
x_fft = x_fft(:,1);
output_fft = fft(output,f_sample);
output_fft = output_fft(:,1);
N = length(x_fft);
delta_f = f_sample/N;
f_axis = [0:delta_f:f_sample-delta_f];

figure(1); clf
semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N)*x_fft(1:0.5*end))),'b')
grid on
hold on
semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N)*output_fft(1:0.5*end))),'r')