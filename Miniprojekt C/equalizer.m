function output = equalizer(x,lp,bp1,bp2,bp3,hp)
%[x f_sample] = audioread('angerfist.wav');

h = @BandPass12_16;
x1 = h();
Y = filter(x1,1,x);

h2 = @bandpass40008000;
x2 = h2();
Y2 = filter(x2,1,x);

h3 = @BP_8_12;
x3 = h3();
Y3 = filter(x3,1,x);

h4 = @hp_filter;
x4 = h4();
Y4 = filter(x4,1,x);

h5 = @lp_filter;
x5 = h5();
Y5 = filter(x5,1,x);

output = Y5*(lp) + Y4*(hp) + Y3*(bp2) + Y2*(bp1) + Y*(bp3);

end