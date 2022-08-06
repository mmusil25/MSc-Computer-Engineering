%
%  sq_wave_driver.m
%
%  EE 5003
%  M. Braasch
%  10Jun2013
%
clear all
close all

% Specify even square wave frequency in Hz
freq = 1;

% Specify time vector in sec
time = -1:0.001:1;

% Specify vector of numbers of terms
N_vector = [3 9 29];

for k = 1:length(N_vector)
    sq_wv_approx(k,:) = sq_wave_fourier_fn(freq,time,N_vector(k));
end

subplot(311)
plot(time,sq_wv_approx(1,:))
text(0.3,1,strcat('N = ',num2str(N_vector(1))))
title('Fourier Approximations of an Even Square Wave')

subplot(312)
plot(time,sq_wv_approx(2,:))
text(0.3,1,strcat('N = ',num2str(N_vector(2))))

subplot(313)
plot(time,sq_wv_approx(3,:))
text(0.3,1,strcat('N = ',num2str(N_vector(3))))
xlabel('time in seconds')
