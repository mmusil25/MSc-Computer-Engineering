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
ap2(1:2,:) = avg_precip{4}(2,:,:);

% create a bar chart of both the rain and snow values for City 2
bar(1:12,ap2')
% set the XTickLabel for gca to use the month abbreviations
set(gca,'XTickLabel',avg_precip{3})
% specify the ylabel
ylabel('precipitation [inches]')
% Specify the title using the name string for City 2
title(horzcat('Average Monthly Precipitation for ',avg_precip{1}{2}))
% Set the legend utilizing the precipitation name strings
legend(avg_precip{2})
