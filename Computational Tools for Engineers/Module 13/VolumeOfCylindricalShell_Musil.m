% Compute the volume of a cylindrical shell given the following info

inner_radius = 5;
outer_radius = 6;
length_ = 10;

Linear_Resolution = 0.1;
Angular_Resolution = 5;

Radius_array = (inner_radius:Linear_Resolution:outer_radius);
Phi = (0:Angular_Resolution:359)';
Z = (0:Linear_Resolution:length_)';

figure(1);
plot3(NaN, NaN, NaN, 'b.');
hold on

% Use loops to compute the volume
d2r = pi/180;
volume = 0;

for i = 1:length(Z)
    z = Z(i);
    for j = 1:length(Phi)
        phi = Phi(j);
        for k = 1:length(Radius_array)
            r = Radius_array(k);
            % Compute dv, x, y, and z for each pass through the inner loop
            x = r*cos(phi*d2r);
            y = r*sin(phi*d2r);
            % Save the values of x, y, z for each pass and plot as blue dots
            plot3(x, y, z, 'b.');
            
        end
    end
end
hold off

for k = 1:length(Radius_array)
    r = Radius_array(k);
    dv = r*Angular_Resolution*d2r*Linear_Resolution*Linear_Resolution;
    volume = volume + dv;
end

% Compute the volume of the cylindrical shell using algebra, and compare
% to the numerical value you computed

Inner_volume = pi*(inner_radius^2)*length_;
Outer_volume = pi*(outer_radius^2)*length_;
algebraic_volume = Outer_volume - Inner_volume;
fprintf("Integral Volume: %d, Algebraic Volume: %d", [volume, algebraic_volume]);

