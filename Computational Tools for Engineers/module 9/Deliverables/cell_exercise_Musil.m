%
%  cell_exercise.m
%

clear all
close all

% Call the m-file that creates the cell array
weather_data = create_cell_example();

accumulation_data = weather_data{4};
% assign the array of rain/snow values from City 2 to a 2x12 matrix

minneapolis_rain = accumulation_data(2,1,:);
minneapolis_snow = accumulation_data(2,2,:);

ap2 = zeros(2,12);


%ap2(1:2,:) = accumulation_data(2,:,:); % But where does ap2 come from


ap2(1:2,:) = [minneapolis_rain; minneapolis_snow];


% create a bar chart of both the rain and snow values for City 2
figure
subplot(2,1,1)
bar(1:12,ap2(1,:), 0.75, 'g')
set(gca, 'XTickLabel', weather_data{3})
ylabel('In. of precip.')
ylim([0, 5])
title(horzcat('Monthly Rainfall for', weather_data{1}(2)))
legend(weather_data{2}{1})


subplot(2,1,2)
bar(1:12,ap2(2,:), 0.75)
legend(weather_data{2}{2})
set(gca,'XTickLabel', weather_data{3})
ylabel('In. of precip')
ylim([0, 20])
title(horzcat('Monthly Snowfall for', weather_data{1}{2}))

%set(gca, 'XTickLabel', weather_data{3})
% specify the ylabel
%ylabel('In. of Precip.')
% Specify the title using the name string for City 2
%title(horzcat('Average Snowfall for',weather_data{1}(2)))
% Set the legend utilizing the precipitation name strings

