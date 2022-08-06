function x = sq_wave_fourier_fn(freq,time,N)
%SQ_WAVE_FOURIER_FN     Generate a Fourier Series approx of a square wave
%
%         x = SQ_WAVE_FOURIER_FN(freq,time,N)
%
%         freq = frequency of the square wave in Hz
%         time = time vector
%         N = number of terms in the series approximation
%         x = approximation of the even square wave
%

if nargin<3, error('Must specify all three input arguments'), end
if freq < 0, error('Input frequency must be positive'), end
if length(time)<2, error('Time vector must contain at least 2 points'),end
if N < 1, error('Number of terms must be greater than or equal to 1'), end

% Specify frequency of the square wave in radians
omega = 2*pi*freq;

% Define coefficient index vector
n = 1:N;

% Set all coefficients initially to zero
a = zeros(size(n));

% IF n is 1, 5, 9, ..., then coefficient is 4/(n*pi)
subindex = 1:4:N;
a(subindex) = 4./(subindex.*pi);

% IF n is 3, 7, 11, ..., then coefficient is -4/(n*pi)
subindex = 3:4:N;
a(subindex) = -4./(subindex.*pi);


% Loop over time to compute the square wave approximation at each time
% point
for k = 1:length(time),
    x(k) = sum(a.*cos(n*omega*time(k)));
end
% End loop over time

