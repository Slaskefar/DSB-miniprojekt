clear 
clc

Fs = 44100;  % Sampling Frequency

N    = 1000;     % Order
Fc   = 4000;     % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hann(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);

h = fftshift(real(ifft(b)));

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

H_without_win = fft(h,Fs);
H_with_win = fft(h_win,Fs);

figure(3); clf
plot(abs(H_without_win(1:Fs/2)))
hold on
plot(abs(H_with_win(1:Fs/2)),'r','linewidth',2)
