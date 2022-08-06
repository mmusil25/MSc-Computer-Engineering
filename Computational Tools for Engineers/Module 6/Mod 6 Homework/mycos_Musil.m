function [cosine_approximation, MATLAB_cosine, delta, convergence] = mycos_Musil(radians)
% MYCOS_MUSIL 
% Approximate cosine using a Taylor series and compare with MATLAB

n = 7; %Taylor series order over 2

cosine_approximation = 1;
for k = 1:n
    added_term = ((-1)^k)*(radians^(2*k))/factorial(2*k);
    cosine_approximation = cosine_approximation + added_term;
end

MATLAB_cosine = cos(radians);
delta = abs(cosine_approximation - MATLAB_cosine);

if delta < 1e-4
    convergence = 1;
else
    convergence = 0;
end

fprintf(" x = %4.5f, Approximation of cos(x) = %4.5f, MATLAB cos(x) = %4.5f, delta = %4.5f, convergence  %4.5f \n",...
            radians, cosine_approximation, MATLAB_cosine, delta, convergence);
end