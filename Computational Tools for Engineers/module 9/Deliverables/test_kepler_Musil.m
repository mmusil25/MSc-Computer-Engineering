
% Then create a simple driver program named “test_kepler_LastName.m” that 
% calls the function to load in the data file and also 

kepler_data = loadkepler('gps_kepler.dat');

%    creates a bar chart
%    of the ‘longitude of the ascending node’ parameter using satellite ID
%    number as the x-axis (the call to the ‘bar’ function must, of course, 
%    use the created structure in the input arguments.

figure 
bar(kepler_data.svid, kepler_data.omega)
xlabel('Satellite ID')
ylabel('Longitude of the ascending node')
title('A Satellite Bar Chart')


               
               