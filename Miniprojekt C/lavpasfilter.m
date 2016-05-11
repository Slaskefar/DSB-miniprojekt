clear; clc

[x,f_sample] = audioread('metallica.wav'); %load lyd

f_cutoff = 4000;
M = 3000;

freq_resolution = f_sample / M;

k_cutoff = f_cutoff / freq_resolution;

k_cutoff_int = round(k_cutoff);

k_cutoff_int = round(k_cutoff)
disp(['svarer til ' num2str(k_cutoff_int*freq_resolution) ' Hertz'])

H_left  = [1 ones(1,k_cutoff_int) zeros(1,(M/2)-k_cutoff_int) zeros(1,M/2)];
H_right = [0 zeros(1,M/2) zeros(1,(M/2)-k_cutoff_int) ones(1,k_cutoff_int)];

H = H_left + H_right;

h = fftshift(real(ifft(H))); %filter uden hanning
w_hanning = hanning(M+1)'; %definering af hanning vindue

h_win = h.*w_hanning; %filter med hanning
w_hanning = rot90(w_hanning);
H_with_win = fft(h_win,f_sample);

x_fft = fft(x,f_sample);

Y1 = filter(h,1,x_fft);

H_with_win = rot90(H_with_win);

Y2 = Y1.*H_with_win;

N = length(Y2);
delta_f = f_sample/N;
f_axis = [0:delta_f:f_sample-delta_f];

figure(1)
semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N)*Y2(1:0.5*end))));

figure(2)
plot(abs(H_with_win(1:f_sample/2)),'r','linewidth',2)

% figure(1); clf
% stem(H_left(1:M/2+1))
% axis([1 M+1 0 1.1])
% hold on
% pause
% stem(H_right)
% pause
% 
% figure(2); clf
% plot(h)
% axis([1 M+1 -inf inf])
% hold on
% pause
% 
% figure(3); clf
% plot(abs(H_with_win(1:f_sample/2)),'r','linewidth',2)


