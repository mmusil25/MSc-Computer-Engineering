%
%  find_interval.m
%
%  EE 5003
%  Mark Musil
%  February 1 2022

% start
clear all
close all

% load in the set of 1000 Gaussian random numbers from a MAT file
load('interval_data.mat')
samples = (1:1000)';

% Plot the set of 1000 Gaussian random numbers
f1 = figure;
plot(samples, random_numbers)
title('1000 Gaussian Random Numbers - Mean of 0 - Std Dev of 1')

% Find the index and the value of the largest number in random_numbers
minSample = min(random_numbers);
maxSample = max(random_numbers);

maxValueOneHot = (random_numbers == maxSample) ;
maxValueIndex = find(maxValueOneHot);
fprintf(' The largest number is %4.2f and is located at position %d \n',...
    random_numbers(maxValueIndex) , maxValueIndex);

% First find the subset of the numbers that are less than +1

subset = random_numbers(random_numbers < 1 );

% Now find the subset of the subset that are greater than -1
subset = subset(subset > -1);


% Save the subset in a MAT-file named "subset_random"
save('subset_random.mat', 'subset')

% Create a new figure window
f2 = figure;

% Plot the subset
plot(1:length(subset), subset)
title('Subset of Gaussian Random Numbers on the Interval -1 to +1')

% Find the index and the value of the largest number in subset

maxSample = max(subset);
maxValueOneHot = (subset == maxSample) ;
maxValueIndex = find(maxValueOneHot);
fprintf(' The largest number on the subset (-1:1) is %4.2f and is located at position %d \n',...
    random_numbers(maxValueIndex) , maxValueIndex);
