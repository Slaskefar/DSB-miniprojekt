function Hd = irr_bp1
%IRR_BP1 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.5 and the Signal Processing Toolbox 7.0.
% Generated on: 10-May-2016 12:49:33

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 48000;  % Sampling Frequency

N   = 50;    % Order
Fc1 = 4000;  % First Cutoff Frequency
Fc2 = 8000;  % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]
