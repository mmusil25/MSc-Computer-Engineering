%
% ex11p1.m
%
% EE 5003
% M. Braasch
%
clear all
close all

x = 2;
k = 0:-1:-16;
h = 10.^k;
Newton_quotient = (fx2(x+h) - fx2(x))./h;
round_err = Newton_quotient - 4;
semilogx(h,round_err,'-*')
title('Example of Newtons Quotient Error')
ylabel('error')
xlabel('size of the delta')
axis('tight')

