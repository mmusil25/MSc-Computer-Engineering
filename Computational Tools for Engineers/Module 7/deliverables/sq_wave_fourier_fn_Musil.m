function [] = sq_wave_fourier_fn_Musil(frequency, Time, N)
%OPTIMAL Plot of fourier approximation of a square wave
%   Detailed explanation goes here

tic


% Specify frequency of the square wave in Hz and radians
freq = frequency;
omega = 2*pi*freq;

% Specify time vector for simulation
tstep = 0.001;
% time = -2:tstep:2; Omit as this is an argument
f = zeros(size(Time));

% Specify the total number of terms in the approximation
N = N;

% Define coefficient index vector
n = 1:N;

% Set all coefficients initially to zero
a = zeros(size(n));

% IF n is 1, 5, 9, ..., then coefficient is 4/(n*pi)
subindex = 1:4:N;
a(subindex) = 4./(subindex*pi);

% IF n is 3, 7, 11, ..., then coefficient is -4/(n*pi)
subindex = 3:4:N;
a(subindex) = -4./(subindex*pi);%%FILL IN VECTORIZED EXPRESSION HERE%%


% Loop over time to compute the square wave approximation at each time
% point
for k = 1:length(Time)
    f(k) = sum(a.*cos(k*tstep*n));
end
% End loop over time

toc

% Plot the results
plot(Time,f)
title(strcat('Fourier Series Approximation with N = ',num2str(N),' terms'))
ylabel('function value')
xlabel('time (seconds)')

end

