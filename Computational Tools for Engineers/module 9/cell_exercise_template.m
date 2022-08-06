%
%  cell_exercise.m
%
%  EE 5003
%  M. Braasch
%
clear all
close all

% Call the m-file that creates the cell array
create_cell_example

% assign the array of rain/snow values from City 2 to a 2x12 matrix
ap2(1:2,:) = ????????

% create a bar chart of both the rain and snow values for City 2
bar(1:12,????)
% set the XTickLabel for gca to use the month abbreviations
set(gca,'XTickLabel',??????)
% specify the ylabel
?????
% Specify the title using the name string for City 2
title(horzcat('Average Monthly Precipitation for ',????????))
% Set the legend utilizing the precipitation name strings
?????
