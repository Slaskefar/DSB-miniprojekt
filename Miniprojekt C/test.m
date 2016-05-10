function output = test(hp)
[x f_sample] = audioread('../angerfist.wav');

h = @irr_hp;
x1 = h();
Y = filter(x1,0,x);

output = Y;

