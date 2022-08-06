

syms x h
f(x) = fx2(x);
g(x, h) = (f(x + h) - f(x))/h;
h_start = 1;
error_vector = [];
h_vector = [];


for i = 1:12
    
    loop_h = h_start/(10^(i-1));
    h_vector(i) = loop_h;
    
end



 estimate = g(2, h_vector);
 error_vector = abs(2 - estimate);
 semilogx(h_vector, error_vector)
 xlabel('h')
 ylabel('Error')
 title('Error as a function of step size')