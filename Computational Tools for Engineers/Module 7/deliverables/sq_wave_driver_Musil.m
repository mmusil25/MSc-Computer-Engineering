tstep = 0.001;

time = -2:tstep:2;
frequency_ = 1;
N = [2, 9, 29];

for n = 1:length(N)
    subplot(1,3,n)
    sq_wave_fourier_fn_Musil(frequency_, time, N(n))
end