d2r = pi/180;

R = 10;
figure(2);
plot3(NaN, NaN, NaN, '.');
hold on


for theta = 0:1:180
    for phi = 0:1:360
        x = R*sin(theta*d2r)*cos(phi*d2r);
        y = R*sin(theta*d2r)*sin(phi*d2r);
        z = R*cos(theta*d2r);
        plot3(x, y, z, 'b.');
    end
end

hold off

angular_resolution = 1;
phi_array = (0:angular_resolution:359)';
theta_array = (0:angular_resolution:179)';

linear_resolution = 0.01;
volume = 0;
area = 0;

algebraic_area = 4*pi*(R^2);


% Area

for k = 1:length(phi_array)
    for j = 1:length(theta_array)
        phi = phi_array(k);
        theta = theta_array(j);
        da = (R^2)*sin(theta*d2r)*(angular_resolution^2)*(d2r^2);
        area = area + da;
    end
end


fprintf("Integral Area: %d, Algebraic Area: %d", [area, algebraic_area]);