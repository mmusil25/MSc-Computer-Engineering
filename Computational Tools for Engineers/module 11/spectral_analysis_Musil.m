% Load the data
My_data = load('mod11_spectral_analysis_data.mat');
t = My_data.t;
s = My_data.s;
fs = My_data.fs;

% Use the FFT to compute the spectrum of the signal
T = 1/fs;
size_me_up = size(t);
L = size_me_up(2);
% Compute the transform of the signal
Y = fft(s);
% Compute the two-sided spectrum first
two_sided_sprectrum = abs(Y/L);

% Then compute the single-sided spectrum based on the dual-sided spectrum
% and the even-valued signal length L
single_sided_spectrum = two_sided_sprectrum(1:L/2+1);
single_sided_spectrum(2:end-1) = 2*single_sided_spectrum(2:end-1);
single_sided_spectrum(2:end-1) = 2*single_sided_spectrum(2:end-1);

% Define the frequency domain f
f = fs*(0:(L/2))/L;
subplot(2,1,1)
plot(f, single_sided_spectrum)
title('Raw magnitude')
xlabel('Frequency')
ylabel('Magnitude')
max_val = max(single_sided_spectrum);

% Plot out the spectrum both in terms of its raw magnitude
% and in dB relative  to the peak value
subplot(2,1,2)
PdB = 10.*log10(single_sided_spectrum./max_val);
plot(f, PdB)
title('Relative dB to the max peak')
xlabel('Frequency')
ylabel('Relative magnitude')

% Use the "text" command to annotate the dB plot 
% to indicate the main and secondary peaks.
text([9.89011, 4.94505], [0, -1.9315], {'Main peak', 'Secondary peak'})

% Also, indicate the level of the secondary peaks 
% (in dB) relative to the main peak.
text(0, -6, 'Relative diff P1-P2 = -1.9315');