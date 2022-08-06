%
%  create_spectrum_est_data.m
%
clear all
close all

load mod11_spectral_analysis_data
Ts = 1/fs;
N = length(s);

figure
plot(t,s)
title('Module 11 Data')
ylabel('amplitude')
xlabel('time [s]')
%pause

s_fft = fft(s);
k = 0:(N-1);
k_shift = fftshift(k);
ind = find(k_shift>=N/2);
k_shift(ind) = k_shift(ind) - N;
f_shift = (fs/N)*k_shift;

figure
stem(f_shift,fftshift(abs(s_fft)))
title('Module 11 Data - Magnitude Spectrum')
ylabel('spectrum magnitude')
xlabel('frequency [Hz]')
%pause

mag = abs(s_fft);   maxmag = max(mag);
mag_spectrum_db = 20*log10(mag/maxmag);  % Normalizing with respect to the
%                                        % largest component

figure
plot(f_shift,fftshift(mag_spectrum_db))
grid
title('Magnitude Spectrum in Decibels')
ylabel('spectrum magnitude [dB]')
xlabel('frequency [Hz]')
text(10.5,-1.5,'Main Peak:  0dB')
text(10.5,-3.5,'10 Hz')
text(2,-1.9,'Secondary Peak:  -4dB')
text(2,-3.9,'5 Hz')
text(6.4,-13,'Third Peak: -15dB')
text(7.7,-14.3,'8 Hz')

