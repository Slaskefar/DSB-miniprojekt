[x f_sample] = audioread('angerfist.wav');

output = equalizer(4,4,0.25,0.25,0.25);
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

h = (real(ifft(output_fft)));

figure(2); clf
plot(h)
axis([1 N+1 -inf inf])
hold on
pause

w_hanning = hanning(N+1)';
h_win = h.*w_hanning;
plot(w_hanning*max(abs(h)),'g','linewidth',2)
pause
plot(h_win,'r','linewidth',2)
pause

H_without_win = fft(h,f_sample);
H_with_win = fft(h_win,f_sample);

figure(3); clf
plot(abs(H_without_win(1:f_sample/2)))
hold on
plot(abs(H_with_win(1:f_sample/2)),'r','linewidth',2)