
[x f_sample] = audioread('metallica.wav');


N = length(x);
t = N/f_sample;

X = fft(x(:,1),N);
% Steps til frekvensaksen
delta_f = f_sample/N;
f_axis = [0:delta_f:f_sample - delta_f];

% Plot af x alene. Her kan man se frekvensspektraet for hver sample;
figure(1);
plot(x)
xlabel('Samples')
ylabel('Amplitude i volt')
title('Sample-plot af signalet')

% Plotter faserne op y-aksen
% Kommandobetegnelser:
% unwrap(): Correct phase angles to produce smoother phase plots
% angle(): tager vinklen af et komplekst datas�t, her DFT
% figure(2)
% plot(f_axis(1:0.5*end), unwrap(angle(X(1:0.5*end))))
% xlabel('Fase')
% ylabel('Frekvenser i Hertz')
% title('DFT Fase')
% grid on

% St�rrelsesplot, men nu logaritmisk
figure(3)
semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N)*X(1:0.5*end))))
xlabel('Frekvens i Herz')
ylabel('St�rrelse dB rel. 1 Volt')
title('DFT st�rrelse (magnitude)')
grid on
% x-aksen bliver begr�nset fra 10Hz til 1000Hz 
% y-aksen bliver begr�nset fra -95 db til -25 db
%axis([10 1000 -95 -25])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = volume(x,0.5);
sound(y,f_sample)

N = length(y);
t = N/f_sample;

X = fft(y(:,1),N);
% Steps til frekvensaksen
delta_f = f_sample/N;
f_axis = [0:delta_f:f_sample - delta_f];

% Plot af x alene. Her kan man se frekvensspektraet for hver sample;
figure(4);
plot(y)
xlabel('Samples')
ylabel('Amplitude i volt')
title('Sample-plot af signalet')

% Plotter faserne op y-aksen
% Kommandobetegnelser:
% unwrap(): Correct phase angles to produce smoother phase plots
% angle(): tager vinklen af et komplekst datas�t, her DFT
% figure(5)
% plot(f_axis(1:0.5*end), unwrap(angle(X(1:0.5*end))))
% xlabel('Fase')
% ylabel('Frekvenser i Hertz')
% title('DFT Fase')
% grid on

% St�rrelsesplot, men nu logaritmisk
figure(6)
semilogx(f_axis(1:0.5*end), 20*log10(abs((2/N)*X(1:0.5*end))))
xlabel('Frekvens i Herz')
ylabel('St�rrelse dB rel. 1 Volt')
title('DFT st�rrelse (magnitude)')
grid on
% x-aksen bliver begr�nset fra 10Hz til 1000Hz 
% y-aksen bliver begr�nset fra -95 db til -25 db
%axis([10 1000 -95 -25])