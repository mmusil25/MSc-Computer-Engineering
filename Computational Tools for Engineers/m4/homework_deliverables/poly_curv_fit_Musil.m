%
%  poly_curv_fit.m
%
%  EE 5003
%  M. Braasch
%  05Jun2013

% start
clear all
close all

% load in the noisy data
load noisy_poly.mat


% convert x and y from row vectors to column vectors
x = x'
y = y'

% create the H matrix consisting of four columns of x;  column 1 is x
% raised to the zeroth power; col 2 is x raised to the first power and so
% on

H = [x.^0 x.^1 x.^2 x.^3]


% form the ordinary least squares solution

beta_ols = inv(H'*H)*H'*y

% create a fitted-curve given the estimated polynomial coefficients
y_fit = beta_ols(1)*x.^0 + beta_ols(2)*x.^1 + beta_ols(3)*x.^2 ...
    + beta_ols(4)*x.^3;
 


% plot the original noisy data (with the * symbol) along with the fitted
% curve (as a default connected line-curve)

plot(x, y, '*', x, y_fit)
title(' Noisy data (stars) and fitted curve (line)')