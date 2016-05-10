[x, f_sample] = audioread('metallica.wav');

y = volume(x,10);

sound(y,f_sample);

