function [f_of_x] = myexp_Musil(x)
%MY_EXP_MUSIL Summary of this function goes here
%   Detailed explanation goes here

e_to_the_x = 1 

for i = 1:7
    e_to_the_x = e_to_the_x + ((x^i)/factorial(i))
    
    
fprintf("The seventh power series of the exponential yields the following estimation %4.2f \n",...
    e_to_the_x)

fprintf("The estimate yielded by MATLAB's exponential is %4.2f", exp(x))

f_of_x = e_to_the_x

end

