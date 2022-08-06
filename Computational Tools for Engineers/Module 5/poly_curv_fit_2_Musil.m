%
%  poly_curv_fit.m
%
%  EE 5003
%  Mark Musil
%  Feb2022

% start
clear all
close all

% load in the noisy data
load noisy_poly.mat


x = x';
y = y'; 

H = [ x.^3 x.^2 x.^1 x.^0 ]; 
beta_ols = H\y;
y_fit = polyval(beta_ols,x);


plot(x, y, '*', x, y_fit)
title(' Noisy data (stars) and fitted curve (line)')