%
% create_cell_example.m
%
%  EE 5003
%  M. Braasch
%
clear all
close all

cities = {'New Orleans','Minneapolis','San Diego'};
precip_type = {'rain','snow'};
months = {'Jan','Feb','Mar','Apr','May','Jun',...
    'Jul','Aug','Sep','Oct','Nov','Dec'};

% City 1: New Orleans
% average monthly rainfall (inches)
precip_amt(1,1,:) = [5.05 6.01 4.90 4.50 4.56 5.84 ...
                 6.12 6.17 5.51 3.05 4.42 5.75];
% average monthly snowfall (inches)
precip_amt(1,2,:) = zeros(1,12);


% City 2: Minneapolis
% average monthly rainfall (inches)
precip_amt(2,1,:) = [0.95 0.88 1.94 2.42 3.39 4.05 ...
                 3.53 3.62 2.72 2.19 1.55 1.08];
% average monthly snowfall (inches)
precip_amt(2,2,:) = [12.1 7.8 10.2 2.5 0.01 0 ...
                        0   0 0.01 0.6 9.3 11.5];


% City 3: San Diego
% average monthly rainfall (inches)
precip_amt(3,1,:) = [1.80 1.53 1.77 0.79 0.19 0.07 ...
                 0.02 0.10 0.24 0.37 1.45 1.57];
% average monthly snowfall (inches)
precip_amt(3,2,:) = zeros(1,12);

% Place city name strings in cell{1}
% Place precipitation type name strings in cell{2}
% Place month name strings in cell{3}
% Place precipitation amounts in cell{4}
avg_precip = {cities,precip_type,months,precip_amt};
clear cities precip_type months precip_amt
