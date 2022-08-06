
%  EE 5003
%  Mark Musil
%  January 29
%
%  Estimate internal resistance

%Load in the battery data file
load battery_data.dat

% Define variables
voltage = 9;

load_resistance = battery_data(:,1);
load_voltage = battery_data(:, 2);

Rs_vec = zeros(1, length(load_voltage));

for i=1:length(load_resistance)
    Rs_vec(i) = load_resistance(i)*((voltage/load_voltage(i))-1);
end

Rs = mean(Rs_vec)
fprintf("Rs Estimate = %4.4f \n", Rs)
    