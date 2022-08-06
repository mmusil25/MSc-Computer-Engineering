
% Mark Musil
% Computational Tools for Engineers
% Feb 2022


x1 = -1:0.2:1;
x2 = -1:0.1:1;
x3 = -1:0.01:1;

f_of_x1 = x1.*sin( (pi.*(1 + 20.*x1))./2);
f_of_x2 = x2.*sin( (pi.*(1 + 20.*x2))./2);
f_of_x3 = x3.*sin( (pi.*(1 + 20.*x3))./2);

plot(x1, f_of_x1, "-", x2, f_of_x2, "-", x3, f_of_x3, "-")
legend("f(x1)", "f(x2)", "f(x3)")